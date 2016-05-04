Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B63837320F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 04 May 2016 08:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="972537035"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2016 08:27:36 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 47F9F6A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:15:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:23 +0300
Message-Id: <f531aa46f3a2651159517a0e896c4cfedda0435c.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 10/14] wic: use find_executable in favor of bb.utils.which
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
X-List-Received-Date: Wed, 04 May 2016 15:27:42 -0000

As bitbake is not ported to Python 3 yet it's better to
avoid using its APIs as much as possible to be able to
test wic under Python 3 at least partially.

Used distutils.spawn.find_executable API in favor of
bb.utils.which to get path of the command to run.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 11209be..0854dfb 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -28,6 +28,7 @@
 
 import os
 from collections import defaultdict
+from distutils import spawn
 
 from wic import msger
 from wic.utils import runner
@@ -83,13 +84,6 @@ def exec_cmd(cmd_and_args, as_shell=False, catch=3):
 
     return out
 
-def cmd_in_path(cmd, path):
-    import scriptpath
-
-    scriptpath.add_bitbake_lib_path()
-
-    return bb.utils.which(path, cmd) != "" or False
-
 def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
     """
     Execute native command, catching stderr, stdout
@@ -112,7 +106,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
     msger.debug("exec_native_cmd: %s" % cmd_and_args)
 
     # If the command isn't in the native sysroot say we failed.
-    if cmd_in_path(args[0], native_paths):
+    if spawn.find_executable(args[0], native_paths):
         ret, out = _exec_cmd(native_cmd_and_args, True, catch)
     else:
         ret = 127
-- 
2.1.4


