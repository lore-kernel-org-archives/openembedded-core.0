Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 755DC6E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 19:55:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 21 Sep 2016 12:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,375,1470726000"; d="scan'208";a="1034354135"
Received: from yocto-ab04.ostc.intel.com ([10.54.69.51])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2016 12:55:03 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 12:54:59 -0700
Message-Id: <1474487699-24936-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2] oeqa/selftest/base: backup and restore local configuration files
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
X-List-Received-Date: Wed, 21 Sep 2016 19:55:01 -0000

Selftests' cleanup method during test setup is not capable of
restoring local configuration files that remain modified after
aborting a test through a keyboard interruption.
This change creates backups for local.conf and bblayers.conf at
test setup, restore them when found, and deletes them at cleanup.

[YOCTO #9390]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/base.py | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index b5a52fe..26c93f9 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -28,17 +28,47 @@ class oeSelfTest(unittest.TestCase):
     def __init__(self, methodName="runTest"):
         self.builddir = os.environ.get("BUILDDIR")
         self.localconf_path = os.path.join(self.builddir, "conf/local.conf")
+        self.localconf_backup = os.path.join(self.builddir, "conf/local.bk")
         self.testinc_path = os.path.join(self.builddir, "conf/selftest.inc")
         self.local_bblayers_path = os.path.join(self.builddir, "conf/bblayers.conf")
+        self.local_bblayers_backup = os.path.join(self.builddir,
+                                                  "conf/bblayers.bk")
         self.testinc_bblayers_path = os.path.join(self.builddir, "conf/bblayers.inc")
         self.machineinc_path = os.path.join(self.builddir, "conf/machine.inc")
         self.testlayer_path = oeSelfTest.testlayer_path
         self._extra_tear_down_commands = []
-        self._track_for_cleanup = [self.testinc_path, self.testinc_bblayers_path, self.machineinc_path]
+        self._track_for_cleanup = [
+            self.testinc_path, self.testinc_bblayers_path,
+            self.machineinc_path, self.localconf_backup,
+            self.local_bblayers_backup]
         super(oeSelfTest, self).__init__(methodName)
 
     def setUp(self):
         os.chdir(self.builddir)
+        # Check if local.conf or bblayers.conf files backup exists
+        # from a previous failed test and restore them
+        if os.path.isfile(self.localconf_backup) or os.path.isfile(
+                self.local_bblayers_backup):
+            self.log.debug("Found a local.conf and/or bblayers.conf backup \
+from a previously aborted test. Restoring these files now, but tests should \
+be re-executed from a clean environment to ensure accurate results.")
+            try:
+                shutil.copyfile(self.localconf_backup, self.localconf_path)
+            except OSError as e:
+                if e.errno != errno.ENOENT:
+                    raise
+            try:
+                shutil.copyfile(self.local_bblayers_backup,
+                                self.local_bblayers_path)
+            except OSError as e:
+                if e.errno != errno.ENOENT:
+                    raise
+        else:
+            # backup local.conf and bblayers.conf
+            shutil.copyfile(self.localconf_path, self.localconf_backup)
+            shutil.copyfile(self.local_bblayers_path,
+                            self.local_bblayers_backup)
+            self.log.debug("Creating local.conf and bblayers.conf backups.")
         # we don't know what the previous test left around in config or inc files
         # if it failed so we need a fresh start
         try:
-- 
1.8.3.1


