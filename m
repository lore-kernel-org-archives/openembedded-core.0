Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 866F86AF0C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 12:09:31 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Jan 2014 04:09:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,658,1384329600"; d="scan'208";a="334129593"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Jan 2014 04:09:30 -0800
Received: from localhost.localdomain (unknown [10.237.112.161])
	by linux.intel.com (Postfix) with ESMTP id 7BBF06A4094;
	Tue, 14 Jan 2014 04:09:25 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 14:21:21 +0100
Message-Id: <1389705681-17841-3-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1389705681-17841-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1389705681-17841-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 3/3] oe-selftest: separated the SStateBase and SStateTests in different modules
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
X-List-Received-Date: Tue, 14 Jan 2014 12:09:31 -0000

- SStateBase now has its own module to be imported by itself by other modules like sstatetests.py

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/sstate.py      |   53 +++++++++++++++++++++++++++++++++
 meta/lib/oeqa/selftest/sstatetests.py |   43 +-------------------------
 2 files changed, 54 insertions(+), 42 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/sstate.py

diff --git a/meta/lib/oeqa/selftest/sstate.py b/meta/lib/oeqa/selftest/sstate.py
new file mode 100644
index 0000000..5989724
--- /dev/null
+++ b/meta/lib/oeqa/selftest/sstate.py
@@ -0,0 +1,53 @@
+import datetime
+import unittest
+import os
+import re
+import shutil
+
+import oeqa.utils.ftools as ftools
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
+
+
+class SStateBase(oeSelfTest):
+
+    def setUpLocal(self):
+        self.temp_sstate_location = None
+        self.sstate_path = get_bb_var('SSTATE_DIR')
+        self.distro = get_bb_var('NATIVELSBSTRING')
+        self.distro_specific_sstate = os.path.join(self.sstate_path, self.distro)
+
+    # Creates a special sstate configuration with the option to add sstate mirrors
+    def config_sstate(self, temp_sstate_location=False, add_local_mirrors=[]):
+        self.temp_sstate_location = temp_sstate_location
+
+        if self.temp_sstate_location:
+            temp_sstate_path = os.path.join(self.builddir, "temp_sstate_%s" % datetime.datetime.now().strftime('%Y%m%d%H%M%S'))
+            config_temp_sstate = "SSTATE_DIR = \"%s\"" % temp_sstate_path
+            self.append_config(config_temp_sstate)
+            self.track_for_cleanup(temp_sstate_path)
+        self.sstate_path = get_bb_var('SSTATE_DIR')
+        self.distro = get_bb_var('NATIVELSBSTRING')
+        self.distro_specific_sstate = os.path.join(self.sstate_path, self.distro)
+
+        if add_local_mirrors:
+            config_set_sstate_if_not_set = 'SSTATE_MIRRORS ?= ""'
+            self.append_config(config_set_sstate_if_not_set)
+            for local_mirror in add_local_mirrors:
+                self.assertFalse(os.path.join(local_mirror) == os.path.join(self.sstate_path), msg='Cannot add the current sstate path as a sstate mirror')
+                config_sstate_mirror = "SSTATE_MIRRORS += \"file://.* file:///%s/PATH\"" % local_mirror
+                self.append_config(config_sstate_mirror)
+
+    # Returns a list containing sstate files
+    def search_sstate(self, filename_regex, distro_specific=True, distro_nonspecific=True):
+        result = []
+        for root, dirs, files in os.walk(self.sstate_path):
+            if distro_specific and re.search("%s/[a-z0-9]{2}$" % self.distro, root):
+                for f in files:
+                    if re.search(filename_regex, f):
+                        result.append(f)
+            if distro_nonspecific and re.search("%s/[a-z0-9]{2}$" % self.sstate_path, root):
+                for f in files:
+                    if re.search(filename_regex, f):
+                        result.append(f)
+        return result
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index a0489fe..4b2c26d 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -7,49 +7,8 @@ import shutil
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.selftest.sstate import SStateBase
 
-class SStateBase(oeSelfTest):
-
-    def setUpLocal(self):
-        self.temp_sstate_location = None
-        self.sstate_path = get_bb_var('SSTATE_DIR')
-        self.distro = get_bb_var('NATIVELSBSTRING')
-        self.distro_specific_sstate = os.path.join(self.sstate_path, self.distro)
-
-    # Creates a special sstate configuration with the option to add sstate mirrors
-    def config_sstate(self, temp_sstate_location=False, add_local_mirrors=[]):
-        self.temp_sstate_location = temp_sstate_location
-
-        if self.temp_sstate_location:
-            temp_sstate_path = os.path.join(self.builddir, "temp_sstate_%s" % datetime.datetime.now().strftime('%Y%m%d%H%M%S'))
-            config_temp_sstate = "SSTATE_DIR = \"%s\"" % temp_sstate_path
-            self.append_config(config_temp_sstate)
-            self.track_for_cleanup(temp_sstate_path)
-        self.sstate_path = get_bb_var('SSTATE_DIR')
-        self.distro = get_bb_var('NATIVELSBSTRING')
-        self.distro_specific_sstate = os.path.join(self.sstate_path, self.distro)
-
-        if add_local_mirrors:
-            config_set_sstate_if_not_set = 'SSTATE_MIRRORS ?= ""'
-            self.append_config(config_set_sstate_if_not_set)
-            for local_mirror in add_local_mirrors:
-                self.assertFalse(os.path.join(local_mirror) == os.path.join(self.sstate_path), msg='Cannot add the current sstate path as a sstate mirror')
-                config_sstate_mirror = "SSTATE_MIRRORS += \"file://.* file:///%s/PATH\"" % local_mirror
-                self.append_config(config_sstate_mirror)
-
-    # Returns a list containing sstate files
-    def search_sstate(self, filename_regex, distro_specific=True, distro_nonspecific=True):
-        result = []
-        for root, dirs, files in os.walk(self.sstate_path):
-            if distro_specific and re.search("%s/[a-z0-9]{2}$" % self.distro, root):
-                for f in files:
-                    if re.search(filename_regex, f):
-                        result.append(f)
-            if distro_nonspecific and re.search("%s/[a-z0-9]{2}$" % self.sstate_path, root):
-                for f in files:
-                    if re.search(filename_regex, f):
-                        result.append(f)
-        return result
 
 class SStateTests(SStateBase):
 
-- 
1.7.9.5


