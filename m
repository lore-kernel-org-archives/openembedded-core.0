Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E79C678D8
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 15:49:33 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.118506.1673711367752915997
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 07:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bKGFQMf+;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id b9-20020a17090a7ac900b00226ef160dcaso25454451pjl.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 07:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYrkxFdnLMVXayOfpAoJYgC7Ui75IoPaTdq3FFLFd7w=;
        b=bKGFQMf+QfvBiEZtkufMAJwp++yMYAjiRjDE/Hmt9sgKuqBzb8VcFjsgjNY+fO01Uf
         GX2R6Rb9vVQ4Y0V05FFjVNTlK2ovL1G12EWA4YL+6ob7a09u29GEQcWQUUcm95IwSdQm
         ykrUNNS/GodB97nUfvtnhdV8Ao2uVCmfIs0yG+v6UDBNFLmtq+tQukeU963OF17DJN2f
         RGjJdmgoxH8UoAlsPgRjhB6Q5vsFBoSepLPlm7la7C/VjNwLph5/QpzdPSvUoMmseh2W
         Iws6pduilM1MhfeZZ977Jy1Gy13mFXhYkKPA+xG/TkQqlL2MCp+vKT31ZKoJy6rFAq50
         WAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYrkxFdnLMVXayOfpAoJYgC7Ui75IoPaTdq3FFLFd7w=;
        b=BsRNqWxUIB00H15UV4PqRf4413vG8GsJBUH9a07vwF2DySLty1fvEVUPIk9AmxKpbz
         W9C4C3s2KzRb3M/1EHMySuIE5AxKqDy9Dc7b75hzVxTr4xQuKcFzQoCJs4A/bHaCL0ib
         2qde90taVc0Ix+EPewPJAWECvf24LfOotKghbkmjqNsOnmnTr4PH+JDdUhI2fAw3SJPv
         7gwKTeheCAGjvCoQnIuj1MoP9DvJX2Fnu65/PCSmsaaQ0//7CVn75qs+8f/4F45DTQct
         DL+LCalGoIdw+oqymZNXWcUYhc6V/5Z7UdVvxvq07mWHplnkAIXXJ7FFIb5afr92C08g
         qBtQ==
X-Gm-Message-State: AFqh2kpznl4thlqf7zvBbh2oWVq9PgP+MiB2w/rbdXZ7c0NYkXHWn8s5
	aJbQpo3Qb6ZErx5ZVPJRnd46lqBjhIOCOQ==
X-Google-Smtp-Source: AMrXdXu0uNZ1eiiN2/hW+SuG7Cs5V8tpyFBFaziYJoWW/Wqv8Z8Oy2aEcBGezABihkLFeHYt3BAEiA==
X-Received: by 2002:a05:6a21:78a0:b0:a3:960e:7d0a with SMTP id bf32-20020a056a2178a000b000a3960e7d0amr124796240pzc.58.1673711366662;
        Sat, 14 Jan 2023 07:49:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id b7-20020a63eb47000000b00460ea630c1bsm13129200pgk.46.2023.01.14.07.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 07:49:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/5] groff: Drop use of `register` storage class
Date: Sat, 14 Jan 2023 07:49:18 -0800
Message-Id: <20230114154921.3757493-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114154921.3757493-1-raj.khem@gmail.com>
References: <20230114154921.3757493-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 15:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175851

Backport a patch to make it work with c17 standard

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Fix-code-style-issues.patch    | 536 ++++++++++++++++++
 meta/recipes-extended/groff/groff_1.22.4.bb   |   3 +-
 2 files changed, 538 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/groff/files/0001-Fix-code-style-issues.patch

