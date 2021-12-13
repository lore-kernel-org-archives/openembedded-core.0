Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF33C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:58 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=e19YMb0m;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369078; x=1670905078;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+Tk+QMxg7kEFFOozVTX3B/JlA1lAPnMcwftJksRg8IM=;
  b=e19YMb0mmZpKzEdvfokQMV8dGDUD7oiQcz57zFK1A4NMrQYJcxO53RHU
   aKHvE41KznCZaxk6yrshD2Ph36utflJ7z9NaRlXITRQ48ZwUscYQ8XQRM
   3El7GFBpNFUZtjmZOj6/iKzZbXko2yeg2w/1z3C7A2rpRWc2D+XWpwpRa
   QAX5vX30NgxCtBi42OKiO3iDxMkUEoA1yv/o8hirR9CuQN99ijk+lGwmY
   g6EQW2IsNOERxKoLihW/MqdCRPrkzyZdrlRoUP2tbcDBT6dqQ5vjnSCmV
   FikqMq9zABY6W+cXhGZ7U+JNUoum8q5sbE7/ZkXEdhSlhH81f/hiNLSLo
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602266"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602266"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589341"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:56 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 18/20] uboot-sign: fix the concatenation when
 multiple U-BOOT configurations are specified
Date: Mon, 13 Dec 2021 12:17:17 +0800
Message-Id: 
 <ffa802f5a60f244141f1b263f3c69936d4c2f388.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159608

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
index ba48f24b10..fca9de2934 100644
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


