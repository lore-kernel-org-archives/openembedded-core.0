Return-Path: <costin.c.constantin@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 005E06AC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 12:54:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2015 05:54:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,480,1432623600"; d="scan'208";a="763009161"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2015 05:54:28 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id BF47C6A4083;
	Wed, 15 Jul 2015 05:53:46 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 16:04:50 +0300
Message-Id: <1436965490-8865-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/devtool: add useful failure messages for some test cases
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
X-List-Received-Date: Wed, 15 Jul 2015 12:54:31 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index ab412b6..21cd7f5 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -95,14 +95,14 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         result = runCmd('devtool create-workspace %s' % tempdir)
-        self.assertTrue(os.path.isfile(os.path.join(tempdir, 'conf', 'layer.conf')))
+        self.assertTrue(os.path.isfile(os.path.join(tempdir, 'conf', 'layer.conf')), msg = "No workspace created. devtool output: %s " % result.output)
         result = runCmd('bitbake-layers show-layers')
         self.assertIn(tempdir, result.output)
         # Try creating a workspace layer with the default path
         self.track_for_cleanup(workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool create-workspace')
-        self.assertTrue(os.path.isfile(os.path.join(workspacedir, 'conf', 'layer.conf')))
+        self.assertTrue(os.path.isfile(os.path.join(workspacedir, 'conf', 'layer.conf')), msg = "No workspace created. devtool output: %s " % result.output)
         result = runCmd('bitbake-layers show-layers')
         self.assertNotIn(tempdir, result.output)
         self.assertIn(workspacedir, result.output)
@@ -170,9 +170,10 @@ class DevtoolTests(DevtoolBase):
         bitbake('libftdi -c cleansstate')
         # Test devtool build
         result = runCmd('devtool build libftdi')
+        self.add_command_to_tearDown('bitbake -c cleansstate libftdi')
         staging_libdir = get_bb_var('STAGING_LIBDIR', 'libftdi')
         self.assertTrue(staging_libdir, 'Could not query STAGING_LIBDIR variable')
-        self.assertTrue(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), 'libftdi binary not found in STAGING_LIBDIR')
+        self.assertTrue(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), "libftdi binary not found in STAGING_LIBDIR. Output of devtool build libftdi %s" % result.output)
         # Test devtool reset
         stampprefix = get_bb_var('STAMP', 'libftdi')
         result = runCmd('devtool reset libftdi')
@@ -200,7 +201,7 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
-        self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created. %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'setup.py')), 'Unable to find setup.py in source directory')
         # Test devtool status
         result = runCmd('devtool status')
@@ -247,7 +248,7 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
-        self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created: %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure.ac in source directory')
         # Test devtool status
         result = runCmd('devtool status')
@@ -300,7 +301,7 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
         self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
         matches = glob.glob(os.path.join(workspacedir, 'appends', 'mdadm_*.bbappend'))
-        self.assertTrue(matches, 'bbappend not created')
+        self.assertTrue(matches, 'bbappend not created %s' % result.output)
         # Test devtool status
         result = runCmd('devtool status')
         self.assertIn('mdadm', result.output)
@@ -324,7 +325,7 @@ class DevtoolTests(DevtoolBase):
         with open(os.path.join(pkgd, mandir, 'man8', 'mdadm.8'), 'r') as f:
             for line in f:
                 if line.startswith('.TH'):
-                    self.assertEqual(line.rstrip(), '.TH MDADM 8 "" v9.999-custom', 'man file not modified')
+                    self.assertEqual(line.rstrip(), '.TH MDADM 8 "" v9.999-custom', 'man file not modified. man searched file path: %s' % os.path.join(pkgd, mandir, 'man8', 'mdadm.8'))
         # Test devtool reset
         stampprefix = get_bb_var('STAMP', 'mdadm')
         result = runCmd('devtool reset mdadm')
@@ -359,12 +360,12 @@ class DevtoolTests(DevtoolBase):
             bitbake('%s -e' % testrecipe)
             # devtool extract should fail
             result = runCmd('devtool extract %s %s' % (testrecipe, os.path.join(tempdir, testrecipe)), ignore_status=True)
-            self.assertNotEqual(result.status, 0, 'devtool extract on %s should have failed' % testrecipe)
+            self.assertNotEqual(result.status, 0, 'devtool extract on %s should have failed. devtool output: %s' % (testrecipe, result.output))
             self.assertNotIn('Fetching ', result.output, 'devtool extract on %s should have errored out before trying to fetch' % testrecipe)
             self.assertIn('ERROR: ', result.output, 'devtool extract on %s should have given an ERROR' % testrecipe)
             # devtool modify should fail
             result = runCmd('devtool modify %s -x %s' % (testrecipe, os.path.join(tempdir, testrecipe)), ignore_status=True)
-            self.assertNotEqual(result.status, 0, 'devtool modify on %s should have failed' % testrecipe)
+            self.assertNotEqual(result.status, 0, 'devtool modify on %s should have failed. devtool output: %s' %  (testrecipe, result.output))
             self.assertIn('ERROR: ', result.output, 'devtool modify on %s should have given an ERROR' % testrecipe)
 
     @testcase(1165)
@@ -386,7 +387,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')), 'Extracted source could not be found')
         self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
-        self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created. devtool output: %s' % result.output)
         matches = glob.glob(os.path.join(workspacedir, 'appends', 'mkelfimage_*.bbappend'))
         self.assertTrue(matches, 'bbappend not created')
         # Test devtool status
-- 
2.1.4


