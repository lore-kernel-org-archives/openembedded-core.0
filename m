Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMkQm-0005df-J0
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:21:09 +0200
Received: by pvc30 with SMTP id 30so831990pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 10:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=xapl016kcFBAV0RybQ8gCu0fYcmEFRr1TlU9/Gy58fc=;
	b=LN7BQzqmAss3y4FOqquxRx+C/skX9L+Cu92rppYCQ5GDYBUGdTdMIbefy7EaRYe8p3
	4FFsEfrizksl9vCZ3vrM0c4sxyxs/YgX8FtNvtdv2ISzxoM6pf6cEpqz3MGr0D4IjuEF
	juZNwqmcANR1aoyln7R96BzkOBWZHfZi/sYWk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=r0xzBCKUmZw6DowyEugLcSCSpJPKpZKTm5yGf4vV5IfMrg6MHH6j/I0nHE3Pfzt0hr
	2FZBMDnGoL2UWI3asu3usKvYBaIyh0a84NoBzpGojMNGkKiAHO+aBdX8cL9/Cb1dngoO
	PR8hehS21aOXXjk9peezMtpjAPYA4OONx1sa8=
Received: by 10.142.2.33 with SMTP id 33mr1187367wfb.232.1305739092381;
	Wed, 18 May 2011 10:18:12 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id 25sm1550869wfb.10.2011.05.18.10.18.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 10:18:11 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 10:18:00 -0700
Message-Id: <96e4df5d0b4e27e40a2a6b5d7db2631b9c203010.1305737923.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305737923.git.chris_larson@mentor.com>
References: <cover.1305737923.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305737923.git.chris_larson@mentor.com>
References: <cover.1305737923.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH (v2, resend) 2/3] Rework how the devshell functions
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
X-List-Received-Date: Wed, 18 May 2011 17:21:09 -0000

From: Chris Larson <chris_larson@mentor.com>

In the new implementation, each known terminal is defined as a class in
oe.terminal, as a subclass of bb.process.Popen. It obeys the OE_TERMINAL
variable, which is a 'choice' typed variable. This variable may be 'auto',
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
 meta/classes/devshell.bbclass |   25 ++------
 meta/conf/bitbake.conf        |    9 +++
 meta/lib/oe/classutils.py     |    2 +
 meta/lib/oe/terminal.py       |  126 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 143 insertions(+), 19 deletions(-)
 create mode 100644 meta/lib/oe/terminal.py

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 5f262f4..216a9dc 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -1,22 +1,9 @@
-do_devshell[dirs] = "${S}"
-do_devshell[nostamp] = "1"
-
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
+    import oe.terminal
+    oe.terminal.run(d.getVar('SHELL', True), 'OpenEmbedded Developer Shell', d)
 }
-addtask devshell after do_patch
 
-EXPORT_FUNCTIONS do_devshell
+addtask devshell after do_patch
 
+do_devshell[dirs] = "${S}"
+do_devshell[nostamp] = "1"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a0af672..45a426d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -539,6 +539,15 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 # UI/Interaction Configuration
 ##################################################################
 
+
+OE_TERMINAL ?= 'auto'
+OE_TERMINAL[type] = 'choice'
+OE_TERMINAL[choices] = 'auto none \
+                        ${@" ".join(o.name \
+                                    for o in oe.terminal.prioritized())}'
+
+export XAUTHORITY ?= "${HOME}/.Xauthority"
+export SHELL ?= "bash"
 export SHELLCMDS = "bash"
 # Some common terminal programs to choose from
 GNOME_TERMCMD = 'gnome-terminal --disable-factory -t "$TERMWINDOWTITLE"'
diff --git a/meta/lib/oe/classutils.py b/meta/lib/oe/classutils.py
index 58188fd..42b0f49 100644
--- a/meta/lib/oe/classutils.py
+++ b/meta/lib/oe/classutils.py
@@ -1,3 +1,5 @@
+__author__ = 'kergoth'
+
 class ClassRegistry(type):
     """Maintain a registry of classes, indexed by name.
 
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
new file mode 100644
index 0000000..e14fc5d
--- /dev/null
+++ b/meta/lib/oe/terminal.py
@@ -0,0 +1,126 @@
+import logging
+import os
+import oe.classutils
+import oe.data
+import shlex
+import bb
+from bb.process import Popen, ExecutionError
+
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
+def run(command, title, d):
+    terminal = oe.data.typed_value('OE_TERMINAL', d).lower()
+    if terminal == 'none':
+        bb.fatal('Devshell usage disabled with OE_TERMINAL')
+    elif terminal != 'auto':
+        try:
+            spawn(terminal, command, title)
+            return
+        except UnsupportedTerminal:
+            bb.warn('Unsupported terminal "%s", defaulting to "auto"' %
+                    terminal)
+        except ExecutionError as exc:
+            bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
+
+    try:
+        spawn_preferred(command, title)
+    except NoSupportedTerminals:
+        bb.fatal('No valid terminal found, unable to open devshell')
+    except ExecutionError as exc:
+        bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
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
1.7.1



