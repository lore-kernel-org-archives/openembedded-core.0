Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 26A21771AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316032"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:23:03 -0700
Message-Id: <a1197033ebfda1d5081f94a37399dd5129b32b59.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 15/20] oeqa.selftest.recipetool: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:23 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/conf/recipetool.conf |  84 +++++++
 meta/lib/oeqa/selftest/recipetool.py        | 326 +++++++++++++++++++++-------
 2 files changed, 332 insertions(+), 78 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/recipetool.conf

diff --git a/meta/lib/oeqa/selftest/conf/recipetool.conf b/meta/lib/oeqa/selftest/conf/recipetool.conf
new file mode 100644
index 0000000..254c634
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/recipetool.conf
@@ -0,0 +1,84 @@
+[RecipetoolTests]
+setupclass_logger_name = selftest
+setupclass_logger_info = Running bitbake to generate pkgdata
+setupclass_recipe_1 = base-files
+setupclass_recipe_2 = coreutils
+setupclass_recipe_3 = busybox
+recipetool_appendfile_basic_recipe = base-files
+recipetool_appendfile_basic_lines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n', 
+    '\n']
+recipetool_appendfile_appendfile = motd
+recipetool_appendfile_alternatives_append_file = /bin/ls
+recipetool_appendfile_alternatives_error_msg = {'ERROR: File /bin/ls is an alternative possibly provided by the following recipes:', 'coreutils', 'busybox'}
+recipetool_appendfile_alternatives_testfile_2 = oe-init-build-env
+recipetool_appendfile_alternatives_testrecipe = coreutils
+# /bin/ls can be a symlink to /usr/bin/ls
+recipetool_appendfile_binary_append_file = /bin/ls
+recipetool_appendfile_binary_testrecipe = coreutils
+recipetool_appendfile_add_append_file = netbase
+recipetool_appendfile_add_testfile_2 = oe-init-build-env
+recipetool_appendfile_add_bindir_append_file = netbase
+recipetool_appendfile_add_machine_append_file = netbase
+# append_testfile is used in tests 1184, 1191, 1187, 1190, 1189, 1181, 1182,
+# 1185, 1188, 1180, 1186
+recipetool_appendfile_append_testfile = selftest-recipetool-appendfile
+recipetool_appendfile_wildcard_recipe = base-files
+recipetool_create_recipe = srctree
+recipetool_create_recipe_file = logrotate_3.8.7.bb
+recipetool_create_srcuri = https://fedorahosted.org/releases/l/o/logrotate/logrotate-3.8.7.tar.gz
+recipetool_create_license = GPLv2
+recipetool_create_licfileschksum =  18810669f13b87348459e611d31ab760
+recipetool_create_src_uri = https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz
+recipetool_create_srcuri_md5sum = 99e08503ef24c3e2e3ff74cc5f3be213
+recipetool_create_srcuri_sha256sum = f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64
+recipetool_create_git_recipes = 'libpng pango libx11 libxext jpeg libcheck'
+recipetool_create_git_recipe_1 = srctree
+recipetool_create_git_srcuri = git://git.yoctoproject.org/libmatchbox
+recipetool_create_git_rev = 9f7cf8895ae2d39c465c04cc78e918c157420269
+
+recipetool_create_git_recipe_file = libmatchbox.bb
+recipetool_create_git_license = LGPLv2.1                    
+recipetool_create_git_licfileschksum =  7fbc338309ac38fefcd64b04bb903e34
+recipetool_create_git_pv = 1.11
+recipetool_create_git_set_depends = {'libcheck', 'libjpeg-turbo', 'libpng', 'libx11', 'libxext', 'pango'}
+recipetool_create_git_inherit_1 = autotools
+recipetool_create_git_inherit_2 = pkgconfig
+recipetool_create_simple_recipe = recipe
+recipetool_create_simple_pv = 1.7.3.0
+recipetool_create_simple_srcuri = http://www.dest-unreach.org/socat/download/socat-%(recipetool_create_simple_pv)s.tar.bz2
+recipetool_create_simple_set_license = {'Unknown', 'GPLv2'}
+recipetool_create_simple_set_fileschksum = {'file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4', 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'}
+recipetool_create_simple_s = None
+recipetool_create_simple_inherits = autotools
+recipetool_create_cmake_recipe = recipe
+recipetool_create_cmake_recipe_file = navit_0.5.0.bb
+recipetool_create_cmake_srcuri = http://downloads.sourceforge.net/project/navit/v0.5.0/navit-0.5.0.tar.gz
+recipetool_create_cmake_set_license = {'Unknown', 'GPLv2', 'LGPLv2'} 
+recipetool_create_cmake_src_uri = http://downloads.sourceforge.net/project/navit/v${PV}/navit-${PV}.tar.gz
+recipetool_create_cmake_md5sum = 242f398e979a6b8c0f3c802b63435b68
+recipetool_create_cmake_sha256sum = 13353481d7fc01a4f64e385dda460b51496366bba0fd2cc85a89a0747910e94d
+recipetool_create_cmake_set_depends = {'freetype', 'zlib', 'openssl', 'glib-2.0', 'virtual/libgl', 'virtual/egl', 'gtk+', 'libpng', 'libsdl', 'freeglut', 'dbus-glib'}
+recipetool_create_cmake_inherits_recipes = {'cmake', 'python-dir', 'gettext', 'pkgconfig'}
+recipetool_create_github_recipe_file = meson_git.bb
+recipetool_create_github_srcuri = https://github.com/mesonbuild/meson
+recipetool_create_github_license = Apache-2.0
+recipetool_create_github_git_srcuri = git://github.com/mesonbuild/meson;protocol=https
+recipetool_create_github_inherits = {'setuptools'} 
+recipetool_create_github_tarball_pv = 0.32.0
+recipetool_create_github_tarball_recipe_file = meson
+recipetool_create_github_tarball_srcuri = https://github.com/mesonbuild/meson/releases/download/
+recipetool_create_github_tarball_license = Apache-2.0
+recipetool_create_github_tarball_inherits = setuptools
+recipetool_create_git_http_recipe_file = matchbox-terminal_git.bb
+recipetool_create_git_http_srcuri = http://git.yoctoproject.org/git/matchbox-terminal
+recipetool_create_git_http_git_srcuri = git://git.yoctoproject.org/git/matchbox-terminal;protocol=http
+recipetool_create_git_http_license = GPLv2
+recipetool_create_git_http_inherits = {'pkgconfig', 'autotools'}
+
+
+[RecipetoolAppendsrcTests]
+recipetool_appendsrcfile_base_files = base-files
+recipetool_appendsrcfile_file_1 = a-file
+recipetool_appendsrcfile_recipe = bash
+recipetool_appendsrcfile_filepath = Makefile.in
+
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index db1f8de..0468163 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -6,7 +6,7 @@ import urllib.parse
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.decorators import testcase
 from oeqa.selftest import devtool
-
+from oeqa.utils.readconfig import conffile
 
 templayerdir = None
 
@@ -66,10 +66,25 @@ class RecipetoolBase(devtool.DevtoolBase):
 class RecipetoolTests(RecipetoolBase):
     @classmethod
     def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+        logger_name = cls.config.get(
+                    'RecipetoolTests', 'setupclass_logger_name')
+        logger_info = cls.config.get(
+                    'RecipetoolTests', 'setupclass_logger_info')
+        recipe_1 = cls.config.get(
+                 'RecipetoolTests', 'setupclass_recipe_1')
+        recipe_2 = cls.config.get(
+                 'RecipetoolTests', 'setupclass_recipe_2')
+        recipe_3 = cls.config.get(
+                 'RecipetoolTests', 'setupclass_recipe_3')
+        cls.append_testfile = cls.config.get(
+                    'RecipetoolTests', 'recipetool_appendfile_append_testfile')
         # Ensure we have the right data in shlibs/pkgdata
-        logger = logging.getLogger("selftest")
-        logger.info('Running bitbake to generate pkgdata')
-        bitbake('-c packagedata base-files coreutils busybox selftest-recipetool-appendfile')
+        logger = logging.getLogger(logger_name)
+        logger.info(logger_info)
+        bitbake('-c packagedata %s %s %s selftest-recipetool-appendfile'
+                % (recipe_1, recipe_2, recipe_3))
 
     @classmethod
     def tearDownClass(cls):
@@ -90,10 +105,17 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1177)
     def test_recipetool_appendfile_basic(self):
