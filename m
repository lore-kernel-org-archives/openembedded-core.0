Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B3BA5771AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316028"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:23:01 -0700
Message-Id: <c3827611d3f2f839d47e9dc985e55e75b02f18dd.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 13/20] oeqa.selftest.pkgdata: Split configuration from code
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
 meta/lib/oeqa/selftest/conf/pkgdata.conf |  39 ++++
 meta/lib/oeqa/selftest/pkgdata.py        | 373 ++++++++++++++++++++++---------
 2 files changed, 305 insertions(+), 107 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/pkgdata.conf

diff --git a/meta/lib/oeqa/selftest/conf/pkgdata.conf b/meta/lib/oeqa/selftest/conf/pkgdata.conf
new file mode 100644
index 0000000..4d7a667
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/pkgdata.conf
@@ -0,0 +1,39 @@
+[OePkgdataUtilTests]
+setUpClass_package_1 = glibc
+setUpClass_package_2 = busybox
+setUpClass_package_3 = zlib
+setUpClass_package_4 = bash
+lookup_pkg_package_1 = glibc
+lookup_pkg_package_2 = busybox
+lookup_pkg_package_3 = libc6
+lookup_pkg_package_4 = zlib-dev
+lookup_pkg_package_5 = libz-dev
+lookup_pkg_package_6 = nonexistentpkg
+read_value_package_1 = libz1
+read_value_package_2 = zlib
+read_value_package_3 = bash
+find_path_package_1 = libc.so.6
+find_path_package_2 = glibc
+find_path_package_3 = bash
+lookup_recipe_package_1 = libc6-staticdev
+lookup_recipe_package_2 = busybox
+lookup_recipe_package_3 = glibc
+lookup_recipe_package_4 = libz-dbg
+lookup_recipe_package_5 = zlib
+lookup_recipe_package_6 = nonexistentpkg
+list_pkgs_package_1 = list-pkgs
+list_pkgs_package_2 = glibc-utils
+list_pkgs_package_3 = zlib-dev
+list_pkgs_package_4 = libc6-utils
+list_pkgs_package_5 = libz-dev
+list_pkgs_package_6 = zlib
+list_pkgs_package_7 = libz
+list_pkg_files_package_1 = zlib
+list_pkg_files_package_2 = libz
+glob_package_1 = libc6
+glob_package_2 = libz
+glob_package_3 = busybox
+glob_package_4 = glibc
+glob_prefix = pkgdataqa
+specify_pkgdatadir_package_1 = glibc
+specify_pkgdatadir_package_2 = libc6
diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/pkgdata.py
index 5a63f89..f2a5c22 100644
--- a/meta/lib/oeqa/selftest/pkgdata.py
+++ b/meta/lib/oeqa/selftest/pkgdata.py
@@ -8,107 +8,197 @@ import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils.decorators import testcase
+from oeqa.utils.readconfig import conffile
+
 
 class OePkgdataUtilTests(oeSelfTest):
 
     @classmethod
     def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
         # Ensure we have the right data in pkgdata
         logger = logging.getLogger("selftest")
         logger.info('Running bitbake to generate pkgdata')
-        bitbake('glibc busybox zlib bash')
+        package_1 = cls.config.get(
+                  'OePkgdataUtilTests', 'setUpClass_package_1')
+        package_2 = cls.config.get(
+                  'OePkgdataUtilTests', 'setUpClass_package_2')
+        package_3 = cls.config.get(
+                  'OePkgdataUtilTests', 'setupClass_package_3')
+        package_4 = cls.config.get(
+                  'OePkgdataUtilTests', 'setupClass_package_4')
+        bitbake('%s %s %s %s' % (package_1, package_2, package_3, package_4))
 
     @testcase(1203)
     def test_lookup_pkg(self):
+        package_1 = self.config.get(
+                  'OePkgdataUtilTests', 'lookup_pkg_package_1')
+        package_2 = self.config.get(
+                  'OePkgdataUtilTests', 'lookup_pkg_package_2')
+        package_3 = self.config.get(
+                  'OePkgdataUtilTests', 'lookup_pkg_package_3')
+        package_4 = self.config.get(
+                  'OePkgdataUtilTests', 'lookup_pkg_package_4')
+        package_5 = self.config.get(
+                  'OePkgdataUtilTests', 'lookup_pkg_package_5')
+        package_6 = self.config.get(
+                  'OePkgdataUtilTests', 'lookup_pkg_package_6')
         # Forward tests
