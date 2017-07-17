Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7007D77DB1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 21:45:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 17 Jul 2017 14:45:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1152467493"
Received: from unknown (HELO alimonb-mobl1.zpn.intel.com) ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2017 14:45:11 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 16:45:13 -0500
Message-Id: <c0ffedcbabf1bae581dcdd4f318742cba63a5f8d.1500327589.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv3 05/30] bb/tinfoil: run_command handle busy status in bitbake server
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
X-List-Received-Date: Mon, 17 Jul 2017 21:45:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When tinfoil request a command to bitbake is handled in async
manner [1], sometimes is this ends on return a Busy status.

This is a workaround a needs to be fixed in proper manner
inside bitbake code.

For example when running clientComplete and buildFile is on progress,

  ERROR: Function failed: base_do_unpack
  Traceback (most recent call last):
    File "/home/alimon/repos/poky/scripts/lib/devtool/standard.py", line
  797, in modify
      initial_rev = _extract_source(srctree, args.keep_temp, args.branch,
  False, rd, tinfoil)
    File "/home/alimon/repos/poky/scripts/lib/devtool/standard.py", line
  562, in _extract_source
      runtask(fn, 'unpack')
    File "/home/alimon/repos/poky/scripts/lib/devtool/standard.py", line
  552, in runtask
      raise DevtoolError('Task do_%s failed' % task)
  devtool.DevtoolError: Task do_unpack failed

  During handling of the above exception, another exception occurred:

  Traceback (most recent call last):
    File "/home/alimon/repos/poky/scripts/devtool", line 351, in <module>
      ret = main()
    File "/home/alimon/repos/poky/scripts/devtool", line 338, in main
      ret = args.func(args, config, basepath, workspace)
    File "/home/alimon/repos/poky/scripts/lib/devtool/standard.py", line
  864, in modify
      tinfoil.shutdown()
    File "/home/alimon/repos/poky/bitbake/lib/bb/tinfoil.py", line 427, in
  shutdown
      self.run_command('clientComplete')
    File "/home/alimon/repos/poky/bitbake/lib/bb/tinfoil.py", line 320, in
  run_command
      raise TinfoilCommandFailed(result[1])
  bb.tinfoil.TinfoilCommandFailed: Busy (buildFile in progress)

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 bitbake/lib/bb/tinfoil.py | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/bitbake/lib/bb/tinfoil.py b/bitbake/lib/bb/tinfoil.py
index fb0da622433..7f7809ea41c 100644
--- a/bitbake/lib/bb/tinfoil.py
+++ b/bitbake/lib/bb/tinfoil.py
@@ -21,6 +21,7 @@ import os
 import sys
 import atexit
 import re
+import time
 from collections import OrderedDict, defaultdict
 
 import bb.cache
@@ -298,7 +299,7 @@ class Tinfoil:
         config_params = TinfoilConfigParameters(config_only=False)
         self.run_actions(config_params)
 
-    def run_command(self, command, *params):
+    def run_command(self, command, *params, ntries=0):
         """
         Run a command on the server (as implemented in bb.command).
         Note that there are two types of command - synchronous and
@@ -315,9 +316,22 @@ class Tinfoil:
         commandline = [command]
         if params:
             commandline.extend(params)
-        result = self.server_connection.connection.runCommand(commandline)
-        if result[1]:
-            raise TinfoilCommandFailed(result[1])
+
+        # XXX: Tinfoil commands are run by Cooker in async mode so gives
+        # some time to get done.
+        result = None
+        while True:
+            result = self.server_connection.connection.runCommand(commandline)
+            if not result[1]:
+                break
+
+            if ntries == 0:
+                raise TinfoilCommandFailed(result[1])
+            elif 'Busy' in result[1]:
+                ntries = ntries - 1
+                time.sleep(1)
+                continue
+
         return result[0]
 
     def set_event_mask(self, eventlist):
@@ -424,7 +438,7 @@ class Tinfoil:
 
     def shutdown(self):
         if self.server_connection:
-            self.run_command('clientComplete')
+            self.run_command('clientComplete', ntries=1)
             _server_connections.remove(self.server_connection)
             bb.event.ui_queue = []
             self.server_connection.terminate()
-- 
2.11.0


