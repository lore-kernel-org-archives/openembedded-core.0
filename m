Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EF4FE7320F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 10:37:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 04 Mar 2016 02:37:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,535,1449561600"; d="scan'208";a="929506029"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2016 02:37:50 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 288276A4002;
	Fri,  4 Mar 2016 03:25:36 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 12:41:47 +0200
Message-Id: <1457088107-30625-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCHv3] oeqa/selftest/buildoptions: Test build does not fail without git rev
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
X-List-Received-Date: Fri, 04 Mar 2016 10:37:50 -0000

Test that layer git revisions are displayed and
do not fail without git repository.

fix for [YOCTO #8852]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 43 +++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index e2d12c3..ee2a101 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -1,7 +1,8 @@
 import os
 import re
 import glob as g
-
+import shutil
+import tempfile
 from oeqa.selftest.base import oeSelfTest
 from oeqa.selftest.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
@@ -111,6 +112,46 @@ class SanityOptionsTest(oeSelfTest):
         line = self.getline(res, "QA Issue: nfs-utils")
         self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: nfs-utils message is not present in bitbake's output: %s" % res.output)
 
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
+        dirpath = tempfile.mkdtemp()
+
+        dummy_layer_name = 'meta-dummy'
+        dummy_layer_path = os.path.join(dirpath, dummy_layer_name)
+        dummy_layer_conf_dir = os.path.join(dummy_layer_path, 'conf')
+        os.makedirs(dummy_layer_conf_dir)
+        dummy_layer_conf_path = os.path.join(dummy_layer_conf_dir, 'layer.conf')
+
+        dummy_layer_content = 'BBPATH .= ":${LAYERDIR}"\n'
+        dummy_layer_content += 'BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"\n'
+        dummy_layer_content += 'BBFILE_COLLECTIONS += "%s"\n' % dummy_layer_name
+        dummy_layer_content += 'BBFILE_PATTERN_%s = "^${LAYERDIR}/"\n' % dummy_layer_name
+        dummy_layer_content += 'BBFILE_PRIORITY_%s = "6"\n' % dummy_layer_name
+
+        ftools.write_file(dummy_layer_conf_path, dummy_layer_content)
+
+        bblayers_conf = 'BBLAYERS += "%s"\n' % dummy_layer_path
+        self.write_bblayers_config(bblayers_conf)
+
+        test_recipe = 'ed'
+
+        ret = bitbake('-n %s' % test_recipe)
+
+        err = 'fatal: Not a git repository'
+
+        shutil.rmtree(dirpath)
+
+        self.assertNotIn(err, ret.output)
+
+
 class BuildhistoryTests(BuildhistoryBase):
 
     @testcase(293)
-- 
2.1.0


