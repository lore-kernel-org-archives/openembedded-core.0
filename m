Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926D8C5ACB3
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 05:29:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.web10.29019.1700544594979870258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 21:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=krnAkSVo;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700544595; x=1732080595;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mADXg7Hq5WT8BgAG5i2qnkw6b/nd1kDyOGdXZnCDtSY=;
  b=krnAkSVo6sqJebCzY4cCQqB7WXWD4Ks4SkliQmP28debIoIx05igb89/
   nMPJ+Aws+yHpgQuckGHw9GFQqamzWkWYPBnVtMCT4GD5CQM5mzLlR9tNm
   qwK8SjzAZdWWjm92ucQJ6Y8vRU3kVFokDR1OKKv3XeyeUDVb3VljHO/Fr
   wXJe4se1n1r/+1WY23qGJKZlFBKg7Gk/Fvpf5gekN4NS5tWANjn/XYmv9
   j1XRlT1P5vC2UuI/vHMt/PfxbR87B9a1tb78+N7zFJ9qvmlXYIoY115H9
   jC6xDrjVbAZ05H60jXJhCRJCSMBlbRWWclNUrBVZIZTYzBk+l+KgcUw3u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13314591"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="13314591"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 21:29:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="716423207"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="716423207"
Received: from anmitta2-mobl3.png.intel.com ([10.107.4.247])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 21:29:53 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vulkan: upgrade 1.3.261.1 -> 1.3.268.0
Date: Tue, 21 Nov 2023 13:29:47 +0800
Message-ID: <20231121052947.22618-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 05:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190953

