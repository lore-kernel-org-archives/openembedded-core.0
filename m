Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 37DA57169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 13:42:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2015 06:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,671,1422950400"; d="scan'208";a="721057425"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2015 06:42:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Apr 2015 14:42:00 +0100
Message-Id: <dfbf2c1f1fcd811ef72e2a73f5fd4cb4d8b784e1.1430314621.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430314621.git.paul.eggleton@linux.intel.com>
References: <cover.1430314621.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430314621.git.paul.eggleton@linux.intel.com>
References: <cover.1430314621.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] oe-selftest: devtool: add some tests for devtool add -f
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
X-List-Received-Date: Wed, 29 Apr 2015 13:42:39 -0000

Tests the following aspects of "devtool add" with the -f option:
* Works for a git and https URI
* Extracts to the appropriate directory
* Uses the correct recipe file name with and without -V
* Sets SRC_URI and S appropriately with and without -V
* Sets SRCREV if rev= is specified in the URI

A lot of this functionality relies on "recipetool create" which
"devtool add" wraps around, so the associated behaviour of that is also
being tested here.

Refactor out the code to check a recipe for variable values / inherits
at the same time so we can use it to check the generated recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 148 ++++++++++++++++++++++++++++++--------
 1 file changed, 118 insertions(+), 30 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 6881835..1a506d9 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -35,6 +35,24 @@ class DevtoolTests(oeSelfTest):
         self.assertNotIn(tempdir, result.output)
         self.assertIn(workspacedir, result.output)
 
+    def _test_recipe_contents(self, recipefile, checkvars, checkinherits):
+        with open(recipefile, 'r') as f:
+            for line in f:
+                if '=' in line:
+                    splitline = line.split('=', 1)
+                    var = splitline[0].rstrip()
+                    value = splitline[1].strip().strip('"')
+                    if var in checkvars:
+                        needvalue = checkvars.pop(var)
+                        self.assertEqual(value, needvalue, 'values for %s do not match' % var)
+                if line.startswith('inherit '):
+                    inherits = line.split()[1:]
+
+        self.assertEqual(checkvars, {}, 'Some variables not found: %s' % checkvars)
+
+        for inherit in checkinherits:
+            self.assertIn(inherit, inherits, 'Missing inherit of %s' % inherit)
+
     def test_recipetool_create(self):
         # Try adding a recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -51,19 +69,7 @@ class DevtoolTests(oeSelfTest):
         checkvars['SRC_URI'] = 'https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz'
         checkvars['SRC_URI[md5sum]'] = '99e08503ef24c3e2e3ff74cc5f3be213'
         checkvars['SRC_URI[sha256sum]'] = 'f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64'
-        with open(recipefile, 'r') as f:
-            for line in f:
-                if '=' in line:
-                    splitline = line.split('=', 1)
-                    var = splitline[0].rstrip()
-                    value = splitline[1].strip().strip('"')
-                    if var in checkvars:
-                        needvalue = checkvars.pop(var)
-                        self.assertEqual(value, needvalue)
-                if line.startswith('inherit '):
-                    inherits = line.split()[1:]
-
-        self.assertEqual(checkvars, {}, 'Some variables not found')
+        self._test_recipe_contents(recipefile, checkvars, [])
 
     def test_recipetool_create_git(self):
         # Ensure we have the right data in shlibs/pkgdata
@@ -84,23 +90,8 @@ class DevtoolTests(oeSelfTest):
         checkvars['PV'] = '1.0+git${SRCPV}'
         checkvars['SRC_URI'] = srcuri
         checkvars['DEPENDS'] = 'libpng pango libx11 libxext jpeg'
-        inherits = []
-        with open(recipefile, 'r') as f:
-            for line in f:
-                if '=' in line:
-                    splitline = line.split('=', 1)
-                    var = splitline[0].rstrip()
-                    value = splitline[1].strip().strip('"')
-                    if var in checkvars:
-                        needvalue = checkvars.pop(var)
-                        self.assertEqual(value, needvalue)
-                if line.startswith('inherit '):
-                    inherits = line.split()[1:]
-
-        self.assertEqual(checkvars, {}, 'Some variables not found')
-
-        self.assertIn('autotools', inherits, 'Missing inherit of autotools')
-        self.assertIn('pkgconfig', inherits, 'Missing inherit of pkgconfig')
+        inherits = ['autotools', 'pkgconfig']
+        self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_devtool_add(self):
         # Check preconditions
