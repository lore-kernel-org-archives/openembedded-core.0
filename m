Return-Path: <costin.c.constantin@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1836013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 09:55:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2015 02:55:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,487,1432623600"; d="scan'208";a="748452584"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jul 2015 02:55:42 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 35F726A4005;
	Thu, 16 Jul 2015 02:55:00 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2015 13:06:03 +0300
Message-Id: <1437041163-4298-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/pkgdata: add useful failure messages to test cases
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
X-List-Received-Date: Thu, 16 Jul 2015 09:55:45 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/pkgdata.py | 86 +++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/pkgdata.py
index c4d34bd..138b03a 100644
--- a/meta/lib/oeqa/selftest/pkgdata.py
+++ b/meta/lib/oeqa/selftest/pkgdata.py
@@ -26,7 +26,7 @@ class OePkgdataUtilTests(oeSelfTest):
         result = runCmd('oe-pkgdata-util lookup-pkg zlib-dev')
         self.assertEqual(result.output, 'libz-dev')
         result = runCmd('oe-pkgdata-util lookup-pkg nonexistentpkg', ignore_status=True)
-        self.assertEqual(result.status, 1)
+        self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
         # Reverse tests
         result = runCmd('oe-pkgdata-util lookup-pkg -r "libc6 busybox"')
@@ -34,7 +34,7 @@ class OePkgdataUtilTests(oeSelfTest):
         result = runCmd('oe-pkgdata-util lookup-pkg -r libz-dev')
         self.assertEqual(result.output, 'zlib-dev')
         result = runCmd('oe-pkgdata-util lookup-pkg -r nonexistentpkg', ignore_status=True)
-        self.assertEqual(result.status, 1)
+        self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
 
     @testcase(1205)
@@ -43,7 +43,7 @@ class OePkgdataUtilTests(oeSelfTest):
         self.assertEqual(result.output, 'zlib')
         result = runCmd('oe-pkgdata-util read-value PKGSIZE bash')
         pkgsize = int(result.output.strip())
-        self.assertGreater(pkgsize, 1)
+        self.assertGreater(pkgsize, 1, "Size should be greater than 1. %s" % result.output)
 
     @testcase(1198)
     def test_find_path(self):
@@ -52,7 +52,7 @@ class OePkgdataUtilTests(oeSelfTest):
         result = runCmd('oe-pkgdata-util find-path /bin/bash')
         self.assertEqual(result.output, 'bash: /bin/bash')
         result = runCmd('oe-pkgdata-util find-path /not/exist', ignore_status=True)
-        self.assertEqual(result.status, 1)
+        self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: Unable to find any package producing path /not/exist')
 
     @testcase(1204)
@@ -62,7 +62,7 @@ class OePkgdataUtilTests(oeSelfTest):
         result = runCmd('oe-pkgdata-util lookup-recipe libz-dbg')
         self.assertEqual(result.output, 'zlib')
         result = runCmd('oe-pkgdata-util lookup-recipe nonexistentpkg', ignore_status=True)
-        self.assertEqual(result.status, 1)
+        self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
 
     @testcase(1202)
@@ -70,13 +70,13 @@ class OePkgdataUtilTests(oeSelfTest):
         # No arguments
         result = runCmd('oe-pkgdata-util list-pkgs')
         pkglist = result.output.split()
-        self.assertIn('glibc-utils', pkglist)
-        self.assertIn('zlib-dev', pkglist)
+        self.assertIn('glibc-utils', pkglist, "Listed packages: %s" % result.output)
+        self.assertIn('zlib-dev', pkglist, "Listed packages: %s" % result.output)
         # No pkgspec, runtime
         result = runCmd('oe-pkgdata-util list-pkgs -r')
         pkglist = result.output.split()
-        self.assertIn('libc6-utils', pkglist)
-        self.assertIn('libz-dev', pkglist)
+        self.assertIn('libc6-utils', pkglist, "Listed packages: %s" % result.output)
+        self.assertIn('libz-dev', pkglist, "Listed packages: %s" % result.output)
         # With recipe specified
         result = runCmd('oe-pkgdata-util list-pkgs -p zlib')
         pkglist = sorted(result.output.split())
@@ -84,7 +84,7 @@ class OePkgdataUtilTests(oeSelfTest):
             pkglist.remove('zlib-ptest') # in case ptest is disabled
         except ValueError:
             pass
-        self.assertEqual(pkglist, ['zlib', 'zlib-dbg', 'zlib-dev', 'zlib-doc', 'zlib-staticdev'])
+        self.assertEqual(pkglist, ['zlib', 'zlib-dbg', 'zlib-dev', 'zlib-doc', 'zlib-staticdev'], "Packages listed after remove: %s" % result.output)
         # With recipe specified, runtime
         result = runCmd('oe-pkgdata-util list-pkgs -p zlib -r')
         pkglist = sorted(result.output.split())
@@ -92,23 +92,23 @@ class OePkgdataUtilTests(oeSelfTest):
             pkglist.remove('libz-ptest') # in case ptest is disabled
         except ValueError:
             pass
