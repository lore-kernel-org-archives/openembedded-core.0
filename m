Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00085C3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:48:55 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web12.16485.1666594128533974437
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Pordz6tY;
 spf=pass (domain: underview.tech, ip: 209.85.210.46, mailfrom: vince@underview.tech)
Received: by mail-ot1-f46.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso5407430otb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Oct 2022 23:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQw5VhesmvX857yXMwtDeCR13yp/SL6OUQFuUPNDnc8=;
        b=Pordz6tYf0vj8oCLqc0xRbqg530VzjJ5+sJXSOtvIYeUJq+NWyptb4Kv9Vo/dvbRes
         /XuMhsZVZZ02HVUNMz0W2uSeSIEEa3fIDlfkR4Qvi2QAy5EdayK6M3GBf4QR4x2PFFRD
         OzSbw0AFVYj0YmSptYzIgPwhxihMts6+uXmV4UETp3vzojcdt05T7NPSJOzHutRIFDSn
         0jaJWWDBto42Hidu+hLKjiGPk2V3RTR0WLJeJoi5TVHml1U3Jj//is0W1nuIPgVdn2IO
         Kf/BEd6hwG2cGmUmvPMXs3e7KA69BCDism3jBLruyX7XTGBmU5duWDuxW8OVUagbvenx
         zyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQw5VhesmvX857yXMwtDeCR13yp/SL6OUQFuUPNDnc8=;
        b=ZEqq/OT1Vpbxob27cdiY2POFRPBcYVaqB/BglPMieER3/mckgK+6pmNAliivXAys3w
         4avja8s6H1r7jEd+RcnYkSjZKLrdgJXhXY3l7Jdr28qHCKgCMYp/iUKdMkzZSv4c0nW7
         9EljJjIJnrTkSbJc8AtuE1qgscOQcyjFhDCcI7q4sN1k5G53oMIO7gdBF/whKvv1xrOM
         opvntwjUDrlBOy5/LlaC399a1cyqkcU/NmCRdYp1ePN+7rFpAiSgHmA56O/uHfy5uRWu
         OcJfUx3Xe80yucW6SVEUfhNSK/2i4SJr41XNGJ2dPaq9ANHbz2OYZeV1a/Q93iSjij3b
         t6Bg==
X-Gm-Message-State: ACrzQf2v7CaIPdAQnbQkLYHZrCwSe4T92ODKYY+YVYCdi6ktvm2qVDC5
	q/Pk6PAKV07usBNsavOAuMwJSoqaneqC+MQ9PGk=
X-Google-Smtp-Source: AMsMyM6zD/jTkVwXWRwJrTfXuGAfDtJSdgSAro444VeqrhHHVBo3UevBgIIK2Ia0mFvT1Xqzbvqzkw==
X-Received: by 2002:a9d:6943:0:b0:661:9dd1:b646 with SMTP id p3-20020a9d6943000000b006619dd1b646mr16274776oto.204.1666594127518;
        Sun, 23 Oct 2022 23:48:47 -0700 (PDT)
Received: from vince-ubuntu.attlocal.net (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id c24-20020aca1c18000000b0035474ff66b3sm3694543oic.35.2022.10.23.23.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 23:48:47 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] mesa: enable glvnd support
Date: Mon, 24 Oct 2022 01:47:59 -0500
Message-Id: <20221024064759.343728-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 06:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172072

Allows mesa to be built with glvnd support.
Thus, creates libEGL_mesa.so* and libGLX_mesa.so*
libraries meant to coexist with vendor neutral
dispatch libraries from libglvnd.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/conf/distro/include/default-providers.inc |  1 +
 meta/recipes-graphics/mesa/mesa.inc            | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

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
index 8a74e0a80a..9e8f1591ab 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -29,6 +29,11 @@ UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install:append() {
+    # sed can't find EGL/eglplatform.h as it doesn't get installed when glvnd enabled
+    if ${@bb.utils.contains('PACKAGECONFIG', 'openglx', 'true', 'false', d)}; then
+        return 0
+    fi
+
     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
         sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
@@ -38,6 +43,7 @@ DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'virtual/libglx', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
@@ -116,6 +122,7 @@ VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broa
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
+PACKAGECONFIG[openglx] = "-Dglvnd=true, -Dglvnd=false,libglvnd"
 
 # "gles" requires "opengl"
 PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
@@ -204,6 +211,7 @@ RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'lib
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
+             libglx-mesa libglx-mesa-dev \
              libglapi libglapi-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
@@ -222,7 +230,7 @@ do_install:append () {
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
 
-    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
+    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
     chrpath --delete ${D}${libdir}/dri/*_dri.so || true
 
     # libwayland-egl has been moved to wayland 1.15+
@@ -240,6 +248,7 @@ python __anonymous() {
         suffix = "-native"
     for p in (("egl", "libegl", "libegl1"),
               ("opengl", "libgl", "libgl1"),
+              ("openglx", "libglx",),
               ("gles", "libgles1", "libglesv1-cm1"),
               ("gles", "libgles2", "libglesv2-2"),
               ("gles", "libgles3",),
@@ -298,20 +307,22 @@ PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
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


