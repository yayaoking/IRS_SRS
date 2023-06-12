v=100
v1=1*v
v2=2*v
v3=3*v
v4=4*v
v5=5*v
s=50
monte_carlo=5000
for i=1:monte_carlo
    x=round(rand(1,1)*s);
    y=round(rand(1,1)*s);
    z=round(rand(1,1)*s);
    xx=round(rand(1,1)*s);
    m=round(rand(1,1)*(s-y));
    n=round(rand(1,1)*(s-z));
    yy=round(rand(1,1)*(s-xx));
    u=round(rand(1,1)*(s-z-n));
    zz=round(rand(1,1)*(s-xx-yy));
    xyz=round(rand(1,1)*(s-xx-yy-zz));
    z1 = v2*(x)+v1*(s-x)
    z2 = v3*(y)+v2*(m)+v1*(s-m-y)
    z3 = v4*(z)+v3*(n)+v2*(u)+v1*(s-z-n-u)
    z4 = v5*(xx)+v4*(yy)+v3*(zz)+v2*(xyz)+v1*(s-xx-yy-zz-xyz)
    if i==1
            
            sum_R11=z1 ;
            sum_R12=z2 ;
            sum_R13=z3 ;
            sum_R14=z4 ;

        else
            %             sum_gamma(j)=sum_gamma(j)+gamma_x0;
            sum_R11=sum_R11+z1;
            sum_R12=sum_R12+z2 ;
            sum_R13=sum_R13+z3 ;
            sum_R14=sum_R14+z4 ;
           
        end
        
        ave_R11=abs(sum_R11)/(monte_carlo*s*v);
        ave_R12=abs(sum_R12)/(monte_carlo*s*v);
        ave_R13=abs(sum_R13)/(monte_carlo*s*v);    
        ave_R14=abs(sum_R14)/(monte_carlo*s*v);  

    end

figure(13); 
X = [ave_R11,ave_R12,ave_R13,ave_R14]; 
hold on
color_matrix = [1,0.38,0.27;0,0.75,1;0,0.25,1;1,0.75,1];  %每个柱子的颜色设置
%一个个添加柱子，用b记录，此时调用b(i)的facecolor就可以用来修改颜色               
for i = 1:4
    b = bar(i,X(i),0.75,'stacked');  %0.75是柱形图的宽，可以更改
    set(b(1),'facecolor',color_matrix(i,:))
end
box on
Xlabel = {'4', '8', '16', '32'};
set(gca,'XTick',[1 2 3 4]);
set(gca,'XTickLabel',Xlabel);%设置柱状图每个柱子的横坐标
ylabel('平均数据传输效率') 
%xlabel(str) %设置横坐标的名字 
