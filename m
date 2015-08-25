Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F272F76CA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:05:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 25 Aug 2015 02:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,744,1432623600"; d="scan'208";a="790452281"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 25 Aug 2015 02:04:37 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 84F4F6A4087;
	Tue, 25 Aug 2015 02:03:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:04:14 +0300
Message-Id: <86b0d66a99f453895b40225119fdeb7ba98dfd5d.1440492980.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
References: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440492980.git.ed.bartosh@linux.intel.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 03/17] wic: remove undescore from function name
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
X-List-Received-Date: Tue, 25 Aug 2015 09:05:07 -0000

Renamed __exec_cmd -> _exec_cmd as double underscores cause
strange behaviour when function is called in class method.
Python complains that __exec_cmd method(!!!) of the same class
doesn't exist.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index d399f2a..9c8f52d 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -46,13 +46,13 @@ NATIVE_RECIPES = {"mcopy": "mtools",
                   "syslinux": "syslinux"
                  }
 
-def __exec_cmd(cmd_and_args, as_shell=False, catch=3):
+def _exec_cmd(cmd_and_args, as_shell=False, catch=3):
     """
     Execute command, catching stderr, stdout
 
     Need to execute as_shell if the command uses wildcards
     """
-    msger.debug("__exec_cmd: %s" % cmd_and_args)
+    msger.debug("_exec_cmd: %s" % cmd_and_args)
     args = cmd_and_args.split()
     msger.debug(args)
 
@@ -61,7 +61,7 @@ def __exec_cmd(cmd_and_args, as_shell=False, catch=3):
     else:
         ret, out = runner.runtool(args, catch)
     out = out.strip()
-    msger.debug("__exec_cmd: output for %s (rc = %d): %s" % \
+    msger.debug("_exec_cmd: output for %s (rc = %d): %s" % \
                 (cmd_and_args, ret, out))
 
     return (ret, out)
@@ -73,7 +73,7 @@ def exec_cmd(cmd_and_args, as_shell=False, catch=3):
 
     Exits if rc non-zero
     """
-    ret, out = __exec_cmd(cmd_and_args, as_shell, catch)
+    ret, out = _exec_cmd(cmd_and_args, as_shell, catch)
 
     if ret != 0:
         msger.error("exec_cmd: %s returned '%s' instead of 0" % \
@@ -99,7 +99,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
     args = cmd_and_args.split()
     msger.debug(args)
 
-    ret, out = __exec_cmd(native_cmd_and_args, True, catch)
+    ret, out = _exec_cmd(native_cmd_and_args, True, catch)
 
     if ret == 127: # shell command-not-found
         prog = args[0]
@@ -139,7 +139,7 @@ def get_bitbake_var(var, image=None):
 
         log_level = msger.get_loglevel()
         msger.set_loglevel('normal')
-        ret, lines = __exec_cmd(cmd)
+        ret, lines = _exec_cmd(cmd)
         msger.set_loglevel(log_level)
 
         if ret:
-- 
2.1.4


