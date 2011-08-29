Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qy6DF-0007lu-GC
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 20:05:33 +0200
Received: by gyg4 with SMTP id 4so4601257gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 11:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=yPfhggN8zrf+Pa1Z7mXXamKbIe+C3HYThoLcrxcKalA=;
	b=a9UARqMAK9NtYFTLW69D6RwZXTm0tHoHcMpe5Lk+GleC8K5mvYYGZ3IIr1SgYEvxWY
	yiL6rA+qTqEVvYgbtM5vOHmX9JYU/Xtv7C2x2IusmuzC9XlD20ALDrPQDlUBOG6f6Xb0
	PJhUus+NYuMQvUxlIB3actrHPvU13YXv+WLxc=
Received: by 10.236.181.226 with SMTP id l62mr13786246yhm.2.1314640837983;
	Mon, 29 Aug 2011 11:00:37 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id x42sm199458yhm.79.2011.08.29.11.00.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 11:00:37 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2011 11:00:29 -0700
Message-Id: <1314640829-28570-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1314640829-28570-1-git-send-email-kergoth@gmail.com>
References: <1314640829-28570-1-git-send-email-kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] image_types_uboot: fix a number of issues
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
X-List-Received-Date: Mon, 29 Aug 2011 18:05:33 -0000

From: Chris Larson <chris_larson@mentor.com>

- Don't use a variable reference in the IMAGE_DEPENDS
- Inherit kernel-arch to get UBOOT_ARCH
- Don't include the .bz2 variants, since the base types aren't in
  oe-core
- Add the new types to IMAGE_TYPES
- Inherit image_types, to be certain we load after it

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/image_types_uboot.bbclass |   25 ++++++++++++-------------
 1 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index f08ad8d..10fa2f7 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -1,21 +1,20 @@
+inherit image_types kernel-arch
+
 oe_mkimage () {
     mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} \
         -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
 }
 
-UBOOT_IMAGE_DEPENDS = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
+IMAGE_DEPENDS_ext2.gz.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
+IMAGE_CMD_ext2.gz.u-boot      = "${IMAGE_CMD_ext2.gz} \
+                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext2.gz"
 
-IMAGE_DEPENDS_ext2.gz.u-boot  = "${UBOOT_IMAGE_DEPENDS}"
-IMAGE_CMD_ext2.gz.u-boot      = "${IMAGE_CMD_ext2.gz}; oe_mkimage ${IMAGE_NAME}.rootfs.ext2.gz"
-IMAGE_DEPENDS_ext2.bz2.u-boot = "${UBOOT_IMAGE_DEPENDS}"
-IMAGE_CMD_ext2.bz2.u-boot     = "${IMAGE_CMD_ext2.bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.ext2.bz2"
+IMAGE_DEPENDS_ext3.gz.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
+IMAGE_CMD_ext3.gz.u-boot      = "${IMAGE_CMD_ext3.gz} \
+                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext3.gz"
 
-IMAGE_DEPENDS_ext3.gz.u-boot  = "${UBOOT_IMAGE_DEPENDS}"
-IMAGE_CMD_ext3.gz.u-boot      = "${IMAGE_CMD_ext3.gz}; oe_mkimage ${IMAGE_NAME}.rootfs.ext3.gz"
-IMAGE_DEPENDS_ext3.bz2.u-boot = "${UBOOT_IMAGE_DEPENDS}"
-IMAGE_CMD_ext3.bz2.u-boot     = "${IMAGE_CMD_ext3.bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.ext3.bz2"
+IMAGE_DEPENDS_ext4.gz.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
+IMAGE_CMD_ext4.gz.u-boot      = "${IMAGE_CMD_ext4.gz} \
+                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext4.gz"
 
-IMAGE_DEPENDS_ext4.gz.u-boot  = "${UBOOT_IMAGE_DEPENDS}"
-IMAGE_CMD_ext4.gz.u-boot      = "${IMAGE_CMD_ext4.gz}; oe_mkimage ${IMAGE_NAME}.rootfs.ext4.gz"
-IMAGE_DEPENDS_ext4.bz2.u-boot = "${UBOOT_IMAGE_DEPENDS}"
-IMAGE_CMD_ext4.bz2.u-boot     = "${IMAGE_CMD_ext4.bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.ext4.bz2"
+IMAGE_TYPES += "ext2.gz.u-boot ext3.gz.u-boot ext4.gz.u-boot"
-- 
1.7.3.2.430.g208247



