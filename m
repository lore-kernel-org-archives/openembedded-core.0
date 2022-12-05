Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6338C4708C
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 22:29:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.30966.1670279350242949184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 14:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bKieuZvL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3EA2B40004;
	Mon,  5 Dec 2022 22:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670279348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0pcdRngufRWoWvRMOYmQcCAwqX9MD0oelsibQEm3+I=;
	b=bKieuZvLn6fRsKolEl168pZ+QFo7NPWWYer0TQar3AGms7pxCJmmixa1JkwmmoefeAwJtl
	k0Azkvv8AHJRPnZ8GPFKRu/Di8+fgJtkueMhfPXyLk4ASeMb4oAxWG06VtwQc3+ZBZ6hCT
	jx38gkJJxVGWFep9BA6GueInPHpWxkQ2wXL07g5h1LDuzXld8nVMbgrz9ZV3mUzE24Wrew
	H04c/vk46EOhLtXQn5g705pozQiv5b5d0d5hUupMvu/oA996T9ZL5K2IXKTDRqFqDMKu2/
	eUd/aHvj/c6u2jLkSonYZ8JN1o+/rcJXa/NgIio4tsnM7UTCZSO3xc7lPXaUDg==
Date: Mon, 5 Dec 2022 23:29:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] gstreamer-vaapi: rename USE_X11 variable
Message-ID: <Y45wsyy6ONbU/5UI@mail.local>
References: <20221205201330.2184787-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221205201330.2184787-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 22:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174307

On 05/12/2022 21:13:30+0100, Markus Volk wrote:
> Rename USE_X11 to HAVE_X11 to avoid naming conflict with eglplatform.h
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../0001-replace-USE_X11-by-HAVE_X11.patch    | 319 ++++++++++++++++++
>  .../gstreamer/gstreamer1.0-vaapi_1.20.4.bb    |   9 +-
>  2 files changed, 324 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-replace-USE_X11-by-HAVE_X11.patch
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-replace-USE_X11-by-HAVE_X11.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-replace-USE_X11-by-HAVE_X11.patch
> new file mode 100644
> index 0000000000..8cb17a8a0b
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-replace-USE_X11-by-HAVE_X11.patch
> @@ -0,0 +1,319 @@
> +From ff9c63505183f7620b68d7d848ad6b16a7497c75 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 5 Dec 2022 20:56:43 +0100
> +Subject: [PATCH] replace USE_X11 by HAVE_X11
> +
> +currently used variable collides with eglplatform.h
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Patch-Status: Inappropriate
The proper tag is Upstream-Status. This is checked and the build is
going to fail

