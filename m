Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E11C54E4A
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:31 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.15046.1709739747519663253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nCA7p+O4;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-563b7b3e3ecso10726539a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739746; x=1710344546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEnp3sT+zBdhxMBroY+xGcSuQrkn8UWp8yr4wlYzsrs=;
        b=nCA7p+O4P83b9uvOCtHiZxc16yEfYTJcQ3QdKJIV73cGVw5fngnlbuKVpSRoxk1VvJ
         K5lGo0OR1urVeWi1W+RHxJOQpx8rSWPI3U6d8rmWHMyFbUMLLX9NvAg0GYPKZnhyU5x2
         OxJjvjlZR+g/IF8d16Wpl2NxE9swGF1Gf63HbCVTU2drIlVjdGwbGbTGtRFQq13I2K6m
         4RmP4RWHT/nYeMYpnC83aRL3JkkxIDXcmlwy81fWk8XsSFNjpI/AOlRP4ym+d3m6h0xK
         5HqNTTnzek3oV0nSgoAJPjzFkehtPIuZkO1JU+PzUtfeRHVIGH8CNx2O3P5C/ki78+8o
         lU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739746; x=1710344546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEnp3sT+zBdhxMBroY+xGcSuQrkn8UWp8yr4wlYzsrs=;
        b=p5YtN8FPQSIYIPM3plL7V1OAz38cSdXhs1gq/lWkyCRnVZvLbK9UJX2RHG3K6c2sii
         RVw33U9Q2ACHGefCZG0Cgdq6iJuDscdn/iXn4ExJW6VHrEuV90nsEzAksTqlCnS77UmH
         OdC36UFfGXAgXrNzOcoMYKWUMi1G5fQQKmu1zbjfx6YE856taLsEU5Ya9u5Skj4jYvOS
         VgSS4UeVNNEZDvmwAi2160vWh2+fpbz+k0yfZv82JjVv9QiKe/qGhlM0wWmlX71TbUsK
         XXlvOuVgl8szDG4YQJf6akqLFysZiPeQN/OYdsTO05dx8x6G2TYJcIm5zyi0DqtMpZKG
         tWjQ==
X-Gm-Message-State: AOJu0YyhWJHyu3iKi/HvuJeY95JMJsNXu0O7Vu2a7a2hvaQwKg3Ds902
	69njOEsLdzpqPHaXlHttZGfxe2TcCJzITpwrEwNTPoMSjT6mAhKQZrYGiLkW
X-Google-Smtp-Source: AGHT+IFr25/vhA5VLQ5tw2IGAZgKYZ/q1ut+4w7EMZnttYW02uz6ALj8w/73QThec8M29LFO3eLB9w==
X-Received: by 2002:a17:906:37d5:b0:a45:bea5:8063 with SMTP id o21-20020a17090637d500b00a45bea58063mr1413366ejc.48.1709739745834;
        Wed, 06 Mar 2024 07:42:25 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 46/47] vulkan: upgrade 1.3.268.0 -> 1.3.275.0
Date: Wed,  6 Mar 2024 16:41:50 +0100
Message-Id: <20240306154151.3741709-46-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196729

Add vulkan-volk recipe to support building latest vulkan-tools.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../0001-generate-glslang-pkg-config.patch    | 13 +++----
 ...lang_1.3.268.0.bb => glslang_1.3.275.0.bb} |  2 +-
 ....3.268.0.bb => spirv-headers_1.3.275.0.bb} |  2 +-
 ..._1.3.268.0.bb => spirv-tools_1.3.275.0.bb} |  2 +-
 ...3.268.0.bb => vulkan-headers_1.3.275.0.bb} |  2 +-
 ....3.268.0.bb => vulkan-loader_1.3.275.0.bb} |  4 +-
 ...1.3.268.0.bb => vulkan-tools_1.3.275.0.bb} |  4 +-
 ... => vulkan-utility-libraries_1.3.275.0.bb} |  2 +-
 ... => vulkan-validation-layers_1.3.275.0.bb} |  4 +-
 .../vulkan/vulkan-volk_1.3.275.0.bb           | 37 +++++++++++++++++++
 11 files changed, 55 insertions(+), 18 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.268.0.bb => glslang_1.3.275.0.bb} (96%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.268.0.bb => spirv-headers_1.3.275.0.bb} (93%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.268.0.bb => spirv-tools_1.3.275.0.bb} (96%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.268.0.bb => vulkan-headers_1.3.275.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.268.0.bb => vulkan-loader_1.3.275.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.268.0.bb => vulkan-tools_1.3.275.0.bb} (93%)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.3.268.0.bb => vulkan-utility-libraries_1.3.275.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.268.0.bb => vulkan-validation-layers_1.3.275.0.bb} (95%)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-volk_1.3.275.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 9faac4a89f4..4ca5430a941 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -851,6 +851,7 @@ RECIPE_MAINTAINER:pn-vulkan-samples = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-vulkan-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-vulkan-utility-libraries = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-vulkan-validation-layers = "Vincent Davis Jr <vince@underview.tech>"