+        # Get test configurations from configuration file
+        recipe = self.config.get(
+               'RecipetoolTests', 'recipetool_appendfile_basic_recipe')
+        appendfile = self.config.get(
+                   'RecipetoolTests', 'recipetool_appendfile_appendfile')
         # Basic test
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                         '\n']
-        _, output = self._try_recipetool_appendfile('base-files', '/etc/motd', self.testfile, '', expectedlines, ['motd'])
+        _, output = self._try_recipetool_appendfile(
+                  'base-files', '/etc/%s' % appendfile, self.testfile,
+                  '', expectedlines, [appendfile])
         self.assertNotIn('WARNING: ', output)
 
     @testcase(1183)
@@ -105,12 +127,22 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1176)
     def test_recipetool_appendfile_alternatives(self):
+        # Test configuration is taken from conf file
+        append_file = self.config.get(
+          'RecipetoolTests', 'recipetool_appendfile_alternatives_append_file')
+        error_msg = eval(self.config.get(
+            'RecipetoolTests', 'recipetool_appendfile_alternatives_error_msg'))
+        testfile_2 = self.config.get(
+            'RecipetoolTests', 'recipetool_appendfile_alternatives_testfile_2')
+        testrecipe = self.config.get(
+            'RecipetoolTests', 'recipetool_appendfile_alternatives_testrecipe')
         # Now try with a file we know should be an alternative
         # (this is very much a fake example, but one we know is reliably an alternative)
