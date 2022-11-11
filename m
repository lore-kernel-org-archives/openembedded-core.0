Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA413C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 21:47:26 +0000 (UTC)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
 by mx.groups.io with SMTP id smtpd.web12.2401.1668203240766161293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 13:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=P2Lq34i1;
 spf=pass (domain: amazon.com, ip: 207.171.184.29, mailfrom: prvs=3074a5097=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1668203241; x=1699739241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K2z1TGDfOuptQbU+NLUabjRhc2rHsGw3H94PuTXA/rk=;
  b=P2Lq34i1Et9wJQ/3txhEApO4h+y3XR8AfoJ3o6so9Fe76nGbXwcDz8vf
   3+Do6fnG/ZkU7genk0kzker9t0U5Czv7tiJoaRNAeBiWXhY2WRaKowLje
   moKdeeMy9AF+6Kldgd1YWpNcB2PpfmvrsGo9z1NXy1GpW5883lCYdqIJk
   4=;
X-IronPort-AV: E=Sophos;i="5.96,157,1665446400"; 
   d="scan'208";a="279274695"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-iad-1a-m6i4x-366646a6.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 21:47:19 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1a-m6i4x-366646a6.us-east-1.amazon.com (Postfix) with ESMTPS id 3F70FA282B;
	Fri, 11 Nov 2022 21:47:17 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Fri, 11 Nov 2022 21:47:17 +0000
Received: from dev-dsk-jorcrous-2c-c78924fd.us-west-2.amazon.com
 (10.43.161.14) by EX19D047UWB002.ant.amazon.com (10.13.138.34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1118.20; Fri, 11 Nov 2022 21:47:17 +0000
From: Jordan Crouse <jorcrous@amazon.com>
To: <openembedded-core@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>,
	Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v2 3/3] vulkan-validation: Add the official Vulkan validation layers
Date: Fri, 11 Nov 2022 21:47:14 +0000
Message-ID: <20221111214714.9939-4-jorcrous@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221111214714.9939-1-jorcrous@amazon.com>
References: <20221111214714.9939-1-jorcrous@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.161.14]
X-ClientProxiedBy: EX13D15UWB001.ant.amazon.com (10.43.161.254) To
 EX19D047UWB002.ant.amazon.com (10.13.138.34)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 21:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173144

Add a recipe to build the Khronos official Vulkan validation layers that can
assist developers in verifying that their applications correctly use the
Vulkan APIs.

USE_ROBIN_HOOD_HASHING=OFF disables a third party dependency on [1] which
is a performant reimplementation of std::unordered_map and
std::unordered_set that gives better performance when using validation for
extremely heavy workloads on a desktop. There isn't much benefit to
enabling it on most embedded systems so force it off for now but no bias
against making it optional if robin-hood-hashing is made available in the
metadata.

[1] https://github.com/martinus/robin-hood-hashing

Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
---

Changes in v2:
- Put DEPENDS all on one line
- Remove unused OEMAKE flags
- Force /usr/lib/*.so into ${PN} and remove INSANE_SKIP

 meta/conf/distro/include/maintainers.inc      |  1 +
 .../vulkan/vulkan-validation_1.3.231.1.bb     | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5b7ce77c3c..8f319c63a7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -810,6 +810,7 @@ RECIPE_MAINTAINER:pn-vulkan-headers = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-vulkan-loader = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-vulkan-samples = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-vulkan-tools = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-vulkan-validation = "Jordan Crouse <jorcrous@amazon.com>"
 RECIPE_MAINTAINER:pn-waffle = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-watchdog-config = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb b/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb
new file mode 100644
index 0000000000..37becb1d16
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Vulkan Validation layers"
+DESCRIPTION = "Khronos official Vulkan validation layers to assist developers \
+in verifying that their applications correctly use the Vulkan API"
+HOMEPAGE = "https://www.khronos.org/vulkan/"
+BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-ValidationLayers"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8df9e8826734226d08cb412babfa599c"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=sdk-1.3.231;protocol=https"
+
+SRCREV="f489610de566df6a5c20de1a3e54776e0ad852e1"
+
+S = "${WORKDIR}/git"
+
+REQUIRED_DISTRO_FEATURES = "vulkan"
+
+inherit cmake features_check pkgconfig
+
+DEPENDS += "vulkan-headers spirv-headers spirv-tools vulkan-loader glslang"
+
+EXTRA_OECMAKE = "\
+                 -DBUILD_TESTS=OFF \
+                 -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
+                 -DVULKAN_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
+                 -DGLSLANG_INSTALL_DIR=${STAGING_DATADIR} \
+                 -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
+                 -DUSE_ROBIN_HOOD_HASHING=OFF \
+                 "
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
+
+PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
+PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
+
+FILES:${PN} = "${libdir}/*.so ${datadir}/vulkan"
+FILES:${PN}-dev = ""
+
+UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.37.1


