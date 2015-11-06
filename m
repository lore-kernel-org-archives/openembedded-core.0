Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4A53E77029
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 23:22:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Nov 2015 15:22:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,254,1444719600"; d="scan'208";a="845143239"
Received: from lsandov1-mobl-linux.zpn.intel.com ([10.219.5.145])
	by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2015 15:22:42 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 17:25:08 -0600
Message-Id: <1446852308-19752-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2] terminal: Open a new window instead of split on older tmux versions (<1.9)
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
X-List-Received-Date: Fri, 06 Nov 2015 23:22:46 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

If an old version is detected (<1.9), create a new window instead of split:
the reason is that there is no easy way to get the active pane height if no
nested formats are supported.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oe/terminal.py |   20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 52a8913..a4a8c97 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -131,7 +131,7 @@ class TmuxRunning(Terminal):
             raise UnsupportedTerminal('tmux is not running')
 
         if not check_tmux_pane_size('tmux'):
-            raise UnsupportedTerminal('tmux pane too small')
+            raise UnsupportedTerminal('tmux pane too small or tmux < 1.9 version is being used')
 
         Terminal.__init__(self, sh_cmd, title, env, d)
 
@@ -218,6 +218,12 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
 
 def check_tmux_pane_size(tmux):
     import subprocess as sub
+    # On older tmux versions (<1.9), return false. The reason
+    # is that there is no easy way to get the height of the active panel
+    # on current window without nested formats (available from version 1.9)
+    vernum = check_terminal_version("tmux")
+    if vernum and LooseVersion(vernum) < '1.9':
+        return False
     try:
         p = sub.Popen('%s list-panes -F "#{?pane_active,#{pane_height},}"' % tmux,
                 shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
@@ -229,14 +235,16 @@ def check_tmux_pane_size(tmux):
             return None
         else:
             raise
-    if size/2 >= 19:
-        return True
-    return False
+
+    return size/2 >= 19
 
 def check_terminal_version(terminalName):
     import subprocess as sub
     try:
-        p = sub.Popen(['sh', '-c', '%s --version' % terminalName],stdout=sub.PIPE,stderr=sub.PIPE)
+        cmdversion = '%s --version' % terminalName
+        if terminalName.startswith('tmux'):
+            cmdversion = '%s -V' % terminalName
+        p = sub.Popen(['sh', '-c', cmdversion], stdout=sub.PIPE,stderr=sub.PIPE)
         out, err = p.communicate()
         ver_info = out.rstrip().split('\n')
     except OSError as exc:
@@ -251,6 +259,8 @@ def check_terminal_version(terminalName):
             vernum = ver.split(' ')[-1]
         if ver.startswith('GNOME Terminal'):
             vernum = ver.split(' ')[-1]
+        if ver.startswith('tmux'):
+            vernum = ver.split()[-1]
     return vernum
 
 def distro_name():
-- 
1.7.10.4


