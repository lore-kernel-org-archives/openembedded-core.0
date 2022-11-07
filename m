Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFAAC47088
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.4130.1667832919242540772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P1o9rnRj;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso7300902wmp.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bY5cke9vkvz/Dx+RepxAWgv8pmGl4xvAc9XYugem9rA=;
        b=P1o9rnRj8dFQ1szjrkzxC5RNaswJSNWsIj4RpYqn3y89ZdzL942/n4EVp4LfkgaHzz
         WkDEbYmIpRFo6kVnyfBlPk7v+Mv2xwe9BgwvUNG2pq/MjCwGAYluiCPhwMBYXO+b7tv4
         7JPr6oW8zdc8JZvUnY4oyPS7XP9kM4vx9NuhHA/BeuvaphevmYX/OmcvZrvNgPD/QFpj
         +4NfFratvIGxXb7E8v4rBI08/hMivi7m2tXHM6UKC8FGlwLY6uqWTwzgkad7hXCoq8YS
         ustUZ5xvfSX3VSVkLBHBi/PkpbAu+g3xroKYQCx7ulMsdxW+XZl8wgPCwqYROySrg4KG
         DaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bY5cke9vkvz/Dx+RepxAWgv8pmGl4xvAc9XYugem9rA=;
        b=7xdLwLgN/o+pHhtbj56VkWw6R8ojUaE5Vsx8ykSOIo+uyKB4RvxFAYQZItONkuHxbv
         zRvlbtMjZgU43fsNZ/+entyKzEK8yMRW6WMCaW+zwLlX4og2e5CspkvVC9lr9j3fiDZ1
         PJHhdkazFtxiV76DA9qOfmKxu1CnwSoO6+zQXanJ0rFoU48PURzdgL0FC4E8UoZod9m6
         yyrSwwRLYCij7ST2lONUALqykL0aqu7lc+g2cPl/+8jCdja/QDzQo25Fme6zcMvZ1Amj
         ijJuYoPFbclSuved/FBNX6wRmcCQjUaIIKqzlV84X7R08xZBg7iv4SusPDYxAGQTwpAk
         vrpA==
X-Gm-Message-State: ACrzQf3Y+zZg+nFPnZv7yui7lsSd6rO6IYoMazsm6j1cs1afNudPzt8T
	wYWrIwrkwLlTQF6fsII7TgS2LeayH5Y=
X-Google-Smtp-Source: AMsMyM78pHdJcFOWehOo+JwXTit4N4zO7cxaX8LQnS9ncG/qT/CwwjmLGInh/zGaacuHwtJKKk33Rg==
X-Received: by 2002:a05:600c:3d92:b0:3c7:12c6:a99f with SMTP id bi18-20020a05600c3d9200b003c712c6a99fmr20396761wmb.136.1667832958912;
        Mon, 07 Nov 2022 06:55:58 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 41/48] vulkan: upgrade 1.3.224.1 -> 1.3.231.1
Date: Mon,  7 Nov 2022 15:55:01 +0100
Message-Id: <20221107145508.1051404-41-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172891

Update 0001-generate-glslang-pkg-config.patch to
omit libraries that are no longer present
(their functionality has been folded into glslang library
itself).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glslang/0001-generate-glslang-pkg-config.patch | 14 +++++++-------
 .../{glslang_1.3.224.1.bb => glslang_1.3.231.1.bb} |  2 +-
 ...ers_1.3.224.1.bb => spirv-headers_1.3.231.1.bb} |  2 +-
 ...tools_1.3.224.1.bb => spirv-tools_1.3.231.1.bb} |  2 +-
 ...rs_1.3.224.1.bb => vulkan-headers_1.3.231.1.bb} |  2 +-
 ...der_1.3.224.1.bb => vulkan-loader_1.3.231.1.bb} |  4 ++--
 ...ools_1.3.224.1.bb => vulkan-tools_1.3.231.1.bb} |  4 ++--
 7 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.224.1.bb => glslang_1.3.231.1.bb} (95%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.224.1.bb => spirv-headers_1.3.231.1.bb} (92%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.224.1.bb => spirv-tools_1.3.231.1.bb} (96%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.224.1.bb => vulkan-headers_1.3.231.1.bb} (93%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.224.1.bb => vulkan-loader_1.3.231.1.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.224.1.bb => vulkan-tools_1.3.231.1.bb} (93%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index b1548c7343..a2dcb13b36 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From 7161916f69ae257ce06d9c9bf25abf9709bc55cc Mon Sep 17 00:00:00 2001
+From e8c1b7e1dc6d108a3b49d0adfdc4f836cfafcf1a Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -16,13 +16,13 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index 45c9813a..cea13975 100644
+index 72e82b48..c6188e12 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -221,6 +221,8 @@ if(ENABLE_GLSLANG_INSTALL)
-         endif()
-     ")
-     install(FILES "${CMAKE_CURRENT_BINARY_DIR}/glslangTargets.cmake" DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
+@@ -223,6 +223,8 @@ if(ENABLE_GLSLANG_INSTALL)
+         ")
+         install(FILES "${CMAKE_CURRENT_BINARY_DIR}/glslangTargets.cmake" DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
+     endif()
 +    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/glslang.pc.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc @ONLY)
 +    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
  
@@ -43,5 +43,5 @@ index 00000000..948a0952
 +Description: OpenGL and OpenGL ES shader front end and validator
 +Requires:
 +Version: @GLSLANG_VERSION@
-+Libs: -L${libdir} -lglslang -lOSDependent -lHLSL -lOGLCompiler -lSPVRemapper
++Libs: -L${libdir} -lglslang -lHLSL -lSPVRemapper
 +Cflags: -I${includedir}
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.224.1.bb b/meta/recipes-graphics/glslang/glslang_1.3.231.1.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_1.3.224.1.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.231.1.bb
index dd8df15fc7..fede2516b1 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.224.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.231.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "10423ec659d301a0ff2daac8bbf38980abf27590"
+SRCREV = "5755de46b07e4374c05fb1081f65f7ae1f8cca81"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 PE = "1"
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.224.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.231.1.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.224.1.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.231.1.bb
index 94500a96ba..fdcc8d523f 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.224.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.231.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "b2a156e1c0434bc8c99aaebba1c7be98be7ac580"
+SRCREV = "85a1ed200d50660786c1a88d9166e871123cce39"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
index cfea28a6ef..ea47796543 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "5e61ea2098220059e89523f1f47b0bcd8c33b89a"
+SRCREV = "eb0a36633d2acf4de82588504f951ad0f2cecacb"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb
index 8d34738ad7..b41b82af9d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "c896e2f920273bfee852da9cca2a356bc1c2031e"
+SRCREV = "98f440ce6868c94f5ec6e198cc1adda4760e8849"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb
index f24db87962..59c52c1db7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.224;protocol=https"
-SRCREV = "09afdf64210b11ec653a1001e013b5af4fce8559"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.231;protocol=https"
+SRCREV = "eedbf08292a6be19c3527e77ae2df3f209cab285"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb
index bed10afef1..9066821de0 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master;protocol=https"
-SRCREV = "497f232680b046db34ba9e9da065e6303a125851"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.3.231;protocol=https"
+SRCREV = "8d2d3e22d684540fdc5a76c15e456fc2fd11e4b7"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


