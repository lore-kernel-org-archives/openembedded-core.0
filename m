Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B11C43219
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 20:42:50 +0000 (UTC)
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by mx.groups.io with SMTP id smtpd.web11.1064.1668112966624664330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 12:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=OHd+HB1a;
 spf=pass (domain: amazon.com, ip: 52.95.49.90, mailfrom: prvs=3066031d8=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1668112967; x=1699648967;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9wHPgAZE+Qbl4g5FsMh41nwaVVzDLoOgJ/miFqV8wZ0=;
  b=OHd+HB1aZ3e66YiEoMWax0xD3OWiFsgCGn5jSy6urhtDyCXDDahVsQlq
   P8RnPs/oRYQwGLTLyNriUy//6yDq04itYhPSeOIJkpoXNPlHzQqTcNr4F
   nE6Nw8TG4p71qawYOo/sSrs9C/5kjss7wAZZf7HzP0eGCIf6oD5nhK1jV
   4=;
X-IronPort-AV: E=Sophos;i="5.96,154,1665446400"; 
   d="scan'208";a="265520869"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-m6i4x-617e30c2.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 20:42:45 +0000
Received: from EX13MTAUWB002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1a-m6i4x-617e30c2.us-east-1.amazon.com (Postfix) with ESMTPS id 0F9F161EF6
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 20:42:44 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX13MTAUWB002.ant.amazon.com (10.43.161.202) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Thu, 10 Nov 2022 20:42:35 +0000
Received: from dev-dsk-jorcrous-2c-c78924fd.us-west-2.amazon.com
 (10.43.160.223) by EX19D047UWB002.ant.amazon.com (10.13.138.34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20; Thu, 10 Nov 2022
 20:42:35 +0000
From: Jordan Crouse <jorcrous@amazon.com>
To: <openembedded-core@lists.openembedded.org>
CC: Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH 0/3] Add vulkan validation and improvements for headless devices
Date: Thu, 10 Nov 2022 20:42:29 +0000
Message-ID: <20221110204232.12768-1-jorcrous@amazon.com>
X-Mailer: git-send-email 2.37.1
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173106

This small patchset has a few small fixes and a new recipe for the official
Vulkan validation layers from Khronos.

The first patch addresses a bug in the exported cmake packages from
spriv-tools to make sure that the library path is correctly set.  The
second patch enables vulkan-loader for "headless" devices that don't have
either X11 nor Wayland.  The third patch adds the vulkan-validation for the
same version level as the Vulkan headers and other packages.

Jordan Crouse (3):
  spirv-tools: Correctly set the prefix in exported cmake packages
  vulkan-loader: Allow headless targets to build the loader
  vulkan-validation: Add the official Vulkan validation layers

 .../spir/spirv-tools_1.3.231.1.bb             |  7 ++-
 .../vulkan/vulkan-loader_1.3.231.1.bb         |  2 -
 .../vulkan/vulkan-validation_1.3.231.1.bb     | 46 +++++++++++++++++++
 3 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb

-- 
2.37.1


