Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QgKKV-0005kI-5F
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 19:31:35 +0200
Received: by yib18 with SMTP id 18so1691397yib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=cQyD6BjyD830aa2o4JkpOp8QIsjYs+XOmTIW7I/kvXM=;
	b=ca7ntl7kwWX7Rxufylt4YgVODG7gAwjTS4bE2BKXko/EjGqaDiGIn5jDYe3o2H+RqS
	40CjU9iX93RADNI+1W23OWikir4/c/DXmqiXTP8vgZh2bql3Jn2hIJkS2vDJIPPatoTI
	L2QznpsiBoxWT+7VPkpdre4YaVGLT3HBG/gjU=
Received: by 10.147.163.16 with SMTP id q16mr4084143yao.19.1310405258420;
	Mon, 11 Jul 2011 10:27:38 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id z28sm3592901yhn.35.2011.07.11.10.27.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jul 2011 10:27:37 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 17:27:16 +0000
Message-Id: <42d873dde25e271205387d50fe044a0caf361703.1310405202.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1310405202.git.otavio@ossystems.com.br>
References: <cover.1310405202.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1310405202.git.otavio@ossystems.com.br>
References: <cover.1310405202.git.otavio@ossystems.com.br>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/5] oe.terminal: improve how we spawn screen
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
X-List-Received-Date: Mon, 11 Jul 2011 17:31:35 -0000

From: Chris Larson <chris_larson@mentor.com>

- Name the screen session 'devshell', to avoid confusion if running bitbake
  itself under a screen session.
- Display a warning message when spawning screen, so it's clear to the user
  that screen has been run (otherwise do_devshell just appears to hang).

Signed-off-by: Chris Larson <chris_larson@mentor.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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
1.7.2.5



