Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808B6CAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 21:11:47 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.557.1757625100415438188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 14:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V5f9XIz9;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7a16441so179151766b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 14:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757625099; x=1758229899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCluAc8/Fy20fxSCr5SqbPiGLr9YNLBlb5DYJPUFtV0=;
        b=V5f9XIz9BMjgRRjXoUiwRgAvdIlWlS8ykGKXWXSi6H/6/P35jgs5M5rGprLLz29cxG
         tR3N8gy9OrM8eSbfTU6cZfFQctgi5Cn+a/sU/QC1jsT+AjvFgj2uRuhRHAKuy+L4iJQ6
         2ej4I05+nnmoi17XIMGp/K/9Ph2dcn8pUY4cIcG3TpzE0rmoIudUIMtl6pbNRCoQq2LT
         9QxRl89DxBwH6hEioZ+QlZehVVc/CUX9KJCgtFafZw9mlVKJpMrsebma+mxedboRJo/f
         nrfPfu543Bz7teDegTV2ebWn4Tv5lRiJozNjIrAe7jefoNN2zelvOs5KuWL59a9NFNo/
         zoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757625099; x=1758229899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mCluAc8/Fy20fxSCr5SqbPiGLr9YNLBlb5DYJPUFtV0=;
        b=up474I0SZM79H5/u6dwB62aTucFQ2GG8pLTDQ52SQqPRVneC7LGrKqA3pfoCFxozml
         vLsH1Av/lAE4sEK7NxNPJOjjxP5YU89zTk2XImN9VuybDtMD89BovsmuQyMzL/CPdL4f
         O4mNUW9d//1vCQAr4sVRI/TqWx7wTm8oPfqwsfilU3C3b3De5WGOfLWr8829tR1ld+2P
         lOUD7rb8U66eXpH9LyO/yiPpCXPmNmHm4smbIj1IsxEBG28A96+SExBFSw+Kdx2Mll2M
         KNVD2T/0RA67fALlw0xTqUhWCbBomKsGY0qpNsgoFUd5gZjlJs/rsBh4kzwaHKeAeQpp
         x4Pw==
X-Gm-Message-State: AOJu0YzjsFvuzWD5w+NpgpaociL+orzHGqehAsgJeQKiiJy86fSsztIh
	RNbK/Wr5c9LiNI3fBc6/P7pVCfAT3nGd3jCAfv4BOmOjLdCUg4XfZo4Pmt0v+A==
X-Gm-Gg: ASbGncvH0EfKCAdPaDV0GrNXE/eeVRGddQO+XDeGsCTG0LVmFfgFECUO9OxeLz9Yq/R
	xW5FPZ4/SQbrkmnW8Wr0Ke+P5ROBkrim76Z17ggGKK1Bk+8UXxnb0PJPfkImUa1Lo93fMJ/JGbs
	LhEEagjrOa5G5ClIUjlJ6Zb8EYmiXyj+th9MOP+VevIgnqEntYQpAmx0xXkmJzmct1flbkqsUxd
	923qbaaDTAFRJjBtaTOyaXJq0c5wHl76T0FNrCs92s4RwftcI8spG1kFTXZuYJLtIi+vqbG3C6I
	n92Fg/cGx6pdhw9sxsDO5YmPXaSP6LJ4RXoFcSIDLMWlqnzXBHIu3wMzFddaw+XucCzJF4hYzOt
	kFwlwqcg7ZChQi8dz9Ujg2WVCnpls19cCfL68n3nEIw==
X-Google-Smtp-Source: AGHT+IFLQ86YdDn+C8niF2zoOY0pRPfLjTuF4zzgOavFKyYaLIKsj8qHfJ7KvSj4jhZsmfiTaPEpCg==
X-Received: by 2002:a17:907:86ab:b0:afe:dd76:7cd4 with SMTP id a640c23a62f3a-b07c37abc6bmr58591366b.57.1757625098463;
        Thu, 11 Sep 2025 14:11:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f1e26sm208939566b.77.2025.09.11.14.11.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 14:11:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vulkan-samples: update to latest revision
Date: Thu, 11 Sep 2025 23:11:37 +0200
Message-ID: <20250911211137.3678240-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 21:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223296

Dropped 0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch,
because the dependency it was patching (glslang submodule) has been
removed by the project, so it became obsolete.

Shortlog:
Unify vkb::PhysicalDevice and vkb::core::HPPPhysicalDevice into vkb::core::PhysicalDevice<bindingType>
Update Apple min deployment versions and iOS Simulator build config
Add example for dynamic_rendering_local_read
Add Slang and HLSL shaders to first set of samples
Fix use of --width and --height by setting extent earlier
Unify vkb::Instance and vkb::core::HPPInstance into vkb::core::Instance<bindingType>
Remove vkb::filesystem::init() from astc to fix memory leak and batch mode stability
Update VVL version to 1.4.321.0 for Android
Update NDK version to r28c for Android
Fix variable descriptor count info not used in descriptor set creation
Fix layer settings regression on Apple platforms for MoltenVK config
Update shader interfaces to match sample's vertex input description
Fix regression on iOS Simulator by including TargetConditionals.h in gui.h
Add CMAKE_OSX_DEPLOYMENT_TARGET to macOS build docs and CI script
Add possible Linux WSI options
Unify vkb::Gui and vkb::HPPGui into vkb::Gui<bindingType>
Remove submodule CTPL, replace its functionality by calls to std::async
fix: fix the surface resize logic when use wayland wsi
Implement simple cache for decoded ASTC textures
Unify vkb::Device and vkb::core::HPPDevice into vkb::core::Device<bindingType>
Port of latest changes in api sample hello_triangle to hpp_hello_triangle
Fix crash in sample on android
Improve and fix async compute sample
Fix MacOS cmake build instructions
Replace runtime shader compilation with offline compiled SPIR-V shaders
Transcoded version of api sample hello_triangle_1_3 based on Vulkan-Hpp
Unify vkb::RenderFrame and vkb::rendering::HPPRenderFrame into vkb::rendering::RenderFrame<bindingType>
Increase base version to Vulkan 1.1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...uilder.h-add-missing-cstdint-include.patch | 28 -------------------
 .../vulkan/vulkan-samples_git.bb              |  6 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
deleted file mode 100644
index f50aa806da..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e40c14a3e007fac0e4f2e4164fdf14d1712355bd Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Fri, 2 Aug 2024 22:44:21 +0100
-Subject: [PATCH] SPIRV/SpvBuilder.h: add missing <cstdint> include
-
-Without the change `glslang` build fails on upcoming `gcc-15` as:
-
-    In file included from /build/source/SPIRV/GlslangToSpv.cpp:45:
-    SPIRV/SpvBuilder.h:248:30: error: 'uint32_t' has not been declared
-      248 |     Id makeDebugLexicalBlock(uint32_t line);
-          |                              ^~~~~~~~
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/glslang/commit/e40c14a3e007fac0e4f2e4164fdf14d1712355bd]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- SPIRV/SpvBuilder.h | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/SPIRV/SpvBuilder.h
-+++ b/SPIRV/SpvBuilder.h
-@@ -56,6 +56,7 @@ namespace spv {
- }
- 
- #include <algorithm>
-+#include <cstdint>
- #include <map>
- #include <memory>
- #include <set>
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index b7c9ddd2fe..8011c3a81c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,12 +5,10 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
-SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
-           file://0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch;patchdir=third_party/glslang \
-           "
+SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "d27205d14d01ea7d33efc8ba2862478612370182"
+SRCREV = "b9961792604af2ede4c9d0868947de2a8eccd549"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 

