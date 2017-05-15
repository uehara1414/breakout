int ball_top;
int block_top;
int effect_top;

int en;

int break_count;

int phase;

color background;

int color_flag;
int color_count;

final int COLOR_WHITE=1;
final int COLOR_GRAY=2;
final int COLOR_RAINBOW=3;

final int COLOR_FLAG_WHITE=0;
final int COLOR_FLAG_RAINBOW=1;
final int COLOR_FLAG_GRAY=2;


final int PHASE_START_INITIALIZE=0;
final int PHASE_START=1;
final int PHASE_TUTORIAL=2;
final int PHASE_GAME_INITIALIZE=3;
final int PHASE_GAME=4;
final int PHASE_RESTART=5;
final int PHASE_GAMEOVER=6;

final int EFFECT_TYPE_FIREWORKS=0;
final int EFFECT_TYPE_BROKENBLOCK=1;
final int EFFECT_TYPE_BROKENBLOCK_CURTAIN=2;
final int EFFECT_TYPE_WORDEDSHAPEBLOCKS=3;

final int BALL_TYPE_SLOWBALL=1;
final int BALL_TYPE_FASTBALL=2;
final int BALL_TYPE_EXPLOSIONBALL=4;

final int BLOCK_TYPE_NORMALBLOCK=1;
final int BLOCK_TYPE_EXPLOSIONBLOCK=2;
final int BLOCK_TYPE_FIXEDBLOCK=3;

final int FRAMERATE=60;

final int BALL_MAX=200;

final int BLOCK_MAX=2000;

final int EFFECT_MAX=1000000;

final int HIT_AT_NO_FRAME=0;
final int HIT_AT_LEFT_FRAME=1;
final int HIT_AT_RIGHT_FRAME=2;
final int HIT_AT_CEILING_FRAME=3;
final int HIT_AT_FLOOR_FRAME=4;

final int CAN_BE_HIT_AT_NO_SIDE=0;
final int CAN_BE_HIT_AT_LEFT_SIDE=2;
final int CAN_BE_HIT_AT_RIGHT_SIDE=3;
final int CAN_BE_HIT_AT_CEILING_SIDE=5;
final int CAN_BE_HIT_AT_FLOOR_SIDE=7;

final int WORD_GAMEOVER=1;
final int WORD_SCORE=2;
final int WORD_SCORE_NUMBER=3;
final int WORD_ClicktoStart=4;


Ball[] balls=new Ball[BALL_MAX];

Block[] blocks=new Block[BLOCK_MAX];

Effect[] effects=new Effect[1000];

Bar bar;

Frame frame;

ColorManager color_manager;

InputManager im;


class InputManager
{
    boolean flag_a;
  boolean flag_d;
  InputManager()
  {
    flag_a=false;
    flag_d=false;
  }
};

class ColorManager
{
    color[][] colors=new color[7][36];
  color[] ex_colors=new color[7];
  color[] e_colors=new color[3];
  
  int count;
  int effecting_color;
  int block_color;
  boolean flag_change_color;
  
  ColorManager() {
    count=0;
    effecting_color=0;
    block_color=2;
    flag_change_color=false;
    for (int i=0; i<colors[0].length; i++) {
            colors[0][i]=color(230);
      ex_colors[0]=color(0);
            colors[1][i]=color(0,255/colors[0].length*i);
      colors[1][0]=color(255);
      ex_colors[1]=color(255,0,0,150);
      colorMode(HSB, 36);
      colors[2][i]=color(i, 17, 36, 20);
      colorMode(RGB,256);
      ex_colors[2]=color(255,0,0,100);
      
      colors[3][i]=color(255/35*i,255/35*(35-i),0,100);
      ex_colors[3]=color(0,0,255,60);
      
      colors[4][i]=color(255/35*i,0,255/35*(35-i),100);
      ex_colors[4]=color(255,0,255,50);
      
      colors[5][i]=color((135-25)/35*i+25,i,i/2,200);
      ex_colors[5]=color(255,0,0,250);
      
      colors[6][i]=color(60/35*i,210-(210-120)/35*i,250-i,255);
      ex_colors[6]=color(255);
    }
    colorMode(RGB, 256);
  }
    color GetColorOfColumnBlock(int column)
  {
    return colors[block_color][column];
  }
  color GetColorOfColumnExplosionBlock(int column)
  {
    return ex_colors[block_color];
  }
    void ColorColumnBlock(int column)
  {
    for (int i=0; i<block_top; i++)
    {
                  if (abs(blocks[i].p.x-block_x[column])>=0.1) {
        continue;
      }
            else if (blocks[i].type==blocks[i].TYPE_EXPLOSIONBLOCK) {
        blocks[i].col=ex_colors[effecting_color];
      } else {
        blocks[i].col=colors[effecting_color][column];
      }
    }
  }
  
  void Coloring()
  {
        if (break_count%100==99 && !flag_change_color) {
      count=frameCount;
      effecting_color=(int)random(1000)%colors.length;
      flag_change_color=true;
    }
            if (flag_change_color) {
      switch(frameCount-count-1) {
      case 35: 
        ColorColumnBlock(35);
        block_color=effecting_color;
        flag_change_color=false;
      case 34: 
        ColorColumnBlock(34);
      case 33: 
        ColorColumnBlock(33);
      case 32: 
        ColorColumnBlock(32);
      case 31: 
        ColorColumnBlock(31);
      case 30: 
        ColorColumnBlock(30);
      case 29: 
        ColorColumnBlock(29);
      case 28: 
        ColorColumnBlock(28);
      case 27: 
        ColorColumnBlock(27);
      case 26: 
        ColorColumnBlock(26);
      case 25: 
        ColorColumnBlock(25);
      case 24: 
        ColorColumnBlock(24);
      case 23: 
        ColorColumnBlock(23);
      case 22: 
        ColorColumnBlock(22);
      case 21: 
        ColorColumnBlock(21);
      case 20: 
        ColorColumnBlock(20);
      case 19: 
        ColorColumnBlock(19);
      case 18: 
        ColorColumnBlock(18);
      case 17: 
        ColorColumnBlock(17);
      case 16: 
        ColorColumnBlock(16);
      case 15: 
        ColorColumnBlock(15);
      case 14: 
        ColorColumnBlock(14);
      case 13: 
        ColorColumnBlock(13);
      case 12: 
        ColorColumnBlock(12);
      case 11: 
        ColorColumnBlock(11);
      case 10: 
        ColorColumnBlock(10);
      case 9: 
        ColorColumnBlock(9);
      case 8: 
        ColorColumnBlock(8);
      case 7: 
        ColorColumnBlock(7);
      case 6: 
        ColorColumnBlock(6);
      case 5: 
        ColorColumnBlock(5);
      case 4: 
        ColorColumnBlock(4);
      case 3: 
        ColorColumnBlock(3);
      case 2: 
        ColorColumnBlock(2);
      case 1: 
        ColorColumnBlock(1);
      case 0: 
        ColorColumnBlock(0);
        break;
      }
    }
  }
};

class Ball
{
    PVector p, v, a;
    float r;
      int endurance;
    color col;
    int attack;
    int speed;

  Ball(float x,float y)
  {
        p=new PVector(bar.p.x+frame.left,frame.ceiling+bar.p.y-bar.h-r);
    v=new PVector(0, 0);
            a=new PVector(0, 0.015);

                r=5;
        endurance=1;
  }

    void Draw()
  {
    fill(col);
    noStroke();
    ellipse(p.x, p.y, r, r);
  }

    void Update()
  {
    v.add(a);
    p.add(v);
    if(p.x<0 || p.x>width || p.y<0  || p.y>height) endurance=0;
  }
  
    void ReactToHitAtLeftFrame(Frame f)
  {
    v.x=abs(v.x);
    p.x=f.left+r;
  }
  void ReactToHitAtRightFrame(Frame f)
  {
    v.x=-abs(v.x);
    p.x=f.right-r;
  }
  void ReactToHitAtCeilingFrame(Frame f)
  {
    v.y=abs(v.y);
    p.y=f.ceiling+r;
  }
  void ReactToHitAtFloorFrame(Frame f)
  {
    v.y=-abs(v.y);
    p.y=f.floor-r;
  }

    void ReactToHitAtLeftBlockSide(int n)
  {
    v.x=-abs(v.x);
  }
  void ReactToHitAtRightBlockSide(int n)
  {
    v.x=abs(v.x);
  }
  void ReactToHitAtCeilingBlockSide(int n)
  {
    v.y=-abs(v.y);
  }
  void ReactToHitAtFloorBlockSide(int n)
  {
    v.y=abs(v.y);
  }

