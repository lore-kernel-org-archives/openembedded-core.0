Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2ADC624D8
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 12:09:28 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12210.1771762159106842288
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 04:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Lm5ucgv7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-202602221209158acc35333b00020743-pkhr10@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202602221209158acc35333b00020743
        for <openembedded-core@lists.openembedded.org>;
        Sun, 22 Feb 2026 13:09:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WBWVZKlG77zBp1ZqkyqtT+gtJgY5jnVr33S/4ggIFQI=;
 b=Lm5ucgv7Uqe9EhL8/6ZBj1xtBQgVUWPScu1xZ3JNwpWNP8V3G6srY8awlNSX3tYvfdkguV
 66tUfUxZ1IkVSW++BBvWAl2h0j9o6MSmDdmeCVfpDzqq7LpEjLa7v1Vm/dIidd9bN3CMjNzw
 3plRn1AleqbC2lnqisVCQmLdsHhznYfX8mJOdL/gMmO+gRQ1c6pvc8NlIaM+GdhHONek0pcl
 q1l2vyVFBYqIgJY9pbZVu26pifo6CN0Hgj982SKbJu3NEn0iH/ROZKZjeREDloPZzM15RH4b
 piCPUSK6BcPDq2BXhpxO+3MdtFtlfQoqyBs3QMxCUVx/+kZhISsqAhCA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/2] image_types_wic.bbclass: add depend on initramfs
Date: Sun, 22 Feb 2026 13:07:35 +0100
Message-ID: <20260222120910.318167-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260222120910.318167-1-adrian.freihofer@siemens.com>
References: <20260222120910.318167-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 12:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231628

From: Adrian Freihofer <adrian.freihofer@siemens.com>

When the wic image creation requires an initramfs image that is not bundled
with the kernel (INITRAMFS_IMAGE_BUNDLE != "1"), ensure that the initramfs
image is built before attempting to create the wic image by adding an
explicit dependency on do_image_complete.

Previously, this dependency was incorrectly handled by kernel.bbclass.
This change moves the responsibility to image_types_wic.bbclass where
it belongs.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/image_types_wic.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 675aa97513..aea61d67e3 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -190,6 +190,18 @@ python () {
                 d.setVar('_WKS_TEMPLATE', body)
                 bb.build.addtask('do_write_wks_template', 'do_image_wic', 'do_image', d)
         bb.build.addtask('do_image_wic', 'do_image_complete', None, d)
+
+        # If the INITRAMFS_IMAGE is set and the INITRAMFS_IMAGE_BUNDLE is set to 1, the initramfs
+        # image is expected to be built as part of the kernel. Otherwise, the standalone image
+        # must be requestd to be in the deployed artifacts for the wic image to be built.
+        initramfs_image = d.getVar('INITRAMFS_IMAGE')
+        if initramfs_image and not bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
+            initramfs_multiconfig = d.getVar('INITRAMFS_MULTICONFIG')
+            if initramfs_multiconfig:
+                d.appendVarFlag('do_image_wic', 'mcdepends', ' mc:%s:%s:%s:do_image_complete' %
+                                (d.getVar('BB_CURRENT_MC'), initramfs_multiconfig, initramfs_image))
+            else:
+                d.appendVarFlag('do_image_wic', 'depends', ' %s:do_image_complete' % initramfs_image)
 }
 
 #
-- 
2.52.0


