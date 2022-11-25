Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51817C4167D
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 23:20:31 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.59704.1669418423084776255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 15:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=G7e9hjen;
 spf=pass (domain: underview.tech, ip: 209.85.160.41, mailfrom: vince@underview.tech)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-142306beb9aso6691382fac.11
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 15:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cD19uBr6PNCXxbMQjnJkzSmnK/VSy4exSTCdslzhVGI=;
        b=G7e9hjen7DqkG1wx1pbvrymflvUn9evQucfajc8OEdmtM02QDZptuAmtT3G1fxFw4Z
         iCpNhKjW367g6qi/hJIEwFON86U7FWVfaLDUEwz5wNRTSu+eAEDOAGVh/RcnkEADf/CU
         g+oofD0w9yu96ihpezBhxfY7iu42/1oucvGznri2ZhgqkHtVDpWpc036uLhHyJ0sSs8Z
         QScyBVns+OIUdcc2xyFzF+MZY2KTGfwNp4JV1pveAE94qvzCO8jdoNCjEcPQKOY/4U8Z
         vQkFyiIRQpLd9mI6qfmDvxzXI3g0jVX1RBtvbB+ShTUapJ3wuHiuoGV6EI9dPDZxth7c
         XXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cD19uBr6PNCXxbMQjnJkzSmnK/VSy4exSTCdslzhVGI=;
        b=1w4Btq9MrDUR9L5iBk6yRxa4qe2B24o0tp/zr54U9h1H/BsDx/Vv0KGIpfJ8J/FdQ5
         lMAl7gHIUgylnWk4Z72VyOIyq7HgL7lq8rpxP28fhEo0lzzQHhcCK9FO7rZlHZTv2eD0
         /LQOHRcAsfnzAZOJoNc9AxLW37MVwTNJsYpdPMe4Y5uns6EdZf7FoqTFwVKfODhnqSvH
         kAPuIJ6fa4ZicrXhCL/7y/UNacVFbnLPhnQeNoU0A4vV9SG7o+TV0zEjeLCO7cNTzd2V
         F+/PHcd5duYijEIOfVUDqoh1FmftT+TGqlNuYex2YtTAOVhzDn3ucIKQHb8uSpx9M21l
         uSNQ==
X-Gm-Message-State: ANoB5pmzBdysc/u73vFKCDKpGBQ5DKPgNXjoSpvhdDws0K90tFjjwAl7
	M+9rGLzjt/vJhPSnDOms5K5OnQmcUnpfdnsx
X-Google-Smtp-Source: AA0mqf4PSnDuANgkzOiJN2ThdxmbMKCDFHIdt6x+ZXszI/mynWiqDHE5EIocj5dHCfIs7WAhs9wDyg==
X-Received: by 2002:a05:6870:c98f:b0:143:8809:90ba with SMTP id hi15-20020a056870c98f00b00143880990bamr642879oab.16.1669418421808;
        Fri, 25 Nov 2022 15:20:21 -0800 (PST)
Received: from localhost.localdomain (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.googlemail.com with ESMTPSA id q5-20020a9d6305000000b00661af2f9a1asm2229805otk.49.2022.11.25.15.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 15:20:21 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4] mesa: enable glvnd support
Date: Fri, 25 Nov 2022 17:19:52 -0600
Message-Id: <20221125231952.56129-1-vince@underview.tech>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 23:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173789

Allows mesa to be built with glvnd support.
Thus, creates libEGL_mesa.so* and libGLX_mesa.so*
mesa(vendor) libraries meant to coexist with vendor
neutral dispatch libraries from libglvnd.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../conf/distro/include/default-providers.inc |  1 +
 meta/recipes-graphics/mesa/mesa.inc           | 20 +++++++++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 6defdca12d..3a4e989c1f 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -5,6 +5,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/egl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libglx ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
 PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1949fc15a9..115621228a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -32,15 +32,18 @@ UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install:append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
-    fi
+  # sed can't find EGL/eglplatform.h as it doesn't get installed when glvnd enabled.
+  # So, check if EGL/eglplatform.h exists before running sed.
+  if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
+      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+  fi
 }
 
 DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'virtual/libglx', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
@@ -109,6 +112,7 @@ VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broa
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
+PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false, libglvnd"
 
 # "gles" requires "opengl"
 PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
@@ -199,6 +203,7 @@ RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'lib
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
+             libglx-mesa libglx-mesa-dev \
              libglapi libglapi-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
@@ -217,7 +222,7 @@ do_install:append () {
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
 
-    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
+    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
     chrpath --delete ${D}${libdir}/dri/*_dri.so || true
 
     # libwayland-egl has been moved to wayland 1.15+
@@ -235,6 +240,7 @@ python __anonymous() {
         suffix = "-native"
     for p in (("egl", "libegl", "libegl1"),
               ("opengl", "libgl", "libgl1"),
+              ("glvnd", "libglx",),
               ("gles", "libgles1", "libglesv1-cm1"),
               ("gles", "libgles2", "libglesv2-2"),
               ("gles", "libgles3",),
@@ -293,20 +299,22 @@ PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
 FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
 FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
-FILES:libegl-mesa = "${libdir}/libEGL.so.*"
+FILES:libegl-mesa = "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.d"
 FILES:libgbm = "${libdir}/libgbm.so.*"
 FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
+FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
 FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
 FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
-FILES:libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
+FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
+FILES:libglx-mesa-dev = "${libdir}/libGLX*.*"
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
-- 
2.38.1


