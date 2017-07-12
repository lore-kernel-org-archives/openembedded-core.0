Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 974F078187
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:37:18 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133870"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:37:19 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:37:09 -0500
Message-Id: <2f57a895afd833f7067cb3430271d496c68490cf.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 23/29] oeqa/selftest/cases: recipetool enable for threaded runs
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
X-List-Received-Date: Wed, 12 Jul 2017 19:37:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Change to use wrappers from OESelfTestCase.
- Move templayer dir creation to RecipetoolBase class because
  now every class has its own build folder.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 105 +++++++++++++++--------------
 1 file changed, 54 insertions(+), 51 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index bdd405f1cc0..59544336578 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -3,30 +3,30 @@ import shutil
 import tempfile
 import urllib.parse
 
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
-from oeqa.utils.commands import get_bb_vars, create_temp_layer
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.selftest.cases import devtool
+from oeqa.utils.commands import create_temp_layer
+from oeqa.core.decorator.oeid import OETestID
 
-templayerdir = None
-
-def setUpModule():
-    global templayerdir
-    templayerdir = tempfile.mkdtemp(prefix='recipetoolqa')
-    create_temp_layer(templayerdir, 'selftestrecipetool')
-    runCmd('bitbake-layers add-layer %s' % templayerdir)
-
+class RecipetoolBase(devtool.DevtoolBase):
+    @classmethod
+    def setUpClass(cls):
+        super(RecipetoolBase, cls).setUpClass()
 
-def tearDownModule():
-    runCmd('bitbake-layers remove-layer %s' % templayerdir, ignore_status=True)
-    runCmd('rm -rf %s' % templayerdir)
+        cls.templayerdir = tempfile.mkdtemp(prefix='recipetoolqa')
+        create_temp_layer(cls.templayerdir, 'selftestrecipetool')
+        cls.runCmd('bitbake-layers add-layer %s' % cls.templayerdir)
 
+    @classmethod
+    def tearDownClass(cls):
+        super(RecipetoolBase, cls).tearDownClass()
 
-class RecipetoolBase(devtool.DevtoolBase):
+        cls.runCmd('bitbake-layers remove-layer %s' % cls.templayerdir,
+                ignore_status=True)
+        cls.runCmd('rm -rf %s' % cls.templayerdir)
 
     def setUpLocal(self):
         super(RecipetoolBase, self).setUpLocal()
-        self.templayerdir = templayerdir
+
         self.tempdir = tempfile.mkdtemp(prefix='recipetoolqa')
         self.track_for_cleanup(self.tempdir)
         self.testfile = os.path.join(self.tempdir, 'testfile')
@@ -34,15 +34,15 @@ class RecipetoolBase(devtool.DevtoolBase):
             f.write('Test file\n')
 
     def tearDownLocal(self):
-        runCmd('rm -rf %s/recipes-*' % self.templayerdir)
+        self.runCmd('rm -rf %s/recipes-*' % self.templayerdir)
         super(RecipetoolBase, self).tearDownLocal()
 
     def _try_recipetool_appendcmd(self, cmd, testrecipe, expectedfiles, expectedlines=None):
-        result = runCmd(cmd)
+        result = self.runCmd(cmd)
         self.assertNotIn('Traceback', result.output)
 
         # Check the bbappend was created and applies properly
-        recipefile = get_bb_var('FILE', testrecipe)
+        recipefile = self.get_bb_var('FILE', testrecipe)
         bbappendfile = self._check_bbappend(testrecipe, recipefile, self.templayerdir)
 
         # Check the bbappend contents
@@ -66,14 +66,16 @@ class RecipetoolBase(devtool.DevtoolBase):
 
 
 class RecipetoolTests(RecipetoolBase):
+    _use_own_builddir = True
+    _main_thread = False
 
     @classmethod
     def setUpClass(cls):
         super(RecipetoolTests, cls).setUpClass()
         # Ensure we have the right data in shlibs/pkgdata
         cls.logger.info('Running bitbake to generate pkgdata')
-        bitbake('-c packagedata base-files coreutils busybox selftest-recipetool-appendfile')
-        bb_vars = get_bb_vars(['COREBASE', 'BBPATH'])
+        cls.bitbake('-c packagedata base-files coreutils busybox selftest-recipetool-appendfile')
+        bb_vars = cls.get_bb_vars(['COREBASE', 'BBPATH'])
         cls.corebase = bb_vars['COREBASE']
         cls.bbpath = bb_vars['BBPATH']
 
