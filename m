Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web08.36633.1612196773885845516
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=b/UrCj9q;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.53, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f53.google.com with SMTP id x23so4397479oop.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=On4U47vPpZqk/AhwabJcJi/CF/KruKDpyS/LGD212sg=;
        b=b/UrCj9qUmOv5gmndrY0JfTSEEoeVtzjmZoSVb2aVQPzTFUCGHDruz0MRe0XE3TzZx
         aR6aUw33XIwgaDghSgdBsnQ2naOPs4YYEueS0GK4Z4owYlM511FeD8hu2uK/IrPScCYq
         4VgQqn8pUuxazzfhmDu3tK3nSbd/xfFN7Y6GwNkjs+ZF2N37I/f//p7pLaWecIfo+A4e
         d+4XfhdpyhWHsjhm6uN0f88FrFRhEDs1/p2/VGF4ZUdMxPDTo21r/+w8Tm9wPa0vIj63
         rbmAYzQ1yjCLO5tAtkup27Fh23STGXx6VSOXsPzSruNKNHTmIO+xesAFwS3CKBuBsu6r
         7sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=On4U47vPpZqk/AhwabJcJi/CF/KruKDpyS/LGD212sg=;
        b=Z2Qbxn5Cf3lm38OS6MY/NYGojTycYROJlujaWXqciHKdv+8VdQvVtM62gnAKalDJ1F
         y7NLUfjr8Wy5fhFuHeQLYdAtLLfBHuS0UJpXb5brp4STRhx2plCsC83oEemicCgmA4/Z
         c0sROG2BcHHxz83Wx/7cVndIbtP2kicJf7JYLlcjZKNTJ1BIZ2MRJlLsMprPzUMAcbry
         QhLl5dg5v0e6GrsYpGuogEn9TVzvNa6lfd7okx8wLYITS4XKa9OJk+UlEqo7mUetsMNh
         bMipJSGXIK2QDGyONtTxf4LVi0aOXvaZ+RMwMVekdHt1W6ucW/hBr+mfxbFbXmjVJLOI
         zksA==
X-Gm-Message-State: AOAM532TnGTn4iBRzds1aUOVz6Qf/ox41yOnV7+wtPJY3ZuRDJYf0dHJ
	nnOfRAG8EFHo24965bt5SmSnhGhmbrfPy9iBa8Q=
X-Google-Smtp-Source: ABdhPJzuZjQC/tSAo4oYf0Mfgz5IBqTJRoxAgxWV9/7DVza3EOm3CyZCsiMeXg5XlXeX7QRuLopAAw==
X-Received: by 2002:a4a:1bc1:: with SMTP id 184mr2757174oop.86.1612196772375;
        Mon, 01 Feb 2021 08:26:12 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.26.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:26:11 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/21] devtool: Fix source extraction for gcc shared source
Date: Mon,  1 Feb 2021 06:24:39 -1000
Message-Id: <1685e470f0dc49c1b857ffd869407f3396c55d31.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

If do_patch task is disabled then prepare do_configure dependencies to
fetch external sources and create symlink to ${S} in devtool workspace.

[YOCTO #13036]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9e47319bfe62d289b90f7545a64dbdc1cbde7f1d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 261d642d4a..f7d8a82117 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -589,6 +589,16 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             else:
                 task = 'do_patch'
 
+                if 'noexec' in (d.getVarFlags(task, False) or []) or 'task' not in (d.getVarFlags(task, False) or []):
+                    logger.info('The %s recipe has %s disabled. Running only '
+                                       'do_configure task dependencies' % (pn, task))
+
+                    if 'depends' in d.getVarFlags('do_configure', False):
+                        pn = d.getVarFlags('do_configure', False)['depends']
+                        pn = pn.replace('${PV}', d.getVar('PV'))
+                        pn = pn.replace('${COMPILERDEP}', d.getVar('COMPILERDEP'))
+                        task = None
+
             # Run the fetch + unpack tasks
             res = tinfoil.build_targets(pn,
                                         task,
@@ -600,6 +610,17 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         if not res:
             raise DevtoolError('Extracting source for %s failed' % pn)
 
+        if not is_kernel_yocto and ('noexec' in (d.getVarFlags('do_patch', False) or []) or 'task' not in (d.getVarFlags('do_patch', False) or [])):
+            workshareddir = d.getVar('S')
+            if os.path.islink(srctree):
+                os.unlink(srctree)
+
+            os.symlink(workshareddir, srctree)
+
+            # The initial_rev file is created in devtool_post_unpack function that will not be executed if
+            # do_unpack/do_patch tasks are disabled so we have to directly say that source extraction was successful
+            return True, True
+
         try:
             with open(os.path.join(tempdir, 'initial_rev'), 'r') as f:
                 initial_rev = f.read()
@@ -847,10 +868,11 @@ def modify(args, config, basepath, workspace):
             if not initial_rev:
                 return 1
             logger.info('Source tree extracted to %s' % srctree)
-            # Get list of commits since this revision
-            (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
-            commits = stdout.split()
-            check_commits = True
+            if os.path.exists(os.path.join(srctree, '.git')):
+                # Get list of commits since this revision
+                (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
+                commits = stdout.split()
+                check_commits = True
         else:
             if os.path.exists(os.path.join(srctree, '.git')):
                 # Check if it's a tree previously extracted by us. This is done
-- 
2.25.1

