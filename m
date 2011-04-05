Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7CvO-0007vo-Gw
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 22:32:30 +0200
Received: by yia13 with SMTP id 13so326236yia.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 13:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=b9qMcLv0lGOLSQd7WysEdVOiAHL0MMcGKNE1dF0YL7s=;
	b=Ir5Lj1zRFok25RqXGcS8pN24SBZ0fxOJ4tD0zFArQEiecFPk06hI4it2eJdGoVcLYo
	GoR39vXEHsGjPdmw1GfQVhOBWdyGQ+BfQ1NzwGL47Q2m1sXd1+omr1tp9IjlAeawh1pr
	qSIEQ0d26mggUJ2Afa2PGGtlQuP5TwqdQvECI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SxzclLwWmcZQNAWqhJsmHMXNAC433xWOXlJgifIqP1wbmwIB6Ht4t1wSq7pOJ6VEYa
	spk6ko3/1b8atWV30nzyuXL4pkMQwen5U+YTyVbuwyu/bZoold1KwBtDy06IOz+zyklc
	kox/soYE+7Wg/brGEod7mjDxl0+sDAbeNA57M=
Received: by 10.150.242.2 with SMTP id p2mr1111846ybh.241.1302035423658;
	Tue, 05 Apr 2011 13:30:23 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id q18sm282484ybk.26.2011.04.05.13.30.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 13:30:22 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 13:30:14 -0700
Message-Id: <d15d26b2234a6798567327a796203b852ea0874d.1302034944.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302034944.git.chris_larson@mentor.com>
References: <cover.1302034944.git.chris_larson@mentor.com>
In-Reply-To: <cover.1302034944.git.chris_larson@mentor.com>
References: <cover.1302034944.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] Rework how the devshell functions
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
X-List-Received-Date: Tue, 05 Apr 2011 20:32:30 -0000

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
 meta/classes/devshell.bbclass |   26 ++++-------
 meta/classes/terminal.bbclass |   30 ++++++++++++
 meta/lib/oe/classutils.py     |   33 +++++++++++--
 meta/lib/oe/terminal.py       |  102 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 168 insertions(+), 23 deletions(-)
 create mode 100644 meta/classes/terminal.bbclass
 create mode 100644 meta/lib/oe/terminal.py

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 5f262f4..7317d64 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -1,22 +1,14 @@
-do_devshell[dirs] = "${S}"
-do_devshell[nostamp] = "1"
+inherit terminal
 
-XAUTHORITY ?= "${HOME}/.Xauthority"
 
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
+export XAUTHORITY ?= "${HOME}/.Xauthority"
+export SHELL ?= 'bash'
+
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
index 0000000..93646f7
--- /dev/null
+++ b/meta/classes/terminal.bbclass
@@ -0,0 +1,30 @@
+OE_TERMINAL ?= 'auto'
+OE_TERMINAL[type] = 'choice'
+OE_TERMINAL[choices] = 'auto none \
+                        ${@" ".join(o.name \
+                                    for o in oe.terminal.prioritized())}'
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
+    try:
+        oe.terminal.spawn_preferred(command, title)
+    except oe.terminal.NoSupportedTerminals:
+        bb.fatal('No valid terminal found, unable to open devshell')
+    except oe.terminal.ExecutionError as exc:
+        bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
diff --git a/meta/lib/oe/classutils.py b/meta/lib/oe/classutils.py
index 855d2fa..922d304 100644
--- a/meta/lib/oe/classutils.py
+++ b/meta/lib/oe/classutils.py
@@ -1,15 +1,36 @@
+__author__ = 'kergoth'
+
 class ClassRegistry(type):
     """Maintain a registry of classes, indexed by name.
 
-    The name in the registry can be overridden via the 'name' attribute of the
-    class, and the 'priority' attribute controls priority.  The prioritized()
-    method returns the registered classes in priority order."""
-    registry = {}
+Note that this implementation requires that the names be unique, as it uses
+a dictionary to hold the classes by name.
+
+The name in the registry can be overridden via the 'name' attribute of the
+class, and the 'priority' attribute controls priority. The prioritized()
+method returns the registered classes in priority order.
+
+Subclasses of ClassRegistry may define an 'implemented' property to exert
+control over whether the class will be added to the registry (e.g. to keep
+abstract base classes out of the registry)."""
     priority = 0
+    class __metaclass__(type):
+        """Give each ClassRegistry their own registry"""
+        def __init__(cls, name, bases, attrs):
+            cls.registry = {}
+            type.__init__(cls, name, bases, attrs)
 
     def __init__(cls, name, bases, attrs):
         super(ClassRegistry, cls).__init__(name, bases, attrs)
-        if not hasattr(cls, name):
+        try:
+            if not cls.implemented:
+                return
+        except AttributeError:
+            pass
+
+        try:
+            cls.name
+        except AttributeError:
             cls.name = name
         cls.registry[cls.name] = cls
 
@@ -21,4 +42,4 @@ class ClassRegistry(type):
     def unregister(cls):
         for key in cls.registry.keys():
             if cls.registry[key] is cls:
-                del cls.registry[key]
+                del cls.registry[key]
\ No newline at end of file
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
new file mode 100644
index 0000000..5336167
--- /dev/null
+++ b/meta/lib/oe/terminal.py
@@ -0,0 +1,102 @@
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
+    def __init__(self, command, title=None):
+        self.format_command(command, title)
+        logger.debug(1, "%s: running %s", self.name, self.command)
+
+        try:
+            Popen.__init__(self, self.command, shell=False)
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
+    def __init__(self, command, title=None):
+        Terminal.__init__(self, command, title)
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
+def spawn_preferred(command, title=None):
+    """Spawn the first supported terminal, by priority"""
+    for terminal in prioritized():
+        try:
+            spawn(terminal.name, command, title)
+            break
+        except UnsupportedTerminal:
+            continue
+    else:
+        raise NoSupportedTerminals()
+
+def spawn(name, command, title=None):
+    """Spawn the specified terminal, by name"""
+    logger.debug(1, 'Attempting to spawn terminal "%s"', name)
+    try:
+        terminal = Registry.registry[name]
+    except KeyError:
+        raise UnsupportedTerminal(name)
+
+    pipe = terminal(command, title)
+    output = pipe.communicate()[0]
+    if pipe.returncode != 0:
+        raise ExecutionError(pipe.command, pipe.returncode, output)
-- 
1.7.4.1



