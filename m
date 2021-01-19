Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.15867.1611082485995745489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 10:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RtGeNQJ5;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id m10so23155485lji.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 10:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aYx2cggqX0AQD+attGZEK5yO8PuCNTG6d2fdqIfKS9c=;
        b=RtGeNQJ5Ik3t6NbWYvSzK7BeQTvJBvwaen+DVCyQsK5TlrTzyk9SABHAhUnSLDyEao
         zTlVitx7YXMrZ7Rg0sHq4e0cvHsTXFIO6aGOJRkb2b5NolZ6fdRBVgmdaXVbgZnUeX4g
         VuhTQwGIvt1qY7hovzGo9OxFTLFJsTt6+o8q+1VPZVQJSAuuKC2InaPd1ZLSQiQtaVaM
         uefNgaixzWPfT+ZCtW5ZJPTG1kVQ6Mv1h+tCCJ4dWBIshS3n0J97si+ugaewKMgcuSCz
         5Ci2GuHqP6KLfexzyXvjvTCV9MgW7eHZzhbLgPoxJ9cXGmTLjGQ0ZxlaxSeudmFDw6sA
         aJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aYx2cggqX0AQD+attGZEK5yO8PuCNTG6d2fdqIfKS9c=;
        b=fqljYwJ+sZCXCD6RgH5VXM9XSdSaoYVCDZqR9jCaYZtjIfWy7Xj8lNid1+oeeLazmL
         qrbOTLPwuzsRNfG5RKyfxfklnMIatXsNVndfN4Z5WEB3NvyMU+cSnM+GE8ZxgwVOzRE8
         YEKfoRAckguw95gJH7mFt5jza4NK+ejSbh+ZzX9vGxjYVGO42uy2f2B3rK1HxDnOFNOr
         6eOx0//6H24/nF97pGq5lcxyW7zQT4KfdDb8JW+gP0fa67z5tMEXYmRYC/O7NQBOcZb0
         iViR19eM9kj7zneDIwhaXlXWEbvFJQG8SBBLhKgeqy29MKvrvaBm4jSeucYgDuY6id8v
         FYhA==
X-Gm-Message-State: AOAM531pYdJIyo7vxQTH7+EMoAo8ztu5NlkGILXrBZ0Dzrc77yfwn2hn
	x0Ldzw4mLsHHXOcswLGqxvY7phg2flNQQw==
X-Google-Smtp-Source: ABdhPJy5TyFKEPii6w/ioZ6NSILn6g9p8MJ1qc/sqYBiNkWWnzvdyVWEdX0pVuxC8s0+Lnz6su+chA==
X-Received: by 2002:a2e:7c12:: with SMTP id x18mr2503302ljc.324.1611082483827;
        Tue, 19 Jan 2021 10:54:43 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id f18sm2354449lfh.137.2021.01.19.10.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 10:54:43 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH v2] devtool: Fix source extraction for gcc shared source
Date: Tue, 19 Jan 2021 19:56:29 +0100
Message-Id: <20210119185629.402243-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If do_patch task is disabled then prepare do_configure dependencies to
fetch external sources and create symlink to ${S} in devtool workspace.

[YOCTO #13036]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
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
2.29.2

