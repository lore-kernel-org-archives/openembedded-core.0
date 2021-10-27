Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D52C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 14:04:24 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.12051.1635343463289312344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 07:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 383A3C0002;
	Wed, 27 Oct 2021 14:04:20 +0000 (UTC)
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] uboot-sign: fix the concatenation when multiple
 U-BOOT configurations are specified
Date: Wed, 27 Oct 2021 16:04:12 +0200
Message-Id: <20211027140412.1663212-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 14:04:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157513

Some BSPs, especially those of meta-freescale and meta-ti allow to build U-Boot
binaries using different configuration for a given target, for example:
- UBOOT_CONFIG ??= "tfa-secure-boot tfa"
- UBOOT_CONFIG ??= "nand sdcard spi nor"

When this is the case the public key wasn't concatenated to all U-Boot binaries
built.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/classes/uboot-sign.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index bae8cada0ac3..8d136e940589 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -131,6 +131,20 @@ concat_dtb_helper() {
 		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
 			cd ${DEPLOYDIR}
 			cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${CONFIG_B_PATH}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
+
+			if [ -n "${UBOOT_CONFIG}" ]
+			then
+				for config in ${UBOOT_MACHINE}; do
+					i=$(expr $i + 1);
+					for type in ${UBOOT_CONFIG}; do
+						j=$(expr $j + 1);
+						if [ $j -eq $i ]
+						then
+							cp ${UBOOT_IMAGE} ${B}/${CONFIG_B_PATH}/u-boot-$type.${UBOOT_SUFFIX}
+						fi
+					done
+				done
+			fi
 		else
 			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
 		fi
@@ -205,7 +219,7 @@ install_helper() {
 	fi
 }
 
-# Install SPL dtb and u-boot nodtb to datadir, 
+# Install SPL dtb and u-boot nodtb to datadir,
 install_spl_helper() {
 	if [ -f "${SPL_DIR}/${SPL_DTB_BINARY}" ]; then
 		install -Dm 0644 ${SPL_DIR}/${SPL_DTB_BINARY} ${D}${datadir}/${SPL_DTB_IMAGE}
-- 
2.31.1


