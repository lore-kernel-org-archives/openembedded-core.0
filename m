Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id EC3A47C56A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 17:08:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m22so6987453wml.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 09:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=8O4vot4zKnM9ErAWuLnCuJOWxTPoJ8GTRkyJs0tofto=;
	b=rmI706mcyQlbj99fIMzhcFO1uqXBrKzmz5VgawYHOMETASR2OxsyB9aDemJuzBxL01
	ZbbhEs1RHtwH8/eFzWR4LH0ORVAgyPPVczI3RHVSj2POsCeoJCtLDg9xFc8k0jJVUxMP
	0NDfGuhKf3JyfZIanWepHkygwJVJI87JpNttsJXGJKOXbSMy4KywJmhgV33qxPLNP4k9
	CL9Xu2vrFj751JXHutjhW8kfL7wEgwHBDgxb4Nk9aD+4bW8B4IZ42u3819r5YpDBGWLH
	MURxNknmXJ77Kze8S+EMsbpkm7sTakwMCeZsSO+3r5Ge17xcruLs3g1KeZ/thPoIihWR
	mEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8O4vot4zKnM9ErAWuLnCuJOWxTPoJ8GTRkyJs0tofto=;
	b=EJ9z4VKHJYSn/nNKDnJdIHbWQcNUxHnkHHc+MH2+hAuoisBWb4YhLqDBsT5aTSx1nq
	W3kVk7ppdzkPdb8n60vYLHzKSpRBtMC4cutlQ+u8F8ne2fnSeYyoEiI2dwaJklqdlr7l
	JOq1ID0nsTsoApEcvclMYd0//bAvNeBRig/xMIT1Jh+icaxqmi+yVwgHdZqpQ3N88eAp
	hp57FK7E8Afld5UIJMo4UeDkAImVbK2n3+YLAYtAyqCh8jCR0G+tIFjQPRv8sxIq1qWj
	ifAZiQVcCvGixSZLzHBla0ZRz6P1o7hj2cBbqyx2OlkvCMcF4Anw49bpQQ8wMjsgj7R+
	UsDA==
X-Gm-Message-State: AHQUAua3WNPEZgMxf9/xM7fxoI+jzw21qxauu+VlgXqSlGujZtC5fZ2m
	NeGlZTFyIUMAjHFAq1E4xJO16BpXCpI=
X-Google-Smtp-Source: AHgI3IbokgF1ffmVzu3RYdiAKpi1C7yH20rmVN8E1J66osi44JpWtURyiDI7SKIAfj8JQnzpxuTgJA==
X-Received: by 2002:a1c:1a8a:: with SMTP id a132mr3358037wma.109.1549040923332;
	Fri, 01 Feb 2019 09:08:43 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id o3sm5807381wrs.30.2019.02.01.09.08.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 09:08:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 17:08:39 +0000
Message-Id: <20190201170839.7683-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] devtool: add --all option to check-upgrade-status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2019 17:08:43 -0000

The default behaviour is to show just recipes needing upgrades, but for
automated reports showing all recipes can be useful.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/lib/devtool/upgrade.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 42a4c0e4bff..75e765e0195 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -606,7 +606,7 @@ def check_upgrade_status(args, config, basepath, workspace):
     results = oe.recipeutils.get_recipe_upgrade_status(args.recipe)
     for result in results:
         # pn, update_status, current, latest, maintainer, latest_commit, no_update_reason
-        if result[1] != 'MATCH':
+        if args.all or result[1] != 'MATCH':
             logger.info("{:25} {:15} {:15} {} {} {}".format(   result[0],
                                                                result[2],
                                                                result[1] if result[1] != 'UPDATE' else (result[3] if not result[3].endswith("new-commits-available") else "new commits"),
@@ -646,4 +646,5 @@ def register_commands(subparsers, context):
                                                         description="Prints a table of recipes together with versions currently provided by recipes, and latest upstream versions, when there is a later version available",
                                                         group='info')
     parser_check_upgrade_status.add_argument('recipe', help='Name of the recipe to report (omit to report upgrade info for all recipes)', nargs='*')
+    parser_check_upgrade_status.add_argument('--all', '-a', help='Show all recipes, not just recipes needing upgrade', action="store_true")
     parser_check_upgrade_status.set_defaults(func=check_upgrade_status)
-- 
2.11.0


