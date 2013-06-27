Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 65B6A6AE45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 18:01:50 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id k10so569350eaj.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 11:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p6hjYRDoJS3Peip3brFGlY8wnKJf4QgtI2DYmP//OLE=;
	b=I70dB8a+fK7WZg462MIlTGLy0Fq8kWJ5UJVBoa/XR+GqLfJLxbRDarc8FVX+SJ6Gwc
	UTwS1HFx2L7szaI+cX1wuu5MavukrcriTGtN9N/gB7U6hcLwmPUKBXlnutWUpsmOkMbe
	O6i+CY4gH6ZluVPUpeFxsiF4nm42f4hIJ5GPV+N8mypiaRyhm62MUuoBdE5HEYSQncJp
	p556xTFOZz92nDlPJLCQ2LNxrg7kketSTO/VYNpWQAxENenTK6ztWJFrKDIpFy8voXYJ
	lG6hkwjo1UxjwjN0oxLP6nTKPVz/mywrNXypsGvxKtfvsa9OZTDq4jtAR5qns6vlx1uP
	yNPA==
X-Received: by 10.15.33.132 with SMTP id c4mr10304635eev.12.1372356110469;
	Thu, 27 Jun 2013 11:01:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id y1sm5335351eew.3.2013.06.27.11.01.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 27 Jun 2013 11:01:49 -0700 (PDT)
Date: Thu, 27 Jun 2013 20:02:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20130627180228.GI3261@jama>
References: <1372174723-24943-1-git-send-email-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1372174723-24943-1-git-send-email-nicolas.dechesne@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: patches@linaro.org, openembedded-core@lists.openembedded.org
Subject: Re: [dylan][PATCH] mesa: fix EGL compilation without X11 headers
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
X-List-Received-Date: Thu, 27 Jun 2013 18:01:50 -0000
X-Groupsio-MsgNum: 41048
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TmwHKJoIRFM7Mu/A"
Content-Disposition: inline

--TmwHKJoIRFM7Mu/A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2013 at 05:38:43PM +0200, Nicolas Dechesne wrote:
> Extracted from "d7033f4 mesa: upgrade to 9.1.3", already merged in master:
>=20
> --
> Add EGL-Mutate-NativeDisplayType-depending-on-config.patch to build corre=
ctly in
> a non-X11 environment.
>=20
> Drop fix-egl-compilation-without-x11-headers.patch as they were backports.
> --
>=20
> The new patch was also backported (trivial) to mesa 9.0.2 which is in
> dylan.
>=20
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta/recipes-graphics/mesa/mesa-9.0.2.inc          |   2 +-
>  ...ate-NativeDisplayType-depending-on-config.patch | 361 +++++++++++++++=
++++++
>  2 files changed, 362 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisp=
layType-depending-on-config.patch
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-9.0.2.inc b/meta/recipes-gra=
phics/mesa/mesa-9.0.2.inc
> index b88bc42..e2dcfdb 100644
> --- a/meta/recipes-graphics/mesa/mesa-9.0.2.inc
> +++ b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
> @@ -2,7 +2,7 @@ SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/Mes=
aLib-${PV}.tar.bz2 \
>             file://0002-cross-compile.patch \
>             file://cross-glsl.patch \
>             file://dont-fail-if-libX11-isnt-installed.patch \
> -           file://fix-egl-compilation-without-x11-headers.patch \
> +           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch=
 \
>             "

EGL-Mutate-NativeDisplayType-depending-on-config.patch does not cover

#include "state_tracker/xlib_sw_winsys.h"
in
src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c

so builds with pipe-loader enabled and without x11 headers are still
failing, the same issue is in master.