-        result = runCmd('oe-pkgdata-util lookup-pkg "glibc busybox"')
-        self.assertEqual(result.output, 'libc6\nbusybox')
-        result = runCmd('oe-pkgdata-util lookup-pkg zlib-dev')
-        self.assertEqual(result.output, 'libz-dev')
-        result = runCmd('oe-pkgdata-util lookup-pkg nonexistentpkg', ignore_status=True)
+        result = runCmd(
+               'oe-pkgdata-util lookup-pkg "%s %s"' % (package_1, package_2))
+        self.assertEqual(result.output, '%s\n%s' % (package_3, package_2))
+        result = runCmd('oe-pkgdata-util lookup-pkg %s' % package_4)
+        self.assertEqual(result.output, package_5)
+        result = runCmd('oe-pkgdata-util lookup-pkg %s' % package_6,
+                        ignore_status=True)
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
         # Reverse tests
-        result = runCmd('oe-pkgdata-util lookup-pkg -r "libc6 busybox"')
-        self.assertEqual(result.output, 'glibc\nbusybox')
-        result = runCmd('oe-pkgdata-util lookup-pkg -r libz-dev')
-        self.assertEqual(result.output, 'zlib-dev')
-        result = runCmd('oe-pkgdata-util lookup-pkg -r nonexistentpkg', ignore_status=True)
+        result = runCmd('oe-pkgdata-util lookup-pkg -r "%s %s"'
+                        % (package_3, package_2))
+        self.assertEqual(result.output, '%s\n%s' % (package_1, package_2))
+        result = runCmd('oe-pkgdata-util lookup-pkg -r %s' % package_5)
+        self.assertEqual(result.output, package_4)
+        result = runCmd('oe-pkgdata-util lookup-pkg -r %s' % package_6,
+                        ignore_status=True)
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
-        self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
+        self.assertEqual(result.output, 'ERROR: The following packages could \
+not be found: %s' % package_6)
 
     @testcase(1205)
     def test_read_value(self):
-        result = runCmd('oe-pkgdata-util read-value PN libz1')
-        self.assertEqual(result.output, 'zlib')
-        result = runCmd('oe-pkgdata-util read-value PKGSIZE bash')
+        package_1 = self.config.get(
+                  'OePkgdataUtilTests', 'read_value_package_1')
+        package_2 = self.config.get(
+                  'OePkgdataUtilTests', 'read_value_package_2')
+        package_3 = self.config.get(
+                  'OePkgdataUtilTests', 'read_value_package_3')
+        result = runCmd('oe-pkgdata-util read-value PN %s' % package_1)
+        self.assertEqual(result.output, package_2)
+        result = runCmd('oe-pkgdata-util read-value PKGSIZE %s' % package_3)
         pkgsize = int(result.output.strip())
         self.assertGreater(pkgsize, 1, "Size should be greater than 1. %s" % result.output)
 
     @testcase(1198)
     def test_find_path(self):
-        result = runCmd('oe-pkgdata-util find-path /lib/libc.so.6')
-        self.assertEqual(result.output, 'glibc: /lib/libc.so.6')
-        result = runCmd('oe-pkgdata-util find-path /bin/bash')
-        self.assertEqual(result.output, 'bash: /bin/bash')
+        package_1 = self.config.get(
+                  'OePkgdataUtilTests', 'find_path_package_1')
+        package_2 = self.config.get(
+                  'OePkgdataUtilTests', 'find_path_package_2')
+        package_3 = self.config.get(
+                  'OePkgdataUtilTests', 'find_path_package_3')
+        result = runCmd('oe-pkgdata-util find-path /lib/%s' % package_1)
+        self.assertEqual(result.output, '%s: /lib/%s' % (package_2, package_1))
+        result = runCmd('oe-pkgdata-util find-path /bin/%s' % package_3)
+        self.assertEqual(result.output, '%s: /bin/%s' % (package_3, package_3))
         result = runCmd('oe-pkgdata-util find-path /not/exist', ignore_status=True)
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: Unable to find any package producing path /not/exist')
 
     @testcase(1204)
     def test_lookup_recipe(self):
