Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id E5FF66B7CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 16:20:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KGKOq6027531;
	Tue, 20 Aug 2013 11:20:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KGKOIU032118;
	Tue, 20 Aug 2013 11:20:24 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 11:20:24 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7KGKLvJ006373;
	Tue, 20 Aug 2013 11:20:22 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 11:51:26 -0500
Message-ID: <1377017488-32708-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [for dylan][PATCH 1/3] linux-dtb.inc: Replace /boot/ with /${KERNEL_IMAGEDEST}/
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
X-List-Received-Date: Tue, 20 Aug 2013 16:20:29 -0000
Content-Type: text/plain

From: Mike Looijmans <mike.looijmans@topic.nl>

Devicetree files were installed hard-coded in /boot. When KERNEL_IMAGEDEST
is anything else but "boot", the postinstall script and the file locations
no longer match and the postinstall will fail.

Replace "boot" with "${KERNEL_IMAGEDEST}" to fix this problem, and to allow
the devicetree files to be installed in another location.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 58b93a1..401d1e0 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -1,5 +1,5 @@
 # Support for device tree generation
-FILES_kernel-devicetree = "/boot/devicetree*"
+FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
 KERNEL_DEVICETREE_FLAGS ?= "-R 8 -p 0x3000"
 
 python __anonymous () {
@@ -22,7 +22,7 @@ do_install_append() {
 			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
 			dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
-			install -m 0644 ${DTS_BASE_NAME} ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
+			install -m 0644 ${DTS_BASE_NAME} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
 		done
 	fi
 }
-- 
1.7.0.4