    void ReactToHitAtBarLeftSide()
  {
    v=PVector.fromAngle(atan2(mouseY-p.y, mouseX-p.x));
    v.rotate(PI*random(-0.25, 0.25));
    v.setMag(speed);
  }
  void ReactToHitAtBarRightSide()
  {
    v=PVector.fromAngle(atan2(mouseY-p.y, mouseX-p.x));
    v.rotate(PI*random(-0.25, 0.25));
    v.setMag(speed);
  }
  void ReactToHitAtBarCeilingSide()
  {
    v=PVector.fromAngle(atan2(mouseY-p.y, mouseX-p.x));
    v.rotate(PI*random(-0.25, 0.25));
    v.setMag(speed);
  }
  void ReactToHitAtBarFloorSide()
  {
    v=PVector.fromAngle(atan2(mouseY-p.y, mouseX-p.x));
    v.rotate(PI*random(-0.25, 0.25));
    v.setMag(speed);
  }
};




class SlowBall extends Ball
{
  SlowBall(float x,float y) {
    super(x,y);
    speed=6;
    p.set(x,y);
    v=PVector.fromAngle(atan2(mouseY-p.y, mouseX-p.x));
        v.rotate(PI*random(-0.05, 0.05));
        v.setMag(speed);
        col=color(0, 0, 255, 200);
        attack=10;
  }
};

class ExplosionBall extends Ball
{
  ExplosionBall(float x, float y)
  {
    super(x,y);
    p.set(x, y);
    speed=8;
    v.setMag(speed);
    a.set(0,0);
        col=color(0, 255, 0, 200);
        attack=100000;
  }
  void ReactToHitAtLeftFrame(Frame f)
  {
    endurance=0;
  }
  void ReactToHitAtRightFrame(Frame f)
  {
    endurance=0;
  }
  void ReactToHitAtCeilingFrame(Frame f)
  {
    endurance=0;
  }
  void ReactToHitAtFloorFrame(Frame f)
  {
    endurance=0;
  }

    void ReactToHitAtLeftBlockSide(int n) {
  }
  void ReactToHitAtRightBlockSide(int n) {
  }
  void ReactToHitAtCeilingBlockSide(int n) {
  }
  void ReactToHitAtFloorBlockSide(int n) {
  }

        void ReactToHitAtBarLeftSide()
  {
    v=PVector.fromAngle(atan2(mouseY-p.y, mouseX-p.x));
    v.setMag(speed);
  }
  void ReactToHitAtBarRightSide()
  {
    v=PVector.fromAngle(atan2(mouseY-p.y, mouseX-p.x));
    v.setMag(speed);
  }
  void ReactToHitAtBarCeilingSide()
  {
    v=PVector.fromAngle(atan2(mouseY-p.y, mouseX-p.x));
    v.setMag(speed);
  }
  void ReactToHitAtBarFloorSide()
  {
    v=PVector.fromAngle(atan2(mouseY-p.y, mouseX-p.x));
    v.setMag(speed);
  }
};

class Bar
{
  PVector p;
  int speed;
  float w;
  float h;
  color col;
  Bar() {
    p=new PVector(0, 0);
    w=100;
    h=8;
    speed=5;
    col=color(0);
    p.x=frame.w*0.5;
    p.y=frame.h*0.9+frame.ceiling;
  }
  void Update()
  {
    if (im.flag_a && p.x>=frame.left) p.x-=speed;
    if (im.flag_d && p.x<=frame.right) p.x+=speed;
    p.y=frame.h*0.9+frame.ceiling;
  }
  void Draw()
  {
    fill(col);
    rect(p.x, p.y, w, h);
  }
};


class Block
{
  final int TYPE_BLOCK=1;
  final int TYPE_EXPLOSIONBLOCK=2;
    PVector p, v;
  float w, h;
  color col;
    int endurance;
  int type;
  Block(float x, float y) {
    p=new PVector(x, y);
    v=new PVector(0, 0.5);
    h=15;
    w=15;
    endurance=10;
    col=color(100, 100);
    type=TYPE_BLOCK;
  }
    void Draw()
  {
    fill(col);
    stroke(color(0, 0, 0, 50));
    rect(p.x, p.y, w, h);
  }
  void Update()
  {
    p.add(v);
  }
  void Delete() {
    break_count++;
  }
};

class ExplosionBlock extends Block
{
  ExplosionBlock(float x, float y) {
    super(x, y);
    colorMode(RGB, 256);
    col=color(255,0, 0, 150);
    type=TYPE_EXPLOSIONBLOCK;
  }
      void Delete()
  {
    break_count++;
    int ball_num=30;
        if (p.y-balls[0].speed*2<frame.ceiling) ball_num=15;
        for (int i=0; i<ball_num; i++) {
      CreateBall(p.x, p.y, BALL_TYPE_EXPLOSIONBALL);
      balls[ball_top-1].v=PVector.fromAngle(PI*2/30*i);
      balls[ball_top-1].v.setMag(balls[ball_top-1].speed);
    }
  }
};

class Frame
{
    float left;
  float right;
  float ceiling;
  float floor;
    float w;
  float h;
    int count;
  Frame(float _x1, float _y1, float _x2, float _y2) {
    left=_x1;
    right=_x2;
    ceiling=_y1;
    floor=_y2;
    w=_x2-_x1;
    h=_y2-_y1;
    count=0;
  }
  void Update()
  {
    count++;
  }
  void Draw()
  {
    stroke(0);
    line(left, ceiling, right, ceiling);
    line(right, ceiling, right, floor);
    line(right, floor, left, floor);
    line(left, floor, left, ceiling);
  }
};


class Effect
{
  PVector p;
  int count;
  int terminal_count;  
    boolean flag;
  Effect()
  {
        flag=false;
    p=new PVector(0, 0);
  }
  void Draw() {}
  void Update() {}
  void Delete() {}
};

class MiniBlock
{
  PVector p, v, a;
  float w, h;
  float rotate;
  color col;
  int count;
  MiniBlock(float x, float y, float _w, float _h, PVector _v, float rot, color _col)
  {
    p=new PVector(x, y);
    v=new PVector(_v.x, _v.y);
    a=new PVector(0, 0.2);
    w=_w;
    h=_h;
        rotate=rot;
    col=_col;
    count=0;
  }
  void Update()
  {
    v.add(a);
    p.add(v);
    count++;
  }
  void Draw()
  {
        pushMatrix();
        translate(p.x, p.y);
    fill(col);
    stroke(0, 0, 0, 100);
        rotate(frameCount*rotate);
    rect(0, 0, w, h);
    popMatrix();
  }
};

class BrokenBlock extends Effect
{
  PVector p;
  int count;
  MiniBlock[] mini=new MiniBlock[4];
  BrokenBlock(float x, float y, float _w, float _h, color _col)
  {
    super();
    flag=true;
    p=new PVector(0, 0);
    p.set(x, y);
    terminal_count=120;
    count=0;

        PVector v=new PVector(0, 0);
    v.set(random(-1, 1), random(-2, 0));
        mini[0]=new MiniBlock(x-_w/2, y-_h/2, _w/2, _h/2, v, random(-PI*0.04, PI*0.04), _col);
    v.set(random(-1, 1), random(-2, 0));
    mini[1]=new MiniBlock(x+_w/2, y-_h/2, _w/2, _h/2, v, random(-PI*0.04, PI*0.04), _col);
    v.set(random(-1, 1), random(-2, 0));
    mini[2]=new MiniBlock(x-_w/2, y+_h/2, _w/2, _h/2, v, random(-PI*0.04, PI*0.04), _col);
    v.set(random(-1, 1), random(-2, 0));
    mini[3]=new MiniBlock(x+_w/2, y+_h/2, _w/2, _h/2, v, random(-PI*0.04, PI*0.04), _col);
  }
  void Update()
  {
    for (int i=0; i<mini.length; i++) {
      mini[i].Update();
    }
    if(count==terminal_count) flag=false;
    count++;
  }
  void Draw()
  {
    for (int i=0; i<mini.length; i++) {
      stroke(0, 0, 0, 40);
      mini[i].Draw();
    }
  }
};

class BrokenEffectCurtain extends Effect
{
  BrokenEffectCurtain()
  {
    flag=true;
    terminal_count=18;
    count=0;
  }
  void Update()
  {
    DeleteColumnBlock(18-count);
    DeleteColumnBlock(17+count);
    if(count==terminal_count) flag=false;
    count++;
  }
  void DeleteColumnBlock(int column)
  {
    for (int i=0;i<block_top;i++)
    {
      if (abs(blocks[i].p.x-block_x[column])>=0.1) {
        continue;
      }
      if (blocks[i].type==blocks[i].TYPE_EXPLOSIONBLOCK) {
        DeleteBlockWithNoReaction(i);
        CreateEffect(blocks[i].p.x, blocks[i].p.y, EFFECT_TYPE_BROKENBLOCK, i);
        i--;
        continue;
      } else {
        DeleteBlockWithNoReaction(i);
        CreateEffect(blocks[i].p.x, blocks[i].p.y, EFFECT_TYPE_BROKENBLOCK, i);
        i--;
      }
    }
  }
  void Delete(){
  }
};


