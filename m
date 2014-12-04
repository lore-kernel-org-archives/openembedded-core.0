Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CCB9272200
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 23:18:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 Dec 2014 15:16:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,518,1413270000"; d="scan'208";a="618869990"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.148])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2014 15:18:20 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 17:18:16 -0600
Message-Id: <8b36a30896049fd5875f88c368cb7f57a6c1f67b.1417734782.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417734782.git.anibal.limon@linux.intel.com>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1417734782.git.anibal.limon@linux.intel.com>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 2/3] mesa: Upgrade to 10.3.4.
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
X-List-Received-Date: Thu, 04 Dec 2014 23:18:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove 0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA,
0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch and
0006-fix-out-of-tree-egl.patch are already in upstream.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../mesa/{mesa-gl_10.1.3.bb => mesa-gl_10.3.4.bb}  |   0
 ..._sw-include-xlib_sw_winsys.h-only-when-HA.patch |  52 ---
 ...ate-NativeDisplayType-depending-on-config.patch | 362 ---------------------
 .../mesa/mesa/0006-fix-out-of-tree-egl.patch       |  48 ---
 .../mesa/{mesa_10.1.3.bb => mesa_10.3.4.bb}        |   9 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |   9 +-
 6 files changed, 6 insertions(+), 474 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_10.1.3.bb => mesa-gl_10.3.4.bb} (100%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0006-fix-out-of-tree-egl.patch
 rename meta/recipes-graphics/mesa/{mesa_10.1.3.bb => mesa_10.3.4.bb} (62%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.1.3.bb b/meta/recipes-graphics/mesa/mesa-gl_10.3.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_10.1.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_10.3.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa/0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch b/meta/recipes-graphics/mesa/mesa/0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch
deleted file mode 100644
index 2df5e61..0000000
--- a/meta/recipes-graphics/mesa/mesa/0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From debac5531f7107d239530ff6e29eeda72b9ec1e9 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 29 Jun 2013 11:20:51 +0200
-Subject: [PATCH 2/4] pipe_loader_sw: include xlib_sw_winsys.h only when
- HAVE_PIPE_LOADER_XLIB
-
-* HAVE_WINSYS_XLIB was removed in
-  commit b3f1f665b0fef178ae193e6b111f14c9a5ad3b25
-  Author: Matt Turner <mattst88@gmail.com>
-  Date:   Sun Jan 20 15:32:08 2013 -0800
-  build: Get rid of GALLIUM_WINSYS_DIRS
-
-* HAVE_PIPE_LOADER_XLIB is set correctly:
-  if test "x$NEED_WINSYS_XLIB" = xyes; then
-      GALLIUM_PIPE_LOADER_DEFINES="$GALLIUM_PIPE_LOADER_DEFINES -DHAVE_PIPE_LOADER_XLIB"
-      GALLIUM_PIPE_LOADER_LIBS="$GALLIUM_PIPE_LOADER_LIBS \$(top_builddir)/src/gallium/winsys/sw/xlib/libws_xlib.la"
-  fi
-
-* fixes build of pipe_loader_sw without libx11 headers available
-
-Upstream-Status: Submitted https://bugs.freedesktop.org/show_bug.cgi?id=66357
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c b/src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c
-index c2b78c6..0da3f4d 100644
---- a/src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c
-+++ b/src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c
-@@ -31,7 +31,9 @@
- #include "util/u_dl.h"
- #include "sw/null/null_sw_winsys.h"
- #include "target-helpers/inline_sw_helper.h"
-+#ifdef HAVE_PIPE_LOADER_XLIB
- #include "state_tracker/xlib_sw_winsys.h"
-+#endif
- 
- struct pipe_loader_sw_device {
-    struct pipe_loader_device base;
-@@ -44,7 +46,7 @@ struct pipe_loader_sw_device {
- static struct pipe_loader_ops pipe_loader_sw_ops;
- 
- static struct sw_winsys *(*backends[])() = {
--#ifdef HAVE_WINSYS_XLIB
-+#ifdef HAVE_PIPE_LOADER_XLIB
-    x11_sw_create,
- #endif
-    null_sw_create
--- 
-1.8.2.1
-
diff --git a/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
deleted file mode 100644
index 30a3d98..0000000
--- a/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
+++ /dev/null
@@ -1,362 +0,0 @@
-From 06c1ba29de8a26fffb73ee99f0fc54c704e9fee4 Mon Sep 17 00:00:00 2001
-From: Daniel Stone <daniel@fooishbar.org>
-Date: Fri, 24 May 2013 17:20:27 +0100
-Subject: [PATCH 3/5] EGL: Mutate NativeDisplayType depending on config
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
- configure.ac                 |   9 +++
- include/EGL/eglplatform.h    | 146 -------------------------------------------
- include/EGL/eglplatform.h.in | 146 +++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 155 insertions(+), 146 deletions(-)
- delete mode 100644 include/EGL/eglplatform.h
- create mode 100644 include/EGL/eglplatform.h.in
-
-diff --git a/configure.ac b/configure.ac
-index 2b4a374..d4c7a95 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1565,12 +1565,20 @@ fi
- 
- EGL_PLATFORMS="$egl_platforms"
- 
-+if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
-+    MESA_EGL_NO_X11_HEADERS=0
-+else
-+    MESA_EGL_NO_X11_HEADERS=1
-+fi
-+
- AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1)
- AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" | grep 'wayland' >/dev/null 2>&1)
- AM_CONDITIONAL(HAVE_EGL_PLATFORM_DRM, echo "$egl_platforms" | grep 'drm' >/dev/null 2>&1)
- AM_CONDITIONAL(HAVE_EGL_PLATFORM_FBDEV, echo "$egl_platforms" | grep 'fbdev' >/dev/null 2>&1)
- AM_CONDITIONAL(HAVE_EGL_PLATFORM_NULL, echo "$egl_platforms" | grep 'null' >/dev/null 2>&1)
- 
-+AC_SUBST([MESA_EGL_NO_X11_HEADERS])
-+
- AM_CONDITIONAL(HAVE_EGL_DRIVER_DRI2, test "x$HAVE_EGL_DRIVER_DRI2" != "x")
- AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" != "x")
- 
-@@ -2042,6 +2050,7 @@ CXXFLAGS="$CXXFLAGS $USER_CXXFLAGS"
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
diff --git a/meta/recipes-graphics/mesa/mesa/0006-fix-out-of-tree-egl.patch b/meta/recipes-graphics/mesa/mesa/0006-fix-out-of-tree-egl.patch
deleted file mode 100644
index 88a4fb0..0000000
--- a/meta/recipes-graphics/mesa/mesa/0006-fix-out-of-tree-egl.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Fix out of tree compilation failure due to
-0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch.
-
-Upstream-Status: Inappropriate (upstream has different solution to root problem)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/src/egl/drivers/dri2/Makefile.am b/src/egl/drivers/dri2/Makefile.am
-index 45f7dfa..ed0e777 100644
---- a/src/egl/drivers/dri2/Makefile.am
-+++ b/src/egl/drivers/dri2/Makefile.am
-@@ -21,6 +21,7 @@
- 
- AM_CFLAGS = \
- 	-I$(top_srcdir)/include \
-+	-I$(top_builddir)/include \
- 	-I$(top_srcdir)/src/egl/main \
- 	-I$(top_srcdir)/src/gbm/main \
- 	-I$(top_srcdir)/src/gbm/backends/dri \
-diff --git a/src/egl/drivers/glx/Makefile.am b/src/egl/drivers/glx/Makefile.am
-index 6bf67ea..7b87047 100644
---- a/src/egl/drivers/glx/Makefile.am
-+++ b/src/egl/drivers/glx/Makefile.am
-@@ -21,6 +21,7 @@
- 
- AM_CFLAGS = \
- 	-I$(top_srcdir)/include \
-+	-I$(top_builddir)/include \
- 	-I$(top_srcdir)/src/egl/main \
- 	$(X11_CFLAGS) \
- 	$(DEFINES)
-diff --git a/src/egl/main/Makefile.am b/src/egl/main/Makefile.am
-index ca5257a..13a5734 100644
---- a/src/egl/main/Makefile.am
-+++ b/src/egl/main/Makefile.am
-@@ -27,6 +27,7 @@ endif
- 
- AM_CFLAGS = \
- 	-I$(top_srcdir)/include \
-+	-I$(top_builddir)/include \
- 	-I$(top_srcdir)/src/gbm/main \
- 	$(DEFINES) \
- 	$(EGL_CFLAGS) \
-@@ -135,4 +136,4 @@ egl_HEADERS = \
- 	$(top_srcdir)/include/EGL/eglext.h \
- 	$(top_srcdir)/include/EGL/egl.h \
- 	$(top_srcdir)/include/EGL/eglmesaext.h \
--	$(top_srcdir)/include/EGL/eglplatform.h
-+	$(top_builddir)/include/EGL/eglplatform.h
diff --git a/meta/recipes-graphics/mesa/mesa_10.1.3.bb b/meta/recipes-graphics/mesa/mesa_10.3.4.bb
similarity index 62%
rename from meta/recipes-graphics/mesa/mesa_10.1.3.bb
rename to meta/recipes-graphics/mesa/mesa_10.3.4.bb
index abc450a..50092c9 100644
--- a/meta/recipes-graphics/mesa/mesa_10.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.3.4.bb
@@ -1,12 +1,9 @@
 require ${BPN}.inc
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
-           file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
-           file://0006-fix-out-of-tree-egl.patch \
-           "
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "ba6dbe2b9cab0b4de840c996b9b6a3ad"
-SRC_URI[sha256sum] = "b2615e236ef25d0fb94b8420bdd2e2a520b7dd5ca2d4b93306154f7fd4adecc3"
+SRC_URI[md5sum] = "fa0558a3d02c2bb8c208c030ccdc992e"
+SRC_URI[sha256sum] = "e6373913142338d10515daf619d659433bfd2989988198930c13b0945a15e98a"
 
 S = "${WORKDIR}/Mesa-${PV}"
 
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index cda310a..b046ae2 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -4,13 +4,10 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3de"
 
-SRCREV = "0028eb1083e6adc110a23a5f02c993cda217067a"
-PV = "10.1.3+git${SRCPV}"
+SRCREV = "c7b9a2e38a3e471562b50dab8be65db8ac6819f8"
+PV = "10.3.4+git${SRCPV}"
 
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;branch=10.1 \
-           file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
-           file://0006-fix-out-of-tree-egl.patch \
-           "
+SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;branch=10.4"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


