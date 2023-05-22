Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50574C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 20:46:35 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3121.1684788390355478190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 13:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LSt3lLn3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MKkJrW070053;
	Mon, 22 May 2023 15:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684788379;
	bh=6lhXpgmACGxbswxK57bUGTX3rkgfKTrA9PIe5Z/fIOo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LSt3lLn3GlzIWDxRjCl7gfDPW1ZvymeCAr0of8btF2S/xM0Sdm3xRljl2JWBZlFf/
	 5WMKBS0/GKKR32P4QBISc/stdg5EBmM9IJMQkSRSp8ih0YuxQOmJHSbha7VPWI8Dft
	 9Aj1qpA0HMT6yFLtmGeWKNxziVNNbiNfoJNF65Xg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MKkJKp057071
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 15:46:19 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 15:46:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 15:46:19 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MKkJ6s078155;
	Mon, 22 May 2023 15:46:19 -0500
From: <rs@ti.com>
To: <luca.ceresoli@bootlin.com>, <richard.purdie@linuxfoundation.org>,
        <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <martin.jansa@gmail.com>, <peter.kjellerstedt@axis.com>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCHv3 3/3] kernel-devicetree: recursively search for dtbs
Date: Mon, 22 May 2023 15:46:12 -0500
Message-ID: <20230522204612.3882158-4-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522204612.3882158-1-rs@ti.com>
References: <20230522204612.3882158-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 20:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181616

From: Randolph Sapp <rs@ti.com>

Upstream's dtb directory structure has no real standard. They just tend
to idle around the 2/3 directory depth. Recursively search for the
dtb/dtbo files instead of assuming anything.

Fixes: 04ab57d200 (kernel-devicetree: allow specification of dtb
directory, 2023-05-02)

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/classes-recipe/kernel-devicetree.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index 831fdd1527..b3bae32f9e 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -12,12 +12,12 @@ python () {
             d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-zimage-bundle")
 }
 
+# recursivly search for devicetree files
 FILES:${KERNEL_PACKAGE_NAME}-devicetree = " \
-    /${KERNEL_DTBDEST}/*.dtb \
-    /${KERNEL_DTBDEST}/*.dtbo \
-    /${KERNEL_DTBDEST}/*/*.dtb \
-    /${KERNEL_DTBDEST}/*/*.dtbo \
+    /${KERNEL_DTBDEST}/**/*.dtb \
+    /${KERNEL_DTBDEST}/**/*.dtbo \
 "
+
 FILES:${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
 
 # Generate kernel+devicetree bundle
-- 
2.40.1


