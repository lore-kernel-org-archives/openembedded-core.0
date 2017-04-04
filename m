Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CABAE60851
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 21:17:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 03 Apr 2017 14:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,272,1486454400"; d="scan'208";a="68703169"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2017 14:17:47 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 21:17:11 -0700
Message-Id: <20170404041711.23260-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] selftest/pkgdata: replace the glibc recipe allowing execution on non-poky distros
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
X-List-Received-Date: Mon, 03 Apr 2017 21:17:52 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Replace the glibc recipe for zlib on unit tests, otherwise tests are restricted
to glibc distros (poky).

[YOCTO #10890]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/pkgdata.py | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/pkgdata.py
index 36d8b34..d69c3c8 100644
--- a/meta/lib/oeqa/selftest/pkgdata.py
+++ b/meta/lib/oeqa/selftest/pkgdata.py
@@ -16,21 +16,21 @@ class OePkgdataUtilTests(oeSelfTest):
         # Ensure we have the right data in pkgdata
         logger = logging.getLogger("selftest")
         logger.info('Running bitbake to generate pkgdata')
-        bitbake('glibc busybox zlib m4')
+        bitbake('busybox zlib m4')
 
     @testcase(1203)
     def test_lookup_pkg(self):
         # Forward tests
-        result = runCmd('oe-pkgdata-util lookup-pkg "glibc busybox"')
-        self.assertEqual(result.output, 'libc6\nbusybox')
+        result = runCmd('oe-pkgdata-util lookup-pkg "zlib busybox"')
+        self.assertEqual(result.output, 'libz1\nbusybox')
         result = runCmd('oe-pkgdata-util lookup-pkg zlib-dev')
         self.assertEqual(result.output, 'libz-dev')
         result = runCmd('oe-pkgdata-util lookup-pkg nonexistentpkg', ignore_status=True)
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
         # Reverse tests
-        result = runCmd('oe-pkgdata-util lookup-pkg -r "libc6 busybox"')
-        self.assertEqual(result.output, 'glibc\nbusybox')
+        result = runCmd('oe-pkgdata-util lookup-pkg -r "libz1 busybox"')
+        self.assertEqual(result.output, 'zlib\nbusybox')
         result = runCmd('oe-pkgdata-util lookup-pkg -r libz-dev')
         self.assertEqual(result.output, 'zlib-dev')
         result = runCmd('oe-pkgdata-util lookup-pkg -r nonexistentpkg', ignore_status=True)
@@ -49,8 +49,8 @@ class OePkgdataUtilTests(oeSelfTest):
 
     @testcase(1198)
     def test_find_path(self):
-        result = runCmd('oe-pkgdata-util find-path /lib/libc.so.6')
-        self.assertEqual(result.output, 'glibc: /lib/libc.so.6')
+        result = runCmd('oe-pkgdata-util find-path /lib/libz.so.1')
+        self.assertEqual(result.output, 'zlib: /lib/libz.so.1')
         result = runCmd('oe-pkgdata-util find-path /usr/bin/m4')
         self.assertEqual(result.output, 'm4: /usr/bin/m4')
         result = runCmd('oe-pkgdata-util find-path /not/exist', ignore_status=True)
@@ -59,8 +59,8 @@ class OePkgdataUtilTests(oeSelfTest):
 
     @testcase(1204)
     def test_lookup_recipe(self):
-        result = runCmd('oe-pkgdata-util lookup-recipe "libc6-staticdev busybox"')
-        self.assertEqual(result.output, 'glibc\nbusybox')
+        result = runCmd('oe-pkgdata-util lookup-recipe "libz-staticdev busybox"')
+        self.assertEqual(result.output, 'zlib\nbusybox')
         result = runCmd('oe-pkgdata-util lookup-recipe libz-dbg')
         self.assertEqual(result.output, 'zlib')
         result = runCmd('oe-pkgdata-util lookup-recipe nonexistentpkg', ignore_status=True)
@@ -72,12 +72,11 @@ class OePkgdataUtilTests(oeSelfTest):
         # No arguments
         result = runCmd('oe-pkgdata-util list-pkgs')
         pkglist = result.output.split()
-        self.assertIn('glibc-utils', pkglist, "Listed packages: %s" % result.output)
+        self.assertIn('zlib', pkglist, "Listed packages: %s" % result.output)
         self.assertIn('zlib-dev', pkglist, "Listed packages: %s" % result.output)
         # No pkgspec, runtime
         result = runCmd('oe-pkgdata-util list-pkgs -r')
         pkglist = result.output.split()
-        self.assertIn('libc6-utils', pkglist, "Listed packages: %s" % result.output)
         self.assertIn('libz-dev', pkglist, "Listed packages: %s" % result.output)
         # With recipe specified
         result = runCmd('oe-pkgdata-util list-pkgs -p zlib')
@@ -208,11 +207,10 @@ class OePkgdataUtilTests(oeSelfTest):
         self.track_for_cleanup(tempdir)
         pkglistfile = os.path.join(tempdir, 'pkglist')
         with open(pkglistfile, 'w') as f:
-            f.write('libc6\n')
             f.write('libz1\n')
             f.write('busybox\n')
         result = runCmd('oe-pkgdata-util glob %s "*-dev"' % pkglistfile)
-        desiredresult = ['libc6-dev', 'libz-dev', 'busybox-dev']
+        desiredresult = ['libz-dev', 'busybox-dev']
         self.assertEqual(sorted(result.output.split()), sorted(desiredresult))
         # The following should not error (because when we use this during rootfs construction, sometimes the complementary package won't exist)
         result = runCmd('oe-pkgdata-util glob %s "*-nonexistent"' % pkglistfile)
@@ -225,5 +223,5 @@ class OePkgdataUtilTests(oeSelfTest):
 
     @testcase(1206)
     def test_specify_pkgdatadir(self):
-        result = runCmd('oe-pkgdata-util -p %s lookup-pkg glibc' % get_bb_var('PKGDATA_DIR'))
-        self.assertEqual(result.output, 'libc6')
+        result = runCmd('oe-pkgdata-util -p %s lookup-pkg zlib' % get_bb_var('PKGDATA_DIR'))
+        self.assertEqual(result.output, 'libz1')
-- 
2.10.2


