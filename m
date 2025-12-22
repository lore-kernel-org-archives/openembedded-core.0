Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB23EE6B24E
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:08 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88508.1766436303123947589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WwwC3vQ8;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b8e5d1611so4928736a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436301; x=1767041101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUxaQ2lZloOBs8i53MmNfT7+LBpKUYfd57WJbTj6I6o=;
        b=WwwC3vQ8kdS5YESUsTrqdcopJY/dUsdS3p+4ztJB6uwYHOIrQlRWy/Y4HeYNXC+Djx
         9as3pMPSqk9awiKwbZUZJeFEkVH7VKuBjezhWso07H9i1W6OaFbZAll/b8sEDG6N/v1+
         ZPOWUNWj8ImfVfZNIxvlX3YD68bfAvXFepdh9f15EySA2za5KKOqwgw8mRzbhZt7pl3m
         aW1XagJpx6zlRipB//lrAY+UINxWxvRGX+Pxcg30F17rBrwfaD8aU9lvm15zssANyjge
         aDqZrlGTieG8wTvPb4fCDH+1q6GbvNjL2v1XtyFxH5oq1jsjGw49FLXO2NYVfz5opH1O
         DhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436301; x=1767041101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hUxaQ2lZloOBs8i53MmNfT7+LBpKUYfd57WJbTj6I6o=;
        b=j1vmFVT7nKHQxySdyt9jzD8KsuPiy8vEV6TJ8c8cIFwC1zuehkfV/5cXON1dzCzIBI
         V3UA0r4qS+Q3heluS2vsEkyxUo6fIYpxPNmInIFgtL0HxmHjw6FrAT4/1KluE6Jk8QQF
         g5niK2umvktapw4MqLho5E53vHmBZXJMCTL6Z83vjKWysPsCgA2BBgZ0ws3UlucnVPTl
         M9Z2k302FiKtZ0VYAlcPmtfqssqwEY9FZG+Nr0jh4a+vzJtCUoOUJZOwvQjzm19afwy/
         aOXzMUSmhjWADyEjTsjCKLJsR1ykrA4+FZdYILFwJKACgZM6DBoVXmhdEoN1JQVhFqCk
         87lQ==
X-Gm-Message-State: AOJu0Yx4jxZViyZ6FuIm5me5FHsCFcSQv3PNNnyTqgnH19vLYQqWOmjL
	jmtI0UdcAT30CUNVvTy1lkadErZhpqfQ9C9HtQ/nmtvqHCE+mAP6M/HW+qa8Eg==
X-Gm-Gg: AY/fxX6BwULiDOKt4UvX9tuG1RFCInP0WGg/1OyQPZ77USdo/Y3qS5tVL//GftKQkZh
	KH0HlTnVrxFIIzgO0AQB4CmYd3F+89zo0gYKeNSVYLeDHilyG6NnMEypv6ZrI5VCs52umHh3ge8
	nWz6YRdP1BHB0mX4i2yHxX38fftK7bpfLgWh7aNKIpADPTXNtj+tHzAOHouvPLUwvhkz7xgNL8u
	k0u4PBv79rJO583mS6n9ft7vg41QHR979g/hrdTKG6iZwV1he9n0ukJw4dM7gtBydvKPG6/YMgf
	f8gvrMNbZWo6i53aVVGHn+nqD6sepafKUZ8JoxV4dhFHr+0kvFZRw/xX2QTXH6pPuMHk9Tt/Y90
	jQZXK2RePS4TpkdVQ2ChmDZ7jDipjvW166uya1QwdDB+VGewr3i1DHZSPu/vyS6ks1pjEfDbQNq
	uo4MnSYe42TeUDYGnuLCY5VOy3/lhK9cAXG5crJxPdGz1egxE=
X-Google-Smtp-Source: AGHT+IEviWIb6y/tSgshQIRuDqmqT1J2fSoNVGj7gvYLqElWs1olRtsy97kayzOG1OMBAy21nG/v3A==
X-Received: by 2002:a17:907:7fa8:b0:b73:572d:3b07 with SMTP id a640c23a62f3a-b8036fac50amr1352342966b.28.1766436301249;
        Mon, 22 Dec 2025 12:45:01 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:45:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/15] vulkan: upgrade 1.4.328.1 -> 1.4.335.0