> +---
> + ChangeLog                                |  2 +-
> + gst-libs/gst/vaapi/gstvaapidisplay.c     |  2 +-
> + gst-libs/gst/vaapi/gstvaapidisplay_egl.c |  4 ++--
> + gst-libs/gst/vaapi/meson.build           |  4 ++--
> + gst/vaapi/gstvaapipluginutil.c           | 12 ++++++------
> + gst/vaapi/gstvaapisink.c                 |  4 ++--
> + gst/vaapi/gstvaapivideocontext.c         |  4 ++--
> + meson.build                              | 10 +++++-----
> + tests/examples/meson.build               |  2 +-
> + tests/internal/output.c                  |  4 ++--
> + tests/internal/test-display.c            |  4 ++--
> + tests/internal/test-windows.c            |  4 ++--
> + 12 files changed, 28 insertions(+), 28 deletions(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 0f769dd..1c54803 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -5905,7 +5905,7 @@
> + 2019-03-30 18:29:31 +0100  Danilo Spinella <danyspin97@protonmail.com>
> + 
> + 	* gst/vaapi/gstvaapipluginutil.c:
> +-	  vaapipluginutil: Fix #endif for USE_X11
> ++	  vaapipluginutil: Fix #endif for HAVE_X11
> + 
> + 2019-03-29 18:29:51 +0100  V�ctor Manuel J�quez Leal <vjaquez@igalia.com>
> + 
> +diff --git a/gst-libs/gst/vaapi/gstvaapidisplay.c b/gst-libs/gst/vaapi/gstvaapidisplay.c
> +index 5bf4b13..324330e 100644
> +--- a/gst-libs/gst/vaapi/gstvaapidisplay.c
> ++++ b/gst-libs/gst/vaapi/gstvaapidisplay.c
> +@@ -115,7 +115,7 @@ gst_vaapi_display_type_get_type (void)
> +   static const GEnumValue display_types[] = {
> +     {GST_VAAPI_DISPLAY_TYPE_ANY,
> +         "Auto detection", "any"},
> +-#if USE_X11
> ++#if HAVE_X11
> +     {GST_VAAPI_DISPLAY_TYPE_X11,
> +         "VA/X11 display", "x11"},
> + #endif
> +diff --git a/gst-libs/gst/vaapi/gstvaapidisplay_egl.c b/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
> +index fcffecd..06ac70b 100644
> +--- a/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
> ++++ b/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
> +@@ -28,7 +28,7 @@
> + #include "gstvaapiwindow_priv.h"
> + #include "gstvaapitexture_egl.h"
> + 
> +-#if USE_X11
> ++#if HAVE_X11
> + #include "gstvaapidisplay_x11.h"
> + #endif
> + #if USE_WAYLAND
> +@@ -110,7 +110,7 @@ gst_vaapi_display_egl_bind_display (GstVaapiDisplay * base_display,
> +   native_egl_display = params->gl_display;
> + 
> +   if (!native_vaapi_display) {
> +-#if USE_X11
> ++#if HAVE_X11
> +     if (params->display_type == GST_VAAPI_DISPLAY_TYPE_ANY
> +         || params->display_type == GST_VAAPI_DISPLAY_TYPE_X11
> +         || params->display_type == GST_VAAPI_DISPLAY_TYPE_EGL)
> +diff --git a/gst-libs/gst/vaapi/meson.build b/gst-libs/gst/vaapi/meson.build
> +index 2e15063..26bface 100644
> +--- a/gst-libs/gst/vaapi/meson.build
> ++++ b/gst-libs/gst/vaapi/meson.build
> +@@ -126,7 +126,7 @@ if USE_DRM
> +     ]
> + endif
> + 
> +-if USE_X11
> ++if HAVE_X11
> +   gstlibvaapi_sources += [
> +       'gstvaapidisplay_x11.c',
> +       'gstvaapiutils_x11.c',
> +@@ -224,7 +224,7 @@ endif
> + if USE_WAYLAND
> +   gstlibvaapi_deps  += [libva_wayland_dep, gstglwayland_dep, wayland_client_dep, wayland_protocols_dep]
> + endif
> +-if USE_X11
> ++if HAVE_X11
> +   gstlibvaapi_deps  += [libva_x11_dep, x11_dep, xrandr_dep, gstglx11_dep]
> + endif
> + 
> +diff --git a/gst/vaapi/gstvaapipluginutil.c b/gst/vaapi/gstvaapipluginutil.c
> +index 0c47b75..8bc4419 100644
> +--- a/gst/vaapi/gstvaapipluginutil.c
> ++++ b/gst/vaapi/gstvaapipluginutil.c
> +@@ -29,7 +29,7 @@
> + #if USE_DRM
> + # include <gst/vaapi/gstvaapidisplay_drm.h>
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> + # include <gst/vaapi/gstvaapidisplay_x11.h>
> + #endif
> + #if USE_GLX
> +@@ -80,7 +80,7 @@ static const DisplayMap g_display_map[] = {
> +    (GstVaapiDisplayCreateFromHandleFunc)
> +    gst_vaapi_display_glx_new_with_display},
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> +   {"x11",
> +    GST_VAAPI_DISPLAY_TYPE_X11,
> +    gst_vaapi_display_x11_new,
> +@@ -140,7 +140,7 @@ gst_vaapi_get_display_type_from_gl (GstGLDisplayType gl_display_type,
> +     GstGLPlatform gl_platform)
> + {
> +   switch (gl_display_type) {
> +-#if USE_X11
> ++#if HAVE_X11
> +     case GST_GL_DISPLAY_TYPE_X11:{
> + #if USE_GLX
> +       if (gl_platform == GST_GL_PLATFORM_GLX)
> +@@ -178,7 +178,7 @@ gst_vaapi_get_display_type_from_gl_env (void)
> +   const gchar *const gl_window_type = g_getenv ("GST_GL_WINDOW");
> + 
> +   if (!gl_window_type) {
> +-#if USE_X11 && GST_GL_HAVE_WINDOW_X11
> ++#if HAVE_X11 && GST_GL_HAVE_WINDOW_X11
> +     return GST_VAAPI_DISPLAY_TYPE_X11;
> + #elif USE_WAYLAND && GST_GL_HAVE_WINDOW_WAYLAND
> +     return GST_VAAPI_DISPLAY_TYPE_WAYLAND;
> +@@ -186,7 +186,7 @@ gst_vaapi_get_display_type_from_gl_env (void)
> +     return GST_VAAPI_DISPLAY_TYPE_EGL;
> + #endif
> +   }
> +-#if USE_X11
> ++#if HAVE_X11
> +   if (g_strcmp0 (gl_window_type, "x11") == 0)
> +     return GST_VAAPI_DISPLAY_TYPE_X11;
> + #endif
> +@@ -920,7 +920,7 @@ gst_vaapi_create_test_display (void)
> + #if USE_DRM
> +     GST_VAAPI_DISPLAY_TYPE_DRM,
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> +     GST_VAAPI_DISPLAY_TYPE_X11,
> + #endif
> +   };
> +diff --git a/gst/vaapi/gstvaapisink.c b/gst/vaapi/gstvaapisink.c
> +index 9b5ae98..7b8d267 100644
> +--- a/gst/vaapi/gstvaapisink.c
> ++++ b/gst/vaapi/gstvaapisink.c
> +@@ -212,7 +212,7 @@ gst_vaapisink_backend_drm (void)
> + /* --- X11 Backend                                                      --- */
> + /* ------------------------------------------------------------------------ */
> + 
> +-#if USE_X11
> ++#if HAVE_X11
> + #include <gst/vaapi/gstvaapidisplay_x11.h>
> + #include <gst/vaapi/gstvaapiwindow_x11.h>
> + 
> +@@ -1032,7 +1032,7 @@ gst_vaapisink_ensure_backend (GstVaapiSink * sink)
> +       sink->backend = gst_vaapisink_backend_drm ();
> +       break;
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> +     case GST_VAAPI_DISPLAY_TYPE_X11:
> +       sink->backend = gst_vaapisink_backend_x11 ();
> +       break;
> +diff --git a/gst/vaapi/gstvaapivideocontext.c b/gst/vaapi/gstvaapivideocontext.c
> +index cc2967b..9c35d78 100644
> +--- a/gst/vaapi/gstvaapivideocontext.c
> ++++ b/gst/vaapi/gstvaapivideocontext.c
> +@@ -28,7 +28,7 @@
> + #if USE_GST_GL_HELPERS
> + # include <gst/gl/gl.h>
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> + #include <gst/vaapi/gstvaapidisplay_x11.h>
> + #endif
> + #if USE_WAYLAND
> +@@ -104,7 +104,7 @@ gst_vaapi_video_context_get_display (GstContext * context, gboolean app_context,
> + 
> +     if (gst_structure_get (structure, "va-display", G_TYPE_POINTER, &va_display,
> +             NULL)) {
> +-#if USE_X11
> ++#if HAVE_X11
> +       Display *x11_display = NULL;
> +       if (gst_structure_get (structure, "x11-display", G_TYPE_POINTER,
> +               &x11_display, NULL)) {
> +diff --git a/meson.build b/meson.build
> +index 4917651..cdd364c 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -125,14 +125,14 @@ USE_AV1_DECODER = cc.has_header('va/va_dec_av1.h', dependencies: libva_dep, pref
> + USE_DRM = libva_drm_dep.found() and libdrm_dep.found() and libudev_dep.found() and get_option('with_drm') != 'no'
> + USE_EGL = gmodule_dep.found() and egl_dep.found() and GLES_VERSION_MASK != 0 and get_option('with_egl') != 'no'
> + USE_WAYLAND = libva_wayland_dep.found() and wayland_client_dep.found() and wayland_protocols_dep.found() and wayland_scanner_bin.found() and get_option('with_wayland') != 'no' and USE_DRM
> +-USE_X11 = libva_x11_dep.found() and x11_dep.found() and get_option('with_x11') != 'no'
> +-USE_GLX = gl_dep.found() and libdl_dep.found() and get_option('with_glx') != 'no' and USE_X11
> ++HAVE_X11 = libva_x11_dep.found() and x11_dep.found() and get_option('with_x11') != 'no'
> ++USE_GLX = gl_dep.found() and libdl_dep.found() and get_option('with_glx') != 'no' and HAVE_X11
> + 
> + if get_option('with_wayland') == 'yes' and not USE_DRM
> +    error('DRM support is required to enable Wayland support')
> + endif
> + 
> +-if not (USE_DRM or USE_X11 or USE_WAYLAND)
> ++if not (USE_DRM or HAVE_X11 or USE_WAYLAND)
> +   error('No renderer API found (it is requried either DRM, X11 and/or WAYLAND)')
> + endif
> + 
> +@@ -143,7 +143,7 @@ if gstgl_dep.found()
> +   # fallback to the same subproject.  On the first failure, meson will never
> +   # check the system again even if the fallback never existed.
> +   # Last checked with meson 0.54.3
> +-  if USE_X11
> ++  if HAVE_X11
> +     gstglx11_dep = dependency('gstreamer-gl-x11-1.0', version : gst_req,
> +        fallback : ['gst-plugins-base', 'gstglx11_dep'], required: true)
> +   endif
> +@@ -178,7 +178,7 @@ cdata.set10('USE_GLX', USE_GLX)
> + cdata.set10('USE_VP9_ENCODER', USE_VP9_ENCODER)
> + cdata.set10('USE_AV1_DECODER', USE_AV1_DECODER)
> + cdata.set10('USE_WAYLAND', USE_WAYLAND)
> +-cdata.set10('USE_X11', USE_X11)
> ++cdata.set10('HAVE_X11', HAVE_X11)
> + cdata.set10('HAVE_XKBLIB', cc.has_header('X11/XKBlib.h', dependencies: x11_dep))
> + cdata.set10('HAVE_XRANDR', xrandr_dep.found())
> + cdata.set10('USE_GST_GL_HELPERS', gstgl_dep.found())
> +diff --git a/tests/examples/meson.build b/tests/examples/meson.build
> +index e7b1dee..76e9d78 100644
> +--- a/tests/examples/meson.build
> ++++ b/tests/examples/meson.build
> +@@ -12,7 +12,7 @@ foreach example : examples
> +     install: false)
> + endforeach
> + 
> +-if USE_X11 and USE_WAYLAND
> ++if HAVE_X11 and USE_WAYLAND
> + if gtk_dep.found()
> +   executable('test-vaapicontext', 'test-vaapicontext.c',
> +     c_args : gstreamer_vaapi_args,
> +diff --git a/tests/internal/output.c b/tests/internal/output.c
> +index 2182d5a..bd1b01c 100644
> +--- a/tests/internal/output.c
> ++++ b/tests/internal/output.c
> +@@ -26,7 +26,7 @@
> + # include <gst/vaapi/gstvaapidisplay_drm.h>
> + # include <gst/vaapi/gstvaapiwindow_drm.h>
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> + # include <gst/vaapi/gstvaapidisplay_x11.h>
> + # include <gst/vaapi/gstvaapiwindow_x11.h>
> + #endif
> +@@ -52,7 +52,7 @@ static const VideoOutputInfo g_video_outputs[] = {
> +         gst_vaapi_display_wayland_new,
> +       gst_vaapi_window_wayland_new},
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> +   {"x11",
> +         gst_vaapi_display_x11_new,
> +       gst_vaapi_window_x11_new},
> +diff --git a/tests/internal/test-display.c b/tests/internal/test-display.c
> +index e9ec126..612b486 100644
> +--- a/tests/internal/test-display.c
> ++++ b/tests/internal/test-display.c
> +@@ -34,7 +34,7 @@
> + # define DRM_DEVICE_PATH "/dev/dri/card0"
> + # endif
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> + # include <gst/vaapi/gstvaapidisplay_x11.h>
> + #endif
> + #if USE_GLX
> +@@ -273,7 +273,7 @@ main (int argc, char *argv[])
> +   g_print ("\n");
> + #endif
> + 
> +-#if USE_X11
> ++#if HAVE_X11
> +   g_print ("#\n");
> +   g_print ("# Create display with gst_vaapi_display_x11_new()\n");
> +   g_print ("#\n");
> +diff --git a/tests/internal/test-windows.c b/tests/internal/test-windows.c
> +index b9c9ad1..2fffbcf 100644
> +--- a/tests/internal/test-windows.c
> ++++ b/tests/internal/test-windows.c
> +@@ -29,7 +29,7 @@
> + # include <gst/vaapi/gstvaapidisplay_drm.h>
> + # include <gst/vaapi/gstvaapiwindow_drm.h>
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> + # include <gst/vaapi/gstvaapidisplay_x11.h>
> + # include <gst/vaapi/gstvaapiwindow_x11.h>
> + #endif
> +@@ -138,7 +138,7 @@ main (int argc, char *argv[])
> +   gst_object_unref (display);
> + #endif
> + 
> +-#if USE_X11
> ++#if HAVE_X11
> +   display = gst_vaapi_display_x11_new (NULL);
> +   if (!display)
> +     g_error ("could not create Gst/VA display");
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
> index 81ec23d26e..8f45fd41d3 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
> @@ -9,7 +9,10 @@ REALPN = "gstreamer-vaapi"
>  LICENSE = "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>  
> -SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
> +SRC_URI = " \
> +    https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
> +    file://0001-replace-USE_X11-by-HAVE_X11.patch \
> +"
>  
>  SRC_URI[sha256sum] = "ab12596144c05506e9782374c5d2cdfb3069fca89908d6de360d947bb77fd06a"
>  
> @@ -32,9 +35,7 @@ PACKAGES =+ "${PN}-tests"
>  # and BSP layers to pick either glx, egl, or no GL. By default,
>  # try detecting X11 first, and if found (with OpenGL), use GLX,
>  # otherwise try to check if EGL can be used.
> -PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', \
> -                        bb.utils.contains('DISTRO_FEATURES',     'opengl', 'egl', \
> -                                                                       '', d), d)}"
> +PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx', '', d)} egl"
>  
>  PACKAGECONFIG ??= "drm encoders \
>                     ${PACKAGECONFIG_GL} \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174302): https://lists.openembedded.org/g/openembedded-core/message/174302
> Mute This Topic: https://lists.openembedded.org/mt/95477995/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

