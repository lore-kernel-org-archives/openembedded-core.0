Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 46FEB719DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 02:31:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2016 18:31:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,640,1473145200"; d="scan'208";a="901427330"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga003.jf.intel.com with ESMTP; 14 Nov 2016 18:31:08 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 18:30:11 -0800
Message-Id: <20161115023011.85782-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161115023011.85782-1-stephano.cetola@linux.intel.com>
References: <20161115023011.85782-1-stephano.cetola@linux.intel.com>
Subject: [PATCH V3] devshell: list commands when throwing NoSupportedTerminals
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
X-List-Received-Date: Tue, 15 Nov 2016 02:31:07 -0000

When attempting to run devshell, if no terminal is available, the
error being thrown was not very specific. This adds a list of
commands that failed, informing the user of what they can install to
fix the error.

[ YOCTO #10472]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/terminal.bbclass |  8 ++++++--
 meta/lib/oe/terminal.py       | 13 +++++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index a94f755..cd8d124 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -88,8 +88,12 @@ def oe_terminal(command, title, d):
 
     try:
         oe.terminal.spawn_preferred(command, title, None, d)
-    except oe.terminal.NoSupportedTerminals:
-        bb.fatal('No valid terminal found, unable to open devshell')
+    except oe.terminal.NoSupportedTerminals as nosup:
+        nosup.terms.remove("false")
+        cmds = '\n\t'.join(nosup.terms).replace("{command}",
+                    "do_terminal").replace("{title}", title)
+        bb.fatal('No valid terminal found, unable to open devshell.\n' +
+                'Tried the following commands:\n\t%s' % cmds)
     except oe.terminal.ExecutionError as exc:
         bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
 
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 7446c44..38e66ce 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -11,7 +11,8 @@ class UnsupportedTerminal(Exception):
     pass
 
 class NoSupportedTerminals(Exception):
-    pass
+    def __init__(self, terms):
+        self.terms = terms
 
 
 class Registry(oe.classutils.ClassRegistry):
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


