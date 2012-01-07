Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjK2G-0003jC-G6
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 01:21:26 +0100
Received: from mizar.localdomain (79.16.253.172) by smtp205.alice.it
	(8.6.023.02) id 4EECA2D803021498; Sat, 7 Jan 2012 01:14:00 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat,  7 Jan 2012 01:13:56 +0100
Message-Id: <1325895236-22987-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] kexec-tools: split packaging of kexec and kdump
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
X-List-Received-Date: Sat, 07 Jan 2012 00:21:26 -0000

* from meta-oe (originally from org.openembedded.dev)
* There are no reasons to install kdump when only kexec is needed.
*
* In oe-core/meta there are no references to kexec-tools so
* the recipes inn external layers rdepending on kexec-tools should be
* fixed and rdepend on kexec and/or kdump.
*
* Bump PR.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass               |    4 ++--
 meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb |    7 ++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 3010549..2df424c 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -111,11 +111,11 @@ IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_
 IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
 IMAGE_CMD_tar.xz = "cd ${IMAGE_ROOTFS} && tar --xz -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
 IMAGE_CMD_cpio () {
-	touch ${IMAGE_ROOTFS}/init
+	touch -h ${IMAGE_ROOTFS}/init
 	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 }
 IMAGE_CMD_cpio.gz () {
-	touch ${IMAGE_ROOTFS}/init
+	touch -h ${IMAGE_ROOTFS}/init
 	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)
 }
 IMAGE_CMD_cpio.xz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
index caed816..8d2e606 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
@@ -2,8 +2,13 @@ require kexec-tools.inc
 export LDFLAGS = "-L${STAGING_LIBDIR}"
 EXTRA_OECONF = " --with-zlib=yes"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += " file://fix_for_compiling_with_gcc-4.6.0.patch"
 SRC_URI[md5sum] = "bc401cf3262b25ff7c9a51fc76c8ab91"
 SRC_URI[sha256sum] = "549ab65c18a2229b6bf21b6875ca6bbe0e579bca08c3543ce6aaf8287a0b4188"
+
+PACKAGES =+ "kexec kdump"
+
+FILES_kexec = "${sbindir}/kexec"
+FILES_kdump = "${sbindir}/kdump"
-- 
1.7.3.4



