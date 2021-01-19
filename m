Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web12.13072.1611071463839984549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 07:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sbx7xuQQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 3so2253889ljc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 07:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XJQtwyx+jNIK5NP+0uIqcH/Kq7w96YQ7msGYJxnZONE=;
        b=sbx7xuQQG5rnMmZ4gRSlMeepBi4rF0VI+tdA9Tm+mljTyL7ckjDRfMfelU6AvQq7H4
         iLnP+8cTF2bKIb8Gei/G/5TngdQ0UWrR2mQArTOfsUMOrqfonBJhCjbWU74214Ub0jTC
         hhnrLoAQ0J19rL3Qc0Om+uqRLkOaxVTowno5lrNxOZHDUP7YpMq/n1Kn4mYk7U19ij3f
         PU9yGoZ8OmdprZW38UUcWptHp724BtRiWmBnsTs05mXHnTGbnKMAtsFSbXVPSfkyABM2
         NNKLAgZPuzqr8vGyNDbh6sdIHds0qUIvI3vmwLr9bdIB/7g9J2GmfAmKusf8eGjeVxvJ
         xqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XJQtwyx+jNIK5NP+0uIqcH/Kq7w96YQ7msGYJxnZONE=;
        b=ak2a7eDqGJm3W/anG2QOSGi42OM+WanMIEWeP6fe09wa7XRxnwKs+Sptak4OYdRji6
         Rmw/PuU/jY2pxaURhUGE9XnjLXaiBjH2+ysT1UTzHucZdE5Al06GlnOJRbzs/AdWL8PV
         N2moWVaCOcbLeacgcfWg6G9MHrP7iFPzLpSx0jOrAuTst/EK+K4ULxO++iKbk1zex1Ab
         IiE0eBit+kPQRzjKvruCUqJkwRdbntzyf6tpEgLjRW57MdNLLCpb9T8oURefGws0jGSK
         hzDXdG/YhMiKOsuZz9qhETan8rjH1tg0xNirnaQJrzi4QSoT/vDELiqrgvJmPk0oduIw
         acGg==
X-Gm-Message-State: AOAM533UerrEYYnKBzLTwtcZBL52ei1HS2z+ZKre8g30UA4XOMtl+YqN
	aAUZv0gPY3VVwY6aBjYZqDBnHDCUZZU=
X-Google-Smtp-Source: ABdhPJw+symofO/ns78cT82rptP3l/d08ZQPPAFwK1yVUKTAtN97+Owu6gYSLUj1/CFvjMIWuPfetA==
X-Received: by 2002:a2e:9b8a:: with SMTP id z10mr2171162lji.126.1611071461685;
        Tue, 19 Jan 2021 07:51:01 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id b3sm2383377lff.190.2021.01.19.07.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 07:51:00 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] devtool: Fix source extraction for gcc shared source
Date: Tue, 19 Jan 2021 16:53:25 +0100
Message-Id: <20210119155325.351554-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If do_patch task is disabled then prepare do_configure dependencies to
fetch external sources and create symlink to ${S} in devtool workspace.

[YOCTO #13036]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 .../gcc/gcc-shared-source.inc                 |  1 +
 scripts/lib/devtool/standard.py               | 30 ++++++++++++++++---
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index aac4b49313..9ef80f2074 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -2,6 +2,7 @@ do_fetch() {
 	:
 }
 do_fetch[noexec] = "1"
+do_patch[noexec] = "1"
 deltask do_unpack
 deltask do_patch
 
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 261d642d4a..8b80fb8bfa 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -589,6 +589,16 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             else:
                 task = 'do_patch'
 
+                if 'noexec' in (d.getVarFlags(task, False) or []):
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
 
+        if 'noexec' in (d.getVarFlags('do_patch', False) or []):
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
2.29.2

