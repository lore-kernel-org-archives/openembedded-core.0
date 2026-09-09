Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F7BC88E4D
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:52 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76.1788990824405280225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Nj+a5AYA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202609092153415d402edd8100020779-65sx_e@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202609092153415d402edd8100020779
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ANLY7FwUIgeZ9HunGG6NOREtTYymk0rGtsfjGsAG4So=;
 b=Nj+a5AYADQYfcNhrmLx1kSqfcoofke9/UJfKQF3SpZ/VOMTE5Y8h8Xq5/+GZxpY4vEeqoQ
 B0Ldk0DGvHwH1X+N/lv9Igbd1spQ9/eWmBXWWzMvsYqg2aNSu4+am3zT4RzHq84/QV0d1b7a
 F5T2s66b3cIZ2/Ya/Vk2DFInmQ1zaFaYX3A97ZAQCOSfwHAV0isJromirrvzyjmpSC+tVMYO
 KJUl2GL58ohyFgF8fweoCpV2fdrh3eKNp2/ADEKiWdQagQpPWdRbJ7OrRMcZ2CrZfcgqOZb7
 6NGExGV8O+a4rWDFSfWeQaRJdZydvIvrThkwhCggUPV5kV7/i2ImSIWQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 01/15] devtool: deploy: split ssh deployment into a separate function
Date: Wed,  9 Sep 2026 23:53:01 +0200
Message-ID: <20260909215337.89106-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245509

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is a refactoring preparation for adding a new local deployment
method that will be used for NFS rootfs deployments.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/deploy.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 51a1944f38..ffca1269ef 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -353,6 +353,12 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
             print('  %s' % item)
         return 0
 
+    return _deploy_ssh(args, destdir, filelist, ftotalsize, tar_relpaths, allowed_files,
+                       fakerootcmd, fakerootenv, path, recipe_outdir)
+
+def _deploy_ssh(args, destdir, filelist, ftotalsize, tar_relpaths, allowed_files,
+                fakerootcmd, fakerootenv, path, recipe_outdir):
+    """Copy files to target_dir over ssh/scp (user@hostname[:destdir])."""
     extraoptions = ''
     if args.no_host_check:
         extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
@@ -440,6 +446,10 @@ def undeploy(args, config, basepath, workspace):
     elif not args.recipename and not args.all:
         raise argparse_oe.ArgumentUsageError('If you don\'t specify a recipe, you must specify -a/--all', 'undeploy-target')
 
+    return _undeploy_ssh(args)
+
+def _undeploy_ssh(args):
+    """Run the undeploy script on the target over ssh/scp (user@hostname[:destdir])."""
     extraoptions = ''
     if args.no_host_check:
         extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-- 
2.55.0


