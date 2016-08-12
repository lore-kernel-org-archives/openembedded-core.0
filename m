Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8823E7725C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:11:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 12 Aug 2016 02:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,509,1464678000"; d="scan'208";a="1024239512"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2016 02:11:39 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 12:11:26 +0300
Message-Id: <1470993086-23718-10-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 9/9] oeqa.buildperf: be more verbose about failed commands
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
X-List-Received-Date: Fri, 12 Aug 2016 09:11:48 -0000

Log failures of commands whose output is stored.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 7ea3183..af169e1 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -23,7 +23,7 @@ import unittest
 from datetime import datetime, timedelta
 from functools import partial
 
-from oeqa.utils.commands import runCmd, get_bb_vars
+from oeqa.utils.commands import CommandError, runCmd, get_bb_vars
 from oeqa.utils.git import GitError, GitRepo
 
 # Get logger for this module
@@ -216,9 +216,15 @@ class BuildPerfTestCase(unittest.TestCase):
 
     def log_cmd_output(self, cmd):
         """Run a command and log it's output"""
+        cmd_str = cmd if isinstance(cmd, str) else ' '.join(cmd)
+        log.info("Logging command: %s", cmd_str)
         cmd_log = os.path.join(self.out_dir, 'commands.log')
-        with open(cmd_log, 'a') as fobj:
-            runCmd2(cmd, stdout=fobj)
+        try:
+            with open(cmd_log, 'a') as fobj:
+                runCmd2(cmd, stdout=fobj)
+        except CommandError as err:
+            log.error("Command failed: %s", err.retcode)
+            raise
 
     def measure_cmd_resources(self, cmd, name, legend):
         """Measure system resource usage of a command"""
-- 
2.6.6


