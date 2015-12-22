Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9ECD77326E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:05:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:05:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979389"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:05:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:18 +1300
Message-Id: <5257d230c019361b9d54a809e4a78b3360ac4953.1450756556.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 25/26] oe-selftest: add tests for simple devtool add / recipetool create URL case
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
X-List-Received-Date: Tue, 22 Dec 2015 04:05:20 -0000

Add an oe-selftest test case for the newly supported syntax with only
the remote URL specified (auto-detecting name and version).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py    | 63 ++++++++++++++++++++++++++++++++----
 meta/lib/oeqa/selftest/recipetool.py | 19 +++++++++++
 2 files changed, 76 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 7af82df..41e1b4b 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -15,18 +15,43 @@ class DevtoolBase(oeSelfTest):
 
     def _test_recipe_contents(self, recipefile, checkvars, checkinherits):
         with open(recipefile, 'r') as f:
+            invar = None
+            invalue = None
             for line in f:
-                if '=' in line:
+                var = None
+                if invar:
+                    value = line.strip().strip('"')
+                    if value.endswith('\\'):
+                        invalue += ' ' + value[:-1].strip()
+                        continue
+                    else:
+                        invalue += ' ' + value.strip()
+                        var = invar
+                        value = invalue
+                        invar = None
+                elif '=' in line:
                     splitline = line.split('=', 1)
                     var = splitline[0].rstrip()
                     value = splitline[1].strip().strip('"')
-                    if var in checkvars:
-                        needvalue = checkvars.pop(var)
-                        self.assertEqual(value, needvalue, 'values for %s do not match' % var)
-                if line.startswith('inherit '):
+                    if value.endswith('\\'):
+                        invalue = value[:-1].strip()
+                        invar = var
+                        continue
+                elif line.startswith('inherit '):
                     inherits = line.split()[1:]
 
-        self.assertEqual(checkvars, {}, 'Some variables not found: %s' % checkvars)
+                if var and var in checkvars:
+                    needvalue = checkvars.pop(var)
+                    if needvalue is None:
+                        self.fail('Variable %s should not appear in recipe')
+                    self.assertEqual(value, needvalue, 'values for %s do not match' % var)
+
+
+        missingvars = {}
+        for var, value in checkvars.iteritems():
+            if value is not None:
+                missingvars[var] = value
+        self.assertEqual(missingvars, {}, 'Some expected variables not found in recipe: %s' % checkvars)
 
         for inherit in checkinherits:
             self.assertIn(inherit, inherits, 'Missing inherit of %s' % inherit)
@@ -304,6 +329,32 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRCREV'] = checkrev
         self._test_recipe_contents(recipefile, checkvars, [])
 
+    def test_devtool_add_fetch_simple(self):
+        # Fetch source from a remote URL, auto-detecting name
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        testver = '1.6.0'
+        url = 'http://www.ivarch.com/programs/sources/pv-%s.tar.bz2' % testver
+        testrecipe = 'pv'
+        srcdir = os.path.join(self.workspacedir, 'sources', testrecipe)
+        # Test devtool add
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool add %s' % url)
+        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created. %s' % result.output)
+        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure')), 'Unable to find configure script in source directory')
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(testrecipe, result.output)
+        self.assertIn(srcdir, result.output)
+        # Check recipe
+        recipefile = get_bb_var('FILE', testrecipe)
+        self.assertIn('%s_%s.bb' % (testrecipe, testver), recipefile, 'Recipe file incorrectly named')
+        checkvars = {}
+        checkvars['S'] = None
+        checkvars['SRC_URI'] = url.replace(testver, '${PV}')
+        self._test_recipe_contents(recipefile, checkvars, [])
+
     @testcase(1164)
     def test_devtool_modify(self):
         # Clean up anything in the workdir/sysroot/sstate cache
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index bbfce7c..34e383f 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -401,6 +401,25 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['autotools', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    def test_recipetool_create_simple(self):
+        # Try adding a recipe
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pv = '1.7.3.0'
+        srcuri = 'http://www.dest-unreach.org/socat/download/socat-%s.tar.bz2' % pv
+        result = runCmd('recipetool create %s -o %s' % (srcuri, temprecipe))
+        dirlist = os.listdir(temprecipe)
+        if len(dirlist) < 1 or not os.path.isfile(os.path.join(temprecipe, dirlist[0])):
+            self.fail('recipetool did not create recipe file; output:\n%s' % result.output)
+        self.assertEqual(dirlist[0], 'socat_%s.bb' % pv, 'Recipe file incorrectly named')
+        checkvars = {}
+        checkvars['LICENSE'] = 'Unknown GPLv2'
+        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4 file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
+        # We don't check DEPENDS since they are variable for this recipe depending on what's in the sysroot
+        checkvars['S'] = None
+        checkvars['SRC_URI'] = srcuri.replace(pv, '${PV}')
+        inherits = ['autotools']
+        self._test_recipe_contents(os.path.join(temprecipe, dirlist[0]), checkvars, inherits)
 
 class RecipetoolAppendsrcBase(RecipetoolBase):
     def _try_recipetool_appendsrcfile(self, testrecipe, newfile, destfile, options, expectedlines, expectedfiles):
-- 
2.5.0


