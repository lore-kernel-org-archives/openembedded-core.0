Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QqqpT-0003Ul-Ub
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 20:15:04 +0200
Received: by pzk2 with SMTP id 2so479602pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 11:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=o6DFXNvlvf4OID5DOLtL5F5WvYme2MKry4XCxLw1wDU=;
	b=hwlYPG1IEqx1yvDaO+f5oIephbDaQKifZzCv2rdJMt0mOQOkU+mI+50ogIMYdORjEn
	aGkg5j/IGGTJsuGsFV7hVSMFHwbmgqBQnHj0GpHywRyYLbjv7A3qRE5e8DppRFNHgVpP
	xGVZB9GqiF1+W9IuORkyUolIjc8PnnLfG/TOI=
Received: by 10.142.154.21 with SMTP id b21mr7081480wfe.77.1312913430268;
	Tue, 09 Aug 2011 11:10:30 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id e6sm148739pbm.71.2011.08.09.11.10.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 11:10:28 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 11:05:59 -0700
Message-Id: <7c3fdc334ca23629701d4c1f464258dd1628df29.1312903904.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1312903901.git.kergoth@gmail.com>
References: <cover.1312903901.git.kergoth@gmail.com>
In-Reply-To: <cover.1312903901.git.kergoth@gmail.com>
References: <cover.1312903901.git.kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] Rework how the devshell functions
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
X-List-Received-Date: Tue, 09 Aug 2011 18:15:04 -0000

From: Chris Larson <chris_larson@mentor.com>

In the new implementation, each known terminal is defined as a class in
oe.terminal, as a subclass of bb.process.Popen.  terminal.bbclass wraps this
functionality, providing the metadata pieces.  It obeys the OE_TERMINAL
variable, which is a 'choice' typed variable.  This variable may be 'auto',
'none', or any of the names of the defined terminals.

When using 'auto', or requesting an unsupported terminal, we attempt to spawn
them in priority order until we get one that's available on this system (and
in the case of the X terminals, has DISPLAY defined).  The 'none' value is
used when we're doing things like automated builds, and want to ensure that no
terminal is *ever* spawned, under any circumstances.

Current available terminals:

    gnome
    konsole
    xterm
    rxvt
    screen

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/devshell.bbclass |   24 +++-------
 meta/classes/terminal.bbclass |   40 ++++++++++++++++
 meta/lib/oe/terminal.py       |  101 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+), 18 deletions(-)
 create mode 100644 meta/classes/terminal.bbclass
 create mode 100644 meta/lib/oe/terminal.py

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 5f262f4..ddb6e55 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -1,22 +1,10 @@
-do_devshell[dirs] = "${S}"
-do_devshell[nostamp] = "1"
+inherit terminal
 
