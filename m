Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F99C5518E
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 19:53:54 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29484.1785700422013406576
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 12:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=GjzihNuO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202608021953399381e2695e00020774-isd5_p@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202608021953399381e2695e00020774
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Aug 2026 21:53:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=B4kve12KlGad3gutgddg+RgxW8oUA+Jh2WhOZlpBjhQ=;
 b=GjzihNuOK5de2qQuhyBqpRfJETU7VXwfLVDQkvHnid26n+FshlSkjrh7DnxP8H5TfGf3PJ
 ihWVB3AoqIhda92Z6FtOn7bYUnm2/qdD4Qyb3maO9sg0cHYQCqIeWDc8oaIj9P1W4j3SdOuU
 eJG8wz9TWwgYS3QAI2qC/uS0rAv+0YbOhcagcP3tFVFEXE4j4amZx/dU1ZNsoB95GRoRcYTM
 aAoPRyFaPLzYRdS/gAjXGKBy4zh64XYD4BA+vfRFvNCWMiXhsATSr3I+AP4b4zR+08LFwXKi
 ge1RP9++WI1wnprszoUdz8HEuAuaYazehBsSxzFcnZXj0n4lH8p+Hrpg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 04/14] devtool: ide-sdk: fix $@ overwritten by set in install_and_deploy script
Date: Sun,  2 Aug 2026 21:52:51 +0200
Message-ID: <20260802195324.64533-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260802195324.64533-1-adrian.freihofer@siemens.com>
References: <20260802195324.64533-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 19:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242581

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The generated install_and_deploy shell script uses 'set $BUILDDIR $BITBAKEDIR'
to pass arguments to oe-init-build-env.  This overwrites $@, so the original
command-line arguments (e.g. -t user@host -P 2222) are lost before the
embedded deploy script can read them.

Save the original arguments in $_args before the 'set' call and pass
$_args to the deploy script instead of $@.

Extend the argument-parsing loop in the embedded Python deploy script to
handle -P/--port in addition to -t/--target, so that non-default SSH
ports are forwarded to devtool deploy-target.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index fea44740f3..940bb8211e 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -988,9 +988,16 @@ class RecipeModified:
         cmd_lines.append('        for key in my_dict:')
         cmd_lines.append('            setattr(self, key, my_dict[key])')
         cmd_lines.append('filtered_args = Dict2Class(filtered_args_dict)')
-        cmd_lines.append('if len(sys.argv) > 2:')
-        cmd_lines.append('    if sys.argv[1] == "-t" or sys.argv[1] == "--target":')
-        cmd_lines.append('        setattr(filtered_args, "target", sys.argv[2])')
+        cmd_lines.append('i = 1')
+        cmd_lines.append('while i < len(sys.argv) - 1:')
+        cmd_lines.append('    if sys.argv[i] in ("-t", "--target"):')
+        cmd_lines.append('        setattr(filtered_args, "target", sys.argv[i + 1])')
+        cmd_lines.append('        i += 2')
+        cmd_lines.append('    elif sys.argv[i] in ("-P", "--port"):')
+        cmd_lines.append('        setattr(filtered_args, "port", sys.argv[i + 1])')
+        cmd_lines.append('        i += 2')
+        cmd_lines.append('    else:')
+        cmd_lines.append('        i += 1')
         cmd_lines.append(
             'setattr(filtered_args, "recipename", "%s")' % self.bpn)
         cmd_lines.append('deploy_no_d("%s", "%s", "%s", "%s", "%s", "%s", %d, "%s", "%s", filtered_args)' %
@@ -1003,6 +1010,8 @@ class RecipeModified:
         """Generate a script which does install and deploy"""
         cmd_lines = ['#!/bin/sh']
 
+        # Save the original command-line args before 'set' overwrites $@
+        cmd_lines.append('_args="$@"')
         # . oe-init-build-env $BUILDDIR $BITBAKEDIR
         # Using 'set' to pass the build directory to oe-init-build-env in sh syntax
         cmd_lines.append('cd "%s" || { echo "cd %s failed"; exit 1; }' % (
@@ -1015,8 +1024,8 @@ class RecipeModified:
         cmd_lines.append(
             'bitbake %s -c install --force || { echo "bitbake %s -c install --force failed"; exit 1; }' % (self.bpn, self.bpn))
 
-        # Self contained devtool deploy-target
-        cmd_lines.append(self.gen_deploy_target_script(args) + ' "$@"')
+        # Self contained devtool deploy-target - use saved args, not $@ (overwritten by 'set')
+        cmd_lines.append(self.gen_deploy_target_script(args) + ' $_args')
 
         return self.write_script(cmd_lines, 'install_and_deploy')
 
-- 
2.55.0


