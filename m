Return-Path: <cristina-danielax.agurida@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E65F77717D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 12:15:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 04 Feb 2016 04:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,395,1449561600"; d="scan'208";a="42315440"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2016 04:12:50 -0800
Received: from localhost.localdomain (unknown [10.237.112.210])
	by linux.intel.com (Postfix) with ESMTP id 6EE646A4002;
	Thu,  4 Feb 2016 05:00:43 -0800 (PST)
From: Cristina Agurida <cristina-danielax.agurida@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 14:13:46 +0200
Message-Id: <1454588030-26081-1-git-send-email-cristina-danielax.agurida@intel.com>
X-Mailer: git-send-email 2.1.4
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
X-List-Received-Date: Thu, 04 Feb 2016 12:15:07 -0000

Moved an error to common, and whitelisted the BAR errors
and ati module. Also the uvesafb related errors will be
ignored in LSB images which do not have graphic interface.

Fix for [YOCTO #8387]
Fix for [YOCTO #8590]
Fix for [YOCTO #6820]
Fix for [YOCTO #7897]

Signed-off-by: Lucian Musat <george.l.musat at intel.com>
Signed-off-by: Cristina Agurida <cristina-danielax.agurida@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 5a2d50f..44834ce 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -38,8 +38,17 @@ common_errors = [
     'Online check failed for',
     'netlink init failed',
     'Fast TSC calibration',
+    "BAR 0-9",
+    "Failed to load module \"ati\"",
+    "controller can't do DEVSLP, turning off",
+    "stmmac_dvr_probe: warning: cannot get CSR clock",
+    "error: couldn\'t mount because of unsupported optional features",
     ]
 
+video_related = [
+    "uvesafb",
+]
+
 x86_common = [
     '[drm:psb_do_init] *ERROR* Debug is',
     'wrong ELF class',
@@ -99,11 +108,7 @@ ignore_errors = {
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
@@ -126,6 +131,10 @@ class ParseLogsTest(oeRuntimeTest):
         self.ignore_errors = ignore_errors
         self.log_locations = log_locations
         self.msg = ""
+        (is_lsb, location) = oeRuntimeTest.tc.target.run("which LSB_Test.sh")
+        if is_lsb == 0:
+            for machine in self.ignore_errors:
+                self.ignore_errors[machine] = self.ignore_errors[machine] + video_related
 
     def getMachine(self):
         return oeRuntimeTest.tc.d.getVar("MACHINE", True)
@@ -200,6 +209,7 @@ class ParseLogsTest(oeRuntimeTest):
             ignore_error = ignore_error.replace("[", "\[")
             ignore_error = ignore_error.replace("]", "\]")
             ignore_error = ignore_error.replace("*", "\*")
+            ignore_error = ignore_error.replace("0-9", "[0-9]")
             grepcmd += ignore_error+"|"
         grepcmd = grepcmd[:-1]
         grepcmd += "\'"
-- 
2.1.4


