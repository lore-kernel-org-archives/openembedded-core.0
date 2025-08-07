Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC81C87FD3
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 01:18:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.40506.1754529482501949076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 18:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CjfbJejk;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754529482; x=1786065482;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8BajoPql+a4PvDaL8LUuaiurpMqeCoNrHfKPu2Lmtko=;
  b=CjfbJejk0KN9bjY/BV1hKkvqHLzwVNR1msh5XHi5BFHgn8p8pVU6NtFU
   rYSMIWdrWEcOqJhw8aaRf+UmZ6BRYYrEgEnQWb+UxgtaGT9ydCb1oAVmc
   3EH7KOKCNaTLq/mQom8NIdZSo1fpTEO7w1YhlqoJElq+KIgK8ATGrV2vv
   ZWIM6sISaGq4jygwcGeIvRdNJHNBVdZ9lAfGUTA6cKc0kqn4RFgcqvrAu
   16JhQ5NDM9tC2wxYU+cjatzwX/+2uO6aaEHR4DM0N+TipL1jqhjE+en4D
   sjgwSEtO1rrIg6CUOpFRhBB6PUopfIbu9oJ7rvj/tiDY4gJkJh03n8CiZ
   g==;
X-CSE-ConnectionGUID: aYPjlAH4Re+vT0fba+F6Sw==
X-CSE-MsgGUID: A4+aZIO9QtWWcMSwKpP6hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="211985308"
X-IronPort-AV: E=Sophos;i="6.17,271,1747666800"; 
   d="scan'208";a="211985308"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 10:18:00 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id A8CF942A302
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Aug 2025 01:18:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 63BF4C0056B
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Aug 2025 01:18:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id F300C10005BD;
	Thu,  7 Aug 2025 01:17:57 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F29C91A007E;
	Thu,  7 Aug 2025 09:17:54 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH v3] vulkan: upgrade 1.4.313 -> 1.4.321
Date: Thu,  7 Aug 2025 09:17:47 +0800
Message-ID: <20250807011747.817-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 01:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221554

vulkan-headers Changelog:
https://github.com/KhronosGroup/Vulkan-Headers/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

vulkan-loader Changelog:
https://github.com/KhronosGroup/Vulkan-Loader/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

vulkan-tools Changelog:
https://github.com/KhronosGroup/Vulkan-Tools/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

vulkan-utility-libraries Changelog:
https://github.com/KhronosGroup/Vulkan-Utility-Libraries/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

vulkan-validation-layers Changelog:
https://github.com/KhronosGroup/Vulkan-ValidationLayers/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

vulkan-volk Changelog:
https://github.com/zeux/volk/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

spirv-tools Changelog:
https://github.com/KhronosGroup/SPIRV-Tools/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

spirv-headers:
License-Update: add CC-BY-4.0
Changelog:
https://github.com/KhronosGroup/SPIRV-Headers/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

glslang Changelog:
https://github.com/KhronosGroup/Glslang/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../glslang/{glslang_1.4.313.0.bb => glslang_1.4.321.0.bb}  | 4 ++--
 ...pirv-headers_1.4.313.0.bb => spirv-headers_1.4.321.0.bb} | 6 +++---
 .../{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb}  | 2 +-
 ...kan-headers_1.4.313.0.bb => vulkan-headers_1.4.321.0.bb} | 2 +-
 ...ulkan-loader_1.4.313.0.bb => vulkan-loader_1.4.321.0.bb} | 4 ++--
 ...{vulkan-tools_1.4.313.0.bb => vulkan-tools_1.4.321.0.bb} | 4 ++--
 ...s_1.4.313.0.bb => vulkan-utility-libraries_1.4.321.0.bb} | 4 ++--
 ...s_1.4.313.0.bb => vulkan-validation-layers_1.4.321.0.bb} | 4 ++--
 .../{vulkan-volk_1.4.313.0.bb => vulkan-volk_1.4.321.0.bb}  | 2 +-
 9 files changed, 16 insertions(+), 16 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.313.0.bb => glslang_1.4.321.0.bb} (93%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.313.0.bb => spirv-headers_1.4.321.0.bb} (80%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb} (97%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.313.0.bb => vulkan-headers_1.4.321.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.313.0.bb => vulkan-loader_1.4.321.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.313.0.bb => vulkan-tools_1.4.321.0.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.313.0.bb => vulkan-utility-libraries_1.4.321.0.bb} (91%)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.313.0.bb => vulkan-validation-layers_1.4.321.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.313.0.bb => vulkan-volk_1.4.321.0.bb} (95%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
similarity index 93%
rename from meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
index cb754c6ac8..2d6f098ad9 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "fc9889c889561c5882e83819dcaffef5ed45529b"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.313;tag=vulkan-sdk-${PV} \
+SRCREV = "8a85691a0740d390761a1008b4696f57facd02c4"
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.321;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "
 PE = "1"
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
similarity index 80%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
index a551814689..5365d64a99 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Machine-readable files for the SPIR-V Registry"
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/registry/spir-v"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
+LICENSE = "MIT & CC-BY-4.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "aa6cef192b8e693916eb713e7a9ccadf06062ceb"
+SRCREV = "2a611a970fdbc41ac2e3e328802aed9985352dca"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
similarity index 97%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
index 4594a1a942..319b25b7f4 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "a62abcb402009b9ca5975e6167c09f237f630e0e"
+SRCREV = "33e02568181e3312f49a3cf33df470bf96ef293a"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
            "
 PE = "1"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
index 1136e4795a..b3413b0e6b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "409c16be502e39fe70dd6fe2d9ad4842ef2c9a53"
+SRCREV = "2cd90f9d20df57eac214c148f3aed885372ddcfe"
 
 inherit cmake
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
index c739ba15dc..772705dff7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.313;protocol=https"
-SRCREV = "fb78607414e154c7a5c01b23177ba719c8a44909"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.321;protocol=https"
+SRCREV = "da8d2caad9341ca8c5a7c3deba217d7da50a7c24"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
index c73e5caa13..26c196336e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.313;protocol=https"
-SRCREV = "ad2f0170f9466fadd96e3fdd65fad02cd3a3739b"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.321;protocol=https"
+SRCREV = "06ae73a3dc3a03466817d8370355203dac7b79b1"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
index 1b38b6ec3a..54e8af6dcf 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.313;protocol=https"
-SRCREV = "4e246c56ec5afb5ad66b9b04374d39ac04675c8e"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.321;protocol=https"
+SRCREV = "ec329e2721921f79743b90307ee047d08e057788"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
index 63a3aa4ae6..fa7873b62d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT & BSL-1.0 "
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.313;protocol=https"
-SRCREV = "50b87dd4be883b63c10e3c4f7b9c5aac0c82efd3"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.321;protocol=https"
+SRCREV = "fee7b2b4a926355e48668e29570be129eb82cb36"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
index cde1be1671..17a290ed1d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "43c29e655cb8117fd9cfb65ad9cefe2d40965102"
+SRCREV = "a8da8ef3368482b0ee9b0ec0c6079a16a89c6924"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.43.0