-        self._try_recipetool_appendfile_fail('/bin/ls', self.testfile, ['ERROR: File /bin/ls is an alternative possibly provided by the following recipes:', 'coreutils', 'busybox'])
+        self._try_recipetool_appendfile_fail(append_file, self.testfile,
+                                             error_msg)
         corebase = get_bb_var('COREBASE')
         # Need a test file - should be executable
-        testfile2 = os.path.join(corebase, 'oe-init-build-env')
+        testfile2 = os.path.join(corebase, testfile_2)
         testfile2name = os.path.basename(testfile2)
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -120,25 +152,41 @@ class RecipetoolTests(RecipetoolBase):
                          '    install -d ${D}${base_bindir}\n',
                          '    install -m 0755 ${WORKDIR}/%s ${D}${base_bindir}/ls\n' % testfile2name,
                          '}\n']
-        self._try_recipetool_appendfile('coreutils', '/bin/ls', testfile2, '-r coreutils', expectedlines, [testfile2name])
+        self._try_recipetool_appendfile(testrecipe, append_file, testfile2,
+                                        '-r %s' % testrecipe, expectedlines,
+                                        [testfile2name])
         # Now try bbappending the same file again, contents should not change
-        bbappendfile, _ = self._try_recipetool_appendfile('coreutils', '/bin/ls', self.testfile, '-r coreutils', expectedlines, [testfile2name])
+        bbappendfile, _ = self._try_recipetool_appendfile(
+                        testrecipe, append_file, self.testfile,
+                        '-r %s' % testrecipe, expectedlines, [testfile2name])
         # But file should have
-        copiedfile = os.path.join(os.path.dirname(bbappendfile), 'coreutils', testfile2name)
+        copiedfile = os.path.join(
+                   os.path.dirname(bbappendfile), testrecipe, testfile2name)
         result = runCmd('diff -q %s %s' % (testfile2, copiedfile), ignore_status=True)
         self.assertNotEqual(result.status, 0, 'New file should have been copied but was not %s' % result.output)
 
     @testcase(1178)
     def test_recipetool_appendfile_binary(self):
+        # Test configuration is taken from conf file
+        append_file = self.config.get(
+                'RecipetoolTests', 'recipetool_appendfile_binary_append_file')
+        testrecipe = self.config.get(
+                'RecipetoolTests', 'recipetool_appendfile_binary_testrecipe')
         # Try appending a binary file
         # /bin/ls can be a symlink to /usr/bin/ls
-        ls = os.path.realpath("/bin/ls")
-        result = runCmd('recipetool appendfile %s /bin/ls %s -r coreutils' % (self.templayerdir, ls))
+        ls = os.path.realpath(append_file)
+        result = runCmd('recipetool appendfile %s %s %s -r %s'
+                        % (self.templayerdir, append_file, ls, testrecipe))
         self.assertIn('WARNING: ', result.output)
         self.assertIn('is a binary', result.output)
 
     @testcase(1173)
     def test_recipetool_appendfile_add(self):
