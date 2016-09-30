Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 469646069C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 15:47:45 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 30 Sep 2016 08:47:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,273,1473145200"; d="scan'208";a="14958689"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 30 Sep 2016 08:47:47 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 2D61A6A4006;
	Fri, 30 Sep 2016 08:47:18 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 18:36:50 +0300
Message-Id: <1475249810-1235-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] mkefidisk.wks: use partition UUID and GPT partition table
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
X-List-Received-Date: Fri, 30 Sep 2016 15:47:46 -0000

This is a preparation to use mkefidisk as a default wks for
genericx86* BSPs. This change enables usage of partition UUID
instead of device name to specify root partition in kernel
command line. It should make images to boot on devices with
boot device names that differ from what's mentioned in wks file.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/canned-wks/mkefidisk.wks | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
index 696e94e..73886ab 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -4,8 +4,8 @@
 
 part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
 
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-bootloader  --timeout=10  --append="rootwait rootfstype=ext4 console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-intel.enable_msi=0"
+bootloader --ptable gpt --timeout=10 --append="rootwait rootfstype=ext4 console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-intel.enable_msi=0"
-- 
2.1.4


