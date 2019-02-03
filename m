Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2AA6C3AD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Feb 2019 00:32:42 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x85-v6so8877772ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Feb 2019 16:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ScgkMe5qScgwXguf2jXZ3pT2CV9sqQq8yHhBHlISTCQ=;
	b=KZr5pKjcmfaIHZ/fzGpljvsyT8Py6voslawHm+cByKxvq74zUuLjP2aBQbS0W7RPQX
	bukzPL+zExtHRK7lgTLHKvjj0Lst71GHP0MTppsiwkOzYpyWgkRTiZnNbaBmdNqYYL9Q
	qndcG5kZQ4msbXCMD3bClkEPWbA5q8r1vEvme25syhGI29A/oGD7DqKGlqlDOPnin/AQ
	/lQ+4WskJqmhfWtf1cUF0UCKjS0yCz9Lf7vPOlyJs0UC3jvcR3Z9TmiQt/C57KPRsIDS
	mY1SDlMHMX+3BTAV4LuNUowftr6w3s8hD5nd7nSYLveE7sWKIRyL7Vj3izDnLWf/8PrX
	/9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ScgkMe5qScgwXguf2jXZ3pT2CV9sqQq8yHhBHlISTCQ=;
	b=KKC5WYTUbyQOeNj9YmWSdnu1L8VwtdTUH0ZMaC8b5AJsWFtaU43y4C5AXmB3P/b6tf
	vq1/+C1Lu5BooP+fROH6f4yrFFLykLFfdZzXf4kpw1C/SAjNdeYH6/CsQlKO3Ms7BOJJ
	2pK157LUoXvttVsclmtieq+7vLVIYC31gH/XAAmMJwpcn10DuxcuDLAWYIAkvj82OEB5
	oJ2aXP1IF7yneyRsM0RLu+H82nhyrdtNlAjKj4Mva4kEggL96X7Yn6sn3telo8ciELCQ
	CJAcmnKnSvVZjJ33d5LX77g6NxVphss7LWiO4VqHR/EUIzZ3ZcOpOEeSjW+4/gmbAg/m
	g+zw==
X-Gm-Message-State: AJcUukfPAr4O39s1/aoK3vv7r3sE4vx20b9cd2FueRclxHK/QhZCwZ1s
	m95fktR+/BTt9cLRFlUba+BV7EV/
X-Google-Smtp-Source: ALg8bN5QuG65ULdPFOQdzh+XxNlhQ/HNN2twM3N6nngQKNBKJvteSI7UkVB5WdJbNsAKznM6eX5vcg==
X-Received: by 2002:a2e:908b:: with SMTP id
	l11-v6mr35349930ljg.150.1549153962400; 
	Sat, 02 Feb 2019 16:32:42 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	y10-v6sm1972373ljy.65.2019.02.02.16.32.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 16:32:41 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2019 01:31:27 +0100
Message-Id: <20190203003127.4439-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] terminal: Fix working directory in tmux terminals
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Feb 2019 00:32:42 -0000
Content-Transfer-Encoding: 8bit

Recent version of tmux seems to use PWD from the environment instead of the
actual working directory. Help it use the correct path.

Fixes setting the correct working directory when running
devshell and menuconfig tasks.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/lib/oe/terminal.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index afbda595db..e4045559fc 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -39,7 +39,7 @@ class Terminal(Popen, metaclass=Registry):
                 raise
 
     def format_command(self, sh_cmd, title):
-        fmt = {'title': title or 'Terminal', 'command': sh_cmd}
+        fmt = {'title': title or 'Terminal', 'command': sh_cmd, 'cwd': os.getcwd() }
         if isinstance(self.command, str):
             return shlex.split(self.command.format(**fmt))
         else:
@@ -117,7 +117,7 @@ class Screen(Terminal):
 class TmuxRunning(Terminal):
     """Open a new pane in the current running tmux window"""
     name = 'tmux-running'
-    command = 'tmux split-window "{command}"'
+    command = 'tmux split-window -c "{cwd}" "{command}"'
     priority = 2.75
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
@@ -135,7 +135,7 @@ class TmuxRunning(Terminal):
 class TmuxNewWindow(Terminal):
     """Open a new window in the current running tmux session"""
     name = 'tmux-new-window'
-    command = 'tmux new-window -n "{title}" "{command}"'
+    command = 'tmux new-window -c "{cwd}" -n "{title}" "{command}"'
     priority = 2.70
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
@@ -149,7 +149,7 @@ class TmuxNewWindow(Terminal):
 
 class Tmux(Terminal):
     """Start a new tmux session and window"""
-    command = 'tmux new -d -s devshell -n devshell "{command}"'
+    command = 'tmux new -c "{cwd}" -d -s devshell -n devshell "{command}"'
     priority = 0.75
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
@@ -160,7 +160,7 @@ class Tmux(Terminal):
         # devshells, if it's already there, add a new window to it.
         window_name = 'devshell-%i' % os.getpid()
 
-        self.command = 'tmux new -d -s {0} -n {0} "{{command}}"'.format(window_name)
+        self.command = 'tmux new -c "{{cwd}}" -d -s {0} -n {0} "{{command}}"'.format(window_name)
         Terminal.__init__(self, sh_cmd, title, env, d)
 
         attach_cmd = 'tmux att -t {0}'.format(window_name)
-- 
2.20.1