+        # Test configuration is taken from conf file
+        append_file = self.config.get(
+                    'RecipetoolTests', 'recipetool_appendfile_add_append_file')
+        testfile_2 = self.config.get(
+                   'RecipetoolTests', 'recipetool_appendfile_add_testfile_2')
         corebase = get_bb_var('COREBASE')
         # Try arbitrary file add to a recipe
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -149,10 +197,12 @@ class RecipetoolTests(RecipetoolBase):
                          '    install -d ${D}${datadir}\n',
                          '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/something\n',
                          '}\n']
-        self._try_recipetool_appendfile('netbase', '/usr/share/something', self.testfile, '-r netbase', expectedlines, ['testfile'])
+        self._try_recipetool_appendfile(append_file, '/usr/share/something',
+                                        self.testfile, '-r %s' % append_file,
+                                        expectedlines, ['testfile'])
         # Try adding another file, this time where the source file is executable
         # (so we're testing that, plus modifying an existing bbappend)
-        testfile2 = os.path.join(corebase, 'oe-init-build-env')
+        testfile2 = os.path.join(corebase, testfile_2)
         testfile2name = os.path.basename(testfile2)
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -165,10 +215,14 @@ class RecipetoolTests(RecipetoolBase):
                          '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/something\n',
                          '    install -m 0755 ${WORKDIR}/%s ${D}${datadir}/scriptname\n' % testfile2name,
                          '}\n']
-        self._try_recipetool_appendfile('netbase', '/usr/share/scriptname', testfile2, '-r netbase', expectedlines, ['testfile', testfile2name])
+        self._try_recipetool_appendfile(
+            append_file, '/usr/share/scriptname', testfile2,
+            '-r %s' % append_file, expectedlines, ['testfile', testfile2name])
 
     @testcase(1174)
     def test_recipetool_appendfile_add_bindir(self):
+        append_file = self.config.get(
+            'RecipetoolTests', 'recipetool_appendfile_add_bindir_append_file')
         # Try arbitrary file add to a recipe, this time to a location such that should be installed as executable
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -178,11 +232,16 @@ class RecipetoolTests(RecipetoolBase):
                          '    install -d ${D}${bindir}\n',
                          '    install -m 0755 ${WORKDIR}/testfile ${D}${bindir}/selftest-recipetool-testbin\n',
                          '}\n']
-        _, output = self._try_recipetool_appendfile('netbase', '/usr/bin/selftest-recipetool-testbin', self.testfile, '-r netbase', expectedlines, ['testfile'])
+        _, output = self._try_recipetool_appendfile(
+                  append_file, '/usr/bin/selftest-recipetool-testbin',
+                  self.testfile, '-r %s' % append_file,
+                  expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
     @testcase(1175)
     def test_recipetool_appendfile_add_machine(self):
+        append_file = self.config.get(
+                    'RecipetoolTests', 'recipetool_appendfile_add_append_file')
         # Try arbitrary file add to a recipe, this time to a location such that should be installed as executable
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -194,7 +253,10 @@ class RecipetoolTests(RecipetoolBase):
                          '    install -d ${D}${datadir}\n',
                          '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/something\n',
                          '}\n']
-        _, output = self._try_recipetool_appendfile('netbase', '/usr/share/something', self.testfile, '-r netbase -m mymachine', expectedlines, ['mymachine/testfile'])
+        _, output = self._try_recipetool_appendfile(
+                  append_file, '/usr/share/something', self.testfile,
+                  '-r %s -m mymachine' % append_file, expectedlines,
+                  ['mymachine/testfile'])
         self.assertNotIn('WARNING: ', output)
 
     @testcase(1184)
@@ -355,8 +417,10 @@ class RecipetoolTests(RecipetoolBase):
             runCmd('rm -rf %s/recipes-*' % self.templayerdir)
             return bbappendfile
 
+        recipe = self.config.get(
+               'RecipetoolTests', 'recipetool_appendfile_wildcard_recipe')
         # Check without wildcard option
-        recipefn = os.path.basename(get_bb_var('FILE', 'base-files'))
+        recipefn = os.path.basename(get_bb_var('FILE', recipe))
         filename = try_appendfile_wc('')
         self.assertEqual(filename, recipefn.replace('.bb', '.bbappend'))
         # Now check with wildcard option
@@ -365,49 +429,98 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1193)
     def test_recipetool_create(self):
