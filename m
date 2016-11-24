Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8A38671B74
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 20:52:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 24 Nov 2016 12:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="1063828210"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2016 12:52:52 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 14:58:06 -0600
Message-Id: <52288e600b9c2e77450854cc2b3b382c3060ceac.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 06/13] selftest: devtool: use mraa instead of libmatchbox to lessen distro requirements
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
X-List-Received-Date: Thu, 24 Nov 2016 20:52:51 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

libmatchbox requires x11 distro feature to be present, so use another recipe
(mraa) with no extra requirements, allowing test execution of all supported
distros.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 7db286f..6fb54dd 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -340,12 +340,11 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1161)
     def test_devtool_add_fetch_git(self):
-        # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-        url = 'git://git.yoctoproject.org/libmatchbox'
-        checkrev = '462f0652055d89c648ddd54fd7b03f175c2c6973'
-        testrecipe = 'libmatchbox2'
+        url = 'gitsm://git.yoctoproject.org/mraa'
+        checkrev = 'ae127b19a50aa54255e4330ccfdd9a5d058e581d'
+        testrecipe = 'mraa'
         srcdir = os.path.join(tempdir, testrecipe)
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
@@ -353,7 +352,7 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool add %s %s -a -f %s' % (testrecipe, srcdir, url))
         self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created: %s' % result.output)
-        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure.ac in source directory')
+        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'imraa', 'imraa.c')), 'Unable to find configure.ac in source directory')
         # Test devtool status
         result = runCmd('devtool status')
         self.assertIn(testrecipe, result.output)
@@ -363,7 +362,7 @@ class DevtoolTests(DevtoolBase):
         self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly named')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '1.12+git${SRCPV}'
+        checkvars['PV'] = '1.0+git${SRCPV}'
         checkvars['SRC_URI'] = url
         checkvars['SRCREV'] = '${AUTOREV}'
         self._test_recipe_contents(recipefile, checkvars, [])
@@ -372,7 +371,7 @@ class DevtoolTests(DevtoolBase):
         shutil.rmtree(srcdir)
         url_rev = '%s;rev=%s' % (url, checkrev)
         result = runCmd('devtool add %s %s -f "%s" -V 1.5' % (testrecipe, srcdir, url_rev))
-        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure.ac in source directory')
+        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'imraa', 'imraa.c')), 'Unable to find imraa/imraa.c in source directory')
         # Test devtool status
         result = runCmd('devtool status')
         self.assertIn(testrecipe, result.output)
@@ -580,6 +579,8 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1378)
     def test_devtool_modify_virtual(self):
+        if self.distro == 'poky-tiny':
+            self.skipTest('Test not possible with poky-tiny because it requires a libx11 provider')
         # Try modifying a virtual recipe
         virtrecipe = 'virtual/libx11'
         realrecipe = 'libx11'
@@ -1013,6 +1014,8 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1379)
     def test_devtool_extract_virtual(self):
+        if self.distro == 'poky-tiny':
+            self.skipTest('Test not possible with poky-tiny because it requires a libx11 provider')
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
         self.track_for_cleanup(tempdir)
-- 
2.1.4


