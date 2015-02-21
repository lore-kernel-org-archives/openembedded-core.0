Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D85E3606E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 10:45:09 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id k14so17446042wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 02:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UjXoMAkMne5reDlRNbBPCY4Umq1+thrg8WgpB0SLTj4=;
	b=WJvfI2XZN8EkIulg+ZIB2j9bLV5raDlPYJ4nKbEiPPFPGbqnHVkwPt4v/LtPa3dSoi
	4Xz0cMREMfWPJokaKYf9ssHbCIN/Q0znkEZnA3Z/5QmHoxdMhHOa+aw1dfwO43q9tQGH
	4lBoie9eqs79Q4RWkOI8UrrCy+bTiIfARRU339zLMu9VKWcWotzSGZAVNtuPatLY3vmk
	BCr1DFIbvl0knuGn2wL0pPRGA6B0h9GSD2eRdHeUbpRN1vRQvm2/fQ4J4/SMSG9TfLFW
	aj32XmAiR9tn9l/R0sA24kc8+tOioILJdsWsgOw6D38u4gLSEf5vySf7bZBRxvr0VHGp
	jbWg==
X-Received: by 10.194.19.197 with SMTP id h5mr3437085wje.109.1424515510340;
	Sat, 21 Feb 2015 02:45:10 -0800 (PST)
Received: from localhost.localdomain (ip-84-119-96-251.unity-media.net.
	[84.119.96.251])
	by mx.google.com with ESMTPSA id ka1sm46115287wjc.2.2015.02.21.02.45.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Feb 2015 02:45:09 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Feb 2015 11:44:20 +0100
Message-Id: <1424515460-52075-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] terminal.py: No --disable-factory for gnome-terminal >= 3.10
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
X-List-Received-Date: Sat, 21 Feb 2015 10:45:15 -0000

--disable-factory has been disabled in earlier versions of gnome-terminal
but from version 3.10 it raises an error and quits. This makes devshell
unusable with gnome-terminal >= 3.10. This patch checks for the version and
removes --disable-factory if you have the terminal version 3.10 or higher.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta/lib/oe/terminal.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 54e3ffc..a02638f 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -55,6 +55,17 @@ class Gnome(XTerminal):
     command = 'gnome-terminal -t "{title}" --disable-factory -x {command}'
     priority = 2
 
+    def __init__(self, sh_cmd, title=None, env=None, d=None):
+        # Check version
+        vernum = check_konsole_version("gnome-terminal")
+        if vernum:
+            major = int(vernum.split('.')[0])
+            minor = int(vernum.split('.')[1])
+            if major >= 3 and minor >= 10:
+                logger.warn(1, 'Gnome-Terminal >3.10 does not support --disable-factory')
+                self.command = 'gnome-terminal -t "{title}" -x {command}'
+        XTerminal.__init__(self, sh_cmd, title, env, d)
+
 class Mate(XTerminal):
     command = 'mate-terminal -t "{title}" -x {command}'
     priority = 2
@@ -235,6 +246,8 @@ def check_konsole_version(konsole):
     for ver in ver_info:
         if ver.startswith('Konsole'):
             vernum = ver.split(' ')[-1]
+	if ver.startswith('GNOME Terminal'):
+            vernum = ver.split(' ')[-1]
     return vernum
 
 def distro_name():
-- 
1.9.3


