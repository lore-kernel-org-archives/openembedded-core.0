Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2B05E60024
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 08:59:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 29 Jun 2015 01:59:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,698,1427785200"; d="scan'208";a="719458791"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2015 01:59:48 -0700
Received: from localhost.localdomain (unknown [10.237.112.249])
	by linux.intel.com (Postfix) with ESMTP id D58706A4083;
	Mon, 29 Jun 2015 01:59:08 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 11:59:41 +0300
Message-Id: <1435568381-12011-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/selftest: Add methods to manipulate bblayers.conf in base.py
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
X-List-Received-Date: Mon, 29 Jun 2015 08:59:59 -0000

Added methods for manipulating bblayers.conf file in the same manner as local.conf file:
    - write_bblayers_config
    - append_bblayers_config
    - remove_bblayers_config

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/base.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index 80b9b4b..b2faa66 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -27,6 +27,8 @@ class oeSelfTest(unittest.TestCase):
         self.builddir = os.environ.get("BUILDDIR")
         self.localconf_path = os.path.join(self.builddir, "conf/local.conf")
         self.testinc_path = os.path.join(self.builddir, "conf/selftest.inc")
+        self.local_bblayers_path = os.path.join(self.builddir, "conf/bblayers.conf")
+        self.testinc_bblayers_path = os.path.join(self.builddir, "conf/bblayers.inc")
         self.testlayer_path = oeSelfTest.testlayer_path
         self._extra_tear_down_commands = []
         self._track_for_cleanup = []
@@ -45,6 +47,11 @@ class oeSelfTest(unittest.TestCase):
             for f in files:
                 if f == 'test_recipe.inc':
                     os.remove(os.path.join(root, f))
+        try:
+            os.remove(self.testinc_bblayers_path)
+        except OSError as e:
+            if e.errno != errno.ENOENT:
+                raise
         # tests might need their own setup
         # but if they overwrite this one they have to call
         # super each time, so let's give them an alternative
@@ -129,3 +136,18 @@ class oeSelfTest(unittest.TestCase):
         except OSError as e:
             if e.errno != errno.ENOENT:
                 raise
+
+    # write to <builddir>/conf/bblayers.inc
+    def write_bblayers_config(self, data):
+        self.log.debug("Writing to: %s\n%s\n" % (self.testinc_bblayers_path, data))
+        ftools.write_file(self.testinc_bblayers_path, data)
+
+    # append to <builddir>/conf/bblayers.inc
+    def append_bblayers_config(self, data):
+        self.log.debug("Appending to: %s\n%s\n" % (self.testinc_bblayers_path, data))
+        ftools.append_file(self.testinc_bblayers_path, data)
+
+    # remove data from <builddir>/conf/bblayers.inc
+    def remove_bblayers_config(self, data):
+        self.log.debug("Removing from: %s\n\%s\n" % (self.testinc_bblayers_path, data))
+        ftools.remove_from_file(self.testinc_bblayers_path, data)
-- 
2.1.4


