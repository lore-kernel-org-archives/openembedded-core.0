Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455E2C88CB2
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 21:39:22 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6833.1693517955780257126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 14:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a39RB9pJ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37VJQUQi079894
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 14:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693509990;
	bh=BJkr/QS61s06izn7oMMbERoqKDPRP2ZbyE2GkbDs+lQ=;
	h=From:To:Subject:Date;
	b=a39RB9pJRySCVFSnzrc6iz1ekO2d2wDyLRzcxBCBahifwMbuOcwvbNGnND+iNkkG6
	 Bkj0hEc5m1ptaZwaeLwAoSJAnYgtMxRcPO2+I5u4ybxrv7orPaX6BA3QTs2ZcOzo93
	 e/z9WdNQpWwPWEMyW6g8fQ/eq8ZTapdf44XtwB8k=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37VJQUCA022129
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 14:26:30 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Aug 2023 14:26:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Aug 2023 14:26:29 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37VJQTh2115925
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 14:26:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qbnJF-0000zX-JT
	for openembedded-core@lists.openembedded.org; Thu, 31 Aug 2023 14:26:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v2] kernel.bbclass: Add force flag to rm calls
Date: Thu, 31 Aug 2023 14:26:29 -0500
Message-ID: <20230831192629.3758-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 21:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186988

The latest 6.5 kernels do not appear to create the source file in
${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source so the
recipe errors out when trying to remove it.  Simple fix is to add the
-f (force) flag to the call.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Switch from if exists wrapper to -f flag on rm.

 meta/classes-recipe/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index acb43bd4d5..2ec9ea2091 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -454,8 +454,8 @@ kernel_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# Remove empty module directories to prevent QA issues
 		find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
 	else
-- 
2.17.1


