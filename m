Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB253FD8FEE
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 18:02:02 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76356.1772128913308335056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 10:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=eQXI5e4u;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202602261801505865e03c1900020710-_04nfj@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202602261801505865e03c1900020710
        for <openembedded-core@lists.openembedded.org>;
        Thu, 26 Feb 2026 19:01:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zZKtzLDWXiCxr8YT9rTPH7i7vEPLzinMn6LlG2zf0lw=;
 b=eQXI5e4uJil+n4AGG1oOpKTi7vCQZTtD4hEvP2U8izGfk83XJ5wfUebsrqe9zCYVmcm61j
 OgH3VbEQiPixGPemITbfEyMDoFrn2Ivg4VZUPPTbwx3CIV0VU5DY0KTKBDRqcvjbpl2EQQoT
 Tf3xvi8s71jFyn6ToMD6FbsdgZ4I8tFsMCKUU0uyY/GieB1aWCB+wwWTkD3OdppBH8p6loXS
 +CR2+9/Tq3WgObOYMa4gNxd2r+3F8U9aGBqbjXnemjUGj96OuM9Ibb1VKHkbk0YG63g+Azlj
 L2I8X+fK6E+BfaHwGSds3BvFFEW6MvROR5VX4Daf0CHC7B+5casFx6IA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 1/2] linux-yocto: apply cve-exclusions also to rt and tiny recipe variants
Date: Thu, 26 Feb 2026 19:01:42 +0100
Message-Id: <20260226180143.11435-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 18:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232056

From: Peter Marko <peter.marko@siemens.com>

Version is the same as base kernel, only configuration differs.
There is no reason to not apply the exclusions to all variants.

This commit is equivalent of master commit
77fb0331ecc0cb9eff6a711c2a7889f2f6bdda92

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 1 +
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 1 +
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 1 +
 4 files changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index e720629b14..5816902a7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -3,6 +3,7 @@ KBRANCH ?= "v6.12/standard/preempt-rt/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
 # Skip processing of this recipe if it is not explicitly specified as the
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index d1f7e76501..2b54315670 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -3,6 +3,7 @@ KBRANCH ?= "v6.16/standard/preempt-rt/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
 # Skip processing of this recipe if it is not explicitly specified as the
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 164557eaa0..5828ff986b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -6,6 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
 LINUX_VERSION ?= "6.12.69"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index ef904adad4..92c26d42e3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -6,6 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
 LINUX_VERSION ?= "6.16.11"

