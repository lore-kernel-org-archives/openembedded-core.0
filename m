Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1517C433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 12:07:20 +0000 (UTC)
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web12.7155.1634126839294999865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.valek@siemens.com)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 19DC7FRx001228
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Oct 2021 14:07:15 +0200
Received: from md3hr6tc.ad001.com ([139.22.46.143])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 19DC76L5002229;
	Wed, 13 Oct 2021 14:07:15 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Abdellatif.ElKhlifi@arm.com, alexandre.belloni@bootlin.com,
        Andrej Valek <andrej.valek@siemens.com>,
        Walter Schweizer <walter.schweizer@siemens.com>
Subject: [OE-core][PATCH v3 2/2] kernel-fitimage: use correct kernel image
Date: Wed, 13 Oct 2021 14:06:39 +0200
Message-Id: <20211013120639.58668-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005202256.54023-1-andrej.valek@siemens.com>
References: <20211005202256.54023-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 12:07:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156902

Even if initramfs_bundle_path was used, a wrong compression was reflected
in output its template file. Use linux.bin as universal kernel image.
The linux.bin file covers both cases.

Use linux.bin as a replacement for zImage in selftest. We know,
that zImage is a compressed one, so get the compression type.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Walter Schweizer <walter.schweizer@siemens.com>
---
 meta/classes/kernel-fitimage.bbclass     | 17 +----------------
 meta/lib/oeqa/selftest/cases/fitimage.py |  8 +++-----
 2 files changed, 4 insertions(+), 21 deletions(-)

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
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 184c8778d2..39c1cf9dd1 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -741,7 +741,6 @@ UBOOT_ARCH = "arm"
 UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
 UBOOT_EXTLINUX = "0"
 FIT_GENERATE_KEYS = "1"
-KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_HASH_ALG = "sha256"
 """
         self.write_config(config)
@@ -763,9 +762,8 @@ FIT_HASH_ALG = "sha256"
 
         kernel_load = str(get_bb_var('UBOOT_LOADADDRESS'))
         kernel_entry = str(get_bb_var('UBOOT_ENTRYPOINT'))
-        initramfs_bundle_format = str(get_bb_var('KERNEL_IMAGETYPE_REPLACEMENT'))
+        kernel_compression = str(get_bb_var('FIT_KERNEL_COMP_ALG'))
         uboot_arch = str(get_bb_var('UBOOT_ARCH'))
-        initramfs_bundle = "arch/" + uboot_arch + "/boot/" + initramfs_bundle_format + ".initramfs"
         fit_hash_alg = str(get_bb_var('FIT_HASH_ALG'))
 
         its_file = open(fitimage_its_path)
@@ -775,11 +773,11 @@ FIT_HASH_ALG = "sha256"
         exp_node_lines = [
             'kernel-1 {',
             'description = "Linux kernel";',
-            'data = /incbin/("' + initramfs_bundle + '");',
+            'data = /incbin/("linux.bin");',
             'type = "kernel";',
             'arch = "' + uboot_arch + '";',
             'os = "linux";',
-            'compression = "none";',
+            'compression = "' + kernel_compression + '";',
             'load = <' + kernel_load + '>;',
             'entry = <' + kernel_entry + '>;',
             'hash-1 {',
-- 
2.31.1


