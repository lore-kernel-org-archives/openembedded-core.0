Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1URtGZ-0008Cv-MI
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 01:56:56 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 01:39:17 +0200
Message-Id: <1366069157-3166-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] mesa: don't fail if x11 isn't available
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 23:56:58 -0000

Patches backported from mesa Git and from mesa-dev mailing list.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/mesa/mesa-9.0.2.inc          |    2 ++
 .../mesa/dont-fail-if-libX11-isnt-installed.patch  |   36 ++++++++++++++++++++
 .../fix-egl-compilation-without-x11-headers.patch  |   32 +++++++++++++++++
 meta/recipes-graphics/mesa/mesa_9.0.2.bb           |    2 +-
 4 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch

diff --git a/meta/recipes-graphics/mesa/mesa-9.0.2.inc b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
index bed432c..b88bc42 100644
--- a/meta/recipes-graphics/mesa/mesa-9.0.2.inc
+++ b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
@@ -1,6 +1,8 @@
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0002-cross-compile.patch \
            file://cross-glsl.patch \
+           file://dont-fail-if-libX11-isnt-installed.patch \
+           file://fix-egl-compilation-without-x11-headers.patch \
            "
 
 SRC_URI[md5sum] = "dc45d1192203e418163e0017640e1cfc"
diff --git a/meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch b/meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
new file mode 100644
index 0000000..80735a6
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Backport
+
+From d6b06474f69129eb41ecd85d6b3bb0eb7b9dccb3 Mon Sep 17 00:00:00 2001
+From: Daniel Stone <daniel@fooishbar.org>
+Date: Tue, 9 Oct 2012 14:27:06 +1100
+Subject: [PATCH] build: Don't fail if libX11 isn't installed
+
+configure.ac would previously refuse to complete if libX11 wasn't
+installed, even if we'd disabled GLX and weren't building an X11 EGL
+platform.  Make the check simply set the no_x variable that's used (but
+never set) immediately below for what looks like this very case.
+
+Signed-off-by: Daniel Stone <daniel@fooishbar.org>
+Reviewed-by: Matt Turner <mattst88@gmail.com>
+Reviewed-by: Dan Nicholson <dbn.lists@gmail.com>
+(cherry picked from commit 4004620d34a580c8fdb965d9b640e97453fc8b28)
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index eb273b9..b384b44 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -836,7 +836,7 @@ if test "x$enable_dri" = xyes; then
+ fi
+ 
+ dnl Find out if X is available.
+-PKG_CHECK_MODULES([X11], [x11])
++PKG_CHECK_MODULES([X11], [x11], [no_x=no], [no_x=yes])
+ 
+ dnl Try to tell the user that the --x-* options are only used when
+ dnl pkg-config is not available. This must be right after AC_PATH_XTRA.
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch b/meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch
new file mode 100644
index 0000000..6436b59
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Submitted
+
+Picked from mesa-dev mailing list: http://marc.info/?l=mesa3d-dev&m=133053004130468
+
+From: Benjamin Franzke <benjaminfranzke@googlemail.com>
+Date: Wed, 29 Feb 2012 15:36:23 +0100
+Subject: [PATCH] configure: Fix egl compilation without x11 headers
+
+We dont want eglplatform.h to typedef egl native types
+to x11 types, when x11 headers are not available.
+---
+ configure.ac |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index b384b44..8eb8459 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1262,6 +1262,10 @@ if test "x$enable_egl" = xyes; then
+ 
+     AC_CHECK_FUNC(mincore, [DEFINES="$DEFINES -DHAVE_MINCORE"])
+ 
++    if test "$have_x" != yes; then
++        DEFINES="$DEFINES -DMESA_EGL_NO_X11_HEADERS"
++    fi
++
+     if test "$enable_static" != yes; then
+         # build egl_glx when libGL is built
+         if test "x$enable_glx" = xyes; then
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/mesa/mesa_9.0.2.bb b/meta/recipes-graphics/mesa/mesa_9.0.2.bb
index 1a1bf24..6671f99 100644
--- a/meta/recipes-graphics/mesa/mesa_9.0.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.0.2.bb
@@ -1,4 +1,4 @@
 require mesa-common.inc
 require mesa-${PV}.inc
 require mesa.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
-- 
1.7.10.4