class WordedShapeBlocks extends Effect
{
    boolean[][] word=new boolean[19][36];
    boolean[/* number */][/* y */][/* x */] number=new boolean[10][7][5];
  
  int word_number;
  WordedShapeBlocks(int n)
  {
    flag=true;
    terminal_count=18;
    count=0;
    word_number=n;
        for(int i=0;i<word.length;i++){
      for(int j=0;j<word[0].length;j++){
        word[i][j]=false;
      }
    }
        SetWord();
  }
  
    void SetWord()
  {
    switch(word_number){
    case WORD_GAMEOVER:
      SetWordGAMEOVER();
      break;
    case WORD_SCORE:
      SetWordSCORE();
      break;
    case WORD_SCORE_NUMBER:
      SetNumber();
      SetWordScoreNumber();
      break;
    case WORD_ClicktoStart:
      SetWordClicktoStart();
      break;
    }
  }
    void SetWordClicktoStart()
  {
    SetTrueOfClicktoStart(3,3);
    SetTrueOfClicktoStart(4,3);
    SetTrueOfClicktoStart(5,3);    
    SetTrueOfClicktoStart(7,3);
    SetTrueOfClicktoStart(9,3);
    SetTrueOfClicktoStart(14,3);
    SetTrueOfClicktoStart(3,4);
    SetTrueOfClicktoStart(7,4);
    SetTrueOfClicktoStart(14,4);
    SetTrueOfClicktoStart(21,4);
    SetTrueOfClicktoStart(3,5);
    SetTrueOfClicktoStart(7,5);
    SetTrueOfClicktoStart(9,5);
    SetTrueOfClicktoStart(11,5);
    SetTrueOfClicktoStart(12,5);
    SetTrueOfClicktoStart(14,5);
    SetTrueOfClicktoStart(16,5);
    SetTrueOfClicktoStart(20,5);
    SetTrueOfClicktoStart(21,5);
    SetTrueOfClicktoStart(22,5);
    SetTrueOfClicktoStart(24,5);
    SetTrueOfClicktoStart(25,5);
    SetTrueOfClicktoStart(26,5);
    SetTrueOfClicktoStart(3,6);
    SetTrueOfClicktoStart(7,6);
    SetTrueOfClicktoStart(9,6);
    SetTrueOfClicktoStart(11,6);
    SetTrueOfClicktoStart(14,6);
    SetTrueOfClicktoStart(15,6);
    SetTrueOfClicktoStart(21,6);
    SetTrueOfClicktoStart(24,6);
    SetTrueOfClicktoStart(26,6);
    SetTrueOfClicktoStart(3,7);
    SetTrueOfClicktoStart(4,7);
    SetTrueOfClicktoStart(5,7);
    SetTrueOfClicktoStart(7,7);
    SetTrueOfClicktoStart(9,7);
    SetTrueOfClicktoStart(11,7);
    SetTrueOfClicktoStart(12,7);
    SetTrueOfClicktoStart(14,7);
    SetTrueOfClicktoStart(16,7);
    SetTrueOfClicktoStart(21,7);
    SetTrueOfClicktoStart(24,7);
    SetTrueOfClicktoStart(25,7);
    SetTrueOfClicktoStart(26,7);
    SetTrueOfClicktoStart(14,11);
    SetTrueOfClicktoStart(15,11);
    SetTrueOfClicktoStart(16,11);
    SetTrueOfClicktoStart(14,12);
    SetTrueOfClicktoStart(19,12);
    SetTrueOfClicktoStart(24,12);
    SetTrueOfClicktoStart(26,12);
    SetTrueOfClicktoStart(30,12);
    SetTrueOfClicktoStart(14,13);
    SetTrueOfClicktoStart(15,13);
    SetTrueOfClicktoStart(16,13);
    SetTrueOfClicktoStart(18,13);
    SetTrueOfClicktoStart(19,13);
    SetTrueOfClicktoStart(20,13);
    SetTrueOfClicktoStart(22,13);
    SetTrueOfClicktoStart(23,13);
    SetTrueOfClicktoStart(24,13);
    SetTrueOfClicktoStart(26,13);
    SetTrueOfClicktoStart(27,13);
    SetTrueOfClicktoStart(29,13);
    SetTrueOfClicktoStart(30,13);
    SetTrueOfClicktoStart(31,13);
    SetTrueOfClicktoStart(16,14);
    SetTrueOfClicktoStart(19,14);
    SetTrueOfClicktoStart(22,14);
    SetTrueOfClicktoStart(24,14);
    SetTrueOfClicktoStart(26,14);
    SetTrueOfClicktoStart(30,14);
    SetTrueOfClicktoStart(14,15);
    SetTrueOfClicktoStart(15,15);
    SetTrueOfClicktoStart(16,15);
    SetTrueOfClicktoStart(19,15);
    SetTrueOfClicktoStart(22,15);
    SetTrueOfClicktoStart(23,15);
    SetTrueOfClicktoStart(24,15);
    SetTrueOfClicktoStart(26,15);
    SetTrueOfClicktoStart(30,15);


  }
    void SetTrueOfClicktoStart(int x,int y)
  {
    word[y][x]=true;
  }
      void SetTrueOfValueOfDigits(int d,int x,int y)
  {
    number[d][y][x]=true;
  }

