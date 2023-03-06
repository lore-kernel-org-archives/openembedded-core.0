Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2B1C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 09:11:23 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.29199.1678093878647084570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 01:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iUPLWoUa;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id s11so35477556edy.8
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 01:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678093877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJ/p3mJ/CNIMn/d1u74RklcaHuZxKgONdkPmI8ISDaM=;
        b=iUPLWoUaFerTCYkuSE6/OZpRjgH13I9tObcQaxLisjYhNRx/R87061u6ku0cpkasg0
         +fr6JxB3mbTmCHFIgG6X+fwhgDRSoyZmadLb/nvpyl/7Y97rqq673dMVem+LMac2c8K/
         +ddUuBByM8HAT8B0OYHnP6En5b7P847kgfTLlEKGzUVp9TAWKs4fXoptGRpna6UHMfCP
         J4ptXk7B+buuQtleqdJi27v17ZnCihmucND5m40y3fXR2F9Hfm/d3JJeHsirg18m1kvT
         tmHkxcUL66tj5Uc2oAmbxCVFH811LVZN6GHartlx54hvtdih5j8mrEv62Fli13Jkd/oG
         RTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678093877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJ/p3mJ/CNIMn/d1u74RklcaHuZxKgONdkPmI8ISDaM=;
        b=E379Xf4UQnzpqgOQTLksvGmNLXctJiXOhLxZlTvnWDubqZya7dBvSeHfER4sTNPBrL
         JBfrhTVYgu6Aos9zP7WO6OeGmda+sJRVJBd0WkvAey5t/2/oMrY13VS4ywTeE7o6o8tF
         7adxKvvtjPzy05LO1M0BEIlsN4hPojIeAokCi7gpcWfKGA5GvwuR3En/zeIJLorasWCq
         WvBuPDRarJgDARbL0+DOUN2j7vrVh/n2rG2CGmMVqmNy6TAw/YpIAF3vjKID27xh5LPL
         musXkg4Cjguc+kwJGuYTCi+J5S14ZfI7N/4G7l5utm6IIH4o2Xx/74odBII3IjsD3wJv
         90ww==
X-Gm-Message-State: AO0yUKVNJy9ls4d/WxX0SiJL8DG/ApGXUA+QZksN3gsgz7TTveJdUjdD
	BB4WPjYZqYhNd4ynPjOdCndtceikIytNDA==
X-Google-Smtp-Source: AK7set/VUWJuo5cdaZjdJ51s8TNkBm+QfgOVtn2+rDweZTYbhXoJCKe0y/IID+4HMzaCYkU+ez25+Q==
X-Received: by 2002:a05:6402:b10:b0:4ab:4011:ff3d with SMTP id bm16-20020a0564020b1000b004ab4011ff3dmr10575532edb.0.1678093876917;
        Mon, 06 Mar 2023 01:11:16 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id q2-20020a50cc82000000b004acbda55f6bsm4760953edi.27.2023.03.06.01.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:11:16 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Ross Burton <Ross.Burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 3/3] mesa: Add PACKAGECONFIG "rusticl"
Date: Mon,  6 Mar 2023 10:11:08 +0100
Message-Id: <20230306091108.3347363-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306091108.3347363-1-zboszor@gmail.com>
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 09:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178063

In the anonymous python function that creates packages based
on PACKAGECONFIG, use a single synthetic "opencl" setting
that is added when either "clover" or "rusticl" are present.

Without this, creating variables for two "libopencl-mesa" will
confuse the packaging code, resulting in subsequent packages
(like mesa-megadriver and others) being renamed incorrectly.

This also makes sense from a packaging standpoint: currently
both clover and rusticl can be enabled, in which case both CL
frontends should go into the same libopencl-mesa subpackage.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ff352822a3..56451d9eea 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -46,6 +46,7 @@ PROVIDES = " \
     "
 
 inherit meson pkgconfig python3native gettext features_check
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'rust', '', d)}
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -136,6 +137,9 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
 PACKAGECONFIG[clover] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
 
+# "rusticl" requires libclc, spirv-llvm-translator and bindgen-cli-native from meta-clang and spirv-tools from OE-Core
+PACKAGECONFIG[rusticl] = "-Dgallium-rusticl=true -Drust_std=2021,-Dgallium-rusticl=false,bindgen-cli-native libclc spirv-tools spirv-llvm-translator,libclc spirv-tools spirv-llvm-translator"
+
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[freedreno] = ""
@@ -214,6 +218,7 @@ DEV_PKG_DEPENDENCY = ""
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 
 RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'clover', 'libclc spirv-tools', '', d)}"
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
@@ -250,6 +255,11 @@ do_install:append () {
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
 python __anonymous() {
     pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
+    # Add the synthetic "opencl" string to pkgconfig because
+    # both "clover" and "rusticl" would create libopencl-mesa.
+    # Both CL frontends should go into the same package.
+    if "clover" in pkgconfig or "rusticl" in pkgconfig:
+        pkgconfig.append("opencl")
     suffix = ""
     if "-native" in d.getVar("PN"):
         suffix = "-native"
@@ -259,7 +269,7 @@ python __anonymous() {
               ("gles", "libgles1", "libglesv1-cm1"),
               ("gles", "libgles2", "libglesv2-2"),
               ("gles", "libgles3",),
-              ("clover", "libopencl",)):
+              ("opencl", "libopencl",)):
         if not p[0] in pkgconfig:
             continue
         mlprefix = d.getVar("MLPREFIX")
@@ -320,7 +330,7 @@ FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
-FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
+FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/libRusticlOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd ${sysconfdir}/OpenCL/vendors/rusticl.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
@@ -334,7 +344,7 @@ FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES:libgles3-mesa-dev = "${includedir}/GLES3"
-FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so"
+FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so ${libdir}/libRusticlOpenCL.so"
 FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
-- 
2.39.2


