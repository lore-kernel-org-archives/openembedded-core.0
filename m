Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C271DC54F30
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:42:28 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.44674.1747993342131037669
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Z6KuzPeD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20250523094220e17661d3b41d148675-fvhl3g@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250523094220e17661d3b41d148675
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 May 2025 11:42:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=lLp+omfSVUXCBXbwnd0R2nKpHRLp1pskN6IOCQeSFT4=;
 b=Z6KuzPeDMQ/CM/8kPleJZKvK6XUR1Icvv7ANz4jApRy/0S0dXvZsbifRD6Y7i1lKe9Lbyl
 lXmOYTt4maeHVY7SSjbsU1CYq3ZzBsCygi+iw6F8p5ahsxcPSYGJCPzTCxO/I0LEYLSsfN6v
 mpgmvOKen6+qtGUqaF9lx8hO8X4WHRgRJGbIJ/6GfKJDifY+NRkIj/ZteKvmYEfcxVBh4Rok
 Xy55qbryICOpA6G1cDTojuZG8dJS79asB86CpA3O3nbDUQtVlwHlhIZz0et9leuBf3rYxAkl
 B69R0CIa0Nz+B1ToHS5cc31QjVOAoxjnWlZDxHJ5x3NyvD4LcVSvyDRQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 16/17] kernel.bbclass: remove support for type fitImage
Date: Fri, 23 May 2025 11:41:17 +0200
Message-ID: <20250523094152.727177-17-adrian.freihofer@siemens.com>
In-Reply-To: <20250523094152.727177-1-adrian.freihofer@siemens.com>
References: <20250523094152.727177-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217200

From: Adrian Freihofer <adrian.freihofer@siemens.com>

kernel.bbclass is no longer involved in FIT image creation. Whether a
FIT image is built now depends entirely on whether the linux-yocto-fitimage
recipe (or any other recipe capable of producing a FIT image) is selected
for the build.
As a result, specifying the kernel image type "fitImage" in
KERNEL_IMAGETYPE or KERNEL_IMAGETYPES is no longer necessary and gets
removed.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel.bbclass | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 36ce659762e..599996ceb0b 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -84,6 +84,10 @@ python __anonymous () {
         types = (alttype + ' ' + types).strip()
     d.setVar('KERNEL_IMAGETYPES', types)
 
+    # Since kernel-fitimage.bbclass got replaced by kernel-fit-image.bbclass
+    if "fitImage" in types:
+        bb.error("fitImage is no longer supported as a KERNEL_IMAGETYPE(S)")
+
     # KERNEL_IMAGETYPES may contain a mixture of image types supported directly
     # by the kernel build system and types which are created by post-processing
     # the output of the kernel build system (e.g. compressing vmlinux ->
@@ -477,17 +481,10 @@ kernel_do_install() {
 	install -d ${D}/${KERNEL_IMAGEDEST}
 
 	#
-	# When including an initramfs bundle inside a FIT image, the fitImage is created after the install task
-	# by do_assemble_fitimage_initramfs.
-	# This happens after the generation of the initramfs bundle (done by do_bundle_initramfs).
-	# So, at the level of the install task we should not try to install the fitImage. fitImage is still not
-	# generated yet.
-	# After the generation of the fitImage, the deploy task copies the fitImage from the build directory to
-	# the deploy folder.
+	# bundle_initramfs runs after do_install before do_deploy. do_deploy does what's needed therefore.
 	#
-
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		if [ $imageType != "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
 		fi
 	done
@@ -843,11 +840,8 @@ kernel_do_deploy() {
 		fi
 	fi
 
-	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
+	if [ -n "${INITRAMFS_IMAGE}" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
 		for imageType in ${KERNEL_IMAGETYPES} ; do
-			if [ "$imageType" = "fitImage" ] ; then
-				continue
-			fi
 			initramfsBaseName=$imageType-${INITRAMFS_NAME}
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$initramfsBaseName${KERNEL_IMAGE_BIN_EXT}
 			if [ -n "${INITRAMFS_LINK_NAME}" ] ; then
-- 
2.49.0