      void SetNumber()
  {
    for(int i=0;i<number.length;i++){
      for(int j=0;j<number[0].length;j++){
        for(int k=0;k<number[0][0].length;k++){
          number[i][j][k]=false;
        }
      }
    }
    SetTrueOfValueOfDigits(0,1,0);
    SetTrueOfValueOfDigits(0,2,0);
    SetTrueOfValueOfDigits(0,3,0);
    SetTrueOfValueOfDigits(0,4,0);
    SetTrueOfValueOfDigits(0,1,1);
    SetTrueOfValueOfDigits(0,4,1);
    SetTrueOfValueOfDigits(0,1,2);
    SetTrueOfValueOfDigits(0,4,2);
    SetTrueOfValueOfDigits(0,1,3);
    SetTrueOfValueOfDigits(0,4,3);
    SetTrueOfValueOfDigits(0,1,4);
    SetTrueOfValueOfDigits(0,4,4);
    SetTrueOfValueOfDigits(0,1,5);
    SetTrueOfValueOfDigits(0,4,5);
    SetTrueOfValueOfDigits(0,1,6);
    SetTrueOfValueOfDigits(0,2,6);
    SetTrueOfValueOfDigits(0,3,6);
    SetTrueOfValueOfDigits(0,4,6);

    SetTrueOfValueOfDigits(1,1,0);
    SetTrueOfValueOfDigits(1,1,1);
    SetTrueOfValueOfDigits(1,1,2);
    SetTrueOfValueOfDigits(1,1,3);
    SetTrueOfValueOfDigits(1,1,4);
    SetTrueOfValueOfDigits(1,1,5);
    SetTrueOfValueOfDigits(1,1,6);
    
    SetTrueOfValueOfDigits(2,1,0);
    SetTrueOfValueOfDigits(2,2,0);
    SetTrueOfValueOfDigits(2,3,0);
    SetTrueOfValueOfDigits(2,4,0);
    SetTrueOfValueOfDigits(2,4,1);
    SetTrueOfValueOfDigits(2,4,2);
    SetTrueOfValueOfDigits(2,1,3);
    SetTrueOfValueOfDigits(2,2,3);
    SetTrueOfValueOfDigits(2,3,3);
    SetTrueOfValueOfDigits(2,4,3);
    SetTrueOfValueOfDigits(2,1,4);
    SetTrueOfValueOfDigits(2,1,5);
    SetTrueOfValueOfDigits(2,1,6);
    SetTrueOfValueOfDigits(2,2,6);
    SetTrueOfValueOfDigits(2,3,6);
    SetTrueOfValueOfDigits(2,4,6); 

    SetTrueOfValueOfDigits(3,1,0); 
    SetTrueOfValueOfDigits(3,2,0); 
    SetTrueOfValueOfDigits(3,3,0); 
    SetTrueOfValueOfDigits(3,4,0); 
    SetTrueOfValueOfDigits(3,4,1);
    SetTrueOfValueOfDigits(3,4,2); 
    SetTrueOfValueOfDigits(3,1,3); 
    SetTrueOfValueOfDigits(3,2,3); 
    SetTrueOfValueOfDigits(3,3,3); 
    SetTrueOfValueOfDigits(3,4,3); 
    SetTrueOfValueOfDigits(3,4,4);
    SetTrueOfValueOfDigits(3,4,5);
    SetTrueOfValueOfDigits(3,1,6); 
    SetTrueOfValueOfDigits(3,2,6);
    SetTrueOfValueOfDigits(3,3,6); 
    SetTrueOfValueOfDigits(3,4,6);
    
    SetTrueOfValueOfDigits(4,1,0); 
    SetTrueOfValueOfDigits(4,4,0);
    SetTrueOfValueOfDigits(4,1,1); 
    SetTrueOfValueOfDigits(4,4,1); 
    SetTrueOfValueOfDigits(4,1,2); 
    SetTrueOfValueOfDigits(4,4,2); 
    SetTrueOfValueOfDigits(4,1,3);
    SetTrueOfValueOfDigits(4,2,3);
    SetTrueOfValueOfDigits(4,3,3);
    SetTrueOfValueOfDigits(4,4,3);
    SetTrueOfValueOfDigits(4,4,4);
    SetTrueOfValueOfDigits(4,4,5);
    SetTrueOfValueOfDigits(4,4,6);

    SetTrueOfValueOfDigits(5,1,0);
    SetTrueOfValueOfDigits(5,2,0);
    SetTrueOfValueOfDigits(5,3,0);
    SetTrueOfValueOfDigits(5,4,0);
    SetTrueOfValueOfDigits(5,1,1);
    SetTrueOfValueOfDigits(5,1,2);
    SetTrueOfValueOfDigits(5,1,3);
    SetTrueOfValueOfDigits(5,2,3);
    SetTrueOfValueOfDigits(5,3,3);
    SetTrueOfValueOfDigits(5,4,3);
    SetTrueOfValueOfDigits(5,4,4);
    SetTrueOfValueOfDigits(5,4,5);
    SetTrueOfValueOfDigits(5,1,6);
    SetTrueOfValueOfDigits(5,2,6);
    SetTrueOfValueOfDigits(5,3,6);
    SetTrueOfValueOfDigits(5,4,6);
    
    SetTrueOfValueOfDigits(6,1,0);
    SetTrueOfValueOfDigits(6,2,0);
    SetTrueOfValueOfDigits(6,3,0);
    SetTrueOfValueOfDigits(6,4,0);
    SetTrueOfValueOfDigits(6,1,1);
    SetTrueOfValueOfDigits(6,1,2);
    SetTrueOfValueOfDigits(6,1,3);
    SetTrueOfValueOfDigits(6,2,3);
    SetTrueOfValueOfDigits(6,3,3);
    SetTrueOfValueOfDigits(6,4,3);
    SetTrueOfValueOfDigits(6,1,4);
    SetTrueOfValueOfDigits(6,4,4);
    SetTrueOfValueOfDigits(6,1,5);
    SetTrueOfValueOfDigits(6,4,5);
    SetTrueOfValueOfDigits(6,1,6);
    SetTrueOfValueOfDigits(6,2,6);
    SetTrueOfValueOfDigits(6,3,6);
    SetTrueOfValueOfDigits(6,4,6);
    
    SetTrueOfValueOfDigits(7,1,0);
    SetTrueOfValueOfDigits(7,2,0);
    SetTrueOfValueOfDigits(7,3,0);
    SetTrueOfValueOfDigits(7,4,0);
    SetTrueOfValueOfDigits(7,4,1);
    SetTrueOfValueOfDigits(7,4,2);
    SetTrueOfValueOfDigits(7,4,3);
    SetTrueOfValueOfDigits(7,4,4);
    SetTrueOfValueOfDigits(7,4,5);
    SetTrueOfValueOfDigits(7,4,6);

    SetTrueOfValueOfDigits(8,1,0);
    SetTrueOfValueOfDigits(8,2,0);
    SetTrueOfValueOfDigits(8,3,0);
    SetTrueOfValueOfDigits(8,4,0);
    SetTrueOfValueOfDigits(8,1,1);
    SetTrueOfValueOfDigits(8,4,1);
    SetTrueOfValueOfDigits(8,1,2);
    SetTrueOfValueOfDigits(8,4,2);
    SetTrueOfValueOfDigits(8,1,3);
    SetTrueOfValueOfDigits(8,2,3);
    SetTrueOfValueOfDigits(8,3,3);
    SetTrueOfValueOfDigits(8,4,3);
    SetTrueOfValueOfDigits(8,1,4);
    SetTrueOfValueOfDigits(8,4,4);
    SetTrueOfValueOfDigits(8,1,5);
    SetTrueOfValueOfDigits(8,4,5);
    SetTrueOfValueOfDigits(8,1,6);
    SetTrueOfValueOfDigits(8,2,6);
    SetTrueOfValueOfDigits(8,3,6);
    SetTrueOfValueOfDigits(8,4,6);

    SetTrueOfValueOfDigits(9,1,0);
    SetTrueOfValueOfDigits(9,2,0);
    SetTrueOfValueOfDigits(9,3,0);
    SetTrueOfValueOfDigits(9,4,0);
    SetTrueOfValueOfDigits(9,1,1);
    SetTrueOfValueOfDigits(9,4,1);
    SetTrueOfValueOfDigits(9,1,2);
    SetTrueOfValueOfDigits(9,4,2);
    SetTrueOfValueOfDigits(9,1,3);
    SetTrueOfValueOfDigits(9,2,3);
    SetTrueOfValueOfDigits(9,3,3);
    SetTrueOfValueOfDigits(9,4,3);
    SetTrueOfValueOfDigits(9,4,4);
    SetTrueOfValueOfDigits(9,4,5);
    SetTrueOfValueOfDigits(9,1,6);
    SetTrueOfValueOfDigits(9,2,6);
    SetTrueOfValueOfDigits(9,3,6);
    SetTrueOfValueOfDigits(9,4,6);

  }
  
      void SetWordSCORE()
  {
    SetTrueOfWordSCORE(4,5);
    SetTrueOfWordSCORE(5,5);
    SetTrueOfWordSCORE(6,5);
    SetTrueOfWordSCORE(10,5);
    SetTrueOfWordSCORE(11,5);
    SetTrueOfWordSCORE(12,5);
    SetTrueOfWordSCORE(16,5);
    SetTrueOfWordSCORE(17,5);
    SetTrueOfWordSCORE(18,5);
    SetTrueOfWordSCORE(21,5);
    SetTrueOfWordSCORE(22,5);
    SetTrueOfWordSCORE(23,5);
    SetTrueOfWordSCORE(24,5);
    SetTrueOfWordSCORE(27,5);
    SetTrueOfWordSCORE(28,5);
    SetTrueOfWordSCORE(29,5);
    SetTrueOfWordSCORE(30,5);
    SetTrueOfWordSCORE(31,5);
    SetTrueOfWordSCORE(3,6);
    SetTrueOfWordSCORE(7,6);
    SetTrueOfWordSCORE(9,6);
    SetTrueOfWordSCORE(13,6);
    SetTrueOfWordSCORE(15,6);
    SetTrueOfWordSCORE(19,6);
    SetTrueOfWordSCORE(21,6);
    SetTrueOfWordSCORE(25,6);
    SetTrueOfWordSCORE(27,6);
    SetTrueOfWordSCORE(3,7);
    SetTrueOfWordSCORE(7,7);
    SetTrueOfWordSCORE(9,7);
    SetTrueOfWordSCORE(13,7);
    SetTrueOfWordSCORE(15,7);
    SetTrueOfWordSCORE(19,7);
    SetTrueOfWordSCORE(21,7);
    SetTrueOfWordSCORE(25,7);
    SetTrueOfWordSCORE(27,7);
    SetTrueOfWordSCORE(4,8);
    SetTrueOfWordSCORE(9,8);
    SetTrueOfWordSCORE(15,8);
    SetTrueOfWordSCORE(19,8);
    SetTrueOfWordSCORE(21,8);
    SetTrueOfWordSCORE(25,8);
    SetTrueOfWordSCORE(27,8);
    SetTrueOfWordSCORE(5,9);
    SetTrueOfWordSCORE(9,9);
    SetTrueOfWordSCORE(15,9);
    SetTrueOfWordSCORE(19,9);
    SetTrueOfWordSCORE(21,9);
    SetTrueOfWordSCORE(22,9);
    SetTrueOfWordSCORE(23,9);
    SetTrueOfWordSCORE(24,9);
    SetTrueOfWordSCORE(25,9);
    SetTrueOfWordSCORE(27,9);
    SetTrueOfWordSCORE(28,9);
    SetTrueOfWordSCORE(29,9);
    SetTrueOfWordSCORE(30,9);
    SetTrueOfWordSCORE(31,9);
    SetTrueOfWordSCORE(6,10);
    SetTrueOfWordSCORE(9,10);
    SetTrueOfWordSCORE(15,10);
    SetTrueOfWordSCORE(19,10);
    SetTrueOfWordSCORE(21,10);
    SetTrueOfWordSCORE(22,10);
    SetTrueOfWordSCORE(27,10);
    SetTrueOfWordSCORE(3,11);
    SetTrueOfWordSCORE(7,11);
    SetTrueOfWordSCORE(9,11);
    SetTrueOfWordSCORE(13,11);
    SetTrueOfWordSCORE(15,11);
    SetTrueOfWordSCORE(19,11);
    SetTrueOfWordSCORE(21,11);
    SetTrueOfWordSCORE(23,11);
    SetTrueOfWordSCORE(27,11);

    SetTrueOfWordSCORE(3,12);
    SetTrueOfWordSCORE(7,12);
    SetTrueOfWordSCORE(9,12);
    SetTrueOfWordSCORE(13,12);
    SetTrueOfWordSCORE(15,12);
    SetTrueOfWordSCORE(19,12);
    SetTrueOfWordSCORE(21,12);
    SetTrueOfWordSCORE(24,12);
    SetTrueOfWordSCORE(27,12);
    SetTrueOfWordSCORE(4,13);
    SetTrueOfWordSCORE(5,13);
    SetTrueOfWordSCORE(6,13);
    SetTrueOfWordSCORE(10,13);
    SetTrueOfWordSCORE(11,13);
    SetTrueOfWordSCORE(12,13);
    SetTrueOfWordSCORE(16,13);
    SetTrueOfWordSCORE(17,13);
    SetTrueOfWordSCORE(18,13);
    SetTrueOfWordSCORE(21,13);
    SetTrueOfWordSCORE(25,13);
    SetTrueOfWordSCORE(27,13);
    SetTrueOfWordSCORE(28,13);
    SetTrueOfWordSCORE(29,13);
    SetTrueOfWordSCORE(30,13);
    SetTrueOfWordSCORE(31,13);

  }
  
