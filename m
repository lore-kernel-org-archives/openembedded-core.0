Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2B0C678DB
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 09:39:08 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.14103.1677231546282482975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 01:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YUq1CwtE;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id eg37so48634708edb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 01:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5U+AsJSDIrDVYOnDi4GaFzAcNT9R0yClnwhVvhf++qA=;
        b=YUq1CwtE6v7P27nqR/cDhNSQSEbfat19gby3pRLbV5FKVAAz56hKGd9mn28AbWIVxA
         2cWfMTIUkwrDTGZ+kay0JEW8caPV8u0i5TQZKazV4AZyJQnprHRicRDwAgEMmOtcH1Ib
         XQ/5y8amc6SHI2B/d1UhWJC+TDUaMdOT7HWW5o+Hb+b6CBQWHFSKNYLZ0gnrSO4bEzm7
         QJHBP6q49KVE9BRFc/7iMa/jnoqdNU93Aqm8FZVgNvksp9Lynfta+woMUdmGS4v5ljB+
         FOCW3b2NUHzZtJmyAHq2a0dypHfwnmwvXMhm/ed6evicpWMK5xnsslhBTcG0NKUyT1xa
         M+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5U+AsJSDIrDVYOnDi4GaFzAcNT9R0yClnwhVvhf++qA=;
        b=NSEV7EVrlFUD39ArYteMvxAAV87APM+gCF8PrZNb7fkXO+AQhqabzRvLF51mBjD6Tz
         6P3buUBIIgTwqZbxQUoLCIHZC4mNDWU4D+Ap9ynk1zUebfqVf4/BztNQN80lGbRKl6OJ
         Lwcw5brzYcm/nh9NhUdL80yDnpGkY5DOLoa+zgptihcYL31neIV5IdJvFVwbAfgW5mnX
         LleDKyVk0dkTzTNM8RgRvTXKHsd/wvYsFYnmdLLqdfOaRTTrQFN2PRJc/Suy7HAFxis+
         Tq3w1uWyx0+fjKd/DC7d/6E5ED26maDn2ThLtXjEVYLekcMgE93fGd3rSvHWl24RDQ8X
         Y3rQ==
X-Gm-Message-State: AO0yUKVBYWZDVb2Gyn8imBtzxaZMe3AAI49EIOXUuKYJOBSQKFDWGZON
	KTDQ9Xuwchotbj3m0Sk1JpS9ZmJEHeQ=
X-Google-Smtp-Source: AK7set84Ke23cH+23VyQVG1Rww1JaopINRBeHBJBTauCVJD0EgIoqkV5bKVZOd5TBkQF+qhFXKqrjw==
X-Received: by 2002:a17:907:3e24:b0:8eb:27de:240e with SMTP id hp36-20020a1709073e2400b008eb27de240emr9775752ejc.13.1677231544494;
        Fri, 24 Feb 2023 01:39:04 -0800 (PST)
Received: from localhost.lan (BC24452B.dsl.pool.telekom.hu. [188.36.69.43])
        by smtp.gmail.com with ESMTPSA id n27-20020a17090673db00b008d173604d72sm6478498ejl.174.2023.02.24.01.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 01:39:03 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 4/4] mesa: Add PACKAGECONFIG "rusticl"
Date: Fri, 24 Feb 2023 10:38:50 +0100
Message-Id: <20230224093850.3393567-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224093850.3393567-1-zboszor@gmail.com>
References: <20230224093850.3393567-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 09:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177667

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9ec10c49ca..e70cf9a42a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -45,7 +45,7 @@ PROVIDES = " \
     virtual/mesa \
     "
 
-inherit meson pkgconfig python3native gettext features_check
+inherit meson pkgconfig python3native gettext features_check rust
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -119,6 +119,13 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
 PACKAGECONFIG[clover] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
 
+# "rusticl" requires libclc and spirv-llvm-translator from meta-clang and spirv-tools from OE-Core
+PACKAGECONFIG[rusticl] = "-Dgallium-rusticl=true -Drust_std=2021,-Dgallium-rusticl=false,bindgen-cli-native libclc spirv-tools spirv-llvm-translator,libclc spirv-tools spirv-llvm-translator"
+
+# "rusticl" runs bindgen.
+# This setting is needed by bindgen to dlopen the correct libclang.
+export LIBCLANG_PATH = "${STAGING_LIBDIR_NATIVE}"
+
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[freedreno] = ""
@@ -197,6 +204,7 @@ DEV_PKG_DEPENDENCY = ""
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 
 RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'clover', 'libclc spirv-tools', '', d)}"
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
@@ -242,7 +250,8 @@ python __anonymous() {
               ("gles", "libgles1", "libglesv1-cm1"),
               ("gles", "libgles2", "libglesv2-2"),
               ("gles", "libgles3",),
-              ("clover", "libopencl",)):
+              ("clover", "libopencl",),
+              ("rusticl", "libopencl",)):
         if not p[0] in pkgconfig:
             continue
         mlprefix = d.getVar("MLPREFIX")
@@ -303,7 +312,8 @@ FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
-FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
+FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/libRusticlOpenCL.so ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd ${sysconfdir}/OpenCL/vendors/rusticl.icd"
+INSANE_SKIP:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'dev-so', '', d)}"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
-- 
2.39.2


