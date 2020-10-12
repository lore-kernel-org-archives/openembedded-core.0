Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.4385.1602524449921521594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 10:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: rhi@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1kS1oW-0005VB-8U; Mon, 12 Oct 2020 19:40:48 +0200
Received: from rhi by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1kS1oV-00027V-86; Mon, 12 Oct 2020 19:40:47 +0200
From: "Roland Hieber" <rhi@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Roland Hieber <rhi@pengutronix.de>
Subject: [PATCH] devtool: make sure .git/info exists before writing to .git/info/excludes
Date: Mon, 12 Oct 2020 19:40:38 +0200
Message-Id: <20201012174038.8096-1-rhi@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

If nothing else is specified, 'git init' uses its default repository
template from the install location (e.g. /usr/share/git-core/templates),
which already includes an info/ subdirectory. However, when setting
init.templateDir to a different template path in ~/.gitconfig, this
isn't necessarily the case, and it can lead to setup_git_repo() failing
with stack traces like:

    File: '.../scripts/lib/devtool/__init__.py', lineno: 234, function: setup_git_repo
         0230:        pass
         0231:    if 'singletask.lock\n' not in excludes:
         0232:        excludes.append('singletask.lock\n')
         0233:    bb.warn("try writing excludefile")
     *** 0234:    with open(excludefile, 'w') as f:
         0235:        for line in excludes:
         0236:            f.write(line)
         0237:
         0238:    bb.process.run('git checkout -b %s' % devbranch, cwd=repodir)
    Exception: FileNotFoundError: [Errno 2] No such file or directory: '.../devtooltmp-6m36b181/workdir/foobar-1.0.1/.git/info/exclude'

Fix this edge case by creating the .git/info/ directory first.

Fixes: 334ba846c795fc0d8c73 (2018-02-01, "devtool: set up git repos so that singletask.lock is ignored")
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
 scripts/lib/devtool/__init__.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 6ebe368a9eaf..702db669de32 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -212,8 +212,13 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
         bb.process.run(commit_cmd, cwd=repodir)
 
     # Ensure singletask.lock (as used by externalsrc.bbclass) is ignored by git
+    gitinfodir = os.path.join(repodir, '.git', 'info')
+    try:
+        os.mkdir(gitinfodir)
+    except FileExistsError:
+        pass
     excludes = []
-    excludefile = os.path.join(repodir, '.git', 'info', 'exclude')
+    excludefile = os.path.join(gitinfodir, 'exclude')
     try:
         with open(excludefile, 'r') as f:
             excludes = f.readlines()
-- 
2.28.0

