Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <xim@kattastrofe>) id 1TPABk-0001uB-Kc
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 12:52:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3536; q=dns/txt; s=iport;
	t=1350643146; x=1351852746;
	h=from:to:cc:subject:date:message-id;
	bh=xxnJQEArOLgOW+q6IKbbpcnOUQrlMGUVnrScQkVmDRQ=;
	b=ImRKqKlOYKHzQJcUB/OWcq1zHCYleTgG6mRs1gM6P9ISFGRKD0sQjd6K
	KwsN4I36p+8RpkloX5/OadKqDsbxbLFWflHhrrwGwN/LO5q7/582n3od8
	TfkHqHINmYsQcHz9suYujwem0d5BaMUb7XX02fMGcHIXzf6bMtelmOrQr 4=;
X-IronPort-AV: E=Sophos;i="4.80,612,1344211200"; d="scan'208";a="145516550"
Received: from ams-core-4.cisco.com ([144.254.72.77])
	by ams-iport-1.cisco.com with ESMTP; 19 Oct 2012 10:37:59 +0000
Received: from kattastrofe (dhcp-10-54-74-65.cisco.com [10.54.74.65])
	by ams-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id q9JAbxoV013172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 19 Oct 2012 10:37:59 GMT
From: Morten Minde Neergaard <mneergaa@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2012 12:37:07 +0200
Message-Id: <1350643027-25785-1-git-send-email-mneergaa@cisco.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Morten Minde Neergaard <mneergaa@cisco.com>
Subject: [PATCH] Add support for running custom terminals.
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
X-List-Received-Date: Fri, 19 Oct 2012 10:52:24 -0000

Example config:
OE_TERMINAL = "custom"
OE_TERMINAL_CUSTOMCMD = "mysuperterm"

Signed-off-by: Morten Minde Neergaard <mneergaa@cisco.com>
---
 meta/classes/terminal.bbclass |   10 ++++++----
 meta/lib/oe/terminal.py       |   17 ++++++++++++++++-
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 2cd6f4c..51846c1 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -4,7 +4,7 @@ OE_TERMINAL[choices] = 'auto none \
                         ${@" ".join(o.name \
                                     for o in oe.terminal.prioritized())}'
 
-OE_TERMINAL_EXPORTS = 'XAUTHORITY SHELL DBUS_SESSION_BUS_ADDRESS DISPLAY EXTRA_OEMAKE SCREENDIR'
+OE_TERMINAL_EXPORTS += 'XAUTHORITY SHELL DBUS_SESSION_BUS_ADDRESS DISPLAY EXTRA_OEMAKE SCREENDIR'
 OE_TERMINAL_EXPORTS[type] = 'list'
 
 XAUTHORITY ?= "${HOME}/.Xauthority"
@@ -15,17 +15,19 @@ def oe_terminal(command, title, d):
     import oe.data
     import oe.terminal
 
+    env = dict()
+
     for export in oe.data.typed_value('OE_TERMINAL_EXPORTS', d):
         value = d.getVar(export, True)
         if value is not None:
-            os.environ[export] = str(value)
+            env[export] = str(value)
 
     terminal = oe.data.typed_value('OE_TERMINAL', d).lower()
     if terminal == 'none':
         bb.fatal('Devshell usage disabled with OE_TERMINAL')
     elif terminal != 'auto':
         try:
-            oe.terminal.spawn(terminal, command, title, None, d)
+            oe.terminal.spawn(terminal, command, title, env, d)
             return
         except oe.terminal.UnsupportedTerminal:
             bb.warn('Unsupported terminal "%s", defaulting to "auto"' %
@@ -34,7 +36,7 @@ def oe_terminal(command, title, d):
             bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
 
     try:
-        oe.terminal.spawn_preferred(command, title, None, d)
+        oe.terminal.spawn_preferred(command, title, env, d)
     except oe.terminal.NoSupportedTerminals:
         bb.fatal('No valid terminal found, unable to open devshell')
     except oe.terminal.ExecutionError as exc:
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 71d8a43..4c1e318 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -47,7 +47,7 @@ class Terminal(Popen):
 
 class XTerminal(Terminal):
     def __init__(self, sh_cmd, title=None, env=None, d=None):
-        Terminal.__init__(self, sh_cmd, title, env)
+        Terminal.__init__(self, sh_cmd, title, env, d)
         if not os.environ.get('DISPLAY'):
             raise UnsupportedTerminal(self.name)
 
@@ -105,6 +105,21 @@ class Screen(Terminal):
         else:
             logger.warn(msg)
 
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
-- 
1.7.9.5



