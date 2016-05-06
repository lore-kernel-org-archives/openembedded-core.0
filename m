Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8F65B75CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 17:18:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 06 May 2016 10:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,587,1455004800"; d="scan'208";a="974219218"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 06 May 2016 10:18:45 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id D20566A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 11:06:18 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 May 2016 17:58:44 +0300
Message-Id: <12d026cae11879d8c8193f09a67a9ba1f9c31cc5.1462545440.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462545440.git.ed.bartosh@linux.intel.com>
References: <cover.1462545440.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462545440.git.ed.bartosh@linux.intel.com>
References: <cover.1462545440.git.ed.bartosh@linux.intel.com>
Subject: [RFC][PATCH 1/7] image_types: add support for zip compression
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
X-List-Received-Date: Fri, 06 May 2016 17:18:46 -0000

From: Patrick Ohly <patrick.ohly@intel.com>

Support for the other compression format is not always readily
available on all OSes. Using zip instead of, say, xz is less
efficient, but perhaps more user-friendly for users on such OSes.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 53af7ca..d13bdf5 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -42,6 +42,8 @@ XZ_COMPRESSION_LEVEL ?= "-e -6"
 XZ_INTEGRITY_CHECK ?= "crc32"
 XZ_THREADS ?= "-T 0"
 
+ZIP_COMPRESSION_LEVEL ?= "-9"
+
 JFFS2_SUM_EXTRA_ARGS ?= ""
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2 ${EXTRA_IMAGECMD}"
 
@@ -262,12 +264,13 @@ IMAGE_TYPES = " \
     wic wic.gz wic.bz2 wic.lzma \
 "
 
-COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum"
+COMPRESSIONTYPES = "gz bz2 lzma xz lz4 zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 COMPRESS_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
 COMPRESS_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
+COMPRESS_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 COMPRESS_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
 COMPRESS_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
 COMPRESS_CMD_sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
@@ -280,6 +283,7 @@ COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = "pbzip2-native"
 COMPRESS_DEPENDS_xz = "xz-native"
 COMPRESS_DEPENDS_lz4 = "lz4-native"
+COMPRESS_DEPENDS_zip = "zip-native"
 COMPRESS_DEPENDS_sum = "mtd-utils-native"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
-- 
2.1.4


