Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA404CFB445
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 01:55:29 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.44008.1728266121463238125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 18:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IzexEIi6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e07d85e956so3193747a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 18:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728266121; x=1728870921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eB7eL2cVa75tBUxq0HyOdG+bw01VTu04OlLqsI1QHPo=;
        b=IzexEIi6FqJFuzkOseAckVe6iZ0ssfEfrLRBSEoMvJ2yP2529yw2qurHNf/rqE54NP
         15OIzahbX6aJgY/9+fINLhdNHwjU+Qq+uol9h5i+I7rBLVrvPlr4tW8Dfv7Anlr4kz1N
         YawcNoKBxVX7roCcDGuz0ma4yWa3ePpGUQe3RptHcDEpbjCc9UIfTIGCJZBqDWo4rUfC
         wh1wvVhYy68WXV5nmx6IwkEFOpd1abe0kpaf7IpHjmKA7SYpsE642uVJfDYFv3TuiF5W
         1q+qT+O2gaSIHHnl3/pnHjP5lJD9zpC6Wi34eE89CURULaWRb/sHfhJwEx+qmyfImFmV
         B2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728266121; x=1728870921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eB7eL2cVa75tBUxq0HyOdG+bw01VTu04OlLqsI1QHPo=;
        b=mrQm/PFwMQa8DzekFcrFTNXn465DcEfd/vOM7XUCjAK2k7zI36J67xFAXCyIlGLpd+
         zYBq6bZ2WoRdyyi6DGuu7yFbW9yK9h6OYG7f1ctE9UEii+KT9GeRKvrVZODNM2jiF5/R
         UePjXa0WzOVYzMQd4C+lxaJRPjT3xY/RlDyZFLZzWYhxTU1ig+SdGoOCgMrsGdcs9vGP
         PdYWtRtZmYyiXsnUC52WubbeOpn2OHG1PDZjkRzvLYiel3LaiiAF1WvZJa8KcAhXX+fH
         qWdP7Ovd4A6MH2pX4DaKja1vAWgVgT6aSVnlNTFQ/S13LB85IROx5so1sDclAynqyVc3
         ZmDw==
X-Gm-Message-State: AOJu0YzgUpGWReY2dxJ3km8rB7q5alP2E/9wniQvDcLcx84Q1tC6qnGC
	f7iozVHOE4ydQhlaKDDU+YiAY/48uFE28BGslxVtGIVPOvc8L/6YM/xqhynMvqRkc/Hmzfpkjol
	cbOM=
X-Google-Smtp-Source: AGHT+IHrteRRIJ68GuvVsHbkb8ZybEp42+yzkDELoYgH9fH/gWTy16rBzBwzPYUkLoae+oahWckUpQ==
X-Received: by 2002:a17:90b:3890:b0:2e1:e280:3d59 with SMTP id 98e67ed59e1d1-2e1e639f23amr12157847a91.33.1728266120564;
        Sun, 06 Oct 2024 18:55:20 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aebb70asm4074938a91.19.2024.10.06.18.55.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 18:55:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/10] webkitgtk: upgrade 2.44.1 -> 2.44.3
Date: Sun,  6 Oct 2024 18:55:00 -0700
Message-Id: <9a05f72805fa4c8ac408024bc8cd51892ad4a37c.1728266000.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728266000.git.steve@sakoman.com>
References: <cover.1728266000.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 01:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205255

From: Hitendra Prajapati <hprajapati@mvista.com>

Remove below patches which already fix in this upgraded version.

0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
0002-More-dynamicDowncast-adoption-in-platform-code.patch

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |  6 +-
 ...spection.cmake-prefix-variables-obta.patch |  2 +-
 ...fic-declarations-in-FELighting.h-unn.patch | 44 -------------
 ...icDowncast-adoption-in-platform-code.patch | 65 -------------------
 ...d5e22213fdaca2a29ec3400c927d710a37a8.patch |  2 +-
 .../webkit/webkitgtk/no-musttail-arm.patch    |  6 +-
 .../webkit/webkitgtk/reproducibility.patch    |  2 +-
 .../webkit/webkitgtk/t6-not-declared.patch    | 12 ++--
 ...ebkitgtk_2.44.1.bb => webkitgtk_2.44.3.bb} |  6 +-
 9 files changed, 16 insertions(+), 129 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.44.1.bb => webkitgtk_2.44.3.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index a819e22127..a19008a41f 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From 575b848a3b3c14280679db80d0d518922c83d62a Mon Sep 17 00:00:00 2001
