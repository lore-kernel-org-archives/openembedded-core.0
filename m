Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF56C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:55 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8953.1788343192956675270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=Nro7QJtP;
 spf=pass (domain: ericsson.com, ip: 40.107.162.52, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBzZhZOsSJrrYJCA2A5n8APx79A2N5rydynXiRNX0pPN12TdbH9m9FzWLTbxODddwCPQvvEE71oIkUY4VnvDOJIHwH5fC0tJmas8D3ix0C2cknkn5xgWVDtiASBApb0q1LxU36r02PpOobJS7ceguyLo7D40i3E1fsZwfUBJo+6xGDXVvqPdkHF5tTGs8m0KjFRuoDSwRTak33oivk6Vsxfyelju2eJPO5gJ4oFMHRQxxyJrYkEfiHY8WqTaC7GALrdh9YgYeUnfB+nsQB3mYtjww5kYx7Vqb8A1zwh3JWpsn6WjtBCrmo474jVD9zg7+pK1ede9ZI1Zx4PRvVzJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20V3F8Qxjne5UYtM5Q1RBIhZ6Y6avq/UHlzdP9P8uQI=;
 b=Dtfge2LX29YTEgQieukP6bDjLqw3Rz81woXYwbf/da7IOj4I0EpOE4QKaN2fUQUpOCw08hcpNBzfvUyleS6OZnsUfp5kLBXMsNNvzCoenOMhvHexpzoumtb5CCBdefvWG0+vsrL72KBPRiXAVn4/KVkGp3U6/yL5/NDkvAf+Qy1kZI/3ul1His9/XOB5KjHQGVwtAWV9PuKgBp2KpiIbKvYA6WAZqQZPP09JzHNhrmrd+dKcLavSOuRsOSqIRyPpJm4OGmYuMVtxwyQQa+8ZMy/CLMbiynq8+N9dyo5a+vdwXDxCsc7W6GCnJmZdrJZ79NJBbCRw/OZlgR2Ua1wZ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20V3F8Qxjne5UYtM5Q1RBIhZ6Y6avq/UHlzdP9P8uQI=;
 b=Nro7QJtPV364YEnFNohbV6HTGwaH3HC8HGImkZlJl29BJjUmFG5OG5CxZVgcqHRh1lzBUMU5z082IVbUsyabK6PPljpJacV9ZyOSTfUjzAy7iPq3ZC3E5VlQmGESttNRXKeGCMITz96ZCiXzr0IX9BPWSEbpuiogIoQep0spZ/14IBl14tPNPGJeo8tZ0j1Ht8smc8S69xsUercJIt+U+9Dc8KIkH0FDYNNSJ3Kw2c+Jd+WAIVtCkuPhhwWSZw/InjZjekfh+mBHWk69+m4nXcyCWydV42DYzSExoaS/zbDKKQJSs63nEmkSjsc5ZfsTRFEdxE6OAmNiuNNnQYpOfQ==
Received: from AS4P189CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::6)
 by FRWPR07MB10615.eurprd07.prod.outlook.com (2603:10a6:d10:183::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:48 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::2a) by AS4P189CA0022.outlook.office365.com
 (2603:10a6:20b:5db::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 09:59:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:33 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 69B2895802;
	Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 43D4A700CF3D; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chen Qi <Qi.Chen@windriver.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [wrynose][PATCH 03/20] devtool/upgrade.py: add --stable option
Date: Wed, 2 Sep 2026 11:59:03 +0200
Message-ID: <20260902095920.2840293-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9B:EE_|FRWPR07MB10615:EE_
X-MS-Office365-Filtering-Correlation-Id: 0121fca5-8bec-4b2c-c4b6-08df08d8e3b1
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|22082099003|18002099003|3023799007|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	cz7jTZR8V+vaPj8b1m7c19wvzKnH/wECnNjNFVkCK3krCj7AMyMYwCsMqE0OiOdmSy0KriVDGGwtuU8sXUy8u5HhrOnxG5mWswAY5VvwUZHtvzuAdQKivD4QydvZgk3R8AnxfDIEV/g3ih6Ox+iwgGnpGq/Df18ZU+/rcj4jiBKSs0cYfVrZ4KDEGJTdECCeD0yD6KZJwnWGoV87MgtqVeovgHNce8ZsYU6T/IEXEB482QFtaA8Ed3PdAwjtIOB5OVzEuC5v26G4dtb3w0baLZAaRN1DbUKqOWGmowsOTobClIvBnf1gFuti+Q/b5A4oUNGxgdbMkjNk+wziT6BjNX43NL//Xnl1Qk0GbGlXARA9dFk+z/0y/S/aCoCk4wjqLovauK85P3dCegLiiqMnrygke6BFVlrASM++JVOaZltcnLVg7frK7Pwf+VC5OHOPN8caJsdYA9xSUnIr6qJIdti++viGpp8qE5dpylMoHh1Q1wd3XlLpP1ABxmrmHhHdqh2a/QN2AGILyswBVZIuNeMVvZNZI5pDkVc3jBnUiLcaqFtnC0VyGjBp2//mAZ6a0UapvoeLTgj9kWeDtybNwpIOxtX5EAmnDVuJmewiZBxnxT6aJV6aHjwSCknt6bn2rRrUSg41qn/mTbZsxu/YxU2jEvV8oCl66T3g/3V4eLcIWWDpHfxh3YgFmeEJr3YgWKOlmb+ejSd3W9zTTpF6Gg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iLP93qbbwWCA6sZ4r8XGvUX8PSY7c52kb0VK8fWfIl97nnqzLE5xcHpXR0mnkAjPl2Ubci/nqxI1IgIZc8mFzrtmeDGHclRHhU1kDjXF0EsaLMdvLEAErZrjFyX1HlY9YcuLijqgiZr4QB2/eVVFAEoMQ7jBTL6k3r8vBm9FSZ0C5BXphyhyGOWHwagEhr0kNiLPdMj7YF1NiAd7LoLP8Ba1HEkkro7IU5QNWZ2JU5MejRwoLLlCBzBUXk2gQWh66TY4TjiUymnwMFByf1aZaNBFiyga+BktrtU83Fimn0t7TVITR0qqIrd5Yh/jJrDx5SVJOzmrF0kbSmFgdbdTXgdEq38hMx4aE0Mf5eK3In/o4OfAmwz8hpcUjbPSRL4rd9cQv2n0r1pKk5VjmJJrPWIRSFD7w01lmqhYeb8jBjQhC115taY6tDaEpId7XgK3
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:33.5242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0121fca5-8bec-4b2c-c4b6-08df08d8e3b1
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR07MB10615
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244925

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
---
 scripts/lib/devtool/upgrade.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 8930fde5d6..91cb85403c 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -560,7 +560,7 @@ def upgrade(args, config, basepath, workspace):
=20
         # try to automatically discover latest version and revision if not=
 provided on command line
         if not args.version and not args.srcrev:
-            version_info =3D oe.recipeutils.get_recipe_upstream_version(rd=
)
+            version_info =3D oe.recipeutils.get_recipe_upstream_version(rd=
, args.stable)
             if version_info['version'] and not version_info['version'].end=
swith("new-commits-available"):
                 args.version =3D version_info['version']
             if version_info['revision']:
@@ -626,7 +626,7 @@ def latest_version(args, config, basepath, workspace):
         rd =3D parse_recipe(config, tinfoil, args.recipename, True)
         if not rd:
             return 1
-        version_info =3D oe.recipeutils.get_recipe_upstream_version(rd)
+        version_info =3D oe.recipeutils.get_recipe_upstream_version(rd, ar=
gs.stable)
         # "new-commits-available" is an indication that upstream never iss=
ues version tags
         if not version_info['version'].endswith("new-commits-available"):
             logger.info("Current version: {}".format(version_info['current=
_version']))
@@ -649,7 +649,7 @@ def check_upgrade_status(args, config, basepath, worksp=
ace):
                                                                "cannot be =
updated due to: %s" %(recipe['no_upgrade_reason']) if recipe['no_upgrade_re=
ason'] else ""))
     if not args.recipe:
         logger.info("Checking the upstream status for all recipes may take=
 a few minutes")
-    results =3D oe.recipeutils.get_recipe_upgrade_status(args.recipe)
+    results =3D oe.recipeutils.get_recipe_upgrade_status(args.recipe, args=
.stable)
     for recipegroup in results:
         upgrades =3D [r for r in recipegroup if r['status'] !=3D 'MATCH']
         currents =3D [r for r in recipegroup if r['status'] =3D=3D 'MATCH'=
]
@@ -673,6 +673,7 @@ def register_commands(subparsers, context):
                                            group=3D'starting')
     parser_upgrade.add_argument('recipename', help=3D'Name of recipe to up=
grade (just name - no version, path or extension)')
     parser_upgrade.add_argument('srctree',  nargs=3D'?', help=3D'Path to w=
here to extract the source tree. If not specified, a subdirectory of %s wil=
l be used.' % defsrctree)
+    parser_upgrade.add_argument('--stable', action=3D"store_true", help=3D=
'Only consider stable upstream releases')
     parser_upgrade.add_argument('--version', '-V', help=3D'Version to upgr=
ade to (PV). If omitted, latest upstream version will be determined and use=
d, if possible.')
     parser_upgrade.add_argument('--srcrev', '-S', help=3D'Source revision =
to upgrade to (useful when fetching from an SCM such as git)')
     parser_upgrade.add_argument('--srcbranch', '-B', help=3D'Branch in sou=
rce repository containing the revision to use (if fetching from an SCM such=
 as git)')
@@ -690,11 +691,13 @@ def register_commands(subparsers, context):
                                                   description=3D'Queries t=
he upstream server for what the latest upstream release is (for git, tags a=
re checked, for tarballs, a list of them is obtained, and one with the high=
est version number is reported)',
                                                   group=3D'info')
     parser_latest_version.add_argument('recipename', help=3D'Name of recip=
e to query (just name - no version, path or extension)')
+    parser_latest_version.add_argument('--stable', action=3D"store_true", =
help=3D'Only consider stable upstream releases')
     parser_latest_version.set_defaults(func=3Dlatest_version)
=20
     parser_check_upgrade_status =3D subparsers.add_parser('check-upgrade-s=
tatus', help=3D"Report upgradability for multiple (or all) recipes",
                                                         description=3D"Pri=
nts a table of recipes together with versions currently provided by recipes=
, and latest upstream versions, when there is a later version available",
                                                         group=3D'info')
     parser_check_upgrade_status.add_argument('recipe', help=3D'Name of the=
 recipe to report (omit to report upgrade info for all recipes)', nargs=3D'=
*')
+    parser_check_upgrade_status.add_argument('--stable', action=3D"store_t=
rue", help=3D'Only consider stable upstream releases')
     parser_check_upgrade_status.add_argument('--all', '-a', help=3D'Show a=
ll recipes, not just recipes needing upgrade', action=3D"store_true")
     parser_check_upgrade_status.set_defaults(func=3Dcheck_upgrade_status)