-        result = runCmd('oe-pkgdata-util lookup-recipe "libc6-staticdev busybox"')
-        self.assertEqual(result.output, 'glibc\nbusybox')
-        result = runCmd('oe-pkgdata-util lookup-recipe libz-dbg')
-        self.assertEqual(result.output, 'zlib')
-        result = runCmd('oe-pkgdata-util lookup-recipe nonexistentpkg', ignore_status=True)
+        package_1 = self.config.get(
+                  'OePkgdataUtilTests', 'lookup_recipe_package_1')
+        package_2 = self.config.get(
+                  'OePkgdataUtilTests', 'lookup_recipe_package_2')
+        package_3 = self.config.get(
+                  'OePkgdataUtilTests', 'lookup_recipe_package_3')
+        package_4 = self.config.get(
+                  'OePkgdataUtilTests', 'lookup_recipe_package_4')
+        package_5 = self.config.get(
+                  'OePkgdataUtilTests', 'lookup_recipe_package_5')
+        package_6 = self.config.get(
+                  'OePkgdataUtilTests', 'lookup_recipe_package_6')
+        result = runCmd('oe-pkgdata-util lookup-recipe "%s %s"'
+                        % (package_1, package_2))
+        self.assertEqual(result.output, '%s\n%s' % (package_3, package_2))
+        result = runCmd('oe-pkgdata-util lookup-recipe %s' % package_4)
+        self.assertEqual(result.output, package_5)
+        result = runCmd('oe-pkgdata-util lookup-recipe %s' % package_6,
+                        ignore_status=True)
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
-        self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
+        self.assertEqual(result.output, 'ERROR: The following packages could \
+not be found: %s' % package_6)
 
     @testcase(1202)
     def test_list_pkgs(self):
+        package_1 = self.config.get(
+                  'OePkgdataUtilTests', 'list_pkgs_package_1')
+        package_2 = self.config.get(
+                  'OePkgdataUtilTests', 'list_pkgs_package_2')
+        package_3 = self.config.get(
+                  'OePkgdataUtilTests', 'list_pkgs_package_3')
+        package_4 = self.config.get(
+                  'OePkgdataUtilTests', 'list_pkgs_package_4')
+        package_5 = self.config.get(
+                  'OePkgdataUtilTests', 'list_pkgs_package_5')
+        package_6 = self.config.get(
+                  'OePkgdataUtilTests', 'list_pkgs_package_6')
+        package_7 = self.config.get(
+                  'OePkgdataUtilTests', 'list_pkgs_package_7')
         # No arguments
-        result = runCmd('oe-pkgdata-util list-pkgs')
+        result = runCmd('oe-pkgdata-util %s' % package_1)
         pkglist = result.output.split()
-        self.assertIn('glibc-utils', pkglist, "Listed packages: %s" % result.output)
-        self.assertIn('zlib-dev', pkglist, "Listed packages: %s" % result.output)
+        self.assertIn(package_2, pkglist,
+                      "Listed packages: %s" % result.output)
+        self.assertIn(package_3, pkglist,
+                      "Listed packages: %s" % result.output)
         # No pkgspec, runtime
         result = runCmd('oe-pkgdata-util list-pkgs -r')
         pkglist = result.output.split()
-        self.assertIn('libc6-utils', pkglist, "Listed packages: %s" % result.output)
-        self.assertIn('libz-dev', pkglist, "Listed packages: %s" % result.output)
+        self.assertIn(package_4, pkglist,
+                      "Listed packages: %s" % result.output)
+        self.assertIn(package_5, pkglist,
+                      "Listed packages: %s" % result.output)
         # With recipe specified
-        result = runCmd('oe-pkgdata-util list-pkgs -p zlib')
+        result = runCmd('oe-pkgdata-util list-pkgs -p %s' % package_6)
         pkglist = sorted(result.output.split())
         try:
-            pkglist.remove('zlib-ptest') # in case ptest is disabled
+            pkglist.remove('%s-ptest' % package_6)  # in case ptest is disabled
         except ValueError:
             pass
