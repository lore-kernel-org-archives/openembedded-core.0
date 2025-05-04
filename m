Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EB7C3ABB6
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:06:58 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.28203.1746364017576302694
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 06:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=eNeM59HN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20250504130655e2e9b8a1b743f5b1b2-6sozoe@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250504130655e2e9b8a1b743f5b1b2
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 May 2025 15:06:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=82ZqDkF8zgUzb+Zm9l4gxYoBf1cmRL6c6leSdYlcTfU=;
 b=eNeM59HNqDoOSMj7BJJ2m7cbKaG31v3mpNYNZ1RIvptkC0S4ztRa0bl4qQdx4w2U31XeV5
 bkKHI4TDaQZDGhnwZCj0FEfyD2kjBckRsJxnrh1pfhIUH2nFpU2/uUQRRJ08M4esSFqgItlj
 HYg4aMqGQ7oDwzvdMJDla4LREj9PXoPryYlvFUOGanyiHktHOa3jE8lRU/W4pkBBRN4nZsfH
 K4B1+pzGZw3/1tzmw/KO28jcr3WsSibenLBTsPnTUJbAl150d7yBqAQpfqtRhfLS+u4gNFsa
 RdfNisu9TZd4JdHbegVzkp8lmLxIC8IOdD46GnrVpEBA4PP0szGcgBoQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	l.anderweit@phytec.de,
	richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	bruce.ashfield@gmail.com,
	rogerio.borin@toradex.com,
	sean.anderson@seco.com,
	m.felsch@pengutronix.de,
	ejo@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 05/20] kernel.bbclass: stage the sysroot-only folder
Date: Sun,  4 May 2025 15:04:52 +0200
Message-ID: <20250504130507.717954-5-adrian.freihofer@siemens.com>
In-Reply-To: <20250504130507.717954-1-adrian.freihofer@siemens.com>
References: <20250504130507.717954-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 13:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215945

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
index 07786647e19..765776a562b 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -731,7 +731,6 @@ do_assemble_fitimage() {
 
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


