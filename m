Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C7D637696D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 17:40:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 18 Aug 2015 10:40:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,703,1432623600"; d="scan'208";a="786485623"
Received: from aehernan-mobl1.zpn.intel.com ([10.219.26.251])
	by orsmga002.jf.intel.com with ESMTP; 18 Aug 2015 10:40:41 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2015 12:41:21 -0500
Message-Id: <087e03015a10c13583c30d7e4895a38b17f5710e.1439919346.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1439919346.git.alejandro.hernandez@linux.intel.com>
References: <cover.1439919346.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] terminal.py: Provides devshell support for gnome-terminal >= 3.10
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
X-List-Received-Date: Tue, 18 Aug 2015 17:40:43 -0000

gnome-terminal works in a server-client model, we used to disable this
using --disable-factory switch, but newer gnome terminals (>= v3.10)
lack support for this switch, now were forced to use its default behavior,
which is: when launching a new terminal, return immediately and
reparent the new bash/sh process to the server gnome-terminal process,
instead of returning once the user closes the terminal,
this behavior also breaks the relationship between our running process and the
new spawned one, giving us no way of checking if it is stil running.

This patch finds the PID of the gnome-terminal server, gets its children
processes before and after spawning our new terminal, finds out the PID
of our new spawned terminal, and lastly forces bitbake to wait for it to end
before continuing.

[YOCTO #7254]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/lib/oe/terminal.py | 46 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 52a8913..a4798e9 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -3,6 +3,9 @@ import oe.classutils
 import shlex
 from bb.process import Popen, ExecutionError
 from distutils.version import LooseVersion
+import os
+import time
+from subprocess import check_output
 
 logger = logging.getLogger('BitBake.OE.Terminal')
 
@@ -53,7 +56,7 @@ class XTerminal(Terminal):
             raise UnsupportedTerminal(self.name)
 
 class Gnome(XTerminal):
-    command = 'gnome-terminal -t "{title}" --disable-factory -x {command}'
+    command = 'gnome-terminal -t "{title}" -x {command}'
     priority = 2
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
@@ -63,11 +66,6 @@ class Gnome(XTerminal):
         # Once fixed on the gnome-terminal project, this should be removed.
         if os.getenv('LC_ALL'): os.putenv('LC_ALL','')
 
-        # Check version
-        vernum = check_terminal_version("gnome-terminal")
-        if vernum and LooseVersion(vernum) >= '3.10':
-            logger.debug(1, 'Gnome-Terminal 3.10 or later does not support --disable-factory')
-            self.command = 'gnome-terminal -t "{title}" -x {command}'
         XTerminal.__init__(self, sh_cmd, title, env, d)
 
 class Mate(XTerminal):
@@ -211,8 +209,40 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
     except KeyError:
         raise UnsupportedTerminal(name)
 
-    pipe = terminal(sh_cmd, title, env, d)
-    output = pipe.communicate()[0]
+
+    # We handle gnome-terminal as a special case
+    # we need to check which is our new spawned process
+    # so we can wait for it to end before we can continue
+
+    if('gnome' in name):
+        logger.debug(1, 'Attempting to get our new spawned gnome-terminal process ID')
+        try:
+            gnome_pid = check_output(["ps", "-C", "gnome-terminal", "-o", "pid"]).split()[1]
+        except subprocess.CalledProcessError as ex:
+            bb.error("Couldn't get gnome-terminal process ID")
+        try:
+            g_children_bfr = check_output(["ps", "--ppid", str(gnome_pid), "-o", "pid"]).split("\n")
+        except subprocess.CalledProcessError as ex:
+            bb.error("Couldn't get gnome-terminal children processes")
+
+        pipe = terminal(sh_cmd, title, env, d)
+        output = pipe.communicate()[0]
+
+        try:
+            g_children_aftr = check_output(["ps", "--ppid", str(gnome_pid), "-o", "pid"]).split("\n")
+        except subprocess.CalledProcessError as ex:
+            bb.error("Couldn't get gnome-terminal children processes")
+
+        new_pid = list(set(g_children_aftr)-set(g_children_bfr))
+        if (len(new_pid) != 1):
+            bb.error("Couldn't get new terminal process ID")
+        else:
+            new_pid = new_pid[0].strip()
+            while(os.path.exists("/proc/%s" % new_pid)):
+                time.sleep(1)
+    else:
+        pipe = terminal(sh_cmd, title, env, d)
+        output = pipe.communicate()[0]
     if pipe.returncode != 0:
         raise ExecutionError(sh_cmd, pipe.returncode, output)
 
-- 
1.9.1


