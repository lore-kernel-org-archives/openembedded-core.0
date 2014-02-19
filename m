Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 83D876C9B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 20:53:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2014 12:49:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,507,1389772800"; d="scan'208";a="458364156"
Received: from unknown (HELO localhost) ([10.255.12.82])
	by orsmga001.jf.intel.com with ESMTP; 19 Feb 2014 12:53:39 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 14:53:37 -0600
Message-Id: <a7c008e73062a7c69f228d651ca458f21b96f073.1392842779.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <722243f17b60f55830343be89dc2a80d0767d41d.1392842779.git.tom.zanussi@linux.intel.com>
References: <722243f17b60f55830343be89dc2a80d0767d41d.1392842779.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1392842779.git.tom.zanussi@linux.intel.com>
References: <cover.1392842779.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/2] wic: Make exec_native_command() fail if a command isn't found
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
X-List-Received-Date: Wed, 19 Feb 2014 20:53:38 -0000

Because exec_cmd() return values can in certain cases be non-zero yet
non-fatal, we don't want to automatically make them fatal (though
there should at least be a warning in such cases, which this patch
also does); non-zero return values are definitely fatal however if
they mean that a native command wasn't found, so have
exec_native_cmd() check the return value of exec_cmd() for that case,
and bail out if so.

[YOCTO #5835]

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/utils/oe/misc.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/mic/utils/oe/misc.py b/scripts/lib/mic/utils/oe/misc.py
index d65b77a..7ad3aa9 100644
--- a/scripts/lib/mic/utils/oe/misc.py
+++ b/scripts/lib/mic/utils/oe/misc.py
@@ -51,7 +51,7 @@ def exec_cmd(cmd_and_args, as_shell = False, catch = 3):
         # parted always fails to reload part table with loop devices. This
         # prevents us from distinguishing real errors based on return
         # code.
-        msger.debug("WARNING: %s returned '%s' instead of 0" % (args[0], rc))
+        msger.warning("WARNING: %s returned '%s' instead of 0" % (cmd_and_args, rc))
 
     return (rc, out)
 
@@ -82,7 +82,14 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch = 3):
     args = cmd_and_args.split()
     msger.debug(args)
 
-    return exec_cmd(native_cmd_and_args, True, catch)
+    rc, out = exec_cmd(native_cmd_and_args, True, catch)
+
+    if rc == 127: # shell command-not-found
+        msger.error("A native (host) program required to build the image "
+                    "was not found (see details above). Please make sure "
+                    "it's installed and try again.")
+
+    return (rc, out)
 
 
 def exec_native_cmd_quiet(cmd_and_args, native_sysroot):
-- 
1.8.3.1


