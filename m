Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126ADC61CE7
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 07:57:34 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.44070.1748851049099604008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 00:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=tphhEN+4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20250602075727dbd1321cfe36ece330-slqssf@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250602075727dbd1321cfe36ece330
        for <openembedded-core@lists.openembedded.org>;
        Mon, 02 Jun 2025 09:57:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wnypcO3iXUgNAB4z0FwOjJB5Kuq/bwCfyl5AwCRtNgE=;
 b=tphhEN+4kf8YdVk0ByDvGLxWE5uXtM7ELppHTFIBLEBFio/vrik/EzTSTBJlr0vP2vNfe4
 dcpsW8yZ54kq5A4JELjfgzl2zlP2bhKiRJKhzVRC0Iqz7KAQqkVueMIRKsdE9SzlHQq5IStN
 fcMmNz82dJhYf0uPvSs7h10PtfYMhGCH88MNZohyBQ1ObZr4lS7MK3mkzAzjda+r7qdEno8J
 2HJNeuu1rUIN6eiGD5YU+v4rsApaWqcz4QAHyNKb4SN7B4l5bkoDjS5vstIF6vX3BW3q2VQv
 rroTZUs9rG3YkkePNgmiixpr14PYLMA2gR0xY5Yhm6kWEZMlCF0PRbsg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v6 10/21] kernel-uboot.bbclass: deploy the vmlinux kernel binary
Date: Mon,  2 Jun 2025 09:56:20 +0200
Message-ID: <20250602075714.32122-11-adrian.freihofer@siemens.com>
In-Reply-To: <20250602075714.32122-1-adrian.freihofer@siemens.com>
References: <20250602075714.32122-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 07:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217701

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Extend the kernel-uboot.bbclass to build and deploy the kernel binary
intended for inclusion in a FIT image.
Note that the kernel used in a FIT image is a stripped (and optionally
compressed) vmlinux ELF binary - not a self-extracting format like
zImage, which is already available in the deploy directory if needed
separately.

The kernel.bbclass inherits all classes listed in the KERNEL_CLASSES
variable. By default, KERNEL_CLASSES is defined as:
  KERNEL_CLASSES ?= " kernel-uimage "
Since kernel-uimage.bbclass inherits from kernel-uboot.bbclass, the
creation and deployment of the kernel binary for inclusion in a FIT
image happens automatically by default.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-uboot.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
index d2a63524ece..e26ba6f0aa9 100644
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ b/meta/classes-recipe/kernel-uboot.bbclass
@@ -56,4 +56,13 @@ uboot_prep_kimage() {
 	fi
 
 	printf "$linux_comp" > "$output_dir/linux_comp"
-}
\ No newline at end of file
+}
+
+kernel_do_deploy:append() {
+	# Provide the kernel artifacts to post processing recipes e.g. for creating a FIT image
+	uboot_prep_kimage "$deployDir"
+	# For x86 a setup.bin needs to be include"d in a fitImage as well
+	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
+		install -D "${B}/${KERNEL_OUTPUT_DIR}/setup.bin" "$deployDir/"
+	fi
+}
-- 
2.49.0


