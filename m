Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMkQn-0005do-Q4
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:21:09 +0200
Received: by pxi6 with SMTP id 6so1356850pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 10:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=R/FS8SchsBFyEbw4TsTgz4rcA4sXtm02NBAq/p+Je9I=;
	b=u2W6B0fal1jtaO7tdxWgU1cuPxYnxHgo1vt4ArxF6h3y3SNQm7fDPJQp3i7RlUykIr
	8XO43xH5Fm0PqAVZGXDgdOKhBTU87ugmcDboQRTRCwBmGSex8EJ0KkWcwqv+3hsFvOLL
	5X7/dex/6C1vxoc+Pgory878RA/kE8a0VMjbw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=yDEWDD5Ji2OwqTVsXm/C+nuMrypNXf7Qf15Fec8l15tB1XWvXOW8PYHI8GkHlFX01V
	rbY6t4q9JBQ7P14ICefWbg1y9UE/KGMhKB/Crp02D5vONov8XixhXIWlP1tUbHbDPTYa
	+2EFFnuf8E7dTA4TWN9ZocUEkPyuxObZriuGQ=
Received: by 10.143.39.17 with SMTP id r17mr1191545wfj.113.1305739093924;
	Wed, 18 May 2011 10:18:13 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id 25sm1550869wfb.10.2011.05.18.10.18.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 10:18:13 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 10:18:01 -0700
Message-Id: <c83179c592607a1796f5944cd2a3184aece9b341.1305737923.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305737923.git.chris_larson@mentor.com>
References: <cover.1305737923.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305737923.git.chris_larson@mentor.com>
References: <cover.1305737923.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH (v2, resend) 3/3] oe.terminal: improve how we spawn screen
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
X-List-Received-Date: Wed, 18 May 2011 17:21:10 -0000

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
index e14fc5d..4fd281c 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -74,7 +74,12 @@ class Rxvt(XTerminal):
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
1.7.1



