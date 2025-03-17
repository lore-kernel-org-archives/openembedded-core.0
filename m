Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF98C35FF8
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:21 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.35])
 by mx.groups.io with SMTP id smtpd.web11.58667.1742231593981934490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 10:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Y1VQhQ4L;
 spf=pass (domain: axis.com, ip: 52.101.70.35, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koRe6+W08VlraMyY4b/8YMVSm6qDZihrkYPdnxER5CFFiq+vEiodjuqi6m72kFAr2jwyEU0egB4S25e9h7nefiVPLcIEuvj1o5QOmjw55DhiD67dO7oJY3M3cKHXfi2f6QPvHeTZVPUivfJsEVe16qv4BqODd/kNMwApRlGU7dK63Z7vzZXFVRRWDrgx7VPPoUvKXSHmddfHeSYpE9/vRzKooyryQNU3FGMP6bvhFG8dirjGRVUCzJpI6EAq6T64fXfXZ5jRxn5+BE5w/kHO06NljBmpooLOZaLpzhxw68wTFTdkw10K+31QqpnNDGoFmhPqJuKRq/y/aG/ijsHlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00UfEVtj8CwHcnucXVcb1YEh/3vLpFP+Cb1UEhitjow=;
 b=PzgR4JshM3VtY8Td7KzJceLMrQFrUDi/8j/CYrn9fHHL2fQwEKi+edwQETvHhtTiU2kz2OMivz1WOS4kIgsg7PqvFgEPn9H4S8RI9rTJWDnD944Dcx+XAC5fmxNNI6F94qyTe6BGGFAPJN/IbSKfO9Y6162gVKDoge3Y/Ko492PpSJllaD3BACspjLxv+RDnqIMDUYcChaOnRTVKHRVq6VXIx0rGGCtbDhY1TAJNvRePNGaxJOsuZj1yIPeQ4S8G9m7dIvqo0iRn2fGTs+gGiXqLA06br7I0gdRpmMEonRyi7j1WSzOdgfXVQWIZ9KZkE54uZJyJ8xF751fXElVrXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00UfEVtj8CwHcnucXVcb1YEh/3vLpFP+Cb1UEhitjow=;
 b=Y1VQhQ4LBcPXmRLTxisVkUGCpgsBMGzKaE2RLOqr+QfqfyR+y62yFadMoXkY96BQa/i78vVjX/Yy+9nPJP0ZnBOpxU42tTOoCU6O1ExjGYM3qGJo9kz4GAVF+mL0BbNJEiMZrsO3hXwGWx7HSM1asglW48XwcRMcx/B9HHBcCZA=
Received: from DB7PR05CA0063.eurprd05.prod.outlook.com (2603:10a6:10:2e::40)
 by PAXPR02MB7798.eurprd02.prod.outlook.com (2603:10a6:102:231::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 17:13:08 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::bc) by DB7PR05CA0063.outlook.office365.com
 (2603:10a6:10:2e::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 17:13:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 17:13:07 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 17 Mar
 2025 18:13:07 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 17 Mar
 2025 18:13:07 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 17 Mar 2025 18:13:07 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 1DEF3294
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 18:13:07 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 52HHD7JX3666756
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 18:13:07 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 52HHD64U3666755
	for openembedded-core@lists.openembedded.org; Mon, 17 Mar 2025 18:13:06 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] devtool: Do not create annotated tags if tag.gpgSign is set
Date: Mon, 17 Mar 2025 18:13:01 +0100
Message-ID: <20250317171303.3666709-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|PAXPR02MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e0f435-cfc0-4b2a-cbb4-08dd6576fcc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MfNe2NVZasCjiEXPrcq8srLUfjdbl9w2XjFemfJZ6Qqac6soJQnW6Mtf9hSO?=
 =?us-ascii?Q?7FL7YuCX0tJ6eAH2cx0mk7vsRP5gOz02C+UMJ4KtJ0QWj0BWXpZ2bM4604RW?=
 =?us-ascii?Q?ZPgDB+veaUC0nF8wLn/SOVoCexlrtcDtn4s5NCy5BVNf0WTFNlFMIv0bg2mJ?=
 =?us-ascii?Q?lMh2+Pf0V8t5nI4HqyjXu0wSju3m/4vwuDAZvlzJBCPkbDFB7PS0GZ1Om1+K?=
 =?us-ascii?Q?/G2D80b73he96xwWEN/JTTev6NjTCUmySbmbTd02k8XItw0Pww+S6YdVU2+T?=
 =?us-ascii?Q?xxAaIdAPOmVAGCbP0NbzUxiTrqpiBB/Z405m8qnrPqoBStBJpdNrCfwIkmb9?=
 =?us-ascii?Q?Nc1HUHywzm0vd0kzLD4cYMFh1ZYB/RWeBIKh6UXNwrlxS0aEh9wEBmSLJGLL?=
 =?us-ascii?Q?MMpZI9rPyPo0hxfXxPujj8B2ZDw3HZ4k6Tz84TIgQW4RZ3rL0fE4AgOLq0l8?=
 =?us-ascii?Q?enZJW3PctJ43ycgZlBYxFP5x5LZWGoCWWg7SESdYel4tMX7LuvkTQNcUgY84?=
 =?us-ascii?Q?myB2FFlRIAdemcnEgjj+ALVEUqXNvqnSoFu46yC9mpdmoqz3wjpYX0ASLRIc?=
 =?us-ascii?Q?NOd9S7VgKTtMpSzMjYe0IImAsIIX6CML6HQTb9i2haTuBabE04fQyyTGMXqN?=
 =?us-ascii?Q?x/XkUAOlBXjq1mdDsoKIzWjsxAMu1mQpNENwWbPeHNZ5LNFSd1Yyl/JaPNUO?=
 =?us-ascii?Q?UO5aqotDLUX/YNjyfqoGgTnQQH8d0JmYoe/OMJhrA5beZFKH/hyEdXi+lR9J?=
 =?us-ascii?Q?acKVkyswiDWY1e4OKg71W5D79zt1dewAvwkQsHPpcl6sqa3DpjI6Mx/6pAAj?=
 =?us-ascii?Q?0KhAiegN/Z/giSO3oXU6lbZ5Vl4ZnezYYGBgeMETMd9BGdjCA1TX3aIHION4?=
 =?us-ascii?Q?atayMcW62pSnbUiDY5YuEiJKV6RmhL1ZrJ7aZBZDtwvI3jIoB+4kjlCppYYC?=
 =?us-ascii?Q?JjivNwfSMHlxK+7VA4mEGHw2v50weKF+mRZmcMrwiRDiTRg+rzBGd73hspw1?=
 =?us-ascii?Q?Z5vckJLb+PWE6b7vVT1CNJ6zjZBim+4LQR0wVFyRzgVypseuGDX1YI/Arw8L?=
 =?us-ascii?Q?fY4iXKNy7eM5KFEDDr3ZWw9wCXLVELKXPu+3oOUyXV0SqX3WCXH6Z4BNOXv5?=
 =?us-ascii?Q?BsHpGFGYjaxM7avX9UbvHdkDIdvHuXKlazhdliBxM5vaY+UW2RNpxrp4lcmm?=
 =?us-ascii?Q?kJL9udmqp17QH1rKlhyU9Fvpj2yFwNT3g6TGWMb/nNP9hA39ImC1mm0Dv2Ji?=
 =?us-ascii?Q?JS25gg7wpDSH/oKxwGHabsCIyexqmW1OrJYxj4srDpqkCl4qB9ZValcavU69?=
 =?us-ascii?Q?8bamOeUMulvfcvkgKwyyfJw/lHeJnDNGdCYrATjOlRoyknoBGEt4qr3vFZFC?=
 =?us-ascii?Q?jZE3fdfgTEL5JdKnZart4EorgfGq3PCNIDVaDHUNRbsACFHczMCdfNct6PVk?=
 =?us-ascii?Q?jthbUtE+IM67KQ5ucn2N/tO4ndDiceP969woz0I9uJOuEzAFuF2ouXIXMfon?=
 =?us-ascii?Q?bqniudW5+jhOrCc=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 17:13:07.7483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e0f435-cfc0-4b2a-cbb4-08dd6576fcc9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7798
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 17:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213118

If tag.gpgSign is configured in Git's configuration, then creating the
devtool-base tag will fail (if Git's core.editor is not configured) or
it will hang (when trying to open the editor). This is beacause
tag.gpgSign causes git tag to create annotated tags. To avoid this,
specify --no-sign as argument to git tag.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/devtool/__init__.py | 4 ++--
 scripts/lib/devtool/upgrade.py  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__=
.py
index 6133c1c5b4d..fa6e1a34fd1 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -234,7 +234,7 @@ def setup_git_repo(repodir, version, devbranch, basetag=
=3D'devtool-base', d=3DNone):
             f.write(line)
=20
     bb.process.run('git checkout -b %s' % devbranch, cwd=3Drepodir)
-    bb.process.run('git tag -f %s' % basetag, cwd=3Drepodir)
+    bb.process.run('git tag -f --no-sign %s' % basetag, cwd=3Drepodir)
=20
     # if recipe unpacks another git repo inside S, we need to declare it a=
s a regular git submodule now,
     # so we will be able to tag branches on it and extract patches when do=
ing finish/update on the recipe
@@ -256,7 +256,7 @@ def setup_git_repo(repodir, version, devbranch, basetag=
=3D'devtool-base', d=3DNone):
                     oe.patch.GitApplyTree.commitIgnored("Add additional su=
bmodule from SRC_URI", dir=3Dos.path.join(root, ".."), d=3Dd)
                     found =3D False
     if os.path.exists(os.path.join(repodir, '.gitmodules')):
-        bb.process.run('git submodule foreach --recursive  "git tag -f %s"=
' % basetag, cwd=3Drepodir)
+        bb.process.run('git submodule foreach --recursive  "git tag -f --n=
o-sign %s"' % basetag, cwd=3Drepodir)
=20
 def recipe_to_append(recipefile, config, wildcard=3DFalse):
     """
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 94b6c11a37e..9abf72eccf1 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -188,9 +188,9 @@ def _extract_new_source(newpv, srctree, no_patch, srcre=
v, srcbranch, branch, kee
     if uri.startswith('git://') or uri.startswith('gitsm://'):
         __run('git fetch')
         __run('git checkout %s' % rev)
-        __run('git tag -f devtool-base-new')
+        __run('git tag -f --no-sign devtool-base-new')
         __run('git submodule update --recursive')
-        __run('git submodule foreach \'git tag -f devtool-base-new\'')
+        __run('git submodule foreach \'git tag -f --no-sign devtool-base-n=
ew\'')
         (stdout, _) =3D __run('git submodule --quiet foreach \'echo $sm_pa=
th\'')
         paths +=3D [os.path.join(srctree, p) for p in stdout.splitlines()]
         checksums =3D {}
@@ -257,7 +257,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcre=
v, srcbranch, branch, kee
         useroptions =3D []
         oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=3Drd)
         __run('git %s commit -q -m "Commit of upstream changes at version =
%s" --allow-empty' % (' '.join(useroptions), newpv))
-        __run('git tag -f devtool-base-%s' % newpv)
+        __run('git tag -f --no-sign devtool-base-%s' % newpv)
=20
     revs =3D {}
     for path in paths:

