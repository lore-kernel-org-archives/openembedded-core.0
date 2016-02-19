Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10FBB73179
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 08:48:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1J8mspg027409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 00:48:54 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 19 Feb 2016 00:48:53 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Feb 2016 00:48:34 -0800
Message-ID: <2ecb3112ab8116ba8ff2ef0c493ded66356573e7.1455871674.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1455871674.git.liezhi.yang@windriver.com>
References: <cover.1455871674.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] image.bbclass: fix circular dependency when IMAGE_FSTYPES append hddimg
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
X-List-Received-Date: Fri, 19 Feb 2016 08:48:55 -0000
Content-Type: text/plain

Fixed:
IMAGE_FSTYPES_append = " hddimg"

$ bitbake -g core-image-minimal-initramfs
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing RunQueue
ERROR: Task /path/to/core-image-minimal-initramfs.bb (do_bootimg) has circular dependency on /path/to/core-image-minimal-initramfs.bb (do_image_complete)
ERROR: Command execution failed: Exited with 1

This is because IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}", and if
IMAGE_FSTYPES append hddimg, then core-image-minimal-initramfs.bb would
be circular dependency:
do_bootimg -> do_image_complete -> do_bootimg.

Now we check and error out.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image-live.bbclass |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index aafa7d5..d2314aa 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -9,7 +9,6 @@ LABELS_append = " ${SYSLINUX_LABELS} "
 
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
 
-do_bootimg[depends] += "${INITRD_IMAGE}:do_image_complete"
 do_bootimg[depends] += "${PN}:do_image_ext4"
 
 inherit bootimg
@@ -18,3 +17,13 @@ IMAGE_TYPEDEP_live = "ext4"
 IMAGE_TYPEDEP_iso = "ext4"
 IMAGE_TYPEDEP_hddimg = "ext4"
 IMAGE_TYPES_MASKED += "live hddimg iso"
+
+python() {
+    image_b = d.getVar('IMAGE_BASENAME', True)
+    initrd_i = d.getVar('INITRD_IMAGE', True)
+    if image_b == initrd_i:
+        bb.error('INITRD_IMAGE %s cannot use image live, hddimg or iso.' % initrd_i)
+        bb.fatal('Check IMAGE_FSTYPES and INITRAMFS_FSTYPES settings.')
+    else:
+        d.appendVarFlag('do_bootimg', 'depends', ' %s:do_image_complete' % initrd_i)
+}
-- 
1.7.9.5


