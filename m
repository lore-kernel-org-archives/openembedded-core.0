Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABD3C35FF9
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.89])
 by mx.groups.io with SMTP id smtpd.web10.58469.1742231592655450449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 10:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=OOY7K+qw;
 spf=pass (domain: axis.com, ip: 40.107.21.89, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNFMKG3rtCsU0qXPKa50FGzqxJYYUGQ7tWtUgZFD6rKDH0fo8hkpZhN1H/qfebaK3IHZX1G2bnnU3LL2+h5TCAgBiMD0PiKcIxLBcMwyoa2OSSLgRIRRwtCCWBFh5ktrecRcfGGku4MI/K//Rg2Dy0AAJ/bCd6kCS/X7m53D1xpU6uR1VRHqaudQ63rLOExAE+DxY4fZo2MV35tMkmanP2oh2m6vEHg6Xf8tHq7x6w5B5JR59LpeAS3qRKutHKJD8kedRn+J1YQFYQ1xo9agPwGrm9GMbQTYvG9H9FIby62AqJ9qZL8Mzv+/7Cy9Nht4KdXVe+4XeNbwWrn+lBsZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j00Ii8F+ZaA4tM5fFzgiF5upaWxU3HdXi+Dd5M6Q9YE=;
 b=U9Qts0qvTMGpM/7UVk+DW09nX051SsnfXSPGKUhNCvQOAxb2NFWvQaBQXjZTGd1W9AtRMsYhHtMRugDvWn8EkUId3g3zDXLm+ERS1vDJnkfv4EYLjn7hIgBSL0Oa0XkjeUyGleK8t0gnn7BCTFmh+eq3rPTSKJhRmleDSnNkJSuy3vmHBKCVOtesGthkrF7UbAUn+TJbvfmngcQXRQxGoh1jkC6ORHWFsm3TvEAfnKLSvTl6lIBE+4efLcxPiO612JT66/qzkBynJo3noxoXnDvxRc58k6tFYgoWQOCcdgIm65HsGkPwwODktGlwa2nHU39DkMN5bmh3jEmDW8ubcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j00Ii8F+ZaA4tM5fFzgiF5upaWxU3HdXi+Dd5M6Q9YE=;
 b=OOY7K+qwBZSj/Zdnj4iP5aTuxDDIvfnhvPGmhw5jpOM6MjMKfj2rnz9efEtUmAgdjgGAS11bpiu5TYByRgJSEC7rF6YVdsuwseRkbgqli9lIo/tlNxheX4fCcfR4lq7KdZFtGX22i4niY0VZFy1qT9O+NuWXdaZjOdGU0Pswpqk=
Received: from DUZPR01CA0192.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::15) by PR3PR02MB6346.eurprd02.prod.outlook.com
 (2603:10a6:102:7b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 17:13:08 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::bb) by DUZPR01CA0192.outlook.office365.com
 (2603:10a6:10:4b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.31 via Frontend Transport; Mon,
 17 Mar 2025 17:13:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 17:13:08 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 17 Mar
 2025 18:13:07 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 17 Mar
 2025 18:13:07 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 17 Mar 2025 18:13:07 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 63993328
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 18:13:07 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 52HHD7Ci3666764
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 18:13:07 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 52HHD78r3666763
	for openembedded-core@lists.openembedded.org; Mon, 17 Mar 2025 18:13:07 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] buildhistory.bbclass: Do not create annotated tags if tag.gpgSign is set
