Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0544973D46
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 11:12:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 13 Feb 2016 03:12:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,440,1449561600"; d="scan'208";a="902097483"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2016 03:12:42 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 2B0AC6A4004
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 04:00:32 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2016 11:02:19 +0200
Message-Id: <9bc0808d55bd5ba315c55e998ca2d24b288ab4c9.1455353103.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v3 12/14] wic-image-minimal: use uuid for root partition
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
X-List-Received-Date: Sat, 13 Feb 2016 11:12:42 -0000

Used --uuid option to generate PARTUUID for root partion and
gpt partition type. As this image is used in runtime testing
under qemu it makes sense to ensure that this way of specifying
root partition works.

Added dependency to gptfdisk-native to wic-image-minimal recipe to
be able to create gpt partition table.

(From OE-Core rev: ba82867bfda54e86e1de5dc4a6ad7246254cf5c3)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb  | 2 +-
 meta-selftest/recipes-test/images/wic-image-minimal.wks | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index ced22c8..9c50ddb 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -7,7 +7,7 @@ IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"
 IMAGE_FSTYPES = "wic"
 RM_OLD_IMAGE = "1"
 
-DEPENDS = "syslinux syslinux-native parted-native dosfstools-native mtools-native"
+DEPENDS = "syslinux syslinux-native parted-native dosfstools-native mtools-native gptfdisk-native"
 
 # core-image-minimal is referenced in .wks, so we need its rootfs
 # to be ready before our rootfs
diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.wks b/meta-selftest/recipes-test/images/wic-image-minimal.wks
index 191244b..d55075d 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.wks
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.wks
@@ -3,8 +3,8 @@
 # created from core-image-minimal and wic-image-minimal image recipes.
 
 part /boot --source bootimg-pcbios --ondisk vda --label boot --active --align 1024
-part / --source rootfs --ondisk vda --fstype=ext4 --label platform --align 1024
+part / --source rootfs --ondisk vda --fstype=ext4 --label platform --align 1024 --use-uuid
 part /mnt --source rootfs --rootfs-dir=core-image-minimal --ondisk vda --fstype=ext4 --label core --align 1024
 part backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk vda --fstype=ext4 --label backup --align 1024
 
-bootloader --timeout=0  --append="rootwait console=tty0 root=/dev/vda2"
+bootloader --ptable gpt --timeout=0  --append="rootwait console=tty0"
-- 
2.1.4


