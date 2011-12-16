Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RbR9D-0007xE-Av
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 07:20:02 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Dec 2011 22:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102849183"
Received: from unknown (HELO localhost) ([10.255.15.170])
	by fmsmga002.fm.intel.com with ESMTP; 15 Dec 2011 22:12:51 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 22:12:31 -0800
Message-Id: <91e14125b3e90601742f705d2556f5f05e20b944.1324015417.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <089ed32e1415e3133606078604acfc20c5423752.1324015417.git.dvhart@linux.intel.com>
References: <089ed32e1415e3133606078604acfc20c5423752.1324015417.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1324015417.git.dvhart@linux.intel.com>
References: <cover.1324015417.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 4/4] bootimg: Use dosfsck to clean up the generated live image
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
X-List-Received-Date: Fri, 16 Dec 2011 06:20:02 -0000

The generated filesystem has some errors that dosfsck is able to repair:

dosfsck 2.11, 12 Mar 2005, FAT32, LFN
Checking file /ldlinux.sys (LDLINUX.SYS)
Checking file /initrd (INITRD)
Checking file /syslinux.cfg (SYSLINUX.CFG)
Checking file /EFI (EFI)
Checking file /vmlinuz (VMLINUZ)
Checking file /rootfs.img (ROOTFS.IMG)
/vmlinuz
  File size is 4144896 bytes, cluster chain length is > 4145152 bytes.
  Truncating file to 4144896 bytes.
Checking file /EFI/.. (..)
Checking file /EFI/BOOT (BOOT)
Checking file /EFI/. (.)
/EFI/..
  Start (16022) does not point to .. (0)
/EFI/.
  Start (0) does not point to parent (16022)
Checking file /EFI/BOOT/.. (..)
Checking file /EFI/BOOT/. (.)
Checking file /EFI/BOOT/initrd (INITRD)
Checking file /EFI/BOOT/grub.cfg (GRUB.CFG)
Checking file /EFI/BOOT/bootia32.efi (BOOTIA32.EFI)
Checking file /EFI/BOOT/vmlinuz (VMLINUZ)
Checking file /EFI/BOOT/rootfs.img (ROOTFS.IMG)
/EFI/BOOT/..
  Start (16021) does not point to .. (16022)
/EFI/BOOT/.
  Start (0) does not point to parent (16021)
/EFI/BOOT/vmlinuz
  File size is 4144896 bytes, cluster chain length is > 4145152 bytes.
  Truncating file to 4144896 bytes.
Performing changes.
/build/poky/fri2/tmp/deploy/images/core-image-minimal-fri2-noemgd-20111216000605.hddimg:
12 files, 26635/26828 clusters

Add a dosfsck command following the mkdosfs command to correct these.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/bootimg.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 0d06351..8ec07a0 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -109,6 +109,7 @@ build_hddimg() {
 
 		mkdosfs -n ${BOOTIMG_VOLUME_ID} -d ${HDDDIR} \
 		        -C ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg $SIZE
+		dosfsck -a -l ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg || true
 
 		if [ "${PCBIOS}" = "1" ]; then
 			syslinux_hddimg_install
-- 
1.7.6.4



