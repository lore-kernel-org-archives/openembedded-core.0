Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC30C369DC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:07:08 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.28201.1746364017481237771
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 06:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=fgjb1Xry;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20250504130659343d828884db26c604-ynoxhp@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250504130659343d828884db26c604
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 May 2025 15:06:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MQhrn/swZFDbscT3tNXGsOu9PLvqx+fgDQJeqhZjuTg=;
 b=fgjb1Xryo0HWF8la2lcXWEGOriEHMSfLGdg60YedQVcGxW4AtDGL9hziSMn0uQT1hM1o58
 1AYOPZ9hPdvc9qPrI58AQjh61Mo64WBBZ9wpwEFBzUbJi4OyNFQjeXS0MkUUVFPThsztR4cf
 pNy9v06Cl1CntLm5njMd8QM57pB/wVGkyvaZ2hK3gsiKKzId1JA/Ex5wePSjIMVH3ptSX5VK
 4bbNs7MapPEnBkr7wwTZKVxcOcmx8g9HeTSOAri+oDGa7xJg8WPhv02l8aEPTf+sUhRNAcS+
 DTB78lbaHZoW7w5jimQpdUltw4kkrzu56YZuFHNmYFefO5RK4UyymWpg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	l.anderweit@phytec.de,
	richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	bruce.ashfield@gmail.com,
	rogerio.borin@toradex.com,
	sean.anderson@seco.com,
	m.felsch@pengutronix.de,
	ejo@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 20/20] kernel-fit-image.bbclass: ignore INITRAMFS_IMAGE_BUNDLE
Date: Sun,  4 May 2025 15:05:07 +0200
Message-ID: <20250504130507.717954-20-adrian.freihofer@siemens.com>
In-Reply-To: <20250504130507.717954-1-adrian.freihofer@siemens.com>
References: <20250504130507.717954-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 13:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215964

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The new recipe includes the initramfs unbundled anyway. Remove the code
which does not work in the context of a recipe which takes the kernel
artifacts from recipe-sysroot. The kernel in the recipe-sysroot is
exported by the do_install function of the kernel which runs before
do_bundle_initramfs.

It would be possible to support the bundled in FIT image use case if the
recipe would take the kernel artifacts from the deploy folder where also
the bundled kernel artifact could be found. But what's the use case of a
bundled artifact included in a FIT image? Rather than supporting
something which does not work well with the sstate-cache lets guide the
users to a better implementation and simplify the code where possible.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 3c40fbb0ffa..b902bf3a164 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -11,7 +11,7 @@ DEPENDS += "u-boot-tools-native dtc-native virtual/kernel"
 
 python () {
     image = d.getVar('INITRAMFS_IMAGE')
-    if image and not bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
+    if image:
         if d.getVar('INITRAMFS_MULTICONFIG'):
             mc = d.getVar('BB_CURRENT_MC')
             d.appendVarFlag('do_compile', 'mcdepends', ' mc:' + mc + ':${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
@@ -108,7 +108,7 @@ python do_compile() {
 
     # Prepare a ramdisk section.
     initramfs_image = d.getVar('INITRAMFS_IMAGE')
-    if initramfs_image and not oe.types.boolean(d.getVar("INITRAMFS_IMAGE_BUNDLE")):
+    if initramfs_image:
         # Find and use the first initramfs image archive type we find
         found = False
         for img in d.getVar("FIT_SUPPORTED_INITRAMFS_FSTYPES").split():
@@ -157,11 +157,9 @@ do_deploy() {
     install -m 0644 "${B}/fitImage" "$deploy_dir/fitImage"
     install -m 0644 "${B}/fit-image.its" "$deploy_dir/fit-image.its"
 
-    if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-        ln -snf fit-image.its "$deploy_dir/fitImage-its-${KERNEL_FIT_NAME}.its"
-        if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-            ln -snf fit-image.its "$deploy_dir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
-        fi
+    ln -snf fit-image.its "$deploy_dir/fitImage-its-${KERNEL_FIT_NAME}.its"
+    if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+        ln -snf fit-image.its "$deploy_dir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
     fi
 
     if [ -n "${INITRAMFS_IMAGE}" ]; then
@@ -170,11 +168,9 @@ do_deploy() {
             ln -snf fit-image.its "$deploy_dir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
         fi
 
-        if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-            ln -snf fitImage "$deploy_dir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
-            if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
-                ln -snf fitImage "$deploy_dir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
-            fi
+        ln -snf fitImage "$deploy_dir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
+        if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+            ln -snf fitImage "$deploy_dir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
         fi
     fi
 }
-- 
2.49.0


