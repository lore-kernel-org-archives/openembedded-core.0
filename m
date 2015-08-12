Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D9DAF73D64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 22:14:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2015 15:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,664,1432623600"; d="scan'208";a="540760413"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2015 15:14:18 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 14:05:56 +0000
Message-Id: <ce523d3c222d2370e019366cfc34b07cbcf8960c.1439387979.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1439387979.git.mariano.lopez@linux.intel.com>
References: <cover.1439387979.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1439387979.git.mariano.lopez@linux.intel.com>
References: <cover.1439387979.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 6/6] oetest.py: Don't wait to write dump files
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
X-List-Received-Date: Wed, 12 Aug 2015 22:14:18 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This allows to write the dump files immediately
after get the data from the target. Before this,
it would run all the commands and write the files.
The old behavior could cause no log written at all
if the serial console gets stuck.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index a3f297a..dfed3de 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -122,21 +122,18 @@ class oeRuntimeTest(oeTest):
         # If a test fails or there is an exception
         if (self._resultForDoCleanups.failures or
                 self._resultForDoCleanups.errors):
-            commands = ["top -bn1", "ps", "free", "df", "_ping", "dmesg", "netstat -a", "ifconfig -a", "_logs"]
-            dump_dir = "/tmp/oe-saved-tests"
-            dump_dir = os.path.join(dump_dir,
-                    datetime.datetime.now().strftime('%Y%m%d%H%M'))
-            os.makedirs(dump_dir)
-            bb.warn("Test failed, getting data from target "
-                    "and saving it in %s" % dump_dir)
-            output = self.run_bulk_commands(commands)
-            for key,msg in output.iteritems():
-                filename = key.split()[0]
-                with open(os.path.join(dump_dir, filename), 'w') as f:
-                    f.write(msg)
-
-    def run_bulk_commands(self, commands):
-        all_output = {}
+            self.dump_target_logs()
+
+    def dump_target_logs(self):
+        commands = ["top -bn1", "ps", "free", "df", "_ping", "dmesg", "netstat -a", "ifconfig -a", "_logs"]
+        dump_dir = "/tmp/oe-saved-tests"
+        dump_sub_dir = ("%s_%s" % (
+                datetime.datetime.now().strftime('%Y%m%d%H%M'),
+                self._testMethodName))
+        dump_dir = os.path.join(dump_dir, dump_sub_dir)
+        os.makedirs(dump_dir)
+        bb.warn("%s failed: getting data from target and "
+                "saving into %s" % (self._testMethodName, dump_dir))
         for command in commands:
             # This will ping the host from target
             if command == "_ping":
@@ -151,8 +148,9 @@ class oeRuntimeTest(oeTest):
             else:
                 comm = command 
             (status, output) = self.target.run_serial(comm)
-            all_output[command] = output
-        return all_output
+            filename = command.split()[0]
+            with open(os.path.join(dump_dir, filename), 'w') as f:
+                f.write(output)
 
     #TODO: use package_manager.py to install packages on any type of image
     def install_packages(self, packagelist):
-- 
1.8.4.5


