Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7Be5-0006B6-4h
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 21:10:34 +0200
Received: by yxn22 with SMTP id 22so291498yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 12:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=qaUMalLKe05WSV6Hhzcz/KmWAtS0DIU5c35TolW9TSA=;
	b=jDRfhXvzY0QVRW1Jl+f0R+17wZlCpjxvsTfUMXx3hvk3CIXTwW9RT8a3/oP2BbxJQL
	jcOqqsNzah3hqTs6ZeDQAJtBgku532mG+eL3+lxD78oZgBAuyQ32FKtQG0gSIWcNS9td
	nThoJlcbUlJlScDiCtu4BZ3uaS6jYMx/BdMwk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=owy4S3zYYiPqxIsWcHmbhRn8cBPCCzH7xL8l6/qvwuKpMNre1trEaXoVRAbiuWueRs
	Tk8tMzmyZ1gL9flyfDpkRGBF2NN5fJkdPq7Lf+pcXlg0wPglkMgYjamDSMr/BEAx5rwP
	jbkG0C6sBWA2/7MXH5EWnhtrp/HcguBpFQqJQ=
Received: by 10.151.148.5 with SMTP id a5mr878279ybo.353.1302030501266;
	Tue, 05 Apr 2011 12:08:21 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id x28sm2974573yhc.81.2011.04.05.12.08.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 12:08:20 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 12:08:07 -0700
Message-Id: <982144c56f216da099f77847abae4cbbf2fcb643.1302030219.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302030219.git.chris_larson@mentor.com>
References: <cover.1302030219.git.chris_larson@mentor.com>
In-Reply-To: <cover.1302030219.git.chris_larson@mentor.com>
References: <cover.1302030219.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] oe.terminal: improve how we spawn screen
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
X-List-Received-Date: Tue, 05 Apr 2011 19:10:34 -0000

From: Chris Larson <chris_larson@mentor.com>

- Name the screen session 'devshell', to avoid confusion if running bitbake
  itself under a screen session.
- Display a warning message when spawning screen, so it's clear to the user
  that screen has been run (otherwise do_devshell just appears to hang).

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/lib/oe/terminal.py |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 8c8e5b2..a94b113 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -68,7 +68,12 @@ class Rxvt(XTerminal):
     priority = 1
 
 class Screen(Terminal):
-    cmd = 'screen -D -m -t "{title}" {cmd}'
+    cmd = 'screen -D -m -t "{title}" -S devshell {cmd}'
+
+    def __init__(self, cmd, title=None):
+        logger.warn('Screen started. Please connect in another terminal with '
+                    '"screen -r devshell"')
+        Terminal.__init__(self, cmd, title)
 
 
 def prioritized():
-- 
1.7.4.1



