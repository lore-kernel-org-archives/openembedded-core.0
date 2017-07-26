Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DDE7B77D9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 09:29:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2017 02:29:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,414,1496127600"; d="scan'208";a="1155514477"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2017 02:29:05 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 46F4D58011C;
	Wed, 26 Jul 2017 02:29:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 12:06:22 +0300
Message-Id: <1501059982-14424-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe-selftest: wic: change mkfs.btrfs options
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
X-List-Received-Date: Wed, 26 Jul 2017 09:29:04 -0000

test_mkfs_extraopts test case fails on ab with error caused
by using -K --mixed options:
 output: extent-tree.c:2696: btrfs_reserve_extent: BUG_ON `ret` triggered, value -28

For this test case it's not important to use particular options,
so changing options to anything less influential is OK.

Changed extra options for mkfs.btrfs to '--quiet' to fix the failure.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ceb92ae..daa4067 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -926,7 +926,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         with NamedTemporaryFile("w", suffix=".wks") as wks:
             wks.writelines(
                 ['part ext2   --fstype ext2     --source rootfs --mkfs-extraopts "-D -F -i 8192"\n',
-                 'part btrfs  --fstype btrfs    --source rootfs --size 40M --mkfs-extraopts "--mixed -K"\n',
+                 'part btrfs  --fstype btrfs    --source rootfs --size 40M --mkfs-extraopts "--quiet"\n',
                  'part squash --fstype squashfs --source rootfs --mkfs-extraopts "-no-sparse -b 4096"\n',
                  'part emptyvfat   --fstype vfat   --size 1M --mkfs-extraopts "-S 1024 -s 64"\n',
                  'part emptymsdos  --fstype msdos  --size 1M --mkfs-extraopts "-S 1024 -s 64"\n',
-- 
2.1.4


