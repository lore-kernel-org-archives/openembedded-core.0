Received: from mail-ie0-f182.google.com ([209.85.223.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UNv2d-0006iM-Om
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 03:02:53 +0200
Received: by mail-ie0-f182.google.com with SMTP id at1so3727747iec.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 17:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=b2Y/Nvhi/eNiDfFWddtdD8za8rNGbRDSN1657j7cvFc=;
	b=fBmt3U4dtUCArUCQo4qvCFuTeoZVSP3d2IxvyKz0AhSwlodR07zljHvwFX5UW3A/5a
	oK2tprhpdBKqQczrx22SU32Ms0DNieSedyh/u+WUfwdpqOPbZqoHILr4qdIJtuRzsoqK
	y8uo1aR31Go6KmocCEfZ2mT36p7ffqAFLHHv6bPgJsv1FtemejtqAoGli4QT3s6cftX1
	88diFFPjYqh0MhAucaDOVbCMXp2cYZm0WHe2m2Z0mzcJYlut1oSCA47De19TgDKwcnvl
	YIJLddVPa6Z2mwBqNdeNGd4yzzK1Z1HaGpk5kc1toSlCH9ux2EwFeayza+kW9+ZfC+JO
	LlkA==
X-Received: by 10.43.65.195 with SMTP id xn3mr4363054icb.5.1365122693750;
	Thu, 04 Apr 2013 17:44:53 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id vb15sm416236igb.9.2013.04.04.17.44.51
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 17:44:52 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 17:44:43 -0700
Message-Id: <1365122683-17652-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.2
In-Reply-To: <1365101122-15705-1-git-send-email-kergoth@gmail.com>
References: <1365101122-15705-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv3] oe.terminal: add tmux classes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 01:02:55 -0000

From: Christopher Larson <chris_larson@mentor.com>

This adds two new Terminal classes. It's separated into two, so that opening
a split inside a tmux window is preferred to the other terminal types, but
opening a tmux session is prioritized only slightly higher than screen.

- tmuxrunning: Open a new pane in the current running tmux window. Requires
  that the TMUX variable be added to the env whitelist to use it.
- tmux: Open a new tmux session

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/lib/oe/terminal.py | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 2e23d59..e52863f 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -142,6 +142,44 @@ class TmuxNewSession(Terminal):
         else:
             logger.warn(msg)
 
+class TmuxRunning(Terminal):
+    """Open a new pane in the current running tmux window"""
+    name = 'tmux-running'
+    command = 'tmux split-window {command}'
+    priority = 2.75
+
+    def __init__(self, sh_cmd, title=None, env=None, d=None):
+        if not bb.utils.which(os.getenv('PATH'), 'tmux'):
+            raise UnsupportedTerminal('tmux is not installed')
+
+        if not os.getenv('TMUX'):
+            raise UnsupportedTerminal('tmux is not running')
+
+        Terminal.__init__(self, sh_cmd, title, env, d)
+
+class Tmux(Terminal):
+    """Start a new tmux session and window"""
+    command = 'tmux new -d -s devshell -n devshell {command}'
+    priority = 0.75
+
+    def __init__(self, sh_cmd, title=None, env=None, d=None):
+        if not bb.utils.which(os.getenv('PATH'), 'tmux'):
+            raise UnsupportedTerminal('tmux is not installed')
+
+        # TODO: consider using a 'devshell' session shared amongst all
+        # devshells, if it's already there, add a new window to it.
+        window_name = 'devshell-%i' % os.getpid()
+
+        self.command = 'tmux new -d -s {0} -n {0} {{command}}'.format(window_name)
+        Terminal.__init__(self, sh_cmd, title, env, d)
+
+        attach_cmd = 'tmux att -t {0}'.format(window_name)
+        msg = 'Tmux started. Please connect in another terminal with `tmux att -t {0}`'.format(window_name)
+        if d:
+            bb.event.fire(bb.event.LogExecTTY(msg, attach_cmd, 0.5, 10), d)
+        else:
+            logger.warn(msg)
+
 class Custom(Terminal):
     command = 'false' # This is a placeholder
     priority = 3
-- 
1.8.2



