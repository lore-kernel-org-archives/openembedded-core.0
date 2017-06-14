Return-Path: <yin.thong.choong@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 401297836E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 06:16:50 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 23:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,342,1493708400"; d="scan'208";a="114661297"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga005.fm.intel.com with ESMTP; 14 Jun 2017 23:16:51 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 16:05:58 -0700
Message-Id: <1497481558-144957-2-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497481558-144957-1-git-send-email-yin.thong.choong@intel.com>
References: <1497481558-144957-1-git-send-email-yin.thong.choong@intel.com>
Cc: otc-pg-team@eclists.intel.com, paul.eggleton@intel.com, saul.wold@intel.com
Subject: [PATCH v2] image_types.bbclass: Added default argument for ubi and ubifs image creation
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
X-List-Received-Date: Thu, 15 Jun 2017 06:16:51 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Added default argument for ubi and ubifs image creation.
MKUBIFS_ARGS and UBINIZE_ARGS both argument still able to
edit in local.conf

[YOCTO #11589]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 meta/classes/image_types.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 7749b00..bbde08d 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -292,3 +292,12 @@ IMAGE_EXTENSION_live = "hddimg iso"
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
 # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""
+
+# Default argument to create ubi and ubifs image with core-image-sato-sdk (http://www.linux-mtd.infradead.org/faq/ubifs.html)
+# -m 2048: tells mkfs.ubifs that the minimum input/output unit size of the flash this UBIFS image is created for is 2048 bytes (NAND page in this case);
+# -e 129024: logical eraseblock size of the UBI volume this image is created for;
+# -c 8749: specifies maximum file-system size in logical eraseblocks; this means that it will be possible to use the resulting file-system on volumes up to this size (less or equivalent); so in this particular case, the resulting FS may be put on volumes up to about 251MiB (129024 multiplied by 2047); See this section for more details.
+# -p 128KiB: tells ubinize that physical eraseblock size of the flash chip the UBI image is created for is 128KiB (128 * 1024 bytes);
+# -s 512: tells ubinize that the flash supports sub-pages and sub-page size is 512 bytes; ubinize will take this into account and put the VID header to the same NAND page as the EC header.
+MKUBIFS_ARGS ??= " -m 2048 -e 129024 -c 8749 "
+UBINIZE_ARGS ??= " -p 128KiB -m 2048 -s 512 "
-- 
2.7.4


