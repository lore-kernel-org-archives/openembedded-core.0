Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QqqpS-0003Uf-SV
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 20:15:03 +0200
Received: by ywe9 with SMTP id 9so195208ywe.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 11:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=W1lUDjOuZWy5DgfJhIAOJ/GAA4NY2iQ2A+bn5L6ydpU=;
	b=V5ods6JCdLRPkUBKcivF9CFWFjiWZ0QBDPSwRFsdw8Ewx7FEIBj76lX2NWczsWpG3Y
	wH1xCNMSj1e6gm1qowREzpzM1B4M+NpfT+6Qwlvxw3a6MBAOJk/X5sq/qruS1qqRIgcO
	gedrTxq8PUB16R/+mO6WGFSn84zshVXbgXIFg=
Received: by 10.142.195.21 with SMTP id s21mr2375792wff.360.1312913432531;
	Tue, 09 Aug 2011 11:10:32 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id e6sm148739pbm.71.2011.08.09.11.10.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 11:10:31 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 11:06:00 -0700
Message-Id: <eb2be5e5a2cd0348ee06d25278d3622cfe0c31cb.1312903907.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1312903901.git.kergoth@gmail.com>
References: <cover.1312903901.git.kergoth@gmail.com>
In-Reply-To: <cover.1312903901.git.kergoth@gmail.com>
References: <cover.1312903901.git.kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] oe.terminal: improve how we spawn screen
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
X-List-Received-Date: Tue, 09 Aug 2011 18:15:03 -0000

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
index 3767935..3965462 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -70,7 +70,12 @@ class Rxvt(XTerminal):
     priority = 1
 
 class Screen(Terminal):
-    command = 'screen -D -m -t "{title}" {command}'
+    command = 'screen -D -m -t "{title}" -S devshell {command}'
+
+    def __init__(self, command, title=None, env=None):
+        Terminal.__init__(self, command, title, env)
+        logger.warn('Screen started. Please connect in another terminal with '
+                    '"screen -r devshell"')
 
 
 def prioritized():
-- 
1.7.5.4



