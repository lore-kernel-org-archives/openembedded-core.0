Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A69CCD182
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 22:01:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.20229.1759701661194036448
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 15:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=JntGm3Lq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20251005220058cc7e8cc4d10002070f-dhnrlw@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251005220058cc7e8cc4d10002070f
        for <openembedded-core@lists.openembedded.org>;
        Mon, 06 Oct 2025 00:00:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=UOHbBGgRWpKOlQ3a2eanM+oT8csXLvpRIWIy0jqrg+M=;
 b=JntGm3LqreYHPHfAVg65FRbhYXYoTIMncPC8JIodnuxI+JFrXvOx5XlQ24iFyeAnwS333K
 RzVglpSikR/baAFYCkQwwiyWBtfwNLWkYMgTUsKSkrrrIRJibciQmaL9Flwx7izqR1tWPKTx
 5Txu5T7SS+Xd6PrUPZ8EU9G/h6qvqQ3mySOv66qIXT2o0pnjGq9HzKarZmuS6MWpD9YywVNj
 pO69lBnKTuASJPKkMfPZ4ZRZd6E3oDBB1Job4mIxG4iMbkDhbNJxD9pgdQsam7nYVosp8BBU
 lInf3LvCjT85jVbJtbuAWNO0tcQAPlKBiI7hmFuKPz3Le+wLt6+Wp3kg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/4] devtool: ide-sdk: use /bin/sh instead of /bin/bash
Date: Mon,  6 Oct 2025 00:00:32 +0200
Message-ID: <20251005220047.4101591-3-adrian.freihofer@siemens.com>
In-Reply-To: <20251005220047.4101591-1-adrian.freihofer@siemens.com>
References: <20251005220047.4101591-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224451

From: Adrian Freihofer <adrian.freihofer@siemens.com>

When generating the install and deploy script for IDEs, use /bin/sh
instead of /bin/bash. While this is not addressing a known issue,
using the more portable /bin/sh shell is preferable and avoids
requiring bash to be installed.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 419222fa23..ccb6cfbc61 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -710,14 +710,15 @@ class RecipeModified:
 
     def gen_install_deploy_script(self, args):
         """Generate a script which does install and deploy"""
-        cmd_lines = ['#!/bin/bash']
+        cmd_lines = ['#!/bin/sh']
 
         # . oe-init-build-env $BUILDDIR
-        # Note: Sourcing scripts with arguments requires bash
+        # Using 'set' to pass the build directory to oe-init-build-env in sh syntax
         cmd_lines.append('cd "%s" || { echo "cd %s failed"; exit 1; }' % (
             self.oe_init_dir, self.oe_init_dir))
-        cmd_lines.append('. "%s" "%s" || { echo ". %s %s failed"; exit 1; }' % (
-            self.oe_init_build_env, self.topdir, self.oe_init_build_env, self.topdir))
+        cmd_lines.append('set ' + self.topdir)
+        cmd_lines.append('. "%s" || { echo ". %s %s failed"; exit 1; }' % (
+            self.oe_init_build_env, self.oe_init_build_env, self.topdir))
 
         # bitbake -c install
         cmd_lines.append(
-- 
2.51.0


