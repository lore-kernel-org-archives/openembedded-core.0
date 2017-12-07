Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8602D77D6B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 09:04:13 +0000 (UTC)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Dec 2017 01:04:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,372,1508828400"; 
   d="scan'208";a="776148"
Received: from bkhoo8-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.78.167])
	by orsmga007.jf.intel.com with ESMTP; 07 Dec 2017 01:04:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Dec 2017 22:03:16 +1300
Message-Id: <32d5e60c53a716840f12d34521ea05fbea434fac.1512637151.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512637151.git.paul.eggleton@linux.intel.com>
References: <cover.1512637151.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] oe-selftest: devtool: fix test for changes in lzo recipe
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
X-List-Received-Date: Thu, 07 Dec 2017 09:04:13 -0000

acinclude.m4 is about to be removed from the lzo recipe which breaks
test_devtool_update_recipe_local_files_2. Create a synthetic recipe in
meta-selftest with some local files and use that instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-selftest/recipes-test/devtool/devtool-test-local/file1  |  1 +
 meta-selftest/recipes-test/devtool/devtool-test-local/file2  |  1 +
 .../recipes-test/devtool/devtool-test-local_6.03.bb          | 10 ++++++++++
 meta/lib/oeqa/selftest/cases/devtool.py                      | 12 ++++++------
 4 files changed, 18 insertions(+), 6 deletions(-)
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
index 0000000..bd731f7
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
@@ -0,0 +1,10 @@
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/syslinux-6.03.tar.xz \
+           file://file1 \
+           file://file2"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 43280cd..9710fd3 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -987,7 +987,7 @@ class DevtoolTests(DevtoolBase):
     @OETestID(1371)
     def test_devtool_update_recipe_local_files_2(self):
         """Check local source files support when oe-local-files is in Git"""
-        testrecipe = 'lzo'
+        testrecipe = 'devtool-test-local'
         recipefile = get_bb_var('FILE', testrecipe)
         # Setup srctree for modifying the recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -1002,9 +1002,9 @@ class DevtoolTests(DevtoolBase):
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
@@ -1016,11 +1016,11 @@ class DevtoolTests(DevtoolBase):
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


