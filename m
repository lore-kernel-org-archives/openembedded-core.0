Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qh4L1-0005QW-IV
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 20:39:11 +0200
Received: by gyd12 with SMTP id 12so2673810gyd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 11:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1wm+2VcffmVwyBcldQcBYEmnefda9g6NzDFdVFFDvYY=;
	b=mIxebilk3ws8lxK1pU2TFUoQgHiLR4QBtyOmnn39JxkvC3mNb08kjIrD1dltCQIqvN
	rhEw5sH9J8iCEnYEiQC9daVCcNuakE2qj7PMwQdNdaHsKN8IgUh5o7i9bQpfGPx7x/yl
	68LpsLYhaCxNSu0XvJvfHA3eInLYyB8e5nye8=
Received: by 10.236.78.225 with SMTP id g61mr1908315yhe.37.1310582112577;
	Wed, 13 Jul 2011 11:35:12 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id v25sm7845069yhk.8.2011.07.13.11.35.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jul 2011 11:35:12 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 11:35:04 -0700
Message-Id: <34a4a1869a20261afa33c6e9dc076161a5b4bfde.1310581914.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1310581914.git.kergoth@gmail.com>
References: <cover.1310581914.git.kergoth@gmail.com>
In-Reply-To: <cover.1310581914.git.kergoth@gmail.com>
References: <cover.1310581914.git.kergoth@gmail.com>
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
X-List-Received-Date: Wed, 13 Jul 2011 18:39:11 -0000

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
1.7.5.4



