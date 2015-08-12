Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9D248757A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 22:14:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2015 15:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,664,1432623600"; d="scan'208";a="540760410"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2015 15:14:16 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 14:05:55 +0000
Message-Id: <1d3d821bd71538a1a5fe6308e94ecbb293a252bd.1439387979.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1439387979.git.mariano.lopez@linux.intel.com>
References: <cover.1439387979.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1439387979.git.mariano.lopez@linux.intel.com>
References: <cover.1439387979.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 5/6] oetest.py: Added method tearDown for oeRuntimeTest
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
X-List-Received-Date: Wed, 12 Aug 2015 22:14:16 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The tearDown method is triggered when a tests ends
it doesn't matter if fails or succeeds. Inside this
method added an evalution to check if fails and then
run some commands in the target to get the data for
later debugging.

[YOCTO #8118]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 22d76b3..a3f297a 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -11,6 +11,7 @@ import os, re, mmap
 import unittest
 import inspect
 import subprocess
+import datetime
 import bb
 from oeqa.utils.decorators import LogResults
 
@@ -117,6 +118,42 @@ class oeRuntimeTest(oeTest):
         self.target = oeRuntimeTest.tc.target
         super(oeRuntimeTest, self).__init__(methodName)
 
+    def tearDown(self):
+        # If a test fails or there is an exception
+        if (self._resultForDoCleanups.failures or
+                self._resultForDoCleanups.errors):
+            commands = ["top -bn1", "ps", "free", "df", "_ping", "dmesg", "netstat -a", "ifconfig -a", "_logs"]
+            dump_dir = "/tmp/oe-saved-tests"
+            dump_dir = os.path.join(dump_dir,
+                    datetime.datetime.now().strftime('%Y%m%d%H%M'))
+            os.makedirs(dump_dir)
+            bb.warn("Test failed, getting data from target "
+                    "and saving it in %s" % dump_dir)
+            output = self.run_bulk_commands(commands)
+            for key,msg in output.iteritems():
+                filename = key.split()[0]
+                with open(os.path.join(dump_dir, filename), 'w') as f:
+                    f.write(msg)
+
+    def run_bulk_commands(self, commands):
+        all_output = {}
+        for command in commands:
+            # This will ping the host from target
+            if command == "_ping":
+                 comm = "ping -c3 %s" % self.target.server_ip
+            # This will get all the logs from /var/log/
+            elif command == "_logs":
+                comm = 'find /var/log/ -type f 2>/dev/null '
+                comm = '%s-exec echo "%s" \\; ' % (comm, '='*20)
+                comm = '%s-exec echo {} \\; ' % comm
+                comm = '%s-exec echo "%s" \\; ' % (comm, '='*20)
+                comm = '%s-exec cat {} \\; -exec echo "" \\;' % comm
+            else:
+                comm = command
+            (status, output) = self.target.run_serial(comm)
+            all_output[command] = output
+        return all_output
+
     #TODO: use package_manager.py to install packages on any type of image
     def install_packages(self, packagelist):
         for package in packagelist:
-- 
1.8.4.5