@@ -83,7 +85,7 @@ class RecipetoolTests(RecipetoolBase):
 
     def _try_recipetool_appendfile_fail(self, destfile, newfile, checkerror):
         cmd = 'recipetool appendfile %s %s %s' % (self.templayerdir, destfile, newfile)
-        result = runCmd(cmd, ignore_status=True)
+        result = self.runCmd(cmd, ignore_status=True)
         self.assertNotEqual(result.status, 0, 'Command "%s" should have failed but didn\'t' % cmd)
         self.assertNotIn('Traceback', result.output)
         for errorstr in checkerror:
@@ -125,7 +127,7 @@ class RecipetoolTests(RecipetoolBase):
         bbappendfile, _ = self._try_recipetool_appendfile('coreutils', '/bin/ls', self.testfile, '-r coreutils', expectedlines, [testfile2name])
         # But file should have
         copiedfile = os.path.join(os.path.dirname(bbappendfile), 'coreutils', testfile2name)
-        result = runCmd('diff -q %s %s' % (testfile2, copiedfile), ignore_status=True)
+        result = self.runCmd('diff -q %s %s' % (testfile2, copiedfile), ignore_status=True)
         self.assertNotEqual(result.status, 0, 'New file should have been copied but was not %s' % result.output)
 
     @OETestID(1178)
@@ -133,7 +135,7 @@ class RecipetoolTests(RecipetoolBase):
         # Try appending a binary file
         # /bin/ls can be a symlink to /usr/bin/ls
         ls = os.path.realpath("/bin/ls")
-        result = runCmd('recipetool appendfile %s /bin/ls %s -r coreutils' % (self.templayerdir, ls))
+        result = self.runCmd('recipetool appendfile %s /bin/ls %s -r coreutils' % (self.templayerdir, ls))
         self.assertIn('WARNING: ', result.output)
         self.assertIn('is a binary', result.output)
 
@@ -326,7 +328,7 @@ class RecipetoolTests(RecipetoolBase):
         # Try creating a bbappend in a layer that's not in bblayers.conf and has a different structure
         exttemplayerdir = os.path.join(self.tempdir, 'extlayer')
         self._create_temp_layer(exttemplayerdir, False, 'oeselftestextlayer', recipepathspec='metadata/recipes/recipes-*/*')
-        result = runCmd('recipetool appendfile %s /usr/share/selftest-replaceme-orig %s' % (exttemplayerdir, self.testfile))
+        result = self.runCmd('recipetool appendfile %s /usr/share/selftest-replaceme-orig %s' % (exttemplayerdir, self.testfile))
         self.assertNotIn('Traceback', result.output)
         createdfiles = []
         for root, _, files in os.walk(exttemplayerdir):
@@ -341,7 +343,7 @@ class RecipetoolTests(RecipetoolBase):
     def test_recipetool_appendfile_wildcard(self):
 
         def try_appendfile_wc(options):
-            result = runCmd('recipetool appendfile %s /etc/profile %s %s' % (self.templayerdir, self.testfile, options))
+            result = self.runCmd('recipetool appendfile %s /etc/profile %s %s' % (self.templayerdir, self.testfile, options))
             self.assertNotIn('Traceback', result.output)
             bbappendfile = None
             for root, _, files in os.walk(self.templayerdir):
@@ -351,11 +353,11 @@ class RecipetoolTests(RecipetoolBase):
                         break
             if not bbappendfile:
                 self.fail('No bbappend file created')
-            runCmd('rm -rf %s/recipes-*' % self.templayerdir)
+            self.runCmd('rm -rf %s/recipes-*' % self.templayerdir)
             return bbappendfile
 
         # Check without wildcard option
-        recipefn = os.path.basename(get_bb_var('FILE', 'base-files'))
+        recipefn = os.path.basename(self.get_bb_var('FILE', 'base-files'))
         filename = try_appendfile_wc('')
         self.assertEqual(filename, recipefn.replace('.bb', '.bbappend'))
         # Now check with wildcard option
@@ -369,7 +371,7 @@ class RecipetoolTests(RecipetoolBase):
         os.makedirs(tempsrc)
         recipefile = os.path.join(self.tempdir, 'logrotate_3.8.7.bb')
         srcuri = 'https://github.com/logrotate/logrotate/archive/r3-8-7.tar.gz'
