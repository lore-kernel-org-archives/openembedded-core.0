Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67002C3DA50
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:59 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.15479.1720960796076618203
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SESWlZz3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fb3cf78fcaso23852005ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960795; x=1721565595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVOwixOCgBY89pjjgg2yV/F9gj8QRKgdheU8bzbctFw=;
        b=SESWlZz3EKq/qrVWOp6Kr8QC+wLlVXwxD33J+b2eLgeq9Y+JP3GLm3WBaP3bH7DqIR
         6aRtTQH/AGaQF8OAB0LfL9SVAYLFJxsL5lEFpW1qvzqWrr8+HljBt6ybWXuNHVucEf0Q
         NsIBl0e76RK/w//AWeZahCHwnxBTGc8SJ6yYt6ST7tTD2svwnkU7tLF9W9KrOcyX+BxA
         b53oSfih6CivznjbwydvJZRXZIjmuxWklEA1pkG5StrwFsgPSivBEXBVKM20aeAb/ckt
         K1dOS/k8hkG/f/DsorliNUnMoblTSd9YWFMFjns/4NPE9Sy4PjudDBCHqR1hasZgCyMG
         h/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960795; x=1721565595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVOwixOCgBY89pjjgg2yV/F9gj8QRKgdheU8bzbctFw=;
        b=fUtMeT5pYgUp+7znRRsxR8Sfbz4u6DeisvwOrgN8K5fuMQKCWqYwIdP88NI8uihr53
         x9XbuQNV/nF1eNF7Vh++QNukPmdtzkUtk/JykXeA/fFZfqpSq3YS+yW34MNJZ+9YBjCV
         ZV1M3CRdRcpT4slSEf6oc47tZYW2VTuKpxCgY1qA3l9agmJ/ln3tCLXaHY2BGESkZsZR
         NWHMI3txYto0+p++CTyYhY1v24zVehTGNvxrbcN8Dzzw8AhiUtbjmbynvKgp3kHgnILK
         kOEijcnmlMuxKoXKhd8rsPPjjoZ/8euMHwSwQ9eysSmkF/W5/bhnpL3Glb6jjk10UUCp
         bq7A==
X-Gm-Message-State: AOJu0YwraX/3Msf647ogN6pAezIXREXh0gNoJCduV5pRaDnVJZxtaZjX
	b6BPGt7164BiOP3gD7twyRSEgBy/wcCRdE2SzpdQwRAzqz495xkuwkwl2JfTAs8Swn9waZt2wHf
	Sqqc=
X-Google-Smtp-Source: AGHT+IHkkGj8+wfAq/KrMOi6qH7GLzJoSC/AsoKokENb/kaAujMuI5R2OXS0XhVlFDmKbTelWYBRIQ==
X-Received: by 2002:a17:902:cec5:b0:1fb:7d20:f040 with SMTP id d9443c01a7336-1fbb6f0abbamr176564285ad.64.1720960795238;
        Sun, 14 Jul 2024 05:39:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/27] webkitgtk: fix do_compile errors on beaglebone-yocto
Date: Sun, 14 Jul 2024 05:38:56 -0700
Message-Id: <bf3fe8c01c5cc00ada22049f4f0abb485e2a626f.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201886

From: Changqing Li <changqing.li@windriver.com>

