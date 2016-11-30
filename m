Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EF1296072C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 20:43:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 30 Nov 2016 12:43:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,574,1473145200"; d="scan'208";a="1075773452"
Received: from jairdeje-mobl1.zpn.intel.com ([10.219.128.79])
	by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2016 12:43:17 -0800
From: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 14:43:02 -0600
Message-Id: <1480538582-24953-1-git-send-email-jair.de.jesus.gonzalez.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/1] parselogs: Whitelist GPT warnings as the device is fully functional
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
X-List-Received-Date: Wed, 30 Nov 2016 20:43:17 -0000

The warning occurs when the GPT image is not the same size than the
media into which it's being flashed, causing the backup GPT table
not being at the end of the disk. However, this is expected as the
image is created before having the information about the destination
media. The error is harmless, so it will be whitelisted.

Fixes [YOCTO 10481].

Signed-off-by: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 58f62da..8d396f8 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -43,6 +43,7 @@ common_errors = [
     "controller can't do DEVSLP, turning off",
     "stmmac_dvr_probe: warning: cannot get CSR clock",
     "error: couldn\'t mount because of unsupported optional features",
+    "GPT: Use GNU Parted to correct GPT errors",
     ]
 
 video_related = [
@@ -69,7 +70,7 @@ qemux86_common = [
     'tsc: HPET/PMTIMER calibration failed',
 ] + common_errors
 
-ignore_errors = { 
+ignore_errors = {
     'default' : common_errors,
     'qemux86' : [
         'Failed to access perfctr msr (MSR',
@@ -201,7 +202,7 @@ class ParseLogsTest(oeRuntimeTest):
         hwi += "*******************************\n"
         return hwi
 
-    #go through the log locations provided and if it's a folder create a list with all the .log files in it, if it's a file just add 
+    #go through the log locations provided and if it's a folder create a list with all the .log files in it, if it's a file just add
     #it to that list
     def getLogList(self, log_locations):
         logs = []
-- 
2.7.4