+RECIPE_MAINTAINER:pn-vulkan-volk = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-waffle = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-watchdog-config = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index a2dcb13b363..316a57fa4a6 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From e8c1b7e1dc6d108a3b49d0adfdc4f836cfafcf1a Mon Sep 17 00:00:00 2001
+From 4cede5edcff96134baf35953d58595c4aa5f1fc5 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -8,7 +8,6 @@ Based on https://src.fedoraproject.org/rpms/glslang/blob/main/f/0001-pkg-config-
 Upstream-Status: Pending
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
 ---
  glslang/CMakeLists.txt      |  2 ++
  glslang/glslang.pc.cmake.in | 11 +++++++++++
@@ -16,21 +15,21 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index 72e82b48..c6188e12 100644
+index 37eecaad..6974935c 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -223,6 +223,8 @@ if(ENABLE_GLSLANG_INSTALL)
+@@ -251,6 +251,8 @@ if(PROJECT_IS_TOP_LEVEL)
          ")
          install(FILES "${CMAKE_CURRENT_BINARY_DIR}/glslangTargets.cmake" DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
      endif()
 +    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/glslang.pc.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc @ONLY)
 +    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
  
-     set(ALL_HEADERS
-         ${GLSLANG_HEADERS}
+     set(PUBLIC_HEADERS
+         Public/ResourceLimits.h
 diff --git a/glslang/glslang.pc.cmake.in b/glslang/glslang.pc.cmake.in
 new file mode 100644
-index 00000000..948a0952
+index 00000000..43104e68
 --- /dev/null
 +++ b/glslang/glslang.pc.cmake.in
 @@ -0,0 +1,11 @@
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
index 033830ba36b..2fd1e72a265 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "36d08c0d940cf307a23928299ef52c7970d8cee6"
+SRCREV = "a91631b260cba3f22858d6c6827511e636c2458a"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.268.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.268.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
index 7045f704736..598a8fc209a 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.268.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "e867c06631767a2d96424cbec530f9ee5e78180f"
+SRCREV = "1c6bb2743599e6eb6f37b2969acc0aef812e32e3"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
index 1cccafdad02..05c6de1b500 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "360d469b9eac54d6c6e20f609f9ec35e3a5380ad"
+SRCREV = "f0cc85efdbbe3a46eae90e0f915dc1509836d0fc"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb
index a1a83317daa..aacec8cab18 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "7b3466a1f47a9251ac1113efbe022ff016e2f95b"
+SRCREV = "217e93c664ec6704ec2d8c36fa116c1a4a1e2d40"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb
index 5a5749d40c9..7caed67207b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.268;protocol=https"
-SRCREV = "f4c838e2e7358fc450f8112119bbdbb5b03e03fa"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.275;protocol=https"
+SRCREV = "00893b9a03e526aec2c5bf487521d16dfa435229"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb
index 78bd9b0e045..f86912c903a 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
-SRCREV = "1532001f7edae559af1988293eec90bc5e2607d5"
+SRCREV = "c86d42cf9eb620eeac377e3bff46ae342c5cd664"
 
 S = "${WORKDIR}/git"
 
@@ -15,7 +15,7 @@ inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-DEPENDS += "vulkan-headers vulkan-loader"
+DEPENDS += "vulkan-headers vulkan-loader vulkan-volk"
 
 EXTRA_OECMAKE = "\
                  -DBUILD_TESTS=OFF \
diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
index fee4ba6cc9e..759a03926b8 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
-SRCREV = "c9ca4ac620a238a93c65d864f2eaa33954d74509"
+SRCREV = "4cfc176e3242b4dbdfd3f6c5680c5d8f2cb7db45"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.268.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.275.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.268.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.275.0.bb
index 6c2715b041b..239589108d0 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.268.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.275.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd3c0bc366cd9b6a906e22f0bcb5910f"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.268;protocol=https"
-SRCREV = "3c64adb4e052062fc60b6580c365429fddfbcfbf"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.275;protocol=https"
+SRCREV = "780c65337e111c7385109c7b720d757a778e4fe2"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.275.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.275.0.bb
new file mode 100644
index 00000000000..f4e6e89aac7
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.275.0.bb
@@ -0,0 +1,37 @@
+SUMMARY = "A meta-loader for Vulkan"
+DESCRIPTION = "Volk allows one to dynamically load entrypoints required \
+to use Vulkan without linking to vulkan-1.dll or statically linking Vulkan loader. \
+"
+HOMEPAGE = "https://www.khronos.org/vulkan/"
+BUGTRACKER = "https://github.com/zeux/volk"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=b2dd098d35668a801190a9d9d47461b0"
+
+SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
+SRCREV = "f2a16e3e19c2349b873343b2dc38a1d4c25af23a"
+
+S = "${WORKDIR}/git"
+
+REQUIRED_DISTRO_FEATURES = "vulkan"
+
+DEPENDS = "vulkan-headers"
+
+EXTRA_OECMAKE = "\
+    -DVOLK_INSTALL=ON \
+    "
+
+inherit cmake features_check pkgconfig
+
+# These recipes need to be updated in lockstep with each other:
+# glslang, vulkan-headers, vulkan-loader, vulkan-tools,
+# vulkan-validation-layers, spirv-headers, spirv-tools,
+# vulkan-utility-libraries.
+# The tags versions should always be sdk-x.y.z, as this is what
+# upstream considers a release.
+UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
+
+do_install:append() {
+    sed -i -e 's,${STAGING_DIR_TARGET},,g' ${D}${libdir}/cmake/volk/volkTargets.cmake
+}
-- 
2.39.2


