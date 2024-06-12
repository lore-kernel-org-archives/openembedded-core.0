Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108A7C27C7B
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:39:26 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.80])
 by mx.groups.io with SMTP id smtpd.web10.2114.1718159958012985310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=AwY3EAmc;
 spf=pass (domain: axis.com, ip: 40.107.14.80, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0PdvEJZEgaidPbRg0QD6sk6nFK8VwiT8t/pSVGprK6frSrStJvtcX+kUs937FBBzNC92jULOWVJx1/aMW+VYVRi2VyRfSlxFYT2QHW8IkhYxFqHpIKSXm0x2ghyJ0iWAEBWcYYr5toJ0TQemVmd68fHCgKmY6eIcoC8IoLPXhTq16P9EiMdrktSLmO7qd+NwWXT1LzKKV5jGvy+F4N/Ul270tGwNanIalervxZJSrB4WbXs58d0h5MOQE+6kFIoMPUVDlbfmHwdeJceH9SYAIsP7v3eo3Fm/DnXj52IYxlA9BXumq0gY4Vg8yg08rzqs2Wahbpipcs3CblplZXNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEQJJKjkbc7jbh9yEl+hhgbXTpt5EVpib7qwWn92ZIU=;
 b=TULN9nYMQiNCeZKXwTRdJyNwZi/jo5uGbwTZTc3LzfhHdMMQhGmuC55Fa7Pmk2RT477kUCj3zg6QOKHY2PU9nTm3PMKnyfpsErj3VhLQl19vk0f8+tmRtsTMs8v5wXHSYQSnCCcPD8iIOq3XRXTDQRhvWRRBL1llwjHlqbAZTi9yi04HKEBWdCi3XwZVI6Na7OqJ5yRZLvM6Mny7eUXQU1OZX8wtgXdmBlPeD57vtEPfeT/dW4/hNx5o+N/87phICSOSJoFhmvtgNy2MhWhuXAzmVl8uplH/h/wj8cItwkfJ1pUEqffKqs1Y68O4gSVjCL09h5Hd9ru+SyOzxIMtMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEQJJKjkbc7jbh9yEl+hhgbXTpt5EVpib7qwWn92ZIU=;
 b=AwY3EAmcilXEXDyxi9suIgLuPxb9eNhozl6o5FAPBjcqMY1y3Ps599meN+yeS/CfNEnPCHTEG3oJO7Yo/qhN40Dc2VTeEsU7cwu7AXE08dsPrcQR6V1hrG4YfX0o5Eiq1F3UHoWxWoiUtXuxVBPcTrBpCbWNfWiLcWN9jTrv/RQ=
Received: from AM9P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::9)
 by AS1PR02MB8186.eurprd02.prod.outlook.com (2603:10a6:20b:475::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 02:39:09 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21d:cafe::a) by AM9P192CA0004.outlook.office365.com
 (2603:10a6:20b:21d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17 via Frontend
 Transport; Wed, 12 Jun 2024 02:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 12 Jun 2024 02:39:13 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 04:39:12 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 04:39:12 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Jun 2024 04:39:12 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B742B107
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 04:39:12 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 45C2dCun1493312
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 04:39:12 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 45C2dCIF1493309
	for openembedded-core@lists.openembedded.org; Wed, 12 Jun 2024 04:39:12 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 1/3] devtool: modify: Catch git submodule error for go code
