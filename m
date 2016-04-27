Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DADED73204
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 11:56:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 27 Apr 2016 04:56:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,541,1455004800"; d="scan'208";a="941250341"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2016 04:56:57 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 599F76A4008
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 05:44:33 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 12:36:31 +0300
Message-Id: <38028bb45db4860a801be78c5fcd165b1e9872ee.1461749328.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461749328.git.ed.bartosh@linux.intel.com>
References: <cover.1461749328.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461749328.git.ed.bartosh@linux.intel.com>
References: <cover.1461749328.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 2/3] image types: add bmap generation option
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
X-List-Received-Date: Wed, 27 Apr 2016 11:56:58 -0000

From: "Alexander D. Kanevskiy" <kad@kad.name>

bmap image conversion type allows to create block map files
for sparse images. Bmap file can be used together with bmap-tools
for efficiently flash images to raw devices (hdd or usb drive)

[YOCTO #9414]

Signed-off-by: Alexander D. Kanevskiy <kad@kad.name>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 53af7ca..19f89f3 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -262,7 +262,7 @@ IMAGE_TYPES = " \
     wic wic.gz wic.bz2 wic.lzma \
 "
 
-COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum"
+COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 COMPRESS_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
@@ -275,12 +275,14 @@ COMPRESS_CMD_sha224sum = "sha224sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
 COMPRESS_CMD_sha256sum = "sha256sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum"
 COMPRESS_CMD_sha384sum = "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
 COMPRESS_CMD_sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
+COMPRESS_CMD_bmap = "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = "pbzip2-native"
 COMPRESS_DEPENDS_xz = "xz-native"
 COMPRESS_DEPENDS_lz4 = "lz4-native"
 COMPRESS_DEPENDS_sum = "mtd-utils-native"
+COMPRESS_DEPENDS_bmap = "bmap-tools-native"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
-- 
2.1.4


