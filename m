Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QfBTM-0007MN-9s
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 15:52:00 +0200
Received: by gxk3 with SMTP id 3so831351gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 06:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=cQyD6BjyD830aa2o4JkpOp8QIsjYs+XOmTIW7I/kvXM=;
	b=l7hse66QPhHyUZnO1zSieROLmfi+vsudXgz/c3Ax5IkvXOfj6zxbj+UQS/GN28IXgY
	/8MAxfrT830Jcq7qamxbcfqysgjXVZk/031FCdDGwGOeYukuKbUDX7czCRcYiqt+8h+a
	kvjnMJ4eP7SBQizBfHJYVTQAlN2EhuOEQnwh4=
Received: by 10.150.91.17 with SMTP id o17mr1649027ybb.303.1310132887313;
	Fri, 08 Jul 2011 06:48:07 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id p50sm2650140yhj.0.2011.07.08.06.48.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 06:48:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 13:47:41 +0000
Message-Id: <c0196cd5ca7ca5c3d6ea446f6a81e36198e9b0a3.1310132765.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/8] oe.terminal: improve how we spawn screen
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
X-List-Received-Date: Fri, 08 Jul 2011 13:52:00 -0000

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



