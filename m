Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B68BF60720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 01:46:04 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2016 17:46:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,616,1473145200"; d="scan'208";a="189697431"
Received: from yspay-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.149])
	by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2016 17:46:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 14:45:20 +1300
Message-Id: <367fa9e71b216f28106720672560f6a63b95907c.1478742229.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/7] oe-selftest: devtool: test that updating a file with subdir= works
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
X-List-Received-Date: Thu, 10 Nov 2016 01:46:04 -0000

If you have a file:// entry in SRC_URI with a subdir= parameter that
makes it extract into the source tree, then when you update that file in
oe-local-files and run devtool update-recipe then you want the original
file to be updated. This was made to work by OE-Core commit
9069fef5dad5a873c8a8f720f7bcbc7625556309 together with
31f1bbad248c36a8c86dde4ff57ce42efc664082, however until now there was no
oe-selftest test to verify it.

Note that in order to succeed this test also requires the fix
"lib/oe/recipeutils: ignore archives by default in
get_recipe_local_files()" since the test recipe uses a local tarball.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-test/devtool/devtool-test-subdir.bb    |   7 ++++++
 .../devtool-test-subdir/devtool-test-subdir.tar.gz | Bin 0 -> 181 bytes
 .../devtool/devtool-test-subdir/testfile           |   1 +
 meta/lib/oeqa/selftest/devtool.py                  |  25 +++++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-subdir/devtool-test-subdir.tar.gz
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-subdir/testfile

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb b/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
new file mode 100644
index 0000000..1a163f8
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
@@ -0,0 +1,7 @@
+LICENSE = "CLOSED"
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "file://devtool-test-subdir.tar.gz \
+           file://testfile;subdir=${BPN}"
+
+S = "${WORKDIR}/${BPN}"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-subdir/devtool-test-subdir.tar.gz b/meta-selftest/recipes-test/devtool/devtool-test-subdir/devtool-test-subdir.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..3d44f803cb996f47ddb9566a6a2c278bd2fd38a7
GIT binary patch
literal 181
zcmb2|=3q$6J|51%{Pv<F*C7Le)`x3sUG)NdZmC(erLQpYQrL27neF~E#f~elloTHQ
z&rMTkto#sVzkFZ6>!)O`V=r&CCF&amo1dGRnw5U#@gCt_C1KIoKB3%8wHJFS`o2@h
zUS??8Jmt|PpTgJocYl|^y6(&VH_HWT*GYRHymoE<Z~d>q|Cg=lnV=Qkpj&_Me<H{8
f3#NhR>Li@+zuhOx!GHt~9AEb)s!EYTgMk46=?79i

literal 0
HcmV?d00001

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-subdir/testfile b/meta-selftest/recipes-test/devtool/devtool-test-subdir/testfile
new file mode 100644
index 0000000..12b519c
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-subdir/testfile
@@ -0,0 +1 @@
+Modified version
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 92dc5e5..2a08721 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -972,6 +972,31 @@ class DevtoolTests(DevtoolBase):
         if 'gzip compressed data' not in result.output:
             self.fail('New patch file is not gzipped - file reports:\n%s' % result.output)
 
+    def test_devtool_update_recipe_local_files_subdir(self):
+        # Try devtool extract on a recipe that has a file with subdir= set in
+        # SRC_URI such that it overwrites a file that was in an archive that
+        # was also in SRC_URI
+        # First, modify the recipe
+        testrecipe = 'devtool-test-subdir'
+        recipefile = get_bb_var('FILE', testrecipe)
+        src_uri = get_bb_var('SRC_URI', testrecipe)
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = runCmd('devtool modify %s' % testrecipe)
+        testfile = os.path.join(self.workspacedir, 'sources', testrecipe, 'testfile')
+        self.assertTrue(os.path.exists(testfile), 'Extracted source could not be found')
+        with open(testfile, 'r') as f:
+            contents = f.read().rstrip()
+        self.assertEqual(contents, 'Modified version', 'File has apparently not been overwritten as it should have been')
+        # Test devtool update-recipe without modifying any files
+        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        result = runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = []
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+
     @testcase(1163)
     def test_devtool_extract(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-- 
2.5.5


