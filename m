Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716ECC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:08:38 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web09.20397.1666624116138210148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 08:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=WwCHYcII;
 spf=pass (domain: underview.tech, ip: 209.85.210.46, mailfrom: vince@underview.tech)
Received: by mail-ot1-f46.google.com with SMTP id p24-20020a9d6958000000b00661c528849eso6039868oto.9
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 08:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l43VStLAex4wXgrCrGINHDBFGxhHEY6jrnC2hX+fVX0=;
        b=WwCHYcIIVhtzE6SfxmX3XiSThyF0QLAcvhV5ZkJwjexOmCuJIp04d8QG7ou3r8S0Bx
         E3UQ/nXsGLnVUE5e+mCG6X4nUXcB9U0pWvRUn0rcxQm08upqhFPx5QVQeOqbBxPcHqe+
         cqUq3BD2Futsz9TLsgcSknAJ7Y6ux9WUcQAGjBwn1H3nGWu6F3XVm9ZyeffTLbXUUo2J
         ncvDtH7QQCQPD2GmE7TSEVq6SIKwc5zPlIqKb7fl3Z9RXMxgSU/2ChdSjE9YrUbYSy0m
         Fy4nJVFH3IK1nYlzIydWuvu4qO3oWzMPk/D6kVm8RGIz/w+3R4PIl5UrCNPS3bs5hrmA
         gF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l43VStLAex4wXgrCrGINHDBFGxhHEY6jrnC2hX+fVX0=;
        b=DqeE6yOaYyHAIIO3yoBmSk1TVTTLInquF2glN/f1pYV6uGyZq1Fj6BH5Rv+JjSSFqU
         8q0CuOCR+aSnnmeDg1cXfHBXDfWvVpRM8D3rsSULj7EHBUb4JSQKvgftLI6M9sD+4vJn
         QFo0LGIFTa3aCablXKOx5V0v2Avtddh30lfHSnGIaUWYulQM31Q8MM6HvjpNHr5h6W/z
         hq27idewzYhR8MMOuiLYjf1LTa0+HZ9P9cYgpGgq9oLzKg5snhKeoN00000Ai/qQQZFm
         lRq4/wpvoQGhX29kNWRVHPD6G5nymPqnEVJXVScuZ0ncL87VNsxF8DByeqnoLAXOztKn
         oMsw==
X-Gm-Message-State: ACrzQf0zx3oxxULVO8O1qtI8zQAP7sIbIDGWgLmma4kJMLXWuVHuXZsA
	fmU4ZIoMD9jsn3jWaKiM38ik//+8WCoaBKVkqqQ=
X-Google-Smtp-Source: AMsMyM5KpZerzLY98ARMKQXHIVS8tacJl0w3D5rT91Un7GfUWN+/WMDKTVT9HjUpmqrt2mbv9Xijew==
X-Received: by 2002:a05:6830:b93:b0:660:eef5:76b6 with SMTP id a19-20020a0568300b9300b00660eef576b6mr16960353otv.18.1666624114893;
        Mon, 24 Oct 2022 08:08:34 -0700 (PDT)
Received: from vince-ubuntu.attlocal.net (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id o7-20020a4a2c07000000b00476995b5f0fsm97227ooo.9.2022.10.24.08.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:08:34 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2] mesa: enable glvnd support
Date: Mon, 24 Oct 2022 10:08:23 -0500
Message-Id: <20221024150823.188108-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 15:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172105

Allows mesa to be built with glvnd support.
Thus, creates libEGL_mesa.so* and libGLX_mesa.so*
libraries meant to coexist with vendor neutral
dispatch libraries from libglvnd.

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
index 8a74e0a80a..4eddf82644 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -29,15 +29,18 @@ UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
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
@@ -116,6 +119,7 @@ VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broa
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
+PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false,libglvnd"
 
 # "gles" requires "opengl"
 PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
@@ -204,6 +208,7 @@ RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'lib
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
+             libglx-mesa libglx-mesa-dev \
              libglapi libglapi-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
@@ -222,7 +227,7 @@ do_install:append () {
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
 
-    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
+    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
     chrpath --delete ${D}${libdir}/dri/*_dri.so || true
 
     # libwayland-egl has been moved to wayland 1.15+
@@ -240,6 +245,7 @@ python __anonymous() {
         suffix = "-native"
     for p in (("egl", "libegl", "libegl1"),
               ("opengl", "libgl", "libgl1"),
+              ("glvnd", "libglx",),
               ("gles", "libgles1", "libglesv1-cm1"),
               ("gles", "libgles2", "libglesv2-2"),
               ("gles", "libgles3",),
@@ -298,20 +304,22 @@ PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
 FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
 FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
-FILES:libegl-mesa = "${libdir}/libEGL.so.*"
+FILES:libegl-mesa = "${libdir}/libEGL*.so.*"
 FILES:libgbm = "${libdir}/libgbm.so.*"
 FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
+FILES:libglx-mesa = "${libdir}/libGLX*.so.* ${datadir}/glvnd"
 FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
 FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
-FILES:libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
+FILES:libegl-mesa-dev = "${libdir}/libEGL*.so.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
+FILES:libglx-mesa-dev = "${libdir}/libGLX*.*"
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
-- 
2.34.1


