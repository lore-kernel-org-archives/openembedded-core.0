Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jeffrey.honig@windriver.com>) id 1SqzBx-0005UY-A0
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 06:15:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6H441Y2024515
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 21:04:01 -0700 (PDT)
Received: from jch-schlepp.wrs.com (172.25.32.253) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Jul 2012 21:04:00 -0700
Received: from schlepp.honig.net (schlepp.honig.net [127.0.0.1])	by
	jch-schlepp.wrs.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q6H43xNT006011	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256
	verify=NOT)	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 00:03:59 -0400
Received: (from jch@localhost)	by schlepp.honig.net (8.14.4/8.14.4/Submit) id
	q6H43xwQ006010	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 00:03:59 -0400
From: Jeffrey C Honig <jeffrey.honig@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jul 2012 00:03:59 -0400
Message-ID: <1342497839-5973-1-git-send-email-jeffrey.honig@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1342483677-789-1-git-send-email-jeffrey.honig@windriver.com>
References: <1342483677-789-1-git-send-email-jeffrey.honig@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2] terminal.py: Fix Xfce on ubuntu/debian; some cleanup
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
X-List-Received-Date: Tue, 17 Jul 2012 04:15:21 -0000
Content-Type: text/plain

    * Xfce class was setting and passing wrong variable for ubuntu/debian.
    * Xfce class was using -e instead of -x for passing command.  The former creates
      a shell escape nightmare
    * Clean up local and instance/class variables with same name but different usage.
    * Remove side-effect and directly return formatted command for clarity.

Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
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
1.7.5.4



