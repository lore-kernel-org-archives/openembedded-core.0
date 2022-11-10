Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A97C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 20:42:50 +0000 (UTC)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
 by mx.groups.io with SMTP id smtpd.web10.1049.1668112961459080739
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 12:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=B1H1HySw;
 spf=pass (domain: amazon.com, ip: 207.171.184.29, mailfrom: prvs=3066031d8=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1668112961; x=1699648961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ERxPtqVkySb6SvATMq/2tmHyyMid3Nt99xS1Fd68Ugg=;
  b=B1H1HySwlPC0FjSDfaXb62ugKLf63bJG0fca0l3U2qEIWW86SE94cQQr
   jMzZKS7l6ZprXnMj1hCFn3E3gtmQxrAM6UcuvYuDSiWI6xcnziBNt5ENF
   o6n0D0GtqptEhgrF31PY3X3/mdxLg34gfVedpZTEzeFQ7qkr/qOBwlw51
   o=;
X-IronPort-AV: E=Sophos;i="5.96,154,1665446400"; 
   d="scan'208";a="278922612"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-21d8d9f4.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 20:42:40 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-pdx-2a-m6i4x-21d8d9f4.us-west-2.amazon.com (Postfix) with ESMTPS id 88E8481B9F
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 20:42:40 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Thu, 10 Nov 2022 20:42:36 +0000
Received: from dev-dsk-jorcrous-2c-c78924fd.us-west-2.amazon.com
 (10.43.160.223) by EX19D047UWB002.ant.amazon.com (10.13.138.34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20; Thu, 10 Nov 2022
 20:42:36 +0000
From: Jordan Crouse <jorcrous@amazon.com>
To: <openembedded-core@lists.openembedded.org>
CC: Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH 3/3] vulkan-validation: Add the official Vulkan validation layers
Date: Thu, 10 Nov 2022 20:42:32 +0000
Message-ID: <20221110204232.12768-4-jorcrous@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221110204232.12768-1-jorcrous@amazon.com>
References: <20221110204232.12768-1-jorcrous@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.160.223]
X-ClientProxiedBy: EX13D22UWC003.ant.amazon.com (10.43.162.250) To
 EX19D047UWB002.ant.amazon.com (10.13.138.34)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 20:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173105

Add a recipe to build the Khronos official Vulkan validation layers that can
assist developers in verifying that their applications correctly use the
Vulkan APIs.

Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
---

 .../vulkan/vulkan-validation_1.3.231.1.bb     | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb b/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb
new file mode 100644
index 0000000000..3d592fe24a
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb
@@ -0,0 +1,46 @@
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
+DEPENDS += "vulkan-headers"
+DEPENDS += "spirv-headers spirv-tools"
+DEPENDS += "vulkan-loader"
+DEPENDS += "glslang"
+
+EXTRA_OECMAKE = "\
+                 -DBUILD_TESTS=OFF \
+                 -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
+                 -DASSEMBLER_WORKS=FALSE \
+                 -DVULKAN_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
+                 -DGLSLANG_INSTALL_DIR=${STAGING_DATADIR} \
+                 -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
+                 -DUSE_ROBIN_HOOD_HASHING=OFF \
+                 "
+
+PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
+PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
+
+FILES:${PN} += "/usr/share/vulkan/ /usr/lib/"
+
+INSANE_SKIP:${PN} += " ldflags"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+
+UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.37.1


