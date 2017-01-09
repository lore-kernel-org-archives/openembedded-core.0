Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 94F9771AE8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:39:27 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 09 Jan 2017 09:39:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="51794756"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.142])
	by fmsmga006.fm.intel.com with ESMTP; 09 Jan 2017 09:39:26 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 11:45:51 -0600
Message-Id: <22d68bd78d61e291475079693f4d96cd5dbfb556.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH V3 1/4] selftest: devtool: use distro agnostic recipes for devtool checks
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
X-List-Received-Date: Mon, 09 Jan 2017 17:39:27 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The recipes being replaced are not compatible with all distros, so
use mraa and virtual/make for some checks.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 19c5ccf..bbdd8c6 100644
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
@@ -590,8 +589,8 @@ class DevtoolTests(DevtoolBase):
     @testcase(1378)
     def test_devtool_modify_virtual(self):
         # Try modifying a virtual recipe
-        virtrecipe = 'virtual/libx11'
-        realrecipe = 'libx11'
+        virtrecipe = 'virtual/make'
+        realrecipe = 'make'
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
@@ -1025,7 +1024,7 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
         self.track_for_cleanup(tempdir)
-        result = runCmd('devtool extract virtual/libx11 %s' % tempdir)
+        result = runCmd('devtool extract virtual/make %s' % tempdir)
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
         # devtool extract shouldn't create the workspace
         self.assertFalse(os.path.exists(self.workspacedir))
-- 
2.1.4


