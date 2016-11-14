Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 91B1E62134
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 21:46:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 14 Nov 2016 13:46:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,640,1473145200"; d="scan'208";a="901333592"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga003.jf.intel.com with ESMTP; 14 Nov 2016 13:46:13 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 13:45:17 -0800
Message-Id: <20161114214517.67709-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] devshell: list commands when throwing NoSupportedTerminals
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
X-List-Received-Date: Mon, 14 Nov 2016 21:46:13 -0000

When attempting to run devshell, if no terminal is available, the
error being thrown was not very specific. This adds a list of
commands that failed, informing the user of what they can install to
fix the error.

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/terminal.bbclass |  7 +++++--
 meta/lib/oe/terminal.py       | 15 ++++++++++++---
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index a94f755..5cfc7ac 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -88,8 +88,11 @@ def oe_terminal(command, title, d):
 
     try:
         oe.terminal.spawn_preferred(command, title, None, d)
-    except oe.terminal.NoSupportedTerminals:
-        bb.fatal('No valid terminal found, unable to open devshell')
+    except oe.terminal.NoSupportedTerminals as nosup:
+        cmds = '\n\t'.join(nosup.terms).replace("{command}",
+                    "do_terminal").replace("{title}", title)
+        bb.fatal('No valid terminal found, unable to open devshell.\n' +
+                'Tried the following commands:\n\t%s' % cmds)
     except oe.terminal.ExecutionError as exc:
         bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
 
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 7446c44..e772a37 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -11,7 +11,8 @@ class UnsupportedTerminal(Exception):
     pass
 
 class NoSupportedTerminals(Exception):
-    pass
+    def __init__(self, terms):
+        self.terms = terms
 
 
 class Registry(oe.classutils.ClassRegistry):
@@ -191,7 +192,7 @@ class Tmux(Terminal):
             logger.warn(msg)
 
 class Custom(Terminal):
-    command = 'false' # This is a placeholder
+    command = None # This is a placeholder
     priority = 3
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
@@ -209,6 +210,14 @@ class Custom(Terminal):
 def prioritized():
     return Registry.prioritized()
 
+def get_cmd_list():
+    terms = Registry.prioritized()
+    cmds = []
+    for term in terms:
+        if term.command:
+            cmds.append(term.command)
+    return cmds
+
 def spawn_preferred(sh_cmd, title=None, env=None, d=None):
     """Spawn the first supported terminal, by priority"""
     for terminal in prioritized():
@@ -218,7 +227,7 @@ def spawn_preferred(sh_cmd, title=None, env=None, d=None):
         except UnsupportedTerminal:
             continue
     else:
-        raise NoSupportedTerminals()
+        raise NoSupportedTerminals(get_cmd_list())
 
 def spawn(name, sh_cmd, title=None, env=None, d=None):
     """Spawn the specified terminal, by name"""
-- 
2.10.2


