Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 97B53780B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:37:09 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:37:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133826"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:37:10 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:37:02 -0500
Message-Id: <2ca87baffe0e518c1c34835a914f51c78cbecf0c.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 16/29] oeqa/selftest/cases: Use builddir from class instead of get from environment
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
X-List-Received-Date: Wed, 12 Jul 2017 19:37:09 -0000
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


