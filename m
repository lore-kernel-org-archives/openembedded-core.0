Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E2E717700A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 02 Sep 2015 04:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="553762228"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2015 04:00:17 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 367DF6A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:57:33 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:01 +0300
Message-Id: <6899dc7a2b3bae4693954c0dba6374211081544c.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 01/17] wic: use ext4 in canned .wks files
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:19 -0000

Latest kernel doesn't have ext3 compiled in. Wic images produced
from canned .wks can't boot because of that. Switching to ext4
fixes this issue.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/image/canned-wks/directdisk-gpt.wks          | 4 ++--
 scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks | 6 +++---
 scripts/lib/image/canned-wks/directdisk.wks              | 4 ++--
 scripts/lib/image/canned-wks/mkefidisk.wks               | 4 ++--
 scripts/lib/image/canned-wks/mkgummidisk.wks             | 4 ++--
 scripts/lib/image/canned-wks/mkhybridiso.wks             | 2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/image/canned-wks/directdisk-gpt.wks b/scripts/lib/image/canned-wks/directdisk-gpt.wks
index 2355259..ea01cf3 100644
--- a/scripts/lib/image/canned-wks/directdisk-gpt.wks
+++ b/scripts/lib/image/canned-wks/directdisk-gpt.wks
@@ -4,7 +4,7 @@
 
 
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
 
-bootloader  --ptable gpt --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
+bootloader  --ptable gpt --timeout=0  --append="rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0"
 
diff --git a/scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks b/scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks
index f3c6df5..8a81f8f 100644
--- a/scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks
+++ b/scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks
@@ -16,8 +16,8 @@
 #   - or any combinations of -r and --rootfs command line options
 
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --rootfs-dir=rootfs1 --ondisk sda --fstype=ext3 --label platform --align 1024
-part /rescue --source rootfs --rootfs-dir=rootfs2 --ondisk sda --fstype=ext3 --label secondary --align 1024
+part / --source rootfs --rootfs-dir=rootfs1 --ondisk sda --fstype=ext4 --label platform --align 1024
+part /rescue --source rootfs --rootfs-dir=rootfs2 --ondisk sda --fstype=ext4 --label secondary --align 1024
 
-bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
+bootloader  --timeout=0  --append="rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0"
 
diff --git a/scripts/lib/image/canned-wks/directdisk.wks b/scripts/lib/image/canned-wks/directdisk.wks
index 62dcab1..af4c9ea 100644
--- a/scripts/lib/image/canned-wks/directdisk.wks
+++ b/scripts/lib/image/canned-wks/directdisk.wks
@@ -4,7 +4,7 @@
 
 
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
 
-bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
+bootloader  --timeout=0  --append="rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0"
 
diff --git a/scripts/lib/image/canned-wks/mkefidisk.wks b/scripts/lib/image/canned-wks/mkefidisk.wks
index 58d42e6..696e94e 100644
--- a/scripts/lib/image/canned-wks/mkefidisk.wks
+++ b/scripts/lib/image/canned-wks/mkefidisk.wks
@@ -4,8 +4,8 @@
 
 part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
 
-part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-bootloader  --timeout=10  --append="rootwait rootfstype=ext3 console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-intel.enable_msi=0"
+bootloader  --timeout=10  --append="rootwait rootfstype=ext4 console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-intel.enable_msi=0"
diff --git a/scripts/lib/image/canned-wks/mkgummidisk.wks b/scripts/lib/image/canned-wks/mkgummidisk.wks
index f81cbdf..66a22f6 100644
--- a/scripts/lib/image/canned-wks/mkgummidisk.wks
+++ b/scripts/lib/image/canned-wks/mkgummidisk.wks
@@ -4,8 +4,8 @@
 
 part /boot --source bootimg-efi --sourceparams="loader=gummiboot" --ondisk sda --label msdos --active --align 1024
 
-part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-bootloader  --timeout=10  --append="rootwait rootfstype=ext3 console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-intel.enable_msi=0"
+bootloader  --timeout=10  --append="rootwait rootfstype=ext4 console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-intel.enable_msi=0"
diff --git a/scripts/lib/image/canned-wks/mkhybridiso.wks b/scripts/lib/image/canned-wks/mkhybridiso.wks
index b443c15..9d34e9b 100644
--- a/scripts/lib/image/canned-wks/mkhybridiso.wks
+++ b/scripts/lib/image/canned-wks/mkhybridiso.wks
@@ -2,6 +2,6 @@
 # long-description: Creates an EFI and legacy bootable hybrid ISO image
 # which can be used on optical media as well as USB media.
 
-part /boot --source isoimage-isohybrid --sourceparams="loader=grub-efi,image_name=HYBRID_ISO_IMG" --ondisk cd --label HYBRIDISO --fstype=ext3
+part /boot --source isoimage-isohybrid --sourceparams="loader=grub-efi,image_name=HYBRID_ISO_IMG" --ondisk cd --label HYBRIDISO --fstype=ext4
 
 bootloader  --timeout=15  --append=""
-- 
2.1.4