+        # Test configuration is taken from conf file
+        recipe = self.config.get(
+               'RecipetoolTests', 'recipetool_create_recipe')
+        recipe_file = self.config.get(
+                    'RecipetoolTests', 'recipetool_create_recipe_file')
+        srcuri = self.config.get(
+               'RecipetoolTests', 'recipetool_create_srcuri')
+        license = self.config.get(
+                'RecipetoolTests', 'recipetool_create_license')
+        licfileschksum = self.config.get(
+                       'RecipetoolTests', 'recipetool_create_licfileschksum')
+        src_uri = self.config.get(
+                'RecipetoolTests', 'recipetool_create_src_uri')
+        srcuri_md5sum = self.config.get(
+                      'RecipetoolTests', 'recipetool_create_srcuri_md5sum')
+        srcuri_sha256sum = self.config.get(
+                    'RecipetoolTests', 'recipetool_create_srcuri_sha256sum')
         # Try adding a recipe
-        tempsrc = os.path.join(self.tempdir, 'srctree')
+        tempsrc = os.path.join(self.tempdir, recipe)
         os.makedirs(tempsrc)
-        recipefile = os.path.join(self.tempdir, 'logrotate_3.8.7.bb')
-        srcuri = 'https://fedorahosted.org/releases/l/o/logrotate/logrotate-3.8.7.tar.gz'
+        recipefile = os.path.join(self.tempdir, recipe_file)
         result = runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = 'GPLv2'
-        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=18810669f13b87348459e611d31ab760'
-        checkvars['SRC_URI'] = 'https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] = '99e08503ef24c3e2e3ff74cc5f3be213'
-        checkvars['SRC_URI[sha256sum]'] = 'f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64'
+        checkvars['LICENSE'] = license
+        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=%s' % licfileschksum
+        checkvars['SRC_URI'] = src_uri
+        checkvars['SRC_URI[md5sum]'] = srcuri_md5sum
+        checkvars['SRC_URI[sha256sum]'] = srcuri_sha256sum
         self._test_recipe_contents(recipefile, checkvars, [])
 
     @testcase(1194)
     def test_recipetool_create_git(self):
+        # Test configuration is taken from conf file
+        recipes = eval(self.config.get(
+                        'RecipetoolTests', 'recipetool_create_git_recipes'))
+        recipe_1 = self.config.get(
+                 'RecipetoolTests', 'recipetool_create_git_recipe_1')
+        srcuri = self.config.get(
+               'RecipetoolTests', 'recipetool_create_git_srcuri')
+        rev = self.config.get(
+               'RecipetoolTests', 'recipetool_create_git_rev')
+        recipe_file = self.config.get(
+                    'RecipetoolTests', 'recipetool_create_git_recipe_file')
+        license = self.config.get(
+                'RecipetoolTests', 'recipetool_create_git_license')
+        licfileschksum = self.config.get(
+                    'RecipetoolTests', 'recipetool_create_git_licfileschksum')
+        pv = self.config.get('RecipetoolTests', 'recipetool_create_git_pv')
+        set_depends = eval(self.config.get(
+                      'RecipetoolTests', 'recipetool_create_git_set_depends'))
+        inherit_1 = self.config.get(
+                  'RecipetoolTests', 'recipetool_create_git_inherit_1')
+        inherit_2 = self.config.get(
+                  'RecipetoolTests', 'recipetool_create_git_inherit_2')
         # Ensure we have the right data in shlibs/pkgdata
-        bitbake('libpng pango libx11 libxext jpeg libcheck')
+        bitbake(recipes)
         # Try adding a recipe
-        tempsrc = os.path.join(self.tempdir, 'srctree')
+        tempsrc = os.path.join(self.tempdir, recipe_1)
         os.makedirs(tempsrc)
-        recipefile = os.path.join(self.tempdir, 'libmatchbox.bb')
-        srcuri = 'git://git.yoctoproject.org/libmatchbox'
-        result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri + ";rev=9f7cf8895ae2d39c465c04cc78e918c157420269", '-x', tempsrc])
+        recipefile = os.path.join(self.tempdir, recipe_file)
+        result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri +
+                         ";rev=%s" % rev, '-x', tempsrc])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
         checkvars = {}
-        checkvars['LICENSE'] = 'LGPLv2.1'
-        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34'
+        checkvars['LICENSE'] = license
+        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=%s' % licfileschksum
         checkvars['S'] = '${WORKDIR}/git'
