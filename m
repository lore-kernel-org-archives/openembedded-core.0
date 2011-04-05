Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7Be1-0006Am-1z
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 21:10:29 +0200
Received: by gyf1 with SMTP id 1so287672gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 12:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=cjjX+ADEthsvFjVB9EcQx1ew9nGuVa08YKeq+mRRlj4=;
	b=OGZXX+79eyk2gdbDRJV9hVeEhoFVyNqvwbYxCzrebwYdHlKkR/8Tih24veNjr0r8Zj
	qtd/AWyQRDBQAp4FB5Ya9D2qYJqVgHcDaHWlkT4cRVjJzFg69wcvAP93GmGnjBQFlnUs
	v4FpgrM/5og8R5STdhg67RPfaoPa7ywqeYYA8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XapkRVRsEtX6IUDTaKNGmVI+jK6c1kRZajcxk8nkZnsmFMs1qx2LS1RZwoNllqyiG+
	MNv8miFNeUXDxj8o9HCzQFhCHKqORk85Bqz+rl8TA95AHXLgWTHdf66DLE67K+utRclx
	Ip71FSw9kBr2/FQ0K1Pxib4jEkIpPusFNIkP0=
Received: by 10.236.191.226 with SMTP id g62mr71992yhn.12.1302030499838;
	Tue, 05 Apr 2011 12:08:19 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id x28sm2974573yhc.81.2011.04.05.12.08.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 12:08:18 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 12:08:06 -0700
Message-Id: <a33d7cf3cf0c737329d07978e9fa3f208d5e8961.1302030219.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302030219.git.chris_larson@mentor.com>
References: <cover.1302030219.git.chris_larson@mentor.com>
In-Reply-To: <cover.1302030219.git.chris_larson@mentor.com>
References: <cover.1302030219.git.chris_larson@mentor.com>
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
X-List-Received-Date: Tue, 05 Apr 2011 19:10:29 -0000

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
 meta/lib/oe/terminal.py       |  100 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+), 17 deletions(-)
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
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
new file mode 100644
index 0000000..8c8e5b2
--- /dev/null
+++ b/meta/lib/oe/terminal.py
@@ -0,0 +1,100 @@
+import logging
+import os
+import oe.classutils
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
+    registry = {}
+
+    def __init__(cls, name, bases, attrs):
+        super(Registry, cls).__init__(name.lower(), bases, attrs)
+        if not cls.cmd:
+            cls.unregister()
+
+
+class Terminal(Popen):
+    __metaclass__ = Registry
+    cmd = None
+
+    def __init__(self, cmd, title=None):
+        self.format_cmd(cmd, title)
+
+        try:
+            Popen.__init__(self, self.cmd, shell=True)
+        except OSError as exc:
+            import errno
+            if exc.errno == errno.ENOENT:
+                raise UnsupportedTerminal(self.name)
+            else:
+                raise
+
+    def format_cmd(self, cmd, title):
+        fmt = {'title': title or 'Terminal', 'cmd': cmd}
+        if isinstance(self.cmd, basestring):
+            self.cmd = self.cmd.format(**fmt)
+        else:
+            self.cmd = [element.format(**fmt) for element in self.cmd]
+
+class XTerminal(Terminal):
+    def __init__(self, cmd, title=None):
+        Terminal.__init__(self, cmd, title)
+        if not os.environ.get('DISPLAY'):
+            raise UnsupportedTerminal(self.name)
+
+class Gnome(XTerminal):
+    cmd = 'gnome-terminal --disable-factory -t "{title}" -x {cmd}'
+    priority = 2
+
+class Konsole(XTerminal):
+    cmd = 'konsole -T "{title}" -e {cmd}'
+    priority = 2
+
+class XTerm(XTerminal):
+    cmd = 'xterm -T "{title}" -e {cmd}'
+    priority = 1
+
+class Rxvt(XTerminal):
+    cmd = 'rxvt -T "{title}" -e {cmd}'
+    priority = 1
+
+class Screen(Terminal):
+    cmd = 'screen -D -m -t "{title}" {cmd}'
+
+
+def prioritized():
+    return Registry.prioritized()
+
+def spawn_preferred(cmd, title=None):
+    """Spawn the first supported terminal, by priority"""
+    for terminal in Registry.prioritized():
+        try:
+            spawn(terminal.name, cmd, title)
+            break
+        except UnsupportedTerminal:
+            continue
+    else:
+        raise NoSupportedTerminals()
+
+def spawn(name, cmd, title=None):
+    """Spawn the specified terminal, by name"""
+    logger.debug(1, 'Attempting to spawn terminal "%s"' %
+                    name)
+    try:
+        terminal = Registry.registry[name]
+    except KeyError:
+        raise UnsupportedTerminal(name)
+
+    pipe = terminal(cmd, title)
+    output = pipe.communicate()[0]
+    if pipe.returncode != 0:
+        raise ExecutionError(pipe.cmd, pipe.returncode, output)
-- 
1.7.4.1



