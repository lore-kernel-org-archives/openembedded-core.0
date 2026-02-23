Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94721EEC2A2
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:18:45 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6993.1771885120021217190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 14:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Al2BLej/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260223221836921c8d85ee000207a2-00x3xf@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260223221836921c8d85ee000207a2
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Feb 2026 23:18:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1za8Wzwy7NDsiA6hG2RGgFRvHaVRkdsu411QXPLjJiA=;
 b=Al2BLej/jWjaFvRByGbzm/Ozl57waYVMQGV/GI60CnkENZmrZt3235t5KPUhFKyzsyon21
 73gIn9EhRucWCSWTAPhATara9yM9CznsZrS1ZakaNKZJlcXkbnSbd8urVL1Lchy/rFB9Bhxz
 PnPk7Kk3r0i9cLVRSm548Z+C9qWI0H5qQbjoT+gwGPskBfxuZfntVt9oHC1ASwubHqKn5IPX
 p8yC/WBXYvuV6ezKHYpTFQ84oWL14zBzFbwiDHJZuvnxiRQ63oHPBsI4avVZ513pJfkevukK
 sEW5IHI7cW6EBHBHxcISsjrXG6h2zCol1+4rF6BpiaJ6zjWMkvoQJ0BA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] linux-yocto: apply cve-exclusions also to rt and tiny recipe variants
Date: Mon, 23 Feb 2026 23:18:30 +0100
Message-Id: <20260223221831.11844-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 22:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231713

From: Peter Marko <peter.marko@siemens.com>

Version is the same as base kernel, only configuration differs.
There is no reason to not apply the exclusions to all variants.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   | 1 +
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 66c71691be..532d337e53 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -3,6 +3,7 @@ KBRANCH ?= "v6.18/standard/preempt-rt/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
 # Skip processing of this recipe if it is not explicitly specified as the
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 2fbd5a91f9..db6daabad5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -6,6 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
 LINUX_VERSION ?= "6.18.8"

