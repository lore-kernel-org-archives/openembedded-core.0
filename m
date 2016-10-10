Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 263676FF72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 08:16:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Oct 2016 01:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,471,1473145200"; d="scan'208";a="1042592032"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 10 Oct 2016 01:16:18 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 402676A4006;
	Mon, 10 Oct 2016 01:15:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2016 10:50:41 +0300
Message-Id: <1476085841-18648-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1475875998.18115.234.camel@intel.com>
References: <1475875998.18115.234.camel@intel.com>
Subject: [wic][PATCH] canned-wks: use GPT partition table
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
X-List-Received-Date: Mon, 10 Oct 2016 08:16:20 -0000

According to UEFI specification all EFI platforms must support
GUID Partition Table(GPT) disk layout. Here is a list of advantages
of using GPT disk layout over the legacy MBR partitioning:

 - Logical Block Addresses (LBAs) are 64 bits (rather than 32 bits).
 - Supports many partitions (rather than just four primary partitions).
 - Provides both a primary and backup partition table for redundancy.
 - Uses version number and size fields for future expansion.
 - Uses CRC32 fields for improved data integrity.
 - Defines a GUID for uniquely identifying each partition.
 - Uses a GUID and attributes to define partition content type.
 - Each partition contains a 36 character human readable name.

Used GPT partitioning in all EFI kickstart files.
Tested result images on NUC, MinnowBoard MAX and MinnowBoard Turbot.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/canned-wks/mkefidisk.wks        | 2 +-
 scripts/lib/wic/canned-wks/mkgummidisk.wks      | 2 +-
 scripts/lib/wic/canned-wks/systemd-bootdisk.wks | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
index 7c287f7..9f534fe 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-bootloader --timeout=5 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0"
+bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0"
diff --git a/scripts/lib/wic/canned-wks/mkgummidisk.wks b/scripts/lib/wic/canned-wks/mkgummidisk.wks
index 616d3ce..f3ae090 100644
--- a/scripts/lib/wic/canned-wks/mkgummidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkgummidisk.wks
@@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-bootloader  --timeout=5  --append="rootwait rootfstype=ext4 console=ttyS0,115200 console=tty0"
+bootloader --ptable gpt --timeout=5  --append="rootwait rootfstype=ext4 console=ttyS0,115200 console=tty0"
diff --git a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
index a49d130..b900023 100644
--- a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
+++ b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
@@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-bootloader --timeout=5 --append="rootwait rootfstype=ext4 console=ttyS0,115200 console=tty0"
+bootloader --ptable gpt --timeout=5 --append="rootwait rootfstype=ext4 console=ttyS0,115200 console=tty0"
-- 
2.1.4


