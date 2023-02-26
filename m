Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A72CC7EE30
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 05:08:33 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.60749.1677388110419964768
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Feb 2023 21:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PQsVODLm;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id ec43so13039526edb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 21:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLHiDIdQ3pqbazJI1gJFPDiAnuM1hUjCdKvKI4krvoY=;
        b=PQsVODLm8gf6LquM7P9ho0J/rHs839roWFJN/QZB44qo4LzpAUUacXefzKI13x8r9U
         fThediLFCSuZsPVdL5f9PGQ606w4Na5zVMXE/yXbRp79SlXgnSgbeGMpN8sSiYIkJFbq
         c2vYoXhgiNzyTKTm7F/Rcsavnij/R/mpZ50Cdws+mfkPW5detDlLw9+FVQCzn5qA+NZu
         FR0xtxhOT0LN8iwM54Xc9K3BF2Ne/MwRnv0X522Ty0nShyLbOadpmC1VYsMtZjVRjnYp
         AxmPF30QmdCsslTJOWVH2s+mONn8igU6S+ljhjVg2hoAcSIojkQGv9mMfstkCz1XubN4
         5wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLHiDIdQ3pqbazJI1gJFPDiAnuM1hUjCdKvKI4krvoY=;
        b=sjRlaDaECESMiUcdN7bC+mhTQEnUUfX3ehBoRUrquM1ceYE59+dh94ViCyXFWGKszl
         x0grLdw9BoGXh6r/0tiWAnItZaD7FgZU8OWIUT/AY351DhmvBRky13RACG5gc02eVL2C
         50oU+qri0vyogMax+traexlNHVY/MZYbHHbP4nmMYcfLc76Ut7dwd/BNhVAx3kGWoJvV
         ZiU20Cpb/mtoMeg/qyokMzfuEYyBy8F3oTZN+mR19NxJn9ls++FLP+Bq6uMd/Tq35l7O
         YlJOb6pPT4hunfW36v9p8gIpT3V5dA58iyLURhgYe2lJ/YsLCbGeQCwHp+twVvkGqwku
         LNOg==
X-Gm-Message-State: AO0yUKWdwtNaoRV2cjjbR9sVijgbzME8nth2UzgsKVEzakqkVSVH9vxg
	77h/F79DEqy6+3ywBQ1yWhdfKk2rQq+hloFe
X-Google-Smtp-Source: AK7set94lWc307iuEU6CX2aCvywZoC0O9aMMk61PMkbrsXSpKF3rwkr9ZVkVfROX6SR3ZykullaY/w==
X-Received: by 2002:a17:907:9629:b0:870:baa6:6762 with SMTP id gb41-20020a170907962900b00870baa66762mr35894289ejc.14.1677388108670;
        Sat, 25 Feb 2023 21:08:28 -0800 (PST)
Received: from localhost.localdomain (BC24436C.dsl.pool.telekom.hu. [188.36.67.108])
        by smtp.gmail.com with ESMTPSA id b27-20020a50ccdb000000b004aef48a8af7sm1546262edj.50.2023.02.25.21.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 21:08:28 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Ross Burton <Ross.Burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 3/3] mesa: Add PACKAGECONFIG "rusticl"
Date: Sun, 26 Feb 2023 06:08:14 +0100
Message-Id: <20230226050814.929055-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230226050814.929055-1-zboszor@gmail.com>
References: <20230224093850.3393567-1-zboszor@gmail.com>
 <20230226050814.929055-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 05:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177728

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 89e2dc6e90..2fbc1f971e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -46,6 +46,7 @@ PROVIDES = " \
     "
 
 inherit meson pkgconfig python3native gettext features_check
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'rust', '', d)}
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -119,6 +120,13 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
 PACKAGECONFIG[clover] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
 
+# "rusticl" requires libclc and spirv-llvm-translator from meta-clang and spirv-tools from OE-Core
+PACKAGECONFIG[rusticl] = "-Dgallium-rusticl=true -Drust_std=2021,-Dgallium-rusticl=false,bindgen-cli-native libclc spirv-tools spirv-llvm-translator,libclc spirv-tools spirv-llvm-translator"
+
+# Building "rusticl" runs bindgen.
+# This setting is needed by bindgen to dlopen the correct libclang.
+export LIBCLANG_PATH = "${STAGING_LIBDIR_NATIVE}"
+
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[freedreno] = ""
@@ -197,6 +205,7 @@ DEV_PKG_DEPENDENCY = ""
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 
 RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'clover', 'libclc spirv-tools', '', d)}"
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
@@ -233,7 +242,7 @@ do_install:append () {
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
 python __anonymous() {
     pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
-    if "clover" in pkgconfig:
+    if "clover" in pkgconfig or "rusticl" in pkgconfig:
         pkgconfig.append("opencl")
     suffix = ""
     if "-native" in d.getVar("PN"):
@@ -305,7 +314,7 @@ FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
-FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
+FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/libRusticlOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd ${sysconfdir}/OpenCL/vendors/rusticl.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
@@ -319,7 +328,7 @@ FILES:libglapi-dev = "${libdir}/libglapi.*"
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


