Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id F40F178441
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 22:05:23 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id y8so1415125ywi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 15:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iL58NY6TSWQaUoZEPWk1ta8um2qjrLtm2A3QjiBNNnE=;
	b=Y191yInsuNLh1XQnFAbcKumfNpg7jJVZVv5oO5i2lId6WgXNCwSD1YhPMFq0hgTSR/
	JRhyVrTuELiOXHD5zpyrdHEKMdWAx/5GZcuROkL5vuTHNFgzyXoMZGtNChqXGzLnZGXM
	RHD4JMRRmgHTYnFBWYSlELvLZ+5Rg7Lkplo0l+FcgxLUEdZF/SkAyBigOcV5FIrL0J/j
	qd5JMfeZPccie/hjqnkeilDCoBFIuRiJbZLjXW5zy92kqG/jbQCBksSNUzAkxP4DmGF/
	VXOoqyCdQlQAQKJwc7kzO30sne3n97bZ3s6ExusZKzEHRtaHYRs+AJGP22BA+g6wlzBB
	YUtA==
X-Gm-Message-State: AIVw112mlzZc7V3Ifl8Z3BpUjtN1gq+3OpnGP6U/XkeBcJX60cKnhmiL
	U1POSu8YODGMSoTv
X-Received: by 10.13.228.193 with SMTP id n184mr7176474ywe.98.1500674724593;
	Fri, 21 Jul 2017 15:05:24 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58])
	by smtp.gmail.com with ESMTPSA id p5sm2061427ywl.48.2017.07.21.15.05.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Jul 2017 15:05:24 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 18:06:34 -0400
Message-Id: <1500674794-23258-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500674794-23258-1-git-send-email-trini@konsulko.com>
References: <1500674794-23258-1-git-send-email-trini@konsulko.com>
Subject: [PATCH 2/2] image_types.bbclass: Make u-boot signed images more versatile
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
X-List-Received-Date: Fri, 21 Jul 2017 22:05:24 -0000

With the introduction of chaining compression/conversion support we can
convert the old image_types_uboot.bbclass code that did a hand-chaining
of a set of ${filesystem}.${compression} into generic and arbitrary
support to sign whatever the user wants to sign for their image.

This, for the record, does remove setting a valid compression type in
the record in favour of just saying none.  This is not a generally
useful feature in U-Boot and I believe being versatile in terms of being
able to pass in arbitrary compressions is more important.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/classes/image.bbclass             |  9 ---------
 meta/classes/image_types.bbclass       |  6 ++++--
 meta/classes/image_types_uboot.bbclass | 29 -----------------------------
 3 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 meta/classes/image_types_uboot.bbclass

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index bd6a5b7b810a..b095bca7c12a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -144,15 +144,6 @@ inherit ${IMAGE_TYPE_vm}
 IMAGE_TYPE_container = '${@bb.utils.contains("IMAGE_FSTYPES", "container", "image-container", "", d)}'
 inherit ${IMAGE_TYPE_container}
 
-def build_uboot(d):
-    if 'u-boot' in (d.getVar('IMAGE_FSTYPES') or ''):
-        return "image_types_uboot"
-    else:
-        return ""
-
-IMAGE_TYPE_uboot = "${@build_uboot(d)}"
-inherit ${IMAGE_TYPE_uboot}
-
 IMAGE_TYPE_wic = "image_types_wic"
 inherit ${IMAGE_TYPE_wic}
 
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8f8d79cd3d70..4fdcde25b4f5 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -214,7 +214,7 @@ IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME
 
 EXTRA_IMAGECMD = ""
 
-inherit siteinfo
+inherit siteinfo kernel-arch
 JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
 JFFS2_ERASEBLOCK ?= "0x40000"
 EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
@@ -269,7 +269,7 @@ IMAGE_TYPES = " \
 # CONVERSION_CMD/DEPENDS.
 COMPRESSIONTYPES ?= ""
 
-CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap ${COMPRESSIONTYPES}"
+CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot ${COMPRESSIONTYPES}"
 CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
@@ -286,6 +286,7 @@ CONVERSION_CMD_sha256sum = "sha256sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
 CONVERSION_CMD_sha384sum = "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
 CONVERSION_CMD_sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
 CONVERSION_CMD_bmap = "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
+CONVERSION_CMD_u-boot = "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot"
 CONVERSION_DEPENDS_lzma = "xz-native"
 CONVERSION_DEPENDS_gz = "pigz-native"
 CONVERSION_DEPENDS_bz2 = "pbzip2-native"
@@ -295,6 +296,7 @@ CONVERSION_DEPENDS_lzo = "lzop-native"
 CONVERSION_DEPENDS_zip = "zip-native"
 CONVERSION_DEPENDS_sum = "mtd-utils-native"
 CONVERSION_DEPENDS_bmap = "bmap-tools-native"
+CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
deleted file mode 100644
index 8db436efb14b..000000000000
--- a/meta/classes/image_types_uboot.bbclass
+++ /dev/null
@@ -1,29 +0,0 @@
-inherit image_types kernel-arch
-
-oe_mkimage () {
-    mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_NAME} \
-        -d ${IMGDEPLOYDIR}/$1 ${IMGDEPLOYDIR}/$1.u-boot
-}
-
-CONVERSIONTYPES += "gz.u-boot bz2.u-boot lz4.u-boot lzma.u-boot lzo.u-boot u-boot"
-
-CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
-CONVERSION_CMD_u-boot      = "oe_mkimage ${IMAGE_NAME}.rootfs.${type} none"
-
-CONVERSION_DEPENDS_gz.u-boot = "u-boot-mkimage-native"
-CONVERSION_CMD_gz.u-boot      = "${CONVERSION_CMD_gz}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.gz gzip"
-
-CONVERSION_DEPENDS_bz2.u-boot = "u-boot-mkimage-native"
-CONVERSION_CMD_bz2.u-boot      = "${CONVERSION_CMD_bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.bz2 bzip2"
-
-CONVERSION_DEPENDS_lz4.u-boot = "u-boot-mkimage-native"
-CONVERSION_CMD_lz4.u-boot      = "${CONVERSION_CMD_lz4_legacy}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lz4 lz4"
-
-CONVERSION_DEPENDS_lzma.u-boot = "u-boot-mkimage-native"
-CONVERSION_CMD_lzma.u-boot      = "${CONVERSION_CMD_lzma}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzma lzma"
-
-CONVERSION_DEPENDS_lzo.u-boot = "u-boot-mkimage-native"
-CONVERSION_CMD_lzo.u-boot      = "${CONVERSION_CMD_lzo}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzo lzo"
-
-IMAGE_TYPES += "ext2.u-boot ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot cpio.gz.u-boot"
-
-- 
1.9.1


