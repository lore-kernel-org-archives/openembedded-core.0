Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UNpNH-0007rD-I8
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 20:59:06 +0200
Received: by mail-pa0-f50.google.com with SMTP id bg2so1604628pad.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 11:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=AjmLSMfSbJsNUUKuW0AnMZy1UT0h8Pm8yCqfEdtKXoY=;
	b=DdJqSlttIKRQ48vvcX00I7qteYhW7UR6ZDRBcSS+C95HBgQL8ziJCSjV0QfdS2UwCy
	U/+OClpcaNiQ71FwWtA3OIuJP2VF/HI0YKH8LuCF8Nb8FztB/WZQOifFQiC2XPP/WbYT
	dF7NtdJYaOgIlrcUvuh6d/EfdBO76uhiORkBfsLXPyN3AQbk1T8BplvKm0ITYzltZ8rZ
	zOYb4P5Mm4SOJXmvT7p89hm6hQ1EjWqcqW2LHagNP7cQ4QaEGGUNmvgFrzT78IMm5Npm
	OkieA+O7Y9eHW1y/VZVrxxNGb0ltMNSRveav/24xlmWQq6WdPREQjJSDt0KUNnVwLKbf
	Ej9w==
X-Received: by 10.66.250.230 with SMTP id zf6mr11155116pac.153.1365100909812; 
	Thu, 04 Apr 2013 11:41:49 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id kb3sm11132683pbc.21.2013.04.04.11.41.46
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 11:41:48 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 11:41:37 -0700
Message-Id: <1365100897-14142-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.2
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] oe.terminal: add tmux classes
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
X-List-Received-Date: Thu, 04 Apr 2013 18:59:09 -0000

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
index 4c1e318..b271de6 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -105,6 +105,44 @@ class Screen(Terminal):
         else:
             logger.warn(msg)
 
+class TmuxRunning(Terminal):
+    """Open a new pane in the current running tmux window"""
+    priority = 2.75
+    name = 'tmux-running'
+    command = 'tmux split-window {command}'
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
+    priority = 0.5
+    name = 'tmux'
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



