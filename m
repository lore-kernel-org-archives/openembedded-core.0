Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2E49277F38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 21:45:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 17 Jul 2017 14:45:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1152467634"
Received: from unknown (HELO alimonb-mobl1.zpn.intel.com) ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2017 14:45:28 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 16:45:25 -0500
Message-Id: <abda4b7be7e0ed25630d6ab8ece7f91895d851b6.1500327589.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv3 17/30] oeqa/selftest/cases: Use builddir from class instead of get from environment
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
X-List-Received-Date: Mon, 17 Jul 2017 21:45:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now the build directory is setup by Test class, so the builddir attr
points to the actual BUILDDIR instead of get from environment.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py | 7 +++----
 meta/lib/oeqa/selftest/cases/bbtests.py             | 4 ++--
 meta/lib/oeqa/selftest/cases/eSDK.py                | 2 +-
 meta/lib/oeqa/selftest/cases/signing.py             | 2 +-
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
index b42aa3638d5..98b8b60f51a 100644
--- a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
@@ -11,7 +11,6 @@ class RebuildFromSState(SStateBase):
     @classmethod
     def setUpClass(self):
         super(RebuildFromSState, self).setUpClass()
-        self.builddir = os.path.join(os.environ.get('BUILDDIR'))
 
     def get_dep_targets(self, primary_targets):
         found_targets = []
@@ -24,16 +23,16 @@ class RebuildFromSState(SStateBase):
         os.mkdir(builddir)
         self.track_for_cleanup(builddir)
         os.mkdir(os.path.join(builddir, 'conf'))
-        shutil.copyfile(os.path.join(os.environ.get('BUILDDIR'), 'conf/local.conf'), os.path.join(builddir, 'conf/local.conf'))
+        shutil.copyfile(self.localconf_path, os.path.join(builddir, 'conf/local.conf'))
         config = {}
         config['default_sstate_dir'] = "SSTATE_DIR ?= \"${TOPDIR}/sstate-cache\""
         config['null_sstate_mirrors'] = "SSTATE_MIRRORS = \"\""
         config['default_tmp_dir'] = "TMPDIR = \"${TOPDIR}/tmp\""
         for key in config:
             ftools.append_file(os.path.join(builddir, 'conf/selftest.inc'), config[key])
-        shutil.copyfile(os.path.join(os.environ.get('BUILDDIR'), 'conf/bblayers.conf'), os.path.join(builddir, 'conf/bblayers.conf'))
+        shutil.copyfile(self.local_bblayers_path, os.path.join(builddir, 'conf/bblayers.conf'))
         try:
-            shutil.copyfile(os.path.join(os.environ.get('BUILDDIR'), 'conf/auto.conf'), os.path.join(builddir, 'conf/auto.conf'))
+            shutil.copyfile(self.autoconf_path, os.path.join(builddir, 'conf/auto.conf'))
         except:
             pass
 
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 4c82049032b..df11a6bc6d0 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -22,8 +22,8 @@ class BitbakeTests(OESelftestTestCase):
     @OETestID(790)
     def test_run_bitbake_from_dir_2(self):
         my_env = os.environ.copy()
-        my_env['BBPATH'] = my_env['BUILDDIR']
-        os.chdir(os.path.dirname(os.environ['BUILDDIR']))
+        my_env['BBPATH'] = self.builddir
+        os.chdir(os.path.dirname(self.builddir))
         self.assertEqual(bitbake('-e', env=my_env).status, 0, msg = "bitbake couldn't run from builddir")
 
     @OETestID(806)
diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index f36c3ccd3b4..60f4e239ab0 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -49,7 +49,7 @@ class oeSDKExtSelfTest(OESelftestTestCase):
 
     @staticmethod
     def update_configuration(cls, image, tmpdir_eSDKQA, env_eSDK, ext_sdk_path):
-        sstate_dir = os.path.join(os.environ['BUILDDIR'], 'sstate-cache')
+        sstate_dir = os.path.join(cls.builddir, 'sstate-cache')
 
         oeSDKExtSelfTest.generate_eSDK(cls.image)
 
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index edb5f653f20..6ef8d8eb5d0 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -105,7 +105,7 @@ class Signing(OESelftestTestCase):
 
         test_recipe = 'ed'
 
-        builddir = os.environ.get('BUILDDIR')
+        builddir = self.builddir
         sstatedir = os.path.join(builddir, 'test-sstate')
 
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
-- 
2.11.0


