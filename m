Return-Path: <jwessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5EDB7D711
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 13:06:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7KD6nmA015133
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 06:06:49 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 20 Aug 2019 06:06:48 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 9E1F7AA47A0;
	Tue, 20 Aug 2019 06:06:48 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2019 06:06:47 -0700
Message-ID: <20190820130647.118287-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] Revert "kernel.bbclass: adjust a condition checking"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Aug 2019 13:06:48 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This reverts commit 6676411fccff2d331878e4ca1f9411aafb056a80.

This revert restores the original code and adds a comment.  The commit
that was reverted broke a number of wic templates and tools which rely
on the initramfs creation dependency and the case where the
INITRAMFS_IMAGE_BUNDLE is not set.

If an end user does not want the INITRAMFS_IMAGE generated, it should
be set to "".

[ Issue: LIN1019-1791 ]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/kernel.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index bf3674238f..ebcb79a528 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -96,8 +96,10 @@ python __anonymous () {
         d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
 
     image = d.getVar('INITRAMFS_IMAGE')
-    image_bundle = d.getVar('INITRAMFS_IMAGE_BUNDLE')
-    if image and bb.utils.to_boolean(image_bundle, False):
+    # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
+    # the do_bundle_initramfs does nothing, but the INITRAMFS_IMAGE is built
+    # standalone for use by wic and other tools.
+    if image:
         d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
     # NOTE: setting INITRAMFS_TASK is for backward compatibility
-- 
2.21.0


