Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob09.myregisteredsite.com
	(atl4mhob09.myregisteredsite.com [209.17.115.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4C1B66007B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 10:53:49 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob09.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r79ArnlR000925 for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Aug 2013 06:53:49 -0400
Received: (qmail 2199 invoked by uid 0); 9 Aug 2013 10:53:48 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 9 Aug 2013 10:53:48 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 12:53:39 +0200
Message-Id: <1376045619-27438-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] linux-dtb.inc: Replace /boot/ with /${KERNEL_IMAGEDEST}/
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
X-List-Received-Date: Fri, 09 Aug 2013 10:53:50 -0000

Devicetree files were installed hard-coded in /boot. When KERNEL_IMAGEDEST
is anything else but "boot", the postinstall script and the file locations
no longer match and the postinstall will fail.

Replace "boot" with "${KERNEL_IMAGEDEST}" to fix this problem, and to allow
the devicetree files to be installed in another location.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-kernel/linux/linux-dtb.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 7747718..41dd599 100644
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
1.7.9.5


