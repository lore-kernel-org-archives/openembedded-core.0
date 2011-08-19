Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QuX7t-0002Jp-Ti
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 00:01:18 +0200
Received: by gwb11 with SMTP id 11so1897184gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 14:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=sTZEZO4ywGR/Qfj/PUmf8mP+yLgJ27DK35vKZGoUm1E=;
	b=l4x9wyWS7nmShi50ROV84Kg1FEBrXCDsCKSdzqYR3/Q/nZP7gLbimywfrYa6ln3wl/
	lCQOrCA/7i1CWkFyTiw0V1mjv/+Pl8J8bZG1Ssw/Eo9R9DIO+IWX0ri5GDD8vEZXvhXx
	Da1C2LgJUV04JgCIhzK9S7AQvsK5jm2whQKrc=
Received: by 10.236.176.165 with SMTP id b25mr1646306yhm.75.1313790996279;
	Fri, 19 Aug 2011 14:56:36 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id f48sm4310342yhh.56.2011.08.19.14.56.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 14:56:35 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2011 14:56:25 -0700
Message-Id: <1313790985-3332-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1313790985-3332-1-git-send-email-kergoth@gmail.com>
References: <1313790985-3332-1-git-send-email-kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] image_types_uboot: add uboot mkimage fs types
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
X-List-Received-Date: Fri, 19 Aug 2011 22:01:18 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/image_types_uboot.bbclass |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/image_types_uboot.bbclass

diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
new file mode 100644
index 0000000..f08ad8d
--- /dev/null
+++ b/meta/classes/image_types_uboot.bbclass
@@ -0,0 +1,21 @@
+oe_mkimage () {
+    mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} \
+        -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
+}
+
+UBOOT_IMAGE_DEPENDS = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
+
+IMAGE_DEPENDS_ext2.gz.u-boot  = "${UBOOT_IMAGE_DEPENDS}"
+IMAGE_CMD_ext2.gz.u-boot      = "${IMAGE_CMD_ext2.gz}; oe_mkimage ${IMAGE_NAME}.rootfs.ext2.gz"
+IMAGE_DEPENDS_ext2.bz2.u-boot = "${UBOOT_IMAGE_DEPENDS}"
+IMAGE_CMD_ext2.bz2.u-boot     = "${IMAGE_CMD_ext2.bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.ext2.bz2"
+
+IMAGE_DEPENDS_ext3.gz.u-boot  = "${UBOOT_IMAGE_DEPENDS}"
+IMAGE_CMD_ext3.gz.u-boot      = "${IMAGE_CMD_ext3.gz}; oe_mkimage ${IMAGE_NAME}.rootfs.ext3.gz"
+IMAGE_DEPENDS_ext3.bz2.u-boot = "${UBOOT_IMAGE_DEPENDS}"
+IMAGE_CMD_ext3.bz2.u-boot     = "${IMAGE_CMD_ext3.bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.ext3.bz2"
+
+IMAGE_DEPENDS_ext4.gz.u-boot  = "${UBOOT_IMAGE_DEPENDS}"
+IMAGE_CMD_ext4.gz.u-boot      = "${IMAGE_CMD_ext4.gz}; oe_mkimage ${IMAGE_NAME}.rootfs.ext4.gz"
+IMAGE_DEPENDS_ext4.bz2.u-boot = "${UBOOT_IMAGE_DEPENDS}"
+IMAGE_CMD_ext4.bz2.u-boot     = "${IMAGE_CMD_ext4.bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.ext4.bz2"
-- 
1.7.3.2.430.g208247