Date: Wed, 12 Jun 2024 04:39:07 +0200
Message-ID: <20240612023909.1493286-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004C:EE_|AS1PR02MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e3b6ca-bba5-4c9e-3668-08dc8a88d891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230032|82310400018|36860700005|1800799016|376006;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MDjYIXsIR4DnZ2BmJbhJ8Y0qlQ1JfEMe0k8lPRQEpUqNwk/TVnntzQNin2KY?=
 =?us-ascii?Q?mJlJKCv+TGIQJ3KWtCjdCUPEMXBtp5OPHSxAQWCQ6FedzboFDkiFmRbuu8ZS?=
 =?us-ascii?Q?9+sDvGy3RD7SklZD06Xw89HJRfF6Y/mJUDEL06cigi2rqVgfoc4A5IsNBM6s?=
 =?us-ascii?Q?R1up6Fs5wHia4qPfYsbbdMlHvzktLLjYF60/w7gmRlylZKfxwelg+C7eToeL?=
 =?us-ascii?Q?n3ymOYzmjRmUQe+Bll6Fw5wAPLv2tm4Kq3jyOHeJ0ZU0ntLPetICKGB4paYJ?=
 =?us-ascii?Q?YpVrEO58c7UxFv3V0J8yBkRk3F2IJHrECLzBudKFj7Xdvq5lw6TdxA86kJzG?=
 =?us-ascii?Q?oFNUyZBZBHWJI03+ggEL6aPaWp5iu087xvTN8yNK8rjWkcT8Zm40fjIAU29R?=
 =?us-ascii?Q?Xc1834flaLeNcShWKJ3S3eJUzStNrdBjQjJdEBGrvlCfLLJge8cKZTx/F8x+?=
 =?us-ascii?Q?+F8cRXpCDs2MTLdc/tlCriqxWxjSz/BmyCE40v4daIaKuFWdyp+RisdofjwQ?=
 =?us-ascii?Q?E/HlCL4ckuxmulR5jJUH2CR88IYw7wx98OasP/ijMw8kZadMP5Pn11FYA03h?=
 =?us-ascii?Q?ybW3+iXkfj7zDlyOozusVohGEygHHnGW/y1s307PN0R+liPMgaXtkPaDpTZs?=
 =?us-ascii?Q?YQUGOi0NC9L73CNuNwZ0bgSxYojMkCQ6xrDlahv+KSQ7+3/1GNHwmo/xfhsX?=
 =?us-ascii?Q?TxhJ3MKETZtuqX0IHnoQuhq19kd6dHwhDh27XLaZpw1gA1XzOLiyqFRtA8Ls?=
 =?us-ascii?Q?MDkhcALRQzUcEWz3NcdZR4nKIxSipJ0u1EqsaRA67NM0239AaBy31x5McIag?=
 =?us-ascii?Q?9ilbErX/r6Fwpzp6HwpeJegHrKjPFK1KPnDOGSThaAqliQ5jdZ0gyUV69tNb?=
 =?us-ascii?Q?aQy54lQRJSBAzjaAtl3fOzpOCO62d8aO2IFk8hwlcNdIeipAYfAXP55nLN1V?=
 =?us-ascii?Q?u9T9ZfLiVwQFbxtIdpco/DYBea0alylP8b2X4hZnXssZMfO7bEjTTKxOeUiS?=
 =?us-ascii?Q?mTc5hqpl0UN9qj84LcXVqnuxExKDHEXHdjGS5mE6QmxT+5QhPyLezjcisg//?=
 =?us-ascii?Q?FtnD+Bj0AXx2aibZcPEiH9X+wjjjnalFnQmQMpTiXVp5rt2oOwSudL8JrRn/?=
 =?us-ascii?Q?G8P1asUSmbarlAAWBm4I+fCcPmps8u2wW3K4WMrebRBWj+VADyK6PIhRGUAQ?=
 =?us-ascii?Q?nujy7Hxcthu8S6Rz+tUKik5Hsa8kut6KCh94x3YhUfOKZdlMqnk1k1HPDVSJ?=
 =?us-ascii?Q?R2vv5jGiDDk1kbO0/AArMI630PsnN+oVmAerny7ZT5ZPtRFOkxXICuYYSTne?=
 =?us-ascii?Q?f3X7wb2U9h0sxUGYILIXC6heG7bYXURiXqLFf9WHaTVhn1EahRJLTjQA3iiF?=
 =?us-ascii?Q?lnhZwB7CU7orqO3i/4fX9kMdxqa8KLa+WNmMMLyg02FKCRNACA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230032)(82310400018)(36860700005)(1800799016)(376006);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 02:39:13.3035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e3b6ca-bba5-4c9e-3668-08dc8a88d891
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB8186
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 02:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200556

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe242408af40dd1f6e47d9b2b232bdc76756c80a)
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/devtool/standard.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 10d0cd3b7c..2beb058de8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -893,7 +893,10 @@ def modify(args, config, basepath, workspace):
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

