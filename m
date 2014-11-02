Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-04.prod.phx3.secureserver.net
	(p3plsmtpa08-04.prod.phx3.secureserver.net [173.201.193.105])
	by mail.openembedded.org (Postfix) with ESMTP id A59D1706B0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Nov 2014 10:48:44 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa08-04.prod.phx3.secureserver.net with 
	id Aaoj1p0080BVjqb01aolWj; Sun, 02 Nov 2014 03:48:45 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Nov 2014 04:48:38 -0600
Message-Id: <1414925318-15353-3-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1414925318-15353-1-git-send-email-pab@pabigot.com>
References: <1414925318-15353-1-git-send-email-pab@pabigot.com>
Subject: [PATCH 2/2] image_types.bbclass: add tar --numeric-owner support
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
X-List-Received-Date: Sun, 02 Nov 2014 10:48:48 -0000

tar format normally stores user and group as names, which is the right
thing to use when target passwd and group files are available.  When
unpacking a rootfs archive onto a mounted SD card partition on a build
host outside the pseudo environment the host passwd/group files will be
used for name-to-id mapping, which results in mis-assigned identifiers
(often for important ids like messagebus).

Using IMAGE_FSTYPES += "nug.tar" creates rootfs.nug.tar files where the
owner and group are specified numerically, using the target IDs obtained
when the archive is built under pseudo.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/classes/image_types.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 42d7231..50657ab 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -65,6 +65,7 @@ IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAM
 IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
 IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
 IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAGE_ROOTFS} ."
+IMAGE_CMD_nug.tar = "tar --numeric-owner -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.nug.tar -C ${IMAGE_ROOTFS} ."
 
 IMAGE_CMD_cpio () {
 	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
@@ -139,6 +140,7 @@ IMAGE_TYPES = " \
     squashfs squashfs-xz squashfs-lzo \
     ubi ubifs \
     tar tar.gz tar.bz2 tar.xz tar.lz4 \
+    nug.tar nug.tar.gz nug.tar.bz2 nug.tar.xz nug.tar.lz4 \
     cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
     vmdk \
     elf \
-- 
1.8.5.5


