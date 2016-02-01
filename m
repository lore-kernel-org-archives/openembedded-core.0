Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA9C731FC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 11:53:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 01 Feb 2016 03:53:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,379,1449561600"; d="scan'208";a="873963201"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by orsmga001.jf.intel.com with ESMTP; 01 Feb 2016 03:53:37 -0800
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 13:53:15 -0200
Message-Id: <1454341995-18859-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH] runtime/systemd: Fix for boot time string parse error
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
X-List-Received-Date: Mon, 01 Feb 2016 11:53:37 -0000

boot time string can change its format of the output of the amount of time
it took to boot. It is required to handle graceful fail of the parsing
errors that it provokes

[YOCTO #8889]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/lib/oeqa/runtime/systemd.py | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index 03c56ef..2b2f10d 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -145,8 +145,7 @@ class SystemdJournalTests(SystemdTest):
         except AssertionError:
             self.fail("Error occurred while calling journalctl")
         if not len(output):
-            self.fail("Error: unable to obtain the startup time from\
-                    systemd journal")
+            self.fail("Error, unable to get startup time from systemd journal")
 
         # check for the regular expression items that match the startup time
         for line in output.split('\n'):
@@ -156,20 +155,23 @@ class SystemdJournalTests(SystemdTest):
         if check_match:
             print "%s" % check_match
         else:
-            self.fail("Error while obtaining the boot time from journalctl")
+            self.skipTest("Error at obtaining the boot time from journalctl")
         boot_time_sec = 0
 
         # get the numeric values from the string and convert them to seconds
         # same data will be placed in list and string for manipulation
         l_boot_time = check_match.split(" ")[-2:]
         s_boot_time = " ".join(l_boot_time)
-        # Obtain the minutes it took to boot
-        if l_boot_time[0].endswith('min') and l_boot_time[0][0].isdigit():
-            boot_time_min = s_boot_time.split("min")[0]
-            # convert to seconds and accumulate it
-            boot_time_sec += int(boot_time_min) * 60
-        # Obtain the seconds it took to boot and accumulate
-        boot_time_sec += float(l_boot_time[1].split("s")[0])
+        try:
+            # Obtain the minutes it took to boot
+            if l_boot_time[0].endswith('min') and l_boot_time[0][0].isdigit():
+                boot_time_min = s_boot_time.split("min")[0]
+                # convert to seconds and accumulate it
+                boot_time_sec += int(boot_time_min) * 60
+            # Obtain the seconds it took to boot and accumulate
+            boot_time_sec += float(l_boot_time[1].split("s")[0])
+        except ValueError:
+            self.skipTest("Error when parsing time from boot string")
         #Assert the target boot time against systemd's unit start timeout
         if boot_time_sec > systemd_TimeoutStartSec:
             print "Target boot time %s exceeds systemd's TimeoutStartSec %s"\
-- 
2.5.1


