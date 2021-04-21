Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.8497.1618985195073168650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 23:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: In0MEGSxdZ+MbWOl3K+SHLHE3zUhq0/B16b/XSatWtkH2hqKcv+iEP1wPQ8TmJ8gPvuMPPMNnx
 6L4KvaKB2z7Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="195671497"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="195671497"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:34 -0700
IronPort-SDR: OiPaMvI50je148K4JmV5Q29KL7MAuwP0D6cZSDwU0VnKghXSIUuo0dTjbNMjzhPpcQTfCEyPuK
 3pPhHFz7pXpQ==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="385684412"
Received: from slow4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.70.252])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:33 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 2/8] lib/oe/terminal: Fix tmux new-session on older tmux versions (<1.9)
Date: Wed, 21 Apr 2021 14:06:14 +0800
Message-Id: <f1a5ca0b833e3f5bc7e4ccf8d75f0c5296fa9ea5.1618984878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618984878.git.anuj.mittal@intel.com>
References: <cover.1618984878.git.anuj.mittal@intel.com>
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
index eb10a6e33e..2ac39df9e1 100644
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

