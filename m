Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFC671A50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 18:08:46 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 10 Jan 2017 10:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,344,1477983600"; d="scan'208";a="51448449"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 10 Jan 2017 10:08:47 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id E3DDC6A4006;
	Tue, 10 Jan 2017 10:07:52 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 19:46:09 +0200
Message-Id: <1484070369-26765-2-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1484070369-26765-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1484070369-26765-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH 2/2] wic: _exec_cmd: produce error if exit code is not 0
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
X-List-Received-Date: Tue, 10 Jan 2017 18:08:47 -0000

Current code doesn't always show error output of the
external command and even ignores non-zero exit code.

Moved checking of exit code value to the lowest level
possible: to _exec_cmd. This should make wic to always
check exit code of the external command and issue
an error if it's not 0.

[YOCTO #10816]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index fe188c9..fd71935 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -65,6 +65,10 @@ def _exec_cmd(cmd_and_args, as_shell=False, catch=3):
     else:
         ret, out = runner.runtool(args, catch)
     out = out.strip()
+    if ret != 0:
+        msger.error("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" % \
+                    (cmd_and_args, ret, out))
+
     msger.debug("_exec_cmd: output for %s (rc = %d): %s" % \
                 (cmd_and_args, ret, out))
 
@@ -79,10 +83,6 @@ def exec_cmd(cmd_and_args, as_shell=False, catch=3):
     """
     ret, out = _exec_cmd(cmd_and_args, as_shell, catch)
 
-    if ret != 0:
-        msger.error("exec_cmd: %s returned '%s' instead of 0" % \
-                    (cmd_and_args, ret))
-
     return out
 
 def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
@@ -126,12 +126,6 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
             msg += "Wic failed to find a recipe to build native %s. Please "\
                    "file a bug against wic.\n" % prog
         msger.error(msg)
-    if out:
-        msger.debug('"%s" output: %s' % (args[0], out))
-
-    if ret != 0:
-        msger.error("exec_cmd: '%s' returned '%s' instead of 0" % \
-                    (cmd_and_args, ret))
 
     return ret, out
 
-- 
2.1.4


