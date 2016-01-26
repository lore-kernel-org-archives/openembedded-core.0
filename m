Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 79C80766E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 09:37:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0Q9bvJd027244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 01:37:57 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Jan 2016 01:37:57 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jan 2016 01:37:56 -0800
Message-ID: <db9c94907c59145f66a0bee387d5c95dc2d3c174.1453801040.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453801040.git.liezhi.yang@windriver.com>
References: <cover.1453801040.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass: chek circular dependency when IMAGE_FSTYPES append hddimg
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
X-List-Received-Date: Tue, 26 Jan 2016 09:38:00 -0000
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