-        result = runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
+        result = self.runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = 'GPLv2'
@@ -381,16 +383,16 @@ class RecipetoolTests(RecipetoolBase):
 
     @OETestID(1194)
     def test_recipetool_create_git(self):
-        if 'x11' not in get_bb_var('DISTRO_FEATURES'):
+        if 'x11' not in self.get_bb_var('DISTRO_FEATURES'):
             self.skipTest('Test requires x11 as distro feature')
         # Ensure we have the right data in shlibs/pkgdata
-        bitbake('libpng pango libx11 libxext jpeg libcheck')
+        self.bitbake('libpng pango libx11 libxext jpeg libcheck')
         # Try adding a recipe
         tempsrc = os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
         recipefile = os.path.join(self.tempdir, 'libmatchbox.bb')
         srcuri = 'git://git.yoctoproject.org/libmatchbox'
-        result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri + ";rev=9f7cf8895ae2d39c465c04cc78e918c157420269", '-x', tempsrc])
+        result = self.runCmd(['recipetool', 'create', '-o', recipefile, srcuri + ";rev=9f7cf8895ae2d39c465c04cc78e918c157420269", '-x', tempsrc])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
         checkvars = {}
         checkvars['LICENSE'] = 'LGPLv2.1'
@@ -409,7 +411,7 @@ class RecipetoolTests(RecipetoolBase):
         os.makedirs(temprecipe)
         pv = '1.7.3.0'
         srcuri = 'http://www.dest-unreach.org/socat/download/socat-%s.tar.bz2' % pv
-        result = runCmd('recipetool create %s -o %s' % (srcuri, temprecipe))
+        result = self.runCmd('recipetool create %s -o %s' % (srcuri, temprecipe))
         dirlist = os.listdir(temprecipe)
         if len(dirlist) > 1:
             self.fail('recipetool created more than just one file; output:\n%s\ndirlist:\n%s' % (result.output, str(dirlist)))
@@ -432,7 +434,7 @@ class RecipetoolTests(RecipetoolBase):
         os.makedirs(temprecipe)
         recipefile = os.path.join(temprecipe, 'navit_0.5.0.bb')
         srcuri = 'http://downloads.sourceforge.net/project/navit/v0.5.0/navit-0.5.0.tar.gz'
-        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        result = self.runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['Unknown', 'GPLv2', 'LGPLv2'])
@@ -450,7 +452,7 @@ class RecipetoolTests(RecipetoolBase):
         os.makedirs(temprecipe)
         recipefile = os.path.join(temprecipe, 'meson_git.bb')
         srcuri = 'https://github.com/mesonbuild/meson;rev=0.32.0'
-        result = runCmd(['recipetool', 'create', '-o', temprecipe, srcuri])
+        result = self.runCmd(['recipetool', 'create', '-o', temprecipe, srcuri])
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['Apache-2.0'])
@@ -466,7 +468,7 @@ class RecipetoolTests(RecipetoolBase):
         pv = '0.32.0'
         recipefile = os.path.join(temprecipe, 'meson_%s.bb' % pv)
         srcuri = 'https://github.com/mesonbuild/meson/releases/download/%s/meson-%s.tar.gz' % (pv, pv)
-        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        result = self.runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['Apache-2.0'])
@@ -481,7 +483,7 @@ class RecipetoolTests(RecipetoolBase):
         os.makedirs(temprecipe)
         recipefile = os.path.join(temprecipe, 'matchbox-terminal_git.bb')
         srcuri = 'http://git.yoctoproject.org/git/matchbox-terminal'
-        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        result = self.runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['GPLv2'])
@@ -506,8 +508,8 @@ class RecipetoolTests(RecipetoolBase):
     def test_recipetool_load_plugin(self):
         """Test that recipetool loads only the first found plugin in BBPATH."""
 
-        recipetool = runCmd("which recipetool")
-        fromname = runCmd("recipetool --quiet pluginfile")
+        recipetool = self.runCmd("which recipetool")
+        fromname = self.runCmd("recipetool --quiet pluginfile")
         srcfile = fromname.output
         searchpath = self.bbpath.split(':') + [os.path.dirname(recipetool.output)]
         plugincontent = []
@@ -517,12 +519,12 @@ class RecipetoolTests(RecipetoolBase):
             self.assertIn('meta-selftest', srcfile, 'wrong bbpath plugin found')
             for path in searchpath:
                 self._copy_file_with_cleanup(srcfile, path, 'lib', 'recipetool')
