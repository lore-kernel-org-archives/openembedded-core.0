Received: from mail-ob0-f177.google.com ([209.85.214.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UNpQs-00008T-6y
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 21:02:54 +0200
Received: by mail-ob0-f177.google.com with SMTP id uz6so2855125obc.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 11:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=KYb1Zr6dhtMYgGAlDlvBdtBB0JJQt5zX6nG24cq1IWQ=;
	b=WG0+M0UTp1n/W6jmXI0RoJHwiwkueFgfj6Q4rIkBjoc29bE4FpoXqPrYfIAAGJ9v8i
	go4KMvlN6oYzR9uJk7VXFMo4ht156lxNyzoWvfnI2f4UpQU+AMYAun8KgMBnS+btj6jp
	G1GNK1mVd4MldsE6HOvxmN91qZg0JdMS31LMrc/P3ZAvSBGOsuHf0gFfbruPtWlG+CC3
	ACjpyXXwBqWM+lBXne+fxqkPbeNQLL4MSXIgYFCtB/Lpkxq7n10x1Cdtin2RMswDVpTZ
	h2K/xuTwXkLAhDjf0dGNeiZLGEMFD17SdBxYQNLZ/s2kGxrW4UZE8KxILUeE1mCDSLJE
	tOXA==
X-Received: by 10.60.134.234 with SMTP id pn10mr2274256oeb.0.1365101132567;
	Thu, 04 Apr 2013 11:45:32 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id m7sm7833463obk.2.2013.04.04.11.45.30
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 11:45:31 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 11:45:22 -0700
Message-Id: <1365101122-15705-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.2
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2] oe.terminal: add tmux classes
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
X-List-Received-Date: Thu, 04 Apr 2013 19:02:57 -0000

From: Christopher Larson <chris_larson@mentor.com>

This adds two new Terminal classes. It's separated into two, so that opening
a split inside a tmux window is preferred to the other terminal types, but
opening a tmux session is prioritized only slightly higher than screen.

- tmuxrunning: Open a new pane in the current running tmux window. Requires
  that the TMUX variable be added to the env whitelist to use it.
- tmux: Open a new tmux session

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/lib/oe/terminal.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 4c1e318..2e23d59 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -105,6 +105,43 @@ class Screen(Terminal):
         else:
             logger.warn(msg)
 
+class TmuxRunning(Terminal):
+    """Open a new pane in the current running tmux window"""
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
+class TmuxNewSession(Terminal):
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



