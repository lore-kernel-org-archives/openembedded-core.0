Return-Path: <george.l.musat@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6C35760670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 15:35:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jun 2015 08:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,588,1427785200"; d="scan'208";a="708642689"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 10 Jun 2015 08:35:19 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id AE6686A4005;
	Wed, 10 Jun 2015 08:34:44 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 18:32:50 +0300
Message-Id: <1433950370-23762-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/parselogs: The logs are now copied and parsed locally.
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
X-List-Received-Date: Wed, 10 Jun 2015 15:35:26 -0000

This is to fix a problem with reaching the limit of the whitelist size.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index e9ccd0c..e641366 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -1,5 +1,6 @@
 import os
 import unittest
+import subprocess
 from oeqa.oetest import oeRuntimeTest
 from oeqa.utils.decorators import *
 
@@ -132,6 +133,20 @@ class ParseLogsTest(oeRuntimeTest):
                             logs.append(os.path.join(location,str(logfile)))
         return logs
 
+    #copy the log files to be parsed locally
+    def transfer_logs(self, log_list):
+        target_logs = 'target_logs'
+        if not os.path.exists(target_logs):
+            os.makedirs(target_logs)
+        for f in log_list:
+            self.target.copy_from(f, target_logs)
+
+    #get the local list of logs
+    def get_local_log_list(self, log_locations):
+        self.transfer_logs(self.getLogList(log_locations))
+        logs = [ os.path.join('target_logs',f) for f in os.listdir('target_logs') if os.path.isfile(os.path.join('target_logs',f)) ]
+        return logs
+
     #build the grep command to be used with filters and exclusions
     def build_grepcmd(self, errors, ignore_errors, log):
         grepcmd = "grep "
@@ -163,21 +178,22 @@ class ParseLogsTest(oeRuntimeTest):
         results = {}
         rez = []
         for log in logs:
+            result = None
             thegrep = self.build_grepcmd(errors, ignore_errors, log)
             try:
-                (status, result) = self.target.run(thegrep)
+                result = subprocess.check_output(thegrep, shell=True)
             except:
                 pass
-            if result:
-                results[log] = {}
+            if (result is not None):
+                results[log.replace('target_logs/','')] = {}
                 rez = result.splitlines()
                 for xrez in rez:
                     command = "grep \"\\"+str(xrez)+"\" -B "+str(lines_before)+" -A "+str(lines_after)+" "+str(log)
                     try:
-                        (status, yrez) = self.target.run(command)
+                        yrez = subprocess.check_output(command, shell=True)
                     except:
                         pass
-                    results[log][xrez]=yrez
+                    results[log.replace('target_logs/','')][xrez]=yrez
         return results
 
     #get the output of dmesg and write it in a file. This file is added to log_locations.
@@ -189,7 +205,7 @@ class ParseLogsTest(oeRuntimeTest):
     @skipUnlessPassed('test_ssh')
     def test_parselogs(self):
         self.write_dmesg()
-        log_list = self.getLogList(self.log_locations)
+        log_list = self.get_local_log_list(self.log_locations)
         result = self.parse_logs(self.errors, self.ignore_errors, log_list)
         print self.getHardwareInfo()
         errcount = 0
@@ -203,4 +219,4 @@ class ParseLogsTest(oeRuntimeTest):
                 self.msg +=  result[str(log)][str(error)]+"\n"
                 self.msg +=  "***********************\n"
         self.msg += "%s errors found in logs." % errcount
-        self.assertEqual(errcount, 0, msg=self.msg)
+        self.assertEqual(errcount, 0, msg=self.msg)
\ No newline at end of file
-- 
2.1.4


