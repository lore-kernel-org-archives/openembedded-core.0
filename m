Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB820C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:56:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1482.1683046583434077031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 09:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YPGAu31A;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 342GuJo0110900;
	Tue, 2 May 2023 11:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683046579;
	bh=IEFLcmj7RH5HnWTN4b15TQqTM4iDI5wqDn4P53+cHP4=;
	h=From:To:CC:Subject:Date;
	b=YPGAu31AfWpMu7peecGAv3A634Ej0uQaSa1yC3QFrA3G0pZO1DcP69Y/v0khKJLl3
	 rhU0RF4xCCrZ+hHvBZcm1q2LEfC0NFae9s1BYajVh+B13bseCS4kIVXCNrmwJqBzQt
	 FP+ndCvrDqzxLZGI20YzgFmzrGULmQFs0C8FYjKo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 342GuI5m038937
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 May 2023 11:56:18 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 May 2023 11:56:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 May 2023 11:56:18 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 342GuI2p119681;
	Tue, 2 May 2023 11:56:18 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [PATCH] kernel-devicetree: allow specification of dtb directory
Date: Tue, 2 May 2023 11:56:12 -0500
Message-ID: <20230502165612.1697705-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 16:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180753

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

This is currently being submitted against kirkstone because we're slow.
Expect a rebased version for master if this is acceptable. Should be
safe for kirkstone as it doesn't change the current behavior. It just
allows for extra configuration.

 meta/classes/kernel-devicetree.bbclass | 22 +++++++++++++++++-----
 meta/classes/kernel.bbclass            |  2 ++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index b4338da1b13..11b57adc92c 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -6,7 +6,12 @@ python () {
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
@@ -67,12 +72,16 @@ do_compile:append() {
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
 
@@ -82,7 +91,10 @@ do_deploy:append() {
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
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b315737fd2f..3e3ac2d47d0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -210,6 +210,8 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 # The directory where built kernel lies in the kernel tree
 KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
 KERNEL_IMAGEDEST ?= "boot"
+KERNEL_DTBDEST ?= "${KERNEL_IMAGEDEST}"
+KERNEL_DTBVENDORED ?= "false"
 
 #
 # configuration
-- 
2.40.0