Date: Mon, 17 Mar 2025 18:13:03 +0100
Message-ID: <20250317171303.3666709-3-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250317171303.3666709-1-pkj@axis.com>
References: <20250317171303.3666709-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D01:EE_|PR3PR02MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d44aca3-ea7b-4435-c93d-08dd6576fcf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r6wBdK1lEPTtrBTDK+jRhvpwf29xkZRjPoYN4YSsHxeo8hqgufXsxnRnGPQV?=
 =?us-ascii?Q?og8DBvOpolaZD+hAEsjsunXdDnA/OvnOVKHxyBMv61Eawxwez7bypKHpPFm7?=
 =?us-ascii?Q?bb9MwMeKBzB8X51yB/A7Zv55IkQyblVtJ5lehPqo3DEQPTeEpslmX7jcpRld?=
 =?us-ascii?Q?V3pky9T0Brjoj2TfWFozJ/86ISxlCuQna41vcqR8tx4kbBgtgicaBjD+Af8w?=
 =?us-ascii?Q?JNTj5UUHkeaLGVP/Fq6edW4FiKbQ1lXB38oxaKTuu8NiFVZwm5Z3VQUazr7h?=
 =?us-ascii?Q?k2jeojpjf1rI1CMOyCJD6Uqrd6tCHW5OeNAPzhA06D2Xex9bfXmBow1FSBO8?=
 =?us-ascii?Q?zVDEkjxlrs4V1IVJuziqST1CJP9JgvDnijgi9p7IzFISF6IRzj6oQxKMFCaB?=
 =?us-ascii?Q?UcJ4b0T+AUMzjSwAGMCx8P2ORBHjRPJnoKURSeJ3haQ7tYut3qNkkZlJDBsV?=
 =?us-ascii?Q?NixBx25LlzIY6gOLpWvYulgprbymqAxCi2QSGc32R3MT3UFQJXXnc8VzrU6u?=
 =?us-ascii?Q?Aj+jjnM+tJWJnzgcWbDwRuIFtRQIMSk93D0aBSPA0xW1V+XecdQO+naKpAWr?=
 =?us-ascii?Q?2kbGycT2YmuN9sanigK1iH7o3XIDL4u4oQ+c3CmBYAEDJnkWcUvjGCFbuXnZ?=
 =?us-ascii?Q?b2Xb//wT9xCkDvSVdxWvS04Drbeb7IIuWV42K2IW4EVHnBM9V67Cy3RAWHPH?=
 =?us-ascii?Q?UjJFkzOzoKaT0PZOMGEmd/tpmI9kdKER3s2mGb52yrC41GOpGR9DxO8tRjjq?=
 =?us-ascii?Q?Lmc5FA1qtXH6KnsuB5JxruObyEzt7yp9ONVmPGrSKw+GtdQOtFnJYudK5Db7?=
 =?us-ascii?Q?3HFboEnchSJ+MU9Wai/49f0g6CKzb1SNKtITM+N6ll6/mCac/dAfnm7cjXeU?=
 =?us-ascii?Q?Xd0tat8vhDKazf9EGpjNlkU8kT/58KX/PZXzlVyiBEI9yzl1eqqYrhofblPN?=
 =?us-ascii?Q?AhXOwu6321+edQSgrsTf4qjkIfjrjUSUBmNVrqy3f7QuuQILI41vN03bZ9Qn?=
 =?us-ascii?Q?2J0fs/SFtTY5LGH+5JwlweTuOmhM2mXbEkRB+hGaeVrCRFFiQl2fmh+38GsW?=
 =?us-ascii?Q?Jckn5NvF8qnsPbEQr97UbTTTlCXD5mWr0+kAQiyX9uj//fEKR+7R0h988DZm?=
 =?us-ascii?Q?/hVug1gT5DZVvfsOo1h6wt0Q3f28mEY5vBivXXAyPnTIV1UFY1juucau7tSJ?=
 =?us-ascii?Q?hvRZ6/0XBiwNSdg8OzEfNlacL/K5WhE5L8pVC3MjahfoIqjug3D1SWblWWN9?=
 =?us-ascii?Q?1RrFEJxmNccaMzYAZWN4X/jb4KU4Gg7XBsbQCEki91WpXawSIXOp8eVBFuBa?=
 =?us-ascii?Q?FVHPk+xv1juXQ5PwzYGcNhtEdPrsYJkQhZv8qQldhOtlIqruGbdoAxrqS7qx?=
 =?us-ascii?Q?wkoC3DG9SOjNDwSFAkIG2DI7wwxjh0FoTuTv6QtQZGfky64f+tVv80U74ueH?=
 =?us-ascii?Q?xe/n/uJqfNsX66JtR/4dAsbyEKd5jxhVMrC35tr5d/3ZrNJFkgILPrq8iyfW?=
 =?us-ascii?Q?/Vqg38wU3AG9TnY=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 17:13:08.0366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d44aca3-ea7b-4435-c93d-08dd6576fcf5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6346
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 17:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213116

If tag.gpgSign is configured in Git's configuration, then creating the
build-minus-X tags will fail (if Git's core.editor is not configured) or
it will hang (when trying to open the editor). This is beacause
tag.gpgSign causes git tag to create annotated tags. To avoid this,
specify --no-sign as argument to git tag.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/buildhistory.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index d735dd5fb5d..fc8b7a9fa45 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -861,9 +861,9 @@ END
 		if [ ! -e .git ] ; then
 			git init -q
 		else
-			git tag -f ${BUILDHISTORY_TAG}-minus-3 ${BUILDHISTORY_TAG}-minus-2 > /d=
ev/null 2>&1 || true
-			git tag -f ${BUILDHISTORY_TAG}-minus-2 ${BUILDHISTORY_TAG}-minus-1 > /d=
ev/null 2>&1 || true
-			git tag -f ${BUILDHISTORY_TAG}-minus-1 > /dev/null 2>&1 || true
+			git tag -f --no-sign ${BUILDHISTORY_TAG}-minus-3 ${BUILDHISTORY_TAG}-mi=
nus-2 > /dev/null 2>&1 || true
+			git tag -f --no-sign ${BUILDHISTORY_TAG}-minus-2 ${BUILDHISTORY_TAG}-mi=
nus-1 > /dev/null 2>&1 || true
+			git tag -f --no-sign ${BUILDHISTORY_TAG}-minus-1 > /dev/null 2>&1 || tr=
ue
 		fi
=20
 		check_git_config