-XAUTHORITY ?= "${HOME}/.Xauthority"
-
-devshell_do_devshell() {
-	export DISPLAY='${DISPLAY}'
-	export DBUS_SESSION_BUS_ADDRESS='${DBUS_SESSION_BUS_ADDRESS}'
-	export XAUTHORITY='${XAUTHORITY}'
-	export TERMWINDOWTITLE="Bitbake Developer Shell"
-	export EXTRA_OEMAKE='${EXTRA_OEMAKE}'
-	export SHELLCMDS="bash"
-	${TERMCMDRUN}
-	if [ $? -ne 0 ]; then
-	    echo "Fatal: '${TERMCMD}' not found. Check TERMCMD variable."
-	    exit 1
-	fi
+python do_devshell () {
+    oe_terminal(d.getVar('SHELL', True), 'OpenEmbedded Developer Shell', d)
 }
-addtask devshell after do_patch
 
-EXPORT_FUNCTIONS do_devshell
+addtask devshell after do_patch
 
+do_devshell[dirs] = "${S}"
+do_devshell[nostamp] = "1"
diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
new file mode 100644
index 0000000..4123046
--- /dev/null
+++ b/meta/classes/terminal.bbclass
@@ -0,0 +1,40 @@
+OE_TERMINAL ?= 'auto'
+OE_TERMINAL[type] = 'choice'
+OE_TERMINAL[choices] = 'auto none \
+                        ${@" ".join(o.name \
+                                    for o in oe.terminal.prioritized())}'
+
+OE_TERMINAL_EXPORTS = 'XAUTHORITY SHELL DBUS_SESSION_BUS_ADDRESS DISPLAY EXTRA_OEMAKE'
+OE_TERMINAL_EXPORTS[type] = 'list'
+
+XAUTHORITY ?= "${HOME}/.Xauthority"
+SHELL ?= "bash"
+
+
+def oe_terminal(command, title, d):
+    import oe.data
+    import oe.terminal
+
+    terminal = oe.data.typed_value('OE_TERMINAL', d).lower()
+    if terminal == 'none':
+        bb.fatal('Devshell usage disabled with OE_TERMINAL')
+    elif terminal != 'auto':
+        try:
+            oe.terminal.spawn(terminal, command, title)
+            return
+        except oe.terminal.UnsupportedTerminal:
+            bb.warn('Unsupported terminal "%s", defaulting to "auto"' %
+                    terminal)
+        except oe.terminal.ExecutionError as exc:
+            bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
+
+    env = dict(os.environ)
+    for export in oe.data.typed_value('OE_TERMINAL_EXPORTS', d):
+        env[export] = d.getVar(export, True)
+
+    try:
+        oe.terminal.spawn_preferred(command, title, env)
+    except oe.terminal.NoSupportedTerminals:
+        bb.fatal('No valid terminal found, unable to open devshell')
+    except oe.terminal.ExecutionError as exc:
+        bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
new file mode 100644
index 0000000..3767935
--- /dev/null
+++ b/meta/lib/oe/terminal.py
@@ -0,0 +1,101 @@
+import logging
+import os
+import oe.classutils
+import shlex
+from bb.process import Popen, ExecutionError
+
+logger = logging.getLogger('BitBake.OE.Terminal')
+
+
+class UnsupportedTerminal(StandardError):
+    pass
+
+class NoSupportedTerminals(StandardError):
+    pass
+
+
+class Registry(oe.classutils.ClassRegistry):
+    command = None
+
+    def __init__(cls, name, bases, attrs):
+        super(Registry, cls).__init__(name.lower(), bases, attrs)
+
+    @property
+    def implemented(cls):
+        return bool(cls.command)
+
+
+class Terminal(Popen):
+    __metaclass__ = Registry
+
+    def __init__(self, command, title=None, env=None):
+        self.format_command(command, title)
+
+        try:
+            Popen.__init__(self, self.command, env=env)
+        except OSError as exc:
+            import errno
+            if exc.errno == errno.ENOENT:
+                raise UnsupportedTerminal(self.name)
+            else:
+                raise
+
+    def format_command(self, command, title):
+        fmt = {'title': title or 'Terminal', 'command': command}
+        if isinstance(self.command, basestring):
+            self.command = shlex.split(self.command.format(**fmt))
+        else:
+            self.command = [element.format(**fmt) for element in self.command]
+
+class XTerminal(Terminal):
+    def __init__(self, command, title=None, env=None):
+        Terminal.__init__(self, command, title, env)
+        if not os.environ.get('DISPLAY'):
+            raise UnsupportedTerminal(self.name)
+
+class Gnome(XTerminal):
+    command = 'gnome-terminal --disable-factory -t "{title}" -x {command}'
+    priority = 2
+
+class Konsole(XTerminal):
+    command = 'konsole -T "{title}" -e {command}'
+    priority = 2
+
+class XTerm(XTerminal):
+    command = 'xterm -T "{title}" -e {command}'
+    priority = 1
+
+class Rxvt(XTerminal):
+    command = 'rxvt -T "{title}" -e {command}'
+    priority = 1
+
+class Screen(Terminal):
+    command = 'screen -D -m -t "{title}" {command}'
+
+
+def prioritized():
+    return Registry.prioritized()
+
+def spawn_preferred(command, title=None, env=None):
+    """Spawn the first supported terminal, by priority"""
+    for terminal in prioritized():
+        try:
+            spawn(terminal.name, command, title, env)
+            break
+        except UnsupportedTerminal:
+            continue
+    else:
+        raise NoSupportedTerminals()
+
+def spawn(name, command, title=None, env=None):
+    """Spawn the specified terminal, by name"""
+    logger.debug(1, 'Attempting to spawn terminal "%s"', name)
+    try:
+        terminal = Registry.registry[name]
+    except KeyError:
+        raise UnsupportedTerminal(name)
+
+    pipe = terminal(command, title, env)
+    output = pipe.communicate()[0]
+    if pipe.returncode != 0:
+        raise ExecutionError(pipe.command, pipe.returncode, output)
-- 
1.7.5.4