-        checkvars['PV'] = '1.11+git${SRCPV}'
+        checkvars['PV'] = '%s+git${SRCPV}' % pv
         checkvars['SRC_URI'] = srcuri
-        checkvars['DEPENDS'] = set(['libcheck', 'libjpeg-turbo', 'libpng', 'libx11', 'libxext', 'pango'])
-        inherits = ['autotools', 'pkgconfig']
+        checkvars['DEPENDS'] = set(set_depends)
+        inherits = [inherit_1, inherit_2]
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     @testcase(1392)
     def test_recipetool_create_simple(self):
+        # Test configuration is taken from conf file
+        recipe = self.config.get(
+               'RecipetoolTests', 'recipetool_create_simple_recipe')
+        pv = self.config.get('RecipetoolTests', 'recipetool_create_simple_pv')
+        srcuri = self.config.get(
+               'RecipetoolTests', 'recipetool_create_simple_srcuri')
+        set_license = eval(self.config.get(
+                    'RecipetoolTests', 'recipetool_create_simple_set_license'))
+        set_fileschksum = eval(self.config.get(
+                'RecipetoolTests', 'recipetool_create_simple_set_fileschksum'))
+        s = self.config.get('RecipetoolTests', 'recipetool_create_simple_s')
+        inherits = self.config.get(
+                 'RecipetoolTests', 'recipetool_create_simple_inherits')
         # Try adding a recipe
-        temprecipe = os.path.join(self.tempdir, 'recipe')
+        temprecipe = os.path.join(self.tempdir, recipe)
         os.makedirs(temprecipe)
-        pv = '1.7.3.0'
-        srcuri = 'http://www.dest-unreach.org/socat/download/socat-%s.tar.bz2' % pv
         result = runCmd('recipetool create %s -o %s' % (srcuri, temprecipe))
         dirlist = os.listdir(temprecipe)
         if len(dirlist) > 1:
@@ -416,73 +529,117 @@ class RecipetoolTests(RecipetoolBase):
             self.fail('recipetool did not create recipe file; output:\n%s\ndirlist:\n%s' % (result.output, str(dirlist)))
         self.assertEqual(dirlist[0], 'socat_%s.bb' % pv, 'Recipe file incorrectly named')
         checkvars = {}
