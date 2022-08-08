Return-Path: <Awais_Belal@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9CFC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 10:33:07 +0000 (UTC)
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 by mx.groups.io with SMTP id smtpd.web11.24083.1659954781683925655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 03:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.137.180, mailfrom: awais_belal@mentor.com)
X-IronPort-AV: E=Sophos;i="5.93,222,1654588800";
   d="scan'208";a="80828995"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 08 Aug 2022 02:33:01 -0800
IronPort-SDR: 
 wMQvOOdbDs8EX8nqd8sESq1GKqvMGqwBwlTBmBptMW7EX2DyBiizgVf8NRT9Ta8jFQ/Jixusnc
 ESaXS0+IGgsvT1o1Q2YagQcHFCbvwHVicwXkFcYZWI/bzrK+x/rl2haOx40YUFTtFkgINQX9Ks
 o8NdNakSYEZgQRG/ROdUglQsRhqKypLWF8IxNt7Hnh4y1q2paCuUZSanBvhkHNfK7s0U8+MYKJ
 uBBAkmk83l86U6EGiiMshSM50zjMmKqtFF5kMCUaalNaNUwKOOFOwGJ+AVHeEi9mZFM3ZlCJyZ
 5Jk=
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] kernel-fitimage.bbclass: only package unique DTBs
Date: Mon, 8 Aug 2022 15:32:27 +0500
Message-ID: <20220808103227.104898-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-12.mgc.mentorg.com (139.181.222.12)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 10:33:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169080

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
 meta/classes/kernel-fitimage.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 753164551c..2a07a57d5d 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -529,6 +529,14 @@ fitimage_assemble() {
 			fi
 
 			DTB=$(echo "$DTB" | tr '/' '_')
+
+			# Skip DTB if we've picked it up previously
+			case ${DTBS} in
+				*${DTB}*)
+					continue
+					;;
+			esac
+
 			DTBS="$DTBS $DTB"
 			fitimage_emit_section_dtb $1 $DTB $DTB_PATH
 		done
@@ -538,6 +546,14 @@ fitimage_assemble() {
 		dtbcount=1
 		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
 			DTB=$(echo "$DTB" | tr '/' '_')
+
+			# Skip DTB if we've picked it up previously
+			case ${DTBS} in
+				*${DTB}*)
+					continue
+					;;
+			esac
+
 			DTBS="$DTBS $DTB"
 			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
 		done
-- 
2.25.1


