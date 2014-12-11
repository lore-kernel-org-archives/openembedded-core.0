Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id AA59D713A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 15:36:17 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1Xz5ms-00062O-Kz from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Dec 2014 07:36:18 -0800
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server id 14.3.181.6; Thu, 11 Dec 2014 07:36:18 -0800
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Dec 2014 10:36:14 -0500
Message-ID: <1418312174-23854-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mesa-demos: Fix building demos which require GLU.
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
X-List-Received-Date: Thu, 11 Dec 2014 15:36:19 -0000
Content-Type: text/plain

Reverse the sense of the conditional to test for GLU
support when built with "--enable-glu".

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 ...figure-Allow-to-disable-demos-which-require-GLEW-.patch | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
index 4b07193..b25f5ce 100644
--- a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
+++ b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
@@ -10,20 +10,21 @@ Subject: [PATCH 3/9] configure: Allow to disable demos which require GLEW or
 Upstream-Status: Pending
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
 ---
- configure.ac                  | 49 ++++++++++++++++++++---------
- src/Makefile.am               | 14 ++++++---
+ configure.ac                  | 50 ++++++++++++++++++++---------
+ src/Makefile.am               | 18 ++++++++---
  src/demos/Makefile.am         | 73 ++++++++++++++++++++++++-------------------
  src/egl/Makefile.am           |  8 +++--
  src/egl/opengles1/Makefile.am | 44 +++++++++++++++-----------
  src/egl/opengles2/Makefile.am | 33 ++++++++++---------
- 6 files changed, 135 insertions(+), 86 deletions(-)
+ 6 files changed, 140 insertions(+), 86 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
 index 9445424..bc4c8d1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -93,25 +93,44 @@ AC_EGREP_HEADER([glutInitContextProfile],
+@@ -89,25 +89,45 @@ AC_EGREP_HEADER([glutInitContextProfile],
  		[AC_DEFINE(HAVE_FREEGLUT)],
  		[])
  
@@ -66,7 +67,7 @@ index 9445424..bc4c8d1 100644
 -DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
 -DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
 +if test "x$enable_glu" = xyes; then
-+    PKG_CHECK_MODULES(GLU, [glu], [],
++    PKG_CHECK_MODULES(GLU, [glu],
 +                     [AC_CHECK_HEADER([GL/glu.h],
 +                                      [],
 +                                      AC_MSG_ERROR([GLU not found]))
@@ -74,7 +75,8 @@ index 9445424..bc4c8d1 100644
 +                                   [gluBeginCurve],
 +                                   [GLU_LIBS=-lGLU
 +				    glu_enabled=yes],
-+                                   AC_MSG_ERROR([GLU required])) ])
++                                   AC_MSG_ERROR([GLU required])) ],
++                      [])
 +
 +    DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
 +    DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
-- 
1.9.1


