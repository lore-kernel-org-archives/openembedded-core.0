Return-Path: <valentin.popa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 102416D4F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 11:59:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2013 04:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,616,1378882800"; d="scan'208";a="426425846"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.58])
	([10.237.105.58])
	by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2013 04:59:41 -0700
Message-ID: <527397FC.5010605@intel.com>
Date: Fri, 01 Nov 2013 14:01:00 +0200
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Saul Wold <sgw@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <1383128859-25223-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1383128859-25223-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH V2] Mesa: upgrade to 9.2.2
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
X-List-Received-Date: Fri, 01 Nov 2013 11:59:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Updated mesa patch:

On 10/30/2013 12:27 PM, Valentin Popa wrote:
> * License is still MIT
> * removed patches were already merged or
>    another solution was backported.
>
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>   ...ate-NativeDisplayType-depending-on-config.patch | 362 ---------------------
>   .../mesa/{mesa-gl_9.1.6.bb => mesa-gl_9.2.2.bb}    |   0
>   meta/recipes-graphics/mesa/mesa.inc                |   2 +-
>   ...void-use-of-AC_CHECK_FILE-for-cross-compi.patch |  65 ----
>   ...ate-NativeDisplayType-depending-on-config.patch |  35 +-
>   ...sl-fix-builtin_compiler-cross-compilation.patch |  54 ---
>   .../mesa/0005-fix-out-of-tree-builds-gallium.patch |  42 ---
>   ...move-the-power-of-two-sizeof-struct-cmd_b.patch |   0
>   .../mesa/{mesa_9.1.6.bb => mesa_9.2.2.bb}          |   9 +-
>   meta/recipes-graphics/mesa/mesa_git.bb             |   8 +-
>   10 files changed, 24 insertions(+), 553 deletions(-)
>   delete mode 100644 meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
>   rename meta/recipes-graphics/mesa/{mesa-gl_9.1.6.bb => mesa-gl_9.2.2.bb} (100%)
>   delete mode 100644 meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
>   delete mode 100644 meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch
>   delete mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
>   rename meta/recipes-graphics/mesa/{mesa-9.1.6 => mesa}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch (100%)
>   rename meta/recipes-graphics/mesa/{mesa_9.1.6.bb => mesa_9.2.2.bb} (34%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> deleted file mode 100644
> index 30a3d98..0000000
> --- a/meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> +++ /dev/null
> @@ -1,362 +0,0 @@
> -From 06c1ba29de8a26fffb73ee99f0fc54c704e9fee4 Mon Sep 17 00:00:00 2001
> -From: Daniel Stone <daniel@fooishbar.org>
> -Date: Fri, 24 May 2013 17:20:27 +0100
> -Subject: [PATCH 3/5] EGL: Mutate NativeDisplayType depending on config
> -
> -If we go through ./configure without enabling X11 anywhere, then set the
> -fallback types for EGL NativeDisplay and friends, rather than assuming
> -X11/Xlib.
> -
> -Upstream-Status: Backport (slightly different solution was applied in master
> -https://bugs.freedesktop.org/show_bug.cgi?id=64959)
> -
> -Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - configure.ac                 |   9 +++
> - include/EGL/eglplatform.h    | 146 -------------------------------------------
> - include/EGL/eglplatform.h.in | 146 +++++++++++++++++++++++++++++++++++++++++++
> - 3 files changed, 155 insertions(+), 146 deletions(-)
> - delete mode 100644 include/EGL/eglplatform.h
> - create mode 100644 include/EGL/eglplatform.h.in
> -
> -diff --git a/configure.ac b/configure.ac
> -index 2b4a374..d4c7a95 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1565,12 +1565,20 @@ fi
> -
> - EGL_PLATFORMS="$egl_platforms"
> -
> -+if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
> -+    MESA_EGL_NO_X11_HEADERS=0
> -+else
> -+    MESA_EGL_NO_X11_HEADERS=1
> -+fi
> -+
> - AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1)
> - AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" | grep 'wayland' >/dev/null 2>&1)
> - AM_CONDITIONAL(HAVE_EGL_PLATFORM_DRM, echo "$egl_platforms" | grep 'drm' >/dev/null 2>&1)
> - AM_CONDITIONAL(HAVE_EGL_PLATFORM_FBDEV, echo "$egl_platforms" | grep 'fbdev' >/dev/null 2>&1)
> - AM_CONDITIONAL(HAVE_EGL_PLATFORM_NULL, echo "$egl_platforms" | grep 'null' >/dev/null 2>&1)
> -
> -+AC_SUBST([MESA_EGL_NO_X11_HEADERS])
> -+
> - AM_CONDITIONAL(HAVE_EGL_DRIVER_DRI2, test "x$HAVE_EGL_DRIVER_DRI2" != "x")
> - AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" != "x")
> -
> -@@ -2042,6 +2050,7 @@ CXXFLAGS="$CXXFLAGS $USER_CXXFLAGS"
> -
> - dnl Substitute the config
> - AC_CONFIG_FILES([Makefile
> -+		include/EGL/eglplatform.h
> - 		src/Makefile
> - 		src/egl/Makefile
> - 		src/egl/drivers/Makefile
> -diff --git a/include/EGL/eglplatform.h b/include/EGL/eglplatform.h
> -deleted file mode 100644
> -index 17fdc61..0000000
> ---- a/include/EGL/eglplatform.h
> -+++ /dev/null
> -@@ -1,146 +0,0 @@
> --#ifndef __eglplatform_h_
> --#define __eglplatform_h_
> --
> --/*
> --** Copyright (c) 2007-2009 The Khronos Group Inc.
> --**
> --** Permission is hereby granted, free of charge, to any person obtaining a
> --** copy of this software and/or associated documentation files (the
> --** "Materials"), to deal in the Materials without restriction, including
> --** without limitation the rights to use, copy, modify, merge, publish,
> --** distribute, sublicense, and/or sell copies of the Materials, and to
> --** permit persons to whom the Materials are furnished to do so, subject to
> --** the following conditions:
> --**
> --** The above copyright notice and this permission notice shall be included
> --** in all copies or substantial portions of the Materials.
> --**
> --** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> --** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> --** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> --** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> --** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> --** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> --** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
> --*/
> --
> --/* Platform-specific types and definitions for egl.h
> -- * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
> -- *
> -- * Adopters may modify khrplatform.h and this file to suit their platform.
> -- * You are encouraged to submit all modifications to the Khronos group so that
> -- * they can be included in future versions of this file.  Please submit changes
> -- * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
> -- * by filing a bug against product "EGL" component "Registry".
> -- */
> --
> --#include <KHR/khrplatform.h>
> --
> --/* Macros used in EGL function prototype declarations.
> -- *
> -- * EGL functions should be prototyped as:
> -- *
> -- * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
> -- * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
> -- *
> -- * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
> -- */
> --
> --#ifndef EGLAPI
> --#define EGLAPI KHRONOS_APICALL
> --#endif
> --
> --#ifndef EGLAPIENTRY
> --#define EGLAPIENTRY  KHRONOS_APIENTRY
> --#endif
> --#define EGLAPIENTRYP EGLAPIENTRY*
> --
> --/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
> -- * are aliases of window-system-dependent types, such as X Display * or
> -- * Windows Device Context. They must be defined in platform-specific
> -- * code below. The EGL-prefixed versions of Native*Type are the same
> -- * types, renamed in EGL 1.3 so all types in the API start with "EGL".
> -- *
> -- * Khronos STRONGLY RECOMMENDS that you use the default definitions
> -- * provided below, since these changes affect both binary and source
> -- * portability of applications using EGL running on different EGL
> -- * implementations.
> -- */
> --
> --#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
> --#ifndef WIN32_LEAN_AND_MEAN
> --#define WIN32_LEAN_AND_MEAN 1
> --#endif
> --#include <windows.h>
> --
> --typedef HDC     EGLNativeDisplayType;
> --typedef HBITMAP EGLNativePixmapType;
> --typedef HWND    EGLNativeWindowType;
> --
> --#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
> --
> --typedef int   EGLNativeDisplayType;
> --typedef void *EGLNativeWindowType;
> --typedef void *EGLNativePixmapType;
> --
> --#elif defined(WL_EGL_PLATFORM)
> --
> --typedef struct wl_display     *EGLNativeDisplayType;
> --typedef struct wl_egl_pixmap  *EGLNativePixmapType;
> --typedef struct wl_egl_window  *EGLNativeWindowType;
> --
> --#elif defined(__GBM__)
> --
> --typedef struct gbm_device  *EGLNativeDisplayType;
> --typedef struct gbm_bo      *EGLNativePixmapType;
> --typedef void               *EGLNativeWindowType;
> --
> --#elif defined(ANDROID) /* Android */
> --
> --struct ANativeWindow;
> --struct egl_native_pixmap_t;
> --
> --typedef struct ANativeWindow        *EGLNativeWindowType;
> --typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
> --typedef void                        *EGLNativeDisplayType;
> --
> --#elif defined(__unix__)
> --
> --#ifdef MESA_EGL_NO_X11_HEADERS
> --
> --typedef void            *EGLNativeDisplayType;
> --typedef khronos_uint32_t EGLNativePixmapType;
> --typedef khronos_uint32_t EGLNativeWindowType;
> --
> --#else
> --
> --/* X11 (tentative)  */
> --#include <X11/Xlib.h>
> --#include <X11/Xutil.h>
> --
> --typedef Display *EGLNativeDisplayType;
> --typedef Pixmap   EGLNativePixmapType;
> --typedef Window   EGLNativeWindowType;
> --
> --#endif /* MESA_EGL_NO_X11_HEADERS */
> --
> --#else
> --#error "Platform not recognized"
> --#endif
> --
> --/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
> --typedef EGLNativeDisplayType NativeDisplayType;
> --typedef EGLNativePixmapType  NativePixmapType;
> --typedef EGLNativeWindowType  NativeWindowType;
> --
> --
> --/* Define EGLint. This must be a signed integral type large enough to contain
> -- * all legal attribute names and values passed into and out of EGL, whether
> -- * their type is boolean, bitmask, enumerant (symbolic constant), integer,
> -- * handle, or other.  While in general a 32-bit integer will suffice, if
> -- * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
> -- * integer type.
> -- */
> --typedef khronos_int32_t EGLint;
> --
> --#endif /* __eglplatform_h */
> -diff --git a/include/EGL/eglplatform.h.in b/include/EGL/eglplatform.h.in
> -new file mode 100644
> -index 0000000..5126c92
> ---- /dev/null
> -+++ b/include/EGL/eglplatform.h.in
> -@@ -0,0 +1,146 @@
> -+#ifndef __eglplatform_h_
> -+#define __eglplatform_h_
> -+
> -+/*
> -+** Copyright (c) 2007-2009 The Khronos Group Inc.
> -+**
> -+** Permission is hereby granted, free of charge, to any person obtaining a
> -+** copy of this software and/or associated documentation files (the
> -+** "Materials"), to deal in the Materials without restriction, including
> -+** without limitation the rights to use, copy, modify, merge, publish,
> -+** distribute, sublicense, and/or sell copies of the Materials, and to
> -+** permit persons to whom the Materials are furnished to do so, subject to
> -+** the following conditions:
> -+**
> -+** The above copyright notice and this permission notice shall be included
> -+** in all copies or substantial portions of the Materials.
> -+**
> -+** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> -+** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> -+** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> -+** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> -+** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> -+** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> -+** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
> -+*/
> -+
> -+/* Platform-specific types and definitions for egl.h
> -+ * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
> -+ *
> -+ * Adopters may modify khrplatform.h and this file to suit their platform.
> -+ * You are encouraged to submit all modifications to the Khronos group so that
> -+ * they can be included in future versions of this file.  Please submit changes
> -+ * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
> -+ * by filing a bug against product "EGL" component "Registry".
> -+ */
> -+
> -+#include <KHR/khrplatform.h>
> -+
> -+/* Macros used in EGL function prototype declarations.
> -+ *
> -+ * EGL functions should be prototyped as:
> -+ *
> -+ * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
> -+ * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
> -+ *
> -+ * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
> -+ */
> -+
> -+#ifndef EGLAPI
> -+#define EGLAPI KHRONOS_APICALL
> -+#endif
> -+
> -+#ifndef EGLAPIENTRY
> -+#define EGLAPIENTRY  KHRONOS_APIENTRY
> -+#endif
> -+#define EGLAPIENTRYP EGLAPIENTRY*
> -+
> -+/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
> -+ * are aliases of window-system-dependent types, such as X Display * or
> -+ * Windows Device Context. They must be defined in platform-specific
> -+ * code below. The EGL-prefixed versions of Native*Type are the same
> -+ * types, renamed in EGL 1.3 so all types in the API start with "EGL".
> -+ *
> -+ * Khronos STRONGLY RECOMMENDS that you use the default definitions
> -+ * provided below, since these changes affect both binary and source
> -+ * portability of applications using EGL running on different EGL
> -+ * implementations.
> -+ */
> -+
> -+#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
> -+#ifndef WIN32_LEAN_AND_MEAN
> -+#define WIN32_LEAN_AND_MEAN 1
> -+#endif
> -+#include <windows.h>
> -+
> -+typedef HDC     EGLNativeDisplayType;
> -+typedef HBITMAP EGLNativePixmapType;
> -+typedef HWND    EGLNativeWindowType;
> -+
> -+#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
> -+
> -+typedef int   EGLNativeDisplayType;
> -+typedef void *EGLNativeWindowType;
> -+typedef void *EGLNativePixmapType;
> -+
> -+#elif defined(WL_EGL_PLATFORM)
> -+
> -+typedef struct wl_display     *EGLNativeDisplayType;
> -+typedef struct wl_egl_pixmap  *EGLNativePixmapType;
> -+typedef struct wl_egl_window  *EGLNativeWindowType;
> -+
> -+#elif defined(__GBM__)
> -+
> -+typedef struct gbm_device  *EGLNativeDisplayType;
> -+typedef struct gbm_bo      *EGLNativePixmapType;
> -+typedef void               *EGLNativeWindowType;
> -+
> -+#elif defined(ANDROID) /* Android */
> -+
> -+struct ANativeWindow;
> -+struct egl_native_pixmap_t;
> -+
> -+typedef struct ANativeWindow        *EGLNativeWindowType;
> -+typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
> -+typedef void                        *EGLNativeDisplayType;
> -+
> -+#elif defined(__unix__)
> -+
> -+#if @MESA_EGL_NO_X11_HEADERS@
> -+
> -+typedef void            *EGLNativeDisplayType;
> -+typedef khronos_uint32_t EGLNativePixmapType;
> -+typedef khronos_uint32_t EGLNativeWindowType;
> -+
> -+#else
> -+
> -+/* X11 (tentative)  */
> -+#include <X11/Xlib.h>
> -+#include <X11/Xutil.h>
> -+
> -+typedef Display *EGLNativeDisplayType;
> -+typedef Pixmap   EGLNativePixmapType;
> -+typedef Window   EGLNativeWindowType;
> -+
> -+#endif /* MESA_EGL_NO_X11_HEADERS */
> -+
> -+#else
> -+#error "Platform not recognized"
> -+#endif
> -+
> -+/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
> -+typedef EGLNativeDisplayType NativeDisplayType;
> -+typedef EGLNativePixmapType  NativePixmapType;
> -+typedef EGLNativeWindowType  NativeWindowType;
> -+
> -+
> -+/* Define EGLint. This must be a signed integral type large enough to contain
> -+ * all legal attribute names and values passed into and out of EGL, whether
> -+ * their type is boolean, bitmask, enumerant (symbolic constant), integer,
> -+ * handle, or other.  While in general a 32-bit integer will suffice, if
> -+ * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
> -+ * integer type.
> -+ */
> -+typedef khronos_int32_t EGLint;
> -+
> -+#endif /* __eglplatform_h */
> ---
> -1.8.2.1
> -
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_9.2.2.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_9.2.2.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index afc795c..5cbf56d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
>   BUGTRACKER = "https://bugs.freedesktop.org"
>   SECTION = "x11"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555d"
> +LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eacf"
>   
>   INC_PR = "r9"
>   PE = "2"
> diff --git a/meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch b/meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
> deleted file mode 100644
> index 76b5a18..0000000
> --- a/meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From e21ce89f7ae6964f196086ff325d79e4a3b5acd8 Mon Sep 17 00:00:00 2001
> -From: Jonathan Liu <net147@gmail.com>
> -Date: Tue, 4 Jun 2013 06:04:44 -0700
> -Subject: [PATCH 1/4] configure: Avoid use of AC_CHECK_FILE for cross compiling
> -
> -The AC_CHECK_FILE macro can't be used for cross compiling as it will
> -result in "error: cannot check for file existence when cross compiling".
> -Replace it with the AS_IF macro.
> -
> -Upstream-Status: Submitted
> -http://lists.freedesktop.org/archives/mesa-dev/2013-June/040168.html
> -
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - configure.ac | 12 ++++++------
> - 1 file changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 70c598e..67b8c40 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1630,8 +1630,8 @@ if test "x$enable_gallium_llvm" = xyes; then
> -                 CLANG_LIBDIR=${LLVM_LIBDIR}
> -             fi
> -             CLANG_RESOURCE_DIR=$CLANG_LIBDIR/clang/${LLVM_VERSION}
> --            AC_CHECK_FILE("$CLANG_RESOURCE_DIR/include/stddef.h",,
> --                AC_MSG_ERROR([Could not find clang internal header stddef.h in $CLANG_RESOURCE_DIR Use --with-clang-libdir to specify the correct path to the clang libraries.]))
> -+            AS_IF([test ! -f "$CLANG_RESOURCE_DIR/include/stddef.h"],
> -+                [AC_MSG_ERROR([Could not find clang internal header stddef.h in $CLANG_RESOURCE_DIR Use --with-clang-libdir to specify the correct path to the clang libraries.])])
> -         fi
> -     else
> - 	MESA_LLVM=0
> -@@ -1861,7 +1861,7 @@ if test "x$MESA_LLVM" != x0; then
> -     if test "x$with_llvm_shared_libs" = xyes; then
> -         dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
> -         LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version`
> --        AC_CHECK_FILE("$LLVM_LIBDIR/lib$LLVM_SO_NAME.so", llvm_have_one_so=yes,)
> -+        AS_IF([test -f "$LLVM_LIBDIR/lib$LLVM_SO_NAME.so"], [llvm_have_one_so=yes])
> -
> -         if test "x$llvm_have_one_so" = xyes; then
> -             dnl LLVM was built using auto*, so there is only one shared object.
> -@@ -1869,8 +1869,8 @@ if test "x$MESA_LLVM" != x0; then
> -         else
> -             dnl If LLVM was built with CMake, there will be one shared object per
> -             dnl component.
> --            AC_CHECK_FILE("$LLVM_LIBDIR/libLLVMTarget.so",,
> --                    AC_MSG_ERROR([Could not find llvm shared libraries:
> -+            AS_IF([test ! -f "$LLVM_LIBDIR/libLLVMTarget.so"],
> -+                    [AC_MSG_ERROR([Could not find llvm shared libraries:
> - 	Please make sure you have built llvm with the --enable-shared option
> - 	and that your llvm libraries are installed in $LLVM_LIBDIR
> - 	If you have installed your llvm libraries to a different directory you
> -@@ -1881,7 +1881,7 @@ if test "x$MESA_LLVM" != x0; then
> - 		--enable-opencl
> - 	If you do not want to build with llvm shared libraries and instead want to
> - 	use llvm static libraries then remove these options from your configure
> --	invocation and reconfigure.]))
> -+	invocation and reconfigure.])])
> -
> -            dnl We don't need to update LLVM_LIBS in this case because the LLVM
> -            dnl install uses a shared object for each compoenent and we have
> ---
> -1.8.2.1
> -
> diff --git a/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> index 8a83f4b..30a3d98 100644
> --- a/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> +++ b/meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> @@ -1,7 +1,7 @@
> -From 8d31ae23683394617c49301b039b3a069b9ea436 Mon Sep 17 00:00:00 2001
> +From 06c1ba29de8a26fffb73ee99f0fc54c704e9fee4 Mon Sep 17 00:00:00 2001
>   From: Daniel Stone <daniel@fooishbar.org>
>   Date: Fri, 24 May 2013 17:20:27 +0100
> -Subject: [PATCH 3/4] EGL: Mutate NativeDisplayType depending on config
> +Subject: [PATCH 3/5] EGL: Mutate NativeDisplayType depending on config
>   
>   If we go through ./configure without enabling X11 anywhere, then set the
>   fallback types for EGL NativeDisplay and friends, rather than assuming
> @@ -13,36 +13,39 @@ https://bugs.freedesktop.org/show_bug.cgi?id=64959)
>   Signed-off-by: Daniel Stone <daniel@fooishbar.org>
>   Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   ---
> - configure.ac                 |   5 ++
> + configure.ac                 |   9 +++
>    include/EGL/eglplatform.h    | 146 -------------------------------------------
>    include/EGL/eglplatform.h.in | 146 +++++++++++++++++++++++++++++++++++++++++++
> - 3 files changed, 151 insertions(+), 146 deletions(-)
> + 3 files changed, 155 insertions(+), 146 deletions(-)
>    delete mode 100644 include/EGL/eglplatform.h
>    create mode 100644 include/EGL/eglplatform.h.in
>   
>   diff --git a/configure.ac b/configure.ac
> -index 67b8c40..afc3217 100644
> +index 2b4a374..d4c7a95 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -1499,6 +1499,9 @@ EGL_PLATFORMS="$egl_platforms"
> +@@ -1565,12 +1565,20 @@ fi
>    
> - if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
> -     NEED_WINSYS_XLIB=yes
> + EGL_PLATFORMS="$egl_platforms"
> +
> ++if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
>   +    MESA_EGL_NO_X11_HEADERS=0
>   +else
>   +    MESA_EGL_NO_X11_HEADERS=1
> - fi
> ++fi
> ++
>    AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1)
>    AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" | grep 'wayland' >/dev/null 2>&1)
> -@@ -1512,6 +1515,7 @@ AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" != "x")
> - AC_SUBST([EGL_NATIVE_PLATFORM])
> - AC_SUBST([EGL_PLATFORMS])
> - AC_SUBST([EGL_CFLAGS])
> + AM_CONDITIONAL(HAVE_EGL_PLATFORM_DRM, echo "$egl_platforms" | grep 'drm' >/dev/null 2>&1)
> + AM_CONDITIONAL(HAVE_EGL_PLATFORM_FBDEV, echo "$egl_platforms" | grep 'fbdev' >/dev/null 2>&1)
> + AM_CONDITIONAL(HAVE_EGL_PLATFORM_NULL, echo "$egl_platforms" | grep 'null' >/dev/null 2>&1)
> +
>   +AC_SUBST([MESA_EGL_NO_X11_HEADERS])
> ++
> + AM_CONDITIONAL(HAVE_EGL_DRIVER_DRI2, test "x$HAVE_EGL_DRIVER_DRI2" != "x")
> + AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" != "x")
>    
> - AC_ARG_WITH([egl-driver-dir],
> -     [AS_HELP_STRING([--with-egl-driver-dir=DIR],
> -@@ -1991,6 +1995,7 @@ CXXFLAGS="$CXXFLAGS $USER_CXXFLAGS"
> +@@ -2042,6 +2050,7 @@ CXXFLAGS="$CXXFLAGS $USER_CXXFLAGS"
>    
>    dnl Substitute the config
>    AC_CONFIG_FILES([Makefile
> diff --git a/meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch b/meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch
> deleted file mode 100644
> index 460a274..0000000
> --- a/meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From ab38c97f057f739533a4e1fc9de51ea5f4e6242d Mon Sep 17 00:00:00 2001
> -From: Jonathan Liu <net147@gmail.com>
> -Date: Sat, 29 Jun 2013 11:37:20 +0200
> -Subject: [PATCH 4/4] glsl: fix builtin_compiler cross-compilation
> -
> -The target libtool is used when building host binaries, which predictably
> -doesn't work.
> -
> -Upstream-Status: Submitted https://bugs.freedesktop.org/show_bug.cgi?id=44618
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - src/glsl/builtin_compiler/Makefile.am | 13 +++++++++++++
> - 1 file changed, 13 insertions(+)
> -
> -diff --git a/src/glsl/builtin_compiler/Makefile.am b/src/glsl/builtin_compiler/Makefile.am
> -index e11a17f..8ebe0a2 100644
> ---- a/src/glsl/builtin_compiler/Makefile.am
> -+++ b/src/glsl/builtin_compiler/Makefile.am
> -@@ -64,6 +64,8 @@ AM_CXXFLAGS = $(AM_CFLAGS)
> - include ../Makefile.sources
> -
> - noinst_PROGRAMS = builtin_compiler
> -+
> -+if !CROSS_COMPILING
> - noinst_LTLIBRARIES = libglslcore.la libglcpp.la
> -
> - libglcpp_la_SOURCES =					\
> -@@ -73,6 +75,7 @@ libglcpp_la_SOURCES =					\
> - libglslcore_la_SOURCES =				\
> - 	$(BUILTIN_COMPILER_GENERATED_CXX_FILES)		\
> - 	$(LIBGLSL_FILES)
> -+endif
> -
> - builtin_compiler_SOURCES = \
> - 	$(top_srcdir)/src/mesa/main/hash_table.c	\
> -@@ -81,4 +84,14 @@ builtin_compiler_SOURCES = \
> - 	$(top_srcdir)/src/mesa/program/symbol_table.c	\
> - 	$(BUILTIN_COMPILER_CXX_FILES)			\
> - 	$(GLSL_COMPILER_CXX_FILES)
> -+
> -+if CROSS_COMPILING
> -+builtin_compiler_SOURCES += \
> -+	$(LIBGLCPP_GENERATED_FILES) \
> -+	$(LIBGLCPP_FILES) \
> -+	$(BUILTIN_COMPILER_GENERATED_CXX_FILES) \
> -+	$(LIBGLSL_FILES)
> -+builtin_compiler_CPPFLAGS = $(AM_CPPFLAGS)
> -+else
> - builtin_compiler_LDADD = libglslcore.la libglcpp.la
> -+endif
> ---
> -1.8.2.1
> -
> diff --git a/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch b/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
> deleted file mode 100644
> index 8c5984f..0000000
> --- a/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Upstream-Status: Submitted
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 9e31e15ebb0adbf3cc0394c30cbc1ccd2b35a27f Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Fri, 28 Jun 2013 11:44:58 +0100
> -Subject: [PATCH] build: fix out-of-tree builds in gallium/auxiliary
> -
> -The rules were writing files to e.g. util/u_indices_gen.py, but in an
> -out-of-tree build this directory doesn't exist in the build directory.  So,
> -create the directories just in case.
> -
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - src/gallium/auxiliary/Makefile.am |    4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/gallium/auxiliary/Makefile.am b/src/gallium/auxiliary/Makefile.am
> -index f14279b..0c3e7ba 100644
> ---- a/src/gallium/auxiliary/Makefile.am
> -+++ b/src/gallium/auxiliary/Makefile.am
> -@@ -38,13 +38,17 @@ libgallium_la_SOURCES += \
> - endif
> -
> - indices/u_indices_gen.c: $(srcdir)/indices/u_indices_gen.py
> -+	mkdir --parents indices
> - 	$(AM_V_GEN) $(PYTHON2) $< > $@
> -
> - indices/u_unfilled_gen.c: $(srcdir)/indices/u_unfilled_gen.py
> -+	mkdir --parents indices
> - 	$(AM_V_GEN) $(PYTHON2) $< > $@
> -
> - util/u_format_srgb.c: $(srcdir)/util/u_format_srgb.py
> -+	mkdir --parents util
> - 	$(AM_V_GEN) $(PYTHON2) $< > $@
> -
> - util/u_format_table.c: $(srcdir)/util/u_format_table.py $(srcdir)/util/u_format_pack.py $(srcdir)/util/u_format_parse.py $(srcdir)/util/u_format.csv
> -+	mkdir --parents util
> - 	$(AM_V_GEN) $(PYTHON2) $(srcdir)/util/u_format_table.py $(srcdir)/util/u_format.csv > $@
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-graphics/mesa/mesa-9.1.6/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch b/meta/recipes-graphics/mesa/mesa/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-9.1.6/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
> rename to meta/recipes-graphics/mesa/mesa/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
> diff --git a/meta/recipes-graphics/mesa/mesa_9.1.6.bb b/meta/recipes-graphics/mesa/mesa_9.2.2.bb
> similarity index 34%
> rename from meta/recipes-graphics/mesa/mesa_9.1.6.bb
> rename to meta/recipes-graphics/mesa/mesa_9.2.2.bb
> index b55fa02..60eba01 100644
> --- a/meta/recipes-graphics/mesa/mesa_9.1.6.bb
> +++ b/meta/recipes-graphics/mesa/mesa_9.2.2.bb
> @@ -1,16 +1,11 @@
>   require ${BPN}.inc
>   
>   SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
> -           file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch \
>              file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
> -           file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
> -           file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
> -           file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
> -           file://0005-fix-out-of-tree-builds-gallium.patch \
>              file://0006-fix-out-of-tree-egl.patch \
>              "
>   
> -SRC_URI[md5sum] = "443a2a352667294b53d56cb1a74114e9"
> -SRC_URI[sha256sum] = "e632dff0acafad0a59dc208d16dedb37f7bd58f94c5d58c4b51912e41d005e3d"
> +SRC_URI[md5sum] = "20887f8020db7d1736a01ae9cd5d8c38"
> +SRC_URI[sha256sum] = "c78a5035233672844cf2492fe82dc10877e12026be227d04469d6ca6ac656a3d"
>   
>   S = "${WORKDIR}/Mesa-${PV}"
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
> index 6397ece..19d3e70 100644
> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> @@ -5,15 +5,11 @@ DEFAULT_PREFERENCE = "-1"
>   LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eacf"
>   
>   PR = "${INC_PR}.0"
> -SRCREV = "5a925cc5504575c22dbb7d29842d7fc5babcb5c7"
> -PV = "9.1.3+git${SRCPV}"
> +SRCREV = "8f0742051e8501e737affb392996aef172034ca8"
> +PV = "9.2.2+git${SRCPV}"
>   
>   SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa \
> -           file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch \
>              file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
> -           file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
> -           file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
> -           file://0005-fix-out-of-tree-builds-gallium.patch \
>              file://0006-fix-out-of-tree-egl.patch \
>              "
>   


