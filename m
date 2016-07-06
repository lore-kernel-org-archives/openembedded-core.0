Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AF91E60119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 16:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u66G92jT018472 for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 17:09:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iA1QlXVVrJ7B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 17:09:02 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u66G8vp5018457
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 17:08:59 +0100
Message-ID: <1467821337.8590.212.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 06 Jul 2016 17:08:57 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] terminal: Fix gnome-terminal to work with recent versions
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
X-List-Received-Date: Wed, 06 Jul 2016 16:09:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently gnome-terminal just returns straight away, opening a terminal in a new 
separate process we have no insight into. For patch resolution, this leads to 
spawning many different terminal windows, for pydevshell, it just flashes a window
up and then closes.

We need to block until the command completes but gnome-terminal gives us no way 
to do this. We therefore write the pid to a file using a "phonehome" wrapper 
script, then monitor the pid until it exits.

[YOCTO #7254]
(also fixing do_devpyshell)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 7f4458e..4a5ab1a 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -66,7 +66,28 @@ class Gnome(XTerminal):
         if vernum and LooseVersion(vernum) >= '3.10':
             logger.debug(1, 'Gnome-Terminal 3.10 or later does not support --disable-factory')
             self.command = 'gnome-terminal -t "{title}" -x {command}'
-        XTerminal.__init__(self, sh_cmd, title, env, d)
+
+        # We need to know when the command completes but gnome-terminal gives us no way 
+        # to do this. We therefore write the pid to a file using a "phonehome" wrapper
+        # script, then monitor the pid until it exits. Thanks gnome!
+
+        import tempfile
+        pidfile = tempfile.NamedTemporaryFile(delete = False).name
+        try:
+            sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
+            XTerminal.__init__(self, sh_cmd, title, env, d)
+            while os.stat(pidfile).st_size <= 0:
+                continue
+            with open(pidfile, "r") as f:
+                pid = int(f.readline())
+        finally:
+            os.unlink(pidfile)
+
+        while True:
+            try:
+                os.kill(pid, 0)
+            except OSError:
+               return
 
 class Mate(XTerminal):
     command = 'mate-terminal -t "{title}" -x {command}'
diff --git a/scripts/oe-gnome-terminal-phonehome b/scripts/oe-gnome-terminal-phonehome
new file mode 100755
index 0000000..e023548
--- /dev/null
+++ b/scripts/oe-gnome-terminal-phonehome
@@ -0,0 +1,10 @@
+#!/bin/sh
+#
+# Gnome terminal won't tell us which PID a given command is run as 
+# or allow a single instance so we can't tell when it completes.
+# This allows us to figure out the PID of the target so we can tell 
+# when its done.
+#
+echo $$ > $1
+shift
+exec $@



