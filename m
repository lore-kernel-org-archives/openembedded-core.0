Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 748A877382
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:09:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Feb 2016 21:09:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,492,1449561600"; d="scan'208";a="658305730"
Received: from sloi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.175])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2016 21:09:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:07:34 +1300
Message-Id: <66191bd6679c5ba794e344022fd3843b1b408c0e.1456290353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/14] oe-selftest: devtool: add an additional test for devtool upgrade
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
X-List-Received-Date: Wed, 24 Feb 2016 05:09:31 -0000

Add a test for devtool upgrade with a recipe pointing to a git
repository, since this uses several different code paths.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../devtool/devtool-upgrade-test2_git.bb           | 18 +++++++++++
 .../devtool/devtool-upgrade-test2_git.bb.upgraded  | 17 ++++++++++
 meta/lib/oeqa/selftest/devtool.py                  | 36 ++++++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
new file mode 100644
index 0000000..9bfce0a
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A simple tool to wait for a specific signal over DBus"
+HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/dbus-wait"
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "dbus"
+
+# Note: this is intentionally not the latest version in the original .bb
+SRCREV = "1a3e1343761b30750bed70e0fd688f6d3c7b3717"
+PV = "0.1+git${SRCPV}"
+PR = "r2"
+
+SRC_URI = "git://git.yoctoproject.org/dbus-wait"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
new file mode 100644
index 0000000..9b947ed
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
@@ -0,0 +1,17 @@
+SUMMARY = "A simple tool to wait for a specific signal over DBus"
+HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/dbus-wait"
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "dbus"
+
+# Note: this is intentionally not the latest version in the original .bb
+SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
+PV = "0.1+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/dbus-wait"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 4d280bb..d41af2f 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1136,6 +1136,42 @@ class DevtoolTests(DevtoolBase):
         self.assertNotIn(recipe, result.output)
         self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after resetting')
 
+    def test_devtool_upgrade_git(self):
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        recipe = 'devtool-upgrade-test2'
+        commit = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
+        oldrecipefile = get_bb_var('FILE', recipe)
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        # Check that recipe is not already under devtool control
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output)
+        # Check upgrade
+        result = runCmd('devtool upgrade %s %s -S %s' % (recipe, tempdir, commit))
+        # Check if srctree at least is populated
+        self.assertTrue(len(os.listdir(tempdir)) > 0, 'srctree (%s) should be populated with new (%s) source code' % (tempdir, commit))
+        # Check new recipe file is present
+        newrecipefile = os.path.join(self.workspacedir, 'recipes', recipe, os.path.basename(oldrecipefile))
+        self.assertTrue(os.path.exists(newrecipefile), 'Recipe file should exist after upgrade')
+        # Check devtool status and make sure recipe is present
+        result = runCmd('devtool status')
+        self.assertIn(recipe, result.output)
+        self.assertIn(tempdir, result.output)
+        # Check recipe got changed as expected
+        with open(oldrecipefile + '.upgraded', 'r') as f:
+            desiredlines = f.readlines()
+        with open(newrecipefile, 'r') as f:
+            newlines = f.readlines()
+        self.assertEqual(desiredlines, newlines)
+        # Check devtool reset recipe
+        result = runCmd('devtool reset %s -n' % recipe)
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output)
+        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after resetting')
+
     @testcase(1352)
     def test_devtool_layer_plugins(self):
         """Test that devtool can use plugins from other layers.
-- 
2.5.0


