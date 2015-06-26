Return-Path: <george.l.musat@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 84278605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 10:38:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 26 Jun 2015 03:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,684,1427785200"; d="scan'208";a="735120753"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2015 03:38:19 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 76BAC6A4005;
	Fri, 26 Jun 2015 03:37:40 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jun 2015 13:36:40 +0300
Message-Id: <1435315000-2864-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/parselogs: Fixed a problem in parselogs
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
X-List-Received-Date: Fri, 26 Jun 2015 10:38:20 -0000

When the test passed it returned an error because
grep did not return any error and the variable that
held the results was being referenced but not
assigned any value.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index a9ab9a3..7095a36 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -198,6 +198,7 @@ class ParseLogsTest(oeRuntimeTest):
     def parse_logs(self, errors, ignore_errors, logs, lines_before = 10, lines_after = 10):
         results = {}
         rez = []
+        grep_output = ''
         for log in logs:
             result = None
             thegrep = self.build_grepcmd(errors, ignore_errors, log)
@@ -211,10 +212,10 @@ class ParseLogsTest(oeRuntimeTest):
                 for xrez in rez:
                     command = "grep \"\\"+str(xrez)+"\" -B "+str(lines_before)+" -A "+str(lines_after)+" "+str(log)
                     try:
-                        yrez = subprocess.check_output(command, shell=True)
+                        grep_output = subprocess.check_output(command, shell=True)
                     except:
                         pass
-                    results[log.replace('target_logs/','')][xrez]=yrez
+                    results[log.replace('target_logs/','')][xrez]=grep_output
         return results
 
     #get the output of dmesg and write it in a file. This file is added to log_locations.
-- 
2.1.4


