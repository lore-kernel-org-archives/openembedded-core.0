Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C13C5479B
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 21:40:45 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.87965.1747172435946683602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 14:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=J9AvaE2l;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20250513214033437fbce2954e4b8601-zo_ozn@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250513214033437fbce2954e4b8601
        for <openembedded-core@lists.openembedded.org>;
        Tue, 13 May 2025 23:40:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cgMGKgObSCfEiQCtJ1hVP9kpoYsOioXU3jStOhAHJLQ=;
 b=J9AvaE2lSv3mzy8l9DE9IaYD56IbM5FiNgWNeEc95vaHHlCl3jVZt7PD8cKhXhwOX/GK5N
 rgeO8lia7JMKYSekhv8RFe2yxRhC+Sn4AOHxwu5OUG2I1W+iBORnEJPsiDC8tCI/HXVeU49l
 W82jFOU7HPA5T6LhTHxggNyek/B6gHuqjPRy7eVH+T9F+9t/4bBfobaZsMyAPqiCJBBIKLRO
 TCiPFRzqRNOjO27Uou1J+fe6BkaVvWYqspP/0XigzLBYdctBmrDqyc8I1OVpZ7iXwsmsUYdh
 kbDIak6yfIEzuQ9Rw40qioUlO171nBkXeFgZFWGFJfw8LJ5/JTv8/TWA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 07/22] kernel.bbclass: stage the sysroot-only folder
Date: Tue, 13 May 2025 23:36:49 +0200
Message-ID: <20250513213834.87830-8-adrian.freihofer@siemens.com>
In-Reply-To: <20250513213834.87830-1-adrian.freihofer@siemens.com>
References: <20250513213834.87830-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 21:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216459

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


