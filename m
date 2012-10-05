Received: from ams-iport-3.cisco.com ([144.254.224.146])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <xim@kattastrofe>) id 1TK7Q5-0003lB-OG
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 14:54:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=6538; q=dns/txt; s=iport;
	t=1349440881; x=1350650481;
	h=from:to:cc:subject:date:message-id;
	bh=2bKf5OoNVFxyvKFOukCuD4NG8o61LbWIFB6ezzPHbsY=;
	b=b+VTnwvQt3nL1l8jiCHzlHMm3QX02kc/YdvUMTdtPW2jry2Js3XUiTTk
	OSj7DFMef47qmhc6mirFqS8bbaIS/5xNpZJcJ5Pc/G3vorJrNnveUGxRN
	Sq46w7Icujrq6msyvxqJ9yeYijAYCVlr7C2t54B/KZZ6cd1A00d7yWvbz 0=;
X-IronPort-AV: E=Sophos;i="4.80,541,1344211200"; 
   d="scan'208";a="8546119"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-3.cisco.com with ESMTP; 05 Oct 2012 12:40:15 +0000
Received: from kattastrofe (dhcp-10-54-74-65.cisco.com [10.54.74.65])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q95CeEOG020858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 5 Oct 2012 12:40:15 GMT
From: Morten Minde Neergaard <mneergaa@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2012 14:40:14 +0200
Message-Id: <1349440814-3811-1-git-send-email-mneergaa@cisco.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Add support for running custom terminals. Example config: OE_TERMINAL = "custom" / OE_TERMINAL_CUSTOMCMD = "myterm"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2012 12:54:22 -0000

Signed-off-by: Morten Minde Neergaard <mneergaa@cisco.com>
---
 meta/classes/terminal.bbclass |    6 +++---
 meta/lib/oe/terminal.py       |   41 ++++++++++++++++++++++++++++-------------
 2 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 3cfc84b..906fa58 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -4,7 +4,7 @@ OE_TERMINAL[choices] = 'auto none \
                         ${@" ".join(o.name \
                                     for o in oe.terminal.prioritized())}'
 
-OE_TERMINAL_EXPORTS = 'XAUTHORITY SHELL DBUS_SESSION_BUS_ADDRESS DISPLAY EXTRA_OEMAKE SCREENDIR'
+OE_TERMINAL_EXPORTS += 'XAUTHORITY SHELL DBUS_SESSION_BUS_ADDRESS DISPLAY EXTRA_OEMAKE SCREENDIR'
 OE_TERMINAL_EXPORTS[type] = 'list'
 
 XAUTHORITY ?= "${HOME}/.Xauthority"
@@ -25,7 +25,7 @@ def oe_terminal(command, title, d):
         bb.fatal('Devshell usage disabled with OE_TERMINAL')
     elif terminal != 'auto':
         try:
