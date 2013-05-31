Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id BDEBC60959
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 10:53:08 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id w62so1116648wes.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 03:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=tDk39x6AJdbqgX5s6DSQ41Gg8SjVj5SFuNcMGkdEFiA=;
	b=C1R7TpXhIlJwwBUVo/9Zf1Ug3SpJpWvqblmG8wOosIDSb1JL5rXRkSeegTguj/ynMv
	uoKYWpA+n59PdIFhQnFr84ZHXFIzn1sqpyjd6EFg9WnWozY4LObvGgC3Wde/UgF2z9u5
	5lo8Z7viLcI8+zWskfS9Il6vMp6NV0O/2xkJk/ZVkDtRPXNLCgSwhh4aoZmUM+2BjsvG
	BMw7hQ1l96kHVq37PvtOLb8P6bBPCcBMagaatnO7stxs55mMtoXWeTcTVvnKROKfuq35
	PYN2gg3iw8IP5IMiPgPn06lpTsNKD6IDKJiRoXuyr4XUacATwNI5+2nifz9yyEp74suM
	xeXQ==
X-Received: by 10.180.20.208 with SMTP id p16mr2634424wie.59.1369997588714;
	Fri, 31 May 2013 03:53:08 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id cw8sm3068766wib.7.2013.05.31.03.53.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 03:53:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 11:49:50 +0100
Message-Id: <1369997391-28957-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQkqoYX7sXEPk/KwQjfwzwoGP31G2DoNtX0GKrYk+CAuwM7XCkV/TiqlIRhREsLhLla1JYk/
Subject: [PATCH 1/2] mesa: upgrade to 9.1.3
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
X-List-Received-Date: Fri, 31 May 2013 10:53:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Merge mesa-PV.bb and mesa-PV.inc as the is no point to the split now we're only
building one variant of Mesa.

Drop 0002-cross-compile.patch isn't needed as libtool is used instead of mklib.
However, as libtool is used instead of mklib add fix-glsl-cross.patch to work
around build failures caused by the cross libtool being used to build host
binaries.

Add EGL-Mutate-NativeDisplayType-depending-on-config.patch to build correctly in
a non-X11 environment.

Drop dont-fail-if-libX11-isnt-installed.patch and
fix-egl-compilation-without-x11-headers.patch as they were backports.

license.html had some formatting and typo fixes, update the checksum.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-9.0.2.inc          |   13 -
 .../mesa/mesa/0002-cross-compile.patch             |   94 ---
 ...ate-NativeDisplayType-depending-on-config.patch |  358 +++++++++++
 meta/recipes-graphics/mesa/mesa/cross-glsl.patch   |  632 --------------------
 .../mesa/dont-fail-if-libX11-isnt-installed.patch  |   36 --
 .../fix-egl-compilation-without-x11-headers.patch  |   32 -
 .../mesa/mesa/fix-glsl-cross.patch                 |   43 ++
 meta/recipes-graphics/mesa/mesa_9.0.2.bb           |    4 -
 meta/recipes-graphics/mesa/mesa_9.1.3.bb           |   14 +
 9 files changed, 415 insertions(+), 811 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-9.0.2.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/cross-glsl.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa_9.0.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_9.1.3.bb

