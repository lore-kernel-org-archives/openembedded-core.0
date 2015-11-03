Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B84A971633
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 22:32:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 03 Nov 2015 14:32:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,240,1444719600"; d="scan'208";a="811069014"
Received: from lsandov1-mobl-linux.zpn.intel.com ([10.219.5.41])
	by orsmga001.jf.intel.com with ESMTP; 03 Nov 2015 14:31:59 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Nov 2015 16:34:14 -0600
Message-Id: <1446590054-31188-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: benoit.rapidel+yocto@exmachina.fr
Subject: [PATCH] terminal: Support old tmux version (<1.9) when querying height value
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
X-List-Received-Date: Tue, 03 Nov 2015 22:32:02 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Old tmux version (< 1.9) does not support nested formats on the -F parameter, so
if nested format does not give any answer, do the query in two steps.

Tested on tmux 1.6.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oe/terminal.py |   15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 52a8913..686b1ce 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -218,11 +218,24 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
 
 def check_tmux_pane_size(tmux):
     import subprocess as sub
+    size = 0
     try:
         p = sub.Popen('%s list-panes -F "#{?pane_active,#{pane_height},}"' % tmux,
                 shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
         out, err = p.communicate()
-        size = int(out.strip())
+        try:
+            size = int(out.strip())
+        except ValueError:
+            # Older tmux versions (< 1.9) does not support nested formats,
+            # so try it in two steps
+            p = sub.Popen('%s list-panes -F "#{?pane_active,yes,no}"' % tmux,
+                shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
+            out, err = p.communicate()
+            if "yes" in out.strip():
+                p = sub.Popen('%s list-panes -F "#{pane_height}"' % tmux,
+                              shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
+                out, err = p.communicate()
+                size = int(out.strip())
     except OSError as exc:
         import errno
         if exc.errno == errno.ENOENT:
-- 
1.7.10.4


