Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B4D7160E23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 00:23:41 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1WrcVx-0002Ff-I2 from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jun 2014 17:23:41 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 2 Jun 2014 17:23:41 -0700
Received: from key-largo.mgc.mentorg.com ([172.30.4.192]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 2 Jun 2014 17:23:41 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 20:23:38 -0400
Message-Id: <1401755018-9951-3-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1401755018-9951-1-git-send-email-drew_moseley@mentor.com>
References: <1401755018-9951-1-git-send-email-drew_moseley@mentor.com>
X-OriginalArrivalTime: 03 Jun 2014 00:23:41.0236 (UTC)
	FILETIME=[1245E740:01CF7EC2]
Subject: [PATCH 3/3] mesa-demos: Use DEMOS_DATA_DIR.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jun 2014 00:23:45 -0000

Modify mesa demo apps to respect the DEMOS_DATA_DIR
configuration parameter for locating data files.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 ...s-Use-DEMOS_DATA_DIR-to-locate-data-files.patch | 234 +++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb     |   3 +-
 2 files changed, 236 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Use-DEMOS_DATA_DIR-to-locate-data-files.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Use-DEMOS_DATA_DIR-to-locate-data-files.patch b/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Use-DEMOS_DATA_DIR-to-locate-data-files.patch
new file mode 100644
index 0000000..c89f878
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Use-DEMOS_DATA_DIR-to-locate-data-files.patch
@@ -0,0 +1,234 @@
+From bc7fa67d13e8032601df5cf04e15c53a7204dcd7 Mon Sep 17 00:00:00 2001
+From: Drew Moseley <drew_moseley@mentor.com>
+Date: Fri, 9 May 2014 11:50:24 -0400
+Subject: [PATCH] mesa-demos: Use DEMOS_DATA_DIR to locate data files
+
+Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=78496]
+Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
+---
+ src/glsl/bezier.c           |    2 +-
+ src/glsl/blinking-teapot.c  |    4 ++--
+ src/glsl/brick.c            |    4 ++--
+ src/glsl/bump.c             |    6 +++---
+ src/glsl/convolutions.c     |    2 +-
+ src/glsl/mandelbrot.c       |    4 ++--
+ src/glsl/multitex.c         |    4 ++--
+ src/glsl/simplex-noise.c    |    2 +-
+ src/glsl/skinning.c         |    4 ++--
+ src/glsl/texdemo1.c         |    8 ++++----
+ src/glsl/toyball.c          |    4 ++--
+ src/objviewer/objview.c     |   12 ++++++------
+ src/perf/glslstateschange.c |    8 ++++----
+ 13 files changed, 32 insertions(+), 32 deletions(-)
+
+diff --git a/src/glsl/bezier.c b/src/glsl/bezier.c
+index 0b56bc1..e01603d 100644
+--- a/src/glsl/bezier.c
++++ b/src/glsl/bezier.c
+@@ -13,7 +13,7 @@
+ #include "glut_wrap.h"
+ #include "shaderutil.h"
+ 
+-static const char *filename = "bezier.geom";
++static const char *filename = DEMOS_DATA_DIR "bezier.geom";
+ 
+ static GLuint fragShader;
+ static GLuint vertShader;
+diff --git a/src/glsl/blinking-teapot.c b/src/glsl/blinking-teapot.c
+index e3bf24d..7662b1f 100644
+--- a/src/glsl/blinking-teapot.c
++++ b/src/glsl/blinking-teapot.c
+@@ -63,8 +63,8 @@ init_opengl (void)
+      exit(1);
+   }     
+ 
+-  vshad_id = CompileShaderFile (GL_VERTEX_SHADER, "blinking-teapot.vert");
+-  fshad_id = CompileShaderFile (GL_FRAGMENT_SHADER, "blinking-teapot.frag");
++  vshad_id = CompileShaderFile (GL_VERTEX_SHADER, DEMOS_DATA_DIR "blinking-teapot.vert");
++  fshad_id = CompileShaderFile (GL_FRAGMENT_SHADER, DEMOS_DATA_DIR "blinking-teapot.frag");
+   prog_id = LinkShaders (vshad_id, fshad_id);
+ 
+   UseProgram (prog_id);
+diff --git a/src/glsl/brick.c b/src/glsl/brick.c
+index 3021856..fe5f190 100644
+--- a/src/glsl/brick.c
++++ b/src/glsl/brick.c
+@@ -14,8 +14,8 @@
+ #include "shaderutil.h"
+ 
+ 
+-static char *FragProgFile = "CH06-brick.frag";
+-static char *VertProgFile = "CH06-brick.vert";
++static char *FragProgFile = DEMOS_DATA_DIR "CH06-brick.frag";
++static char *VertProgFile = DEMOS_DATA_DIR "CH06-brick.vert";
+ 
+ /* program/shader objects */
+ static GLuint fragShader;
+diff --git a/src/glsl/bump.c b/src/glsl/bump.c
+index 59f62cd..3a1b20a 100644
+--- a/src/glsl/bump.c
++++ b/src/glsl/bump.c
+@@ -15,9 +15,9 @@
+ #include "readtex.h"
+ 
+ 
+-static char *FragProgFile = "CH11-bumpmap.frag";
+-static char *FragTexProgFile = "CH11-bumpmaptex.frag";
+-static char *VertProgFile = "CH11-bumpmap.vert";
++static char *FragProgFile = DEMOS_DATA_DIR "CH11-bumpmap.frag";
++static char *FragTexProgFile = DEMOS_DATA_DIR "CH11-bumpmaptex.frag";
++static char *VertProgFile = DEMOS_DATA_DIR "CH11-bumpmap.vert";
+ static char *TextureFile = DEMOS_DATA_DIR "tile.rgb";
+ 
+ /* program/shader objects */
+diff --git a/src/glsl/convolutions.c b/src/glsl/convolutions.c
+index a120cfe..9312f00 100644
+--- a/src/glsl/convolutions.c
++++ b/src/glsl/convolutions.c
+@@ -340,7 +340,7 @@ static void init(void)
+ 
+    menuInit();
+    readTexture(textureLocation);
+-   createProgram("convolution.vert", "convolution.frag");
++   createProgram(DEMOS_DATA_DIR "convolution.vert", DEMOS_DATA_DIR "convolution.frag");
+ 
+    glEnable(GL_TEXTURE_2D);
+    glClearColor(1.0, 1.0, 1.0, 1.0);
+diff --git a/src/glsl/mandelbrot.c b/src/glsl/mandelbrot.c
+index 31ede1d..ab34a0f 100644
+--- a/src/glsl/mandelbrot.c
++++ b/src/glsl/mandelbrot.c
+@@ -14,8 +14,8 @@
+ #include "shaderutil.h"
+ 
+ 
+-static char *FragProgFile = "CH18-mandel.frag";
+-static char *VertProgFile = "CH18-mandel.vert";
++static char *FragProgFile = DEMOS_DATA_DIR "CH18-mandel.frag";
++static char *VertProgFile = DEMOS_DATA_DIR "CH18-mandel.vert";
+ 
+ /* program/shader objects */
+ static GLuint fragShader;
+diff --git a/src/glsl/multitex.c b/src/glsl/multitex.c
+index 262ea50..546bd27 100644
+--- a/src/glsl/multitex.c
++++ b/src/glsl/multitex.c
+@@ -35,8 +35,8 @@
+ 
+ static const char *Demo = "multitex";
+ 
+-static const char *VertFile = "multitex.vert";
+-static const char *FragFile = "multitex.frag";
++static const char *VertFile = DEMOS_DATA_DIR "multitex.vert";
++static const char *FragFile = DEMOS_DATA_DIR "multitex.frag";
+ 
+ static const char *TexFiles[2] = 
+    {
+diff --git a/src/glsl/simplex-noise.c b/src/glsl/simplex-noise.c
+index 13fdd5d..885f01e 100644
+--- a/src/glsl/simplex-noise.c
++++ b/src/glsl/simplex-noise.c
+@@ -169,7 +169,7 @@ SpecialKey(int key, int x, int y)
+ static void
+ Init(void)
+ {
+-   const char *filename = "simplex-noise.glsl";
++   const char *filename = DEMOS_DATA_DIR "simplex-noise.glsl";
+    char noiseText[10000];
+    FILE *f;
+    int len;
+diff --git a/src/glsl/skinning.c b/src/glsl/skinning.c
+index bf38d77..536d475 100644
+--- a/src/glsl/skinning.c
++++ b/src/glsl/skinning.c
+@@ -20,8 +20,8 @@
+ #define M_PI 3.1415926535
+ #endif
+ 
+-static char *FragProgFile = "skinning.frag";
+-static char *VertProgFile = "skinning.vert";
++static char *FragProgFile = DEMOS_DATA_DIR "skinning.frag";
++static char *VertProgFile = DEMOS_DATA_DIR "skinning.vert";
+ 
+ /* program/shader objects */
+ static GLuint fragShader;
+diff --git a/src/glsl/texdemo1.c b/src/glsl/texdemo1.c
+index 6cde239..a082342 100644
+--- a/src/glsl/texdemo1.c
++++ b/src/glsl/texdemo1.c
+@@ -35,11 +35,11 @@
+ 
+ static const char *Demo = "texdemo1";
+ 
+-static const char *ReflectVertFile = "reflect.vert";
+-static const char *CubeFragFile = "cubemap.frag";
++static const char *ReflectVertFile = DEMOS_DATA_DIR "reflect.vert";
++static const char *CubeFragFile = DEMOS_DATA_DIR "cubemap.frag";
+ 
+-static const char *SimpleVertFile = "simple.vert";
+-static const char *SimpleTexFragFile = "shadowtex.frag";
++static const char *SimpleVertFile = DEMOS_DATA_DIR "simple.vert";
++static const char *SimpleTexFragFile = DEMOS_DATA_DIR "shadowtex.frag";
+ 
+ static const char *GroundImage = DEMOS_DATA_DIR "tile.rgb";
+ 
+diff --git a/src/glsl/toyball.c b/src/glsl/toyball.c
+index 5f27951..4e7e832 100644
+--- a/src/glsl/toyball.c
++++ b/src/glsl/toyball.c
+@@ -14,8 +14,8 @@
+ #include "shaderutil.h"
+ 
+ 
+-static char *FragProgFile = "CH11-toyball.frag";
+-static char *VertProgFile = "CH11-toyball.vert";
++static char *FragProgFile = DEMOS_DATA_DIR "CH11-toyball.frag";
++static char *VertProgFile = DEMOS_DATA_DIR "CH11-toyball.vert";
+ 
+ /* program/shader objects */
+ static GLuint fragShader;
+diff --git a/src/objviewer/objview.c b/src/objviewer/objview.c
+index 6def726..78a6acf 100644
+--- a/src/objviewer/objview.c
++++ b/src/objviewer/objview.c
+@@ -162,12 +162,12 @@ init_model(void)
+ static void
+ init_skybox(void)
+ {
+-   SkyboxTex = LoadSkyBoxCubeTexture("alpine_east.rgb",
+-                                     "alpine_west.rgb",
+-                                     "alpine_up.rgb",
+-                                     "alpine_down.rgb",
+-                                     "alpine_south.rgb",
+-                                     "alpine_north.rgb");
++   SkyboxTex = LoadSkyBoxCubeTexture(DEMOS_DATA_DIR "alpine_east.rgb",
++                                     DEMOS_DATA_DIR "alpine_west.rgb",
++                                     DEMOS_DATA_DIR "alpine_up.rgb",
++                                     DEMOS_DATA_DIR "alpine_down.rgb",
++                                     DEMOS_DATA_DIR "alpine_south.rgb",
++                                     DEMOS_DATA_DIR "alpine_north.rgb");
+    glmSpecularTexture(Model, SkyboxTex);
+ }
+ 
+diff --git a/src/perf/glslstateschange.c b/src/perf/glslstateschange.c
+index 7422b78..dbf8332 100644
+--- a/src/perf/glslstateschange.c
++++ b/src/perf/glslstateschange.c
+@@ -33,10 +33,10 @@
+ #include "glmain.h"
+ #include "common.h"
+ 
+-static const char *VertFile1 = "glslstateschange1.vert";
+-static const char *FragFile1 = "glslstateschange1.frag";
+-static const char *VertFile2 = "glslstateschange2.vert";
+-static const char *FragFile2 = "glslstateschange2.frag";
++static const char *VertFile1 = DEMOS_DATA_DIR "glslstateschange1.vert";
++static const char *FragFile1 = DEMOS_DATA_DIR "glslstateschange1.frag";
++static const char *VertFile2 = DEMOS_DATA_DIR "glslstateschange2.vert";
++static const char *FragFile2 = DEMOS_DATA_DIR "glslstateschange2.frag";
+ static struct uniform_info Uniforms1[] = {
+    { "tex1",  1, GL_SAMPLER_2D, { 0, 0, 0, 0 }, -1 },
+    { "tex2",  1, GL_SAMPLER_2D, { 1, 0, 0, 0 }, -1 },
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
index 469b8ca..f95b0a3 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
@@ -15,7 +15,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
         file://glut.patch \
         file://egl-mesa-screen-surface-build-fix.patch \
         file://egl-mesa-screen-surface-query.patch \
-        file://0001-mesa-demos-Add-missing-data-files.patch"
+        file://0001-mesa-demos-Add-missing-data-files.patch \
+        file://0001-mesa-demos-Use-DEMOS_DATA_DIR-to-locate-data-files.patch"
 
 SRC_URI[md5sum] = "9df33ba69a26bbfbc7c8148602e59542"
 SRC_URI[sha256sum] = "9703fa0646b32a1e68d2abf5628f936f77bf97c69ffcaac90de380820a87a828"
-- 
1.9.1