diff --git a/meta/recipes-graphics/mesa/mesa-9.0.2.inc b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
deleted file mode 100644
index b88bc42..0000000
--- a/meta/recipes-graphics/mesa/mesa-9.0.2.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
-           file://0002-cross-compile.patch \
-           file://cross-glsl.patch \
-           file://dont-fail-if-libX11-isnt-installed.patch \
-           file://fix-egl-compilation-without-x11-headers.patch \
-           "
-
-SRC_URI[md5sum] = "dc45d1192203e418163e0017640e1cfc"
-SRC_URI[sha256sum] = "75bf31f26c6e7b5515e610c1005fd1be1f7eeb2c9e6859848dab879c355ad64e"
-
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=012f69938d81b766472fd0d240df38a4"
-
-S = "${WORKDIR}/Mesa-${PV}"
diff --git a/meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch b/meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
deleted file mode 100644
index dc8e994..0000000
--- a/meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-cross compile
-
-This patch is ported from WindRiver linux and to fix cross compile
-failure.
-
-And original commits are:
-commit 8d5ccc8113e1b51b0529a00c18a4aba956247e1b
-commit 5c4212084b871a0c0fb7d174280ec9a634637deb
-
-Upstream-Status: Pending
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
----
- bin/mklib |   24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/bin/mklib b/bin/mklib
-index 9bac29e..b33aa90 100755
---- a/bin/mklib
-+++ b/bin/mklib
-@@ -49,8 +49,8 @@ expand_archives() {
-                     /*) ;;
-                     *)  FILE="$ORIG_DIR/$FILE" ;;
-                 esac
--                MEMBERS=`ar t $FILE`
--                ar x $FILE
-+                MEMBERS=`${AR} t $FILE`
-+                ${AR} x $FILE
-                 for MEMBER in $MEMBERS ; do
-                     NEWFILES="$NEWFILES $DIR/$MEMBER"
-                 done
-@@ -77,7 +77,7 @@ expand_archives() {
- make_ar_static_lib() {
-     OPTS=$1
-     shift;
--    RANLIB=$1
-+    USE_RANLIB=$1
-     shift;
-     LIBNAME=$1
-     shift;
-@@ -87,11 +87,11 @@ make_ar_static_lib() {
-     rm -f ${LIBNAME}
- 
-     # make static lib
--    ar ${OPTS} ${LIBNAME} ${OBJECTS}
-+    ${AR} ${OPTS} ${LIBNAME} ${OBJECTS}
- 
-     # run ranlib
--    if [ ${RANLIB} = 1 ] ; then
--        ranlib ${LIBNAME}
-+    if [ ${USE_RANLIB} = 1 ] ; then
-+        ${RANLIB} ${LIBNAME}
-     fi
- 
-     echo ${LIBNAME}
-@@ -313,9 +313,9 @@ case $ARCH in
- 	if [ "x$LINK" = "x" ] ; then
- 	    # -linker was not specified so set default link command now
-             if [ $CPLUSPLUS = 1 ] ; then
--                LINK=g++
-+                LINK=$CXX
-             else
--                LINK=gcc
-+                LINK=$CC
-             fi
- 	fi
- 
-@@ -535,9 +535,9 @@ case $ARCH in
- 	if [ "x$LINK" = "x" ] ; then
- 	    # -linker was not specified so set default link command now
-             if [ $CPLUSPLUS = 1 ] ; then
--                LINK=g++
-+                LINK=$CXX
-             else
--                LINK=gcc
-+                LINK=$CC
-             fi
- 	fi
- 
-@@ -903,9 +903,9 @@ case $ARCH in
- 	if [ "x$LINK" = "x" ] ; then
- 	    # -linker was not specified so set default link command now
-             if [ $CPLUSPLUS = 1 ] ; then
--                LINK=g++
-+                LINK=${CXX}
-             else
--                LINK=gcc
-+                LINK=${CC}
-             fi
- 	fi
- 
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
new file mode 100644
index 0000000..47ba167
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
@@ -0,0 +1,358 @@
+From d52a7ec5dcdf3936bd727b854831efb90acfd2ba Mon Sep 17 00:00:00 2001
+From: Daniel Stone <daniel@fooishbar.org>
+Date: Fri, 24 May 2013 17:20:27 +0100
+Subject: [PATCH] EGL: Mutate NativeDisplayType depending on config
+
+If we go through ./configure without enabling X11 anywhere, then set the
+fallback types for EGL NativeDisplay and friends, rather than assuming
+X11/Xlib.
+
+Signed-off-by: Daniel Stone <daniel@fooishbar.org>
+---
+ configure.ac                 |    9 +++
+ include/EGL/eglplatform.h    |  146 ------------------------------------------
+ include/EGL/eglplatform.h.in |  146 ++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 155 insertions(+), 146 deletions(-)
+ delete mode 100644 include/EGL/eglplatform.h
+ create mode 100644 include/EGL/eglplatform.h.in
+
+diff --git a/configure.ac b/configure.ac
+index 4a98996..6fa77da 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1576,12 +1576,20 @@ fi
+ 
+ EGL_PLATFORMS="$egl_platforms"
+ 
++if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
++    MESA_EGL_NO_X11_HEADERS=0
++else
++    MESA_EGL_NO_X11_HEADERS=1
++fi
++
+ AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1)
+ AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" | grep 'wayland' >/dev/null 2>&1)
+ AM_CONDITIONAL(HAVE_EGL_PLATFORM_DRM, echo "$egl_platforms" | grep 'drm' >/dev/null 2>&1)
+ AM_CONDITIONAL(HAVE_EGL_PLATFORM_FBDEV, echo "$egl_platforms" | grep 'fbdev' >/dev/null 2>&1)
+ AM_CONDITIONAL(HAVE_EGL_PLATFORM_NULL, echo "$egl_platforms" | grep 'null' >/dev/null 2>&1)
+ 
++AC_SUBST([MESA_EGL_NO_X11_HEADERS])
++
+ AM_CONDITIONAL(HAVE_EGL_DRIVER_DRI2, test "x$HAVE_EGL_DRIVER_DRI2" != "x")
+ AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" != "x")
+ 
+@@ -2053,6 +2061,7 @@ CXXFLAGS="$CXXFLAGS $USER_CXXFLAGS"
+ 
+ dnl Substitute the config
+ AC_CONFIG_FILES([Makefile
++                include/EGL/eglplatform.h
+ 		src/Makefile
+ 		src/egl/Makefile
+ 		src/egl/drivers/Makefile
+diff --git a/include/EGL/eglplatform.h b/include/EGL/eglplatform.h
+deleted file mode 100644
+index 17fdc61..0000000
+--- a/include/EGL/eglplatform.h
++++ /dev/null
+@@ -1,146 +0,0 @@
+-#ifndef __eglplatform_h_
+-#define __eglplatform_h_
+-
+-/*
+-** Copyright (c) 2007-2009 The Khronos Group Inc.
+-**
+-** Permission is hereby granted, free of charge, to any person obtaining a
+-** copy of this software and/or associated documentation files (the
+-** "Materials"), to deal in the Materials without restriction, including
+-** without limitation the rights to use, copy, modify, merge, publish,
+-** distribute, sublicense, and/or sell copies of the Materials, and to
+-** permit persons to whom the Materials are furnished to do so, subject to
+-** the following conditions:
+-**
+-** The above copyright notice and this permission notice shall be included
+-** in all copies or substantial portions of the Materials.
+-**
+-** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+-** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+-** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+-** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+-** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
+-** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+-** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
+-*/
+-
+-/* Platform-specific types and definitions for egl.h
+- * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
+- *
+- * Adopters may modify khrplatform.h and this file to suit their platform.
+- * You are encouraged to submit all modifications to the Khronos group so that
+- * they can be included in future versions of this file.  Please submit changes
+- * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
+- * by filing a bug against product "EGL" component "Registry".
+- */
+-
+-#include <KHR/khrplatform.h>
+-
+-/* Macros used in EGL function prototype declarations.
+- *
+- * EGL functions should be prototyped as:
+- *
+- * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
+- * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
+- *
+- * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
+- */
+-
+-#ifndef EGLAPI
+-#define EGLAPI KHRONOS_APICALL
+-#endif
+-
+-#ifndef EGLAPIENTRY
+-#define EGLAPIENTRY  KHRONOS_APIENTRY
+-#endif
+-#define EGLAPIENTRYP EGLAPIENTRY*
+-
+-/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
+- * are aliases of window-system-dependent types, such as X Display * or
+- * Windows Device Context. They must be defined in platform-specific
+- * code below. The EGL-prefixed versions of Native*Type are the same
+- * types, renamed in EGL 1.3 so all types in the API start with "EGL".
+- *
+- * Khronos STRONGLY RECOMMENDS that you use the default definitions
+- * provided below, since these changes affect both binary and source
+- * portability of applications using EGL running on different EGL
+- * implementations.
+- */
+-
+-#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
+-#ifndef WIN32_LEAN_AND_MEAN
+-#define WIN32_LEAN_AND_MEAN 1
+-#endif
+-#include <windows.h>
+-
+-typedef HDC     EGLNativeDisplayType;
+-typedef HBITMAP EGLNativePixmapType;
+-typedef HWND    EGLNativeWindowType;
+-
+-#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
+-
+-typedef int   EGLNativeDisplayType;
+-typedef void *EGLNativeWindowType;
+-typedef void *EGLNativePixmapType;
+-
+-#elif defined(WL_EGL_PLATFORM)
+-
+-typedef struct wl_display     *EGLNativeDisplayType;
+-typedef struct wl_egl_pixmap  *EGLNativePixmapType;
+-typedef struct wl_egl_window  *EGLNativeWindowType;
+-
+-#elif defined(__GBM__)
+-
+-typedef struct gbm_device  *EGLNativeDisplayType;
+-typedef struct gbm_bo      *EGLNativePixmapType;
+-typedef void               *EGLNativeWindowType;
+-
+-#elif defined(ANDROID) /* Android */
+-
+-struct ANativeWindow;
+-struct egl_native_pixmap_t;
+-
+-typedef struct ANativeWindow        *EGLNativeWindowType;
+-typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
+-typedef void                        *EGLNativeDisplayType;
+-
+-#elif defined(__unix__)
+-
+-#ifdef MESA_EGL_NO_X11_HEADERS
+-
+-typedef void            *EGLNativeDisplayType;
+-typedef khronos_uint32_t EGLNativePixmapType;
+-typedef khronos_uint32_t EGLNativeWindowType;
+-
+-#else
+-
+-/* X11 (tentative)  */
+-#include <X11/Xlib.h>
+-#include <X11/Xutil.h>
+-
+-typedef Display *EGLNativeDisplayType;
+-typedef Pixmap   EGLNativePixmapType;
+-typedef Window   EGLNativeWindowType;
+-
+-#endif /* MESA_EGL_NO_X11_HEADERS */
+-
+-#else
+-#error "Platform not recognized"
+-#endif
+-
+-/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
+-typedef EGLNativeDisplayType NativeDisplayType;
+-typedef EGLNativePixmapType  NativePixmapType;
+-typedef EGLNativeWindowType  NativeWindowType;
+-
+-
+-/* Define EGLint. This must be a signed integral type large enough to contain
+- * all legal attribute names and values passed into and out of EGL, whether
+- * their type is boolean, bitmask, enumerant (symbolic constant), integer,
+- * handle, or other.  While in general a 32-bit integer will suffice, if
+- * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
+- * integer type.
+- */
+-typedef khronos_int32_t EGLint;
+-
+-#endif /* __eglplatform_h */
+diff --git a/include/EGL/eglplatform.h.in b/include/EGL/eglplatform.h.in
+new file mode 100644
+index 0000000..5126c92
+--- /dev/null
++++ b/include/EGL/eglplatform.h.in
+@@ -0,0 +1,146 @@
++#ifndef __eglplatform_h_
++#define __eglplatform_h_
++
++/*
++** Copyright (c) 2007-2009 The Khronos Group Inc.
++**
++** Permission is hereby granted, free of charge, to any person obtaining a
++** copy of this software and/or associated documentation files (the
++** "Materials"), to deal in the Materials without restriction, including
++** without limitation the rights to use, copy, modify, merge, publish,
++** distribute, sublicense, and/or sell copies of the Materials, and to
++** permit persons to whom the Materials are furnished to do so, subject to
++** the following conditions:
++**
++** The above copyright notice and this permission notice shall be included
++** in all copies or substantial portions of the Materials.
++**
++** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
++*/
++
++/* Platform-specific types and definitions for egl.h
++ * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
++ *
++ * Adopters may modify khrplatform.h and this file to suit their platform.
++ * You are encouraged to submit all modifications to the Khronos group so that
++ * they can be included in future versions of this file.  Please submit changes
++ * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
++ * by filing a bug against product "EGL" component "Registry".
++ */
++
++#include <KHR/khrplatform.h>
++
++/* Macros used in EGL function prototype declarations.
++ *
++ * EGL functions should be prototyped as:
++ *
++ * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
++ * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
++ *
++ * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
++ */
++
++#ifndef EGLAPI
++#define EGLAPI KHRONOS_APICALL
++#endif
++
++#ifndef EGLAPIENTRY
++#define EGLAPIENTRY  KHRONOS_APIENTRY
++#endif
++#define EGLAPIENTRYP EGLAPIENTRY*
++
++/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
++ * are aliases of window-system-dependent types, such as X Display * or
++ * Windows Device Context. They must be defined in platform-specific
++ * code below. The EGL-prefixed versions of Native*Type are the same
++ * types, renamed in EGL 1.3 so all types in the API start with "EGL".
++ *
++ * Khronos STRONGLY RECOMMENDS that you use the default definitions
++ * provided below, since these changes affect both binary and source
++ * portability of applications using EGL running on different EGL
++ * implementations.
++ */
++
++#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
++#ifndef WIN32_LEAN_AND_MEAN
++#define WIN32_LEAN_AND_MEAN 1
++#endif
++#include <windows.h>
++
++typedef HDC     EGLNativeDisplayType;
++typedef HBITMAP EGLNativePixmapType;
++typedef HWND    EGLNativeWindowType;
++
++#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
++
++typedef int   EGLNativeDisplayType;
++typedef void *EGLNativeWindowType;
++typedef void *EGLNativePixmapType;
++
++#elif defined(WL_EGL_PLATFORM)
++
++typedef struct wl_display     *EGLNativeDisplayType;
++typedef struct wl_egl_pixmap  *EGLNativePixmapType;
++typedef struct wl_egl_window  *EGLNativeWindowType;
++
++#elif defined(__GBM__)
++
++typedef struct gbm_device  *EGLNativeDisplayType;
++typedef struct gbm_bo      *EGLNativePixmapType;
++typedef void               *EGLNativeWindowType;
++
++#elif defined(ANDROID) /* Android */
++
++struct ANativeWindow;
++struct egl_native_pixmap_t;
++
++typedef struct ANativeWindow        *EGLNativeWindowType;
++typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
++typedef void                        *EGLNativeDisplayType;
++
++#elif defined(__unix__)
++
++#if @MESA_EGL_NO_X11_HEADERS@
++
++typedef void            *EGLNativeDisplayType;
++typedef khronos_uint32_t EGLNativePixmapType;
++typedef khronos_uint32_t EGLNativeWindowType;
++
++#else
++
++/* X11 (tentative)  */
++#include <X11/Xlib.h>
++#include <X11/Xutil.h>
++
++typedef Display *EGLNativeDisplayType;
++typedef Pixmap   EGLNativePixmapType;
++typedef Window   EGLNativeWindowType;
++
++#endif /* MESA_EGL_NO_X11_HEADERS */
++
++#else
++#error "Platform not recognized"
++#endif
++
++/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
++typedef EGLNativeDisplayType NativeDisplayType;
++typedef EGLNativePixmapType  NativePixmapType;
++typedef EGLNativeWindowType  NativeWindowType;
++
++
++/* Define EGLint. This must be a signed integral type large enough to contain
++ * all legal attribute names and values passed into and out of EGL, whether
++ * their type is boolean, bitmask, enumerant (symbolic constant), integer,
++ * handle, or other.  While in general a 32-bit integer will suffice, if
++ * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
++ * integer type.
++ */
++typedef khronos_int32_t EGLint;
++
++#endif /* __eglplatform_h */
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/mesa/mesa/cross-glsl.patch b/meta/recipes-graphics/mesa/mesa/cross-glsl.patch
deleted file mode 100644
index 2e79297..0000000
--- a/meta/recipes-graphics/mesa/mesa/cross-glsl.patch
+++ /dev/null
@@ -1,632 +0,0 @@
-Respect CC_FOR_BUILD when building glsl_compiler, so we don't need a
-mesa-dri-glsl-native anymore.
-
-Upstream-Status: Backport (from master)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index b46f897..3765cd3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -10,7 +10,7 @@ AC_INIT([Mesa], [9.0.1],
-     [https://bugs.freedesktop.org/enter_bug.cgi?product=Mesa])
- AC_CONFIG_AUX_DIR([bin])
- AC_CONFIG_MACRO_DIR([m4])
--AC_CANONICAL_HOST
-+AC_CANONICAL_SYSTEM
- AM_INIT_AUTOMAKE([foreign])
- 
- dnl http://people.gnome.org/~walters/docs/build-api.txt
-@@ -24,9 +24,6 @@ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
- m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
- 
--LT_PREREQ([2.2])
--LT_INIT([disable-static])
--
- dnl Set internal versions
- OSMESA_VERSION=8
- AC_SUBST([OSMESA_VERSION])
-@@ -45,7 +42,9 @@ LIBKMS_XORG_REQUIRED=1.0.0
- dnl Check for progs
- AC_PROG_CPP
- AC_PROG_CC
-+AX_PROG_CC_FOR_BUILD
- AC_PROG_CXX
-+AX_PROG_CXX_FOR_BUILD
- AM_PROG_CC_C_O
- AM_PROG_AS
- AC_CHECK_PROGS([MAKE], [gmake make])
-@@ -54,6 +53,9 @@ AC_PROG_SED
- AC_PROG_MKDIR_P
- AC_PATH_PROG([MKDEP], [makedepend])
- 
-+LT_PREREQ([2.2])
-+LT_INIT([disable-static])
-+
- if test "x$MKDEP" = "x"; then
-     AC_MSG_ERROR([makedepend is required to build Mesa])
- fi
-@@ -155,6 +157,21 @@ dnl Cache LDFLAGS and CPPFLAGS so we can add to them and restore later
- _SAVE_LDFLAGS="$LDFLAGS"
- _SAVE_CPPFLAGS="$CPPFLAGS"
- 
-+dnl build host compiler macros
-+DEFINES_FOR_BUILD=""
-+AC_SUBST([DEFINES_FOR_BUILD])
-+case "$build_os" in
-+linux*|*-gnu*|gnu*)
-+    DEFINES_FOR_BUILD="$DEFINES_FOR_BUILD -D_GNU_SOURCE"
-+    ;;
-+solaris*)
-+    DEFINES_FOR_BUILD="$DEFINES_FOR_BUILD -DSVR4"
-+    ;;
-+cygwin*)
-+    DEFINES_FOR_BUILD="$DEFINES_FOR_BUILD"
-+    ;;
-+esac
-+
- dnl Compiler macros
- DEFINES=""
- AC_SUBST([DEFINES])
-@@ -172,6 +189,7 @@ esac
- 
- dnl Add flags for gcc and g++
- if test "x$GCC" = xyes; then
-+    CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD -Wall -std=c99"
-     CFLAGS="$CFLAGS -Wall -std=c99"
- 
-     # Enable -Werror=implicit-function-declaration and
-@@ -199,13 +217,16 @@ if test "x$GCC" = xyes; then
-     CFLAGS=$save_CFLAGS
- 
-     # Work around aliasing bugs - developers should comment this out
-+    CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD -fno-strict-aliasing"
-     CFLAGS="$CFLAGS -fno-strict-aliasing"
- 
-     # gcc's builtin memcmp is slower than glibc's
-     # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43052
-+    CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD -fno-builtin-memcmp"
-     CFLAGS="$CFLAGS -fno-builtin-memcmp"
- fi
- if test "x$GXX" = xyes; then
-+    CXXFLAGS_FOR_BUILD="$CXXFLAGS_FOR_BUILD -Wall"
-     CXXFLAGS="$CXXFLAGS -Wall"
- 
-     # Enable -fvisibility=hidden if using a gcc that supports it
-@@ -222,10 +243,12 @@ if test "x$GXX" = xyes; then
-     CXXFLAGS=$save_CXXFLAGS
- 
-     # Work around aliasing bugs - developers should comment this out
-+    CXXFLAGS_FOR_BUILD="$CXXFLAGS_FOR_BUILD -fno-strict-aliasing"
-     CXXFLAGS="$CXXFLAGS -fno-strict-aliasing"
- 
-     # gcc's builtin memcmp is slower than glibc's
-     # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43052
-+    CXXFLAGS_FOR_BUILD="$CXXFLAGS_FOR_BUILD -fno-builtin-memcmp"
-     CXXFLAGS="$CXXFLAGS -fno-builtin-memcmp"
- fi
- 
-@@ -309,6 +332,14 @@ AC_ARG_ENABLE([debug],
-     [enable_debug=no]
- )
- if test "x$enable_debug" = xyes; then
-+    DEFINES_FOR_BUILD="$DEFINES_FOR_BUILD -DDEBUG"
-+    if test "x$GCC_FOR_BUILD" = xyes; then
-+        CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD -g"
-+    fi
-+    if test "x$GXX_FOR_BUILD" = xyes; then
-+        CXXFLAGS_FOR_BUILD="$CXXFLAGS_FOR_BUILD -g"
-+    fi
-+
-     DEFINES="$DEFINES -DDEBUG"
-     if test "x$GCC" = xyes; then
-         CFLAGS="$CFLAGS -g"
-@@ -1960,6 +1991,7 @@ AC_CONFIG_FILES([configs/current
- 		src/gbm/Makefile
- 		src/gbm/main/gbm.pc
- 		src/glsl/Makefile
-+		src/glsl/builtin_compiler/Makefile
- 		src/glsl/glcpp/Makefile
- 		src/glsl/tests/Makefile
- 		src/glx/Makefile
-diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
-new file mode 100644
-index 0000000..6369809
---- /dev/null
-+++ b/m4/ax_prog_cc_for_build.m4
-@@ -0,0 +1,125 @@
-+# ===========================================================================
-+#   http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
-+# ===========================================================================
-+#
-+# SYNOPSIS
-+#
-+#   AX_PROG_CC_FOR_BUILD
-+#
-+# DESCRIPTION
-+#
-+#   This macro searches for a C compiler that generates native executables,
-+#   that is a C compiler that surely is not a cross-compiler. This can be
-+#   useful if you have to generate source code at compile-time like for
-+#   example GCC does.
-+#
-+#   The macro sets the CC_FOR_BUILD and CPP_FOR_BUILD macros to anything
-+#   needed to compile or link (CC_FOR_BUILD) and preprocess (CPP_FOR_BUILD).
-+#   The value of these variables can be overridden by the user by specifying
-+#   a compiler with an environment variable (like you do for standard CC).
-+#
-+#   It also sets BUILD_EXEEXT and BUILD_OBJEXT to the executable and object
-+#   file extensions for the build platform, and GCC_FOR_BUILD to `yes' if
-+#   the compiler we found is GCC. All these variables but GCC_FOR_BUILD are
-+#   substituted in the Makefile.
-+#
-+# LICENSE
-+#
-+#   Copyright (c) 2008 Paolo Bonzini <bonzini@gnu.org>
-+#
-+#   Copying and distribution of this file, with or without modification, are
-+#   permitted in any medium without royalty provided the copyright notice
-+#   and this notice are preserved. This file is offered as-is, without any
-+#   warranty.
-+
-+#serial 5
-+
-+AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
-+AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
-+AC_REQUIRE([AC_PROG_CC])dnl
-+AC_REQUIRE([AC_PROG_CPP])dnl
-+AC_REQUIRE([AC_EXEEXT])dnl
-+AC_REQUIRE([AC_CANONICAL_SYSTEM])dnl
-+
-+dnl Use the standard macros, but make them use other variable names
-+dnl
-+pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
-+pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
-+pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
-+pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
-+pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
-+pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
-+pushdef([ac_cv_objext], ac_cv_build_objext)dnl
-+pushdef([ac_exeext], ac_build_exeext)dnl
-+pushdef([ac_objext], ac_build_objext)dnl
-+pushdef([CC], CC_FOR_BUILD)dnl
-+pushdef([CPP], CPP_FOR_BUILD)dnl
-+pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
-+pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
-+pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
-+pushdef([host], build)dnl
-+pushdef([host_alias], build_alias)dnl
-+pushdef([host_cpu], build_cpu)dnl
-+pushdef([host_vendor], build_vendor)dnl
-+pushdef([host_os], build_os)dnl
-+pushdef([ac_cv_host], ac_cv_build)dnl
-+pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
-+pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
-+pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
-+pushdef([ac_cv_host_os], ac_cv_build_os)dnl
-+pushdef([ac_cpp], ac_build_cpp)dnl
-+pushdef([ac_compile], ac_build_compile)dnl
-+pushdef([ac_link], ac_build_link)dnl
-+
-+save_cross_compiling=$cross_compiling
-+save_ac_tool_prefix=$ac_tool_prefix
-+cross_compiling=no
-+ac_tool_prefix=
-+
-+AC_PROG_CC
-+AC_PROG_CPP
-+AC_EXEEXT
-+
-+ac_tool_prefix=$save_ac_tool_prefix
-+cross_compiling=$save_cross_compiling
-+
-+dnl Restore the old definitions
-+dnl
-+popdef([ac_link])dnl
-+popdef([ac_compile])dnl
-+popdef([ac_cpp])dnl
-+popdef([ac_cv_host_os])dnl
-+popdef([ac_cv_host_vendor])dnl
-+popdef([ac_cv_host_cpu])dnl
-+popdef([ac_cv_host_alias])dnl
-+popdef([ac_cv_host])dnl
-+popdef([host_os])dnl
-+popdef([host_vendor])dnl
-+popdef([host_cpu])dnl
-+popdef([host_alias])dnl
-+popdef([host])dnl
-+popdef([LDFLAGS])dnl
-+popdef([CPPFLAGS])dnl
-+popdef([CFLAGS])dnl
-+popdef([CPP])dnl
-+popdef([CC])dnl
-+popdef([ac_objext])dnl
-+popdef([ac_exeext])dnl
-+popdef([ac_cv_objext])dnl
-+popdef([ac_cv_exeext])dnl
-+popdef([ac_cv_prog_cc_g])dnl
-+popdef([ac_cv_prog_cc_cross])dnl
-+popdef([ac_cv_prog_cc_works])dnl
-+popdef([ac_cv_prog_gcc])dnl
-+popdef([ac_cv_prog_CPP])dnl
-+
-+dnl Finally, set Makefile variables
-+dnl
-+BUILD_EXEEXT=$ac_build_exeext
-+BUILD_OBJEXT=$ac_build_objext
-+AC_SUBST(BUILD_EXEEXT)dnl
-+AC_SUBST(BUILD_OBJEXT)dnl
-+AC_SUBST([CFLAGS_FOR_BUILD])dnl
-+AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
-+AC_SUBST([LDFLAGS_FOR_BUILD])dnl
-+])
-diff --git a/m4/ax_prog_cxx_for_build.m4 b/m4/ax_prog_cxx_for_build.m4
-new file mode 100644
-index 0000000..ecf8db9
---- /dev/null
-+++ b/m4/ax_prog_cxx_for_build.m4
-@@ -0,0 +1,109 @@
-+# ===========================================================================
-+#   http://www.gnu.org/software/autoconf-archive/ax_prog_cxx_for_build.html
-+# ===========================================================================
-+#
-+# SYNOPSIS
-+#
-+#   AX_PROG_CXX_FOR_BUILD
-+#
-+# DESCRIPTION
-+#
-+#   This macro searches for a C++ compiler that generates native executables,
-+#   that is a C++ compiler that surely is not a cross-compiler. This can be
-+#   useful if you have to generate source code at compile-time like for
-+#   example GCC does.
-+#
-+#   The macro sets the CXX_FOR_BUILD and CXXCPP_FOR_BUILD macros to anything
-+#   needed to compile or link (CXX_FOR_BUILD) and preprocess (CXXCPP_FOR_BUILD).
-+#   The value of these variables can be overridden by the user by specifying
-+#   a compiler with an environment variable (like you do for standard CXX).
-+#
-+# LICENSE
-+#
-+#   Copyright (c) 2008 Paolo Bonzini <bonzini@gnu.org>
-+#   Copyright (c) 2012 Avionic Design GmbH
-+#
-+#   Based on the AX_PROG_CC_FOR_BUILD macro by Paolo Bonzini.
-+#
-+#   Copying and distribution of this file, with or without modification, are
-+#   permitted in any medium without royalty provided the copyright notice
-+#   and this notice are preserved. This file is offered as-is, without any
-+#   warranty.
-+
-+#serial 5
-+
-+AU_ALIAS([AC_PROG_CXX_FOR_BUILD], [AX_PROG_CXX_FOR_BUILD])
-+AC_DEFUN([AX_PROG_CXX_FOR_BUILD], [dnl
-+AC_REQUIRE([AX_PROG_CC_FOR_BUILD])dnl
-+AC_REQUIRE([AC_PROG_CXX])dnl
-+AC_REQUIRE([AC_PROG_CXXCPP])dnl
-+AC_REQUIRE([AC_CANONICAL_SYSTEM])dnl
-+
-+dnl Use the standard macros, but make them use other variable names
-+dnl
-+pushdef([ac_cv_prog_CXXCPP], ac_cv_build_prog_CXXCPP)dnl
-+pushdef([ac_cv_prog_gxx], ac_cv_build_prog_gxx)dnl
-+pushdef([ac_cv_prog_cxx_works], ac_cv_build_prog_cxx_works)dnl
-+pushdef([ac_cv_prog_cxx_cross], ac_cv_build_prog_cxx_cross)dnl
-+pushdef([ac_cv_prog_cxx_g], ac_cv_build_prog_cxx_g)dnl
-+pushdef([CXX], CXX_FOR_BUILD)dnl
-+pushdef([CXXCPP], CXXCPP_FOR_BUILD)dnl
-+pushdef([CXXFLAGS], CXXFLAGS_FOR_BUILD)dnl
-+pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
-+pushdef([CXXCPPFLAGS], CXXCPPFLAGS_FOR_BUILD)dnl
-+pushdef([host], build)dnl
-+pushdef([host_alias], build_alias)dnl
-+pushdef([host_cpu], build_cpu)dnl
-+pushdef([host_vendor], build_vendor)dnl
-+pushdef([host_os], build_os)dnl
-+pushdef([ac_cv_host], ac_cv_build)dnl
-+pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
-+pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
-+pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
-+pushdef([ac_cv_host_os], ac_cv_build_os)dnl
-+pushdef([ac_cxxcpp], ac_build_cxxcpp)dnl
-+pushdef([ac_compile], ac_build_compile)dnl
-+pushdef([ac_link], ac_build_link)dnl
-+
-+save_cross_compiling=$cross_compiling
-+save_ac_tool_prefix=$ac_tool_prefix
-+cross_compiling=no
-+ac_tool_prefix=
-+
-+AC_PROG_CXX
-+AC_PROG_CXXCPP
-+
-+ac_tool_prefix=$save_ac_tool_prefix
-+cross_compiling=$save_cross_compiling
-+
-+dnl Restore the old definitions
-+dnl
-+popdef([ac_link])dnl
-+popdef([ac_compile])dnl
-+popdef([ac_cxxcpp])dnl
-+popdef([ac_cv_host_os])dnl
-+popdef([ac_cv_host_vendor])dnl
-+popdef([ac_cv_host_cpu])dnl
-+popdef([ac_cv_host_alias])dnl
-+popdef([ac_cv_host])dnl
-+popdef([host_os])dnl
-+popdef([host_vendor])dnl
-+popdef([host_cpu])dnl
-+popdef([host_alias])dnl
-+popdef([host])dnl
-+popdef([CXXCPPFLAGS])dnl
-+popdef([CPPFLAGS])dnl
-+popdef([CXXFLAGS])dnl
-+popdef([CXXCPP])dnl
-+popdef([CXX])dnl
-+popdef([ac_cv_prog_cxx_g])dnl
-+popdef([ac_cv_prog_cxx_cross])dnl
-+popdef([ac_cv_prog_cxx_works])dnl
-+popdef([ac_cv_prog_gxx])dnl
-+popdef([ac_cv_prog_CXXCPP])dnl
-+
-+dnl Finally, set Makefile variables
-+dnl
-+AC_SUBST([CXXFLAGS_FOR_BUILD])dnl
-+AC_SUBST([CXXCPPFLAGS_FOR_BUILD])dnl
-+])
-diff --git a/src/glsl/Makefile.am b/src/glsl/Makefile.am
-index 1ecc003..6fb3d2d 100644
---- a/src/glsl/Makefile.am
-+++ b/src/glsl/Makefile.am
-@@ -19,9 +19,7 @@
- # FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- # IN THE SOFTWARE.
- 
--
--# builtin_compiler is built before libglsl to generate builtin_function.cpp for libglsl.
--# For this to work, a dummy version of builtin_function.cpp, builtin_stubs.cpp, is used.
-+SUBDIRS = builtin_compiler glcpp
- 
- AM_CPPFLAGS = \
- 	-I$(top_srcdir)/include \
-@@ -38,32 +36,23 @@ AM_LFLAGS = --nounistd -o$(LEX_OUTPUT_ROOT).c
- 
- include Makefile.sources
- 
--noinst_LTLIBRARIES = libglslcommon.la libglsl.la
--noinst_PROGRAMS = glsl_compiler glsl_test builtin_compiler
-+noinst_LTLIBRARIES = libglsl.la
-+noinst_PROGRAMS = glsl_compiler glsl_test
- 
--# common sources for builtin_compiler and libglsl
--libglslcommon_la_SOURCES = \
-+libglsl_la_SOURCES = \
- 	glsl_lexer.ll \
- 	glsl_parser.cc \
- 	$(LIBGLSL_FILES) \
--	$(LIBGLSL_CXX_FILES)
--
--libglslcommon_la_LIBADD = glcpp/libglcpp.la
--
--# common sources for builtin_compiler and glsl_compiler
--GLSL2_SOURCES = \
--	$(top_srcdir)/src/mesa/program/hash_table.c \
--	$(top_srcdir)/src/mesa/program/symbol_table.c \
--	$(GLSL_COMPILER_CXX_FILES)
--
--libglsl_la_SOURCES = \
-+	$(LIBGLSL_CXX_FILES) \
- 	builtin_function.cpp
- 
--libglsl_la_LIBADD = libglslcommon.la
-+libglsl_la_LIBADD = glcpp/libglcpp.la
- libglsl_la_LDFLAGS =
- 
- glsl_compiler_SOURCES = \
--	$(GLSL2_SOURCES)
-+	$(top_srcdir)/src/mesa/program/hash_table.c \
-+	$(top_srcdir)/src/mesa/program/symbol_table.c \
-+	$(GLSL_COMPILER_CXX_FILES)
- 
- glsl_compiler_LDADD = libglsl.la
- 
-@@ -76,12 +65,6 @@ glsl_test_SOURCES = \
- 
- glsl_test_LDADD = libglsl.la
- 
--builtin_compiler_SOURCES = \
--	$(GLSL2_SOURCES) \
--	builtin_stubs.cpp
--
--builtin_compiler_LDADD = libglslcommon.la
--
- # automake <=1.11 and automake >=1.12 have different conventions for naming C++ header files
- # made by yacc.  To work with both, we write our own rule rather than using automake's.
- # When (if) we require automake >=1.12 in configure.ac, this can be removed, and we can use
-@@ -89,16 +72,11 @@ builtin_compiler_LDADD = libglslcommon.la
- glsl_parser.cc glsl_parser.h: glsl_parser.yy
- 	$(AM_V_GEN) $(YACC) -v -o glsl_parser.cc -p "_mesa_glsl_" --defines=glsl_parser.h $<
- 
--BUILT_SOURCES = glsl_parser.h builtin_function.cpp
--CLEANFILES = glsl_lexer.cc glsl_parser.cc $(BUILT_SOURCES)
--
--builtin_function.cpp: $(srcdir)/builtins/profiles/* $(srcdir)/builtins/ir/* $(srcdir)/builtins/glsl/* $(srcdir)/builtins/tools/generate_builtins.py $(srcdir)/builtins/tools/texture_builtins.py builtin_compiler$(EXEEXT)
--	$(AM_V_GEN) $(PYTHON2) $(PYTHON_FLAGS) $(srcdir)/builtins/tools/generate_builtins.py ./builtin_compiler > builtin_function.cpp || rm -f builtin_function.cpp
--
--glcpp/libglcpp.la:
--	cd glcpp ; $(MAKE) $(AM_MAKEFLAGS)
-+BUILT_SOURCES = glsl_parser.h
-+CLEANFILES = glsl_lexer.cc glsl_parser.cc $(BUILT_SOURCES) builtin_function.cpp
- 
--SUBDIRS = glcpp
-+builtin_function.cpp: $(srcdir)/builtins/profiles/* $(srcdir)/builtins/ir/* $(srcdir)/builtins/glsl/* $(srcdir)/builtins/tools/generate_builtins.py $(srcdir)/builtins/tools/texture_builtins.py builtin_compiler/builtin_compiler$(BUILD_EXEEXT)
-+	$(AM_V_GEN) $(PYTHON2) $(PYTHON_FLAGS) $(srcdir)/builtins/tools/generate_builtins.py builtin_compiler/builtin_compiler$(BUILD_EXEEXT) > builtin_function.cpp || rm -f builtin_function.cpp
- 
- # Provide compatibility with scripts for the old Mesa build system for
- # a while by putting a link to the library in the current directory.
-diff --git a/src/glsl/builtin_compiler/Makefile.am b/src/glsl/builtin_compiler/Makefile.am
-new file mode 100644
-index 0000000..72032b5
---- /dev/null
-+++ b/src/glsl/builtin_compiler/Makefile.am
-@@ -0,0 +1,68 @@
-+# Copyright © 2012 Jon TURNEY
-+# Copyright © 2012 Thierry Reding
-+#
-+# Permission is hereby granted, free of charge, to any person obtaining a
-+# copy of this software and associated documentation files (the "Software"),
-+# to deal in the Software without restriction, including without limitation
-+# the rights to use, copy, modify, merge, publish, distribute, sublicense,
-+# and/or sell copies of the Software, and to permit persons to whom the
-+# Software is furnished to do so, subject to the following conditions:
-+#
-+# The above copyright notice and this permission notice (including the next
-+# paragraph) shall be included in all copies or substantial portions of the
-+# Software.
-+#
-+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
-+# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-+# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
-+# IN THE SOFTWARE.
-+
-+CC = @CC_FOR_BUILD@
-+CFLAGS = @CFLAGS_FOR_BUILD@
-+CPP = @CPP_FOR_BUILD@
-+CPPFLAGS = @CPPFLAGS_FOR_BUILD@
-+CXX = @CXX_FOR_BUILD@
-+CXXFLAGS = @CXXFLAGS_FOR_BUILD@
-+LD = @LD_FOR_BUILD@
-+LDFLAGS = @LDFLAGS_FOR_BUILD@
-+
-+AM_CFLAGS = \
-+	-I $(top_srcdir)/include \
-+	-I $(top_srcdir)/src/mapi \
-+	-I $(top_srcdir)/src/mesa \
-+	-I $(GLSL_SRCDIR) \
-+	-I $(GLSL_SRCDIR)/glcpp \
-+	$(DEFINES_FOR_BUILD)
-+
-+AM_CXXFLAGS = $(AM_CFLAGS)
-+
-+AM_YFLAGS = -v -d -p "glcpp_parser_"
-+AM_LFLAGS = --nounistd -o$(LEX_OUTPUT_ROOT).c
-+
-+include ../Makefile.sources
-+
-+noinst_PROGRAMS = builtin_compiler
-+
-+builtin_compiler_SOURCES = \
-+	$(GLSL_SRCDIR)/glcpp/glcpp-lex.l \
-+	$(GLSL_SRCDIR)/glcpp/glcpp-parse.y \
-+	$(LIBGLCPP_FILES) \
-+	$(GLSL_SRCDIR)/glsl_lexer.ll \
-+	$(GLSL_SRCDIR)/glsl_parser.cc \
-+	$(LIBGLSL_FILES) \
-+	$(LIBGLSL_CXX_FILES) \
-+	$(top_srcdir)/src/mesa/program/hash_table.c \
-+	$(top_srcdir)/src/mesa/program/symbol_table.c \
-+	$(GLSL_COMPILER_CXX_FILES) \
-+	builtin_stubs.cpp
-+
-+BUILT_SOURCES = \
-+	glcpp-lex.c \
-+	glcpp-parse.c \
-+	glcpp-parse.h \
-+	glsl_lexer.cc
-+
-+CLEANFILES = $(BUILT_SOURCES)
-diff --git a/src/glsl/builtin_compiler/builtin_stubs.cpp b/src/glsl/builtin_compiler/builtin_stubs.cpp
-new file mode 100644
-index 0000000..dfa5d32
---- /dev/null
-+++ b/src/glsl/builtin_compiler/builtin_stubs.cpp
-@@ -0,0 +1,39 @@
-+/*
-+ * Copyright © 2010 Intel Corporation
-+ *
-+ * Permission is hereby granted, free of charge, to any person obtaining a
-+ * copy of this software and associated documentation files (the "Software"),
-+ * to deal in the Software without restriction, including without limitation
-+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
-+ * and/or sell copies of the Software, and to permit persons to whom the
-+ * Software is furnished to do so, subject to the following conditions:
-+ *
-+ * The above copyright notice and this permission notice (including the next
-+ * paragraph) shall be included in all copies or substantial portions of the
-+ * Software.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
-+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-+ * DEALINGS IN THE SOFTWARE.
-+ */
-+
-+#include <stdio.h>
-+#include "glsl_parser_extras.h"
-+
-+/* A dummy file.  When compiling prototypes, we don't care about builtins.
-+ * We really don't want to half-compile builtin_functions.cpp and fail, though.
-+ */
-+void
-+_mesa_glsl_release_functions(void)
-+{
-+}
-+
-+void
-+_mesa_glsl_initialize_functions(_mesa_glsl_parse_state *state)
-+{
-+   (void) state;
-+}
-diff --git a/src/glsl/builtin_stubs.cpp b/src/glsl/builtin_stubs.cpp
-deleted file mode 100644
-index dfa5d32..0000000
---- a/src/glsl/builtin_stubs.cpp
-+++ /dev/null
-@@ -1,39 +0,0 @@
--/*
-- * Copyright © 2010 Intel Corporation
-- *
-- * Permission is hereby granted, free of charge, to any person obtaining a
-- * copy of this software and associated documentation files (the "Software"),
-- * to deal in the Software without restriction, including without limitation
-- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
-- * and/or sell copies of the Software, and to permit persons to whom the
-- * Software is furnished to do so, subject to the following conditions:
-- *
-- * The above copyright notice and this permission notice (including the next
-- * paragraph) shall be included in all copies or substantial portions of the
-- * Software.
-- *
-- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
-- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-- * DEALINGS IN THE SOFTWARE.
-- */
--
--#include <stdio.h>
--#include "glsl_parser_extras.h"
--
--/* A dummy file.  When compiling prototypes, we don't care about builtins.
-- * We really don't want to half-compile builtin_functions.cpp and fail, though.
-- */
--void
--_mesa_glsl_release_functions(void)
--{
--}
--
--void
--_mesa_glsl_initialize_functions(_mesa_glsl_parse_state *state)
--{
--   (void) state;
--}
diff --git a/meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch b/meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
deleted file mode 100644
index 80735a6..0000000
--- a/meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Backport
-
-From d6b06474f69129eb41ecd85d6b3bb0eb7b9dccb3 Mon Sep 17 00:00:00 2001
-From: Daniel Stone <daniel@fooishbar.org>
-Date: Tue, 9 Oct 2012 14:27:06 +1100
-Subject: [PATCH] build: Don't fail if libX11 isn't installed
-
-configure.ac would previously refuse to complete if libX11 wasn't
-installed, even if we'd disabled GLX and weren't building an X11 EGL
-platform.  Make the check simply set the no_x variable that's used (but
-never set) immediately below for what looks like this very case.
-
-Signed-off-by: Daniel Stone <daniel@fooishbar.org>
-Reviewed-by: Matt Turner <mattst88@gmail.com>
-Reviewed-by: Dan Nicholson <dbn.lists@gmail.com>
-(cherry picked from commit 4004620d34a580c8fdb965d9b640e97453fc8b28)
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index eb273b9..b384b44 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -836,7 +836,7 @@ if test "x$enable_dri" = xyes; then
- fi
- 
- dnl Find out if X is available.
--PKG_CHECK_MODULES([X11], [x11])
-+PKG_CHECK_MODULES([X11], [x11], [no_x=no], [no_x=yes])
- 
- dnl Try to tell the user that the --x-* options are only used when
- dnl pkg-config is not available. This must be right after AC_PATH_XTRA.
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch b/meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch
deleted file mode 100644
index 6436b59..0000000
--- a/meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Submitted
-
-Picked from mesa-dev mailing list: http://marc.info/?l=mesa3d-dev&m=133053004130468
-
-From: Benjamin Franzke <benjaminfranzke@googlemail.com>
-Date: Wed, 29 Feb 2012 15:36:23 +0100
-Subject: [PATCH] configure: Fix egl compilation without x11 headers
-
-We dont want eglplatform.h to typedef egl native types
-to x11 types, when x11 headers are not available.
----
- configure.ac |    4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index b384b44..8eb8459 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1262,6 +1262,10 @@ if test "x$enable_egl" = xyes; then
- 
-     AC_CHECK_FUNC(mincore, [DEFINES="$DEFINES -DHAVE_MINCORE"])
- 
-+    if test "$have_x" != yes; then
-+        DEFINES="$DEFINES -DMESA_EGL_NO_X11_HEADERS"
-+    fi
-+
-     if test "$enable_static" != yes; then
-         # build egl_glx when libGL is built
-         if test "x$enable_glx" = xyes; then
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch b/meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch
new file mode 100644
index 0000000..34226ea
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch
@@ -0,0 +1,43 @@
+The target libtool is used when building host binaries, which predictably
+doesn't work.
+
+Upstream-Status: Submitted (https://bugs.freedesktop.org/show_bug.cgi?id=44618)
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/src/glsl/builtin_compiler/Makefile.am b/src/glsl/builtin_compiler/Makefile.am
+index e11a17f..8ebe0a2 100644
+--- a/src/glsl/builtin_compiler/Makefile.am
++++ b/src/glsl/builtin_compiler/Makefile.am
+@@ -64,6 +64,8 @@ AM_CXXFLAGS = $(AM_CFLAGS)
+ include ../Makefile.sources
+ 
+ noinst_PROGRAMS = builtin_compiler
++
++if !CROSS_COMPILING
+ noinst_LTLIBRARIES = libglslcore.la libglcpp.la
+ 
+ libglcpp_la_SOURCES =					\
+@@ -73,6 +75,7 @@ libglcpp_la_SOURCES =					\
+ libglslcore_la_SOURCES =				\
+ 	$(BUILTIN_COMPILER_GENERATED_CXX_FILES)		\
+ 	$(LIBGLSL_FILES)
++endif
+ 
+ builtin_compiler_SOURCES = \
+ 	$(top_srcdir)/src/mesa/main/hash_table.c	\
+@@ -81,4 +84,14 @@ builtin_compiler_SOURCES = \
+ 	$(top_srcdir)/src/mesa/program/symbol_table.c	\
+ 	$(BUILTIN_COMPILER_CXX_FILES)			\
+ 	$(GLSL_COMPILER_CXX_FILES)
++
++if CROSS_COMPILING
++builtin_compiler_SOURCES += \
++	$(LIBGLCPP_GENERATED_FILES) \
++	$(LIBGLCPP_FILES) \
++	$(BUILTIN_COMPILER_GENERATED_CXX_FILES) \
++	$(LIBGLSL_FILES)
++builtin_compiler_CPPFLAGS = $(AM_CPPFLAGS)
++else
+ builtin_compiler_LDADD = libglslcore.la libglcpp.la
++endif
diff --git a/meta/recipes-graphics/mesa/mesa_9.0.2.bb b/meta/recipes-graphics/mesa/mesa_9.0.2.bb
deleted file mode 100644
index 6671f99..0000000
--- a/meta/recipes-graphics/mesa/mesa_9.0.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require mesa-common.inc
-require mesa-${PV}.inc
-require mesa.inc
-PR = "${INC_PR}.1"
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.3.bb b/meta/recipes-graphics/mesa/mesa_9.1.3.bb
new file mode 100644
index 0000000..60a90a3
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa_9.1.3.bb
@@ -0,0 +1,14 @@
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
+           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
+           file://fix-glsl-cross.patch \
+           "
+
+SRC_URI[md5sum] = "952ccd03547ed72333b64e1746cf8ada"
+SRC_URI[sha256sum] = "8d5dac2202d0355bff5cfd183582ec8167d1d1227b7bb7a669acecbeaa52d766"
+
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555d"
+
+S = "${WORKDIR}/Mesa-${PV}"
+
+require mesa-common.inc
+require mesa.inc
-- 
1.7.10.4


