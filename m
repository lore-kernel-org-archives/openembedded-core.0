Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A6BD8735C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425640"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:39:58 +0000
Message-Id: <7d9dc8471d390b3d951d5ee466208a1c78666cd2.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/15] devtool: build: run do_populate_sysroot instead of do_install
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:30 -0000

If you want to be able to make use of libraries in conjunction with
devtool then we need to install them into the sysroot for other recipes
to use. Make it a configuration option in case it needs to be changed at
runtime.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 40 +++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py   |  5 +++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 33f2e91..8caf07a 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -136,6 +136,46 @@ class DevtoolTests(oeSelfTest):
             bindir = bindir[1:]
         self.assertTrue(os.path.isfile(os.path.join(installdir, bindir, 'pv')), 'pv binary not found in D')
 
+    def test_devtool_add_library(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        # We don't have the ability to pick up this dependency automatically yet...
+        bitbake('libusb1')
+        # Fetch source
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        url = 'http://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.1.tar.bz2'
+        result = runCmd('wget %s' % url, cwd=tempdir)
+        result = runCmd('tar xfv libftdi1-1.1.tar.bz2', cwd=tempdir)
+        srcdir = os.path.join(tempdir, 'libftdi1-1.1')
+        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'CMakeLists.txt')), 'Unable to find CMakeLists.txt in source directory')
+        # Test devtool add
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool add libftdi %s' % srcdir)
+        self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn('libftdi', result.output)
+        self.assertIn(srcdir, result.output)
+        # Clean up anything in the workdir/sysroot/sstate cache (have to do this *after* devtool add since the recipe only exists then)
+        bitbake('libftdi -c cleansstate')
+        # Test devtool build
+        result = runCmd('devtool build libftdi')
+        staging_libdir = get_bb_var('STAGING_LIBDIR', 'libftdi')
+        self.assertTrue(staging_libdir, 'Could not query STAGING_LIBDIR variable')
+        self.assertTrue(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), 'libftdi binary not found in STAGING_LIBDIR')
+        # Test devtool reset
+        stampprefix = get_bb_var('STAMP', 'libftdi')
+        result = runCmd('devtool reset libftdi')
+        result = runCmd('devtool status')
+        self.assertNotIn('libftdi', result.output)
+        self.assertTrue(stampprefix, 'Unable to get STAMP value for recipe libftdi')
+        matches = glob.glob(stampprefix + '*')
+        self.assertFalse(matches, 'Stamp files exist for recipe libftdi that should have been cleaned')
+        self.assertFalse(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), 'libftdi binary still found in STAGING_LIBDIR after cleaning')
+
     def test_devtool_modify(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 763177d..9b5a085 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -502,7 +502,8 @@ def build(args, config, basepath, workspace):
     if not args.recipename in workspace:
         logger.error("no recipe named %s in your workspace" % args.recipename)
         return -1
-    exec_build_env_command(config.init_path, basepath, 'bitbake -c install %s' % args.recipename, watch=True)
+    build_task = config.get('Build', 'build_task', 'populate_sysroot')
+    exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s' % (build_task, args.recipename), watch=True)
 
     return 0
 
@@ -551,7 +552,7 @@ def register_commands(subparsers, context):
     parser_status.set_defaults(func=status)
 
     parser_build = subparsers.add_parser('build', help='Build a recipe',
-                                         description='Builds the specified recipe using bitbake (up to do_install)',
+                                         description='Builds the specified recipe using bitbake',
                                          formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_build.add_argument('recipename', help='Recipe to build')
     parser_build.set_defaults(func=build)
-- 
1.9.3