    void SetTrueOfWordSCORE(int x,int y)
  {
    word[y][x]=true;
  }
  
  void SetWordScoreNumber()
  {
    int digits=GetDigits(break_count);
    for(int i=0+1;i<digits+1;i++){
      int n=GetValueOfDigits(break_count,i);
      SetScoreToWord(i,n);
    }
  }

    void SetScoreToWord(int digit,int n)
  {
    for(int i=0;i<number[0].length;i++){
      for(int j=0;j<number[0][0].length;j++){
        if(number[n][i][j]) word[i+6][word[0].length-7-digit*number[0][0].length+j]=true;
      }
    }
  }

    void SetTrueOfWordGAMEOVER(int x,int y)
  {
    word[y][x]=true;
  }
  
    void SetWordGAMEOVER()
  {
        SetTrueOfWordGAMEOVER(3,1);
    SetTrueOfWordGAMEOVER(4,1);
    SetTrueOfWordGAMEOVER(5,1);
    SetTrueOfWordGAMEOVER(11,1);
    SetTrueOfWordGAMEOVER(16,1);
    SetTrueOfWordGAMEOVER(20,1);
    SetTrueOfWordGAMEOVER(23,1);
    SetTrueOfWordGAMEOVER(24,1);
    SetTrueOfWordGAMEOVER(25,1);
    SetTrueOfWordGAMEOVER(26,1);
    SetTrueOfWordGAMEOVER(2,2);
    SetTrueOfWordGAMEOVER(6,2);
    SetTrueOfWordGAMEOVER(10,2);
    SetTrueOfWordGAMEOVER(12,2);
    SetTrueOfWordGAMEOVER(16,2);
    SetTrueOfWordGAMEOVER(17,2);
    SetTrueOfWordGAMEOVER(19,2);
    SetTrueOfWordGAMEOVER(20,2);
    SetTrueOfWordGAMEOVER(23,2);
    SetTrueOfWordGAMEOVER(2,3);
    SetTrueOfWordGAMEOVER(10,3);
    SetTrueOfWordGAMEOVER(12,3);
    SetTrueOfWordGAMEOVER(16,3);
    SetTrueOfWordGAMEOVER(18,3);
    SetTrueOfWordGAMEOVER(20,3);
    SetTrueOfWordGAMEOVER(23,3);
    SetTrueOfWordGAMEOVER(2,4);
    SetTrueOfWordGAMEOVER(4,4);
    SetTrueOfWordGAMEOVER(5,4);
    SetTrueOfWordGAMEOVER(6,4);
    SetTrueOfWordGAMEOVER(9,4);
    SetTrueOfWordGAMEOVER(10,4);
    SetTrueOfWordGAMEOVER(11,4);
    SetTrueOfWordGAMEOVER(12,4);
    SetTrueOfWordGAMEOVER(13,4);
    SetTrueOfWordGAMEOVER(16,4);
    SetTrueOfWordGAMEOVER(18,4);
    SetTrueOfWordGAMEOVER(20,4);
    SetTrueOfWordGAMEOVER(23,4);
    SetTrueOfWordGAMEOVER(24,4);
    SetTrueOfWordGAMEOVER(25,4);
    SetTrueOfWordGAMEOVER(26,4);
    SetTrueOfWordGAMEOVER(2,5);
    SetTrueOfWordGAMEOVER(6,5);
    SetTrueOfWordGAMEOVER(9,5);
    SetTrueOfWordGAMEOVER(13,5);
    SetTrueOfWordGAMEOVER(16,5);
    SetTrueOfWordGAMEOVER(18,5);
    SetTrueOfWordGAMEOVER(20,5);
    SetTrueOfWordGAMEOVER(23,5);
    SetTrueOfWordGAMEOVER(2,6);
    SetTrueOfWordGAMEOVER(6,6);
    SetTrueOfWordGAMEOVER(9,6);
    SetTrueOfWordGAMEOVER(13,6);
    SetTrueOfWordGAMEOVER(16,6);
    SetTrueOfWordGAMEOVER(18,6);
    SetTrueOfWordGAMEOVER(20,6);
    SetTrueOfWordGAMEOVER(23,6);
    SetTrueOfWordGAMEOVER(3,7);
    SetTrueOfWordGAMEOVER(4,7);
    SetTrueOfWordGAMEOVER(5,7);
    SetTrueOfWordGAMEOVER(9,7);
    SetTrueOfWordGAMEOVER(13,7);
    SetTrueOfWordGAMEOVER(16,7);
    SetTrueOfWordGAMEOVER(18,7);
    SetTrueOfWordGAMEOVER(20,7);
    SetTrueOfWordGAMEOVER(23,7);
    SetTrueOfWordGAMEOVER(24,7);
    SetTrueOfWordGAMEOVER(25,7);
    SetTrueOfWordGAMEOVER(26,7);
    
    SetTrueOfWordGAMEOVER(10,10);
    SetTrueOfWordGAMEOVER(11,10);
    SetTrueOfWordGAMEOVER(12,10);
    SetTrueOfWordGAMEOVER(15,10);
    SetTrueOfWordGAMEOVER(16,10);
    SetTrueOfWordGAMEOVER(20,10);
    SetTrueOfWordGAMEOVER(21,10);
    SetTrueOfWordGAMEOVER(23,10);
    SetTrueOfWordGAMEOVER(24,10);
    SetTrueOfWordGAMEOVER(25,10);
    SetTrueOfWordGAMEOVER(26,10);
    SetTrueOfWordGAMEOVER(29,10);
    SetTrueOfWordGAMEOVER(30,10);
    SetTrueOfWordGAMEOVER(31,10);
    SetTrueOfWordGAMEOVER(32,10);
    SetTrueOfWordGAMEOVER(9,11);
    SetTrueOfWordGAMEOVER(13,11);
    SetTrueOfWordGAMEOVER(16,11);
    SetTrueOfWordGAMEOVER(20,11);
    SetTrueOfWordGAMEOVER(23,11);
    SetTrueOfWordGAMEOVER(29,11);
    SetTrueOfWordGAMEOVER(33,11);
    SetTrueOfWordGAMEOVER(9,12);
    SetTrueOfWordGAMEOVER(13,12);
    SetTrueOfWordGAMEOVER(16,12);
    SetTrueOfWordGAMEOVER(20,12);
    SetTrueOfWordGAMEOVER(23,12);
    SetTrueOfWordGAMEOVER(29,12);
    SetTrueOfWordGAMEOVER(33,12);
    SetTrueOfWordGAMEOVER(9,13);
    SetTrueOfWordGAMEOVER(13,13);
    SetTrueOfWordGAMEOVER(16,13);
    SetTrueOfWordGAMEOVER(20,13);
    SetTrueOfWordGAMEOVER(23,13);
    SetTrueOfWordGAMEOVER(24,13);
    SetTrueOfWordGAMEOVER(25,13);
    SetTrueOfWordGAMEOVER(26,13);
    SetTrueOfWordGAMEOVER(29,13);
    SetTrueOfWordGAMEOVER(30,13);
    SetTrueOfWordGAMEOVER(31,13);
    SetTrueOfWordGAMEOVER(32,13);
    SetTrueOfWordGAMEOVER(9,14);
    SetTrueOfWordGAMEOVER(13,14);
    SetTrueOfWordGAMEOVER(17,14);
    SetTrueOfWordGAMEOVER(19,14);
    SetTrueOfWordGAMEOVER(23,14);
    SetTrueOfWordGAMEOVER(29,14);
    SetTrueOfWordGAMEOVER(31,14);
    SetTrueOfWordGAMEOVER(9,15);
    SetTrueOfWordGAMEOVER(13,15);
    SetTrueOfWordGAMEOVER(17,15);
    SetTrueOfWordGAMEOVER(19,15);
    SetTrueOfWordGAMEOVER(23,15);
    SetTrueOfWordGAMEOVER(29,15);
    SetTrueOfWordGAMEOVER(32,15);
    SetTrueOfWordGAMEOVER(10,16);
    SetTrueOfWordGAMEOVER(11,16);
    SetTrueOfWordGAMEOVER(12,16);
    SetTrueOfWordGAMEOVER(18,16);
    SetTrueOfWordGAMEOVER(23,16);
    SetTrueOfWordGAMEOVER(24,16);
    SetTrueOfWordGAMEOVER(25,16);
    SetTrueOfWordGAMEOVER(26,16);
    SetTrueOfWordGAMEOVER(29,16);
    SetTrueOfWordGAMEOVER(33,16);
  }