-        checkvars['LICENSE'] = set(['Unknown', 'GPLv2'])
-        checkvars['LIC_FILES_CHKSUM'] = set(['file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4', 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'])
+        checkvars['LICENSE'] = set(set_license)
+        checkvars['LIC_FILES_CHKSUM'] = set(set_fileschksum)
         # We don't check DEPENDS since they are variable for this recipe depending on what's in the sysroot
         checkvars['S'] = None
         checkvars['SRC_URI'] = srcuri.replace(pv, '${PV}')
-        inherits = ['autotools']
+        inherits = [inherits]
         self._test_recipe_contents(os.path.join(temprecipe, dirlist[0]), checkvars, inherits)
 
     @testcase(1418)
     def test_recipetool_create_cmake(self):
+        # Test configuration is taken from conf file
+        recipe = self.config.get(
+               'RecipetoolTests', 'recipetool_create_cmake_recipe')
+        recipe_file = self.config.get(
+                    'RecipetoolTests', 'recipetool_create_cmake_recipe_file')
+        srcuri = self.config.get(
+               'RecipetoolTests', 'recipetool_create_cmake_srcuri')
+        set_license = eval(self.config.get(
+                    'RecipetoolTests', 'recipetool_create_cmake_set_license'))
+        src_uri = self.config.get(
+                'RecipetoolTests', 'recipetool_create_cmake_src_uri')
+        md5sum = self.config.get(
+               'RecipetoolTests', 'recipetool_create_cmake_md5sum')
+        sha256sum = self.config.get(
+                  'RecipetoolTests', 'recipetool_create_cmake_sha256sum')
+        set_depends = eval(self.config.get(
+                    'RecipetoolTests', 'recipetool_create_cmake_set_depends'))
+        inherits_recipes = eval(self.config.get(
+                'RecipetoolTests', 'recipetool_create_cmake_inherits_recipes'))
         # Try adding a recipe
-        temprecipe = os.path.join(self.tempdir, 'recipe')
+        temprecipe = os.path.join(self.tempdir, recipe)
         os.makedirs(temprecipe)
-        recipefile = os.path.join(temprecipe, 'navit_0.5.0.bb')
-        srcuri = 'http://downloads.sourceforge.net/project/navit/v0.5.0/navit-0.5.0.tar.gz'
+        recipefile = os.path.join(temprecipe, recipe_file)
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Unknown', 'GPLv2', 'LGPLv2'])
-        checkvars['SRC_URI'] = 'http://downloads.sourceforge.net/project/navit/v${PV}/navit-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] = '242f398e979a6b8c0f3c802b63435b68'
-        checkvars['SRC_URI[sha256sum]'] = '13353481d7fc01a4f64e385dda460b51496366bba0fd2cc85a89a0747910e94d'
-        checkvars['DEPENDS'] = set(['freetype', 'zlib', 'openssl', 'glib-2.0', 'virtual/libgl', 'virtual/egl', 'gtk+', 'libpng', 'libsdl', 'freeglut', 'dbus-glib'])
-        inherits = ['cmake', 'python-dir', 'gettext', 'pkgconfig']
+        checkvars['LICENSE'] = set(set_license)
+        checkvars['SRC_URI'] = src_uri
+        checkvars['SRC_URI[md5sum]'] = md5sum
+        checkvars['SRC_URI[sha256sum]'] = sha256sum
+        checkvars['DEPENDS'] = set(set_depends)
+        inherits = inherits_recipes
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_github(self):
+        recipe_file = self.config.get(
+                    'RecipetoolTests', 'recipetool_create_github_recipe_file')
+        srcuri = self.config.get(
+               'RecipetoolTests', 'recipetool_create_github_srcuri')
+        license = self.config.get(
+                'RecipetoolTests', 'recipetool_create_github_license')
+        git_srcuri = self.config.get(
+                   'RecipetoolTests', 'recipetool_create_github_git_srcuri')
+        inherits = eval(self.config.get(
+                 'RecipetoolTests', 'recipetool_create_github_inherits'))
         # Basic test to see if github URL mangling works
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        recipefile = os.path.join(temprecipe, 'meson_git.bb')
-        srcuri = 'https://github.com/mesonbuild/meson'
+        recipefile = os.path.join(temprecipe, recipe_file)
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0'])
-        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https'
-        inherits = ['setuptools']
+        checkvars['LICENSE'] = set([license])
+        checkvars['SRC_URI'] = git_srcuri
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_github_tarball(self):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        pv = '0.32.0'
-        recipefile = os.path.join(temprecipe, 'meson_%s.bb' % pv)
-        srcuri = 'https://github.com/mesonbuild/meson/releases/download/%s/meson-%s.tar.gz' % (pv, pv)
+        pv = self.config.get(
+           'RecipetoolTests', 'recipetool_create_github_tarball_pv')
+        recipe_file = self.config.get(
+             'RecipetoolTests', 'recipetool_create_github_tarball_recipe_file')
+        src_uri = self.config.get(
+               'RecipetoolTests', 'recipetool_create_github_tarball_srcuri')
+        inherits = self.config.get(
+                'RecipetoolTests', 'recipetool_create_github_tarball_inherits')
+        license = self.config.get(
+                'RecipetoolTests', 'recipetool_create_github_tarball_license')
+        recipefile = os.path.join(temprecipe, '%s_%s.bb' % (recipe_file, pv))
+        srcuri = '%s%s/%s-%s.tar.gz' % (src_uri, pv, recipe_file, pv)
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['Apache-2.0'])
-        checkvars['SRC_URI'] = 'https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz'
-        inherits = ['setuptools']
+        checkvars['LICENSE'] = set([license])
+        checkvars['SRC_URI'] = '%s${PV}/%s-${PV}.tar.gz' % (src_uri,
+                                                            recipe_file)
+        inherits = [inherits]
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_git_http(self):
+        recipe_file = self.config.get(
+                   'RecipetoolTests', 'recipetool_create_git_http_recipe_file')
+        srcuri = self.config.get(
+               'RecipetoolTests', 'recipetool_create_git_http_srcuri')
+        git_srcuri = self.config.get(
+                   'RecipetoolTests', 'recipetool_create_git_http_git_srcuri')
+        license = self.config.get(
+                'RecipetoolTests', 'recipetool_create_git_http_license')
+        inherits = eval(self.config.get('RecipetoolTests',
+                                        'recipetool_create_git_http_inherits'))
         # Basic test to check http git URL mangling works
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        recipefile = os.path.join(temprecipe, 'matchbox-terminal_git.bb')
-        srcuri = 'http://git.yoctoproject.org/git/matchbox-terminal'
+        recipefile = os.path.join(temprecipe, recipe_file)
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['GPLv2'])
-        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/matchbox-terminal;protocol=http'
-        inherits = ['pkgconfig', 'autotools']
+        checkvars['LICENSE'] = set([license])
+        checkvars['SRC_URI'] = git_srcuri
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
 class RecipetoolAppendsrcBase(RecipetoolBase):
