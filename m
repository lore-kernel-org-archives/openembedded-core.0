Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 71D32731DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:19:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2016 03:19:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="635440151"
Received: from stan94-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.180.176])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2016 03:19:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 00:18:35 +1300
Message-Id: <3b3cb71f3b5b2c0c0979de626b6be5b502d8fe58.1453115842.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/10] oe-selftest: devtool: fix test_devtool_add_library if python was built first
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
X-List-Received-Date: Mon, 18 Jan 2016 11:19:31 -0000

If Python is in the sysroot then this test can fail due to some
brokenness in libftdi's CMakeLists.txt file for its python bindings.
Just disable it in order to have the test work more reliably.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index f6471bd..43c7cda 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -208,15 +208,16 @@ class DevtoolTests(DevtoolBase):
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-        url = 'http://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.1.tar.bz2'
+        version = '1.1'
+        url = 'https://www.intra2net.com/en/developer/libftdi/download/libftdi1-%s.tar.bz2' % version
         result = runCmd('wget %s' % url, cwd=tempdir)
-        result = runCmd('tar xfv libftdi1-1.1.tar.bz2', cwd=tempdir)
-        srcdir = os.path.join(tempdir, 'libftdi1-1.1')
+        result = runCmd('tar xfv libftdi1-%s.tar.bz2' % version, cwd=tempdir)
+        srcdir = os.path.join(tempdir, 'libftdi1-%s' % version)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'CMakeLists.txt')), 'Unable to find CMakeLists.txt in source directory')
         # Test devtool add (and use -V so we test that too)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add libftdi %s -V 1.1' % srcdir)
+        result = runCmd('devtool add libftdi %s -V %s' % (srcdir, version))
         self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
         # Test devtool status
         result = runCmd('devtool status')
@@ -224,6 +225,9 @@ class DevtoolTests(DevtoolBase):
         self.assertIn(srcdir, result.output)
         # Clean up anything in the workdir/sysroot/sstate cache (have to do this *after* devtool add since the recipe only exists then)
         bitbake('libftdi -c cleansstate')
+        # libftdi's python/CMakeLists.txt is a bit broken, so let's just disable it
+        recipefile = '%s/recipes/libftdi/libftdi_%s.bb' % (self.workspacedir, version)
+        result = runCmd('recipetool setvar %s EXTRA_OECMAKE -- "-DPYTHON_BINDINGS=OFF"' % recipefile)
         # Test devtool build
         result = runCmd('devtool build libftdi')
         staging_libdir = get_bb_var('STAGING_LIBDIR', 'libftdi')
-- 
2.5.0