    void SetBlocks(int column)
  {
    for(int y=0;y<frame.h/(blocks[0].h*2);y++){
      if(word[y][column]){
        CreateBlock(block_x[column],blocks[0].h+blocks[0].h*2*y,BLOCK_TYPE_NORMALBLOCK);
        Block b=GetLastBlock();
        b.col=color_manager.colors[2][column];
        if(word_number==WORD_ClicktoStart) b.v.set(0,0);
      }
    }
  }
  
  void Update()
  {
    SetBlocks(18-count);
    SetBlocks(17+count);
    count++;
    if(count==terminal_count) flag=false;
  }
}

int GetDigits(int n)
{
  int digit=1;
  while(true){
    n/=10;
    if(n==0)return digit;
    else digit++;
  }
}

int GetValueOfDigits(int n,int digits)
{
  for(int i=0;i<digits-1;i++) n/=10;
  return (n%10);
}

boolean CreateEffect(float x, float y, int type, int num)
{
  if (effect_top>=effects.length) {
    println("オーバーフローだよー！！");
    return false;
  }
  switch(type) {
  case EFFECT_TYPE_BROKENBLOCK:
    effects[effect_top]=new BrokenBlock(x, y, blocks[num].w, blocks[num].h, blocks[num].col);
    break;
  case EFFECT_TYPE_BROKENBLOCK_CURTAIN:
    effects[effect_top]=new BrokenEffectCurtain();
    break;
  case EFFECT_TYPE_WORDEDSHAPEBLOCKS:
    effects[effect_top]=new WordedShapeBlocks(num);
    break;
  }
  effect_top++;
  return true;
}

boolean DeleteEffect(int n)
{
  if (n>effect_top) {
    println("そんなエフェクトないよー！！");
    return false;
  } else if (effect_top==1) {
    effects[1].Delete();
    effect_top=0;
    return true;
  }
  effects[n].Delete();
  effects[n]=effects[effect_top-1];
  effect_top--;
  return true;
}

void UpdateEffect()
{
  for (int i=0; i<effect_top; i++) {
    effects[i].Update();
    if (!effects[i].flag) {
      DeleteEffect(i);
    }
  }
}
void DrawEffect()
{
  for (int i=0; i<effect_top; i++) {
    effects[i].Draw();
  }
}

boolean CreateBlock(float x, float y, int type)
{
  if (block_top>=blocks.length) {
    println("ブロックがオーバーフローだよ！！");
    return false;
  }
  switch(type) {
  case BLOCK_TYPE_NORMALBLOCK:
    blocks[block_top]=new Block(x, y);
    break;
  case BLOCK_TYPE_EXPLOSIONBLOCK:
    blocks[block_top]=new ExplosionBlock(x, y);
    break;
  default:
    println("unknown type of block");
  }
  block_top++;
  return true;
}

Block GetLastBlock()
{
  if (block_top<=0) {
    println("直前のブロックが取得できませんでしたー");
    return null;
  } else {
    return blocks[block_top-1];
  }
}


boolean CreateBall(float x, float y, int type)
{
  if (ball_top>=balls.length) {
        return false;
  }
  switch(type) {
  case BALL_TYPE_SLOWBALL:
    balls[ball_top]=new SlowBall(x,y);
    break;
  case BALL_TYPE_EXPLOSIONBALL:
    balls[ball_top]=new ExplosionBall(x, y);
    break;
  default:
    println("unknow code");
  }
  ball_top++;
  return true;
}

boolean DeleteBlock(int n)
{
  if (n>block_top) {
    println("そんなブロックないよー！！");
    return false;
  } else if (block_top==1) {
    block_top=0;
    blocks[1].Delete();
    return true;
  } else if (block_top==0) {
    return false;
  }
  blocks[n].Delete();
  blocks[n]=blocks[block_top-1];
  block_top--;
  return true;
}

boolean DeleteBlockWithNoReaction(int n)
{
  if (n>block_top) {
    println("そんなブロックないよー！！");
    return false;
  } else if (block_top==1) {
    block_top=0;
    return true;
  } else if (block_top==0) {
    return false;
  }
  blocks[n]=blocks[block_top-1];
  block_top--;
  return true;
}

boolean DeleteBall(int n)
{
  if (n>ball_top) {
    println("そんなボールないよー！！");
    return false;
  } else if (ball_top<=1) {
    ball_top=0;
    return true;
  }
  balls[n]=balls[ball_top-1];
  ball_top--;
  return true;
}

void DeleteBallAll()
{
  ball_top=0;
}

int JudgeObjectToFrame(Ball o, Frame f)
{
  PVector v1=new PVector(1.0, 0.0);
  PVector v2=new PVector(0.0, 1.0);
  int code=DecideHitSide(o);
      Segment s;
  if (code%CAN_BE_HIT_AT_RIGHT_SIDE==0) {
    s=new Segment(f.left, f.ceiling, f.left, f.floor);
    if (CheckHitSegmentToCircle(s, o.p, o.r)) {
      return HIT_AT_LEFT_FRAME;
    }
  }
  if (code%CAN_BE_HIT_AT_LEFT_SIDE==0) {
    s=new Segment(f.right, f.ceiling, f.right, f.floor);
    if (CheckHitSegmentToCircle(s, o.p, o.r)) {
      return HIT_AT_RIGHT_FRAME;
    }
  }
  if (code%CAN_BE_HIT_AT_FLOOR_SIDE==0) {
    s=new Segment(f.left, f.ceiling, f.right, f.ceiling);
    if (CheckHitSegmentToCircle(s, o.p, o.r)) {
      return HIT_AT_CEILING_FRAME;
    }
  }
  if (code%CAN_BE_HIT_AT_CEILING_SIDE==0) {
    s=new Segment(f.left, f.floor, f.right, f.floor);
    if (CheckHitSegmentToCircle(s, o.p, o.r)) {
      return HIT_AT_FLOOR_FRAME;
    }
  }
  return HIT_AT_NO_FRAME;
}


int DecideHitSide(Ball o)
{
  int code=1;
  if (o.v.mag()==0) {
    code*=CAN_BE_HIT_AT_NO_SIDE;    return code;
  }
  if (o.v.heading()<=0) {
    code*=CAN_BE_HIT_AT_FLOOR_SIDE;
  }
  if (o.v.heading()>=0) {
    code*=CAN_BE_HIT_AT_CEILING_SIDE;
  }
  if (o.v.heading()>=(-HALF_PI) && o.v.heading()<=HALF_PI) {
    code*=CAN_BE_HIT_AT_LEFT_SIDE;
  }
  if (o.v.heading()>=HALF_PI || o.v.heading() <=(-HALF_PI)) {
    code*=CAN_BE_HIT_AT_RIGHT_SIDE;
  }
  return code;
}

float Cross(PVector p1, PVector p2)
{
  return p1.x*p2.y-p1.y*p2.x;
}

class Segment
{
    PVector initial_point;
    PVector terminal_point;
    PVector vector;
  Segment(float x1, float y1, float x2, float y2)
  {
    initial_point=new PVector(x1, y1);
    terminal_point=new PVector(x2, y2);
    vector=new PVector(terminal_point.x, terminal_point.y);
    vector.sub(initial_point);
  }
}

