Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8EBD96FFD8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 19:21:53 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 12:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,339,1498546800"; d="scan'208";a="137397475"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga006.fm.intel.com with ESMTP; 07 Aug 2017 12:21:54 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 12:21:51 -0700
Message-Id: <20170807192151.134063-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20170807192151.134063-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170807192151.134063-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] terminal: wait for terminal task to finish before procedding
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
X-List-Received-Date: Mon, 07 Aug 2017 19:21:53 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

This commit generalizes the work done in [1] and [2], both fixing
issues on several areas (the former with -c patch and gnome-terminal and
the latter with -c menuconfig and several terminals, including
gnome-terminal and tmux). The main idea is to get the PID
from the new spawned terminal and loop there until finished.

[1] 76e8ab47c9: terminal: Fix gnome-terminal to work with recent versions
[2] 7d02ea283b: cml1.bbclass: wait until menuconfig terminal finishes

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oe/terminal.py | 58 +++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 0426e15834..3c6220dfce 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -62,28 +62,7 @@ class Gnome(XTerminal):
         # Once fixed on the gnome-terminal project, this should be removed.
         if os.getenv('LC_ALL'): os.putenv('LC_ALL','')
 
-        # We need to know when the command completes but gnome-terminal gives us no way 
-        # to do this. We therefore write the pid to a file using a "phonehome" wrapper
-        # script, then monitor the pid until it exits. Thanks gnome!
-        import tempfile
-        pidfile = tempfile.NamedTemporaryFile(delete = False).name
-        try:
-            sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
-            XTerminal.__init__(self, sh_cmd, title, env, d)
-            while os.stat(pidfile).st_size <= 0:
-                continue
-            with open(pidfile, "r") as f:
-                pid = int(f.readline())
-        finally:
-            os.unlink(pidfile)
-
-        import time
-        while True:
-            try:
-                os.kill(pid, 0)
-                time.sleep(0.1)
-            except OSError:
-               return
+        XTerminal.__init__(self, sh_cmd, title, env, d)
 
 class Mate(XTerminal):
     command = 'mate-terminal -t "{title}" -x {command}'
@@ -237,12 +216,35 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
     except KeyError:
         raise UnsupportedTerminal(name)
 
-    pipe = terminal(sh_cmd, title, env, d)
-    output = pipe.communicate()[0]
-    if output:
-        output = output.decode("utf-8")
-    if pipe.returncode != 0:
-        raise ExecutionError(sh_cmd, pipe.returncode, output)
+    # We need to know when the command completes but some terminals (at least
+    # gnome and tmux) gives us no way to do this. We therefore write the pid
+    # to a file using a "phonehome" wrapper script, then monitor the pid
+    # until it exits.
+    import tempfile
+    pidfile = tempfile.NamedTemporaryFile(delete = False).name
+    try:
+        sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
+        pipe = terminal(sh_cmd, title, env, d)
+        output = pipe.communicate()[0]
+        if output:
+            output = output.decode("utf-8")
+        if pipe.returncode != 0:
+            raise ExecutionError(sh_cmd, pipe.returncode, output)
+
+        while os.stat(pidfile).st_size <= 0:
+            continue
+        with open(pidfile, "r") as f:
+            pid = int(f.readline())
+    finally:
+        os.unlink(pidfile)
+
+    import time
+    while True:
+        try:
+            os.kill(pid, 0)
+            time.sleep(0.1)
+        except OSError:
+           return
 
 def check_tmux_pane_size(tmux):
     import subprocess as sub
-- 
2.12.3


