Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 25C7060720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 01:45:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2016 17:45:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,616,1473145200"; d="scan'208";a="189697346"
Received: from yspay-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.149])
	by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2016 17:45:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 14:45:15 +1300
Message-Id: <c1c3e70a313f37eacbeef1180d70af0e3ca52ac8.1478742229.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/7] oe-selftest: devtool: test update-recipe with only local files
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
X-List-Received-Date: Thu, 10 Nov 2016 01:45:52 -0000

Add a test to ensure devtool update-recipe works properly on recipes
that contain only local files (since the other tests we have didn't test
that).

Relates to [YOCTO #10563].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-test/devtool/devtool-test-localonly.bb     |  6 ++++++
 .../recipes-test/devtool/devtool-test-localonly/file1  |  1 +
 .../recipes-test/devtool/devtool-test-localonly/file2  |  1 +
 meta/lib/oeqa/selftest/devtool.py                      | 18 ++++++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-localonly/file1
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-localonly/file2

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
new file mode 100644
index 0000000..28ff49e
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
@@ -0,0 +1,6 @@
+LICENSE = "CLOSED"
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "file://file1 \
+           file://file2"
+
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-localonly/file1 b/meta-selftest/recipes-test/devtool/devtool-test-localonly/file1
new file mode 100644
index 0000000..f4bdcfc
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-localonly/file1
@@ -0,0 +1 @@
+The first file
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-localonly/file2 b/meta-selftest/recipes-test/devtool/devtool-test-localonly/file2
new file mode 100644
index 0000000..a7e2414
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-localonly/file2
@@ -0,0 +1 @@
+The second file
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 46f5a0b..f6226c1 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -930,6 +930,24 @@ class DevtoolTests(DevtoolBase):
                            ('??', '.*/0001-Add-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
+    def test_devtool_update_recipe_local_files_3(self):
+        # First, modify the recipe
+        testrecipe = 'devtool-test-localonly'
+        recipefile = get_bb_var('FILE', testrecipe)
+        src_uri = get_bb_var('SRC_URI', testrecipe)
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = runCmd('devtool modify %s' % testrecipe)
+        # Modify one file
+        runCmd('echo "Another line" >> file2', cwd=os.path.join(self.workspacedir, 'sources', testrecipe, 'oe-local-files'))
+        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        result = runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = [(' M', '.*/%s/file2$' % testrecipe)]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+
     @testcase(1163)
     def test_devtool_extract(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-- 
2.5.5


