Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 79C0E60119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 16:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u66GM1l7019122 for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 17:22:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id P3FcjW6GjS7k
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 17:22:01 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u66GLxPU019119
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 17:22:00 +0100
Message-ID: <1467822119.8590.213.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 06 Jul 2016 17:21:59 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] terminal: Drop gnome-terminal --disable-factory workarounds
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
X-List-Received-Date: Wed, 06 Jul 2016 16:22:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With the new pid monitoring code we have for recent versions of
gnome-terminal we can just drop the --disable-factory code now since
the other solution handles this case as well.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 4a5ab1a..6d6a29f 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -51,7 +51,7 @@ class XTerminal(Terminal):
             raise UnsupportedTerminal(self.name)
 
 class Gnome(XTerminal):
-    command = 'gnome-terminal -t "{title}" --disable-factory -x {command}'
+    command = 'gnome-terminal -t "{title}" -x {command}'
     priority = 2
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
@@ -61,16 +61,9 @@ class Gnome(XTerminal):
         # Once fixed on the gnome-terminal project, this should be removed.
         if os.getenv('LC_ALL'): os.putenv('LC_ALL','')
 
-        # Check version
-        vernum = check_terminal_version("gnome-terminal")
-        if vernum and LooseVersion(vernum) >= '3.10':
-            logger.debug(1, 'Gnome-Terminal 3.10 or later does not support --disable-factory')
-            self.command = 'gnome-terminal -t "{title}" -x {command}'
-
         # We need to know when the command completes but gnome-terminal gives us no way 
         # to do this. We therefore write the pid to a file using a "phonehome" wrapper
         # script, then monitor the pid until it exits. Thanks gnome!
-
         import tempfile
         pidfile = tempfile.NamedTemporaryFile(delete = False).name
         try:



