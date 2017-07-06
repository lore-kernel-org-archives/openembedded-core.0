Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D7E7719E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 11:45:13 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 04:45:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,317,1496127600"; d="scan'208";a="123198023"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2017 04:45:13 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8BABD580562
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 04:45:12 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 14:32:35 +0300
Message-Id: <7fbc02eda3dbaa5bf086bc8b7481c43e2af5f2fc.1499340568.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499340568.git.ed.bartosh@linux.intel.com>
References: <cover.1499340568.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/3] oe-selftest: wic: add test_mkfs_extraopts test case
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
X-List-Received-Date: Thu, 06 Jul 2017 11:45:13 -0000

Test new wks option --mkfs-extraopts with all filesystems
supported by wic.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b22a038..9dc8525 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -949,3 +949,22 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '2')
+
+    def test_mkfs_extraopts(self):
+        """Test wks option --mkfs-extraopts for empty and not empty partitions"""
+        img = 'core-image-minimal'
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines(
+                ['part ext2   --fstype ext2     --source rootfs --mkfs-extraopts "-D -F -i 8192"\n',
+                 'part btrfs  --fstype btrfs    --source rootfs --size 40M --mkfs-extraopts "--mixed -K"\n',
+                 'part squash --fstype squashfs --source rootfs --mkfs-extraopts "-no-sparse -b 4096"\n',
+                 'part emptyvfat   --fstype vfat   --size 1M --mkfs-extraopts "-S 1024 -s 64"\n',
+                 'part emptymsdos  --fstype msdos  --size 1M --mkfs-extraopts "-S 1024 -s 64"\n',
+                 'part emptyext2   --fstype ext2   --size 1M --mkfs-extraopts "-D -F -i 8192"\n',
+                 'part emptybtrfs  --fstype btrfs  --size 100M --mkfs-extraopts "--mixed -K"\n'])
+            wks.flush()
+            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            self.assertEqual(0, runCmd(cmd).status)
+            wksname = os.path.splitext(os.path.basename(wks.name))[0]
+            out = glob(self.resultdir + "%s-*direct" % wksname)
+            self.assertEqual(1, len(out))
-- 
2.1.4


