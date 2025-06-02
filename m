Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E494AC61CE5
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 07:57:33 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.44202.1748851049850672036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 00:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=GuZX1XxK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20250602075729e1520b488fbe383534-xnxmb_@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250602075729e1520b488fbe383534
        for <openembedded-core@lists.openembedded.org>;
        Mon, 02 Jun 2025 09:57:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=lLp+omfSVUXCBXbwnd0R2nKpHRLp1pskN6IOCQeSFT4=;
 b=GuZX1XxK0oAUcUXBz15UZt93WjzWryxmjjJPs1PJ/GloNp675Cm9jd/0W4JV9+k9ID+Cvg
 I7JrdEywn87VuUITg0RlzRazvNQozNb0/uK1pvYx6Tyzuvp8gk7PAdk/pilj6PKsqe+ukpod
 LNMGZtW98bEo9TtpQUsUv7Rt52qjjaEHm3Y8unZvZ8eMgtDRJF01BW16h6kn8XRU5urhv7GE
 +plH7oxVxoSuenz8ZQdX56nSV/iGUCNzqfejs9AUHI696xWsvr+ZZds9+57BA27gSOMayEjw
 DXFv0DSRz/9Mz5weI5EaTFrv/JrUm2FitdYWQ9XCzASjCYqBn0KGhtcg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v6 20/21] kernel.bbclass: remove support for type fitImage
Date: Mon,  2 Jun 2025 09:56:30 +0200
Message-ID: <20250602075714.32122-21-adrian.freihofer@siemens.com>
In-Reply-To: <20250602075714.32122-1-adrian.freihofer@siemens.com>
References: <20250602075714.32122-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 07:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217705

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


