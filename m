Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F228FC77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 16:38:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.398.1683304705656073839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 09:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cBi8iCLk;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 345GcJ99108687;
	Fri, 5 May 2023 11:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683304699;
	bh=lt7kMk9+eZyjksUAospZrRVpBVZgqSrNAsn4t+2soho=;
	h=From:To:CC:Subject:Date;
	b=cBi8iCLkSlwd0pvawFrsl0h32APch3c6yYs/o7IiWL1UR68Jeu1wTXhUU4UAdTNJe
	 kwi7LoIKInhX9nWFGWbkzc1vztcdP0m4tADsC+2Va97qzS1uP9TRqj8NAngYL9p774
	 fBXR4e5vt5Pj3qwAnI/GxV5Hx4u7FVmRlfkcjYEg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 345GcIbm001810
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 May 2023 11:38:18 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 May 2023 11:38:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 May 2023 11:38:18 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 345GcIR8068071;
	Fri, 5 May 2023 11:38:18 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCH] kernel-devicetree: allow specification of dtb directory
Date: Fri, 5 May 2023 11:36:02 -0500
Message-ID: <20230505163601.6708-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 16:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180956

From: Randolph Sapp <rs@ti.com>

Fedora/Redhat and Arch are somewhat standardized on their dtb directory
structure. Let's add some flags to configure yocto to mimic that
behavior.

Add the following variables to the kernel class:
	- KERNEL_DTBDEST (controls the destination directory for dtbs)
	- KERNEL_DTBVENDORED (controls if vendor subdirectories are to
	  be respected)

Currently KERNEL_DTBDEST is expected to be a subdir of KERNEL_IMAGEDEST
and KERNEL_DTBVENDORED is expected to be "true"/"false". This only
applies to the package directory structure. The deploydir structure is
purposely left untouched for compatibility with existing recipes.

By default this is configured to behave the same as the current recipe
and produce a flat dtb directory at KERNEL_IMAGEDEST.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Well, suppose I was breaking things by submitting this to kirkstone
first. This is just the master version of the following patchset:
https://lists.openembedded.org/g/openembedded-core/message/180754

I'd love to get that series merged as well if this patch is acceptable.

 meta/classes-recipe/kernel-devicetree.bbclass | 22 ++++++++++++++-----
 meta/classes-recipe/kernel.bbclass            |  2 ++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index 4d0ecb1032..a6c6c5f227 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -12,7 +12,12 @@ python () {
             d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-zimage-bundle")
 }
 
-FILES:${KERNEL_PACKAGE_NAME}-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
+FILES:${KERNEL_PACKAGE_NAME}-devicetree = " \
+    /${KERNEL_DTBDEST}/*.dtb \
+    /${KERNEL_DTBDEST}/*.dtbo \
+    /${KERNEL_DTBDEST}/*/*.dtb \
+    /${KERNEL_DTBDEST}/*/*.dtbo \
+"
 FILES:${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
 
 # Generate kernel+devicetree bundle
@@ -73,12 +78,16 @@ do_compile:append() {
 }
 
 do_install:append() {
+	install -d ${D}/${KERNEL_DTBDEST}
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
-		dtb_ext=${dtb##*.}
-		dtb_base_name=`basename $dtb .$dtb_ext`
 		dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
-		install -m 0644 $dtb_path ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
+		if [ ${KERNEL_DTBVENDORED} == "false" ]; then
+			dtb_ext=${dtb##*.}
+			dtb_base_name=`basename $dtb .$dtb_ext`
+			dtb=$dtb_base_name.$dtb_ext
+		fi
+		install -Dm 0644 $dtb_path ${D}/${KERNEL_DTBDEST}/$dtb
 	done
 }
 
@@ -88,7 +97,10 @@ do_deploy:append() {
 		dtb_ext=${dtb##*.}
 		dtb_base_name=`basename $dtb .$dtb_ext`
 		install -d $deployDir
-		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
+		if [ ${KERNEL_DTBVENDORED} == "false" ]; then
+			dtb=$dtb_base_name.$dtb_ext
+		fi
+		install -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
 		if [ "${KERNEL_IMAGETYPE_SYMLINK}" = "1" ] ; then
 			ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dtb_base_name.$dtb_ext
 		fi
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index e634eabd49..8f022b234d 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -215,6 +215,8 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 # The directory where built kernel lies in the kernel tree
 KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
 KERNEL_IMAGEDEST ?= "boot"
+KERNEL_DTBDEST ?= "${KERNEL_IMAGEDEST}"
+KERNEL_DTBVENDORED ?= "false"
 
 #
 # configuration
-- 
2.40.1