@@ -576,44 +733,57 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
 
 class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+        cls.base_files = cls.config.get(
+            'RecipetoolAppendsrcTests', 'recipetool_appendsrcfile_base_files')
+        cls.file_1 = cls.config.get(
+                'RecipetoolAppendsrcTests', 'recipetool_appendsrcfile_file_1')
+        cls.recipe = cls.config.get(
+                'RecipetoolAppendsrcTests', 'recipetool_appendsrcfile_recipe')
+        cls.filepath = cls.config.get(
+            'RecipetoolAppendsrcTests', 'recipetool_appendsrcfile_filepath')
+
     @testcase(1273)
     def test_recipetool_appendsrcfile_basic(self):
-        self._test_appendsrcfile('base-files', 'a-file')
+        self._test_appendsrcfile(self.base_files, self.file_1)
 
     @testcase(1274)
     def test_recipetool_appendsrcfile_basic_wildcard(self):
-        testrecipe = 'base-files'
-        self._test_appendsrcfile(testrecipe, 'a-file', options='-w')
+        testrecipe = self.base_files
+        self._test_appendsrcfile(testrecipe, self.file_1, options='-w')
         recipefile = get_bb_var('FILE', testrecipe)
         bbappendfile = self._check_bbappend(testrecipe, recipefile, self.templayerdir)
         self.assertEqual(os.path.basename(bbappendfile), '%s_%%.bbappend' % testrecipe)
 
     @testcase(1281)
     def test_recipetool_appendsrcfile_subdir_basic(self):
-        self._test_appendsrcfile('base-files', 'a-file', 'tmp')
+        self._test_appendsrcfile(self.base_files, self.file_1, 'tmp')
 
     @testcase(1282)
     def test_recipetool_appendsrcfile_subdir_basic_dirdest(self):
-        self._test_appendsrcfile('base-files', destdir='tmp')
+        self._test_appendsrcfile(self.base_files, destdir='tmp')
 
     @testcase(1280)
     def test_recipetool_appendsrcfile_srcdir_basic(self):
-        testrecipe = 'bash'
+        testrecipe = self.recipe
         srcdir = get_bb_var('S', testrecipe)
         workdir = get_bb_var('WORKDIR', testrecipe)
         subdir = os.path.relpath(srcdir, workdir)
-        self._test_appendsrcfile(testrecipe, 'a-file', srcdir=subdir)
+        self._test_appendsrcfile(testrecipe, self.file_1, srcdir=subdir)
 
     @testcase(1275)
     def test_recipetool_appendsrcfile_existing_in_src_uri(self):
-        testrecipe = 'base-files'
+        testrecipe = self.base_files
         filepath = self._get_first_file_uri(testrecipe)
         self.assertTrue(filepath, 'Unable to test, no file:// uri found in SRC_URI for %s' % testrecipe)
         self._test_appendsrcfile(testrecipe, filepath, has_src_uri=False)
 
     @testcase(1276)
     def test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(self):
-        testrecipe = 'base-files'
+        testrecipe = self.base_files
         subdir = 'tmp'
         filepath = self._get_first_file_uri(testrecipe)
         self.assertTrue(filepath, 'Unable to test, no file:// uri found in SRC_URI for %s' % testrecipe)
@@ -623,8 +793,8 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
     @testcase(1277)
     def test_recipetool_appendsrcfile_replace_file_srcdir(self):
-        testrecipe = 'bash'
-        filepath = 'Makefile.in'
+        testrecipe = self.recipe
+        filepath = self.filepath
         srcdir = get_bb_var('S', testrecipe)
         workdir = get_bb_var('WORKDIR', testrecipe)
         subdir = os.path.relpath(srcdir, workdir)
-- 
1.8.3.1


