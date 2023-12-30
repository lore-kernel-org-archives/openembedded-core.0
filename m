Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F17FC47077
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 19:14:57 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.190719.1703963688924207946
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 11:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IUIUMU3t;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ccf4f6e42cso6412381fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 11:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703963687; x=1704568487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED8huo6s9B+KiL0es+hmpfiD0vEwkb4dmer5eg/9Cjw=;
        b=IUIUMU3t+cdFLhuOF6cBRquDUroY6G2rauin2JQosp7REtYJiTc8xmzOwpiqxju06x
         TPEVwxI4yGTjojmFVYmYa/pSDDiAEsctDLym9neSKMpORiH8iA+jCCQBANKxw3Om8n2E
         DlQV015QJTQlOdfpYYiPOsCxDryc1Ea5ptNu5HRIYqLavR8kbLQiZ9I6RPDtttLuwuM6
         WEKIgcu5m3Hus1j8pTRs3Eh+3IOGKFoIXrmaDAARsYCte2+xAXCDvHOcIGMgPAgpAkmw
         1Ca8x8msuYAM+jCre+1izljejfuKrB+gcEj6EQevO9VgxnzL9bYvZuPdtkVwkgYE/6IG
         /vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703963687; x=1704568487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ED8huo6s9B+KiL0es+hmpfiD0vEwkb4dmer5eg/9Cjw=;
        b=S59GKDfieWoC9jpO2XOIRQqbVuGe5OM9IZfVV8iZBYwbo/tcovkFVN0myRD511C657
         2TiDRULEPMqomUJkzoJ9KyEFBtaPdzQfSJ+7nzOf8QIeQtCBC4D4Sz7l1Z95EI/Zs8io
         D/SfFjNF3k909r0+vDCa7Q6TeVDn2gZZpKYzuHxTh9mZkhiScK7OEXQ75OCPXdnFsi6a
         uQM74+yuKC4xwqYZseRvDdwY3AZO/W2G+aA4Ccqlsy2TsT/6f4SgPh2nyBXidpAya6sh
         V15UiUoUIXt2HNLAnBhNFOT7wA0Pt8pIYZtaswZbmbWJIvBCl/fsoN+3fjRPI2pt+xJa
         fnfA==
X-Gm-Message-State: AOJu0YyUGh7QVA+W2qJbO8EPMto+aKBkAlV4nttvtmllvNifgX3zuj5a
	5Q8i/8muFh3V2S2ZUnsJR1FP8k9MB7lz0CZRIm4SgzSy8Vkw5g==
X-Google-Smtp-Source: AGHT+IFo8hAcrM0tF62Z5dAqN+SeAEiGObwotksb5XQ7xnbRnCP3mvb4euRGYRHMbEeYwFXTD+Q7tQ==
X-Received: by 2002:a05:651c:1a25:b0:2cc:f162:302a with SMTP id by37-20020a05651c1a2500b002ccf162302amr1844576ljb.17.1703963686999;
        Sat, 30 Dec 2023 11:14:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a2ebcc4000000b002ccd60a6fd4sm1948165ljp.32.2023.12.30.11.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 11:14:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v5 2/3] mesa: add support for RustiCL under PACKAGECONFIG "opencl"
Date: Sat, 30 Dec 2023 21:14:43 +0200
Message-Id: <20231230191444.1204808-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 19:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193081

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