diff --git a/meta/recipes-extended/groff/files/0001-Fix-code-style-issues.patch b/meta/recipes-extended/groff/files/0001-Fix-code-style-issues.patch
new file mode 100644
index 0000000000..221490d6a3
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-Fix-code-style-issues.patch
@@ -0,0 +1,536 @@
+From 99313d5c0ff35da6627e7dc985612f990ca64637 Mon Sep 17 00:00:00 2001
+From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
+Date: Mon, 16 Aug 2021 12:37:22 +1000
+Subject: [PATCH] Fix code style issues.
+
+* src/preproc/grn/hgraph.cpp:
+* src/preproc/grn/hpoint.cpp:
+* src/preproc/grn/main.cpp:
+* src/preproc/grn/hdb.cpp: Drop use of `register` storage class.
+
+* src/preproc/grn/hgraph.cpp (len, HGPrintElt, picurve):
+* src/preproc/grn/hdb.cpp (DBRead): Wrap long lines.
+
+* src/preproc/grn/hgraph.cpp: Rename function from `Paramaterize` to
+  `Parameterize`.
+
+  (HGCurve): Update call site.
+
+* src/preproc/grn/main.cpp (add_file): Drop redundant cast in
+  `realloc()` call.
+
+  (conv, interpret): Use standard English in diagnostic messages.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/groff.git/commit/?id=eead5f5cf1dedc6d180bdb34914d7157d39e270c]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/preproc/grn/hdb.cpp    |  20 +++---
+ src/preproc/grn/hgraph.cpp | 131 +++++++++++++++++++------------------
+ src/preproc/grn/hpoint.cpp |   2 +-
+ src/preproc/grn/main.cpp   |  38 +++++------
+ 4 files changed, 100 insertions(+), 91 deletions(-)
+
+diff --git a/src/preproc/grn/hdb.cpp b/src/preproc/grn/hdb.cpp
+index c61e099..2b4011b 100644
+--- a/src/preproc/grn/hdb.cpp
++++ b/src/preproc/grn/hdb.cpp
+@@ -35,7 +35,7 @@ extern POINT *PTInit();
+ extern POINT *PTMakePoint(double x, double y, POINT ** pplist);
+ 
+ 
+-int DBGetType(register char *s);
++int DBGetType(char *s);
+ 
+ 
+ /*
+@@ -61,7 +61,7 @@ DBCreateElt(int type,
+ 	    char *text,
+ 	    ELT **db)
+ {
+-  register ELT *temp;
++  ELT *temp = 0;
+ 
+   temp = (ELT *) malloc(sizeof(ELT));
+   temp->nextelt = *db;
+@@ -80,11 +80,11 @@ DBCreateElt(int type,
+  * pointer to that database.
+  */
+ ELT *
+-DBRead(register FILE *file)
++DBRead(FILE *file)
+ {
+-  register int i;
+-  register int done;		/* flag for input exhausted */
+-  register double nx;		/* x holder so x is not set before orienting */
++  int i;
++  int done;		/* flag for input exhausted */
++  double nx;		/* x holder so x is not set before orienting */
+   int type;			/* element type */
+   ELT *elist;			/* pointer to the file's elements */
+   POINT *plist;			/* pointer for reading in points */
+@@ -112,7 +112,9 @@ DBRead(register FILE *file)
+     /* if (fscanf(file,"%" MAXSTRING_S "s\n", string) == EOF) */
+     /* I changed the scanf format because the element */
+     /* can have two words (e.g. CURVE SPLINE)         */
+-    if (fscanf(file, "\n%" MAXSTRING_S "[^\n]%*[^\n]\n", string) == EOF) {
++    if (fscanf(file, "\n%"
++		      MAXSTRING_S
++		     "[^\n]%*[^\n]\n", string) == EOF) {
+       error("'%1', error in file format", gremlinfile);
+       return (elist);
+     }
+@@ -209,7 +211,7 @@ DBRead(register FILE *file)
+  * New file format has literal names for element types.
+  */
+ int
+-DBGetType(register char *s)
++DBGetType(char *s)
+ {
+   if (isdigit(s[0]) || (s[0] == '-'))	/* old element format or EOF */
+     return (atoi(s));
+@@ -298,7 +300,7 @@ xscanf(FILE *f,
+        double *xp,
+        double *yp)
+ {
+-  register int c, i, j, m, frac;
++  int c, i, j, m, frac;
+   int iscale = 1, jscale = 1;	/* x = i/scale, y=j/jscale */
+ 
+   while ((c = getc(f)) == ' ');
+diff --git a/src/preproc/grn/hgraph.cpp b/src/preproc/grn/hgraph.cpp
+index dbc0086..ad051ea 100644
+--- a/src/preproc/grn/hgraph.cpp
++++ b/src/preproc/grn/hgraph.cpp
+@@ -14,7 +14,8 @@
+ #define PointsPerInterval 64
+ #define pi		3.14159265358979324
+ #define twopi		(2.0 * pi)
+-#define len(a, b)	groff_hypot((double)(b.x-a.x), (double)(b.y-a.y))
++#define len(a, b)	groff_hypot((double)(b.x-a.x), \
++			            (double)(b.y-a.y))
+ 
+ 
+ extern int dotshifter;		/* for the length of dotted curves */
+@@ -48,7 +49,7 @@ extern double adj4;
+ extern int res;
+ 
+ void HGSetFont(int font, int size);
+-void HGPutText(int justify, POINT pnt, register char *string);
++void HGPutText(int justify, POINT pnt, char *string);
+ void HGSetBrush(int mode);
+ void tmove2(int px, int py);
+ void doarc(POINT cp, POINT sp, int angle);
+@@ -58,10 +59,10 @@ void drawwig(POINT * ptr, int type);
+ void HGtline(int x1, int y1);
+ void deltax(double x);
+ void deltay(double y);
+-void HGArc(register int cx, register int cy, int px, int py, int angle);
+-void picurve(register int *x, register int *y, int npts);
++void HGArc(int cx, int cy, int px, int py, int angle);
++void picurve(int *x, int *y, int npts);
+ void HGCurve(int *x, int *y, int numpoints);
+-void Paramaterize(int x[], int y[], double h[], int n);
++void Parameterize(int x[], int y[], double h[], int n);
+ void PeriodicSpline(double h[], int z[],
+ 		    double dz[], double d2z[], double d3z[],
+ 		    int npoints);
+@@ -83,10 +84,10 @@ void
+ HGPrintElt(ELT *element,
+ 	   int /* baseline */)
+ {
+-  register POINT *p1;
+-  register POINT *p2;
+-  register int length;
+-  register int graylevel;
++  POINT *p1;
++  POINT *p2;
++  int length;
++  int graylevel;
+ 
+   if (!DBNullelt(element) && !Nullpoint((p1 = element->ptlist))) {
+     /* p1 always has first point */
+@@ -168,7 +169,8 @@ HGPrintElt(ELT *element,
+ 
+ 	  if (polyfill == FILL || polyfill == BOTH) {
+ 	    /* do the interior */
+-	    char command = (polyfill == BOTH && element->brushf) ? 'p' : 'P';
++	    char command = (polyfill == BOTH && element->brushf)
++			   ? 'p' : 'P';
+ 
+ 	    /* include outline, if there is one and */
+ 	    /* the -p flag was set                  */
+@@ -278,7 +280,7 @@ HGPrintElt(ELT *element,
+ void
+ HGPutText(int justify,
+ 	  POINT pnt,
+-	  register char *string)
++	  char *string)
+ {
+   int savelasty = lasty;	/* vertical motion for text is to be */
+ 				/* ignored.  Save current y here     */
+@@ -387,7 +389,7 @@ HGSetFont(int font,
+ void
+ HGSetBrush(int mode)
+ {
+-  register int printed = 0;
++  int printed = 0;
+ 
+   if (linmod != style[--mode]) {
+     /* Groff doesn't understand \Ds, so we take it out */
+@@ -417,7 +419,7 @@ HGSetBrush(int mode)
+ void
+ deltax(double x)
+ {
+-  register int ix = (int) (x * troffscale);
++  int ix = (int) (x * troffscale);
+ 
+   printf(" %du", ix - lastx);
+   lastx = ix;
+@@ -437,7 +439,7 @@ deltax(double x)
+ void
+ deltay(double y)
+ {
+-  register int iy = (int) (y * troffscale);
++  int iy = (int) (y * troffscale);
+ 
+   printf(" %du", iy - lastyline);
+   lastyline = iy;
+@@ -457,8 +459,8 @@ void
+ tmove2(int px,
+        int py)
+ {
+-  register int dx;
+-  register int dy;
++  int dx;
++  int dy;
+ 
+   if ((dy = py - lasty)) {
+     printf("\\v'%du'", dy);
+@@ -483,10 +485,10 @@ tmove2(int px,
+ void
+ tmove(POINT * ptr)
+ {
+-  register int ix = (int) (ptr->x * troffscale);
+-  register int iy = (int) (ptr->y * troffscale);
+-  register int dx;
+-  register int dy;
++  int ix = (int) (ptr->x * troffscale);
++  int iy = (int) (ptr->y * troffscale);
++  int dx;
++  int dy;
+ 
+   if ((dy = iy - lasty)) {
+     printf(".sp %du\n", dy);
+@@ -547,7 +549,7 @@ void
+ drawwig(POINT * ptr,
+ 	int type)
+ {
+-  register int npts;			/* point list index */
++  int npts;			/* point list index */
+   int x[MAXPOINTS], y[MAXPOINTS];	/* point list */
+ 
+   for (npts = 1; !Nullpoint(ptr); ptr = PTNextPoint(ptr), npts++) {
+@@ -574,20 +576,20 @@ drawwig(POINT * ptr,
+  *----------------------------------------------------------------------------*/
+ 
+ void
+-HGArc(register int cx,
+-      register int cy,
++HGArc(int cx,
++      int cy,
+       int px,
+       int py,
+       int angle)
+ {
+   double xs, ys, resolution, fullcircle;
+   int m;
+-  register int mask;
+-  register int extent;
+-  register int nx;
+-  register int ny;
+-  register int length;
+-  register double epsilon;
++  int mask;
++  int extent;
++  int nx;
++  int ny;
++  int length;
++  double epsilon;
+ 
+   xs = px - cx;
+   ys = py - cy;
+@@ -633,15 +635,15 @@ HGArc(register int cx,
+  *----------------------------------------------------------------------------*/
+ 
+ void
+-picurve(register int *x,
+-	register int *y,
++picurve(int *x,
++	int *y,
+ 	int npts)
+ {
+-  register int nseg;		/* effective resolution for each curve */
+-  register int xp;		/* current point (and temporary) */
+-  register int yp;
+-  int pxp, pyp;			/* previous point (to make lines from) */
+-  int i;			/* inner curve segment traverser */
++  int nseg;		/* effective resolution for each curve */
++  int xp;		/* current point (and temporary) */
++  int yp;
++  int pxp, pyp;		/* previous point (to make lines from) */
++  int i;		/* inner curve segment traverser */
+   int length = 0;
+   double w;			/* position factor */
+   double t1, t2, t3;		/* calculation temps */
+@@ -671,7 +673,8 @@ picurve(register int *x,
+ 				/* 'nseg' is the number of line    */
+ 				/* segments that will be drawn for */
+ 				/* each curve segment.             */
+-    nseg = (int) ((double) (nseg + (int) groff_hypot((double) xp, (double) yp)) /
++    nseg = (int) ((double) (nseg + (int) groff_hypot((double) xp,
++						     (double) yp)) /
+ 		  res * PointsPerInterval);
+ 
+     for (i = 1; i < nseg; i++) {
+@@ -710,10 +713,10 @@ HGCurve(int *x,
+   double h[MAXPOINTS], dx[MAXPOINTS], dy[MAXPOINTS];
+   double d2x[MAXPOINTS], d2y[MAXPOINTS], d3x[MAXPOINTS], d3y[MAXPOINTS];
+   double t, t2, t3;
+-  register int j;
+-  register int k;
+-  register int nx;
+-  register int ny;
++  int j;
++  int k;
++  int nx;
++  int ny;
+   int lx, ly;
+   int length = 0;
+ 
+@@ -725,7 +728,7 @@ HGCurve(int *x,
+    * Solve for derivatives of the curve at each point separately for x and y
+    * (parametric).
+    */
+-  Paramaterize(x, y, h, numpoints);
++  Parameterize(x, y, h, numpoints);
+ 
+   /* closed curve */
+   if ((x[1] == x[numpoints]) && (y[1] == y[numpoints])) {
+@@ -771,15 +774,15 @@ HGCurve(int *x,
+  *----------------------------------------------------------------------------*/
+ 
+ void
+-Paramaterize(int x[],
++Parameterize(int x[],
+ 	     int y[],
+ 	     double h[],
+ 	     int n)
+ {
+-  register int dx;
+-  register int dy;
+-  register int i;
+-  register int j;
++  int dx;
++  int dy;
++  int i;
++  int j;
+   double u[MAXPOINTS];
+ 
+   for (i = 1; i <= n; ++i) {
+@@ -937,9 +940,9 @@ NaturalEndSpline(double h[],	/* parameterization */
+  *----------------------------------------------------------------------------*/
+ 
+ void
+-change(register int x,
+-       register int y,
+-       register int vis)
++change(int x,
++       int y,
++       int vis)
+ {
+   static int length = 0;
+ 
+@@ -967,17 +970,17 @@ void
+ HGtline(int x_1,
+ 	int y_1)
+ {
+-  register int x_0 = lastx;
+-  register int y_0 = lasty;
+-  register int dx;
+-  register int dy;
+-  register int oldcoord;
+-  register int res1;
+-  register int visible;
+-  register int res2;
+-  register int xinc;
+-  register int yinc;
+-  register int dotcounter;
++  int x_0 = lastx;
++  int y_0 = lasty;
++  int dx;
++  int dy;
++  int oldcoord;
++  int res1;
++  int visible;
++  int res2;
++  int xinc;
++  int yinc;
++  int dotcounter;
+ 
+   if (linmod == SOLID) {
+     line(x_1, y_1);
+@@ -1045,4 +1048,8 @@ HGtline(int x_1,
+     change(x_1, y_1, 0);
+ }
+ 
+-/* EOF */
++// Local Variables:
++// fill-column: 72
++// mode: C++
++// End:
++// vim: set cindent noexpandtab shiftwidth=2 textwidth=72:
+diff --git a/src/preproc/grn/hpoint.cpp b/src/preproc/grn/hpoint.cpp
+index b581cb0..77bfc9d 100644
+--- a/src/preproc/grn/hpoint.cpp
++++ b/src/preproc/grn/hpoint.cpp
+@@ -32,7 +32,7 @@ PTMakePoint(double x,
+ 	    double y,
+ 	    POINT **pplist)
+ {
+-  register POINT *pt;
++  POINT *pt;
+ 
+   if (Nullpoint(pt = *pplist)) {	/* empty list */
+     *pplist = (POINT *) malloc(sizeof(POINT));
+diff --git a/src/preproc/grn/main.cpp b/src/preproc/grn/main.cpp
+index 833fd60..d1887b6 100644
+--- a/src/preproc/grn/main.cpp
++++ b/src/preproc/grn/main.cpp
+@@ -88,7 +88,7 @@ extern "C" const char *Version_string;
+ 
+ extern void HGPrintElt(ELT *element, int baseline);
+ extern ELT *DBInit();
+-extern ELT *DBRead(register FILE *file);
++extern ELT *DBRead(FILE *file);
+ extern POINT *PTInit();
+ extern POINT *PTMakePoint(double x, double y, POINT **pplist);
+ 
+@@ -231,9 +231,9 @@ int compatibility_flag = FALSE;	/* TRUE if in compatibility mode */
+ 
+ void getres();
+ int doinput(FILE *fp);
+-void conv(register FILE *fp, int baseline);
++void conv(FILE *fp, int baseline);
+ void savestate();
+-int has_polygon(register ELT *elist);
++int has_polygon(ELT *elist);
+ void interpret(char *line);
+ 
+ 
+@@ -256,7 +256,7 @@ add_file(char **file,
+ {
+   if (*count >= *cur_size) {
+     *cur_size += FILE_SIZE_INCR;
+-    file = (char **) realloc((char **) file, *cur_size * sizeof(char *));
++    file = (char **) realloc(file, *cur_size * sizeof(char *));
+     if (file == NULL) {
+       fatal("unable to extend file array");
+     }
+@@ -283,9 +283,9 @@ main(int argc,
+ {
+   setlocale(LC_NUMERIC, "C");
+   program_name = argv[0];
+-  register FILE *fp;
+-  register int k;
+-  register char c;
++  FILE *fp;
++  int k;
++  char c;
+   int gfil = 0;
+   char **file = NULL;
+   int file_cur_size = INIT_FILE_SIZE;
+@@ -466,7 +466,7 @@ doinput(FILE *fp)
+ void
+ initpic()
+ {
+-  register int i;
++  int i;
+ 
+   for (i = 0; i < STYLES; i++) {	/* line thickness defaults */
+     thick[i] = defthick[i];
+@@ -511,12 +511,12 @@ initpic()
+  *----------------------------------------------------------------------------*/
+ 
+ void
+-conv(register FILE *fp,
++conv(FILE *fp,
+      int baseline)
+ {
+-  register FILE *gfp = NULL;	/* input file pointer */
+-  register int done = 0;	/* flag to remember if finished */
+-  register ELT *e;		/* current element pointer */
++  FILE *gfp = NULL;		/* input file pointer */
++  int done = 0;		/* flag to remember if finished */
++  ELT *e;			/* current element pointer */
+   ELT *PICTURE;			/* whole picture data base pointer */
+   double temp;			/* temporary calculating area */
+   /* POINT ptr; */		/* coordinates of a point to pass to 'mov' */
+@@ -543,7 +543,7 @@ conv(register FILE *fp,
+ 
+       if (!gremlinfile[0]) {
+ 	if (!setdefault)
+-	  error("at line %1: no picture filename.\n", baseline);
++	  error("no picture file name at line %1", baseline);
+ 	return;
+       }
+       char *path;
+@@ -577,7 +577,7 @@ conv(register FILE *fp,
+       }				/* here, troffscale is the */
+ 				/* picture's scaling factor */
+       if (pointscale) {
+-	register int i;		/* do pointscaling here, when */
++	int i;			/* do pointscaling here, when */
+ 				/* scale is known, before output */
+ 	for (i = 0; i < SIZES; i++)
+ 	  tsize[i] = (int) (troffscale * (double) tsize[i] + 0.5);
+@@ -700,7 +700,7 @@ conv(register FILE *fp,
+ void
+ savestate()
+ {
+-  register int i;
++  int i;
+ 
+   for (i = 0; i < STYLES; i++)	/* line thickness defaults */
+     defthick[i] = thick[i];
+@@ -761,8 +761,8 @@ interpret(char *line)
+ {
+   char str1[MAXINLINE];
+   char str2[MAXINLINE];
+-  register char *chr;
+-  register int i;
++  char *chr;
++  int i;
+   double par;
+ 
+   str2[0] = '\0';
+@@ -811,7 +811,7 @@ interpret(char *line)
+ 
+     if (str2[0] < '0') {
+   nofont:
+-      error("no fontname specified in line %1", linenum);
++      error("no font name specified in line %1", linenum);
+       break;
+     }
+     if (str1[1] == 't')
+@@ -935,7 +935,7 @@ interpret(char *line)
+  */
+ 
+ int
+-has_polygon(register ELT *elist)
++has_polygon(ELT *elist)
+ {
+   while (!DBNullelt(elist)) {
+     if (elist->type == POLYGON)
+-- 
+2.39.0
+
diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
index b281544aab..244c0e1625 100644
--- a/meta/recipes-extended/groff/groff_1.22.4.bb
+++ b/meta/recipes-extended/groff/groff_1.22.4.bb
@@ -12,7 +12,8 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 	file://groff-not-search-fonts-on-build-host.patch \
 	file://0001-support-musl.patch \
 	file://0001-Include-config.h.patch \
-        file://0001-Make-manpages-mulitlib-identical.patch \
+	file://0001-Make-manpages-mulitlib-identical.patch \
+	file://0001-Fix-code-style-issues.patch \
 "
 
 SRC_URI[md5sum] = "08fb04335e2f5e73f23ea4c3adbf0c5f"
-- 
2.39.0


