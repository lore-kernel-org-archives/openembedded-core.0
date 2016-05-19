Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF8760851
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 11:27:16 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1b3M6m-0003vd-Qv from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2016 04:27:17 -0700
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Thu, 19 May 2016 12:27:15 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 May 2016 16:26:59 +0500
Message-ID: <1463657219-580-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mesa-demos: provide option for disabling GLX demos
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
X-List-Received-Date: Thu, 19 May 2016 11:27:19 -0000
Content-Type: text/plain

There are platforms that default to EGL only configurations
in which case the GLX applications are not required
at all. Allow the user to control generation of these
demos as needed through a configure switch.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 .../0013-only-build-GLX-demos-if-needed.patch      | 62 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |  4 +-
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0013-only-build-GLX-demos-if-needed.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0013-only-build-GLX-demos-if-needed.patch b/meta/recipes-graphics/mesa/mesa-demos/0013-only-build-GLX-demos-if-needed.patch
new file mode 100644
index 0000000..e7be4df
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0013-only-build-GLX-demos-if-needed.patch
@@ -0,0 +1,62 @@
+From 322af294390a7f4e1524c5a79312be6cbebce988 Mon Sep 17 00:00:00 2001
+From: Awais Belal <awais_belal@mentor.com>
+Date: Wed, 11 Nov 2015 17:22:12 +0500
+Subject: [PATCH] only build GLX demos if needed
+
+There are platforms that default to EGL only configurations
+in which case the GLX applications are not required
+at all. Allow the user to control generation of these
+demos as needed through a configure switch.
+
+Signed-off-by: Awais Belal <awais_belal@mentor.com>
+Upstream-Status: Pending
+---
+ configure.ac    | 9 +++++++++
+ src/Makefile.am | 6 +++++-
+ 2 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f8ec7e3..1a4d96d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -132,6 +132,11 @@ if test "x$enable_glu" = xyes; then
+     DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
+ fi
+ 
++AC_ARG_ENABLE([glx-demos],
++    [AS_HELP_STRING([--enable-glx-demos],
++        [enable GLX demos @<:@default=auto@:>@])],
++    [glx_demos_enabled="$enableval"],
++    [glx_demos_enabled=yes])
+ AC_ARG_ENABLE([egl],
+     [AS_HELP_STRING([--enable-egl],
+         [enable EGL library @<:@default=auto@:>@])],
+@@ -325,6 +333,7 @@ AC_SUBST([WAYLAND_LIBS])
+ 
+ AM_CONDITIONAL(HAVE_GLU, test "x$glu_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_GLEW, test "x$glew_enabled" = "xyes")
++AM_CONDITIONAL(HAVE_GLX, test "x$glx_demos_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_EGL, test "x$egl_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_GLESV1, test "x$glesv1_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_GLESV2, test "x$glesv2_enabled" = "xyes")
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 8b89dee..a4d7e8f 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -44,8 +44,12 @@ SUBDIRS = \
+ 	slang \
+ 	tests \
+ 	tools \
+-	wgl \
++	wgl
++
++if HAVE_GLX
++SUBDIRS += \
+ 	xdemos
++endif
+ 
+ if HAVE_GLEW
+ SUBDIRS += \
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
index 034e01d..53bd5e2 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
     file://0010-sharedtex_mt-fix-rendering-thread-hang.patch \
     file://0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch \
     file://0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch \
+    file://0013-only-build-GLX-demos-if-needed.patch \
 "
 SRC_URI[md5sum] = "72613a2c8c013716db02e3ff59d29061"
 SRC_URI[sha256sum] = "e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a9774d0952f90ba92"
@@ -31,7 +32,7 @@ inherit autotools pkgconfig distro_features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 \
-                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glew glu', '', d)}"
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glew glu glx', '', d)}"
 
 # The Wayland code doesn't work with Wayland 1.0, so disable it for now
 #${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
@@ -51,6 +52,7 @@ PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayla
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11"
 PACKAGECONFIG[glew] = "--enable-glew,--disable-glew,glew"
 PACKAGECONFIG[glu] = "--enable-glu,--disable-glu,virtual/libgl"
+PACKAGECONFIG[glx] = "--enable-glx-demos,--disable-glx-demos"
 
 do_install_append() {
 	# it can be completely empty when all PACKAGECONFIG options are disabled
-- 
1.9.1


