Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889D7C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 09:42:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.5711.1666777367619342289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 02:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YRHmcaWR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3E20C1C0009;
	Wed, 26 Oct 2022 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666777365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a/oa5BETWmyD06hEaNpuZHSLPlYc41koulbwNLQldRU=;
	b=YRHmcaWRKY4Zv0UhSYUqRTGpDAH/lcbh8zEEd4AS50s0dAIKb1uJk99PA//M3hby9Pfu6S
	NvPPB87EyRSesWEBzftcEsLt9cA/pXOpQw+MVpISMZXXmwT/hMbox6cbX+eHc6ZaZGDg0n
	oBgnRTYd/OiTPIrXWLUIukivQ8Ip/GvUp1Dpe6//DEcjhr0XDF5QoDg5WsUNdncXmoIy81
	5Qxh36wYyWIyraTNHx1RQTi8hDZpO0iJ11I7/hZ/AadpJsVfw9tP6qS5lFVBYmO+LEWCHa
	Vyo6bgrweZgrhx47Gdy1O5v+jVMG/Hn1OKQCnkjBmXfcx7VzSosOOq1O6lUfPw==
Date: Wed, 26 Oct 2022 11:42:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] mesa: enable glvnd support
Message-ID: <Y1kBFGhoBrFUuNVm@mail.local>
References: <20221024150823.188108-1-vince@underview.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024150823.188108-1-vince@underview.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 09:42:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172149

Hello,

On 24/10/2022 10:08:23-0500, Vincent Davis Jr wrote:
> Allows mesa to be built with glvnd support.
> Thus, creates libEGL_mesa.so* and libGLX_mesa.so*
> libraries meant to coexist with vendor neutral
> dispatch libraries from libglvnd.
> 

This causes failures on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/1856/steps/13/logs/stdio
ERROR: mesa-2_22.2.2-r0 do_package: QA Issue: mesa: Files/directories were installed but not shipped in any package:
  /usr/lib/libEGL.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
mesa: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: mesa-2_22.2.2-r0 do_package: Fatal QA errors were found, failing task.

> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  .../conf/distro/include/default-providers.inc |  1 +
>  meta/recipes-graphics/mesa/mesa.inc           | 20 +++++++++++++------
>  2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index 6defdca12d..3a4e989c1f 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -5,6 +5,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
>  PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
>  PREFERRED_PROVIDER_virtual/egl ?= "mesa"
>  PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
> +PREFERRED_PROVIDER_virtual/libglx ?= "mesa"
>  PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
>  PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
>  PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 8a74e0a80a..4eddf82644 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -29,15 +29,18 @@ UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install:append() {
> -    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
> -        sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> -    fi
> +  # sed can't find EGL/eglplatform.h as it doesn't get installed when glvnd enabled.
> +  # So, check if EGL/eglplatform.h exists before running sed.
> +  if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
> +      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +  fi
>  }
>  
>  DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
>  EXTRANATIVEPATH += "chrpath-native"
>  PROVIDES = " \
>      ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'virtual/libglx', '', d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
> @@ -116,6 +119,7 @@ VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broa
>  PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
>  
>  PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
> +PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false,libglvnd"
>  
>  # "gles" requires "opengl"
>  PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
> @@ -204,6 +208,7 @@ RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'lib
>  PACKAGES =+ "libegl-mesa libegl-mesa-dev \
>               libosmesa libosmesa-dev \
>               libgl-mesa libgl-mesa-dev \
> +             libglx-mesa libglx-mesa-dev \
>               libglapi libglapi-dev \
>               libgbm libgbm-dev \
>               libgles1-mesa libgles1-mesa-dev \
> @@ -222,7 +227,7 @@ do_install:append () {
>      rm -f ${D}${libdir}/gallium-pipe/*.la
>      rm -f ${D}${libdir}/gbm/*.la
>  
> -    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
> +    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
>      chrpath --delete ${D}${libdir}/dri/*_dri.so || true
>  
>      # libwayland-egl has been moved to wayland 1.15+
> @@ -240,6 +245,7 @@ python __anonymous() {
>          suffix = "-native"
>      for p in (("egl", "libegl", "libegl1"),
>                ("opengl", "libgl", "libgl1"),
> +              ("glvnd", "libglx",),
>                ("gles", "libgles1", "libglesv1-cm1"),
>                ("gles", "libgles2", "libglesv2-2"),
>                ("gles", "libgles3",),
> @@ -298,20 +304,22 @@ PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
>  FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
>  FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
>  FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
> -FILES:libegl-mesa = "${libdir}/libEGL.so.*"
> +FILES:libegl-mesa = "${libdir}/libEGL*.so.*"
>  FILES:libgbm = "${libdir}/libgbm.so.*"
>  FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
>  FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
>  FILES:libgl-mesa = "${libdir}/libGL.so.*"
> +FILES:libglx-mesa = "${libdir}/libGLX*.so.* ${datadir}/glvnd"
>  FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
>  FILES:libglapi = "${libdir}/libglapi.so.*"
>  FILES:libosmesa = "${libdir}/libOSMesa.so.*"
>  FILES:libxatracker = "${libdir}/libxatracker.so.*"
>  
>  FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
> -FILES:libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
> +FILES:libegl-mesa-dev = "${libdir}/libEGL*.so.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
>  FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
>  FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
> +FILES:libglx-mesa-dev = "${libdir}/libGLX*.*"
>  FILES:libglapi-dev = "${libdir}/libglapi.*"
>  FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
>  FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172105): https://lists.openembedded.org/g/openembedded-core/message/172105
> Mute This Topic: https://lists.openembedded.org/mt/94536595/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

