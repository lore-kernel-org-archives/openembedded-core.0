Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 270B065C9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 15:15:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2015 08:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="731190778"
Received: from jmcmill1-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.0.158])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2015 08:15:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 16:15:06 +0100
Message-Id: <fae13e8ce96716edfb174bb6cbc4c0327b0490e2.1431961859.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431961859.git.paul.eggleton@linux.intel.com>
References: <cover.1431961859.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431961859.git.paul.eggleton@linux.intel.com>
References: <cover.1431961859.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] oe-selftest: move recipetool tests to their own module
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
X-List-Received-Date: Mon, 18 May 2015 15:15:16 -0000

These tests really belong in their own module; if we refactor
out a base class from DevtoolTests with shared functions then we can
move them out easily. Also create temp directory in setupLocal() so we
don't have to do that in individual tests anymore.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py    | 81 ++++++++++--------------------------
 meta/lib/oeqa/selftest/recipetool.py | 55 ++++++++++++++++++++++++
 2 files changed, 77 insertions(+), 59 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/recipetool.py

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 1d16113..f4571c4 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -11,29 +11,7 @@ from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils.decorators import testcase
 
-class DevtoolTests(oeSelfTest):
-
-    def test_create_workspace(self):
-        # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
-        result = runCmd('bitbake-layers show-layers')
-        self.assertTrue('/workspace' not in result.output, 'This test cannot be run with a workspace layer in bblayers.conf')
-        # Try creating a workspace layer with a specific path
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir)
-        result = runCmd('devtool create-workspace %s' % tempdir)
-        self.assertTrue(os.path.isfile(os.path.join(tempdir, 'conf', 'layer.conf')))
-        result = runCmd('bitbake-layers show-layers')
-        self.assertIn(tempdir, result.output)
-        # Try creating a workspace layer with the default path
-        self.track_for_cleanup(workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool create-workspace')
-        self.assertTrue(os.path.isfile(os.path.join(workspacedir, 'conf', 'layer.conf')))
-        result = runCmd('bitbake-layers show-layers')
-        self.assertNotIn(tempdir, result.output)
-        self.assertIn(workspacedir, result.output)
+class DevtoolBase(oeSelfTest):
 
     def _test_recipe_contents(self, recipefile, checkvars, checkinherits):
         with open(recipefile, 'r') as f:
@@ -53,45 +31,30 @@ class DevtoolTests(oeSelfTest):
         for inherit in checkinherits:
             self.assertIn(inherit, inherits, 'Missing inherit of %s' % inherit)
 
-    def test_recipetool_create(self):
-        # Try adding a recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir)
-        tempsrc = os.path.join(tempdir, 'srctree')
-        os.makedirs(tempsrc)
-        recipefile = os.path.join(tempdir, 'logrotate_3.8.7.bb')
-        srcuri = 'https://fedorahosted.org/releases/l/o/logrotate/logrotate-3.8.7.tar.gz'
-        result = runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
-        self.assertTrue(os.path.isfile(recipefile))
-        checkvars = {}
-        checkvars['LICENSE'] = 'GPLv2'
-        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=18810669f13b87348459e611d31ab760'
-        checkvars['SRC_URI'] = 'https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] = '99e08503ef24c3e2e3ff74cc5f3be213'
-        checkvars['SRC_URI[sha256sum]'] = 'f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64'
-        self._test_recipe_contents(recipefile, checkvars, [])
 
-    def test_recipetool_create_git(self):
-        # Ensure we have the right data in shlibs/pkgdata
-        bitbake('libpng pango libx11 libxext jpeg')
-        # Try adding a recipe
+class DevtoolTests(DevtoolBase):
+
+    def test_create_workspace(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        result = runCmd('bitbake-layers show-layers')
+        self.assertTrue('/workspace' not in result.output, 'This test cannot be run with a workspace layer in bblayers.conf')
+        # Try creating a workspace layer with a specific path
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-        tempsrc = os.path.join(tempdir, 'srctree')
-        os.makedirs(tempsrc)
-        recipefile = os.path.join(tempdir, 'libmatchbox.bb')
-        srcuri = 'git://git.yoctoproject.org/libmatchbox'
-        result = runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
-        self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
-        checkvars = {}
-        checkvars['LICENSE'] = 'LGPLv2.1'
-        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34'
-        checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '1.0+git${SRCPV}'
-        checkvars['SRC_URI'] = srcuri
-        checkvars['DEPENDS'] = 'libpng pango libx11 libxext jpeg'
-        inherits = ['autotools', 'pkgconfig']
-        self._test_recipe_contents(recipefile, checkvars, inherits)
+        result = runCmd('devtool create-workspace %s' % tempdir)
+        self.assertTrue(os.path.isfile(os.path.join(tempdir, 'conf', 'layer.conf')))
+        result = runCmd('bitbake-layers show-layers')
+        self.assertIn(tempdir, result.output)
+        # Try creating a workspace layer with the default path
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool create-workspace')
+        self.assertTrue(os.path.isfile(os.path.join(workspacedir, 'conf', 'layer.conf')))
+        result = runCmd('bitbake-layers show-layers')
+        self.assertNotIn(tempdir, result.output)
+        self.assertIn(workspacedir, result.output)
 
     def test_devtool_add(self):
         # Check preconditions
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
new file mode 100644
index 0000000..832fb7b
--- /dev/null
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -0,0 +1,55 @@
+import unittest
+import os
+import logging
+import re
+import tempfile
+
+import oeqa.utils.ftools as ftools
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.decorators import testcase
+from oeqa.selftest.devtool import DevtoolBase
+
+
+class RecipetoolTests(DevtoolBase):
+
+    def setUpLocal(self):
+        self.tempdir = tempfile.mkdtemp(prefix='recipetoolqa')
+        self.track_for_cleanup(self.tempdir)
+
+    def test_recipetool_create(self):
+        # Try adding a recipe
+        tempsrc = os.path.join(self.tempdir, 'srctree')
+        os.makedirs(tempsrc)
+        recipefile = os.path.join(self.tempdir, 'logrotate_3.8.7.bb')
+        srcuri = 'https://fedorahosted.org/releases/l/o/logrotate/logrotate-3.8.7.tar.gz'
+        result = runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['LICENSE'] = 'GPLv2'
+        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=18810669f13b87348459e611d31ab760'
+        checkvars['SRC_URI'] = 'https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz'
+        checkvars['SRC_URI[md5sum]'] = '99e08503ef24c3e2e3ff74cc5f3be213'
+        checkvars['SRC_URI[sha256sum]'] = 'f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64'
+        self._test_recipe_contents(recipefile, checkvars, [])
+
+    def test_recipetool_create_git(self):
+        # Ensure we have the right data in shlibs/pkgdata
+        bitbake('libpng pango libx11 libxext jpeg')
+        # Try adding a recipe
+        tempsrc = os.path.join(self.tempdir, 'srctree')
+        os.makedirs(tempsrc)
+        recipefile = os.path.join(self.tempdir, 'libmatchbox.bb')
+        srcuri = 'git://git.yoctoproject.org/libmatchbox'
+        result = runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
+        self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
+        checkvars = {}
+        checkvars['LICENSE'] = 'LGPLv2.1'
+        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34'
+        checkvars['S'] = '${WORKDIR}/git'
+        checkvars['PV'] = '1.0+git${SRCPV}'
+        checkvars['SRC_URI'] = srcuri
+        checkvars['DEPENDS'] = 'libpng pango libx11 libxext jpeg'
+        inherits = ['autotools', 'pkgconfig']
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
-- 
2.1.0


