Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F19C77B73
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 23:36:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1595.1685144200394823969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 16:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MnW/bR42;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QNaKpC081736;
	Fri, 26 May 2023 18:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685144180;
	bh=TDl3EzCWMGZcUsBjk1hlKoZTzzUnvCR57Iw7H6UssFI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MnW/bR42YD/WKoHeHEs55BIkveFrZevqfo6i2pdCRYid63ZRwjje1uBP2DAzUK827
	 0YXkEaYzuCwtLegXm2ACmilT6+u/yc9ks9n8CjgbGKiafTHifecSxAWM8lRx551zuQ
	 gLM5CAmJYEUR2A00MIQtLqMo29R56k9yrqRtMkts=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QNaKhH057287
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 18:36:20 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 18:36:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 18:36:19 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QNaJ4L013670;
	Fri, 26 May 2023 18:36:19 -0500
From: <rs@ti.com>
To: <steve@sakoman.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH 4/4] kernel-devicetree: recursively search for dtbs
Date: Fri, 26 May 2023 18:36:16 -0500
Message-ID: <20230526233616.3623368-5-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526233616.3623368-1-rs@ti.com>
References: <20230526233616.3623368-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181785

From: Randolph Sapp <rs@ti.com>

Upstream's dtb directory structure has no real standard. They just tend
to idle around the 2/3 directory depth. Recursively search for the
dtb/dtbo files instead of assuming anything.

Fixes: 04ab57d200 (kernel-devicetree: allow specification of dtb
directory, 2023-05-02)

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-devicetree.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index e1e67cbc56c..18ab6b4c4ff 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -6,12 +6,12 @@ python () {
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


