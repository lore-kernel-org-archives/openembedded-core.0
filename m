Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B2CC04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:56:03 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web10.11502.1715680556911515009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 02:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=M64YAaNU;
 spf=pass (domain: axis.com, ip: 40.107.8.72, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afsOV11kPU1hHYvtnpYlR/PaDGWiaJlAGz/Xz3PWrrbOm0OSjBia0oBG3g13mm4d4hwkEMv/1Cb5FZotWlj+AcxcmgAAIbLSlzbh4M4ZxI9pFpMAYHj718TyUbYgbvD3WIXI9XGhNm8WVsm16wpIk3BAQghcS87CL3Mpd/RASRDgGVSRtGx6+5ejBBzYMp/giWXAOv+xZjp5woJRKEdQWEiFt+6KmzR8jEnlBfSTPDieu2HKQ8zM2DpD+kE9q9XDsw/s3lsovMUVpgQgpoXkRgJ2AV8Ss/Z0qEGwu0jODeJrDBqdfDL1goS1XI0nRHOHJFj0sbRW5BQa96HLiCZxlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYIZ0+6QSxqGqotR0gtc8J3q7Zk/OsPdwRXAI5nN1d0=;
 b=hsukA8byCrW+wPbbiMAdkO7oURJe/5EEJJXJn8KGl8aLga3HdpXBVUdCE3IjEj3Ib2Co0eaJZFwlf6IoHJR+0l7uRRC/9E5TuvL1JKj1U6mx3o/iTUGWI7LqTWyZc2VLtg/tl8/sqpVTF/gvGy9RLAMfiX32lu8o98rgMZPy8l1wD6fdJ+3diikv1arkJBXtMwMiibSzT+mZTFfzEQL74yPK5vtToEZV772DT8MM1tr5+xTJJuSR4OF365I4uCJZi5jC36OjJ3TgYeRrredFFPG+Lb79tyW6eCimscAxp5muokIISI3KEddM8ykQAZMneZoTk0r6yBbBntZVSYAwVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYIZ0+6QSxqGqotR0gtc8J3q7Zk/OsPdwRXAI5nN1d0=;
 b=M64YAaNU6UtxlhiUhzi1r3Hg24J7xrxtEkNgQWexi8tSl8wkGoKgSkHBvVjrsngH2zaCIz3IY6qbNR3HgrwrmGSE4hskAU6a46GWYFDYCwj6bGscgJZ4yj5ELZX/vjtDGL4yKnj5TKBKj2fbzl2bM3CMtkHpD0DkwImT3BtKtiI=
Received: from AS9PR05CA0220.eurprd05.prod.outlook.com (2603:10a6:20b:494::25)
 by DU0PR02MB9369.eurprd02.prod.outlook.com (2603:10a6:10:415::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 09:55:53 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:494:cafe::69) by AS9PR05CA0220.outlook.office365.com
 (2603:10a6:20b:494::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 14 May 2024 09:55:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Tue, 14 May 2024 09:55:51 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 May
 2024 11:55:51 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 14 May 2024 11:55:51 +0200
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 5CE20DEB;
	Tue, 14 May 2024 11:55:51 +0200 (CEST)
Received: by pc58073-2410.se.axis.com (Postfix, from userid 20853)
	id 8657E404553F; Tue, 14 May 2024 11:56:23 +0200 (CEST)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <olani@axis.com>
Subject: [PATCH] devtool: modify: Catch git submodule error for go code
Date: Tue, 14 May 2024 11:56:23 +0200
Message-ID: <20240514095623.3951836-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004D:EE_|DU0PR02MB9369:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bac491a-204b-412b-f60d-08dc73fc0a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ufha3MIwTozHdvrpcFfqGQnLkCiZ2I6O9jsu4q7lhvmP54MdNYv2jkIGP2GO?=
 =?us-ascii?Q?LKYpOyTa3KM0bg92B/IAUCHmUtgoEpyUzB7H+1Qwv/ysbv6PqaFDt1nWEASw?=
 =?us-ascii?Q?VviYe6UnblgLwzgVr/TA4bgX5FtjgFdoLo0kElg2iRPjBGANBX5r/J5uAMp4?=
 =?us-ascii?Q?hFLUaEg5FP0bouNQQF0wNniZVsscouN3Ak/NHsfjITdDhO6fUKGxqMqZI5hf?=
 =?us-ascii?Q?2v0X/EARDpmniwAyIy1J9RAFErv2mOzVnYaQ9n9ZfwjSeoljchkeBrrfP1n7?=
 =?us-ascii?Q?V7w4Dvmfv+4Yvo63QCC8nACKcZYkyE6RonBG6tI3k0TvsVtwwCmgW9IweZae?=
 =?us-ascii?Q?Ntbm81LdxSdnjO6P3l8o2VxYkkdEjOVHeoRrKOxtQPaTtyw9VlRCGcHxi0MA?=
 =?us-ascii?Q?/fO4K/oWkHCs6kWJWj648Umn71tOpfaNKfpayIgrSLtT4IPTI5mt8YrMtmEF?=
 =?us-ascii?Q?4lB69vzfcSKxmnqDrwfrlcwf8wVngGoWOdwYIKHrZnzctZjyGblBKrei+632?=
 =?us-ascii?Q?ufAn+OB/RWFLPyyWtEqHZDC2WUPI7zTi2zrPwnyjAd2IiDLX1AhMeqf6nHx8?=
 =?us-ascii?Q?amJ1kECF02d5EPeRGu857foAx87NZNsnNpDmh1Pzk/nIfpaXfDEaA4XTK7Uh?=
 =?us-ascii?Q?NRYcelsFoV+tTOj7ColDKtSlKiJqCfPe9Gl8UcqJNnTHN6q/454+xn/OPBYU?=
 =?us-ascii?Q?uOxjieTt1seg4pnAgnZ3oTx88fU+1zF2asxGKiXnFCyzaOBS3JyvBpIiGh8f?=
 =?us-ascii?Q?Sw/iKR0I7108PDm7rAEyJ6nxoSqc5qokeqNQo/cOM8wXLBzYjq0yegabRfWC?=
 =?us-ascii?Q?7lQskyO06VzRHr+MrSry093ufe+PwTdWr4MK5ujOLToUut4xm10kTPYpWovb?=
 =?us-ascii?Q?YshePyvzVzuMCiKmtkyAEP4d9ztx+eN9vI8VScACxtl7Jt+PQDpf0VbHV1ms?=
 =?us-ascii?Q?DHCM/FNaSsOPXGa99iUQzwDQQwF8jOMUDO+DbENInzjxuxOJ9VhhN6IVETv7?=
 =?us-ascii?Q?iCRAKeg5fU2+2yappBKzT3EdafTDwMOKr6qTv0/kKmUbQmLB8NJq03Opr/fF?=
 =?us-ascii?Q?yzzJFcOgBfaDPIRf91+LComc/lDOU3anVVoFL7sfyuKXkQ5RbERoNCJmoxul?=
 =?us-ascii?Q?aHU02+sAfDSZZzyTamP/3ll1l7Zjvg1JWarX1NwlnC8lfnR9HRtxCT99KmRa?=
 =?us-ascii?Q?B8u6XGAHjwbp3KmUD0eO8mGEgXoDX5jceq6eChSuB9NnJLpYKfQUwK7S+Vci?=
 =?us-ascii?Q?+B6KOMBSYFBszSNn1k4aWeuSLdZ9cblce3EJLUyRj0abIlC05fX2fXkSfs5S?=
 =?us-ascii?Q?Lete0y2fupRqi5dsDAN2QdvfpoOc44CVcgkMCpxYnZy4ouq0qKVHC2hf1BZa?=
 =?us-ascii?Q?VjzZSBUY/jZ0cyOK3ovyPUhV1eMe?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 09:55:51.8733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bac491a-204b-412b-f60d-08dc73fc0a26
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9369
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 09:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199252

From: Anton Almqvist <antonal@axis.com>

One of the git submodule commands failed for source extracted for
recipes using go.bbclass.  The root cause is probably the path set up
by go_do_unpack which makes S and gitroot not match.

This patch does not fix the root problem, but at least it is no worse
than before the git submodule support.

The extracted source will still have two .git folders, one in S
created by devtool and one in the go path which will contain the tru
git history.

[ YOCTO #15483 ]

Signed-off-by: Anton Almqvist <antonal@axis.com>
Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 scripts/lib/devtool/standard.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index bd009f44b1..05161942b7 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -904,7 +904,10 @@ def modify(args, config, basepath, workspace):
                 (stdout, _) =3D bb.process.run('git rev-list --reverse %s.=
.HEAD' % initial_revs["."], cwd=3Dsrctree)
                 commits["."] =3D stdout.split()
                 check_commits =3D True
-                (stdout, _) =3D bb.process.run('git submodule --quiet fore=
ach --recursive  \'echo `git rev-parse devtool-base` $PWD\'', cwd=3Dsrctree=
)
+                try:
+                    (stdout, _) =3D bb.process.run('git submodule --quiet =
foreach --recursive  \'echo `git rev-parse devtool-base` $PWD\'', cwd=3Dsrc=
tree)
+                except bb.process.ExecutionError:
+                    stdout =3D ""
                 for line in stdout.splitlines():
                     (rev, submodule_path) =3D line.split()
                     submodule =3D os.path.relpath(submodule_path, srctree)
--=20
2.39.2