boolean CheckHitSegmentToCircle(Segment s, PVector o, float r)
{
  PVector S=new PVector(s.vector.x, s.vector.y);
  PVector A=new PVector(o.x, o.y);
  A.sub(s.initial_point);
    float d=abs(Cross(A, S)/S.mag());
    if (d<=r) {
    PVector B=new PVector(o.x, o.y);
    B.sub(s.terminal_point);
        if (A.dot(S)*B.dot(S)<=0) {
      return true;
    }    else if (A.mag()<=r || B.mag() <=r) {
      return true;
    }
  }
  return false;
}

boolean CheckHitAtLeftSide(Ball o, Block b)
{
    if (o.p.x+o.r>b.p.x-b.w && o.p.x-o.r<b.p.x-b.w) {
        if (o.v.mag()+b.v.mag()<o.r*2) {
            float left=b.p.x-b.h;
      float ceiling=b.p.y-b.h;
      float floor=b.p.y+b.h;
      Segment s=new Segment(left, ceiling, left, floor);
            return CheckHitSegmentToCircle(s, o.p, o.r);
    }
  }
  return false;
}

boolean CheckHitAtRightSide(Ball o, Block b)
{
  if (o.p.x-o.r < b.p.x+b.w && o.p.x+o.r>b.p.x+b.w) {
    if (o.v.mag()+b.v.mag()<o.r*2) {
      float right=b.p.x+b.h;
      float ceiling=b.p.y-b.h;
      float floor=b.p.y+b.h;
      Segment s=new Segment(right, ceiling, right, floor);
      return CheckHitSegmentToCircle(s, o.p, o.r);
    }
  }
  return false;
}

boolean CheckHitAtCeilingSide(Ball o, Block b)
{
  if (o.p.y+o.r>b.p.y-b.h && o.p.y-o.r<b.p.y-b.h) {
    if (o.v.mag()+b.v.mag()<o.r*2) {
      float left=b.p.x-b.w;
      float right=b.p.x+b.h;
      float ceiling=b.p.y-b.h;
      Segment s=new Segment(left, ceiling, right, ceiling);
      return CheckHitSegmentToCircle(s, o.p, o.r);
    }
  }
  return false;
}

boolean CheckHitAtFloorSide(Ball o, Block b)
{
  if (o.p.y-o.r<b.p.y+b.h && o.p.y+o.r>b.p.y+b.h) {
    if (o.v.mag()+b.v.mag()<o.r*2) {
      float left=b.p.x-b.w;
      float right=b.p.x+b.w;
      float floor=b.p.y+b.h;
      Segment s=new Segment(left, floor, right, floor);
      return CheckHitSegmentToCircle(s, o.p, o.r);
    }
  }
  return false;
}

boolean CheckGameover()
{
  for (int i=0; i<block_top; i++) {
    if (blocks[i].p.y+blocks[i].h>frame.floor) {
      return true;
    }
  }
  return false;
}

void ReactToHitBlockByBall(int bl, int ba)
{
    blocks[bl].endurance-=balls[ba].attack;
    if (blocks[bl].endurance<=0) {
    CreateEffect(blocks[bl].p.x, blocks[bl].p.y, EFFECT_TYPE_BROKENBLOCK, bl);
    CreateBall(bar.p.x+frame.left,frame.ceiling+bar.p.y-bar.h-balls[0].r, BALL_TYPE_SLOWBALL);
    DeleteBlock(bl);
  }
}

void JudgeHitBallToBar()
{
  for (int i=0; i<ball_top; i++) {
    int code=DecideHitSide(balls[i]);
    float left=bar.p.x-bar.w;
    float right=bar.p.x+bar.w;
    float ceiling=bar.p.y-bar.h;
    float floor=bar.p.y+bar.h;
    Segment s=new Segment(left, ceiling, left, floor);
        if (code%CAN_BE_HIT_AT_LEFT_SIDE==0) {
      if (CheckHitSegmentToCircle(s, balls[i].p, balls[i].r)) {
        balls[i].ReactToHitAtBarLeftSide();
      }
    }
    s=new Segment(right, ceiling, right, floor);
    if (code%CAN_BE_HIT_AT_RIGHT_SIDE==0) {
      if (CheckHitSegmentToCircle(s, balls[i].p, balls[i].r)) {
        balls[i].ReactToHitAtBarRightSide();
      }
    }
    s=new Segment(left, ceiling, right, ceiling);
    if (code%CAN_BE_HIT_AT_CEILING_SIDE==0) {
      if (CheckHitSegmentToCircle(s, balls[i].p, balls[i].r)) {
        balls[i].ReactToHitAtBarCeilingSide();
      }
    }
    s=new Segment(left, floor, right, floor);
    if (code%CAN_BE_HIT_AT_FLOOR_SIDE==0) {
      if (CheckHitSegmentToCircle(s, balls[i].p, balls[i].r)) {
        balls[i].ReactToHitAtBarFloorSide();
      }
    }
  }
}


void ReactToHitBallToBlockAtFloorSide(int i, int j)
{
  balls[i].ReactToHitAtFloorBlockSide(j);
  ReactToHitBlockByBall(j, i);
}

void ReactToHitBallToBlockAtCeilingSide(int i, int j)
{
  balls[i].ReactToHitAtCeilingBlockSide(j);
  ReactToHitBlockByBall(j, i);
}

void ReactToHitBallToBlockAtLeftSide(int i, int j)
{
  balls[i].ReactToHitAtLeftBlockSide(j);
  ReactToHitBlockByBall(j, i);
}

void ReactToHitBallToBlockAtRightSide(int i, int j)
{
  balls[i].ReactToHitAtRightBlockSide(j);
  ReactToHitBlockByBall(j, i);
}

void JudgeHitBallToBlock()
{
  int code;
  for (int ba=0; ba<ball_top; ba++) {
    code=DecideHitSide(balls[ba]);
    for (int bl=0; bl<block_top; bl++) {
      if (code%CAN_BE_HIT_AT_FLOOR_SIDE==0 && CheckHitAtFloorSide(balls[ba], blocks[bl])) {
        ReactToHitBallToBlockAtFloorSide(ba, bl);
        code=DecideHitSide(balls[ba]);
        continue;
      }
      if (code%CAN_BE_HIT_AT_LEFT_SIDE==0) {
        if (CheckHitAtLeftSide(balls[ba], blocks[bl])) {
          ReactToHitBallToBlockAtLeftSide(ba, bl);
          code=DecideHitSide(balls[ba]);
          continue;
        }
      }
      if (code%CAN_BE_HIT_AT_RIGHT_SIDE==0) {
        if (CheckHitAtRightSide(balls[ba], blocks[bl])) {
          ReactToHitBallToBlockAtRightSide(ba, bl);
          code=DecideHitSide(balls[ba]);
          continue;
        }
      }
      if (code%CAN_BE_HIT_AT_CEILING_SIDE==0) {
        if (CheckHitAtCeilingSide(balls[ba], blocks[bl])) {
          ReactToHitBallToBlockAtCeilingSide(ba, bl);
          code=DecideHitSide(balls[ba]);
          continue;
        }
      }
    }
  }
}

void JudgeBallToFrame()
{
  int code=HIT_AT_NO_FRAME;
  for (int i=0; i<ball_top; i++) {
    code=JudgeObjectToFrame(balls[i], frame);
    switch(code) {
    case HIT_AT_LEFT_FRAME:
      balls[i].ReactToHitAtLeftFrame(frame);
      break;
    case HIT_AT_RIGHT_FRAME:
      balls[i].ReactToHitAtRightFrame(frame);
      break;
    case HIT_AT_CEILING_FRAME:
      balls[i].ReactToHitAtCeilingFrame(frame);
      break;
    case HIT_AT_FLOOR_FRAME:
      balls[i].ReactToHitAtFloorFrame(frame);
      DeleteBall(i);
      break;
    }
  }
}

void DrawBall()
{
  for (int i=0; i<ball_top; i++) {
    balls[i].Draw();
  }
}

void DrawBlock()
{
  for (int i=0; i<block_top; i++) {
    blocks[i].Draw();
  }
}

void UpdateBall()
{
  for (int i=0; i<ball_top; i++) {
    balls[i].Update();
    if (balls[i].endurance<=0) {
      DeleteBall(i);
    }
  }
}

void UpdateFrame()
{
  frame.Update();
}

void UpdateBlock()
{
  for (int i=0; i<block_top; i++) {
    blocks[i].Update();
  }
}