Date: Mon, 22 Dec 2025 21:44:23 +0100
Message-ID: <20251222204455.2284529-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228430

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch  | 6 +++---
 .../glslang/{glslang_1.4.328.1.bb => glslang_1.4.335.0.bb}  | 4 ++--
 ...pirv-headers_1.4.328.1.bb => spirv-headers_1.4.335.0.bb} | 5 ++---
 .../{spirv-tools_1.4.328.1.bb => spirv-tools_1.4.335.0.bb}  | 5 ++---
 ...kan-headers_1.4.328.1.bb => vulkan-headers_1.4.335.0.bb} | 4 ++--
 ...ulkan-loader_1.4.328.1.bb => vulkan-loader_1.4.335.0.bb} | 4 ++--
 ...{vulkan-tools_1.4.328.1.bb => vulkan-tools_1.4.335.0.bb} | 4 ++--
 ...s_1.4.328.1.bb => vulkan-utility-libraries_1.4.335.0.bb} | 4 ++--
 ...s_1.4.328.1.bb => vulkan-validation-layers_1.4.335.0.bb} | 4 ++--
 .../{vulkan-volk_1.4.328.1.bb => vulkan-volk_1.4.335.0.bb}  | 4 ++--
 10 files changed, 21 insertions(+), 23 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.328.1.bb => glslang_1.4.335.0.bb} (93%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.328.1.bb => spirv-headers_1.4.335.0.bb} (89%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.328.1.bb => spirv-tools_1.4.335.0.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.328.1.bb => vulkan-headers_1.4.335.0.bb} (92%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.328.1.bb => vulkan-loader_1.4.335.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.328.1.bb => vulkan-tools_1.4.335.0.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.328.1.bb => vulkan-utility-libraries_1.4.335.0.bb} (91%)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.328.1.bb => vulkan-validation-layers_1.4.335.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.328.1.bb => vulkan-volk_1.4.335.0.bb} (88%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index 04dab67773..150242ce1d 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From df6111570ada81d3968043decb5eee16dc5f9fa1 Mon Sep 17 00:00:00 2001
+From 6a4237802d8a79f65ed74b12865e2ce5b666993d Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -15,10 +15,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index 47925d8d..d90191c3 100644
+index 1bf4c1f2..9a05cbaf 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -255,6 +255,8 @@ if(GLSLANG_ENABLE_INSTALL)
+@@ -256,6 +256,8 @@ if(GLSLANG_ENABLE_INSTALL)
          install(TARGETS MachineIndependent EXPORT glslang-targets)
          install(TARGETS GenericCodeGen EXPORT glslang-targets)
      endif()
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb b/meta/recipes-graphics/glslang/glslang_1.4.335.0.bb
similarity index 93%
rename from meta/recipes-graphics/glslang/glslang_1.4.328.1.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.335.0.bb
index 57d9fe1a98..7d3b5d0bc8 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.335.0.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=50ff9d0fcde2d5b953ebe431c48e34e3"
 
-SRCREV = "a57276bf558f5cf94d3a9854ebdf5a2236849a5a"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.328;tag=vulkan-sdk-${PV} \
+SRCREV = "b5782e52ee2f7b3e40bb9c80d15b47016e008bc9"
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "
 PE = "1"
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.335.0.bb
similarity index 89%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.335.0.bb
index 2b750e4b92..db49f2ae13 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.335.0.bb
@@ -4,9 +4,8 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT & CC-BY-4.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "01e0577914a75a2569c846778c2f93aa8e6feddd"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=vulkan-sdk-1.4.328 \
-"
+SRCREV = "b824a462d4256d720bebb40e78b9eb8f78bbb305"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.335.0.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.335.0.bb
index e5aedb1620..5849ec1bac 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.335.0.bb
@@ -7,9 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "7f2d9ee926f98fc77a3ed1e1e0f113b8c9c49458"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=vulkan-sdk-1.4.328;protocol=https \
-           "
+SRCREV = "262bdab48146c937467f826699a40da0fdfc0f1a"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb
similarity index 92%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb
index d531ec8e87..de4012d26c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb
@@ -9,9 +9,9 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=vulkan-sdk-1.4.328;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "19725e4d48082fe78e26622b15d3080ccd54112b"
+SRCREV = "2fa203425eb4af9dfc6b03f97ef72b0b5bcb8350"
 
 inherit cmake
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb
index d80e84a34e..8799221313 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.328;protocol=https"
-SRCREV = "0a278cc725089cb67bf6027076e5d72f97c04d86"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.335;protocol=https"
+SRCREV = "057ca1e5f2b61bbb3942e3a7464d488d5bde4a3c"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.328.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.328.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb
index 34823b295c..b5bf3d0923 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.328.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.328;protocol=https"
-SRCREV = "c08c91e473dcab3d5042e85856b005562fa5dbbb"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
+SRCREV = "8542e6dcfc6daef20d561220f1d91a02c25d95b2"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.328.1.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.328.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb
index d59efaaaee..adeca17348 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.328.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.328;protocol=https"
-SRCREV = "4322db5906e67b57ec9c327e6afe3d98ed893df7"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
+SRCREV = "c010c19e796035e92fb3b0462cb887518a41a7c1"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.328.1.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.335.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.328.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.335.0.bb
index 76a87398c4..2a9501309c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.328.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.335.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT & BSL-1.0 "
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.328;protocol=https"
-SRCREV = "83bcbddf0813cbe5cbf1b916b612e493e2cacd70"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=main;protocol=https"
+SRCREV = "2e94023f2581aaa7f5a4d6fe0ee670d9b5e10187"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.328.1.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb
similarity index 88%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.328.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb
index a6b4b27355..b60a29b3d2 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.328.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
 
-SRC_URI = "git://github.com/zeux/volk.git;branch=vulkan-sdk-1.4.328;protocol=https"
-SRCREV = "f30088b3f4160810b53e19258dd2f7395e5f0ba3"
+SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
+SRCREV = "4f3bcee79618a9abe79f4c717c50379197c77512"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.3


