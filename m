Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jeffrey.honig@windriver.com>) id 1SqyCJ-0003rM-Ja
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 05:11:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6H07w9m000276
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 17:07:58 -0700 (PDT)
Received: from jch-schlepp.wrs.com (172.25.32.253) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Jul 2012 17:07:58 -0700
Received: from schlepp.honig.net (schlepp.honig.net [127.0.0.1])	by
	jch-schlepp.wrs.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q6H07vUw000826	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256
	verify=NOT)	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 20:07:57 -0400
Received: (from jch@localhost)	by schlepp.honig.net (8.14.4/8.14.4/Submit) id
	q6H07vW9000825	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 20:07:57 -0400
From: Jeffrey C Honig <jeffrey.honig@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jul 2012 20:07:57 -0400
Message-ID: <1342483677-789-1-git-send-email-jeffrey.honig@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Subject: [PATCH] terminal.py: Fix Xfce on ubuntu/debian; some cleanup
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
X-List-Received-Date: Tue, 17 Jul 2012 03:11:40 -0000
Content-Type: text/plain

  * Xfce class was setting and passing wrong variable for ubuntu/debian.
  * Clean up local and instance/class variables with same name but different usage.
  * Remove side-effect and directly return formatted command for clarity.

Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
---
 meta/lib/oe/terminal.py |   47 ++++++++++++++++++++++-------------------------
 1 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 43639d5..9128664 100644
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
 
@@ -58,31 +57,29 @@ class Gnome(XTerminal):
     priority = 2
 
 class Xfce(XTerminal):
-    command = 'Terminal -T "{title}" -e "{command}"'
+    command = 'Terminal -T "{title}" -x {command}'
     priority = 2
 
-    def __init__(self, command, title=None, env=None):
+    def __init__(self, sh_cmd, title=None, env=None):
         # Upstream binary name is Terminal but Debian/Ubuntu use
         # xfce4-terminal to avoid possible(?) conflicts
         distro = distro_name()
         if distro == 'ubuntu' or distro == 'debian':
-            cmd = 'xfce4-terminal -T "{title}" -e "{command}"'
-        else:
-            cmd = command
-        XTerminal.__init__(self, cmd, title, env)
+            Xfce.command = 'xfce4-terminal -T "{title}" -x {command}'
+        XTerminal.__init__(self, sh_cmd, title, env)
 
 class Konsole(XTerminal):
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
@@ -95,8 +92,8 @@ class Rxvt(XTerminal):
 class Screen(Terminal):
     command = 'screen -D -m -t "{title}" -S devshell {command}'
 
-    def __init__(self, command, title=None, env=None):
-        Terminal.__init__(self, command, title, env)
+    def __init__(self, sh_cmd, title=None, env=None):
+        Terminal.__init__(self, sh_cmd, title, env)
         logger.warn('Screen started. Please connect in another terminal with '
                     '"screen -r devshell"')
 
@@ -104,18 +101,18 @@ class Screen(Terminal):
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
@@ -123,10 +120,10 @@ def spawn(name, command, title=None, env=None):
     except KeyError:
         raise UnsupportedTerminal(name)
 
-    pipe = terminal(command, title, env)
+    pipe = terminal(sh_cmd, title, env)
     output = pipe.communicate()[0]
     if pipe.returncode != 0:
-        raise ExecutionError(pipe.command, pipe.returncode, output)
+        raise ExecutionError(pipe.sh_cmd, pipe.returncode, output)
 
 def check_konsole_version(konsole):
     import subprocess as sub
-- 
1.7.5.4



