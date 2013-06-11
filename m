Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76D616AA07
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 14:28:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5BES4F8027040
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 07:28:05 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 11 Jun 2013 07:28:04 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jun 2013 09:28:03 -0500
Message-ID: <60d56973a8e878bb7ed5dacb2593ffad78977cc4.1370960556.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1370960556.git.peter.seebach@windriver.com>
References: <cover.1370960556.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] handle two-word commands with tmux
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
X-List-Received-Date: Tue, 11 Jun 2013 14:28:04 -0000
Content-Type: text/plain

Trying to make a devshell using tmux can fail because "tmux new"
expects a single command, not a series of arguments. It does, however,
split strings in a suitable way. So you can quote the command.

The failure mode is particularly arcane, in that you end up
with a message like:

	ERROR: Unable to spawn terminal auto: \
	Execution of 'pseudo /bin/bash' failed with exit code 1:
	usage: new-session [-d] [-n window-name] [-s session-name] \
	[-t target-session] [command]

which is confusing because there's no "new-session" anywhere in
sight (that's actually "tmux new"), and because what failed to execute
wasn't either pseudo or bash.
---
 meta/lib/oe/terminal.py |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 28470e3..25f8004 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -122,7 +122,7 @@ class TmuxRunning(Terminal):
 
 class Tmux(Terminal):
     """Start a new tmux session and window"""
-    command = 'tmux new -d -s devshell -n devshell {command}'
+    command = 'tmux new -d -s devshell -n devshell "{command}"'
     priority = 0.75
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
@@ -133,7 +133,7 @@ class Tmux(Terminal):
         # devshells, if it's already there, add a new window to it.
         window_name = 'devshell-%i' % os.getpid()
 
-        self.command = 'tmux new -d -s {0} -n {0} {{command}}'.format(window_name)
+        self.command = 'tmux new -d -s {0} -n {0} "{{command}}"'.format(window_name)
         Terminal.__init__(self, sh_cmd, title, env, d)
 
         attach_cmd = 'tmux att -t {0}'.format(window_name)
-- 
1.7.0.4


