Return-Path: <costin.c.constantin@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4609371633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 16:01:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 28 Aug 2015 09:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,425,1437462000"; d="scan'208";a="792821291"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2015 09:01:21 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id D98EF6A4005;
	Fri, 28 Aug 2015 09:00:29 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 19:12:18 +0300
Message-Id: <1440778338-12630-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] utils/decorators.py: TestNeedsBin, decorator for sending binaries to images
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
X-List-Received-Date: Fri, 28 Aug 2015 16:01:48 -0000

TestNeedsBin is a decorator to help deploy binaries to the running image.
It uses no package management system.
It gets it's source binaries from the rpm built packages found under
DEPLOY_DIR_RPM. As mandatory arguments, it requires only the binary
name. The binary is sent by default to the DUT's "/usr/bin" dir, making
it available in system PATH. Like this, a test should only call the desired
binary name without any path.

Left to do:
- implement support for binaries versioning
- accept any source path to a given binaries directory
- add a tag
- add support for exported tests that will run on remote testing env.
without presence of poky

related to [Yocto #7850]

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 73 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index b9fc76c..a999018 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -6,13 +6,15 @@
 # Most useful is skipUnlessPassed which can be used for
 # creating dependecies between two test methods.
 
-import os
+import os,re
 import logging
 import sys
 import unittest
 import threading
 import signal
 from functools import wraps
+import subprocess as s
+
 
 #get the "result" object from one of the upper frames provided that one of these upper frames is a unittest.case frame
 class getResults(object):
@@ -185,4 +187,71 @@ def timeout(seconds):
             return wrapped_f
         else:
             return fn
-    return decorator
\ No newline at end of file
+    return decorator
+
+# this part for the bin <---> test binding
+from difflib import SequenceMatcher as SM
+def get_dest_folder(tune_features, folder_list):
+    features_list = tune_features.split(" ")
+    features_list.reverse()
+    features_list = "_".join(features_list)
+    match_rate = 0
+    best_match = None
+    for folder in folder_list:
+        if SM(None, folder, features_list).ratio() > match_rate:
+            match_rate = SM(None, folder, features_list).ratio()
+            best_match = folder
+    return best_match
+
+
+
+class TestNeedsBin(object):
+
+    def __init__(self, bin_name, bin_ver=None, source_dir=None, dest_dir="/usr/bin", TAG=None):
+        try:
+            import bb
+            self.under_bitbake_env = True
+        except:
+            self.under_bitbake_env = False
+        self.bin_name = bin_name
+        self.bin_ver = bin_ver
+        self.source_dir = source_dir
+        self.dest_dir = dest_dir
+        self.TAG = TAG
+
+    def transfer_bin(self):
+        from oeqa.oetest import oeRuntimeTest
+        if self.under_bitbake_env:
+            if not self.source_dir:
+                arch_dir = get_dest_folder(oeRuntimeTest.tc.d.getVar("TUNE_FEATURES", True), os.listdir(oeRuntimeTest.tc.d.getVar("DEPLOY_DIR_RPM", True)))
+                self.source_dir = os.path.join(oeRuntimeTest.tc.d.getVar("DEPLOY_DIR_RPM", True), arch_dir)
+                if not arch_dir:
+                    bb.warn("cannot find source dir")
+            for file in os.listdir(self.source_dir):
+                if re.match("%s-[0-9].*rpm" % self.bin_name, file):
+                    rpm_name = file
+            local_binary = s.check_output("rpm -qlp %s" % os.path.join(self.source_dir, rpm_name), shell=True).split("\n")[-2]
+            if local_binary[0] == r'/':
+                local_binary = local_binary[1:]
+            if os.path.isfile(os.path.join(self.source_dir, rpm_name)):
+                command = "/usr/bin/rpm2cpio %s | cpio -idm" % os.path.join(self.source_dir, rpm_name)
+                s.check_output(command, shell=True)
+            else:
+                bb.warn("Cannot find package file to extract!")
+            if os.path.isfile(local_binary):
+                (status, output) = oeRuntimeTest.tc.target.copy_to(local_binary, self.dest_dir)
+            else:
+                bb.warn("Cannot find binary file!")
+            if status != 0:
+                bb.warn("Error at copying binary!")
+
+        else: #when decorator is on the remote machine
+            #this part will serve when tests are present on remote machine
+            pass
+
+    def __call__(self, func):
+        def wrapped_f(*args):
+            self.transfer_bin()
+            return func(*args)
+        wrapped_f.__name__ = func.__name__
+        return wrapped_f
-- 
2.1.4


