Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6EFCC6B230
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 18:20:51 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id n7so5686435lam.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 10:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=ImB+qGi41YKRqpG+/QfY4CsHsryocNeOkEsvjOQr1BQ=;
	b=fdyPF4KuISarF4dUa1rjAJPEpHD1qeXSDIzykDCL+g/gTRvJ4TAnOj/IxZ46Psev0g
	fhNB63BaS7muiZBzD0UwKRXv6urdc9u2+h5TxaKUcAjat6hiHN1akyILnXP556jnwsBP
	GEJDGwvMJdSXKm3RzO+zXBVwaY7jiVZr5zR06koQA6QlH8gfC/RnVbYWxhbuucPJwUC0
	GLNQo6mitj1WlrtIpM5jWs3/lJITVBT6kiXUMsfnnxMEGlIMCWH2n/xvBTRlo1mF88ji
	eZrcm0ac92V4wphwO3t20L+mlBQOw+AcRmukRc8y7S/Z6e6Vr1VpuP0BR6yVIYFi7did
	U+1g==
X-Received: by 10.152.23.39 with SMTP id j7mr15439833laf.28.1388427651442;
	Mon, 30 Dec 2013 10:20:51 -0800 (PST)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72]) by mx.google.com with ESMTPSA id
	sd11sm36356857lab.2.2013.12.30.10.20.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Dec 2013 10:20:51 -0800 (PST)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2013 19:17:58 +0100
Message-Id: <1388427478-16741-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.8.4.2
Subject: [PATCH] meta/lib/oe/terminal.py: Don't pass non-supported '--disable-factory' flag to gnome-terminal
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
X-List-Received-Date: Mon, 30 Dec 2013 18:20:53 -0000

From the gnome-terminal manpage:
By default, all GNOME terminals share a single process,
reducing memory usage.  This can be disabled by starting gnome-terminal
with the --disable-factory option

However, gnome-terminal in Fedora 20 does no longer support the
'--disable-factory' flag, so remove it. As the support for 'mate' terminals was
added as a copy of the gnome code in 8cc078a9c679845464c59028f584d7aba098cc1f,
remove the flag here aswell.

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 meta/lib/oe/terminal.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index be2a26b..a33abd7 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -52,11 +52,11 @@ class XTerminal(Terminal):
             raise UnsupportedTerminal(self.name)
 
 class Gnome(XTerminal):
-    command = 'gnome-terminal --disable-factory -t "{title}" -x {command}'
+    command = 'gnome-terminal -t "{title}" -x {command}'
     priority = 2
 
 class Mate(XTerminal):
-    command = 'mate-terminal --disable-factory -t "{title}" -x {command}'
+    command = 'mate-terminal -t "{title}" -x {command}'
     priority = 2
 
 class Xfce(XTerminal):
-- 
1.8.4.2