>  SRC_URI[md5sum] =3D "dc45d1192203e418163e0017640e1cfc"
> diff --git a/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType=
-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-Nat=
iveDisplayType-depending-on-config.patch
> new file mode 100644
> index 0000000..98c4095
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depend=
ing-on-config.patch
> @@ -0,0 +1,361 @@
> +From 7e5846aa52c7cb00b0db9fa393975880371d2620 Mon Sep 17 00:00:00 2001
> +From: Daniel Stone <daniel@fooishbar.org>
> +Date: Fri, 24 May 2013 17:20:27 +0100
> +Subject: [PATCH] EGL: Mutate NativeDisplayType depending on config
> +
> +If we go through ./configure without enabling X11 anywhere, then set the
> +fallback types for EGL NativeDisplay and friends, rather than assuming
> +X11/Xlib.
> +
> +Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> +
> +Conflicts:
> +	configure.ac
> +---
> + configure.ac                 |   9 +++
> + include/EGL/eglplatform.h    | 146 ------------------------------------=
-------
> + include/EGL/eglplatform.h.in | 146 ++++++++++++++++++++++++++++++++++++=
+++++++
> + 3 files changed, 155 insertions(+), 146 deletions(-)
> + delete mode 100644 include/EGL/eglplatform.h
> + create mode 100644 include/EGL/eglplatform.h.in
> +
> +diff --git a/configure.ac b/configure.ac
> +index 682e0a5..a8a485d 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1577,12 +1577,20 @@ fi
> +=20
> + EGL_PLATFORMS=3D"$egl_platforms"
> +=20
> ++if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
> ++    MESA_EGL_NO_X11_HEADERS=3D0
> ++else
> ++    MESA_EGL_NO_X11_HEADERS=3D1
> ++fi
> ++
> + AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep 'x11=
' >/dev/null 2>&1)
> + AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" | grep =
'wayland' >/dev/null 2>&1)
> + AM_CONDITIONAL(HAVE_EGL_PLATFORM_DRM, echo "$egl_platforms" | grep 'drm=
' >/dev/null 2>&1)
> + AM_CONDITIONAL(HAVE_EGL_PLATFORM_FBDEV, echo "$egl_platforms" | grep 'f=
bdev' >/dev/null 2>&1)
> + AM_CONDITIONAL(HAVE_EGL_PLATFORM_NULL, echo "$egl_platforms" | grep 'nu=
ll' >/dev/null 2>&1)
> +=20
> ++AC_SUBST([MESA_EGL_NO_X11_HEADERS])
> ++
> + AM_CONDITIONAL(HAVE_EGL_DRIVER_DRI2, test "x$HAVE_EGL_DRIVER_DRI2" !=3D=
 "x")
> + AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" !=3D "=
x")
> +=20
> +@@ -1953,6 +1961,7 @@ CXXFLAGS=3D"$CXXFLAGS $USER_CXXFLAGS"
> + dnl Substitute the config
> + AC_CONFIG_FILES([configs/current
> + 		Makefile
> ++		include/EGL/eglplatform.h
> + 		src/egl/Makefile
> + 		src/egl/drivers/Makefile
> + 		src/egl/drivers/dri2/Makefile
> +diff --git a/include/EGL/eglplatform.h b/include/EGL/eglplatform.h
> +deleted file mode 100644
> +index 17fdc61..0000000
> +--- a/include/EGL/eglplatform.h
> ++++ /dev/null
> +@@ -1,146 +0,0 @@
> +-#ifndef __eglplatform_h_
> +-#define __eglplatform_h_
> +-
> +-/*
> +-** Copyright (c) 2007-2009 The Khronos Group Inc.
> +-**
> +-** Permission is hereby granted, free of charge, to any person obtainin=
g a
> +-** copy of this software and/or associated documentation files (the
> +-** "Materials"), to deal in the Materials without restriction, including
> +-** without limitation the rights to use, copy, modify, merge, publish,
> +-** distribute, sublicense, and/or sell copies of the Materials, and to
> +-** permit persons to whom the Materials are furnished to do so, subject=
 to
> +-** the following conditions:
> +-**
> +-** The above copyright notice and this permission notice shall be inclu=
ded
> +-** in all copies or substantial portions of the Materials.
> +-**
> +-** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> +-** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> +-** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMEN=
T.
> +-** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> +-** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> +-** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> +-** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
> +-*/
> +-
> +-/* Platform-specific types and definitions for egl.h
> +- * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug =
2010) $
> +- *
> +- * Adopters may modify khrplatform.h and this file to suit their platfo=
rm.
> +- * You are encouraged to submit all modifications to the Khronos group =
so that
> +- * they can be included in future versions of this file.  Please submit=
 changes
> +- * by sending them to the public Khronos Bugzilla (http://khronos.org/b=
ugzilla)
> +- * by filing a bug against product "EGL" component "Registry".
> +- */
> +-
> +-#include <KHR/khrplatform.h>
> +-
> +-/* Macros used in EGL function prototype declarations.
> +- *
> +- * EGL functions should be prototyped as:
> +- *
> +- * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
> +- * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
> +- *
> +- * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
> +- */
> +-
> +-#ifndef EGLAPI
> +-#define EGLAPI KHRONOS_APICALL
> +-#endif
> +-
> +-#ifndef EGLAPIENTRY
> +-#define EGLAPIENTRY  KHRONOS_APIENTRY
> +-#endif
> +-#define EGLAPIENTRYP EGLAPIENTRY*
> +-
> +-/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
> +- * are aliases of window-system-dependent types, such as X Display * or
> +- * Windows Device Context. They must be defined in platform-specific
> +- * code below. The EGL-prefixed versions of Native*Type are the same
> +- * types, renamed in EGL 1.3 so all types in the API start with "EGL".
> +- *
> +- * Khronos STRONGLY RECOMMENDS that you use the default definitions
> +- * provided below, since these changes affect both binary and source
> +- * portability of applications using EGL running on different EGL
> +- * implementations.
> +- */
> +-
> +-#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !de=
fined(__SCITECH_SNAP__) /* Win32 and WinCE */
> +-#ifndef WIN32_LEAN_AND_MEAN
> +-#define WIN32_LEAN_AND_MEAN 1
> +-#endif
> +-#include <windows.h>
> +-
> +-typedef HDC     EGLNativeDisplayType;
> +-typedef HBITMAP EGLNativePixmapType;
> +-typedef HWND    EGLNativeWindowType;
> +-
> +-#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
> +-
> +-typedef int   EGLNativeDisplayType;
> +-typedef void *EGLNativeWindowType;
> +-typedef void *EGLNativePixmapType;
> +-
> +-#elif defined(WL_EGL_PLATFORM)
> +-
> +-typedef struct wl_display     *EGLNativeDisplayType;
> +-typedef struct wl_egl_pixmap  *EGLNativePixmapType;
> +-typedef struct wl_egl_window  *EGLNativeWindowType;
> +-
> +-#elif defined(__GBM__)
> +-
> +-typedef struct gbm_device  *EGLNativeDisplayType;
> +-typedef struct gbm_bo      *EGLNativePixmapType;
> +-typedef void               *EGLNativeWindowType;
> +-
> +-#elif defined(ANDROID) /* Android */
> +-
> +-struct ANativeWindow;
> +-struct egl_native_pixmap_t;
> +-
> +-typedef struct ANativeWindow        *EGLNativeWindowType;
> +-typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
> +-typedef void                        *EGLNativeDisplayType;
> +-
> +-#elif defined(__unix__)
> +-
> +-#ifdef MESA_EGL_NO_X11_HEADERS
> +-
> +-typedef void            *EGLNativeDisplayType;
> +-typedef khronos_uint32_t EGLNativePixmapType;
> +-typedef khronos_uint32_t EGLNativeWindowType;
> +-
> +-#else
> +-
> +-/* X11 (tentative)  */
> +-#include <X11/Xlib.h>
> +-#include <X11/Xutil.h>
> +-
> +-typedef Display *EGLNativeDisplayType;
> +-typedef Pixmap   EGLNativePixmapType;
> +-typedef Window   EGLNativeWindowType;
> +-
> +-#endif /* MESA_EGL_NO_X11_HEADERS */
> +-
> +-#else
> +-#error "Platform not recognized"
> +-#endif
> +-
> +-/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
> +-typedef EGLNativeDisplayType NativeDisplayType;
> +-typedef EGLNativePixmapType  NativePixmapType;
> +-typedef EGLNativeWindowType  NativeWindowType;
> +-
> +-
> +-/* Define EGLint. This must be a signed integral type large enough to c=
ontain
> +- * all legal attribute names and values passed into and out of EGL, whe=
ther
> +- * their type is boolean, bitmask, enumerant (symbolic constant), integ=
er,
> +- * handle, or other.  While in general a 32-bit integer will suffice, if
> +- * handles are 64 bit types, then EGLint should be defined as a signed =
64-bit
> +- * integer type.
> +- */
> +-typedef khronos_int32_t EGLint;
> +-
> +-#endif /* __eglplatform_h */
> +diff --git a/include/EGL/eglplatform.h.in b/include/EGL/eglplatform.h.in
> +new file mode 100644
> +index 0000000..5126c92
> +--- /dev/null
> ++++ b/include/EGL/eglplatform.h.in
> +@@ -0,0 +1,146 @@
> ++#ifndef __eglplatform_h_
> ++#define __eglplatform_h_
> ++
> ++/*
> ++** Copyright (c) 2007-2009 The Khronos Group Inc.
> ++**
> ++** Permission is hereby granted, free of charge, to any person obtainin=
g a
> ++** copy of this software and/or associated documentation files (the
> ++** "Materials"), to deal in the Materials without restriction, including
> ++** without limitation the rights to use, copy, modify, merge, publish,
> ++** distribute, sublicense, and/or sell copies of the Materials, and to
> ++** permit persons to whom the Materials are furnished to do so, subject=
 to
> ++** the following conditions:
> ++**
> ++** The above copyright notice and this permission notice shall be inclu=
ded
> ++** in all copies or substantial portions of the Materials.
> ++**
> ++** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> ++** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> ++** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMEN=
T.
> ++** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> ++** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> ++** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> ++** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
> ++*/
> ++
> ++/* Platform-specific types and definitions for egl.h
> ++ * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug =
2010) $
> ++ *
> ++ * Adopters may modify khrplatform.h and this file to suit their platfo=
rm.
> ++ * You are encouraged to submit all modifications to the Khronos group =
so that
> ++ * they can be included in future versions of this file.  Please submit=
 changes
> ++ * by sending them to the public Khronos Bugzilla (http://khronos.org/b=
ugzilla)
> ++ * by filing a bug against product "EGL" component "Registry".
> ++ */
> ++
> ++#include <KHR/khrplatform.h>
> ++
> ++/* Macros used in EGL function prototype declarations.
> ++ *
> ++ * EGL functions should be prototyped as:
> ++ *
> ++ * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
> ++ * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
> ++ *
> ++ * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
> ++ */
> ++
> ++#ifndef EGLAPI
> ++#define EGLAPI KHRONOS_APICALL
> ++#endif
> ++
> ++#ifndef EGLAPIENTRY
> ++#define EGLAPIENTRY  KHRONOS_APIENTRY
> ++#endif
> ++#define EGLAPIENTRYP EGLAPIENTRY*
> ++
> ++/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
> ++ * are aliases of window-system-dependent types, such as X Display * or
> ++ * Windows Device Context. They must be defined in platform-specific
> ++ * code below. The EGL-prefixed versions of Native*Type are the same
> ++ * types, renamed in EGL 1.3 so all types in the API start with "EGL".
> ++ *
> ++ * Khronos STRONGLY RECOMMENDS that you use the default definitions
> ++ * provided below, since these changes affect both binary and source
> ++ * portability of applications using EGL running on different EGL
> ++ * implementations.
> ++ */
> ++
> ++#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !de=
fined(__SCITECH_SNAP__) /* Win32 and WinCE */
> ++#ifndef WIN32_LEAN_AND_MEAN
> ++#define WIN32_LEAN_AND_MEAN 1
> ++#endif
> ++#include <windows.h>
> ++
> ++typedef HDC     EGLNativeDisplayType;
> ++typedef HBITMAP EGLNativePixmapType;
> ++typedef HWND    EGLNativeWindowType;
> ++
> ++#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
> ++
> ++typedef int   EGLNativeDisplayType;
> ++typedef void *EGLNativeWindowType;
> ++typedef void *EGLNativePixmapType;
> ++
> ++#elif defined(WL_EGL_PLATFORM)
> ++
> ++typedef struct wl_display     *EGLNativeDisplayType;
> ++typedef struct wl_egl_pixmap  *EGLNativePixmapType;
> ++typedef struct wl_egl_window  *EGLNativeWindowType;
> ++
> ++#elif defined(__GBM__)
> ++
> ++typedef struct gbm_device  *EGLNativeDisplayType;
> ++typedef struct gbm_bo      *EGLNativePixmapType;
> ++typedef void               *EGLNativeWindowType;
> ++
> ++#elif defined(ANDROID) /* Android */
> ++
> ++struct ANativeWindow;
> ++struct egl_native_pixmap_t;
> ++
> ++typedef struct ANativeWindow        *EGLNativeWindowType;
> ++typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
> ++typedef void                        *EGLNativeDisplayType;
> ++
> ++#elif defined(__unix__)
> ++
> ++#if @MESA_EGL_NO_X11_HEADERS@
> ++
> ++typedef void            *EGLNativeDisplayType;
> ++typedef khronos_uint32_t EGLNativePixmapType;
> ++typedef khronos_uint32_t EGLNativeWindowType;
> ++
> ++#else
> ++
> ++/* X11 (tentative)  */
> ++#include <X11/Xlib.h>
> ++#include <X11/Xutil.h>
> ++
> ++typedef Display *EGLNativeDisplayType;
> ++typedef Pixmap   EGLNativePixmapType;
> ++typedef Window   EGLNativeWindowType;
> ++
> ++#endif /* MESA_EGL_NO_X11_HEADERS */
> ++
> ++#else
> ++#error "Platform not recognized"
> ++#endif
> ++
> ++/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
> ++typedef EGLNativeDisplayType NativeDisplayType;
> ++typedef EGLNativePixmapType  NativePixmapType;
> ++typedef EGLNativeWindowType  NativeWindowType;
> ++
> ++
> ++/* Define EGLint. This must be a signed integral type large enough to c=
ontain
> ++ * all legal attribute names and values passed into and out of EGL, whe=
ther
> ++ * their type is boolean, bitmask, enumerant (symbolic constant), integ=
er,
> ++ * handle, or other.  While in general a 32-bit integer will suffice, if
> ++ * handles are 64 bit types, then EGLint should be defined as a signed =
64-bit
> ++ * integer type.
> ++ */
> ++typedef khronos_int32_t EGLint;
> ++
> ++#endif /* __eglplatform_h */
> +--=20
> +1.8.1.2
> +
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TmwHKJoIRFM7Mu/A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHMfjQACgkQN1Ujt2V2gByD+QCbBNJA7tARnJcrV9r52dm0+VVj
F4gAn3MRQYTAWog2uSbbk+7mL4IQ3OwZ
=XXqa
-----END PGP SIGNATURE-----

--TmwHKJoIRFM7Mu/A--
