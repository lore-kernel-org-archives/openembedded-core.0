Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9660375D4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:21:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Oct 2015 05:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,218,1444719600"; d="scan'208";a="838804017"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 30 Oct 2015 05:21:13 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id E33EC6A4083;
	Fri, 30 Oct 2015 05:20:08 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Oct 2015 14:19:20 +0200
Message-Id: <1446207560-7439-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] oeqa/parselogs: Updated whitelist
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
X-List-Received-Date: Fri, 30 Oct 2015 12:21:13 -0000

Moved an error to common, and whitelisted the BAR errors
and ati module. Also the uvesafb related errors will be
ignored in LSB images which do not have graphic interface.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index fc2bc38..114f0bf 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -38,8 +38,15 @@ common_errors = [
     'Online check failed for',
     'netlink init failed',
     'Fast TSC calibration',
+    "BAR 0-9",
+    "Failed to load module \"ati\"",
+    "controller can't do DEVSLP, turning off",
     ]
 
+video_related = [
+    "uvesafb",
+]
+
 x86_common = [
     '[drm:psb_do_init] *ERROR* Debug is',
     'wrong ELF class',
@@ -99,11 +106,7 @@ ignore_errors = {
         '(EE) Failed to load module psbdrv',
         '(EE) open /dev/fb0: No such file or directory',
         '(EE) AIGLX: reverting to software rendering',
-        "controller can't do DEVSLP, turning off",
         ] + x86_common,
-    'intel-corei7-64' : [
-        "controller can't do DEVSLP, turning off",
-        ] + common_errors,
     'crownbay' : x86_common,
     'genericx86' : x86_common,
     'genericx86-64' : x86_common,
@@ -126,6 +129,10 @@ class ParseLogsTest(oeRuntimeTest):
         self.ignore_errors = ignore_errors
         self.log_locations = log_locations
         self.msg = ""
+        (is_lsb, location) = oeRuntimeTest.tc.target.run("which LSB_Test.sh")
+        if is_lsb == 0:
+            for machine in self.ignore_errors:
+                self.ignore_errors[machine] = self.ignore_errors[machine] + video_related
 
     def getMachine(self):
         return oeRuntimeTest.tc.d.getVar("MACHINE", True)
@@ -200,6 +207,7 @@ class ParseLogsTest(oeRuntimeTest):
             ignore_error = ignore_error.replace("[", "\[")
             ignore_error = ignore_error.replace("]", "\]")
             ignore_error = ignore_error.replace("*", "\*")
+            ignore_error = ignore_error.replace("0-9", "[0-9]")
             grepcmd += ignore_error+"|"
         grepcmd = grepcmd[:-1]
         grepcmd += "\'"
-- 
2.5.0


