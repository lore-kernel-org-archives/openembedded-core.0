Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015BDC7EE23
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 17:22:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.30689.1683912154867652022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 10:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XgUdUnF1;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34CHMP0v125670;
	Fri, 12 May 2023 12:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683912145;
	bh=cH7vjp10Ukeqh0tIcMlt4DpLwSMkGlSJUh06/0KdNYg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XgUdUnF1v6I3RMpIVAGmDWIAadJoGxhlMshL2V2GUYVJ2t6bKolSzhzomrOWyJFCs
	 sa/sVi33zr/e4qmEVp+E0LNddN91qYs8xdV+UveRqYk93fJXJcND7A3uAqlgSO7OPn
	 FoQcNSHvKefhoB5xTif5O+tqN1wjwf8HmSUfwuNA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34CHMPg8044707
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 May 2023 12:22:25 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 May 2023 12:22:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 May 2023 12:22:25 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34CHMPwr108192;
	Fri, 12 May 2023 12:22:25 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <martin.jansa@gmail.com>, <peter.kjellerstedt@axis.com>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCHv2 2/2] kernel-devicetree: recursively search for dtbs
Date: Fri, 12 May 2023 12:22:21 -0500
Message-ID: <20230512172221.4062722-3-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512172221.4062722-1-rs@ti.com>
References: <20230512172221.4062722-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 17:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181191

From: Randolph Sapp <rs@ti.com>

Upstream's dtb directory structure has no real standard. They just tend
to idle around the 2/3 directory depth. Recursively search for the
dtb/dtbo files instead of assuming anything.

Fixes: 04ab57d200 (kernel-devicetree: allow specification of dtb
directory, 2023-05-02)

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/classes-recipe/kernel-devicetree.bbclass | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index 831fdd1527..fa6de7a140 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -12,12 +12,21 @@ python () {
             d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-zimage-bundle")
 }
 
-FILES:${KERNEL_PACKAGE_NAME}-devicetree = " \
-    /${KERNEL_DTBDEST}/*.dtb \
-    /${KERNEL_DTBDEST}/*.dtbo \
-    /${KERNEL_DTBDEST}/*/*.dtb \
-    /${KERNEL_DTBDEST}/*/*.dtbo \
-"
+# recursivly search for devicetree files
+def find_device_trees(d):
+    import glob
+    import os
+
+    file_paths = []
+    dest_dir = d.getVar('D')
+    full_dtb_dir = dest_dir + '/' + d.getVar('KERNEL_DTBDEST')
+
+    for file in glob.glob(full_dtb_dir + '/**/*.dtb*', recursive=True):
+        file_paths.append('/' + os.path.relpath(file, dest_dir))
+
+    return ' '.join(file_paths)
+
+FILES:${KERNEL_PACKAGE_NAME}-devicetree = "${@find_device_trees(d)}"
 FILES:${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
 
 # Generate kernel+devicetree bundle
-- 
2.40.1


