Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RqJaZ-0001Qi-DQ
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 08:17:43 +0100
Received: from mizar.localdomain (79.24.249.251) by smtp205.alice.it
	(8.6.023.02) id 4EECA2D8058F8629; Thu, 26 Jan 2012 08:09:55 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 08:09:50 +0100
Message-Id: <1327561790-10307-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 2/2] image_types.bbclass: refactor cpio images generation.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2012 07:17:43 -0000

* Add common check for the presence of an /init
* symlink, being 'touch' would fail with it
* and 'touch -h' is not yet generally supported
* (depends on distro on build host).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass |   21 +++++++++++++++++----
 1 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 4908ed9..eef554d 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -115,16 +115,29 @@ IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME
 IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.gz ."
 IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
 IMAGE_CMD_tar.xz = "cd ${IMAGE_ROOTFS} && tar --xz -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
-IMAGE_CMD_cpio () {
+
+CPIO_TOUCH_INIT () {
+	if [ ! -L ${IMAGE_ROOTFS}/init ]
+	then
 	touch ${IMAGE_ROOTFS}/init
+	fi
+}
+IMAGE_CMD_cpio () {
+	${CPIO_TOUCH_INIT}
 	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 }
 IMAGE_CMD_cpio.gz () {
-	touch ${IMAGE_ROOTFS}/init
+	${CPIO_TOUCH_INIT}
 	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)
 }
-IMAGE_CMD_cpio.xz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
-IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz --format=lzma -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
+IMAGE_CMD_cpio.xz () {
+	${CPIO_TOUCH_INIT}
+	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}
+}
+IMAGE_CMD_cpio.lzma () {
+	${CPIO_TOUCH_INIT}
+	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz --format=lzma -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}
+}
 
 UBI_VOLNAME ?= "${MACHINE}-rootfs"
 
-- 
1.7.3.4



