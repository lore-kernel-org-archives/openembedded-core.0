Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 10FB06DB40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 15:31:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2014 07:30:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,548,1389772800"; d="scan'208";a="490153995"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.47])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2014 07:30:55 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2014 17:30:47 +0200
Message-Id: <1393428647-9217-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [dora][PATCH] mesa: build fix for gallium-egl
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
X-List-Received-Date: Wed, 26 Feb 2014 15:31:15 -0000

Avoid altering eglplatform.h from {top_srcdir}/include
using an alternative to
0003-EGL-Mutate-NativeDisplayType-depending-on-config
patch.

[YOCTO #5882]
Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 ...ate-NativeDisplayType-depending-on-config.patch | 359 ---------------------
 meta/recipes-graphics/mesa/mesa_9.1.6.bb           |   9 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |   8 +
 3 files changed, 16 insertions(+), 360 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch

diff --git a/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
deleted file mode 100644
index 8a83f4b..0000000
--- a/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
+++ /dev/null
@@ -1,359 +0,0 @@
-From 8d31ae23683394617c49301b039b3a069b9ea436 Mon Sep 17 00:00:00 2001
-From: Daniel Stone <daniel@fooishbar.org>
-Date: Fri, 24 May 2013 17:20:27 +0100
-Subject: [PATCH 3/4] EGL: Mutate NativeDisplayType depending on config
-
-If we go through ./configure without enabling X11 anywhere, then set the
-fallback types for EGL NativeDisplay and friends, rather than assuming
-X11/Xlib.
-
-Upstream-Status: Backport (slightly different solution was applied in master
-https://bugs.freedesktop.org/show_bug.cgi?id=64959)
-
-Signed-off-by: Daniel Stone <daniel@fooishbar.org>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac                 |   5 ++
- include/EGL/eglplatform.h    | 146 -------------------------------------------
- include/EGL/eglplatform.h.in | 146 +++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 151 insertions(+), 146 deletions(-)
- delete mode 100644 include/EGL/eglplatform.h
- create mode 100644 include/EGL/eglplatform.h.in
-
-diff --git a/configure.ac b/configure.ac
-index 67b8c40..afc3217 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1499,6 +1499,9 @@ EGL_PLATFORMS="$egl_platforms"
- 
- if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
-     NEED_WINSYS_XLIB=yes
-+    MESA_EGL_NO_X11_HEADERS=0
-+else
-+    MESA_EGL_NO_X11_HEADERS=1
- fi
- AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1)
- AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" | grep 'wayland' >/dev/null 2>&1)
-@@ -1512,6 +1515,7 @@ AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" != "x")
- AC_SUBST([EGL_NATIVE_PLATFORM])
- AC_SUBST([EGL_PLATFORMS])
- AC_SUBST([EGL_CFLAGS])
-+AC_SUBST([MESA_EGL_NO_X11_HEADERS])
- 
- AC_ARG_WITH([egl-driver-dir],
-     [AS_HELP_STRING([--with-egl-driver-dir=DIR],
-@@ -1991,6 +1995,7 @@ CXXFLAGS="$CXXFLAGS $USER_CXXFLAGS"
- 
- dnl Substitute the config
- AC_CONFIG_FILES([Makefile
-+		include/EGL/eglplatform.h
- 		src/Makefile
- 		src/egl/Makefile
- 		src/egl/drivers/Makefile
-diff --git a/include/EGL/eglplatform.h b/include/EGL/eglplatform.h
-deleted file mode 100644
-index 17fdc61..0000000
---- a/include/EGL/eglplatform.h
-+++ /dev/null
-@@ -1,146 +0,0 @@
--#ifndef __eglplatform_h_
--#define __eglplatform_h_
--
--/*
--** Copyright (c) 2007-2009 The Khronos Group Inc.
--**
--** Permission is hereby granted, free of charge, to any person obtaining a
--** copy of this software and/or associated documentation files (the
--** "Materials"), to deal in the Materials without restriction, including
--** without limitation the rights to use, copy, modify, merge, publish,
--** distribute, sublicense, and/or sell copies of the Materials, and to
--** permit persons to whom the Materials are furnished to do so, subject to
--** the following conditions:
--**
--** The above copyright notice and this permission notice shall be included
--** in all copies or substantial portions of the Materials.
--**
--** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
--** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
--** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
--** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
--** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
--** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
--** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
--*/
--
--/* Platform-specific types and definitions for egl.h
-- * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
-- *
-- * Adopters may modify khrplatform.h and this file to suit their platform.
-- * You are encouraged to submit all modifications to the Khronos group so that
-- * they can be included in future versions of this file.  Please submit changes
-- * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
-- * by filing a bug against product "EGL" component "Registry".
-- */
--
--#include <KHR/khrplatform.h>
--
--/* Macros used in EGL function prototype declarations.
-- *
-- * EGL functions should be prototyped as:
-- *
-- * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
-- * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
-- *
-- * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
-- */
--
--#ifndef EGLAPI
--#define EGLAPI KHRONOS_APICALL
--#endif
--
--#ifndef EGLAPIENTRY
--#define EGLAPIENTRY  KHRONOS_APIENTRY
--#endif
--#define EGLAPIENTRYP EGLAPIENTRY*
--
--/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
-- * are aliases of window-system-dependent types, such as X Display * or
-- * Windows Device Context. They must be defined in platform-specific
-- * code below. The EGL-prefixed versions of Native*Type are the same
-- * types, renamed in EGL 1.3 so all types in the API start with "EGL".
-- *
-- * Khronos STRONGLY RECOMMENDS that you use the default definitions
-- * provided below, since these changes affect both binary and source
-- * portability of applications using EGL running on different EGL
-- * implementations.
-- */
--
--#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
--#ifndef WIN32_LEAN_AND_MEAN
--#define WIN32_LEAN_AND_MEAN 1
--#endif
--#include <windows.h>
--
--typedef HDC     EGLNativeDisplayType;
--typedef HBITMAP EGLNativePixmapType;
--typedef HWND    EGLNativeWindowType;
--
--#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
--
--typedef int   EGLNativeDisplayType;
--typedef void *EGLNativeWindowType;
--typedef void *EGLNativePixmapType;
--
--#elif defined(WL_EGL_PLATFORM)
--
--typedef struct wl_display     *EGLNativeDisplayType;
--typedef struct wl_egl_pixmap  *EGLNativePixmapType;
--typedef struct wl_egl_window  *EGLNativeWindowType;
--
--#elif defined(__GBM__)
--
--typedef struct gbm_device  *EGLNativeDisplayType;
--typedef struct gbm_bo      *EGLNativePixmapType;
--typedef void               *EGLNativeWindowType;
--
--#elif defined(ANDROID) /* Android */
--
--struct ANativeWindow;
--struct egl_native_pixmap_t;
--
--typedef struct ANativeWindow        *EGLNativeWindowType;
--typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
--typedef void                        *EGLNativeDisplayType;
--
--#elif defined(__unix__)
--
--#ifdef MESA_EGL_NO_X11_HEADERS
--
--typedef void            *EGLNativeDisplayType;
--typedef khronos_uint32_t EGLNativePixmapType;
--typedef khronos_uint32_t EGLNativeWindowType;
--
--#else
--
--/* X11 (tentative)  */
--#include <X11/Xlib.h>
--#include <X11/Xutil.h>
--
--typedef Display *EGLNativeDisplayType;
--typedef Pixmap   EGLNativePixmapType;
--typedef Window   EGLNativeWindowType;
--
--#endif /* MESA_EGL_NO_X11_HEADERS */
--
--#else
--#error "Platform not recognized"
--#endif
--
--/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
--typedef EGLNativeDisplayType NativeDisplayType;
--typedef EGLNativePixmapType  NativePixmapType;
--typedef EGLNativeWindowType  NativeWindowType;
--
--
--/* Define EGLint. This must be a signed integral type large enough to contain
-- * all legal attribute names and values passed into and out of EGL, whether
-- * their type is boolean, bitmask, enumerant (symbolic constant), integer,
-- * handle, or other.  While in general a 32-bit integer will suffice, if
-- * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
-- * integer type.
-- */
--typedef khronos_int32_t EGLint;
--
--#endif /* __eglplatform_h */
-diff --git a/include/EGL/eglplatform.h.in b/include/EGL/eglplatform.h.in
-new file mode 100644
-index 0000000..5126c92
---- /dev/null
-+++ b/include/EGL/eglplatform.h.in
-@@ -0,0 +1,146 @@
-+#ifndef __eglplatform_h_
-+#define __eglplatform_h_
-+
-+/*
-+** Copyright (c) 2007-2009 The Khronos Group Inc.
-+**
-+** Permission is hereby granted, free of charge, to any person obtaining a
-+** copy of this software and/or associated documentation files (the
-+** "Materials"), to deal in the Materials without restriction, including
-+** without limitation the rights to use, copy, modify, merge, publish,
-+** distribute, sublicense, and/or sell copies of the Materials, and to
-+** permit persons to whom the Materials are furnished to do so, subject to
-+** the following conditions:
-+**
-+** The above copyright notice and this permission notice shall be included
-+** in all copies or substantial portions of the Materials.
-+**
-+** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-+** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-+** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-+** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
-+** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-+** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-+** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
-+*/
-+
-+/* Platform-specific types and definitions for egl.h
-+ * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
-+ *
-+ * Adopters may modify khrplatform.h and this file to suit their platform.
-+ * You are encouraged to submit all modifications to the Khronos group so that
-+ * they can be included in future versions of this file.  Please submit changes
-+ * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
-+ * by filing a bug against product "EGL" component "Registry".
-+ */
-+
-+#include <KHR/khrplatform.h>
-+
-+/* Macros used in EGL function prototype declarations.
-+ *
-+ * EGL functions should be prototyped as:
-+ *
-+ * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
-+ * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
-+ *
-+ * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
-+ */
-+
-+#ifndef EGLAPI
-+#define EGLAPI KHRONOS_APICALL
-+#endif
-+
-+#ifndef EGLAPIENTRY
-+#define EGLAPIENTRY  KHRONOS_APIENTRY
-+#endif
-+#define EGLAPIENTRYP EGLAPIENTRY*
-+
-+/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
-+ * are aliases of window-system-dependent types, such as X Display * or
-+ * Windows Device Context. They must be defined in platform-specific
-+ * code below. The EGL-prefixed versions of Native*Type are the same
-+ * types, renamed in EGL 1.3 so all types in the API start with "EGL".
-+ *
-+ * Khronos STRONGLY RECOMMENDS that you use the default definitions
-+ * provided below, since these changes affect both binary and source
-+ * portability of applications using EGL running on different EGL
-+ * implementations.
-+ */
-+
-+#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
-+#ifndef WIN32_LEAN_AND_MEAN
-+#define WIN32_LEAN_AND_MEAN 1
-+#endif
-+#include <windows.h>
-+
-+typedef HDC     EGLNativeDisplayType;
-+typedef HBITMAP EGLNativePixmapType;
-+typedef HWND    EGLNativeWindowType;
-+
-+#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
-+
-+typedef int   EGLNativeDisplayType;
-+typedef void *EGLNativeWindowType;
-+typedef void *EGLNativePixmapType;
-+
-+#elif defined(WL_EGL_PLATFORM)
-+
-+typedef struct wl_display     *EGLNativeDisplayType;
-+typedef struct wl_egl_pixmap  *EGLNativePixmapType;
-+typedef struct wl_egl_window  *EGLNativeWindowType;
-+
-+#elif defined(__GBM__)
-+
-+typedef struct gbm_device  *EGLNativeDisplayType;
-+typedef struct gbm_bo      *EGLNativePixmapType;
-+typedef void               *EGLNativeWindowType;
-+
-+#elif defined(ANDROID) /* Android */
-+
-+struct ANativeWindow;
-+struct egl_native_pixmap_t;
-+
-+typedef struct ANativeWindow        *EGLNativeWindowType;
-+typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
-+typedef void                        *EGLNativeDisplayType;
-+
-+#elif defined(__unix__)
-+
-+#if @MESA_EGL_NO_X11_HEADERS@
-+
-+typedef void            *EGLNativeDisplayType;
-+typedef khronos_uint32_t EGLNativePixmapType;
-+typedef khronos_uint32_t EGLNativeWindowType;
-+
-+#else
-+
-+/* X11 (tentative)  */
-+#include <X11/Xlib.h>
-+#include <X11/Xutil.h>
-+
-+typedef Display *EGLNativeDisplayType;
-+typedef Pixmap   EGLNativePixmapType;
-+typedef Window   EGLNativeWindowType;
-+
-+#endif /* MESA_EGL_NO_X11_HEADERS */
-+
-+#else
-+#error "Platform not recognized"
-+#endif
-+
-+/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
-+typedef EGLNativeDisplayType NativeDisplayType;
-+typedef EGLNativePixmapType  NativePixmapType;
-+typedef EGLNativeWindowType  NativeWindowType;
-+
-+
-+/* Define EGLint. This must be a signed integral type large enough to contain
-+ * all legal attribute names and values passed into and out of EGL, whether
-+ * their type is boolean, bitmask, enumerant (symbolic constant), integer,
-+ * handle, or other.  While in general a 32-bit integer will suffice, if
-+ * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
-+ * integer type.
-+ */
-+typedef khronos_int32_t EGLint;
-+
-+#endif /* __eglplatform_h */
--- 
-1.8.2.1
-
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.6.bb b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
index b55fa02..9a9d405 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
@@ -3,7 +3,6 @@ require ${BPN}.inc
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
-           file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
            file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
            file://0005-fix-out-of-tree-builds-gallium.patch \
@@ -14,3 +13,11 @@ SRC_URI[md5sum] = "443a2a352667294b53d56cb1a74114e9"
 SRC_URI[sha256sum] = "e632dff0acafad0a59dc208d16dedb37f7bd58f94c5d58c4b51912e41d005e3d"
 
 S = "${WORKDIR}/Mesa-${PV}"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install_append() {
+    if ${@base_contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+    fi
+}
\ No newline at end of file
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 6397ece..98cea2f 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -18,3 +18,11 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa \
            "
 
 S = "${WORKDIR}/git"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install_append() {
+    if ${@base_contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+    fi
+}
-- 
1.8.3.2


