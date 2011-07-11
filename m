Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QgP6S-0004n8-9S
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 00:37:24 +0200
Received: from mizar.localdomain (87.5.26.241) by smtp207.alice.it (8.5.124.08)
	id 4DFA189A029D56E1; Tue, 12 Jul 2011 00:33:30 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 00:33:12 +0200
Message-Id: <deaac6d54e6c6b53e5d70ade8e3345979482720c.1310421821.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310421821.git.andrea.adami@gmail.com>
References: <cover.1310421821.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1310421821.git.andrea.adami@gmail.com>
References: <cover.1310421821.git.andrea.adami@gmail.com>
Subject: [PATCH V2 2/2] image_types.bbclass: add support for tar.xz, cpio.xz, cpio.lzma
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
X-List-Received-Date: Mon, 11 Jul 2011 22:37:24 -0000

* Once we add support for building kernel containing initramfs images
* we expect compressed cpio archives.
* Thus, add support for lzma and xz compressors for the initramfs images.
* While there, add support for tar.xz as done in org.openembedded.dev.
*
* Patch was imported from the OpenEmbedded git server
* (git://git.openembedded.org/openembedded)
*
* 'bitbake.conf: add cpio and ext4 .xz support'
* commit 7977d3325a09e2edf4a8a1b02f48085f88f7a631
* Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
*
* 'bitbake.conf: Define tar.xz image types.'
* 1fca8dc50a821f4589fa5e339e6e279dd3c0dafe 
* Signed-off-by: Tom Rini <tom_rini@mentor.com>	
*
* 'bitbake.conf: add XZ_INTEGRITY_CHECK and LZMA_COMPRESSION_LEVEL variables'
* commit 312b42bcf2cc9b11266ba497ade68e8ddabb3007
* Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
*
* 'bitbake.conf: unbreak and improve lzma image compression handling and adapt
* linux-kexecboot.inc'
* commit c382a9ce64bf4291572665652138aa01b2e54306
* Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
* Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8c86227..89a745c 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -20,6 +20,10 @@ runimagecmd () {
 	ln -s ${IMAGE_NAME}.rootfs.${type} ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
 }
 
+
+XZ_COMPRESSION_LEVEL ?= "-e -9"
+XZ_INTEGRITY_CHECK ?= "crc32"
+
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
@@ -55,8 +59,12 @@ IMAGE_CMD_squashfs-lzma = "mksquashfs-lzma ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/$
 IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
 IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.gz ."
 IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
+IMAGE_CMD_tar.xz = "cd ${IMAGE_ROOTFS} && tar --xz -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
 IMAGE_CMD_cpio = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)"
 IMAGE_CMD_cpio.gz = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)"
+IMAGE_CMD_cpio.xz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
+IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz --format=lzma -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
+
 IMAGE_CMD_ubi () {
 	echo \[ubifs\] > ubinize.cfg 
 	echo mode=ubi >> ubinize.cfg
@@ -88,6 +96,9 @@ IMAGE_DEPENDS_ext3.gz = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
+IMAGE_DEPENDS_tar.xz = "tar-native xz-native"
+IMAGE_DEPENDS_cpio.lzma = "xz-native"
+IMAGE_DEPENDS_cpio.xz = "xz-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
-- 
1.7.3.4



