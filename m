Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1010.1629822390051305487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360387"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360387"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455659090"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:08 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 25/28] wic: don't forcibly pass -T default
Date: Wed, 25 Aug 2021 00:25:27 +0800
Message-Id: <c2b8618e15dbe5c77029c57d5ef954109516027e.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

This reverts part of oe-core eecbe62555, which was a previous attempt
to solve the Y2038 problem.  This is now solved centrally in e2fsprogs,
so doesn't need to be dealt with in wic.

We don't revert the commit entirely, to retain the warning if a
filesystem has small inodes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e8017208bed98b6c90735cb641fc9d7aedf9140)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/canned-wks/common.wks.inc     | 2 +-
 scripts/lib/wic/canned-wks/directdisk-gpt.wks | 2 +-
 scripts/lib/wic/canned-wks/mkefidisk.wks      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/common.wks.inc b/scripts/lib/wic/canned-wks/common.wks.inc
index 4fd29fa8c1..89880b417b 100644
--- a/scripts/lib/wic/canned-wks/common.wks.inc
+++ b/scripts/lib/wic/canned-wks/common.wks.inc
@@ -1,3 +1,3 @@
 # This file is included into 3 canned wks files from this directory
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --use-uuid --fstype=ext4 --mkfs-extraopts "-T default" --label platform --align 1024
+part / --source rootfs --use-uuid --fstype=ext4 --label platform --align 1024
diff --git a/scripts/lib/wic/canned-wks/directdisk-gpt.wks b/scripts/lib/wic/canned-wks/directdisk-gpt.wks
index cf16c0c30b..8d7d8de6ea 100644
--- a/scripts/lib/wic/canned-wks/directdisk-gpt.wks
+++ b/scripts/lib/wic/canned-wks/directdisk-gpt.wks
@@ -4,7 +4,7 @@
 
 
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext4 --mkfs-extraopts "-T default" --label platform --align 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
 
 bootloader  --ptable gpt --timeout=0  --append="rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0 console=ttyS0,115200n8"
 
diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
index d1878e23e5..9f534fe184 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -4,7 +4,7 @@
 
 part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
 
-part / --source rootfs --ondisk sda --fstype=ext4 --mkfs-extraopts "-T default"  --label platform --align 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-- 
2.31.1

