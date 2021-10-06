Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C502DC433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 07:01:07 +0000 (UTC)
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
 by mx.groups.io with SMTP id smtpd.web11.8505.1633503666524560972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 00:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: siemens.com, ip: 194.138.37.39, mailfrom: andrej.valek@siemens.com)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 196713ft016959
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Oct 2021 09:01:03 +0200
Received: from md3hr6tc.ad001.com ([167.87.0.208])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 19670krB014510;
	Wed, 6 Oct 2021 09:01:03 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Abdellatif.ElKhlifi@arm.com, Andrej Valek <andrej.valek@siemens.com>,
        Walter Schweizer <walter.schweizer@siemens.com>
Subject: [OE-core][PATCH v2 2/2] kernel-fitimage: use correct kernel image
Date: Wed,  6 Oct 2021 09:00:31 +0200
Message-Id: <20211006070031.156404-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005202256.54023-1-andrej.valek@siemens.com>
References: <20211005202256.54023-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 07:01:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156674

Even if initramfs_bundle_path was used, a wrong compression was reflected
in output its template file. Use linux.bin as universal kernel image.
The linux.bin file covers both cases.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Walter Schweizer <walter.schweizer@siemens.com>
---
 meta/classes/kernel-fitimage.bbclass | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 886ed13029..8718ce7e16 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -495,22 +495,7 @@ fitimage_assemble() {
 	fitimage_emit_section_maint $1 imagestart
 
 	uboot_prep_kimage
-
-	if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
-		initramfs_bundle_path="arch/"${UBOOT_ARCH}"/boot/"${KERNEL_IMAGETYPE_REPLACEMENT}".initramfs"
-		if [ -e "$initramfs_bundle_path" ]; then
-
-			#
-			# Include the kernel/rootfs bundle.
-			#
-
-			fitimage_emit_section_kernel $1 $kernelcount "$initramfs_bundle_path" "$linux_comp"
-		else
-			bbwarn "$initramfs_bundle_pat not found."
-		fi
-	else
-		fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
-	fi
+	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
 
 	#
 	# Step 2: Prepare a DTB image section
-- 
2.31.1


