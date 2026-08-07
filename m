Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1316FC5AC82
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:03:56 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37481.1786086233628566062
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 00:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=GCFZLvxA;
 spf=pass (domain: ericsson.com, ip: 52.101.66.58, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqklUM0AFKftsyogNVKevtP9tehO228PmuaZVwfNBHWbEOtY90P208C6Fe8QET6nbXwep58bvcTk0Bj3XKHoFrD9tFDKi4Pln4UbGke7wh7UrG+N+WVgiairQWNr9/Xm2pW6a2WyMyDWlMmXcF1DzwE8EXtpKHNaSn1Fqkh5SKgm24sWE3eG1soleGi43rw+S4Iv8tM8+XDWTMJ+H5KjkFEWj9TjZbU003Js+BIThZUPbbzacd2RC+FbuIguPIXfvCJ456dJW/N/UuE157TJbbJMgGzZWK8jZXeuU0K3+e+5HhJEJ3+47k9SRFXwftXYw9SQ/HPSG7DGhGTPBqKSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQcNkTpjDZPk9V2xisUqcRa1CZnzHsgqKB8Bsm7aVok=;
 b=C4hbtCjxbOXRgvQQcoDp7vxoX4cuK34Q9+QfOlPwMEd0PW1MlD5BRYuuwa+1NOlFUhpOajgejdO4+RhiTgM+meBlN4kEttZuDd3aujd6msH7edxShfcln3ell/x3dSPxoX7ccvpnt1KapjaNBHeUFPvRKqWF3Pnny1JsMcy6j14Uzpy+9A/mR8GDtDypCcNL6lZMMJeLd56Abv/h4k1qlNl2xrMiQQ9/3k8Nmw9KJvDxs9Uoxskw9bI/XZUUry7aHs+xZ6EHBzy+wM+nCqWK6UMRpeddUQEQ6b/vTx3PSGXG0DFBRGWVaztE6JDuO2oQZwSXqm8uwjQSrVExUi0D0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQcNkTpjDZPk9V2xisUqcRa1CZnzHsgqKB8Bsm7aVok=;
 b=GCFZLvxAEjLgxI9gF402yyBhFlJ9ISux/KSdmCgpmpuIbA0xokyH/1HziFyd9IqVUttfWpVNGcD3hM181CIACw2J/8hWo3GPaciRO6MyIUEVnRwIHe6CI7AsANmRWouxJ5HAf57J3OExPCcpsjzGxQQCSXiHitjZM4DI7hQUvFwH3VXDzt1iEOZ/Cp59RvAwke2g9flvcnQe65gmsPdefTMGMaRZJJ+XIAxwBJixFOuxGeRC9zlAAqsOzQwC9w0iWE26FVDFmDDJALBqOd3nGmzi1yQMBoa+AzEAuqbqOJ2jEwhd8suqlIhDXgIMvw5BhiMRX/OabbrMytGCV1qBEA==
Received: from AS4P191CA0053.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::29)
 by PA4PR07MB9654.eurprd07.prod.outlook.com (2603:10a6:102:267::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.9; Fri, 7 Aug 2026
 07:03:48 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::18) by AS4P191CA0053.outlook.office365.com
 (2603:10a6:20b:657::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 07:03:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 07:03:48 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 7 Aug 2026 09:03:48 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id A23674020B54;
	Fri,  7 Aug 2026 09:03:47 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 7B7A8700DBB0; Fri,  7 Aug 2026 09:03:47 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Ross.Burton@arm.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v3 0/2] devtool: upgrade: improve changelog extraction for git-log-style ChangeLogs
