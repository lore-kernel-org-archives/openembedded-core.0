Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0E66F73D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 03:30:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Oct 2015 20:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,185,1444719600"; d="scan'208";a="670011203"
Received: from bitbang.jf.intel.com ([10.7.199.99])
	by orsmga003.jf.intel.com with ESMTP; 22 Oct 2015 20:30:42 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 20:30:38 -0700
Message-Id: <76493b8df3e5aab311096cb4ae3729626e46699b.1445570852.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <4b16c77c29407f38c4c17f5bddbaec2cd5339c82.1445570852.git.randy.e.witt@linux.intel.com>
References: <4b16c77c29407f38c4c17f5bddbaec2cd5339c82.1445570852.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1445570852.git.randy.e.witt@linux.intel.com>
References: <cover.1445570852.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 5/5] wic/utils/oe/misc.py: Preserve PATH when running native tools
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
X-List-Received-Date: Fri, 23 Oct 2015 03:30:42 -0000

Previously exec_native_cmd() would remove all items from PATH except for
the native sysroot. This can cause issues for the tools that are created
using create_wrapper().

Now instead of wiping out the PATH, run a sanity check to check if the
command is in the native sysroot.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 7370d93..c6d2e5f 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -82,6 +82,12 @@ def exec_cmd(cmd_and_args, as_shell=False, catch=3):
 
     return out
 
+def cmd_in_path(cmd, path):
+    import scriptpath
+
+    scriptpath.add_bitbake_lib_path()
+
+    return bb.utils.which(path, cmd) != "" or False
 
 def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
     """
@@ -92,15 +98,21 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
     Always need to execute native commands as_shell
     """
     native_paths = \
-        "export PATH=%s/sbin:%s/usr/sbin:%s/usr/bin" % \
+        "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
         (native_sysroot, native_sysroot, native_sysroot)
-    native_cmd_and_args = "%s;%s" % (native_paths, cmd_and_args)
+    native_cmd_and_args = "export PATH=%s:$PATH;%s" % \
+                           (native_paths, cmd_and_args)
     msger.debug("exec_native_cmd: %s" % cmd_and_args)
 
-    args = cmd_and_args.split()
+    # The reason -1 is used is because there may be "export" commands.
+    args = cmd_and_args.split(';')[-1].split()
     msger.debug(args)
 
-    ret, out = _exec_cmd(native_cmd_and_args, True, catch)
+    # If the command isn't in the native sysroot say we failed.
+    if cmd_in_path(args[0], native_paths):
+        ret, out = _exec_cmd(native_cmd_and_args, True, catch)
+    else:
+        ret = 127
 
     if ret == 127: # shell command-not-found
         prog = args[0]
-- 
2.4.3


