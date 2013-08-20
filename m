Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob07.myregisteredsite.com
	(atl4mhob07.myregisteredsite.com [209.17.115.45])
	by mail.openembedded.org (Postfix) with ESMTP id 08F406B8B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 10:02:47 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob07.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r7KA2mRl015751 for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 06:02:48 -0400
Received: (qmail 19205 invoked by uid 0); 20 Aug 2013 10:02:48 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 20 Aug 2013 10:02:47 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 12:02:36 +0200
Message-Id: <1376992956-20972-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] linux-dtb: Fix compilation failure in install and deploy phases
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
X-List-Received-Date: Tue, 20 Aug 2013 10:02:48 -0000

Baking a kernel failed on the devicetree creation. This was caused
by the install and deploy scripts referring to the wrong directory
for the dtb files.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-kernel/linux/linux-dtb.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index cebc76a..65e61eb 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -16,7 +16,7 @@ do_install_append() {
 			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			oe_runmake ${DTB}
-			install -m 0644 ${B}/arch/${ARCH}/boot/${DTB} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
+			install -m 0644 ${B}/arch/${ARCH}/boot/dts/${DTB} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
 		done
 	fi
 }
@@ -32,7 +32,7 @@ do_deploy_append() {
 			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			install -d ${DEPLOYDIR}
-			install -m 0644 ${B}/arch/${ARCH}/boot/${DTB} ${DEPLOYDIR}/${DTB_NAME}.dtb
+			install -m 0644 ${B}/arch/${ARCH}/boot/dts/${DTB} ${DEPLOYDIR}/${DTB_NAME}.dtb
 			cd ${DEPLOYDIR}
 			ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
 			cd -
-- 
1.7.9.5