* Allow glslang to find external spirv-tools to build.
* Vulkan-validation-layers has been split. So a new recipe
Vulkan-Utility-Libraries has been added and vulkan-validation-layers now
depends on it.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...lang_1.3.261.1.bb => glslang_1.3.268.0.bb} |  6 +++-
 ....3.261.1.bb => spirv-headers_1.3.268.0.bb} |  3 +-
 ..._1.3.261.1.bb => spirv-tools_1.3.268.0.bb} |  3 +-
 ...3.261.1.bb => vulkan-headers_1.3.268.0.bb} |  5 +--
 ....3.261.1.bb => vulkan-loader_1.3.268.0.bb} |  7 ++--
 ...1.3.261.1.bb => vulkan-tools_1.3.268.0.bb} |  3 +-
 .../vulkan-utility-libraries_1.3.268.0.bb     | 33 +++++++++++++++++++
 ... => vulkan-validation-layers_1.3.268.0.bb} |  9 ++---
 9 files changed, 57 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.261.1.bb => glslang_1.3.268.0.bb} (88%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.261.1.bb => spirv-headers_1.3.268.0.bb} (86%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.261.1.bb => spirv-tools_1.3.268.0.bb} (93%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.261.1.bb => vulkan-headers_1.3.268.0.bb} (89%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.261.1.bb => vulkan-loader_1.3.268.0.bb} (91%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.261.1.bb => vulkan-tools_1.3.268.0.bb} (93%)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.261.1.bb => vulkan-validation-layers_1.3.268.0.bb} (86%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 35f8a72fa41..2c59db56ac6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -837,6 +837,7 @@ RECIPE_MAINTAINER:pn-vulkan-headers = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-vulkan-loader = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-vulkan-samples = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-vulkan-tools = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-vulkan-utility-libraries = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-vulkan-validation-layers = "Vincent Davis Jr <vince@underview.tech>"
 RECIPE_MAINTAINER:pn-waffle = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.261.1.bb b/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
similarity index 88%
rename from meta/recipes-graphics/glslang/glslang_1.3.261.1.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
index e607045148c..033830ba36b 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.261.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
@@ -8,13 +8,14 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "76b52ebf77833908dc4c0dd6c70a9c357ac720bd"
+SRCREV = "36d08c0d940cf307a23928299ef52c7970d8cee6"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
+# vulkan-validation-layers, vulkan-utility-libraries.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
@@ -22,12 +23,15 @@ S = "${WORKDIR}/git"
 
 inherit cmake python3native
 
+DEPENDS = "spirv-tools"
+
 EXTRA_OECMAKE = " \
     -DCMAKE_BUILD_TYPE=Release \
     -DBUILD_SHARED_LIBS=ON \
     -DENABLE_PCH=OFF \
     -DENABLE_CTEST=OFF \
     -DBUILD_EXTERNAL=OFF \
+    -DALLOW_EXTERNAL_SPIRV_TOOLS=ON \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.268.0.bb
similarity index 86%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.268.0.bb
index 945f0879f52..7045f704736 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.268.0.bb
@@ -4,11 +4,12 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "124a9665e464ef98b8b718d572d5f329311061eb"
+SRCREV = "e867c06631767a2d96424cbec530f9ee5e78180f"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
+# vulkan-validation-layers, vulkan-utility-libraries.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.261.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.261.1.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb
index 6904288299c..1cccafdad02 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.261.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.268.0.bb
@@ -7,11 +7,12 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "e553b884c7c9febaa4e52334f683641fb5f196a0"
+SRCREV = "360d469b9eac54d6c6e20f609f9ec35e3a5380ad"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
+# vulkan-validation-layers, vulkan-utility-libraries.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb
similarity index 89%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb
index 01eb14b9fb0..a1a83317daa 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "85c2334e92e215cce34e8e0ed8b2dce4700f4a50"
+SRCREV = "7b3466a1f47a9251ac1113efbe022ff016e2f95b"
 
 S = "${WORKDIR}/git"
 
@@ -21,7 +21,8 @@ FILES:${PN} += "${datadir}/vulkan"
 RDEPENDS:${PN} += "python3-core"
 
 # These recipes need to be updated in lockstep with each other:
-# glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
+# glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools,
+# vulkan-validation-layers, vulkan-utility-libraries.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb
index 01cbeafa3ee..5a5749d40c9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https"
-SRCREV = "afdd025ead2b63b2c73d900ab128a2d3b512cdf0"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.268;protocol=https"
+SRCREV = "f4c838e2e7358fc450f8112119bbdbb5b03e03fa"
 
 S = "${WORKDIR}/git"
 
@@ -36,7 +36,8 @@ PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SU
 RRECOMMENDS:${PN} = "mesa-vulkan-drivers"
 
 # These recipes need to be updated in lockstep with each other:
-# glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
+# glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools,
+# vulkan-validation-layers, vulkan-utility-libraries.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb
index 7a7edc9ebdf..78bd9b0e045 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
-SRCREV = "a7da7027ca9fd0901639f02619c226da9c6036f1"
+SRCREV = "1532001f7edae559af1988293eec90bc5e2607d5"
 
 S = "${WORKDIR}/git"
 
@@ -31,6 +31,7 @@ PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SU
 
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
+# vulkan-validation-layers, vulkan-utility-libraries.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb
new file mode 100644
index 00000000000..fee4ba6cc9e
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Vulkan Utility Libraries"
+DESCRIPTION = "Common libraries created to share code across various \
+Vulkan repositories, solving long standing issues for Vulkan SDK \
+developers and users."
+HOMEPAGE = "https://www.khronos.org/vulkan/"
+BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Utility-Libraries"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
+
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
+SRCREV = "c9ca4ac620a238a93c65d864f2eaa33954d74509"
+
+S = "${WORKDIR}/git"
+
+REQUIRED_DISTRO_FEATURES = "vulkan"
+
+DEPENDS = "vulkan-headers"
+
+EXTRA_OECMAKE = "\
+    -DBUILD_TESTS=OFF \
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
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.261.1.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.268.0.bb
similarity index 86%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.261.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.268.0.bb
index 1e2a0acedbd..6c2715b041b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.261.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.268.0.bb
@@ -8,14 +8,14 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd3c0bc366cd9b6a906e22f0bcb5910f"
 
-SRC_URI = "git://git@github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=sdk-1.3.261;protocol=https"
-SRCREV = "628cd310bef6d54b4e6b25b5ac2ed013473409d6"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.268;protocol=https"
+SRCREV = "3c64adb4e052062fc60b6580c365429fddfbcfbf"
 
 S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-DEPENDS = "vulkan-headers vulkan-loader spirv-headers spirv-tools glslang"
+DEPENDS = "vulkan-headers vulkan-loader spirv-headers spirv-tools glslang vulkan-utility-libraries"
 
 # BUILD_TESTS            - Not required for OE builds
 # USE_ROBIN_HOOD_HASHING - Provides substantial performance improvements on all platforms.
@@ -42,7 +42,8 @@ FILES_SOLIBSDEV = ""
 
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools,
-# vulkan-validation-layers, spirv-headers, spirv-tools
+# vulkan-validation-layers, spirv-headers, spirv-tools,
+# vulkan-utility-libraries.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.42.0