-            result = runCmd("recipetool --quiet count")
+            result = self.runCmd("recipetool --quiet count")
             self.assertEqual(result.output, '1')
-            result = runCmd("recipetool --quiet multiloaded")
+            result = self.runCmd("recipetool --quiet multiloaded")
             self.assertEqual(result.output, "no")
             for path in searchpath:
-                result = runCmd("recipetool --quiet bbdir")
+                result = self.runCmd("recipetool --quiet bbdir")
                 self.assertEqual(result.output, path)
                 os.unlink(os.path.join(result.output, 'lib', 'recipetool', 'bbpath.py'))
         finally:
@@ -548,16 +550,15 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
 
     def _try_recipetool_appendsrcfile_fail(self, testrecipe, newfile, destfile, checkerror):
         cmd = 'recipetool appendsrcfile %s %s %s %s' % (self.templayerdir, testrecipe, newfile, destfile or '')
-        result = runCmd(cmd, ignore_status=True)
+        result = self.runCmd(cmd, ignore_status=True)
         self.assertNotEqual(result.status, 0, 'Command "%s" should have failed but didn\'t' % cmd)
         self.assertNotIn('Traceback', result.output)
         for errorstr in checkerror:
             self.assertIn(errorstr, result.output)
 
-    @staticmethod
-    def _get_first_file_uri(recipe):
+    def _get_first_file_uri(self, recipe):
         '''Return the first file:// in SRC_URI for the specified recipe.'''
-        src_uri = get_bb_var('SRC_URI', recipe).split()
+        src_uri = self.get_bb_var('SRC_URI', recipe).split()
         for uri in src_uri:
             p = urllib.parse.urlparse(uri)
             if p.scheme == 'file':
@@ -605,7 +606,7 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
 
         self._try_recipetool_appendsrcfiles(testrecipe, newfiles, expectedfiles=expectedfiles, destdir=destdir, options=options)
 
-        bb_vars = get_bb_vars(['SRC_URI', 'FILE', 'FILESEXTRAPATHS'], testrecipe)
+        bb_vars = self.get_bb_vars(['SRC_URI', 'FILE', 'FILESEXTRAPATHS'], testrecipe)
         src_uri = bb_vars['SRC_URI'].split()
         for f in expectedfiles:
             if destdir:
@@ -623,6 +624,8 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
 
 
 class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
+    _use_own_builddir = True
+    _main_thread = False
 
     @OETestID(1273)
     def test_recipetool_appendsrcfile_basic(self):
@@ -632,7 +635,7 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
     def test_recipetool_appendsrcfile_basic_wildcard(self):
         testrecipe = 'base-files'
         self._test_appendsrcfile(testrecipe, 'a-file', options='-w')
-        recipefile = get_bb_var('FILE', testrecipe)
+        recipefile = self.get_bb_var('FILE', testrecipe)
         bbappendfile = self._check_bbappend(testrecipe, recipefile, self.templayerdir)
         self.assertEqual(os.path.basename(bbappendfile), '%s_%%.bbappend' % testrecipe)
 
@@ -647,7 +650,7 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
     @OETestID(1280)
     def test_recipetool_appendsrcfile_srcdir_basic(self):
         testrecipe = 'bash'
-        bb_vars = get_bb_vars(['S', 'WORKDIR'], testrecipe)
+        bb_vars = self.get_bb_vars(['S', 'WORKDIR'], testrecipe)
         srcdir = bb_vars['S']
         workdir = bb_vars['WORKDIR']
         subdir = os.path.relpath(srcdir, workdir)
@@ -674,13 +677,13 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
     def test_recipetool_appendsrcfile_replace_file_srcdir(self):
         testrecipe = 'bash'
         filepath = 'Makefile.in'
-        bb_vars = get_bb_vars(['S', 'WORKDIR'], testrecipe)
+        bb_vars = self.get_bb_vars(['S', 'WORKDIR'], testrecipe)
         srcdir = bb_vars['S']
         workdir = bb_vars['WORKDIR']
         subdir = os.path.relpath(srcdir, workdir)
 
         self._test_appendsrcfile(testrecipe, filepath, srcdir=subdir)
-        bitbake('%s:do_unpack' % testrecipe)
+        self.bitbake('%s:do_unpack' % testrecipe)
         self.assertEqual(open(self.testfile, 'r').read(), open(os.path.join(srcdir, filepath), 'r').read())
 
     @OETestID(1278)
-- 
2.11.0


