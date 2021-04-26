Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.921.1619398436071444216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TGZNu37ftEeIogvmiCIMkLKZMAbGdcdeasDBOegD4P+KEYhboMHzHbIuM5fudzIoNuA67934Zc
 dcccIixnFG/Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="196323414"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="196323414"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:53:56 -0700
IronPort-SDR: 3jyOO1eYptN7LI6KXnev0ej534IVFBwJ5DVt410Hh6TPtUjrLbTUcKm/vOAzyb6kUVFsPk0Gee
 6BV7m10wb9Ew==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067215"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:53:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/64] lib/oe/terminal: Fix tmux new-session on older tmux versions (<1.9)
Date: Mon, 26 Apr 2021 08:52:32 +0800
Message-Id: <d049d7413b72c22388693b71c5901b2283f83df9.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Budny <pbbudny@amazon.com>

`tmux new -c` fails on tmux older than 1.9, when that flag was added.
We can omit the flag for older versions of tmux, and the working
directory gets set even without it.

Signed-off-by: Peter Budny <pbbudny@amazon.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c55c294be6f5119f4c58a4e7a0bc052904126569)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/terminal.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 61c2687ef4..59aa80de66 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -163,7 +163,12 @@ class Tmux(Terminal):
         # devshells, if it's already there, add a new window to it.
         window_name = 'devshell-%i' % os.getpid()
 
-        self.command = 'tmux new -c "{{cwd}}" -d -s {0} -n {0} "{{command}}"'.format(window_name)
+        self.command = 'tmux new -c "{{cwd}}" -d -s {0} -n {0} "{{command}}"'
+        if not check_tmux_version('1.9'):
+            # `tmux new-session -c` was added in 1.9;
+            # older versions fail with that flag
+            self.command = 'tmux new -d -s {0} -n {0} "{{command}}"'
+        self.command = self.command.format(window_name)
         Terminal.__init__(self, sh_cmd, title, env, d)
 
         attach_cmd = 'tmux att -t {0}'.format(window_name)
@@ -253,13 +258,18 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
         except OSError:
            return
 
+def check_tmux_version(desired):
+    vernum = check_terminal_version("tmux")
+    if vernum and LooseVersion(vernum) < desired:
+        return False
+    return vernum
+
 def check_tmux_pane_size(tmux):
     import subprocess as sub
     # On older tmux versions (<1.9), return false. The reason
     # is that there is no easy way to get the height of the active panel
     # on current window without nested formats (available from version 1.9)
-    vernum = check_terminal_version("tmux")
-    if vernum and LooseVersion(vernum) < '1.9':
+    if not check_tmux_version('1.9'):
         return False
     try:
         p = sub.Popen('%s list-panes -F "#{?pane_active,#{pane_height},}"' % tmux,
-- 
2.30.2

