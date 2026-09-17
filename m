Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C11C982E5
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:17 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1681.1789682886586314741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=shMB/Gg3;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso893675e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682885; x=1790287685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6znJAI08k6oTDYdM4U6eg9/6PHmDGP3afM3OydqPPwE=;
        b=shMB/Gg3fPaRdypwsiCcqdfPXNAnrw0Un+xzVvBqNYmGaSrUtelxUY++4+BEnAS+sn
         Klr9prNMruz0vWrev5WVV8OvXudXpeArzq9wRcJnnpIANjtajRln23WYqqTF6vCXGvIz
         XZvDGnR9xGgk2BlTROJOWfuPLUInBctR3wi8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682885; x=1790287685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6znJAI08k6oTDYdM4U6eg9/6PHmDGP3afM3OydqPPwE=;
        b=VAlHQLHYhj9bJVcngeLt8jC1NRyO+U/TAfUzjcwEcETj4daMZov3I++nzY52A3qOre
         1uBU+oE1MKJ2w6Cq2q6m1MPC3LaYTGbKhZ+OhhOJV97oLp1B0XP5MiVr0zu/5MEGHf/H
         uHPpi8S6kc2X1+hsHToR75NONpqVp5haVo0MKh/J7OGpZqk2LYWpUumJ26dc0CeeT0bM
         +NpRNr6mQB64CcVWqyv4sgkqFGddLxAmBtg7PzmpCU0xrcyB6fjcj27IZVMtNBBpJx5W
         jb8OYUaMfmvRnemN+xiTXHwj1r8nTsDbVMUaf2QMKv97H/b8xdApZgJHk6vTo1J8UR6F
         cLeQ==
X-Gm-Message-State: AFuF++kftXaRH7dxWdn2iqxrrALa+80n2OgQAaaswA1MT4r0PnbB6v3d
	8nOSJhk3uIh9kgVV9o41bijybYRO0QbL8Kut4pfW4/u5NXSukLpstTaSqLgIAzttuek3GkxZ6v+
	ZyRceEL8=
X-Gm-Gg: AYBFou2p+P9THM3rmUkpb2ubCFArWWuXLoKyKaCqMfrRIG5u2RMEAruVfZKiPGgvjSS
	peTtMMFSXe58XgoXuqzQOG5sKnhthPd5lLml9RT7vneYVnk+hLsVK8nN4k5Gi6LHVD5GLkqMLqn
	I9N+PfweTZ9AjWY2HHtYAJjtFoImX7Kbr8hKmkQ3pE+SWHhB1VNeBrR8bOPhAAL3qMJJO/nhl7t
	t8uu4Tjk3f7wHLHpn1iC8dzAtyz8rlJ5Um3gmbc6Jz9gMVUDItS1SSl1WTQCp7DQnWDtJ1/hF5m
	6PYRDZ3RxzfsAb06984HCvZjXFAGQFwbdPf+6h0Ncb2x5zZLYh2+gBelmdgNzASJHQoSrKI+8Vk
	AO8tDWEsb8OCOylSp91DsRWee/PH8WHIA5u1sUFJ0/QbmP7Vli15Ze0Hfy11cdK7HLScP01mdky
	iTEDMRXhSqMVMJz1EMSiTxMhz0XCPMtBdjmxzRfJFlh+GnYrisAg8jjYqmef6yv5cnTig3Zd6Ir
	kQBW2TSBodV1TE66Cnbwz9LQwSb/3TDjygH6nuUIIW+vcUeRfASUxI4up+X//BT5HXI2K4gSaA=
X-Received: by 2002:a05:600c:1c20:b0:49c:fa20:cc07 with SMTP id 5b1f17b1804b1-49fc5741914mr3262675e9.30.1789682884883;
        Thu, 17 Sep 2026 15:08:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 29/79] devtool/upgrade.py: add --stable option
Date: Fri, 18 Sep 2026 00:06:14 +0200
Message-ID: <ec70fa7ca6643435160669f39212b8e20dc71053.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246124

From: Chen Qi <Qi.Chen@windriver.com>