Date: Fri, 7 Aug 2026 09:03:31 +0200
Message-ID: <20260807070333.485360-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004D:EE_|PA4PR07MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: bf030d00-e192-47e5-118c-08def45207a2
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|10067099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	VaWe/u1ktBeF1zHsTqemFD1LsbKiaItWzN3bgOeOASbsOxkUV7ElDFMrzYft+Tv6WvsIwvsteOvAseW/ibTjSmYNRt9yZLKC1Q/86x7Wu4C9pg0JygpjT/ye0F2Q8e/k4VsyTN+o159iTCocNUUAHGiu4Mpv8ticccu3sqwKGEo+O1iYKPap5PnS9nGhfVnljanE2YJ9VKz1mpJhtjH6Ksp2Q1Rsfj0/qS0eW8BobV9bxnWrZF3eGiToOagM3mWEt9zEkPK7QqjeQ42ktDVD1A+p5gLmxcYSuQZas6x1kWhfPFA+/swIIOyqRMkP1JXkfE1OCrdsYazqD9GHdOO7jQDowYTpLaPUkQG/OmZdbPPfQ5RKbiUhazb+bC1XVq+jyrrm4VQR5PZHUhd4F5y7XAB83ooeafQvx1Y01h3jbSuEPwfzSmjPZIszqef134W79r2WCSmcLprMdwQsjhORr7ZKktZQYqDu02ckITtxTyCwGJ7OegSwsDJ47IJ/LUiJg7IuoLVCukzMQs7YKEslp71dSUKjEuByupTNhUr8APXRsgbKDyxPjSvNCCpmWwcr/TfmxIwjLf2bLx6CmHBvyrpjD0Gn7winWMGRyzKwJi3TyPgbsQtpSVjE95JOXYAWlYwIv59Cv9zLkGscHfJyYe380fTbLwIcHQBZtsvEDe3NWtPxpvHuRPWumN0LKUQ4XP7Wlx/PNbqJ6Nd4CqaSDQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wb6mYrdj16syvwwJRIgZmgz7F/H3d8219nXCgVnEdz5nV3dPQ1X30tJjqrNh6K+iDt3pbCSqpzGyDZpEtIaGYnRbwIu/o3HlSgsb+7pOjffwq5sENqQGAr2RbJzSmYTuQXgz1hbAQ9IRxS7wvk3K1T5Q+uT2LLgygaD/kkdQvCD181tSrOOj2S/rKsUX9D+A9p6kT8FflSwaVNKyGshuKb4CV7IF6FLcFDalh5UTEyELNWiXOHFW3/218IW3D7EB4Y7ay4fgl48W0tWt84VCwhN0OCjBnyxaEiTYzdMrSWyko6yGmbwHJxdZnxwRXu4dT8Tq9QrWiEze0f5FNe6fBFHfV/MLkP1VyE5fgEIr2XcjKWBEj7nSUxQvnrYDYBJU4lGrrXnj2wDK/4w9V2oXJ/pbSr4eHhvOHJjLH4IuWtYUhDQntiwG54JVPDiGFweg
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:03:48.5156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf030d00-e192-47e5-118c-08def45207a2
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB9654
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 07:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242986

From: Daniel Turull <daniel.turull@ericsson.com>

devtool upgrade's changelog extraction misattributed unrelated commits
when upgrading recipes like nghttp2, whose ChangeLog is the literal output
of `git log`, regenerated wholesale on every release.

Changes from v1:
- Header-skipping in the structural diff now relies on the blank line
  git log always inserts before the commit message, instead of
  enumerating header prefixes with a regex.
- The UTF-8 decode fix is split into its own patch and applied to both
  git-show call sites instead of just one.
- A single-use helper that only sequenced two operations with no reuse
  benefit has been inlined into its caller.
- The git-diff fallback is now guarded against UnicodeDecodeError too,
  so a bad byte in the diff hunk itself doesn't crash extraction.

Changes from v2:
- drop already merged patch.
- as suggested in the review use subprocess.run() and drop helper function

Daniel Turull (2):
  devtool: upgrade: call subprocess.run() instead of bb.process.run()
  devtool: upgrade: diff git-log-style changelogs by commit hash

 scripts/lib/devtool/upgrade.py | 68 +++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 10 deletions(-)


