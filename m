Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 69F416B05F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 15:53:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jan 2014 07:53:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,713,1384329600"; d="scan'208";a="464188881"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2014 07:53:32 -0800
Received: from localhost.localdomain (unknown [10.237.112.161])
	by linux.intel.com (Postfix) with ESMTP id A2B546A4092;
	Fri, 24 Jan 2014 07:53:26 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2014 18:05:47 +0100
Message-Id: <1390583147-23022-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] oe-selftest: New tests for sstate relocation
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
X-List-Received-Date: Fri, 24 Jan 2014 15:53:33 -0000

Added new tests:
- sstate relocation stress testing
- rebuild from sstate stress testing

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/_sstatetests_noauto.py |   96 +++++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/_sstatetests_noauto.py

diff --git a/meta/lib/oeqa/selftest/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/_sstatetests_noauto.py
new file mode 100644
index 0000000..5253334
--- /dev/null
+++ b/meta/lib/oeqa/selftest/_sstatetests_noauto.py
@@ -0,0 +1,96 @@
+import datetime
+import unittest
+import os
+import re
+import shutil
+
+import oeqa.utils.ftools as ftools
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.selftest.sstate import SStateBase
+
+
+class RebuildFromSState(SStateBase):
+
+    @classmethod
+    def setUpClass(self):
+        self.builddir = os.path.join(os.environ.get('BUILDDIR'))
+
+    def get_dep_targets(self, primary_targets):
+        found_targets = []
+        bitbake("-g " + ' '.join(map(str, primary_targets)))
+        with open(os.path.join(self.builddir, 'pn-buildlist'), 'r') as pnfile:
+            found_targets = pnfile.read().splitlines()
+        return found_targets
+
+    def configure_builddir(self, builddir):
+        if os.path.exists(builddir):
+            raise AssertionError("Cannot create build directory at %s: Path allready exists!" % builddir)
+        try:
+            os.mkdir(builddir)
+        except:
+            raise AssertionError("Cannot create %s . Make sure %s exists!" % (dst, os.path.dirname(dst)))
+        os.mkdir(os.path.join(builddir, 'conf'))
+        shutil.copyfile(os.path.join(os.environ.get('BUILDDIR'), 'conf/local.conf'), os.path.join(builddir, 'conf/local.conf'))
+        shutil.copyfile(os.path.join(os.environ.get('BUILDDIR'), 'conf/bblayers.conf'), os.path.join(builddir, 'conf/bblayers.conf'))
+
+    def hardlink_tree(self, src, dst):
+        if os.path.exists(dst):
+            raise AssertionError("Cannot create directory at %s: Path allready exists!" % dst)
+        try:
+            os.mkdir(dst)
+        except:
+            raise AssertionError("Cannot create %s . Make sure %s exists!" % (dst, os.path.dirname(dst)))
+        for root, dirs, files in os.walk(src):
+            if root == src:
+                continue
+            os.mkdir(os.path.join(dst, root.split(src)[1][1:]))
+            for sstate_file in files:
+                os.link(os.path.join(root, sstate_file), os.path.join(dst, root.split(src)[1][1:], sstate_file))
+
+    def run_test_sstate_rebuild(self, primary_targets, relocate=False, rebuild_dependencies=False):
+        buildA = os.path.join(self.builddir, 'buildA')
+        if relocate:
+            buildB = os.path.join(self.builddir, 'buildB')
+        else:
+            buildB = buildA
+        self.track_for_cleanup(buildA)
+        self.track_for_cleanup(buildB)
+        self.track_for_cleanup(os.path.join(self.builddir, 'sstate-cache-buildA'))
+
+        if rebuild_dependencies:
+            rebuild_targets = self.get_dep_targets(primary_targets)
+        else:
+            rebuild_targets = primary_targets
+
+        self.configure_builddir(buildA)
+        runCmd((". %s/oe-init-build-env %s && " % (get_bb_var('COREBASE'), buildA)) + 'bitbake  ' + ' '.join(map(str, primary_targets)), shell=True, executable='/bin/bash')
+        self.hardlink_tree(os.path.join(buildA, 'sstate-cache'), os.path.join(self.builddir, 'sstate-cache-buildA'))
+        shutil.rmtree(buildA)
+
+        failed_rebuild = []
+        failed_cleansstate = []
+        for target in rebuild_targets:
+            self.configure_builddir(buildB)
+            self.hardlink_tree(os.path.join(self.builddir, 'sstate-cache-buildA'), os.path.join(buildB, 'sstate-cache'))
+
+            result_cleansstate = runCmd((". %s/oe-init-build-env %s && " % (get_bb_var('COREBASE'), buildB)) + 'bitbake -ccleansstate ' + target, ignore_status=True, shell=True, executable='/bin/bash')
+            if not result_cleansstate.status == 0:
+                failed_cleansstate.append(target)
+                shutil.rmtree(buildB)
+                continue
+
+            result_build = runCmd((". %s/oe-init-build-env %s && " % (get_bb_var('COREBASE'), buildB)) + 'bitbake ' + target, ignore_status=True, shell=True, executable='/bin/bash')
+            if not result_build.status == 0:
+                failed_rebuild.append(target)
+
+            shutil.rmtree(buildB)
+
+        self.assertFalse(failed_rebuild, msg="The following recipes have failed to rebuild: %s" % ' '.join(map(str, failed_rebuild)))
+        self.assertFalse(failed_cleansstate, msg="The following recipes have failed cleansstate(all others have passed both cleansstate and rebuild from sstate tests): %s" % ' '.join(map(str, failed_cleansstate)))
+
+    def test_sstate_relocation(self):
+        self.run_test_sstate_rebuild(['core-image-sato-sdk'], relocate=True, rebuild_dependencies=True)
+
+    def test_sstate_rebuild(self):
+        self.run_test_sstate_rebuild(['core-image-sato-sdk'], relocate=False, rebuild_dependencies=True)
-- 
1.7.9.5


