Return-Path: <danismostlikely@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8D38560169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 16:09:14 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id vy18so3085176iec.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Feb 2015 08:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=8xgCzx9f+ujMqowsz/5mnyU1XADdlksu8mAEjE0t0e0=;
	b=qmhPoZ26IC5EIEVaC79rB48u+SIiKcGChotow7kOJE8ztemnF6BLE7j6tryVupYs+F
	R9tQD94kPv6RV9bZ6Eq1GKPBuV/lRVGgAS2DuCrpor7xA9UAzR6zkhkxwk/bC8PVnP4j
	zUQijZbKYWmVW6Jfro31vlX5aFhPdJD/EffIY0BJXV5KN6gXfilps0o72ex0Yy9fx2H9
	950fUiNhD9EVeZdp9woHFZh0Czl1udaPEl+LXs1JWJM2mq9sYeXVRIyPihuHhLak0BTw
	VeBplDmyfkftwiPPZ57ynF/9M//dMbZAOupg0ixLa6cvOe7y96AwODWVZ6Nu/aBoiDdx
	Qi3A==
X-Received: by 10.50.44.43 with SMTP id b11mr3008203igm.30.1423066156092;
	Wed, 04 Feb 2015 08:09:16 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id g15sm1067481ioi.22.2015.02.04.08.09.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 08:09:15 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Feb 2015 10:09:12 -0600
Message-Id: <1423066153-24933-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 1/2] terminal.py: add tmux new window option
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
X-List-Received-Date: Wed, 04 Feb 2015 16:09:17 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Add a new terminal type that makes a new window in the running tmux
session instead of splitting the window. 80x25 is not enough to run
menuconfig inside a split window, so add the option to create a new
window instead.

Use the new window option by default when the split window would be
less than 19 lines high.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/lib/oe/terminal.py | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 17d0904..54e3ffc 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -116,6 +116,24 @@ class TmuxRunning(Terminal):
         if not os.getenv('TMUX'):
             raise UnsupportedTerminal('tmux is not running')
 
+        if not check_tmux_pane_size('tmux'):
+            raise UnsupportedTerminal('tmux pane too small')
+
+        Terminal.__init__(self, sh_cmd, title, env, d)
+
+class TmuxNewWindow(Terminal):
+    """Open a new window in the current running tmux session"""
+    name = 'tmux-new-window'
+    command = 'tmux new-window -n "{title}" "{command}"'
+    priority = 2.70
+
+    def __init__(self, sh_cmd, title=None, env=None, d=None):
+        if not bb.utils.which(os.getenv('PATH'), 'tmux'):
+            raise UnsupportedTerminal('tmux is not installed')
+
+        if not os.getenv('TMUX'):
+            raise UnsupportedTerminal('tmux is not running')
+
         Terminal.__init__(self, sh_cmd, title, env, d)
 
 class Tmux(Terminal):
@@ -184,6 +202,23 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
     if pipe.returncode != 0:
         raise ExecutionError(sh_cmd, pipe.returncode, output)
 
+def check_tmux_pane_size(tmux):
+    import subprocess as sub
+    try:
+        p = sub.Popen('%s list-panes -F "#{?pane_active,#{pane_height},}"' % tmux,
+                shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
+        out, err = p.communicate()
+        size = int(out.strip())
+    except OSError as exc:
+        import errno
+        if exc.errno == errno.ENOENT:
+            return None
+        else:
+            raise
+    if size/2 >= 19:
+        return True
+    return False
+
 def check_konsole_version(konsole):
     import subprocess as sub
     try:
-- 
2.1.0