+From 99a21305ae683a216e9299e5dbdd763190a8cfe3 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
@@ -57,10 +57,10 @@ index 5d5fb38c..a554f700 100644
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
 diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
-index 9b2fecf9..7cdc2b6a 100644
+index 0732785e..4879ec40 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -453,3 +453,10 @@ endif ()
+@@ -452,3 +452,10 @@ endif ()
  
  # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/b/139438>
  set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 8e29ce17ed..dda20a7b25 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 6348f91c29e2350ad3fec5264aa57dd4994d4583 Mon Sep 17 00:00:00 2001
+From d1f6a1b6a1298f6ef2f1677e9996aa60a002134a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
deleted file mode 100644
index 6ffe0a9454..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From dbd1a59b239b3902e717fdeb063883dbb0b06ee9 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Sun, 26 May 2024 14:24:35 -0700
-Subject: [PATCH 1/2] Remove ARM-specific declarations in FELighting.h unneeded
- after 272873@main
-
-Unreviewed build fix.
-
-* Source/WebCore/platform/graphics/filters/FELighting.h: Remove unneeded
-  declarations for the getPowerCoefficients() and platformApplyNeon()
-  functions, which are now defined elsewhere; and were causing a build
-  failure due to usage of the protected LightingData type.
-
-Canonical link: https://commits.webkit.org/279334@main
-
-Backport this patch for fixing following compile error:
-webkitgtk-2.44.1/Source/WebCore/platform/graphics/filters/FELighting.h:73:41: error: 'LightingData' does not name a type 
-   73 |     inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/36d1b5d7c0ef9a733ee8055b1f35b1d24435d538]
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- Source/WebCore/platform/graphics/filters/FELighting.h | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
-index 4efab920..dcd80b6f 100644
---- a/Source/WebCore/platform/graphics/filters/FELighting.h
-+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
-@@ -68,11 +68,6 @@ protected:
- 
-     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
- 
--#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
--    static int getPowerCoefficients(float exponent);
--    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
--#endif
--
-     Color m_lightingColor;
-     float m_surfaceScale;
-     float m_diffuseConstant;
--- 
-2.25.1
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch b/meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch
deleted file mode 100644
index a0c7b6bd57..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 88fa4b49a10ecfb74c36c678c1e2b76136357153 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 12 Jul 2024 10:16:05 +0800
-Subject: [PATCH 2/2] More dynamicDowncast<> adoption in platform code
-
-Backport part of commit [90d13e7 More dynamicDowncast<> adoption in
-platform code] to fix following compile error for ARM_NEON:
-webkitgtk-2.44.1/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp:545:37: error: 'LS_POINT' was not declared in this scope; did you mean 'WebCore::LightType::LS_POINT'?
-  545 |     if (data.lightSource->type() == LS_POINT) {
-      |                                     ^~~~~~~~
-      |                                     WebCore::LightType::LS_POINT
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/90d13e77ab2192b7efa8e763eeb8b08dbbb6d5c3]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- .../filters/FELightingNeonParallelApplier.cpp | 22 +++++++++----------
- 1 file changed, 10 insertions(+), 12 deletions(-)
-
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
-index 04d855fa..dccc003d 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
-@@ -542,19 +542,17 @@ void FELightingNeonParallelApplier::applyPlatformParallel(const LightingData& da
-     floatArguments.colorBlue = color.blue;
-     floatArguments.padding4 = 0;
- 
--    if (data.lightSource->type() == LS_POINT) {
-+    if (auto* pointLightSource = dynamicDowncast<PointLightSource>(*data.lightSource)) {
-         neonData.flags |= FLAG_POINT_LIGHT;
--        auto& pointLightSource = downcast<PointLightSource>(*data.lightSource);
--        floatArguments.lightX = pointLightSource.position().x();
--        floatArguments.lightY = pointLightSource.position().y();
--        floatArguments.lightZ = pointLightSource.position().z();
-+        floatArguments.lightX = pointLightSource->position().x();
-+        floatArguments.lightY = pointLightSource->position().y();
-+        floatArguments.lightZ = pointLightSource->position().z();
-         floatArguments.padding2 = 0;
--    } else if (data.lightSource->type() == LS_SPOT) {
-+    } else if (auto* spotLightSource = dynamicDowncast<SpotLightSource>(*data.lightSource)) {
-         neonData.flags |= FLAG_SPOT_LIGHT;
--        auto& spotLightSource = downcast<SpotLightSource>(*data.lightSource);
--        floatArguments.lightX = spotLightSource.position().x();
--        floatArguments.lightY = spotLightSource.position().y();
--        floatArguments.lightZ = spotLightSource.position().z();
-+        floatArguments.lightX = spotLightSource->position().x();
-+        floatArguments.lightY = spotLightSource->position().y();
-+        floatArguments.lightZ = spotLightSource->position().z();
-         floatArguments.padding2 = 0;
- 
-         floatArguments.directionX = paintingData.directionVector.x();
-@@ -565,8 +563,8 @@ void FELightingNeonParallelApplier::applyPlatformParallel(const LightingData& da
-         floatArguments.coneCutOffLimit = paintingData.coneCutOffLimit;
-         floatArguments.coneFullLight = paintingData.coneFullLight;
-         floatArguments.coneCutOffRange = paintingData.coneCutOffLimit - paintingData.coneFullLight;
--        neonData.coneExponent = getPowerCoefficients(spotLightSource.specularExponent());
--        if (spotLightSource.specularExponent() == 1)
-+        neonData.coneExponent = getPowerCoefficients(spotLightSource->specularExponent());
-+        if (spotLightSource->specularExponent() == 1)
-             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
-     } else {
-         ASSERT(data.lightSource->type() == LS_DISTANT);
--- 
-2.25.1
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch b/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
index 76bcb3df99..0d8976c502 100644
--- a/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
@@ -1,4 +1,4 @@
-From 1523e00a2a76e285262c8aa3721b5d99f3f2d612 Mon Sep 17 00:00:00 2001
+From 2ee948191de1c561b72ebf462605376cfb3ce7af Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Mon, 16 Jan 2023 17:03:30 +0100
 Subject: [PATCH] REGRESSION(257865@main): B3Validate.cpp: fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
index 8ce37a01cc..793be48df2 100644
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
@@ -1,4 +1,4 @@
-From a9c874f7418cefbe78f7cd26505ae495cb59bbcf Mon Sep 17 00:00:00 2001
+From 31dca9601888f2a539dfb22693ffd62c22ee8912 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 12 Jan 2024 09:21:39 -0800
 Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
-index 0ea5cb76..c5480dbc 100644
+index 449ca502..daac29d7 100644
 --- a/Source/WTF/wtf/Compiler.h
 +++ b/Source/WTF/wtf/Compiler.h
-@@ -284,7 +284,7 @@
+@@ -321,7 +321,7 @@
  /* MUST_TAIL_CALL */
  
  #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index 93a431a0b1..d614a1ee4f 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From d096b945113ddecaf33062296e20b6d5a007cab3 Mon Sep 17 00:00:00 2001
+From cb5458b5d15aafa3543a47a33975609026d45d32 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index d4720e4f28..064925dace 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,10 +1,9 @@
-From 3d5373575695b293b8559155431d0079a6153aff Mon Sep 17 00:00:00 2001
+From 36c092723ec6d4908039341c9d157db8ab1c0a59 Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
-Subject: [PATCH] =?UTF-8?q?[GTK]=20[2.42.5]=20LowLevelInterpreter.cpp:339:?=
- =?UTF-8?q?21:=20error:=20=E2=80=98t6=E2=80=99=20was=20not=20declared=20in?=
- =?UTF-8?q?=20this=20scope=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid?=
- =?UTF-8?q?=3D268739?=
+Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
+ =?UTF-8?q?=E2=80=98t6=E2=80=99=20was=20not=20declared=20in=20this=20scope?=
+ =?UTF-8?q?=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid=3D268739?=
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -22,7 +21,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-index 5064ead6cd2e7..9a2e2653b1219 100644
+index 75cecbbd..b1020ea4 100644
 --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 @@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
@@ -34,4 +33,3 @@ index 5064ead6cd2e7..9a2e2653b1219 100644
  
      struct StackPointerScope {
          StackPointerScope(CLoopStack& stack)
-
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
index c4a3c464c1..90fb7a1d42 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
@@ -16,10 +16,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
-           file://0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch \
-           file://0002-More-dynamicDowncast-adoption-in-platform-code.patch \
            "
-SRC_URI[sha256sum] = "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
+SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -95,7 +93,7 @@ EXTRA_OECMAKE = " \
 
 # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
 # debug symbols (4.3GB to 700M at time of writing)
-DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
+DEBUG_LEVELFLAG = "-g1"
 
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
-- 
2.34.1