-        self.assertEqual(pkglist, ['zlib', 'zlib-dbg', 'zlib-dev', 'zlib-doc', 'zlib-staticdev'], "Packages listed after remove: %s" % result.output)
+        self.assertEqual(
+            pkglist, [package_6, '%s-dbg' % package_6, '%s-dev' % package_6,
+                      '%s-doc' % package_6, '%s-staticdev' % package_6],
+            "Packages listed after remove: %s" % result.output)
         # With recipe specified, runtime
-        result = runCmd('oe-pkgdata-util list-pkgs -p zlib -r')
+        result = runCmd('oe-pkgdata-util %s -p %s -r' % (package_1, package_6))
         pkglist = sorted(result.output.split())
         try:
-            pkglist.remove('libz-ptest') # in case ptest is disabled
+            pkglist.remove('%s-ptest' % package_7)  # in case ptest is disabled
         except ValueError:
             pass
-        self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc', 'libz-staticdev', 'libz1'], "Packages listed after remove: %s" % result.output)
+        self.assertEqual(
+            pkglist, ['%s-dbg' % package_7, '%s-dev' % package_7,
+                      '%s-doc' % package_7, '%s-staticdev' % package_7,
+                      '%s1' % package_7],
+            "Packages listed after remove: %s" % result.output)
         # With recipe specified and unpackaged
-        result = runCmd('oe-pkgdata-util list-pkgs -p zlib -u')
+        result = runCmd('oe-pkgdata-util %s -p %s -u' % (package_1, package_6))
         pkglist = sorted(result.output.split())
-        self.assertIn('zlib-locale', pkglist, "Listed packages: %s" % result.output)
+        self.assertIn('%s-locale' % package_6, pkglist,
+                      "Listed packages: %s" % result.output)
         # With recipe specified and unpackaged, runtime
-        result = runCmd('oe-pkgdata-util list-pkgs -p zlib -u -r')
+        result = runCmd(
+               'oe-pkgdata-util %s -p %s -u -r' % (package_1, package_6))
         pkglist = sorted(result.output.split())
-        self.assertIn('libz-locale', pkglist, "Listed packages: %s" % result.output)
+        self.assertIn('%s-locale' % package_7, pkglist,
+                      "Listed packages: %s" % result.output)
         # With recipe specified and pkgspec
-        result = runCmd('oe-pkgdata-util list-pkgs -p zlib "*-d*"')
+        result = runCmd(
+               'oe-pkgdata-util %s -p %s "*-d*"' % (package_1, package_6))
         pkglist = sorted(result.output.split())
-        self.assertEqual(pkglist, ['zlib-dbg', 'zlib-dev', 'zlib-doc'], "Packages listed: %s" % result.output)
+        self.assertEqual(
+            pkglist, ['%s-dbg' % package_6, '%s-dev' % package_6, '%s-doc'
+                      % package_6], "Packages listed: %s" % result.output)
         # With recipe specified and pkgspec, runtime
-        result = runCmd('oe-pkgdata-util list-pkgs -p zlib -r "*-d*"')
+        result = runCmd(
+               'oe-pkgdata-util %s -p %s -r "*-d*"' % (package_1, package_6))
         pkglist = sorted(result.output.split())
-        self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc'], "Packages listed: %s" % result.output)
+        self.assertEqual(
+            pkglist, ['%s-dbg' % package_7, '%s-dev' % package_7, '%s-doc'
+                      % package_7], "Packages listed: %s" % result.output)
 
     @testcase(1201)
     def test_list_pkg_files(self):
@@ -124,103 +214,172 @@ class OePkgdataUtilTests(oeSelfTest):
                     curpkg = line.split(':')[0]
                     files[curpkg] = []
             return files
+        # Get test configurations from configuration file
+        package_1 = self.config.get(
+                  'OePkgdataUtilTests', 'list_pkg_files_package_1')
+        package_2 = self.config.get(
+                  'OePkgdataUtilTests', 'list_pkg_files_package_2')
         base_libdir = get_bb_var('base_libdir')
         libdir = get_bb_var('libdir')
         includedir = get_bb_var('includedir')
         mandir = get_bb_var('mandir')
         # Test recipe-space package name
-        result = runCmd('oe-pkgdata-util list-pkg-files zlib-dev zlib-doc')
+        result = runCmd('oe-pkgdata-util list-pkg-files %s-dev %s-doc'
+                        % (package_1, package_1))
         files = splitoutput(result.output)
