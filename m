Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE7FC433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 15:24:34 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web12.8770.1666797863788557504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 08:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=IGsbS9kR;
 spf=pass (domain: underview.tech, ip: 209.85.166.54, mailfrom: vince@underview.tech)
Received: by mail-io1-f54.google.com with SMTP id l127so13648350iof.12
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgisx8+omXRBDYaXvNyw6g+gFMgbpe7NmECP3wDF5+g=;
        b=IGsbS9kRMA+/6XvI9NyB1ZmR/bnF471kcqsayeoVzPLdwS6AY8zNWFk/kRFBTGb5WP
         LzxDAXbOusgWFdcOpMiwM3NJ9r3N01ASEolhJXy+XB5kE/xB203vfo5v8MAjMyF7bH2B
         XZJ3GayARAqRJtEkCPRA0q0I9A6v8H0l8yJEu/umIP5nATOFgZ39SNA2F1qGuMCv19Vl
         ZZdWzLaiGXybRSUVMTLfSzNergNn3XQfKb4sCvhkLwG0KHpkP/h2AMcLJn2UzWIoIfbt
         2yvK0+2ph833Y6YZ9PVQ10cpAha0Sk7jDjlYSJk0JEM0tK7S9WNIv+e+RmDW/r1UoeWn
         SvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgisx8+omXRBDYaXvNyw6g+gFMgbpe7NmECP3wDF5+g=;
        b=bOEg5P1bGqEsneXhfhHhYWsVmBZi3t61i1La1U5bmaePLoxlNcYK/kOTyr/6jSIebw
         nds2mjDAIb7ihXyIt/oZM11GdXiT5uH7qAFiAEZeWdg3c/4emjLmcqVCTqgJNq+Oc8uK
         DdiG62eXlKawWdUnKrZDlkYwrg5PgrMHIb8DkhSqbCsI/JpnbKqWzID5EoTfWxGXuvEr
         3bxBDwX9hCMtejggjYZmSPJJ9KY7JhvuWdK4eer1RLg+TlAfUpYkqHe8d61CQLYrGlLO
         HmkOsKcjHCzMvNtCd9zFJSy/attSIkpu9oKkJsCtMNpjaaDpyWSBSZpboyzojVQiNPsV
         ziFA==
X-Gm-Message-State: ACrzQf3+z5R3Avmz70grlIClOoT0av5ioMJUEM+Hn3fQPlnBhD2F+48+
	vW2M40MTLjRJW9kfs5efST36IRhck69/05UZB68=
X-Google-Smtp-Source: AMsMyM52x2WkenksD6tZXsMfzag9/8FhZp6TYeoduFer3X7/a9gD7416d3bJPHj1vsPcCa91rdgFQg==
X-Received: by 2002:a02:a883:0:b0:347:c2ed:9ff with SMTP id l3-20020a02a883000000b00347c2ed09ffmr27316396jam.217.1666797862620;
        Wed, 26 Oct 2022 08:24:22 -0700 (PDT)
Received: from vince-ubuntu.attlocal.net (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id p4-20020a02b004000000b003738c0a80b4sm2088722jah.144.2022.10.26.08.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 08:24:22 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3] mesa: enable glvnd support
Date: Wed, 26 Oct 2022 10:22:31 -0500
Message-Id: <20221026152231.11110-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 15:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172161

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
index 04d78a6aa5..45a3f7a3cd 100644
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
@@ -119,6 +122,7 @@ VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broa
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
+PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false,libglvnd"
 
 # "gles" requires "opengl"
 PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
@@ -207,6 +211,7 @@ RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'lib
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
+             libglx-mesa libglx-mesa-dev \
              libglapi libglapi-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
@@ -225,7 +230,7 @@ do_install:append () {
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
 
-    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
+    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
     chrpath --delete ${D}${libdir}/dri/*_dri.so || true
 
     # libwayland-egl has been moved to wayland 1.15+
@@ -243,6 +248,7 @@ python __anonymous() {
         suffix = "-native"
     for p in (("egl", "libegl", "libegl1"),
               ("opengl", "libgl", "libgl1"),
+              ("glvnd", "libglx",),
               ("gles", "libgles1", "libglesv1-cm1"),
               ("gles", "libgles2", "libglesv2-2"),
               ("gles", "libgles3",),
@@ -301,20 +307,22 @@ PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
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
+FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
+FILES:libglx-mesa-dev = "${libdir}/libGLX*.*"
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
-- 
2.34.1


