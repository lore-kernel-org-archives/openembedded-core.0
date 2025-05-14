Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C07C54E65
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 18:53:43 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.110589.1747248811553974163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 11:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=XqTTfSSZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20250514185334fcd65affa4bb14e241-h_xboj@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250514185334fcd65affa4bb14e241
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 20:53:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=r25NZ1wmwEV4MECCuZ1IG9qbnAu0UYr3sVTwHUutj+0=;
 b=XqTTfSSZLq9nN0YcRbdYtzowmEEJoznj9OgD15CkrVCK7Z+AiNktz0iEKF6pTgxG6bOmgG
 iiQRr+pEbWZALFCAh7Yu1vAAHkJI8joesBIM1LMAvU+ir4NKMAmuIJdvDh45oBpfjuqOHoko
 W+paPO2qPzJXQeZhARhX5IZ2m9+LpKItQLQP+8hDJYAFSJbOrYiD8/9eVaq3JDQaGfvYnaQX
 X/zntGJlwr/WJXQoW96ubwwCmtBrSWbA9e4Lrx0zzCX6064QWIsxi/pqzd9Y/wg2f8HxUZT8
 i2KcrQt5+IgLp3BCcPri27Ro9IiJ08k9w//X41C+K78ebH8hZx6PYA+g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 20/22] kernel-fit-image.bbclass: ignore INITRAMFS_IMAGE_BUNDLE
Date: Wed, 14 May 2025 20:51:04 +0200
Message-ID: <20250514185225.162998-21-adrian.freihofer@siemens.com>
In-Reply-To: <20250514185225.162998-1-adrian.freihofer@siemens.com>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 18:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216538

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
index f4620aa0f86..dd8a6200328 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -14,7 +14,7 @@ DEPENDS += "\
 
 python () {
     image = d.getVar('INITRAMFS_IMAGE')
-    if image and not bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
+    if image:
         if d.getVar('INITRAMFS_MULTICONFIG'):
             mc = d.getVar('BB_CURRENT_MC')
             d.appendVarFlag('do_compile', 'mcdepends', ' mc:' + mc + ':${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
@@ -107,7 +107,7 @@ python do_compile() {
 
     # Prepare a ramdisk section.
     initramfs_image = d.getVar('INITRAMFS_IMAGE')
-    if initramfs_image and not oe.types.boolean(d.getVar("INITRAMFS_IMAGE_BUNDLE")):
+    if initramfs_image:
         # Find and use the first initramfs image archive type we find
         found = False
         for img in d.getVar("FIT_SUPPORTED_INITRAMFS_FSTYPES").split():
@@ -156,11 +156,9 @@ do_deploy() {
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
@@ -169,11 +167,9 @@ do_deploy() {
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