-        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
-        self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
+        self.assertIn('%s-dev' % package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-doc' % package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn(os.path.join(includedir, '%s.h' % package_1),
+                      files['%s-dev' % package_1])
+        self.assertIn(os.path.join(mandir, 'man3/%s.3' % package_1),
+                      files['%s-doc' % package_1])
         # Test runtime package name
-        result = runCmd('oe-pkgdata-util list-pkg-files -r libz1 libz-dev')
+        result = runCmd('oe-pkgdata-util list-pkg-files -r %s1 %s-dev'
+                        % (package_2, package_2))
         files = splitoutput(result.output)
-        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertGreater(len(files['libz1']), 1)
-        libspec = os.path.join(base_libdir, 'libz.so.1.*')
+        self.assertIn('%s1' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-dev' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertGreater(len(files['%s1' % package_2]), 1)
+        libspec = os.path.join(base_libdir, '%s.so.1.*' % package_2)
         found = False
-        for fileitem in files['libz1']:
+        for fileitem in files['%s1' % package_2]:
             if fnmatch.fnmatchcase(fileitem, libspec):
                 found = True
                 break
-        self.assertTrue(found, 'Could not find zlib library file %s in libz1 package file list: %s' % (libspec, files['libz1']))
-        self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
+        self.assertTrue(found, 'Could not find %s library file %s in %s1 \
+package file list: %s' % (package_1, libspec, package_2,
+                          files['%s1' % package_2]))
+        self.assertIn(os.path.join(includedir, '%s.h' % package_1),
+                      files['%s-dev' % package_2])
         # Test recipe
-        result = runCmd('oe-pkgdata-util list-pkg-files -p zlib')
+        result = runCmd('oe-pkgdata-util list-pkg-files -p %s' % package_1)
         files = splitoutput(result.output)
-        self.assertIn('zlib-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertNotIn('zlib-locale', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('%s-dbg' % package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-doc' % package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-dev' % package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-staticdev' % package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn(package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertNotIn('%s-locale' % package_1, list(files.keys()),
+                         "listed pkgs. files: %s" % result.output)
         # (ignore ptest, might not be there depending on config)
-        self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
-        self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
-        self.assertIn(os.path.join(libdir, 'libz.a'), files['zlib-staticdev'])
+        self.assertIn(os.path.join(includedir, '%s.h' % package_1),
+                      files['%s-dev' % package_1])
+        self.assertIn(os.path.join(mandir, 'man3/%s.3' % package_1),
+                      files['%s-doc' % package_1])
+        self.assertIn(os.path.join(libdir, '%s.a' % package_2),
+                      files['%s-staticdev' % package_1])
         # Test recipe, runtime
-        result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r')
+        result = runCmd('oe-pkgdata-util list-pkg-files -p %s -r' % package_1)
         files = splitoutput(result.output)
-        self.assertIn('libz-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertNotIn('libz-locale', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
-        self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
-        self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
+        self.assertIn('%s-dbg' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-doc' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-dev' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-staticdev' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s1' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertNotIn('%s-locale' % package_2, list(files.keys()),
+                         "listed pkgs. files: %s" % result.output)
+        self.assertIn(os.path.join(includedir, '%s.h' % package_1),
+                      files['%s-dev' % package_2])
+        self.assertIn(os.path.join(mandir, 'man3/%s.3' % package_1),
+                      files['%s-doc' % package_2])
+        self.assertIn(os.path.join(libdir, '%s.a' % package_2),
+                      files['%s-staticdev' % package_2])
         # Test recipe, unpackaged
-        result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -u')
+        result = runCmd('oe-pkgdata-util list-pkg-files -p %s -u' % package_1)
         files = splitoutput(result.output)
-        self.assertIn('zlib-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-locale', list(files.keys()), "listed pkgs. files: %s" %result.output) # this is the key one
-        self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
-        self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
-        self.assertIn(os.path.join(libdir, 'libz.a'), files['zlib-staticdev'])
+        self.assertIn('%s-dbg' % package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-doc' % package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-dev' % package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-staticdev' % package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn(package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        # this is the key one
+        self.assertIn('%s-locale' % package_1, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn(os.path.join(includedir, '%s.h' % package_1),
+                      files['%s-dev' % package_1])
+        self.assertIn(os.path.join(mandir, 'man3/%s.3' % package_1),
+                      files['%s-doc' % package_1])
+        self.assertIn(os.path.join(libdir, '%s.a' % package_2),
+                      files['%s-staticdev' % package_1])
         # Test recipe, runtime, unpackaged
-        result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r -u')
+        result = runCmd(
+               'oe-pkgdata-util list-pkg-files -p %s -r -u' % package_1)
         files = splitoutput(result.output)
-        self.assertIn('libz-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-locale', list(files.keys()), "listed pkgs. files: %s" %result.output) # this is the key one
-        self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
-        self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
-        self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
+        self.assertIn('%s-dbg' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-doc' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-dev' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s-staticdev' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn('%s1' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        # this is the key one
+        self.assertIn('%s-locale' % package_2, list(files.keys()),
+                      "listed pkgs. files: %s" % result.output)
+        self.assertIn(os.path.join(includedir, '%s.h' % package_1),
+                      files['%s-dev' % package_2])
+        self.assertIn(os.path.join(mandir, 'man3/%s.3' % package_1),
+                      files['%s-doc' % package_2])
+        self.assertIn(os.path.join(libdir, '%s.a' % package_2),
+                      files['%s-staticdev' % package_2])
 
     @testcase(1200)
     def test_glob(self):
-        tempdir = tempfile.mkdtemp(prefix='pkgdataqa')
+        # Get test configurations from configuration file
+        package_1 = self.config.get('OePkgdataUtilTests', 'glob_package_1')
+        package_2 = self.config.get('OePkgdataUtilTests', 'glob_package_2')
+        package_3 = self.config.get('OePkgdataUtilTests', 'glob_package_3')
+        package_4 = self.config.get('OePkgdataUtilTests', 'glob_package_4')
+        prefix = self.config.get('OePkgdataUtilTests', 'glob_prefix')
+        tempdir = tempfile.mkdtemp(prefix)
         self.track_for_cleanup(tempdir)
         pkglistfile = os.path.join(tempdir, 'pkglist')
         with open(pkglistfile, 'w') as f:
-            f.write('libc6\n')
-            f.write('libz1\n')
-            f.write('busybox\n')
+            f.write('%s\n' % package_1)
+            f.write('%s1\n' % package_2)
+            f.write('%s\n' % package_3)
         result = runCmd('oe-pkgdata-util glob %s "*-dev"' % pkglistfile)
-        desiredresult = ['libc6-dev', 'libz-dev', 'busybox-dev']
+        desiredresult = ['%s-dev' % package_1, '%s-dev' % package_2,
+                         '%s-dev' % package_3]
         self.assertEqual(sorted(result.output.split()), sorted(desiredresult))
         # The following should not error (because when we use this during rootfs construction, sometimes the complementary package won't exist)
         result = runCmd('oe-pkgdata-util glob %s "*-nonexistent"' % pkglistfile)
         self.assertEqual(result.output, '')
         # Test exclude option
-        result = runCmd('oe-pkgdata-util glob %s "*-dev *-dbg" -x "^libz"' % pkglistfile)
+        result = runCmd('oe-pkgdata-util glob %s "*-dev *-dbg" -x "^%s"'
+                        % (pkglistfile, package_2))
         resultlist = result.output.split()
-        self.assertNotIn('libz-dev', resultlist)
-        self.assertNotIn('libz-dbg', resultlist)
+        self.assertNotIn('%s-dev' % package_2, resultlist)
+        self.assertNotIn('%s-dbg' % package_2, resultlist)
 
     @testcase(1206)
     def test_specify_pkgdatadir(self):
-        result = runCmd('oe-pkgdata-util -p %s lookup-pkg glibc' % get_bb_var('PKGDATA_DIR'))
-        self.assertEqual(result.output, 'libc6')
+        # Get test configurations from configuration file
+        package_1 = self.config.get(
+                  'OePkgdataUtilTests', 'specify_pkgdatadir_package_1')
+        package_2 = self.config.get(
+                  'OePkgdataUtilTests', 'specify_pkgdatadir_package_2')
+        result = runCmd('oe-pkgdata-util -p %s lookup-pkg %s'
+                        % (get_bb_var('PKGDATA_DIR'), package_1))
+        self.assertEqual(result.output, package_2)
-- 
1.8.3.1


