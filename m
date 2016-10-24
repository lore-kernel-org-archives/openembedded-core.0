Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6772771A62
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 14:32:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Oct 2016 07:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,542,1473145200"; d="scan'208";a="1058315657"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2016 07:32:09 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 5B11F6A4006;
	Mon, 24 Oct 2016 07:31:34 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Oct 2016 16:54:41 +0300
Message-Id: <1477317281-19518-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: benjamin.esquivel@intel.com
Subject: [wic][PATCH] systemd-bootdisk.wks: use PARTUUID
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
X-List-Received-Date: Mon, 24 Oct 2016 14:32:09 -0000

Root device name in systemd-bootdisk.wks is 'sda'. This can cause
images, produced using this wks to refuse booting if real device
name is not 'sda'. For example, when booting MinnowBoard MAX from
MicroSD card the boot process stucks with this message on the boot
console output: Waiting for root device /dev/sda2...
This happens because real device name of MicroSD card on this device
is mmcblk1.

Used --use-uuid option for root partition. This should make
wic to put partiion UUID instead of device name into kernel command
line.

[YOCTO #10485]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/canned-wks/systemd-bootdisk.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
index b900023..4bd9d6a 100644
--- a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
+++ b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
@@ -4,7 +4,7 @@
 
 part /boot --source bootimg-efi --sourceparams="loader=systemd-boot" --ondisk sda --label msdos --active --align 1024
 
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-- 
2.1.4


