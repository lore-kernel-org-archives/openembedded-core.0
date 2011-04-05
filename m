Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7CvP-0007vu-Rw
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 22:32:31 +0200
Received: by ywg8 with SMTP id 8so325538ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 13:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=MuJF2kJV73a5w027kECpStQvG/c0rGnaVcE/cjVP9fM=;
	b=fuDhZH0NgTJoqz76KVSqRHQMepn7UNdJbigJyeju9Ne9H7Ylggf+7V5R9IfYUr2rml
	fgydZGi798CvBELOx25Yj6NRxvFq97bMIwdVOALhROhNN/ihfVDKXRzTtb0/oUxmflMp
	94Pu1yvVz6xS6fBoieQb0hZlU+kr/cqIfyEi4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=S0oE9z2QnOMUcci2QuhGdEpJ9eX8p2cEdzumeknZH+z5V+UdfXsRRoLoA/dpICFj8c
	nl/0Y3HFoWNltMaP2ifnq1lxxiBsDhS8STtSDtiHdOyS0OzUCWzDD0BDqxboXwOTFibg
	K5tteKG9UdePtWP7zx8caas+3lUnOTeduMVBE=
Received: by 10.150.63.4 with SMTP id l4mr968928yba.337.1302035424993;
	Tue, 05 Apr 2011 13:30:24 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id q18sm282484ybk.26.2011.04.05.13.30.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 13:30:24 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 13:30:15 -0700
Message-Id: <e8fe9dbbda23e705e780d98daef050dbbe69a6ca.1302034944.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302034944.git.chris_larson@mentor.com>
References: <cover.1302034944.git.chris_larson@mentor.com>
In-Reply-To: <cover.1302034944.git.chris_larson@mentor.com>
References: <cover.1302034944.git.chris_larson@mentor.com>
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
X-List-Received-Date: Tue, 05 Apr 2011 20:32:32 -0000

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
index 5336167..bbff8d0 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -71,7 +71,12 @@ class Rxvt(XTerminal):
     priority = 1
 
 class Screen(Terminal):
-    command = 'screen -D -m -t "{title}" {command}'
+    command = 'screen -D -m -t "{title}" -S devshell {command}'
+
+    def __init__(self, command, title=None):
+        Terminal.__init__(self, command, title)
+        logger.warn('Screen started. Please connect in another terminal with '
+                    '"screen -r devshell"')
 
 
 def prioritized():
-- 
1.7.4.1



