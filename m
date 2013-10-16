Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4302260EAA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 23:03:36 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so694577eek.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 16:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=i1oDsoooNl25yXShAXHtsnPiqYuzijRHXaOcK/Zd5rw=;
	b=tILyjh/mdmwdPjvaO4WKLuFSSJ5/y9qZgje9CtQwO/BtA1VHgUBdZ3eZdpLsZT/mdy
	u7I13pn48BozrXIfsvcyKv9jiJREVZlepGy3VkjvKvBYtCfR2ER6+QU25XBYg3qiRp72
	nyOievO4wvsQtZ5oNwYdcYHgaLwlI4rfR/LSbTqS6XB0CdzAPhi9qFisBIYJ1JfP5h6p
	76Q9p2ym1F5l4Uje08SQ1qhhIgPUFBXj/JtDBTOqt3Mq1uBim6YnGuOTjwH93Dy6dE3y
	bQApm9u+1eFDtZEYqV1vBmm9PGsNhP+QTD0HN3hsW1IEtGOeC2BayfsOxHwvMN04v8UX
	TO2w==
X-Received: by 10.14.201.9 with SMTP id a9mr8435616eeo.28.1381964617307;
	Wed, 16 Oct 2013 16:03:37 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id
	a6sm185127237eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Oct 2013 16:03:36 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 01:03:21 +0200
Message-Id: <1381964601-28226-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH v2] image_types.bbclass: allow JFFS2 image with cleanmarkers
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
X-List-Received-Date: Wed, 16 Oct 2013 23:03:38 -0000

The creation of JFFS2 images was hardcoding the
--no-cleanmarkers option (-n) after those two commits:

70a276509f0f006fcc269296afc3dcc88d2825e1
7c803cea58737ea0abc62cd21c3813d955f07224

The documentation explains that the -n option is
intended for flash NAND only: devices with NOR flash
need the cleanmarkers and should not make use of this option.

To add more flexibility, parametrize the padding size
as well, creating JFFS2_PADSIZE.

Finally, add EXTRA_IMAGE_CMD_jffs2 in explicit form:
sumtool has slightly different options:

 -l  --littleendian
 -p, --pad

To give an idea about size differences:

core-image-base-xxx.rootfs.jffs2     | 16496K
core-image-base-xxx.rootfs.sum.jffs2 | 22816K

core-image-minimal-xxx.rootfs.jffs2     | 6160384
core-image-minimal-xxx.rootfs.sum.jffs2 | 9879552

Patch v.2 fixes generation of sum.jffs2 using JFFS2_PADSIZE

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 9ead059..0def6d7 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -140,9 +140,9 @@ XZ_COMPRESSION_LEVEL ?= "-e -6"
 XZ_INTEGRITY_CHECK ?= "crc32"
 XZ_THREADS ?= "-T 0"
 
-IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n ${EXTRA_IMAGECMD}"
-IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
-	-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 -n ${EXTRA_IMAGECMD}"
+IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_sum.jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD_jffs2} \
+	&& sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
 
@@ -209,9 +209,12 @@ IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_
 EXTRA_IMAGECMD = ""
 
 inherit siteinfo
-JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--little-endian', '--big-endian', d)}"
+JFFS2_PADSIZE ?= ""
+JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
 JFFS2_ERASEBLOCK ?= "0x40000"
-EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
+JFFS2_NOCLEANMARKERS ?= "--no-cleanmarkers"
+EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_PADSIZE} ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} ${JFFS2_NOCLEANMARKERS}"
+EXTRA_IMAGECMD_sum.jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} ${JFFS2_NOCLEANMARKERS}"
 
 # Change these if you want default mkfs behavior (i.e. create minimal inode number)
 EXTRA_IMAGECMD_ext2 ?= "-i 8192"
-- 
1.8.1.5


