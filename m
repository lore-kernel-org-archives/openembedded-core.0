Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3BAC433FE
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:23 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=PMS+CvUy;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444882; x=1670980882;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JSp8wKbGq4YMjPvu1+vkCWJOIhRtB7ZlkvfTOjOraQA=;
  b=PMS+CvUywBbNzHh2yH/MKC5I5gl9y/eY+l7ozDh1pyVHkwtjPSewQuae
   yO2Jop2Y50G+h2tjdI31bkA+03FWcKY6YvLQovo8+4FpJNb0RDYxBQZhn
   5J1jWXGXqlBuJw77vFC+vkTH28lMdaH3R4FvCiN84orblD6rDlf/TfyW+
   Vu5tEgMXxumvsstk3gVHyq46pJzav97z1J6hZxb+ecaJtQ7MDOJ1Io330
   Y5UpBpMnM8Qj1tbLuCxV1Goi19h2IIKYzUMZHm/DxOxNnuNCF0TH1dUZ+
   5dL+qEW1ECCCPvLBL/wOiqdEkQUQeDfTI/60MP/C9KoVtHmotWNd9t8cN
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682551"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682551"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869230"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:21 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 14/17] uboot-sign: fix the concatenation when
 multiple U-BOOT configurations are specified
Date: Tue, 14 Dec 2021 09:20:49 +0800
Message-Id: 
 <e9f8162e619af05077eb5a30089cdbdcf309c161.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159676

From: Thomas Perrot <thomas.perrot@bootlin.com>

Some BSPs, especially those of meta-freescale and meta-ti allow to build U-Boot
binaries using different configuration for a given target, for example:
- UBOOT_CONFIG ??= "tfa-secure-boot tfa"
- UBOOT_CONFIG ??= "nand sdcard spi nor"

When this is the case the public key wasn't concatenated to all U-Boot binaries
built.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit dfd71ae3d102f3010c6117d774e9739a322930f6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/uboot-sign.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index fdf153248c..c39b30f43b 100644
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
2.33.1