-        self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc', 'libz-staticdev', 'libz1'])
+        self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc', 'libz-staticdev', 'libz1'], "Packages listed after remove: %s" % result.output)
         # With recipe specified and unpackaged
         result = runCmd('oe-pkgdata-util list-pkgs -p zlib -u')
         pkglist = sorted(result.output.split())
-        self.assertIn('zlib-locale', pkglist)
+        self.assertIn('zlib-locale', pkglist, "Listed packages: %s" % result.output)
         # With recipe specified and unpackaged, runtime
         result = runCmd('oe-pkgdata-util list-pkgs -p zlib -u -r')
         pkglist = sorted(result.output.split())
-        self.assertIn('libz-locale', pkglist)
+        self.assertIn('libz-locale', pkglist, "Listed packages: %s" % result.output)
         # With recipe specified and pkgspec
         result = runCmd('oe-pkgdata-util list-pkgs -p zlib "*-d*"')
         pkglist = sorted(result.output.split())
-        self.assertEqual(pkglist, ['zlib-dbg', 'zlib-dev', 'zlib-doc'])
+        self.assertEqual(pkglist, ['zlib-dbg', 'zlib-dev', 'zlib-doc'], "Packages listed: %s" % result.output)
         # With recipe specified and pkgspec, runtime
         result = runCmd('oe-pkgdata-util list-pkgs -p zlib -r "*-d*"')
         pkglist = sorted(result.output.split())
-        self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc'])
+        self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc'], "Packages listed: %s" % result.output)
 
     @testcase(1201)
     def test_list_pkg_files(self):
@@ -131,15 +131,15 @@ class OePkgdataUtilTests(oeSelfTest):
         # Test recipe-space package name
         result = runCmd('oe-pkgdata-util list-pkg-files zlib-dev zlib-doc')
         files = splitoutput(result.output)
-        self.assertIn('zlib-dev', files.keys())
-        self.assertIn('zlib-doc', files.keys())
+        self.assertIn('zlib-dev', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-doc', files.keys(), "listed pkgs. files: %s" %result.output)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
         # Test runtime package name
         result = runCmd('oe-pkgdata-util list-pkg-files -r libz1 libz-dev')
         files = splitoutput(result.output)
-        self.assertIn('libz1', files.keys())
-        self.assertIn('libz-dev', files.keys())
+        self.assertIn('libz1', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-dev', files.keys(), "listed pkgs. files: %s" %result.output)
         self.assertGreater(len(files['libz1']), 1)
         libspec = os.path.join(base_libdir, 'libz.so.1.*')
         found = False
@@ -152,12 +152,12 @@ class OePkgdataUtilTests(oeSelfTest):
         # Test recipe
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib')
         files = splitoutput(result.output)
-        self.assertIn('zlib-dbg', files.keys())
-        self.assertIn('zlib-doc', files.keys())
-        self.assertIn('zlib-dev', files.keys())
-        self.assertIn('zlib-staticdev', files.keys())
-        self.assertIn('zlib', files.keys())
-        self.assertNotIn('zlib-locale', files.keys())
+        self.assertIn('zlib-dbg', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-doc', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-dev', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-staticdev', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertNotIn('zlib-locale', files.keys(), "listed pkgs. files: %s" %result.output)
         # (ignore ptest, might not be there depending on config)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
@@ -165,36 +165,36 @@ class OePkgdataUtilTests(oeSelfTest):
         # Test recipe, runtime
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r')
         files = splitoutput(result.output)
-        self.assertIn('libz-dbg', files.keys())
-        self.assertIn('libz-doc', files.keys())
-        self.assertIn('libz-dev', files.keys())
-        self.assertIn('libz-staticdev', files.keys())
-        self.assertIn('libz1', files.keys())
-        self.assertNotIn('libz-locale', files.keys())
+        self.assertIn('libz-dbg', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-doc', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-dev', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-staticdev', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz1', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertNotIn('libz-locale', files.keys(), "listed pkgs. files: %s" %result.output)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
         # Test recipe, unpackaged
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -u')
         files = splitoutput(result.output)
-        self.assertIn('zlib-dbg', files.keys())
-        self.assertIn('zlib-doc', files.keys())
-        self.assertIn('zlib-dev', files.keys())
-        self.assertIn('zlib-staticdev', files.keys())
-        self.assertIn('zlib', files.keys())
-        self.assertIn('zlib-locale', files.keys()) # this is the key one
+        self.assertIn('zlib-dbg', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-doc', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-dev', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-staticdev', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-locale', files.keys(), "listed pkgs. files: %s" %result.output) # this is the key one
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['zlib-staticdev'])
         # Test recipe, runtime, unpackaged
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r -u')
         files = splitoutput(result.output)
-        self.assertIn('libz-dbg', files.keys())
-        self.assertIn('libz-doc', files.keys())
-        self.assertIn('libz-dev', files.keys())
-        self.assertIn('libz-staticdev', files.keys())
-        self.assertIn('libz1', files.keys())
-        self.assertIn('libz-locale', files.keys()) # this is the key one
+        self.assertIn('libz-dbg', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-doc', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-dev', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-staticdev', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz1', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-locale', files.keys(), "listed pkgs. files: %s" %result.output) # this is the key one
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
-- 
2.1.4


