Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QgP6Q-0004n8-9p
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 00:37:22 +0200
Received: from mizar.localdomain (87.5.26.241) by smtp207.alice.it (8.5.124.08)
	id 4DFA189A029D56C6; Tue, 12 Jul 2011 00:33:28 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 00:33:11 +0200
Message-Id: <875087494d20aeeb40ddc8b3909a46c272c47537.1310421821.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310421821.git.andrea.adami@gmail.com>
References: <cover.1310421821.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1310421821.git.andrea.adami@gmail.com>
References: <cover.1310421821.git.andrea.adami@gmail.com>
Subject: [PATCH V2 1/2] kernel.bbclass: handle embedding of initramfs images
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
X-List-Received-Date: Mon, 11 Jul 2011 22:37:22 -0000

* "All 2.6 Linux kernels contain a gzipped "cpio" format archive, which is
* extracted into rootfs when the kernel boots up."
* (http://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt)
*
* In some cases it can be useful to take advantage of this ability and embed your
* customized rootfs ("the move to early userspace is necessary because finding
* and mounting the real root device is complex").
*
* Therefore, some code was added and since 2009 OpenEmbedded metadata
* provides a convenient way to include your initramfs by setting
* INITRAMFS_IMAGE = "your_initramfs_image.bb"
* and specifying the chosen output format in the initramfs image recipe, e.g.
* IMAGE_FSTYPES = "cpio.gz cpio.lzma"
*
*
* Patch was imported from the OpenEmbedded git server
* (git://git.openembedded.org/openembedded)
*
* Add satndalone task "builtin_initramfs".
* commit  72761e468bb3e905459f2b81ce1bc4d80419481f
* Signed-off-by:Paul Sokolovsky <pmiscml@gmail.com>
*
* 'Remove usage of non-standard variables (DEPLOY_TO) and random renaming
* of output.'
* commit 456ba7ffd159821e86ad7ad4b66ec7d5790bd054
* Richard Purdie <rpurdie@rpsys.net>
*
* 'Fis typo in do_builtin_initramfs.'
* commit 37f2fe4b801df832e93553a08eff24fec736c7d4
* Signed-off-by:Paul Sokolovsky <pmiscml@gmail.com>
*
* 'comment initramfs stuff till rootfs locking works properly (initramfs
* should be optional as well)'
* commit 2818d8b7be1a0d9a59ad3528091d47517d59328b
* Signed-off-by: Koen Kooi <koen@openembedded.org>
*
* 'get initramfs stuff working
* commit 1642b3e8fc81c666713951fdd4e7ff9a50d1c5a8
* Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
*
* 'Fix INITRAMFS logic to stop breaking builds for people not using it'
* commit dcf3049eb9eedf0838af59969b3f70a43298d3d7
* Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
*
* '-change initramfs-logic'
* commit 3e3f297457138e96e2b652658675796853eb0293
* Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
*
* 'move initramfs stuff to configure so we can do postprocessing
* on it with do_configure_append'
* commit fc03e2be0b4470748a8b7707cea7293303adc424
* Signed-off-by: Koen Kooi <koen@openembedded.org>
*
* 'copy gz, lzo, lzma initramfs cpio images.'
* commit 572abc3fdd1076ca35d8c15d269cc9d862101805
* Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
*
* 'move the kernel size check to linux-kexecboot.inc.'
* commit 45f82a941c77e9d747814fa1e337ba803475d327
* Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
*
* Finally, two refinements as discussed on openembedded-core
* mailing list:
* - replace "if image != '' and image is not None:" with "if image"
* - add cpio.xz support

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/kernel.bbclass |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 943252a..1a71df6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -7,6 +7,8 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod virtual/$
 INHIBIT_DEFAULT_DEPS = "1"
 
 KERNEL_IMAGETYPE ?= "zImage"
+INITRAMFS_IMAGE ?= ""
+INITRAMFS_TASK ?= ""
 
 python __anonymous () {
     kerneltype = bb.data.getVar('KERNEL_IMAGETYPE', d, 1) or ''
@@ -14,6 +16,10 @@ python __anonymous () {
     	depends = bb.data.getVar("DEPENDS", d, 1)
     	depends = "%s u-boot-mkimage-native" % depends
     	bb.data.setVar("DEPENDS", depends, d)
+
+    image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
+    if image:
+    	bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
 }
 
 inherit kernel-arch deploy
@@ -179,8 +185,18 @@ kernel_do_configure() {
 		cp "${WORKDIR}/defconfig" "${S}/.config"
 	fi
         yes '' | oe_runmake oldconfig
+
+	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
+		for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
+		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img"
+			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$i
+		fi
+		done
+	fi
 }
 
+kernel_do_configure[depends] += "${INITRAMFS_TASK}"
+
 do_menuconfig() {
         export DISPLAY='${DISPLAY}'
         export DBUS_SESSION_BUS_ADDRESS='${DBUS_SESSION_BUS_ADDRESS}'
-- 
1.7.3.4



