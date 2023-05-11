Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63D6C7EE25
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 21:36:38 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9114.1683840994424790038
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 14:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Kp2GoR2+;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34BLaLkq004682;
	Thu, 11 May 2023 16:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683840981;
	bh=QJ0NKGRf7WA8z5EGPUcFrWGS41UWcH+x7ZI4a5Ewvys=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Kp2GoR2+i3f5ePXAmzOaQRrGe+pDK/H9ke1YNV5+UOe8o3RWrmpiXt5by5ScpNQlq
	 m4Cg7ssp1nMvrPNUfKQbEN03cmbUR9dDjczo9Ge4ssBODz9RMZEwKh3EORemSdTn1j
	 LSVF1Q8KaYt+qI4mCFdXlugBy6hnDTIfuw5D1HPY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34BLaLuW031143
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 May 2023 16:36:21 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 May 2023 16:36:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 May 2023 16:36:21 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34BLaLXB012865;
	Thu, 11 May 2023 16:36:21 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <martin.jansa@gmail.com>, <peter.kjellerstedt@axis.com>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCH 2/2] kernel-devicetree: recursively search for dtbs
Date: Thu, 11 May 2023 16:36:14 -0500
Message-ID: <20230511213614.466484-3-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511213614.466484-1-rs@ti.com>
References: <20230511213614.466484-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 21:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181158

From: Randolph Sapp <rs@ti.com>

Upstream's dtb directory structure has no real standard. They just tend
to idle around the 2/3 directory depth. Recursively search for the
dtb/dtbo files instead of assuming anything.

Fixes: 04ab57d200 (kernel-devicetree: allow specification of dtb
directory, 2023-05-02)

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/classes-recipe/kernel-devicetree.bbclass | 22 ++++++++++++++-----
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index 831fdd1527..1beaedfb44 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -12,12 +12,22 @@ python () {
             d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-zimage-bundle")
 }
 
-FILES:${KERNEL_PACKAGE_NAME}-devicetree = " \
-    /${KERNEL_DTBDEST}/*.dtb \
-    /${KERNEL_DTBDEST}/*.dtbo \
-    /${KERNEL_DTBDEST}/*/*.dtb \
-    /${KERNEL_DTBDEST}/*/*.dtbo \
-"
+# recursivly search for devicetree files
+python () {
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
+    d.appendVar("FILES:" + d.getVar("KERNEL_PACKAGE_NAME") + '-devicetree',
+                ' '+' '.join(file_paths))
+}
+
 FILES:${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
 
 # Generate kernel+devicetree bundle
-- 
2.40.1


