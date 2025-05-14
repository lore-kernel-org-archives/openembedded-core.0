Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A04FC54755
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 18:53:43 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.110598.1747248815520801533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 11:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=KODbTu7c;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20250514185333602989377084b5b302-8_wto5@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250514185333602989377084b5b302
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 20:53:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=sUT+anTtqAh5U9H6EcQ+TeEW01qL2eH694EjAi/nvA8=;
 b=KODbTu7cu42DHbeloNybiMuUCD49n1uGC+q9DENJtWRDrgIKfNQdRD2Pn/dbV/Gv080AaK
 6JwF/uIBO+N7msyVfAoFWTY7pLMuxVtKDQFh6EOekEfaPMYEAjI2EWpzYOxM9RuRbCk8D2fS
 GZQF0uSx2cW8b3cwqfwo4wGGmh0bePMhFFu2BxRc5zUghsLlhZZSnuyTWi8zykHTbU0RfWq2
 UcTId8DWBDT+KGTbMIMUdDlpJyq5kcRvOi4JdvYVUGhldfYNqTiQ4cho5J7CifFAUG2UaIJ7
 1xlhwCl87HTpeh7FKGjOl7BcS1UarNzxw4Io5scv+EMjfk9s/2OHVj3w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 15/22] kernel.bbclass: remove support for type fitImage
Date: Wed, 14 May 2025 20:50:59 +0200
Message-ID: <20250514185225.162998-16-adrian.freihofer@siemens.com>
In-Reply-To: <20250514185225.162998-1-adrian.freihofer@siemens.com>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 18:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216543

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Support for fitImage inf KERNEL_IMAGETYPE or KERNEL_IMAGETYPES has been
removed from kernel.bbclass. There is now the new
kernel-fit-image.bbclass which allows to write an independent recipe
like the linux-yocto-fitimage.bb which provides the same functionality.
This new recipe has the advantage that it can use kernel artifacts from
the sstate-cache when the initramfs changes but the kernel remains
unchanged. This was not possible with the old kernel-fitimage.bbclass.

The combination of INITRAMFS_IMAGE_BUNDLE = “1” and the creation of a
FIT image is no longer supported. But there is probably no real use case
for such a configuration. The FIT image can contain multiple artifacts
such as a kernel and an initramfs without bundling the initramfs into
the kernel artifact. Bundling the initramfs into the kernel artifact
also requires the full kernel build directory, which inherently prevents
the use of the kernel from the sstate cache.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel.bbclass | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 1a7a60eadfc..847eb2f046f 100644
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