-            oe.terminal.spawn(terminal, command, title)
+            oe.terminal.spawn(terminal, command, title, None, d)
             return
         except oe.terminal.UnsupportedTerminal:
             bb.warn('Unsupported terminal "%s", defaulting to "auto"' %
@@ -34,7 +34,7 @@ def oe_terminal(command, title, d):
             bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
 
     try:
-        oe.terminal.spawn_preferred(command, title)
+        oe.terminal.spawn_preferred(command, title, None, d)
     except oe.terminal.NoSupportedTerminals:
         bb.fatal('No valid terminal found, unable to open devshell')
     except oe.terminal.ExecutionError as exc:
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 30e8f92..91d5a66 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -27,7 +27,7 @@ class Registry(oe.classutils.ClassRegistry):
 class Terminal(Popen):
     __metaclass__ = Registry
 
-    def __init__(self, sh_cmd, title=None, env=None):
+    def __init__(self, sh_cmd, title=None, env=None, d=None):
         fmt_sh_cmd = self.format_command(sh_cmd, title)
         try:
             Popen.__init__(self, fmt_sh_cmd, env=env)
@@ -46,8 +46,8 @@ class Terminal(Popen):
             return [element.format(**fmt) for element in self.command]
 
 class XTerminal(Terminal):
-    def __init__(self, sh_cmd, title=None, env=None):
-        Terminal.__init__(self, sh_cmd, title, env)
+    def __init__(self, sh_cmd, title=None, env=None, d=None):
+        Terminal.__init__(self, sh_cmd, title, env, d)
         if not os.environ.get('DISPLAY'):
             raise UnsupportedTerminal(self.name)
 
@@ -59,7 +59,7 @@ class Xfce(XTerminal):
     command = 'Terminal -T "{title}" -e "{command}"'
     priority = 2
 
-    def __init__(self, command, title=None, env=None):
+    def __init__(self, command, title=None, env=None, d=None):
         # Upstream binary name is Terminal but Debian/Ubuntu use
         # xfce4-terminal to avoid possible(?) conflicts
         distro = distro_name()
@@ -67,20 +67,20 @@ class Xfce(XTerminal):
             cmd = 'xfce4-terminal -T "{title}" -e "{command}"'
         else:
             cmd = command
-        XTerminal.__init__(self, cmd, title, env)
+        XTerminal.__init__(self, cmd, title, env, d)
 
 class Konsole(XTerminal):
     command = 'konsole -T "{title}" -e {command}'
     priority = 2
 
-    def __init__(self, sh_cmd, title=None, env=None):
+    def __init__(self, sh_cmd, title=None, env=None, d=None):
         # Check version
         vernum = check_konsole_version("konsole")
         if vernum:
             if vernum.split('.')[0] == "2":
                 logger.debug(1, 'Konsole from KDE 4.x will not work as devshell, skipping')
                 raise UnsupportedTerminal(self.name)
-        XTerminal.__init__(self, sh_cmd, title, env)
+        XTerminal.__init__(self, sh_cmd, title, env, d)
 
 class XTerm(XTerminal):
     command = 'xterm -T "{title}" -e {command}'
@@ -93,29 +93,44 @@ class Rxvt(XTerminal):
 class Screen(Terminal):
     command = 'screen -D -m -t "{title}" -S devshell {command}'
 
-    def __init__(self, sh_cmd, title=None, env=None):
+    def __init__(self, sh_cmd, title=None, env=None, d=None):
         s_id = "devshell_%i" % os.getpid()
         self.command = "screen -D -m -t \"{title}\" -S %s {command}" % s_id
-        Terminal.__init__(self, sh_cmd, title, env)
+        Terminal.__init__(self, sh_cmd, title, env, d)
         logger.warn('Screen started. Please connect in another terminal with '
                     '"screen -r devshell %s"' % s_id)
 
+class Custom(Terminal):
+    command = 'false' # This is a placeholder
+    priority = 3
+
+    def __init__(self, sh_cmd, title=None, env=None, d=None):
+        self.command = d and d.getVar('OE_TERMINAL_CUSTOMCMD', True)
+        if self.command:
+            if not '{command}' in self.command:
+                self.command += ' {command}'
+            Terminal.__init__(self, sh_cmd, title, env, d)
+            logger.warn('Custom terminal was started.')
+        else:
+            logger.debug(1, 'No custom terminal (OE_TERMINAL_CUSTOMCMD) set')
+            raise UnsupportedTerminal('OE_TERMINAL_CUSTOMCMD not set')
+
 
 def prioritized():
     return Registry.prioritized()
 
-def spawn_preferred(sh_cmd, title=None, env=None):
+def spawn_preferred(sh_cmd, title=None, env=None, d=None):
     """Spawn the first supported terminal, by priority"""
     for terminal in prioritized():
         try:
-            spawn(terminal.name, sh_cmd, title, env)
+            spawn(terminal.name, sh_cmd, title, env, d)
             break
         except UnsupportedTerminal:
             continue
     else:
         raise NoSupportedTerminals()
 
-def spawn(name, sh_cmd, title=None, env=None):
+def spawn(name, sh_cmd, title=None, env=None, d=None):
     """Spawn the specified terminal, by name"""
     logger.debug(1, 'Attempting to spawn terminal "%s"', name)
     try:
@@ -123,7 +138,7 @@ def spawn(name, sh_cmd, title=None, env=None):
     except KeyError:
         raise UnsupportedTerminal(name)
 
-    pipe = terminal(sh_cmd, title, env)
+    pipe = terminal(sh_cmd, title, env, d)
     output = pipe.communicate()[0]
     if pipe.returncode != 0:
         raise ExecutionError(sh_cmd, pipe.returncode, output)
-- 
1.7.9.5