Add '--stable' option to the three subcommands:
- latest-version
- check-upgrade-status
- upgrade

The effect of this option is to make the subcommand only consider
stable releases.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 1e86aa039108621b2af734ef358a1e9d3c4d88d8)
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/devtool/upgrade.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 8930fde5d66..91cb85403c4 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -560,7 +560,7 @@ def upgrade(args, config, basepath, workspace):
 
         # try to automatically discover latest version and revision if not provided on command line
         if not args.version and not args.srcrev:
-            version_info = oe.recipeutils.get_recipe_upstream_version(rd)
+            version_info = oe.recipeutils.get_recipe_upstream_version(rd, args.stable)
             if version_info['version'] and not version_info['version'].endswith("new-commits-available"):
                 args.version = version_info['version']
             if version_info['revision']:
@@ -626,7 +626,7 @@ def latest_version(args, config, basepath, workspace):
         rd = parse_recipe(config, tinfoil, args.recipename, True)
         if not rd:
             return 1
-        version_info = oe.recipeutils.get_recipe_upstream_version(rd)
+        version_info = oe.recipeutils.get_recipe_upstream_version(rd, args.stable)
         # "new-commits-available" is an indication that upstream never issues version tags
         if not version_info['version'].endswith("new-commits-available"):
             logger.info("Current version: {}".format(version_info['current_version']))
@@ -649,7 +649,7 @@ def check_upgrade_status(args, config, basepath, workspace):
                                                                "cannot be updated due to: %s" %(recipe['no_upgrade_reason']) if recipe['no_upgrade_reason'] else ""))
     if not args.recipe:
         logger.info("Checking the upstream status for all recipes may take a few minutes")
-    results = oe.recipeutils.get_recipe_upgrade_status(args.recipe)
+    results = oe.recipeutils.get_recipe_upgrade_status(args.recipe, args.stable)
     for recipegroup in results:
         upgrades = [r for r in recipegroup if r['status'] != 'MATCH']
         currents = [r for r in recipegroup if r['status'] == 'MATCH']
@@ -673,6 +673,7 @@ def register_commands(subparsers, context):
                                            group='starting')
     parser_upgrade.add_argument('recipename', help='Name of recipe to upgrade (just name - no version, path or extension)')
     parser_upgrade.add_argument('srctree',  nargs='?', help='Path to where to extract the source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
+    parser_upgrade.add_argument('--stable', action="store_true", help='Only consider stable upstream releases')
     parser_upgrade.add_argument('--version', '-V', help='Version to upgrade to (PV). If omitted, latest upstream version will be determined and used, if possible.')
     parser_upgrade.add_argument('--srcrev', '-S', help='Source revision to upgrade to (useful when fetching from an SCM such as git)')
     parser_upgrade.add_argument('--srcbranch', '-B', help='Branch in source repository containing the revision to use (if fetching from an SCM such as git)')
@@ -690,11 +691,13 @@ def register_commands(subparsers, context):
                                                   description='Queries the upstream server for what the latest upstream release is (for git, tags are checked, for tarballs, a list of them is obtained, and one with the highest version number is reported)',
                                                   group='info')
     parser_latest_version.add_argument('recipename', help='Name of recipe to query (just name - no version, path or extension)')
+    parser_latest_version.add_argument('--stable', action="store_true", help='Only consider stable upstream releases')
     parser_latest_version.set_defaults(func=latest_version)
 
     parser_check_upgrade_status = subparsers.add_parser('check-upgrade-status', help="Report upgradability for multiple (or all) recipes",
                                                         description="Prints a table of recipes together with versions currently provided by recipes, and latest upstream versions, when there is a later version available",
                                                         group='info')
     parser_check_upgrade_status.add_argument('recipe', help='Name of the recipe to report (omit to report upgrade info for all recipes)', nargs='*')
+    parser_check_upgrade_status.add_argument('--stable', action="store_true", help='Only consider stable upstream releases')
     parser_check_upgrade_status.add_argument('--all', '-a', help='Show all recipes, not just recipes needing upgrade', action="store_true")
     parser_check_upgrade_status.set_defaults(func=check_upgrade_status)

