Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0FBD16A49A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 15:38:56 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id m6so958769wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 08:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ZAG0BIcZinkr6Yl8fE0dZa3kAaGys+z5tpyYUqxnyn8=;
	b=cpykoorhE0+2M1RiQiT8ACkK76KT1mgQZtSTBGtMqUYDjB9Lhxm5FR1zE5QMPc6Lo+
	bs3R1LognLE3dp5d1v44rxj4ZebNiPqg9DsQ0bVzMziyoRhVYQjt3xrKCXmOJiceH6ZE
	6+sk6XWSfPTasVirdq3vapCoVJuHlhSZ/A6Sm8DJF1XRbJZhPbGwhzziI9YLiTx1jhDf
	kClQ/yBpNv7CS5fP6K+02jHNvILkjbc6YkxMm7mlteffaeg+OnhqDbkhou8tD1hy4EXQ
	yOQPNzjmYPcn54OXxRx6Z7eCIZNk22uYw0snMX+HZ2rx0qdGp1gLuZp1Zd8Mke1tJ3Q8
	ocrA==
X-Received: by 10.194.77.99 with SMTP id r3mr20589722wjw.5.1372174737161;
	Tue, 25 Jun 2013 08:38:57 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id z6sm1062201wiv.11.2013.06.25.08.38.55
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 08:38:56 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2013 17:38:43 +0200
Message-Id: <1372174723-24943-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.8.1.2
X-Gm-Message-State: ALoCoQk+I3OZ+fh4SF+z+7Dc/tMtmb5RjgWuf2+nAehxsH1AB+rFCK3ukJvWoagRUP7SdXkR1Iad
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, patches@linaro.org
Subject: [dylan][PATCH] mesa: fix EGL compilation without X11 headers
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
X-List-Received-Date: Tue, 25 Jun 2013 15:38:57 -0000

Extracted from "d7033f4 mesa: upgrade to 9.1.3", already merged in master:

--
Add EGL-Mutate-NativeDisplayType-depending-on-config.patch to build correctly in
a non-X11 environment.

Drop fix-egl-compilation-without-x11-headers.patch as they were backports.
--

The new patch was also backported (trivial) to mesa 9.0.2 which is in
dylan.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-graphics/mesa/mesa-9.0.2.inc          |   2 +-
 ...ate-NativeDisplayType-depending-on-config.patch | 361 +++++++++++++++++++++
 2 files changed, 362 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch

diff --git a/meta/recipes-graphics/mesa/mesa-9.0.2.inc b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
index b88bc42..e2dcfdb 100644
--- a/meta/recipes-graphics/mesa/mesa-9.0.2.inc
+++ b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
@@ -2,7 +2,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0002-cross-compile.patch \
            file://cross-glsl.patch \
            file://dont-fail-if-libX11-isnt-installed.patch \
-           file://fix-egl-compilation-without-x11-headers.patch \
+           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            "
 
 SRC_URI[md5sum] = "dc45d1192203e418163e0017640e1cfc"
diff --git a/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
new file mode 100644
index 0000000..98c4095
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
@@ -0,0 +1,361 @@
+From 7e5846aa52c7cb00b0db9fa393975880371d2620 Mon Sep 17 00:00:00 2001
+From: Daniel Stone <daniel@fooishbar.org>
+Date: Fri, 24 May 2013 17:20:27 +0100
+Subject: [PATCH] EGL: Mutate NativeDisplayType depending on config
+
+If we go through ./configure without enabling X11 anywhere, then set the
+fallback types for EGL NativeDisplay and friends, rather than assuming
+X11/Xlib.
+
+Signed-off-by: Daniel Stone <daniel@fooishbar.org>
+
+Conflicts:
+	configure.ac
+---
+ configure.ac                 |   9 +++
+ include/EGL/eglplatform.h    | 146 -------------------------------------------
+ include/EGL/eglplatform.h.in | 146 +++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 155 insertions(+), 146 deletions(-)
+ delete mode 100644 include/EGL/eglplatform.h
+ create mode 100644 include/EGL/eglplatform.h.in
+
+diff --git a/configure.ac b/configure.ac
+index 682e0a5..a8a485d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1577,12 +1577,20 @@ fi
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
+@@ -1953,6 +1961,7 @@ CXXFLAGS="$CXXFLAGS $USER_CXXFLAGS"
+ dnl Substitute the config
+ AC_CONFIG_FILES([configs/current
+ 		Makefile
++		include/EGL/eglplatform.h
+ 		src/egl/Makefile
+ 		src/egl/drivers/Makefile
+ 		src/egl/drivers/dri2/Makefile
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
+1.8.1.2
+
-- 
1.8.1.2


