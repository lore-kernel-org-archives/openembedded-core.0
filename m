Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AF08F607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 10:04:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Dec 2017 02:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,372,1508828400"; d="scan'208";a="11345939"
Received: from bkhoo8-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.78.167])
	by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2017 02:04:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Dec 2017 23:03:40 +1300
Message-Id: <8816f7ee9faa0f57d73d3894dadb63b8d250d791.1512640717.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512640717.git.paul.eggleton@linux.intel.com>
References: <cover.1512640717.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/1] oe-selftest: devtool: fix test for changes in lzo recipe
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
X-List-Received-Date: Thu, 07 Dec 2017 10:04:19 -0000

acinclude.m4 is about to be removed from the lzo recipe which breaks
test_devtool_update_recipe_local_files_2. Create a synthetic recipe in
meta-selftest with some local files and use that instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-test/devtool/devtool-test-local/file1        |  1 +
 .../recipes-test/devtool/devtool-test-local/file2        |  1 +
 .../recipes-test/devtool/devtool-test-local_6.03.bb      | 15 +++++++++++++++
 meta/lib/oeqa/selftest/cases/devtool.py                  | 16 ++++++++++------
 4 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-local/file1
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-local/file2
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-local/file1 b/meta-selftest/recipes-test/devtool/devtool-test-local/file1
new file mode 100644
index 0000000..f4bdcfc
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-local/file1
@@ -0,0 +1 @@
+The first file
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-local/file2 b/meta-selftest/recipes-test/devtool/devtool-test-local/file2
new file mode 100644
index 0000000..a7e2414
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-local/file2
@@ -0,0 +1 @@
+The second file
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
new file mode 100644
index 0000000..6bfc557
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
@@ -0,0 +1,15 @@
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/syslinux-${PV}.tar.xz \
+           file://file1 \
+           file://file2"
+
+SRC_URI[md5sum] = "92a253df9211e9c20172796ecf388f13"
+SRC_URI[sha256sum] = "26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e"
+
+S = "${WORKDIR}/syslinux-${PV}"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 43280cd..8a1e685 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -987,8 +987,12 @@ class DevtoolTests(DevtoolBase):
     @OETestID(1371)
     def test_devtool_update_recipe_local_files_2(self):
         """Check local source files support when oe-local-files is in Git"""
-        testrecipe = 'lzo'
+        testrecipe = 'devtool-test-local'
         recipefile = get_bb_var('FILE', testrecipe)
+        recipedir = os.path.dirname(recipefile)
+        result = runCmd('git status --porcelain .', cwd=recipedir)
+        if result.output.strip():
+            self.fail('Recipe directory for %s contains uncommitted changes' % testrecipe)
         # Setup srctree for modifying the recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -1002,9 +1006,9 @@ class DevtoolTests(DevtoolBase):
         runCmd('git add oe-local-files', cwd=tempdir)
         runCmd('git commit -m "Add local sources"', cwd=tempdir)
         # Edit / commit local sources
-        runCmd('echo "# Foobar" >> oe-local-files/acinclude.m4', cwd=tempdir)
+        runCmd('echo "# Foobar" >> oe-local-files/file1', cwd=tempdir)
         runCmd('git commit -am "Edit existing file"', cwd=tempdir)
-        runCmd('git rm oe-local-files/run-ptest', cwd=tempdir)
+        runCmd('git rm oe-local-files/file2', cwd=tempdir)
         runCmd('git commit -m"Remove file"', cwd=tempdir)
         runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
         runCmd('git add oe-local-files/new-local', cwd=tempdir)
@@ -1016,11 +1020,11 @@ class DevtoolTests(DevtoolBase):
                                      os.path.dirname(recipefile))
         # Checkout unmodified file to working copy -> devtool should still pick
         # the modified version from HEAD
-        runCmd('git checkout HEAD^ -- oe-local-files/acinclude.m4', cwd=tempdir)
+        runCmd('git checkout HEAD^ -- oe-local-files/file1', cwd=tempdir)
         runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
-                           (' M', '.*/acinclude.m4$'),
-                           (' D', '.*/run-ptest$'),
+                           (' M', '.*/file1$'),
+                           (' D', '.*/file2$'),
                            ('??', '.*/new-local$'),
                            ('??', '.*/0001-Add-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
-- 
2.9.5