void GenerateBlock()
{
  int max_endurance=100;
    en=break_count/40<=max_endurance ? break_count/40:max_endurance;
    if (blocks[0].v.y*frameCount/2%blocks[0].h!=0) return;
  
  for (int i=0; i<frame.w/ (blocks[0].w*2); i++) {
    if ((int)random(1000)%50==0 && i!=0 && i!=blocks.length-1) {
      CreateBlock(blocks[0].w+i*blocks[0].w*2+frame.left, frame.ceiling-blocks[0].h, BLOCK_TYPE_EXPLOSIONBLOCK);
      GetLastBlock().col=color_manager.GetColorOfColumnExplosionBlock(i);
      GetLastBlock().endurance=en*2;
    } else {
      CreateBlock(blocks[0].w+i*blocks[0].w*2+frame.left, frame.ceiling-blocks[0].h, BLOCK_TYPE_NORMALBLOCK);
      GetLastBlock().col= color_manager.GetColorOfColumnBlock(i);
      GetLastBlock().endurance=en;
    }
  }
}

float[] block_x=new float[36];

void SetBlockX()
{
  for (int i=0; i<frame.w/ (blocks[0].w*2); i++) {
    block_x[i]=blocks[0].w+i*blocks[0].w*2+frame.left;
  }
}




void Update()
{
  UpdateFrame();
  UpdateBlock(); 
  UpdateBall();
  bar.Update();
  UpdateEffect();
}

void DrawBar()
{
  bar.Draw();  
}  

void Draw()
{
  background(background);
  DrawBlock();
  DrawBall();
  DrawBar();
  DrawFrame();
  DrawCursor();
  DrawData();
  DrawEffect();
}

color GetColorOfBallNumber()
{
  if(ball_top<=100){
    return color(0,0,255);
  }else if(ball_top<150){
    return color(0,255,0);
  }else if(ball_top<180){
    return color(255,0,255);
  }else if(ball_top<=200){
    return color(255,0,0);
  }
  return 0;
}

void DrawBallGraph()
{
    int x=width-100;
  int y=550;
    int w=10;
  noStroke();
    rectMode(CORNER);
  
  fill(0,0,255);
  rect(x-w,y-ball_top,w*2,ball_top);
  if(ball_top>=100){
    fill(0,255,0);
    rect(x-w,y-ball_top,w*2,ball_top-100);
  }
  if(ball_top>=150){
    fill(255,0,255);
    rect(x-w,y-ball_top,w*2,ball_top-150);
  }
  if(ball_top>=180){
    fill(255,0,0);
    rect(x-w,y-ball_top,w*2,ball_top-180);
  }
    rectMode(RADIUS);
    if(ball_top==200){
    fill(255,0,0);
    text("MAX!!",x+20,y-190);
  }
}


void DrawData()
{
  fill(255);
  textSize(20);
  text("Block Hardness"+en,width-185,100);
  text("Score:"+break_count,width-180,200);
  fill(GetColorOfBallNumber());
  text("Ball Number:"+ball_top,width-180,300);
  DrawBallGraph();
}

void DrawFrame()
{
  fill(0);
  rectMode(CORNER);
  noStroke();
  rect(0,0,frame.left+1,height);
  rect(0,0,width,frame.ceiling+1);
  rect(frame.right,0,width-frame.right,height);
  rect(0,frame.floor,width,height-frame.floor);
  rectMode(RADIUS);
}

void Judge()
{
    JudgeBallToFrame();
    JudgeHitBallToBlock();
    JudgeHitBallToBar();
}

int mainroutine_count=0;

boolean MainRoutine()
{
    if(mainroutine_count>20){
    GenerateBlock();
  }else if(mainroutine_count==19){
    InitBlocks();
    mainroutine_count++;
  }else{
    mainroutine_count++;
  }
    color_manager.Coloring();
    Judge();
    Update();
    Draw();
  return CheckGameover();
}

void DrawCursor()
{
    stroke(GetColorOfBallNumber());
    strokeWeight(3);
    line(mouseX+30*cos(PI*2/60*(frameCount%60)),mouseY+30*sin(PI*2/60*(frameCount%60)), mouseX+30*cos(PI*2/60*((frameCount+30)%60)), mouseY+30*sin(PI*2/60*((frameCount+30)%60)));
  line(mouseX+30*cos(PI*2/60*((frameCount+15)%60)),mouseY+30*sin(PI*2/60*((frameCount+15)%60)), mouseX+30*cos(PI*2/60*((frameCount+45)%60)), mouseY+30*sin(PI*2/60*((frameCount+45)%60)));
  noFill();
    ellipse(mouseX,mouseY,25,25);
  ellipse(mouseX,mouseY,15,15);
    strokeWeight(1);  
}

void setup()
{
    frameRate(FRAMERATE);
    size(1280, 600);
    noCursor();
    rectMode(RADIUS);
  ellipseMode(RADIUS);
    phase=PHASE_GAME_INITIALIZE;
}

void InitBlocks()
{
  block_top=0;
  for (int i=0; i<blocks.length; i++) {
    blocks[i]=new Block(0.0, 0.0);
  }
}
void InitBalls()
{
  ball_top=0;
  for (int i=0; i<balls.length; i++) {
    balls[i]=new Ball(0,0);
  }
}
void InitEffects()
{
  effect_top=0;
  for (int i=0; i<effects.length; i++) {
    effects[i]=new Effect();
  }
}  

int phase_game_initialize=0;
boolean GameInitialize()
{
  switch(phase_game_initialize){
  case 0:
        break_count=0;
        mainroutine_count=0;
        color_manager=new ColorManager();
    frame=new Frame(10, 10, width-190, height-50);
    bar=new Bar();
    im=new InputManager();
    InitBalls();
    InitBlocks();
    InitEffects();
        SetBlockX();
        background=color(255);    
    phase_game_initialize++;
    break;
  case 1:
        CreateEffect(0,0,EFFECT_TYPE_WORDEDSHAPEBLOCKS,WORD_ClicktoStart);
    phase_game_initialize++;
    break;
  case 2:
        if(mousePressed){
      CreateBall(bar.p.x+frame.left,frame.ceiling+bar.p.y-bar.h-balls[0].r,BALL_TYPE_SLOWBALL);
      CreateEffect(0,0,EFFECT_TYPE_BROKENBLOCK_CURTAIN,0);
            phase_game_initialize=0;
      return true;
    }
        Update();
    Draw();
  }
  return false;
}

boolean wait_flag=false;
int count;
int terminal_count;
boolean Wait(int t)
{
  if(wait_flag){
    if(count==terminal_count){
      wait_flag=false;
      return true;
    }
    count++;
    return false;
  }else{
    terminal_count=t;
    count=0;
    wait_flag=true;
    return false;
  }
}

int phase_gameover;
boolean GameOver()
{
  switch(phase_gameover){
  case 0:
        DeleteBallAll();
        CreateEffect(0,0,EFFECT_TYPE_BROKENBLOCK_CURTAIN,0);
    phase_gameover++;
    break;
  case 1:
        CreateEffect(0,0,EFFECT_TYPE_WORDEDSHAPEBLOCKS,WORD_GAMEOVER);
    phase_gameover++;
    break;
  case 2:
        if(Wait(120)){
            CreateEffect(0,0,EFFECT_TYPE_BROKENBLOCK_CURTAIN,0);
      phase_gameover++;
    }
    break;
  case 3:
        CreateEffect(0,0,EFFECT_TYPE_WORDEDSHAPEBLOCKS, WORD_SCORE);
    phase_gameover++;
    break;
  case 4:
        if(Wait(120)){
            CreateEffect(0,0,EFFECT_TYPE_BROKENBLOCK_CURTAIN,0);
      phase_gameover++;
    }
    break;
  case 5:
    CreateEffect(0,0,EFFECT_TYPE_WORDEDSHAPEBLOCKS,WORD_SCORE_NUMBER);
    phase_gameover++;
    break;
  case 6:
        if(Wait(120)){
            phase_gameover=0;
            return true;
    }
        break;
  }
    Update();
  Draw();
  return false;
}


void draw()
{
  switch(phase) {
      case PHASE_GAME_INITIALIZE:
    if (GameInitialize()) phase=PHASE_GAME;
    break;
      case PHASE_GAME:
    if (MainRoutine()) phase=PHASE_GAMEOVER;
    break;
  case PHASE_GAMEOVER:
    if(GameOver()) phase=PHASE_GAME_INITIALIZE;
    break;
  }
}

void keyPressed()
{
  if(key=='b'){
    if(frameRate>50){
     frameRate(5);
    }else{
      frameRate(FRAMERATE);
    }
  }
  if (key=='a') im.flag_a=true;
  if (key=='d') im.flag_d=true;
}

void keyReleased()
{
  if (key=='a') im.flag_a=false;
  if (key=='d') im.flag_d=false;
}
