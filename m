Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrG-0004iK-1t
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752221"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:42 -0800
Message-Id: <72497ee9d053a8cd586b4442310e0a2965a053f2.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 056/113] image_types: Ensure /init exists for cpio rootfs archives
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:27 -0000

From: Darren Hart <dvhart@linux.intel.com>

In order for the kernel to accept an initramfs as a rootfs,
it must have /init - even if it is an empty file. Touch /init
to ensure it exists for cpio and cpio.gz image types.

When used with initrd and rootfs=/dev/ram0, this allows the
cpio and cpio.gz images to be used as the rootfs.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/image_types.bbclass |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 6893e38..ebff0ba 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -110,8 +110,14 @@ IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME
 IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.gz ."
 IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
 IMAGE_CMD_tar.xz = "cd ${IMAGE_ROOTFS} && tar --xz -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
-IMAGE_CMD_cpio = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)"
-IMAGE_CMD_cpio.gz = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)"
+IMAGE_CMD_cpio () {
+	touch ${IMAGE_ROOTFS}/init
+	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
+}
+IMAGE_CMD_cpio.gz () {
+	touch ${IMAGE_ROOTFS}/init
+	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)
+}
 IMAGE_CMD_cpio.xz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz --format=lzma -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
 
-- 
1.7.6.4



