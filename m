Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65FEC4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 21:47:26 +0000 (UTC)
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by mx.groups.io with SMTP id smtpd.web10.2502.1668203238997480204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 13:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=JGJfMko7;
 spf=pass (domain: amazon.com, ip: 52.95.49.90, mailfrom: prvs=3074a5097=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1668203239; x=1699739239;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MY3mRBg1qBFaTOGqMe4nkAqp/QcZfwS3LU8y2hDMIWk=;
  b=JGJfMko7aMLI1FuBstn6sxcVzCya+hr2BfEKLG1m7D7kfcmAq2HoY4O+
   f5IBS0kkdtwWDRoPlwc9m8lQIqMGxif5XPWXscqbfY5FRwneatZyz2i8k
   2TIk1bfIaL98AnCN1ehWd3o556vfsPkTO+NuB4dmN3I2V0M1iT0D6ANlo
   w=;
X-IronPort-AV: E=Sophos;i="5.96,157,1665446400"; 
   d="scan'208";a="265896098"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-0aba4706.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 21:47:18 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1e-m6i4x-0aba4706.us-east-1.amazon.com (Postfix) with ESMTPS id 7CCE6A1032;
	Fri, 11 Nov 2022 21:47:17 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Fri, 11 Nov 2022 21:47:16 +0000
Received: from dev-dsk-jorcrous-2c-c78924fd.us-west-2.amazon.com
 (10.43.161.14) by EX19D047UWB002.ant.amazon.com (10.13.138.34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1118.20; Fri, 11 Nov 2022 21:47:16 +0000
From: Jordan Crouse <jorcrous@amazon.com>
To: <openembedded-core@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>,
	Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v2 0/3] Add vulkan validation and improvements for headless devices
Date: Fri, 11 Nov 2022 21:47:11 +0000
Message-ID: <20221111214714.9939-1-jorcrous@amazon.com>
X-Mailer: git-send-email 2.37.1
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173141

This small patchset has a few small fixes and a new recipe for the official
Vulkan validation layers from Khronos.

The first patch addresses a bug in the exported cmake packages from
spriv-tools to make sure that the library path is correctly set.  The
second patch enables vulkan-loader for "headless" devices that don't have
either X11 nor Wayland.  The third patch adds the vulkan-validation for the
same version level as the Vulkan headers and other packages.

Changes in v2:
- Don't change PR per Khem Raj
- Put DEPENDS all on one line
- Remove unused OEMAKE flags
- Force /usr/lib/*.so into ${PN} and remove INSANE_SKIP

Jordan Crouse (3):
  spirv-tools: Correctly set the prefix in exported cmake packages
  vulkan-loader: Allow headless targets to build the loader
  vulkan-validation: Add the official Vulkan validation layers

 meta/conf/distro/include/maintainers.inc      |  1 +
 .../spir/spirv-tools_1.3.231.1.bb             |  5 ++-
 .../vulkan/vulkan-loader_1.3.231.1.bb         |  2 -
 .../vulkan/vulkan-validation_1.3.231.1.bb     | 39 +++++++++++++++++++
 4 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb

-- 
2.37.1


