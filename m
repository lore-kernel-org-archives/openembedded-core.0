Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C408DC43219
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 21:47:26 +0000 (UTC)
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by mx.groups.io with SMTP id smtpd.web08.2428.1668203239759762870
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 13:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=udsoO9LM;
 spf=pass (domain: amazon.com, ip: 72.21.196.25, mailfrom: prvs=3074a5097=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1668203241; x=1699739241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vms2mdfbFk4Paooq5DMbVFmtXRb/sG9QmDil8fL5Bxo=;
  b=udsoO9LM5zs2kmV8HbBXAUl2GTYywoQKWqZlMe6f2sHgXgtso9WmqiG9
   5GsK8DLwqGa7pqnMwtAshiM43D32jiZiKkkHQkoWSwpOYRy2A7YQPT3C5
   jRjOelMSoJOoYwH8E+yB8b5udIZNRDxfUCItp1fppk+ZHQOdHPkihwdzP
   U=;
X-IronPort-AV: E=Sophos;i="5.96,157,1665446400"; 
   d="scan'208";a="262273602"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-3554bfcf.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 21:47:19 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1e-m6i4x-3554bfcf.us-east-1.amazon.com (Postfix) with ESMTPS id 06D848587F;
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
Subject: [PATCH v2 2/3] vulkan-loader: Allow headless targets to build the loader
Date: Fri, 11 Nov 2022 21:47:13 +0000
Message-ID: <20221111214714.9939-3-jorcrous@amazon.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173143

vulkan-loader can build and work on headless targets without display
engines so there isn't any need for the ANY_OF_DISTRO_FEATURES restriction.

Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
---

(no changes since v1)

 meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb
index 59c52c1db7..7aab7446f6 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb
@@ -17,7 +17,6 @@ S = "${WORKDIR}/git"
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
 inherit cmake features_check pkgconfig
-ANY_OF_DISTRO_FEATURES = "x11 wayland"
 
 DEPENDS += "vulkan-headers"
 
@@ -29,7 +28,6 @@ EXTRA_OECMAKE = "\
                  -DVulkanRegistry_DIR=${RECIPE_SYSROOT}/${datadir} \
                  "
 
-# must choose x11 or wayland or both
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 
 PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
-- 
2.37.1


