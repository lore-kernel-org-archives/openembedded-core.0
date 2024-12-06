Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FD8E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 21:09:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.48323.1733519359131461901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 13:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mmBhtMoU;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B6L9I4F124867
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Dec 2024 15:09:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733519358;
	bh=4HQeCNGVAm8SiOQb4ej+8pd6SNX0+aSAzvr6r488fQM=;
	h=From:To:Subject:Date;
	b=mmBhtMoU/Wz1ux01tnC6Hy6CSRMSlef4+xpr1x0y89duhEC1TPBaBb+2X1LyXsqwA
	 PFY56GjeZ4JB6E3cxdDfCy4Rt1pl+F85W05foO6l9YwOU9a/kDY6lj5l6TK+xrRIn0
	 S4X0ffJkLqgskvRti0E6QT+stqqBRHm7Ww9QyxQg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6L9IHY026164
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Dec 2024 15:09:18 -0600
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 15:09:18 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Fri, 6 Dec
 2024 15:09:18 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 15:09:18 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6L9IRr101161
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Dec 2024 15:09:18 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tJfZd-00086g-TL
	for openembedded-core@lists.openembedded.org; Fri, 06 Dec 2024 15:09:17 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] Revert "uboot-sign: fix U-Boot binary with public key"
Date: Fri, 6 Dec 2024 15:09:17 -0600
Message-ID: <20241206210917.31123-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 21:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208441

This reverts commit 0d14e99aa18ee38293df63d585fafc270a4538be.

The patch removed logic required for correct handling of
UBOOT_SUFFIX=img or UBOOT_SUFFIX=rom.  We need to find a better way to
handle the fix for [YOCTO #15649].

Signed-off-by:  Ryan Eatmon <reatmon@ti.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 7ee73b872a..a17be745ce 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -122,7 +122,13 @@ concat_dtb() {
 	# If we're not using a signed u-boot fit, concatenate SPL w/o DTB & U-Boot DTB
 	# with public key (otherwise U-Boot will be packaged by uboot_fitimage_assemble)
 	if [ "${SPL_SIGN_ENABLE}" != "1" ] ; then
-		if [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
+		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
+			[ -e "${UBOOT_DTB_BINARY}" ]; then
+			oe_runmake EXT_DTB="${UBOOT_DTB_SIGNED}" ${UBOOT_MAKE_TARGET}
+			if [ -n "${binary}" ]; then
+				cp ${binary} ${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
+			fi
+		elif [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
 			if [ -n "${binary}" ]; then
 				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} | tee ${binary} > \
 					${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
-- 
2.17.1


