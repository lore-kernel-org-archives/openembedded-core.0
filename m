Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id D05716BDFB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 23:23:28 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so559862eak.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=AAl8sKRIbKFUOcTxaLkSZ1NRFB08POl2X971MyXE9qA=;
	b=fmslHpuz9wWBRs+RqGy0WrMHwsSC+qdzHGgto2w+vG11odY+vMDsG5V3j9aAbILDM4
	sWWgawneond6FbnjOChXn+fpQxfWNQdy7tqr4mZxQ6ZHTQBl5F+6bRAjHQBm9bgnECZ0
	/L3qC7Q3Vd3MORfPi6XM37JI0WA4iHhfjrbzl3FsZp71RLKTADII+MpGJJiNsmXOgK54
	QYLdChvwti4fouhRRk4Vv032U5ngxKfkQRiVGnktL0fMUSv9OvNuxKef7abW+HNGrXTW
	bITcNI4aonVdRntkSEINo5EjTpAVqXj7XlUKIlvi38W/DC3lb0THRWp3FbVUE8Agd2iQ
	I8lA==
X-Received: by 10.14.108.9 with SMTP id p9mr7615731eeg.8.1377818609303;
	Thu, 29 Aug 2013 16:23:29 -0700 (PDT)
Received: from mizar.localdomain
	(host202-221-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.221.202])
	by mx.google.com with ESMTPSA id d8sm50007881eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 16:23:28 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2013 01:23:20 +0200
Message-Id: <ce78e9945195972dbe873d803f3abc67a2cad471.1377818011.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1377818011.git.andrea.adami@gmail.com>
References: <cover.1377818011.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1377818011.git.andrea.adami@gmail.com>
References: <cover.1377818011.git.andrea.adami@gmail.com>
Subject: [PATCH 2/2] image_types.bbclass: use mkfs.cramfs instead of makecramfs
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
X-List-Received-Date: Thu, 29 Aug 2013 23:23:29 -0000

The former is provided by util-linux and the latter is
now to be removed for meta-filesystems.

This allows to generate cramfs images whithout extra layers.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index c168ed5..8c49169 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -139,7 +139,7 @@ IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLO
 IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
 	-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 -n ${EXTRA_IMAGECMD}"
 
-IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
+IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
 
 oe_mkext234fs () {
 	fstype=$1
@@ -218,7 +218,7 @@ EXTRA_IMAGECMD_elf ?= ""
 IMAGE_DEPENDS = ""
 IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
 IMAGE_DEPENDS_sum.jffs2 = "mtd-utils-native"
-IMAGE_DEPENDS_cramfs = "cramfs-native"
+IMAGE_DEPENDS_cramfs = "util-linux-native"
 IMAGE_DEPENDS_ext2 = "e2fsprogs-native"
 IMAGE_DEPENDS_ext3 = "e2fsprogs-native"
 IMAGE_DEPENDS_ext4 = "e2fsprogs-native"
-- 
1.8.1.5


