Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHVcS-0000u1-Vh
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 09:36:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 00:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130584248"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 00:26:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:26:33 -0700
Message-Id: <a37e07d02a43a6d6a2c657161d257aea99b55a6a.1334042473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL [v2] 06/14] grub-efi: Include GPT partition EXT FS support
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
X-List-Received-Date: Tue, 10 Apr 2012 07:36:05 -0000

From: Darren Hart <dvhart@linux.intel.com>

Fixes [YOCTO 2257]

GPT partitions are common for EFI systems. Add support for them by
including the part_gpt partition module in the grub-efi image. In
order to allow for loading a Linux kernel from an EXT* filesystem,
include the ext2 module as well.

With this fix applied, I was able to boot from a USB key using a
GPT partition table with the following layout:

  $ sudo gdisk -l /dev/sdc
  GPT fdisk (gdisk) version 0.8.2

  Partition table scan:
    MBR: protective
    BSD: not present
    APM: not present
    GPT: present

  Found valid GPT with protective MBR; using GPT.
  Disk /dev/sdc: 7669824 sectors, 3.7 GiB
  Logical sector size: 512 bytes
  Disk identifier (GUID): 68FA7CD4-E0C3-4A8E-82B5-1331C9B17A3C
  Partition table holds up to 128 entries
  First usable sector is 34, last usable sector is 7669790
  Partitions will be aligned on 2-sector boundaries
  Total free space is 7428816 sectors (3.5 GiB)

  Number  Start (sector)    End (sector)  Size       Code  Name
     1              34           32801   16.0 MiB    0700      # FAT16
     2           32802          240974   101.6 MiB   0700      # EXT3

From within GRUB, booted as bootia32.efi from the BOOT partition, I
booted the OS with the following commands:

  grub> linux (hd0,gpt2)/vmlinuz rootwait root=/dev/sda2 console=ttyS0,115200
  grub> boot

This change will enable BSP developers to use the grub-efi image in
their own images as well as enable upcoming changes to the installer
to support EFI.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Kishore Bodke <kishore.k.bodke@intel.com>
CC: Rahul Saxena <rahul.saxena@intel.com>
---
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
index c951152..93e9290 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 # FIXME: We should be able to optionally drop freetype as a dependency
 DEPENDS = "help2man-native autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r5"
+PR = "r6"
 
 # Native packages do not normally rebuild when the target changes.
 # Ensure this is built once per HOST-TARGET pair.
@@ -61,7 +61,7 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
 do_mkimage() {
 	./grub-mkimage -p /EFI/BOOT -d ./grub-core/ \
 		       -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
-	               boot linux fat serial part_msdos normal efi_gop
+	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop
 }
 addtask mkimage after do_compile before do_install
 
-- 
1.7.7.6



