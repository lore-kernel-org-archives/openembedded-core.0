Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 75C637821A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:37:04 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133797"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:37:05 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:36:58 -0500
Message-Id: <6a09a5ab9115706db49a7eb3719159324f98a75d.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 12/29] oeqa/selftest/case: Creates meta-selftest layer per class
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
X-List-Received-Date: Wed, 12 Jul 2017 19:37:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The meta-selftest layer is used by test cases to modify
meta data but in a threaded environment two test cases can
modify the meta data causing errors because the signatures
will change.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/case.py | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index 3998aeac5c4..bbdce4cf9e8 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -7,6 +7,7 @@ import shutil
 import glob
 import errno
 import re
+import subprocess
 from unittest.util import safe_repr
 
 import oeqa.utils.ftools as ftools
@@ -24,6 +25,8 @@ class OESelftestTestCase(OETestCase):
 
     @classmethod
     def _setUpBuildDir(cls):
+        cls.orig_testlayer_path = cls.tc.config_paths['testlayer_path']
+
         if cls._use_own_builddir:
             cls.builddir = os.path.join(cls.tc.config_paths['base_builddir'],
                     cls.__module__, cls.__name__)
@@ -35,14 +38,23 @@ class OESelftestTestCase(OETestCase):
                     "conf/bblayers.conf")
             cls.local_bblayers_backup = os.path.join(cls.builddir,
                     "conf/bblayers.conf.bk")
+
+            cls.base_testlayer_path = os.path.join(cls.builddir,
+                    'layers')
+            cls.testlayer_path = os.path.join(cls.base_testlayer_path,
+                    os.path.basename(cls.orig_testlayer_path))
         else:
             cls.builddir = cls.tc.config_paths['builddir']
+
             cls.localconf_path = cls.tc.config_paths['localconf']
             cls.localconf_backup = cls.tc.config_paths['localconf_class_backup']
             cls.local_bblayers_path = cls.tc.config_paths['bblayers']
             cls.local_bblayers_backup = \
                     cls.tc.config_paths['bblayers_class_backup']
 
+            cls.base_testlayer_path = os.path.dirname(cls.orig_testlayer_path)
+            cls.testlayer_path = cls.orig_testlayer_path
+
         cls.testinc_path = os.path.join(cls.builddir, "conf/selftest.inc")
         cls.testinc_bblayers_path = os.path.join(cls.builddir,
                 "conf/bblayers.inc")
@@ -53,8 +65,11 @@ class OESelftestTestCase(OETestCase):
             os.makedirs(cls.builddir)
 
             builddir_conf = os.path.join(cls.builddir, 'conf')
-            origdir_conf = os.path.join(cls.tc.config_paths['builddir'], 'conf')
-            shutil.copytree(origdir_conf, builddir_conf)
+            os.makedirs(builddir_conf)
+            shutil.copyfile(cls.tc.config_paths['localconf_backup'],
+                    os.path.join(builddir_conf, 'local.conf'))
+            shutil.copyfile(cls.tc.config_paths['bblayers_backup'],
+                    os.path.join(builddir_conf, 'bblayers.conf'))
 
             ftools.append_file(cls.localconf_path, "# added by oe-selftest base class")
 
@@ -75,11 +90,24 @@ class OESelftestTestCase(OETestCase):
                 ftools.append_file(cls.localconf_path, "PARALLEL_MAKE?=\"-j %d\"" %
                         cls.tc.loader.process_num)
 
+            # copy meta-selftest per class to avoid races when changing meta-data
+            # and init git repository because some tests review the repo status
+            os.makedirs(cls.base_testlayer_path)
+            shutil.copytree(cls.orig_testlayer_path, cls.testlayer_path)
+            cls.runCmd("git init; git add *; git commit -a -m 'initial'",
+                            cwd=cls.testlayer_path)
+
+            # XXX: sometimes meta-selftest isn't on bblayers at first backup
+            try:
+                cls.runCmd("bitbake-layers remove-layer %s" % cls.orig_testlayer_path)
+            except:
+                pass
+            cls.runCmd("bitbake-layers add-layer %s" % cls.testlayer_path)
+
     @classmethod
     def setUpClass(cls):
         super(OESelftestTestCase, cls).setUpClass()
 
-        cls.testlayer_path = cls.tc.config_paths['testlayer_path']
         cls._setUpBuildDir()
 
         cls._track_for_cleanup = [
-- 
2.11.0


