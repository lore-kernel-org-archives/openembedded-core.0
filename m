Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QXaSU-0004a0-RK
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 16:55:43 +0200
Received: by yib18 with SMTP id 18so1414284yib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 07:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=cQyD6BjyD830aa2o4JkpOp8QIsjYs+XOmTIW7I/kvXM=;
	b=o+qqgtHhDOIn/e4uPmBU6EF7tMd1xRl1/N0okzVL9w8OvGaWcTK2aad4DMQ66V9BCC
	fc22yWHEctYrD2sjEInLTGMsnYhy2LixIS2aUbwNiO0ujk7GZkaodUX6vNhPgz1luIZf
	51/345nHGdtx8CAC9GQLuscWnEDiJOu9Bm74w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=XtvLBd8A3jqp+niApvUiMZT8HD0ToMbZNlmsKbxEJ0Zp/zPoHDIxiK+BfTlyUXW23b
	KUiNBfT+UEUK/84Kh33g7S93ZwThozLKxn/uRx//vjZF9ymQ9bc9HnyESPd6P5TlZMTC
	ou/99oI1j/Rbzs+Jg3CptqB6Eqivhfjd91MhQ=
Received: by 10.236.28.201 with SMTP id g49mr3289675yha.462.1308322333058;
	Fri, 17 Jun 2011 07:52:13 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k10sm1754092yhj.50.2011.06.17.07.52.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 07:52:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2011 14:51:37 +0000
Message-Id: <12a4d3ecd321fa7c334b1499317b8368305514c9.1308322247.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1308322247.git.otavio@ossystems.com.br>
References: <cover.1308322247.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1308322247.git.otavio@ossystems.com.br>
References: <cover.1308322247.git.otavio@ossystems.com.br>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/9] oe.terminal: improve how we spawn screen
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
X-List-Received-Date: Fri, 17 Jun 2011 14:55:43 -0000

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



