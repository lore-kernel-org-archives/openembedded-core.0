Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4D14971633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 19:40:11 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so20147006wid.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 11:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6jYFAwKma6WAFjYle3bEedYUedRIvG8injAxliyDh50=;
	b=T4QHTNn+ZEtxBUsauw5Xtvbui1mqZmMR4mvVGnoc6J2xHZVM6rTJLK7OwE2JkRtfKo
	VCZJ5t6nmNr7ezsToDdwsLexRZOYtzeQwxe+2ynTk+3P9HCEoWlA0yHM0RMA75DpupsU
	BmdkCnZRNbp8paHyKUrxNSfcKy500iBLcd7NX3/FuXDBY5NbuQhb+YB/BU7M/GY9TVhv
	SXetKUHulewlZJUYInci8qzx/i0k3v6LjBKPZgfWNxYMz1YG6CcpxQHut60UBBeAz9EO
	usGTzh+rdPj6+cRCM+GYdeibEbT/uqbCpzUjPySBy5NQe2/S0NbJg5SO8O2RMzZj4nqX
	SGMg==
X-Received: by 10.180.9.71 with SMTP id x7mr24277167wia.0.1424720412691;
	Mon, 23 Feb 2015 11:40:12 -0800 (PST)
Received: from localhost.localdomain (ip-84-119-96-251.unity-media.net.
	[84.119.96.251])
	by mx.google.com with ESMTPSA id y3sm17100149wju.14.2015.02.23.11.40.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Feb 2015 11:40:11 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 20:39:41 +0100
Message-Id: <1424720381-4282-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH v2] terminal.py: No --disable-factory for gnome-terminal >= 3.10
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
X-List-Received-Date: Mon, 23 Feb 2015 19:40:12 -0000

--disable-factory has been disabled in earlier versions of gnome-terminal
but from version 3.10 it raises an error and quits. This makes devshell
unusable with gnome-terminal >= 3.10. This patch checks for the version and
removes --disable-factory if you have the terminal version 3.10 or higher.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta/lib/oe/terminal.py | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 54e3ffc..01c0ccc 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -55,6 +55,14 @@ class Gnome(XTerminal):
     command = 'gnome-terminal -t "{title}" --disable-factory -x {command}'
     priority = 2
 
+    def __init__(self, sh_cmd, title=None, env=None, d=None):
+        # Check version
+        (major, minor) = check_terminal_version("gnome-terminal")
+        if major >= 3 and minor >= 10:
+            logger.warn(1, 'Gnome-Terminal >3.10 does not support --disable-factory')
+            self.command = 'gnome-terminal -t "{title}" -x {command}'
+        XTerminal.__init__(self, sh_cmd, title, env, d)
+
 class Mate(XTerminal):
     command = 'mate-terminal -t "{title}" -x {command}'
     priority = 2
@@ -73,11 +81,10 @@ class Konsole(XTerminal):
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
         # Check version
-        vernum = check_konsole_version("konsole")
-        if vernum:
-            if vernum.split('.')[0] == "2":
-                logger.debug(1, 'Konsole from KDE 4.x will not work as devshell, skipping')
-                raise UnsupportedTerminal(self.name)
+        (major, minor) = check_terminal_version("konsole")
+        if major == 2:
+            logger.debug(1, 'Konsole from KDE 4.x will not work as devshell, skipping')
+            raise UnsupportedTerminal(self.name)
         XTerminal.__init__(self, sh_cmd, title, env, d)
 
 class XTerm(XTerminal):
@@ -219,10 +226,10 @@ def check_tmux_pane_size(tmux):
         return True
     return False
 
-def check_konsole_version(konsole):
+def check_terminal_version(terminalName):
     import subprocess as sub
     try:
-        p = sub.Popen(['sh', '-c', '%s --version' % konsole],stdout=sub.PIPE,stderr=sub.PIPE)
+        p = sub.Popen(['sh', '-c', '%s --version' % terminalName],stdout=sub.PIPE,stderr=sub.PIPE)
         out, err = p.communicate()
         ver_info = out.rstrip().split('\n')
     except OSError as exc:
@@ -232,10 +239,17 @@ def check_konsole_version(konsole):
         else:
             raise
     vernum = None
+    major = int(0)
+    minor = int(0)
     for ver in ver_info:
         if ver.startswith('Konsole'):
             vernum = ver.split(' ')[-1]
-    return vernum
+	if ver.startswith('GNOME Terminal'):
+            vernum = ver.split(' ')[-1]
+    if vernum:
+	major = int(vernum.split('.')[0])
+	minor = int(vernum.split('.')[1])
+    return major, minor
 
 def distro_name():
     try:
-- 
1.9.3


