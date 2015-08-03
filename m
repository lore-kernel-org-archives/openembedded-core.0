Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0862F7597C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 13:52:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 03 Aug 2015 06:52:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,601,1432623600"; d="scan'208";a="618268460"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 03 Aug 2015 06:52:10 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 8398A6A4005;
	Mon,  3 Aug 2015 06:51:23 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Aug 2015 16:51:50 +0300
Message-Id: <4f3e4e8834f98c9ed7b7f111250bf5dc15ba5b3f.1438609723.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <de1bbbaa8743b765d169fb233b6485e86f5904c0.1438609723.git.ed.bartosh@linux.intel.com>
References: <de1bbbaa8743b765d169fb233b6485e86f5904c0.1438609723.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1438609723.git.ed.bartosh@linux.intel.com>
References: <cover.1438609723.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 5/6] wic: code cleanup: pylint misc.py
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
X-List-Received-Date: Mon, 03 Aug 2015 13:52:10 -0000

Fixed pylint warnings.
Increased pylint score from 8.02 to 9.40.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 0fa8a53..d399f2a 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -24,6 +24,7 @@
 # AUTHORS
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
+"""Miscellaneous functions."""
 
 from collections import defaultdict
 
@@ -56,14 +57,14 @@ def __exec_cmd(cmd_and_args, as_shell=False, catch=3):
     msger.debug(args)
 
     if as_shell:
-        rc, out = runner.runtool(cmd_and_args, catch)
+        ret, out = runner.runtool(cmd_and_args, catch)
     else:
-        rc, out = runner.runtool(args, catch)
+        ret, out = runner.runtool(args, catch)
     out = out.strip()
     msger.debug("__exec_cmd: output for %s (rc = %d): %s" % \
-                (cmd_and_args, rc, out))
+                (cmd_and_args, ret, out))
 
-    return (rc, out)
+    return (ret, out)
 
 
 def exec_cmd(cmd_and_args, as_shell=False, catch=3):
@@ -72,10 +73,11 @@ def exec_cmd(cmd_and_args, as_shell=False, catch=3):
 
     Exits if rc non-zero
     """
-    rc, out = __exec_cmd(cmd_and_args, as_shell, catch)
+    ret, out = __exec_cmd(cmd_and_args, as_shell, catch)
 
-    if rc != 0:
-        msger.error("exec_cmd: %s returned '%s' instead of 0" % (cmd_and_args, rc))
+    if ret != 0:
+        msger.error("exec_cmd: %s returned '%s' instead of 0" % \
+                    (cmd_and_args, ret))
 
     return out
 
@@ -97,9 +99,9 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
     args = cmd_and_args.split()
     msger.debug(args)
 
-    rc, out = __exec_cmd(native_cmd_and_args, True, catch)
+    ret, out = __exec_cmd(native_cmd_and_args, True, catch)
 
-    if rc == 127: # shell command-not-found
+    if ret == 127: # shell command-not-found
         prog = args[0]
         msg = "A native program %s required to build the image "\
               "was not found (see details above).\n\n" % prog
@@ -114,11 +116,11 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
     if out:
         msger.debug('"%s" output: %s' % (args[0], out))
 
-    if rc != 0:
+    if ret != 0:
         msger.error("exec_cmd: '%s' returned '%s' instead of 0" % \
-                    (cmd_and_args, rc))
+                    (cmd_and_args, ret))
 
-    return (rc, out)
+    return ret, out
 
 BOOTDD_EXTRA_SPACE = 16384
 
@@ -137,10 +139,10 @@ def get_bitbake_var(var, image=None):
 
         log_level = msger.get_loglevel()
         msger.set_loglevel('normal')
-        rc, lines = __exec_cmd(cmd)
+        ret, lines = __exec_cmd(cmd)
         msger.set_loglevel(log_level)
 
-        if rc:
+        if ret:
             print "Couldn't get '%s' output." % cmd
             print "Bitbake failed with error:\n%s\n" % lines
             return
@@ -176,14 +178,14 @@ def parse_sourceparams(sourceparams):
 
     params = sourceparams.split(',')
     if params:
-        for p in params:
-            if not p:
+        for par in params:
+            if not par:
                 continue
-            if not '=' in p:
-                key = p
+            if not '=' in par:
+                key = par
                 val = None
             else:
-                key, val = p.split('=')
+                key, val = par.split('=')
             params_dict[key] = val
 
     return params_dict
-- 
2.1.4


