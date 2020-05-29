Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.675.1590789815251738136
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 15:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dQv8miM0;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id h4so5286524wmb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 15:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=baYCpBv99vVcUDmKJWkRVMl9XcBf+HArJnJCUOjZotg=;
        b=dQv8miM0V9HzSzBX4lX8kttDMUgN8IpPt5+vpmPY24w6kPAshxpjfNPxZRvihpQbzz
         XLLqGnuZwN27teAuyrdrkaMp44biNXM67UqxZDbS5dZK7dje/ZiKIbpegajXAEmGI88w
         YA+1XUOZ+2QWrGPIib424L0DyVdKFlPkmrKu09OsJt+34Hoz4VKx7RlH4xoSrFKUn02R
         m6k2JSR3eLaTdnf7zThKPNkGC+KhKzJ9Erh43yLD8y5suhrah8/cvBoWzc42DlAg5Pck
         LBKU7V5ppDTP1+Nzc6xCTqj4Cd/K7IrEKu87ZyrARGX3xZ/geIOrMLEybnz0M9Sh6/jb
         wmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=baYCpBv99vVcUDmKJWkRVMl9XcBf+HArJnJCUOjZotg=;
        b=Vf+XGwE3TQakjopJCbNAL0Ah3C4MwZCyP12Y45TiFi3J9kli8YXc42sdNRt/KXslxX
         aOi+AhCf9aIplM5DQ8BLjBca1EV53jAp6ek57X3QSGQOMIIlDVYzGAeyAP9Kzo/VA9qi
         8fJJ9x3gXAXyGQ36R6lY2o58GT64xqHrza/Nb4rIp53DC5cD15xzeL9D4hFXqaLBzEz9
         azQYGAVo/oARx51YSE1o2KZYXNxVNdLQrgEtOCA/w2U2s2TvBvc/8Unr3pJAPLNCOQc7
         O1zMjqvI4k4RHhFXxxTvY/VX146UvBUanmjMwRrIZMAkSvP+JDbynIpbQy9ibWmMf1XQ
         lNtA==
X-Gm-Message-State: AOAM5330STIb106kNWZOJFu1JweasuZ9y1DPFS2Ak9U1JW2ixijYZ9Hv
	fci2tgOHc8y6W+edbC0xlbclKCPr
X-Google-Smtp-Source: ABdhPJzaeElvxQID6z7HzM5A9X4r/1sAAbpy7lFkhNwmtiPY3xw8co/2mwj8bR1b/bdda5wE8O6iSg==
X-Received: by 2002:a7b:cd96:: with SMTP id y22mr10544211wmj.56.1590789813411;
        Fri, 29 May 2020 15:03:33 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c16sm5551425wrx.4.2020.05.29.15.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 15:03:32 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/6] devtool: use -f and don't use --exclude-standard when adding files to workspace
Date: Sat, 30 May 2020 00:03:23 +0200
Message-Id: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* I see a case where a tarball contains .gitignore and bunch of files
  which are normally ignored in git, but still included in the tarball
  (e.g. configure script next to configure.ac)
* when devtool is creating a git repo in workspace it won't include these
  files from tarball in the initial devtool-base commit, because
  git ls-files won't list them
* but then the first .patch file (without git headers) when applied with
  GitApplyTree._applypatch() will add all these still ignored files to a
  commit which used to only modify some files, because it's using -f:
      # Add all files
      shellcmd = ["git", "add", "-f", "-A", "."]
      output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
  at least in this case it would be better to add all ignored files in
  the initial devtool-base commit and then --force-patch-refresh will just
  include the small modification as before instead of adding unrelated
  files, just because they were initially ignored - this behavior will
  also match with the do_patch task in the actual build where the
  .gitignore is ignored when unpacking some tarball
* my use-case is fixed in setup_git_repo, but similar function is in
  devtool upgrade, I've changed it there as well

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/lib/devtool/__init__.py | 2 +-
 scripts/lib/devtool/upgrade.py  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index d39c474fbd..6ebe368a9e 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -196,7 +196,7 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
     if not os.path.exists(os.path.join(repodir, '.git')):
         bb.process.run('git init', cwd=repodir)
         bb.process.run('git config --local gc.autodetach 0', cwd=repodir)
-        bb.process.run('git add .', cwd=repodir)
+        bb.process.run('git add -f -A .', cwd=repodir)
         commit_cmd = ['git']
         oe.patch.GitApplyTree.gitCommandUserOptions(commit_cmd, d=d)
         commit_cmd += ['commit', '-q']
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index f962a71e41..ebe72282bb 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -235,14 +235,14 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
         # Copy in new ones
         _copy_source_code(tmpsrctree, srctree)
 
-        (stdout,_) = __run('git ls-files --modified --others --exclude-standard')
+        (stdout,_) = __run('git ls-files --modified --others')
         filelist = stdout.splitlines()
         pbar = bb.ui.knotty.BBProgress('Adding changed files', len(filelist))
         pbar.start()
         batchsize = 100
         for i in range(0, len(filelist), batchsize):
             batch = filelist[i:i+batchsize]
-            __run('git add -A %s' % ' '.join(['"%s"' % item for item in batch]))
+            __run('git add -f -A %s' % ' '.join(['"%s"' % item for item in batch]))
             pbar.update(i)
         pbar.finish()
 
-- 
2.25.1

