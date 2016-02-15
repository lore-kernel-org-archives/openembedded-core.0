Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 228FE601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 16:45:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 15 Feb 2016 08:45:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,451,1449561600"; d="scan'208";a="912821484"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 15 Feb 2016 08:45:47 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 3BD586A4004;
	Mon, 15 Feb 2016 09:33:32 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 18:49:22 +0200
Message-Id: <1455554962-6301-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/selftest/buildoptions: Test build does not fail without git rev
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
X-List-Received-Date: Mon, 15 Feb 2016 16:45:52 -0000

Test that layer git revisions are displayed and
do not fail without git repository.

fix for [YOCTO #8852]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 6167fb2..80b59bd 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -1,7 +1,7 @@
 import os
 import re
 import glob as g
-
+import shutil
 from oeqa.selftest.base import oeSelfTest
 from oeqa.selftest.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
@@ -103,6 +103,36 @@ class SanityOptionsTest(oeSelfTest):
         self.assertTrue("WARNING: QA Issue: gzip" in res.output, "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
         self.assertTrue("WARNING: QA Issue: nfs-utils" in res.output, "WARNING: QA Issue: nfs-utils message is not present in bitbake's output: %s" % res.output)
 
+    @testcase(1421)
+    def test_layer_git_revisions_are_displayed_and_do_not_fail_without_git_repo(self):
+        """
+        Summary:     Test that layer git revisions are displayed and do not fail without git repository
+        Expected:    The build to be successful and without "fatal" errors
+        Product:     oe-core
+        Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        test_recipe = 'ed'
+        corebase = get_bb_var('COREBASE')
+        git_dir = os.path.join(corebase, '.git')
+        git_dir_tmp = os.path.join(corebase, '.git_tmp')
+
+        bitbake('-n %s' % test_recipe)
+        shutil.move(git_dir, git_dir_tmp)
+
+        self.add_command_to_tearDown('mv %s %s' % (git_dir_tmp, git_dir))
+
+        ret = bitbake('-n %s' % test_recipe)
+
+        patt = r'fatal: Not a git repository \(or any parent up to mount point /home\)\n' \
+               r'Stopping at filesystem boundary \(GIT_DISCOVERY_ACROSS_FILESYSTEM not set\)\.'
+
+        found_err = re.search(patt, ret.output)
+
+        self.assertIsNone(found_err, 'Fatal errors found. Output: %s' % ret.output)
+
+
 class BuildhistoryTests(BuildhistoryBase):
 
     @testcase(293)
-- 
2.1.0


