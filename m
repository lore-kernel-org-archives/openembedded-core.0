Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 131756E008
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 12:06:44 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hi5so8438307wib.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 04:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=zSjM+6IuMY2bB4S9A0QZBRguesmP12eQLb7PC82m71s=;
	b=Ao/pX1G8oCsY5p3rZLBXJS/KAWT7EoZeOuAM6I0BwgxtT5gcD1hjtpJbzg/qbNrX2o
	46MQE5Fi6q1uwog/ODLr92akFQ/g5EdfplO1CqrH9P6yy4GiuV9uSqcySfCr/13y1Ill
	/GOg+G9xwmcQEuptHf5qI3rdErua16dR4K8dqnQUJGFYSOaOGbG1NCijHT5u2CEwIjOW
	rOUpU0Yv6w8Z/RaCKquiC4Pfwt7Uk3tDIqi0IznnnRp1mnuVja2qxaFzA/C6iv9yRL3a
	+tviP6LNzX7AHHNZlubT50/sQQg8pLD43+8b8zVdMrtSXxXBa4b5DcQbKfybmElvun4o
	bGUQ==
X-Received: by 10.194.175.202 with SMTP id cc10mr1041680wjc.48.1392293205620; 
	Thu, 13 Feb 2014 04:06:45 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id
	z1sm4044172wjq.19.2014.02.13.04.06.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Feb 2014 04:06:45 -0800 (PST)
Sender: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 16:06:22 +0400
Message-Id: <1392293182-7483-2-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <1392293182-7483-1-git-send-email-dmitry_eremin@mentor.com>
References: <1392293182-7483-1-git-send-email-dmitry_eremin@mentor.com>
Subject: [PATCH 2/2] image_types: sum.jffs2 is replaced by jffs2.sum
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
X-List-Received-Date: Thu, 13 Feb 2014 12:06:45 -0000

Previous commit added support for sum 'compression' (rather
postprocessing) of jffs2 images. Drop support for sum.jffs2 image type.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta/classes/image_types.bbclass | 4 +---
 meta/lib/oe/image.py             | 3 ---
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index be56abb..0467abd 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -35,7 +35,6 @@ XZ_THREADS ?= "-T 0"
 
 JFFS2_SUM_EXTRA_ARGS ?= ""
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
-IMAGE_CMD_sum.jffs2 = "sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
 
@@ -116,7 +115,6 @@ EXTRA_IMAGECMD_elf ?= ""
 
 IMAGE_DEPENDS = ""
 IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
-IMAGE_DEPENDS_sum.jffs2 = "mtd-utils-native"
 IMAGE_DEPENDS_cramfs = "util-linux-native"
 IMAGE_DEPENDS_ext2 = "e2fsprogs-native"
 IMAGE_DEPENDS_ext3 = "e2fsprogs-native"
@@ -129,7 +127,7 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 jffs2.sum sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz tar.lz4 cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 vmdk elf"
+IMAGE_TYPES = "jffs2 jffs2.sum cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz tar.lz4 cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 vmdk elf"
 
 COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 54f7c84..c15296f 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -102,9 +102,6 @@ class Image(object):
         # been created, so we add that explicit ordering here.
         addtypedepends("elf", "cpio.gz")
 
-        # jffs2 sumtool'd images need jffs2
-        addtypedepends("sum.jffs2", "jffs2")
-
         # Filter out all the compressed images from alltypes
         for type in alltypes:
             basetype = None
-- 
1.8.5.2


