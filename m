Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204A4C56208
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:00:54 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14578.1785844850664655587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=MhxpkYQn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260804120038d645da45ef00020723-q6hhxk@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260804120038d645da45ef00020723
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 14:00:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wdgIcSE4Y2WHqRc5Key/l3BRJq32Wi75hdNPgUTHtlc=;
 b=MhxpkYQnRLVDZ0mzPrXBmvKAUYVNVgnYEXdpXWlpn8u51pegIaURJdwFtdj96UxZhFS+SX
 rs13LMPgt9TGhPj+Af0+A8TVERGBNPS495YLWSKQfaIZ+lEF+ppYznwTzn3TJBv5bHBOPiev
 BAI9F5TUDlJxsj0OKSsQbrSLt/snM6vd8r8CF+8kakRElJ0VXwE6PPmFmt+h3t7nlgR5Ojhl
 2qp5io3wgQ4/pTVj0n4uEnyZQLxyzBT7dYzjXuls8fkb8jw5eMCopVieqJiF6sciHbQPRW2A
 eLlrX+Ritlm40Bic8MJMoIawZzt4X7nR7CySdBiyQVQfWjk/lFAwoNKw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 05/14] devtool: deploy-target: fix run strip under pseudo
Date: Tue,  4 Aug 2026 13:59:29 +0200
Message-ID: <20260804120034.378787-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260804120034.378787-1-adrian.freihofer@siemens.com>
References: <20260804120034.378787-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242730

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Any file modification on pseudo-tracked files must happen inside the
pseudo fakeroot environment so the pseudo database stays in sync with
the real filesystem. Stripping was done outside pseudo, which is
conceptually wrong: tools that replace files (temp+rename) change
inodes, and pseudo loses track of the new inodes, causing the
deployment tar to embed incorrect ownership and permissions.

This probably went unnoticed because GNU strip modifies files in place without
changing their inodes. llvm-strip replaces files via a temp file and
rename, making the ownership corruption visible.

The old code was manually prepending path to the parent process's PATH
so strip_cmd could be found, then restoring it. The new code passes the
strip script to exec_fakeroot_no_d, which already sets PATH = path in
the subprocess's environment — so strip_cmd is findable there without
touching the parent's PATH at all.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/deploy.py | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 7866cfbaae..6a75538fb0 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -9,7 +9,9 @@
 import logging
 import os
 import shutil
+import shlex
 import subprocess
+import sys
 import tempfile
 
 import bb.utils
@@ -221,10 +223,21 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
             exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "rm -rf %s" % recipe_outdir, shell=True)
         exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
 
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = ':'.join([os.environ['PATH'], path or ''])
-        oe.package.strip_execs(args.recipename, recipe_outdir, strip_cmd, libdir, base_libdir, max_process)
-        os.environ['PATH'] = oldpath
+        # Strip under pseudo so that it records any inode replacements made by
+        # the strip tool before the deployment tar reads this directory.
+        strip_script = (
+            'import sys\n'
+            'sys.path[:] = %r\n'
+            'import oe.package\n'
+            'oe.package.strip_execs(%r, %r, %r, %r, %r, %r)\n'
+        ) % (sys.path, args.recipename, recipe_outdir, strip_cmd, libdir,
+             base_libdir, max_process)
+        ret = exec_fakeroot_no_d(
+            fakerootcmd, fakerootenv, path,
+            '%s -c %s' % (shlex.quote(sys.executable), shlex.quote(strip_script)),
+            shell=True)
+        if ret != 0:
+            raise DevtoolError('Failed to strip files for deployment')
 
     filelist = []
     inodes = set({})
-- 
2.55.0


