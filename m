Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32117C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:13:17 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=MOepCCXe;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983996; x=1675519996;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=AMWkw9wGqpKXzOUjN1aO/QAmYnV3dpzjgC7WwSCudOE=;
  b=MOepCCXeh+5JCDsH5X9Yq9s1IvKSyCoVBjrbdB648J72RCMPHcD+Vrq8
   TIIV6ukcMHS361E5o560iW5gRoOvxwT+7QITTw6V/EjAUh/8uDT5NJjND
   K0zo322FNEvcHvvz7pt2pcKJw2hoc//hGhJTLufKxxx7M6nj/FShfGcZk
   2kj/xcxmBARB15chYCH/Xqo5h18Ylv5fGf2iOzKKTc9VGwFUprHVAL5ZB
   xNh0ZxZJ3+sy3zQtG89PmDdwBAZvE/NhXR25sRDJ4sILZRzSJPpYB/51P
   GdqJYDdGlyMMGf5J01ctT1UjAfHTq/kDU0hkHnl7UpWdQH8uEProMEBh7
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321664"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321664"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750119"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:14 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 16/17] core-image-sato-sdk: allocate more memory
 when in qemu
Date: Fri,  4 Feb 2022 22:12:42 +0800
Message-Id: 
 <593a10c37f7928ce4714dd16bd26dc0cb56446e9.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:13:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161363

From: Ross Burton <ross@burtonini.com>

Compiling code is memory-intensive, especially kernel modules like the
SystemTap probes, so give the VM 768MB of RAM.  Using 1GB appears to
cause PCI error, interestingly.

Hopefully this solves the intermittent failures caused by OOMs during
the SystemTap test.

[ YOCTO #14673 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50ff1f018a670c963e1979dee76ebd696153b4c1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-sato/images/core-image-sato-sdk.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index b52de0def0..afab473b52 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -10,3 +10,6 @@ IMAGE_FEATURES += "dev-pkgs tools-sdk \
 
 IMAGE_INSTALL += "kernel-devsrc"
 
+# Compiling stuff, specifically SystemTap probes, can require lots of memory
+# See https://bugzilla.yoctoproject.org/show_bug.cgi?id=14673
+QB_MEM = "-m 768"
-- 
2.34.1