@@ -176,6 +167,103 @@ class DevtoolTests(oeSelfTest):
         self.assertFalse(matches, 'Stamp files exist for recipe libftdi that should have been cleaned')
         self.assertFalse(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), 'libftdi binary still found in STAGING_LIBDIR after cleaning')
 
+    def test_devtool_add_fetch(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        # Fetch source
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        testver = '0.23'
+        url = 'https://pypi.python.org/packages/source/J/MarkupSafe/MarkupSafe-%s.tar.gz' % testver
+        testrecipe = 'python-markupsafe'
+        srcdir = os.path.join(tempdir, testrecipe)
+        # Test devtool add
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
+        self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'setup.py')), 'Unable to find setup.py in source directory')
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(testrecipe, result.output)
+        self.assertIn(srcdir, result.output)
+        # Check recipe
+        recipefile = get_bb_var('FILE', testrecipe)
+        self.assertIn('%s.bb' % testrecipe, recipefile, 'Recipe file incorrectly named')
+        checkvars = {}
+        checkvars['S'] = '${WORKDIR}/MarkupSafe-%s' % testver
+        checkvars['SRC_URI'] = url
+        self._test_recipe_contents(recipefile, checkvars, [])
+        # Try with version specified
+        result = runCmd('devtool reset -n %s' % testrecipe)
+        shutil.rmtree(srcdir)
+        result = runCmd('devtool add %s %s -f %s -V %s' % (testrecipe, srcdir, url, testver))
+        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'setup.py')), 'Unable to find setup.py in source directory')
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(testrecipe, result.output)
+        self.assertIn(srcdir, result.output)
+        # Check recipe
+        recipefile = get_bb_var('FILE', testrecipe)
+        self.assertIn('%s_%s.bb' % (testrecipe, testver), recipefile, 'Recipe file incorrectly named')
+        checkvars = {}
+        checkvars['S'] = '${WORKDIR}/MarkupSafe-${PV}'
+        checkvars['SRC_URI'] = url.replace(testver, '${PV}')
+        self._test_recipe_contents(recipefile, checkvars, [])
+
+    def test_devtool_add_fetch_git(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        # Fetch source
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        url = 'git://git.yoctoproject.org/libmatchbox'
+        checkrev = '462f0652055d89c648ddd54fd7b03f175c2c6973'
+        testrecipe = 'libmatchbox2'
+        srcdir = os.path.join(tempdir, testrecipe)
+        # Test devtool add
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
+        self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure.ac in source directory')
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(testrecipe, result.output)
+        self.assertIn(srcdir, result.output)
+        # Check recipe
+        recipefile = get_bb_var('FILE', testrecipe)
+        self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly named')
+        checkvars = {}
+        checkvars['S'] = '${WORKDIR}/git'
+        checkvars['PV'] = '1.0+git${SRCPV}'
+        checkvars['SRC_URI'] = url
+        checkvars['SRCREV'] = '${AUTOREV}'
+        self._test_recipe_contents(recipefile, checkvars, [])
+        # Try with revision and version specified
+        result = runCmd('devtool reset -n %s' % testrecipe)
+        shutil.rmtree(srcdir)
+        url_rev = '%s;rev=%s' % (url, checkrev)
+        result = runCmd('devtool add %s %s -f "%s" -V 1.5' % (testrecipe, srcdir, url_rev))
+        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure.ac in source directory')
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(testrecipe, result.output)
+        self.assertIn(srcdir, result.output)
+        # Check recipe
+        recipefile = get_bb_var('FILE', testrecipe)
+        self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly named')
+        checkvars = {}
+        checkvars['S'] = '${WORKDIR}/git'
+        checkvars['PV'] = '1.5+git${SRCPV}'
+        checkvars['SRC_URI'] = url
+        checkvars['SRCREV'] = checkrev
+        self._test_recipe_contents(recipefile, checkvars, [])
+
     def test_devtool_modify(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
-- 
2.1.0


