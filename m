Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F12C5DF83
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 06:31:43 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3329.1787034699924261415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 23:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Qqwog9Kb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202608180631383064e21d2200020776-ai_agc@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202608180631383064e21d2200020776
        for <openembedded-core@lists.openembedded.org>;
        Tue, 18 Aug 2026 08:31:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=tF9kmAJxWcRoTEXgu2vR8LvSN5T/1sdatjBT61iZ390=;
 b=Qqwog9KbkhUlgmvgceW2nQDcvaQ4o0Urw00EpMsMsjibUTKzZyTpLspBGdJKBclbbPph6T
 kPThGSqbBQcILHjrnKuG40HxdxUIyhkCHF9fsoeNSPAkpntd8HTn3nxvWjpvTthVu3aPr997
 u1zwkXC2LVsSf46P1ZyewmANbDxV5AiGbVe7ttBDLDkm5pr1e+d3TRzrRKjvCg8f2qR06BYi
 bRaTa2mE/Cef2Nm+eiLPU1xQlhxr/ijS9PmoFSpA/Co7w+gglIxhvhRNj0F6Kn30tnjH5PAK
 FTV/3UU5NP8MqfKPxyehFEVABWdjbg4nDR+9b1IXxngTpumSo5urAYog==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 07/14] devtool: ide-sdk: default to all modified recipes
Date: Tue, 18 Aug 2026 08:30:46 +0200
Message-ID: <20260818063120.73042-8-adrian.freihofer@siemens.com>
In-Reply-To: <20260818063120.73042-1-adrian.freihofer@siemens.com>
References: <20260818063120.73042-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 06:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243659

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Simplify ide-sdk usage in modified mode: keep the image recipe explicit,
but when no modified recipe is passed, take all modified recipes from
<workspace>/appends/*.bbappend.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 42b6e381c5..ab2bba5d39 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1258,6 +1258,15 @@ def ide_setup(args, config, basepath, workspace):
                     recipes_modified_names))
                 invalid_params = True
         if args.mode == DevtoolIdeMode.modified:
+            if not recipes_modified_names:
+                appends_dir = os.path.join(config.workspace_path, 'appends')
+                recipes_modified_names = sorted(
+                    os.path.splitext(os.path.basename(path))[0]
+                    for path in glob.glob(os.path.join(appends_dir, '*.bbappend')))
+                if recipes_modified_names:
+                    logger.info(
+                        "No modified recipes specified, using workspace bbappends from %s: %s",
+                        appends_dir, ', '.join(recipes_modified_names))
             if len(recipes_other_names):
                 logger.error("Only in shared sysroots mode not modified recipes %s can be handled." % str(
                     recipes_other_names))
@@ -1266,6 +1275,11 @@ def ide_setup(args, config, basepath, workspace):
                 logger.error(
                     "One image recipe is required as the rootfs for the remote development.")
                 invalid_params = True
+            if not recipes_modified_names:
+                logger.error(
+                    "At least one modified recipe is required or must be guessable from %s." %
+                    os.path.join(config.workspace_path, 'appends'))
+                invalid_params = True
             for modified_recipe_name in recipes_modified_names:
                 if modified_recipe_name.startswith('nativesdk-') or modified_recipe_name.endswith('-native'):
                     logger.error(
@@ -1422,7 +1436,9 @@ def register_commands(subparsers, context):
                                            help='Setup the SDK and configure the IDE')
     parser_ide_sdk.add_argument(
         'recipenames', nargs='+', help='Generate an IDE configuration suitable to work on the given recipes.\n'
-        'Depending on the --mode parameter different types of SDKs and IDE configurations are generated.')
+        'Depending on the --mode parameter different types of SDKs and IDE configurations are generated.\n'
+        'In modified mode at least the image recipe is required; if no modified recipe is passed, '
+        'all modified recipes are taken from <workspace>/appends/*.bbappend.')
     parser_ide_sdk.add_argument(
         '-m', '--mode', type=DevtoolIdeMode, default=DevtoolIdeMode.modified,
         help='Different SDK types are supported:\n'
-- 
2.55.0


