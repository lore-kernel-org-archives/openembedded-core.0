Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A75475E2D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 11:12:39 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 13 Feb 2016 03:12:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,440,1449561600"; d="scan'208";a="47336532"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 13 Feb 2016 03:12:40 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id EF6916A4004
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 04:00:30 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2016 11:02:17 +0200
Message-Id: <5ab5f8c6d32b26a5ea8d72adbcb1c84e3337136f.1455353103.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v3 10/14] oe-selftest: add new wic testcase
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
X-List-Received-Date: Sat, 13 Feb 2016 11:12:39 -0000

Added test_qemu testcase to boot wic-image-minimal and test
that 2 partitions mentioned in .wks are mounted.

[YOCTO #8499]

(From OE-Core rev: 6fb015d0847fe7d259d654d4a99bf4c328f810ab)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/wic.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index a739f69..7b173e4 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -30,7 +30,7 @@ from glob import glob
 from shutil import rmtree
 
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.decorators import testcase
 
 
@@ -264,3 +264,13 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+
+    def test_qemu(self):
+        """Test wic-image-minimal under qemu"""
+        self.assertEqual(0, bitbake('wic-image-minimal').status)
+
+        with runqemu('wic-image-minimal', ssh=False) as qemu:
+            command = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
+            status, output = qemu.run_serial(command)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (command, output))
+            self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
-- 
2.1.4


