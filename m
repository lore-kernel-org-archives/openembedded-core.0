Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1B92C772E1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 17:43:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2016 09:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="875310327"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2016 09:43:35 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 52D296A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 10:31:27 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 17:32:50 +0200
Message-Id: <4d42efe71c0de9b08896e25eaf59a5472de0548d.1454426922.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454426922.git.ed.bartosh@linux.intel.com>
References: <cover.1454426922.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1454426922.git.ed.bartosh@linux.intel.com>
References: <cover.1454426922.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 10/14] oe-selftest: add new wic testcase
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
X-List-Received-Date: Tue, 02 Feb 2016 17:43:37 -0000

Added test_qemu testcase to boot wic-image-minimal and test
that 2 partitions mentioned in .wks are mounted.

[YOCTO #8499]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index df826ed..f9c85d0 100644
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


