Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A6CC46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 09:24:40 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.98330.1703669070012068980
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 01:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ld+yWmy6;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ccbaea0a6cso24353461fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 01:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703669068; x=1704273868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED8huo6s9B+KiL0es+hmpfiD0vEwkb4dmer5eg/9Cjw=;
        b=Ld+yWmy6KAmAt58b7l5kzT9IcMXR0HpO8A4BG46sHhcOM7MmwtEC9DFNt1Tf/fB1TC
         VyH79KDaEnWhiRGQJcEkgcMMIOZsDceH+1/rkaggQDbbGuODuzg+vM+GKuIN1PuzKrRq
         Q2eQOnfPjQsDL3YJlXAaLnpSvkMoZvXmef2gca9M+9HBxbgC/Rk3kO74t92Ckb8muLDW
         0ovadtfIjs5oI9MBDdeQKbV0W6jD33Xl9trjcVO2Kb3jD0eJq+ua76nwECwbnq1nju0d
         hYwEhKm0TrB2SaCukNIC+UcxL4351NzLEokZnUVEh31TuQAQpyLosnYUq5II+qXpkiEO
         EN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703669068; x=1704273868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ED8huo6s9B+KiL0es+hmpfiD0vEwkb4dmer5eg/9Cjw=;
        b=lSO8NJx2b5y5ZU+cqJmXHkPrBIG8SG01ycLpb84sS82u2j5YX1OKBAUhpsOgWFz0hN
         UNB3EJaChOsy8V+BCnmaWi7Ih03yeAamXAL/9oU+tz+4yNdjBYB9dxsRnKzYrTh/MKr8
         Su7+kY9aeF9wtV89B0hPnGK1LYsgWTdXZ8tS+c4SaUSx4GmdCSurSo4eEI1vxzPjHzoP
         GI64yABJK7CabsWY56jZ/qiC/L/uaGfWzHSNzC7QjL/2LPi+mWwpXPjU6XzkihEYPSM4
         BINhYwMJGyTf9rElnP+XfUN/ltdKkZ7XAiZRuPj6ONKo/vA4uf6MblJ+aiHAtKfbI81M
         OAow==
X-Gm-Message-State: AOJu0Yy7T3Usye5Djzl6cxsiByT458bCVA+D0JhFxnTJX5+43tqYhc7/
	yRQr0ZuMMrFyUQZmgb3+VzkgPWd4BK2Ru6n1izDJTVpUacgIoa84
X-Google-Smtp-Source: AGHT+IF0Ku4N+mO4NwF+JTeDmgWTpqYVsOh0/sqUVDRZrKPZLU0se3p1CrxTmx9AV6UCHLc+DbAZIw==
X-Received: by 2002:a2e:9d93:0:b0:2cc:d294:7df with SMTP id c19-20020a2e9d93000000b002ccd29407dfmr1105639ljj.49.1703669068056;
        Wed, 27 Dec 2023 01:24:28 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e18-20020a2e9852000000b002cca6703b13sm2131333ljj.99.2023.12.27.01.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 01:24:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v4 2/3] mesa: add support for RustiCL under PACKAGECONFIG "opencl"
Date: Wed, 27 Dec 2023 11:24:24 +0200
Message-Id: <20231227092425.4002461-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231227092425.4002461-1-dmitry.baryshkov@linaro.org>
References: <20231227092425.4002461-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 09:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192930

From: Zoltán Böszörményi <zboszor@gmail.com>

Mesa now has two OpenCL implementations: Clover (older one) and RustiCL
(newer one). Extend the "opencl" package config to include both
implementations into the libopencl-mesa (-dev) packages. As the Clover
implementation is in maintenance mode and is expected to be removed at
some point, it doesn't make sense to split the packages or to provide
two config options.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
[DB: reworked rust class inheritance]
[DB: merged "rusticl" and "clover" back to "opencl"]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index efbce5caade5..a192562a7935 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -48,6 +48,12 @@ PROVIDES = " \
 
 inherit meson pkgconfig python3native gettext features_check
 
+# We can not include rust conditionally, otherwise it can not be overriden by
+# the bbappends.  Instead always include it, but remove the dependencies by
+# default.
+inherit rust
+INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 ANY_OF_DISTRO_FEATURES = "opengl vulkan"
@@ -139,8 +145,13 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
-# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
-PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
+# "clover" requires libclc from meta-clang and python3-ply-native and spirv-tools from OE-Core
+# "rusticl" requires libclc, spirv-llvm-translator and bindgen-cli-native from meta-clang and spirv-tools from OE-Core
+PACKAGECONFIG[opencl] = "\
+    -Dgallium-opencl=icd -Dopencl-spirv=true -Dgallium-rusticl=true -Drust_std=2021, \
+    -Dgallium-opencl=disabled -Dopencl-spirv=false -Dgallium-rusticl=false, \
+    libclc spirv-tools bindgen-cli-native python3-ply-native"
+#PACKAGECONFIG[opencl] = ",,spirv-llvm-translator"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
@@ -221,7 +232,7 @@ DEV_PKG_DEPENDENCY = ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 
-RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
@@ -332,7 +343,7 @@ FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
-FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
+FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
@@ -346,7 +357,7 @@ FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES:libgles3-mesa-dev = "${includedir}/GLES3"
-FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so"
+FILES:libopencl-mesa-dev = "${libdir}/lib*OpenCL.so"
 FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
-- 
2.39.2


