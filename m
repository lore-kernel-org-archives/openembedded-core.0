Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5802AC433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 20:23:35 +0000 (UTC)
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web10.2241.1633465413759693080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 13:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: andrej.valek@siemens.com)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 195KNTaw027657
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Oct 2021 22:23:29 +0200
Received: from md3hr6tc.ad001.com ([167.87.0.208])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 195KNLNH017347;
	Tue, 5 Oct 2021 22:23:29 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Abdellatif.ElKhlifi@arm.com, Andrej Valek <andrej.valek@siemens.com>,
        Walter Schweizer <walter.schweizer@siemens.com>
Subject: [OE-core][PATCH 2/2] kernel-fitimage: use correct kernel image
Date: Tue,  5 Oct 2021 22:22:56 +0200
Message-Id: <20211005202256.54023-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005202256.54023-1-andrej.valek@siemens.com>
References: <20211005202256.54023-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 20:23:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156659

Even if initramfs_bundle_path was used, kernel compression was not
reflected in output its image. Use linux.bin as kernel compressed output
image. File is correctly created from vmlinux which includes a right
initramfs image.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Walter Schweizer <walter.schweizer@siemens.com>
---
 meta/classes/kernel-fitimage.bbclass | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 22b77f1858..7969c89f1a 100644
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


