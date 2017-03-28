Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C1E7C77A8D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490704998; x=1522240998;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PfqJaE2/W5UL4TS3jXx5xG/pEd8OmZAahwMfvIaZX9Q=;
	b=p55wdqzYRaxYPCYnrozro/mZODWo5QYJWyBy1JHnyZgcz7zb9ObUqV+g
	4uHpNY/sTbQOKixWTrExBljyLqb8fA==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 05:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,236,1486454400"; d="scan'208";a="71268564"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 28 Mar 2017 05:43:17 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id C535A6A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 05:43:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 15:40:59 +0300
Message-Id: <a850489583522e2b43ca220a566ea40468e49dae.1490704390.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490704390.git.ed.bartosh@linux.intel.com>
References: <cover.1490704390.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/9] oe-selftest: add wic test case test_fs_types
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
X-List-Received-Date: Tue, 28 Mar 2017 12:43:17 -0000

Added wic test case to test all possible filesystem
types for empty and not empty partitions.

[YOCTO #10618]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index ee633f8..2af3bf5 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -717,3 +717,22 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
+
+    def test_fs_types(self):
+        """Test filesystem types for empty and not empty partitions"""
+        img = 'core-image-minimal'
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines(['part ext2   --fstype ext2     --source rootfs\n',
+                            'part btrfs  --fstype btrfs    --source rootfs --size 40M\n',
+                            'part squash --fstype squashfs --source rootfs\n',
+                            'part swap   --fstype swap --size 1M\n',
+                            'part emptyvfat   --fstype vfat   --size 1M\n',
+                            'part emptyext2   --fstype ext2   --size 1M\n',
+                            'part emptybtrfs  --fstype btrfs  --size 100M\n',
+                            'part emptysquash --fstype squash --size 1M\n'])
+            wks.flush()
+            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            self.assertEqual(0, runCmd(cmd).status)
+            wksname = os.path.splitext(os.path.basename(wks.name))[0]
+            out = glob(self.resultdir + "%s-*direct" % wksname)
+            self.assertEqual(1, len(out))
-- 
2.1.4