Backport 2 patches to fix following compile errors:
webkitgtk-2.44.1/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp:545:37: error: 'LS_POINT' was not declared in this scope; did you mean 'WebCore::LightType::LS_POINT'?
  545 |     if (data.lightSource->type() == LS_POINT) {
      |                                     ^~~~~~~~
      |                                     WebCore::LightType::LS_POINT

webkitgtk-2.44.1/Source/WebCore/platform/graphics/filters/FELighting.h:73:41: error: 'LightingData' does not name a type
   73 |     inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...fic-declarations-in-FELighting.h-unn.patch | 44 +++++++++++++
 ...icDowncast-adoption-in-platform-code.patch | 65 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.44.1.bb  |  2 +
 3 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
new file mode 100644
index 0000000000..6ffe0a9454
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
@@ -0,0 +1,44 @@
+From dbd1a59b239b3902e717fdeb063883dbb0b06ee9 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Sun, 26 May 2024 14:24:35 -0700
+Subject: [PATCH 1/2] Remove ARM-specific declarations in FELighting.h unneeded
+ after 272873@main
+
+Unreviewed build fix.
+
+* Source/WebCore/platform/graphics/filters/FELighting.h: Remove unneeded
+  declarations for the getPowerCoefficients() and platformApplyNeon()
+  functions, which are now defined elsewhere; and were causing a build
+  failure due to usage of the protected LightingData type.
+
+Canonical link: https://commits.webkit.org/279334@main
+
+Backport this patch for fixing following compile error:
+webkitgtk-2.44.1/Source/WebCore/platform/graphics/filters/FELighting.h:73:41: error: 'LightingData' does not name a type 
+   73 |     inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/36d1b5d7c0ef9a733ee8055b1f35b1d24435d538]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Source/WebCore/platform/graphics/filters/FELighting.h | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
+index 4efab920..dcd80b6f 100644
+--- a/Source/WebCore/platform/graphics/filters/FELighting.h
++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
+@@ -68,11 +68,6 @@ protected:
+ 
+     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
+ 
+-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
+-    static int getPowerCoefficients(float exponent);
+-    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
+-#endif
+-
+     Color m_lightingColor;
+     float m_surfaceScale;
+     float m_diffuseConstant;
+-- 
+2.25.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch b/meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch
new file mode 100644
index 0000000000..a0c7b6bd57
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch
@@ -0,0 +1,65 @@
+From 88fa4b49a10ecfb74c36c678c1e2b76136357153 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 12 Jul 2024 10:16:05 +0800
+Subject: [PATCH 2/2] More dynamicDowncast<> adoption in platform code
+
+Backport part of commit [90d13e7 More dynamicDowncast<> adoption in
+platform code] to fix following compile error for ARM_NEON:
+webkitgtk-2.44.1/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp:545:37: error: 'LS_POINT' was not declared in this scope; did you mean 'WebCore::LightType::LS_POINT'?
+  545 |     if (data.lightSource->type() == LS_POINT) {
+      |                                     ^~~~~~~~
+      |                                     WebCore::LightType::LS_POINT
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/90d13e77ab2192b7efa8e763eeb8b08dbbb6d5c3]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ .../filters/FELightingNeonParallelApplier.cpp | 22 +++++++++----------
+ 1 file changed, 10 insertions(+), 12 deletions(-)
+
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
+index 04d855fa..dccc003d 100644
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
+@@ -542,19 +542,17 @@ void FELightingNeonParallelApplier::applyPlatformParallel(const LightingData& da
+     floatArguments.colorBlue = color.blue;
+     floatArguments.padding4 = 0;
+ 
+-    if (data.lightSource->type() == LS_POINT) {
++    if (auto* pointLightSource = dynamicDowncast<PointLightSource>(*data.lightSource)) {
+         neonData.flags |= FLAG_POINT_LIGHT;
+-        auto& pointLightSource = downcast<PointLightSource>(*data.lightSource);
+-        floatArguments.lightX = pointLightSource.position().x();
+-        floatArguments.lightY = pointLightSource.position().y();
+-        floatArguments.lightZ = pointLightSource.position().z();
++        floatArguments.lightX = pointLightSource->position().x();
++        floatArguments.lightY = pointLightSource->position().y();
++        floatArguments.lightZ = pointLightSource->position().z();
+         floatArguments.padding2 = 0;
+-    } else if (data.lightSource->type() == LS_SPOT) {
++    } else if (auto* spotLightSource = dynamicDowncast<SpotLightSource>(*data.lightSource)) {
+         neonData.flags |= FLAG_SPOT_LIGHT;
+-        auto& spotLightSource = downcast<SpotLightSource>(*data.lightSource);
+-        floatArguments.lightX = spotLightSource.position().x();
+-        floatArguments.lightY = spotLightSource.position().y();
+-        floatArguments.lightZ = spotLightSource.position().z();
++        floatArguments.lightX = spotLightSource->position().x();
++        floatArguments.lightY = spotLightSource->position().y();
++        floatArguments.lightZ = spotLightSource->position().z();
+         floatArguments.padding2 = 0;
+ 
+         floatArguments.directionX = paintingData.directionVector.x();
+@@ -565,8 +563,8 @@ void FELightingNeonParallelApplier::applyPlatformParallel(const LightingData& da
+         floatArguments.coneCutOffLimit = paintingData.coneCutOffLimit;
+         floatArguments.coneFullLight = paintingData.coneFullLight;
+         floatArguments.coneCutOffRange = paintingData.coneCutOffLimit - paintingData.coneFullLight;
+-        neonData.coneExponent = getPowerCoefficients(spotLightSource.specularExponent());
+-        if (spotLightSource.specularExponent() == 1)
++        neonData.coneExponent = getPowerCoefficients(spotLightSource->specularExponent());
++        if (spotLightSource->specularExponent() == 1)
+             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
+     } else {
+         ASSERT(data.lightSource->type() == LS_DISTANT);
+-- 
+2.25.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
index 14f7531549..c4a3c464c1 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
@@ -16,6 +16,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
+           file://0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch \
+           file://0002-More-dynamicDowncast-adoption-in-platform-code.patch \
            "
 SRC_URI[sha256sum] = "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
 
-- 
2.34.1


