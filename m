Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E496C5475C
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 18:53:43 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.109902.1747248814347842213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 11:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=U2tFQGHK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-202505141853321db8402a61f8a15324-xgglvu@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202505141853321db8402a61f8a15324
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 20:53:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cgMGKgObSCfEiQCtJ1hVP9kpoYsOioXU3jStOhAHJLQ=;
 b=U2tFQGHK3fHUNPO4MYf7DuDhONxtlkPs5Skwn2mvwahreT2hOi57oPjWCiohW4osNbuthP
 m7ZmSqMjQ67JZm8r12q4Pw5AkcY+ZdPkWfIYHM5QLI5jNIdekx41WCRGxmbow0YCtXTcq3pW
 ihHChIJhgUp0fVb8HBPoxw6S69mxQLmJaWFQa80yLBLufovISu7I87WkDoJUs0OLPF1VZF2G
 DzD0kYoKRupu9PcZVEQkjLhCxyQus/jdwvegIbH5txs417SUuTOfrJky5O/lOSHmv76mOa2W
 KQDIuz1C8CidmfSXJAv3fsJAfkbTbAM8QCd10O414LcyWaRejnvl3D3A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 05/22] kernel.bbclass: stage the sysroot-only folder
Date: Wed, 14 May 2025 20:50:49 +0200
Message-ID: <20250514185225.162998-6-adrian.freihofer@siemens.com>
In-Reply-To: <20250514185225.162998-1-adrian.freihofer@siemens.com>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 18:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216533

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Move the configuration for staging the sysroot-only directory from the
kernel-fitimage.bbclass to the kernel.bbclass. This is a preparation for
using the FIT image related artifacts also from an independent recipe
which creates the FIT image from artifacts going via sstate-cache.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 1 -
 meta/classes-recipe/kernel.bbclass          | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index f5f02f30f0a..3975e657003 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -734,7 +734,6 @@ do_assemble_fitimage() {
 
 addtask assemble_fitimage before do_install after do_compile
 
-SYSROOT_DIRS:append = " /sysroot-only"
 do_install:append() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
 		[ "${UBOOT_SIGN_ENABLE}" = "1" ]; then
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 36ce659762e..1a7a60eadfc 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -631,8 +631,8 @@ do_shared_workdir () {
 
 }
 
-# We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-SYSROOT_DIRS = ""
+# Stage the sysroot-only folder e.g. for FIT image related artifacts
+SYSROOT_DIRS = "/sysroot-only"
 
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
 
-- 
2.49.0


