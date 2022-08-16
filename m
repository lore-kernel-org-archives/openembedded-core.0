Return-Path: <Awais_Belal@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECA2C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 13:59:28 +0000 (UTC)
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web09.16142.1660658360475132596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 06:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: awais_belal@mentor.com)
X-IronPort-AV: E=Sophos;i="5.93,241,1654588800";
   d="scan'208";a="81388106"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2022 05:59:18 -0800
IronPort-SDR: 
 CKY1hYxVJWG6WTuL3QdppPhzoKsoTrk4FmmgEZJIXmmUQcq9VnZs7cx9mwsY57cOZysoIcEpmU
 vFUNGOpQVfHWWG3ue7LKdFCmaXnxBUC3NaaB74Et/UEABa/KiYjnRLyuqcfQB7nVRemQZeVzoB
 fbypoFIN7Sx8PudtDD6HlW7gX9vFBby1WBQ4hOhphPG7XXZDBebaWFrdIuFxflRRI3TEa4SY6W
 iwbNlGXEuAOxkeBgm/cWZnSM1HB/jnpf0lf0F810yxxc3QdPDSws1AwBQfa87WNs5rbTR+3CvZ
 lmw=
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [[PATCH v2] kernel-fitimage.bbclass: only package unique DTBs
Date: Tue, 16 Aug 2022 18:58:55 +0500
Message-ID: <20220816135855.271283-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-15.mgc.mentorg.com (139.181.222.15) To
 svr-ies-mbx-12.mgc.mentorg.com (139.181.222.12)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 13:59:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169437

The KERNEL_DEVICETREE and related variables could potentially have a device
tree listed multiple times and this works okay for most scenarios. However,
when we create FIT entries for these we get duplicate nodes and uboot-mkimage
fails with

fit-image-initramfs-image.its:219.58-229.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node name
fit-image-initramfs-image.its:307.50-317.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-ndm.dtb: Duplicate node name
fit-image-initramfs-image.its:362.54-372.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name
fit-image-initramfs-image.its:417.56-427.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node name
fit-image-initramfs-image.its:648.59-658.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node name
fit-image-initramfs-image.its:744.51-754.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-ndm.dtb: Duplicate node name
fit-image-initramfs-image.its:804.55-814.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name
fit-image-initramfs-image.its:864.57-874.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node name
ERROR: Input tree has errors, aborting (use -f to force output)
uboot-mkimage: Can't open arch/arm64/boot/fitImage.tmp: No such file or directory

We fix this by tracking the DTBs we're compiling in the FIT and only picking
up unique ones.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/classes/kernel-fitimage.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 7e09b075ff..56d71ba8fa 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -527,6 +527,10 @@ fitimage_assemble() {
 			fi
 
 			DTB=$(echo "$DTB" | tr '/' '_')
+
+			# Skip DTB if we've picked it up previously
+			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
+
 			DTBS="$DTBS $DTB"
 			fitimage_emit_section_dtb $1 $DTB $DTB_PATH
 		done
@@ -536,6 +540,10 @@ fitimage_assemble() {
 		dtbcount=1
 		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
 			DTB=$(echo "$DTB" | tr '/' '_')
+
+			# Skip DTB if we've picked it up previously
+			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
+
 			DTBS="$DTBS $DTB"
 			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
 		done
-- 
2.25.1


