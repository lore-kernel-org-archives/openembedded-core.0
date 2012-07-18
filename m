Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5O-0004XN-LU
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:19 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736804"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:42:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:38 -0700
Message-Id: <b2ee5c5e34cdc3d65ca7b5da3486360a74d6c500.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/18] terminal.py: Fix Xfce on ubuntu/debian; some cleanup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 07:54:20 -0000

From: Jeffrey C Honig <jeffrey.honig@windriver.com>

    * Xfce class was setting and passing wrong variable for ubuntu/debian.
    * Xfce class was using -e instead of -x for passing command.  The former creates
      a shell escape nightmare
    * Clean up local and instance/class variables with same name but different usage.
    * Remove side-effect and directly return formatted command for clarity.

Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/lib/oe/terminal.py |   37 ++++++++++++++++++-------------------
 1 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 43639d5..28abf14 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -28,11 +28,10 @@ class Registry(oe.classutils.ClassRegistry):
 class Terminal(Popen):
     __metaclass__ = Registry
 
-    def __init__(self, command, title=None, env=None):
-        self.format_command(command, title)
-
+    def __init__(self, sh_cmd, title=None, env=None):
+        fmt_sh_cmd = self.format_command(sh_cmd, title)
         try:
-            Popen.__init__(self, self.command, env=env)
+            Popen.__init__(self, fmt_sh_cmd, env=env)
         except OSError as exc:
             import errno
             if exc.errno == errno.ENOENT:
@@ -40,16 +39,16 @@ class Terminal(Popen):
             else:
                 raise
 
-    def format_command(self, command, title):
-        fmt = {'title': title or 'Terminal', 'command': command}
+    def format_command(self, sh_cmd, title):
+        fmt = {'title': title or 'Terminal', 'command': sh_cmd}
         if isinstance(self.command, basestring):
-            self.command = shlex.split(self.command.format(**fmt))
+            return shlex.split(self.command.format(**fmt))
         else:
-            self.command = [element.format(**fmt) for element in self.command]
+            return [element.format(**fmt) for element in self.command]
 
 class XTerminal(Terminal):
-    def __init__(self, command, title=None, env=None):
-        Terminal.__init__(self, command, title, env)
+    def __init__(self, sh_cmd, title=None, env=None):
+        Terminal.__init__(self, sh_cmd, title, env)
         if not os.environ.get('DISPLAY'):
             raise UnsupportedTerminal(self.name)
 
@@ -75,14 +74,14 @@ class Konsole(XTerminal):
     command = 'konsole -T "{title}" -e {command}'
     priority = 2
 
-    def __init__(self, command, title=None, env=None):
+    def __init__(self, sh_cmd, title=None, env=None):
         # Check version
         vernum = check_konsole_version("konsole")
         if vernum:
             if vernum.split('.')[0] == "2":
                 logger.debug(1, 'Konsole from KDE 4.x will not work as devshell, skipping')
                 raise UnsupportedTerminal(self.name)
-        XTerminal.__init__(self, command, title, env)
+        XTerminal.__init__(self, sh_cmd, title, env)
 
 class XTerm(XTerminal):
     command = 'xterm -T "{title}" -e {command}'
@@ -95,8 +94,8 @@ class Rxvt(XTerminal):
 class Screen(Terminal):
     command = 'screen -D -m -t "{title}" -S devshell {command}'
 
-    def __init__(self, command, title=None, env=None):
-        Terminal.__init__(self, command, title, env)
+    def __init__(self, sh_cmd, title=None, env=None):
+        Terminal.__init__(self, sh_cmd, title, env)
         logger.warn('Screen started. Please connect in another terminal with '
                     '"screen -r devshell"')
 
@@ -104,18 +103,18 @@ class Screen(Terminal):
 def prioritized():
     return Registry.prioritized()
 
-def spawn_preferred(command, title=None, env=None):
+def spawn_preferred(sh_cmd, title=None, env=None):
     """Spawn the first supported terminal, by priority"""
     for terminal in prioritized():
         try:
-            spawn(terminal.name, command, title, env)
+            spawn(terminal.name, sh_cmd, title, env)
             break
         except UnsupportedTerminal:
             continue
     else:
         raise NoSupportedTerminals()
 
-def spawn(name, command, title=None, env=None):
+def spawn(name, sh_cmd, title=None, env=None):
     """Spawn the specified terminal, by name"""
     logger.debug(1, 'Attempting to spawn terminal "%s"', name)
     try:
@@ -123,10 +122,10 @@ def spawn(name, command, title=None, env=None):
     except KeyError:
         raise UnsupportedTerminal(name)
 
-    pipe = terminal(command, title, env)
+    pipe = terminal(sh_cmd, title, env)
     output = pipe.communicate()[0]
     if pipe.returncode != 0:
-        raise ExecutionError(pipe.command, pipe.returncode, output)
+        raise ExecutionError(sh_cmd, pipe.returncode, output)
 
 def check_konsole_version(konsole):
     import subprocess as sub
-- 
1.7.7.6



