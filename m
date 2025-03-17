Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B327C35FFA
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:21 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.77])
 by mx.groups.io with SMTP id smtpd.web11.58666.1742231593182830918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 10:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=j665piqw;
 spf=pass (domain: axis.com, ip: 40.107.103.77, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhkLq1sj6IFOBqGqONDtHynWP5kHcnpsVicwIJRN5FyWmVDIe6DudNkQbXPnFhT2Gp7f7d9NM+buIlOnLQkkbuJzkBP2RBrWl9toQRtWvKEcKhviEme+usqvRMSDcnqrgi9HnlFmqMQ/adnD4CSPsG310f9vYB4vgRe9kuWWLq5tXxWsy25It5wIyPHkRGssa8tHQa6o4ldz+cr1Y48eTkJvNr9krrDf52+BaQ73m70fnW8jCUxfJgZe9B0Rkv96GW2+9aC0TV3kVDLwr+cj6+TDqDZFBxlcsLpYwDvC1fzSkQSVcweIiRoIJ4nKvDgxjWM01PHeSiS6d1QbAy39Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBseHXtsEi8cy9wEMlhj2xUoXRmGMSod/Qm4Cgu59Lc=;
 b=jmedjAiFNWJUGHsz2FLYBUeBJReHbcCmem0VQMrnjopSsCL/lp7lo1mVVccHrUEFU/X4SH4JwhOG3uB3Ge10kRjRCvlwc4/k+/dWMzC1NCVG+QyguG5f6aVDlhkFZ48Dt3EkDx4jnvwpqpHrZiOjGCtBBuKD1wD+8PeKAMYNeKXYUv77Fj38C8qkjeqlZkLWioazNWwMqGa/OCeWrcX9mEPgdFpas9pHHy82vuW+ooiVRaHjRcovR14EbS5K+c36qtoJe1jvUf3FpAwwbiufz3221oDXc/gA4FUiWTiPFmL6yNifupEVlqObbXZXoXpgnlLMXjSVaUX7w1e7a1lz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBseHXtsEi8cy9wEMlhj2xUoXRmGMSod/Qm4Cgu59Lc=;
 b=j665piqw84MucmTKb0FEVBtdKUIiEZRGq0nT9ZT4j178MsLm6VN7sToMdxg3FbBw6M/ZklXfpKLGL+XGt5oFwnzPAEX1gNKCSKsinqT8uwlDmym9dB2q4m9CSM290rtXMpguNuDYHsxQmnM0Wd4N5QwLms8wOo/2IK4PmS6AZrU=
Received: from DB7PR05CA0044.eurprd05.prod.outlook.com (2603:10a6:10:2e::21)
 by AS4PR02MB8696.eurprd02.prod.outlook.com (2603:10a6:20b:58f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 17:13:08 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::29) by DB7PR05CA0044.outlook.office365.com
 (2603:10a6:10:2e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 17:13:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 17:13:08 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
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
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 41A3CB4
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 18:13:07 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 52HHD7DJ3666760
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 18:13:07 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 52HHD7Wl3666759
	for openembedded-core@lists.openembedded.org; Mon, 17 Mar 2025 18:13:07 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] devtool-source.bbclass: Do not create annotated tags if tag.gpgSign is set
Date: Mon, 17 Mar 2025 18:13:02 +0100
Message-ID: <20250317171303.3666709-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250317171303.3666709-1-pkj@axis.com>
References: <20250317171303.3666709-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|AS4PR02MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 194d13b6-8f55-47ee-c7df-08dd6576fd26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B9oNnf8sdD2kr5wzAHfm8GhjaUbuGSiBY7q7Cn40RDO4MOOlnZ3hrEzoTym7?=
 =?us-ascii?Q?bwaPapARsdGOuXhA+NSy2KpT7accKb90987wqTdcxqHFSuAEIknwC2xIuIeV?=
 =?us-ascii?Q?kZF4hWOV1rVy/nrwgm9HmxDFWN+7vlJ8M+972BsT2YGY3CPZlWsjlQVKu0Pd?=
 =?us-ascii?Q?OTTKniWEUpMdO6iEEudFJ4okyGN8Ho/u+tl7EPLf0t3BuoCYn36JDT/HHgYN?=
 =?us-ascii?Q?MM7tcLz0An6NIJco0Whhn0uwwZwDb9o5k67po5WyyATxk7KMLZ2O9F3yLYDr?=
 =?us-ascii?Q?dJXs66uXxO3UFio2+TAqljKNZCPmPftuk+qnISsINm3gk8OMQHiJcdAfuOrr?=
 =?us-ascii?Q?lFJX691iFP9xXDMMHbXRorpw/4n09iIo3RaRxHapynCwjDvv+dDqponEMsdH?=
 =?us-ascii?Q?sYltrsGG12wrm3+jnOeHIGVrp3B/kBaztMiRTizBo8/vl0jFi+ro6SZfOc9M?=
 =?us-ascii?Q?MdZUf9Ry9VJhmMKPqSygmc88Ek5XmBdiYnUbspgmkFGVyDsBbFQEGrd2rmBu?=
 =?us-ascii?Q?jDucRR9uexK/e7afyiYLt7lHqlgtV+IXYzI0Azq53VhBeAZHV07uLzkZq+Js?=
 =?us-ascii?Q?+3rGDEZzn2NlCucipWLh1kZy1/ZoGAN5Jni/ayZ73b0fnWMz9n8frQeawe+P?=
 =?us-ascii?Q?bB4gBH8FBMYhTf3Fr1PA+tOJtm4Axa2688suUEZnABN7ZdCODQ6x7DiNPLdC?=
 =?us-ascii?Q?YZIpeoBsz5aKvu9OQVNu3gRdbc5z9M1+7Ys+ce5KeMF8RaKlLpbOXoqGpS+S?=
 =?us-ascii?Q?aLIemjnbKaEMgpUshdYXAKlepPAwvHwZdrRGshXdFIRU3CbwM++IUNjK+pnM?=
 =?us-ascii?Q?Fdh0sQT2rrRGh0CI3e03+E6b2pzdXU7nJEwibMSS/SjE7+E8f7pG1hGIuiWs?=
 =?us-ascii?Q?hA6kyn4W3cVCH4Z+zYoBVAeD5ZZQ+wB//O+/2+s9g5SAcAW2C8FEVrHrRJCx?=
 =?us-ascii?Q?EztIhd2xvOdRFez9cIJBIPwI0Q3IC5WsUE75shvkkHIH9cvkBVj6VkkXKnM2?=
 =?us-ascii?Q?fzQSnNcJXYtFvnAFxo63ObEgETiiXv7n1cC5lNdrFXBF7uBsaWL7GHXTXS9C?=
 =?us-ascii?Q?QL+gXYnthSqS9lx9/1N/E6HjjPLnnuxi4MgHh6U/KhZ8w5SQmrv4nVDHeJQS?=
 =?us-ascii?Q?jh/PiOupnG3qnP48q34PPKm4QmTWB5stPdTa7ktTJIUYRGdGNsi7OSZHpFo1?=
 =?us-ascii?Q?yVQtS+Us9lDQ/jcwLvNOM8dTsNd1Dj9p9xahDrDQ0ujFQv+hqswPaEulG4xF?=
 =?us-ascii?Q?0ylQcgbezFEqTSV9ouDi9hI8hH7GPGqrhKJgOJ2lI6SyA+55YJZX2poQubHa?=
 =?us-ascii?Q?aCgPkWxcYELA/zUOF4PRg4xaBbsjvcUE3k59d+NfUQK/lGA1KH5IeCZCDxJ3?=
 =?us-ascii?Q?l7b7M5rdeFkIJ6vPtlRHb5Q1ZP3ED1X/HMVDKQsbYOpI4RQQguCv3F/8ZDHw?=
 =?us-ascii?Q?Pcl/RlEmS+aTQ1y8tUG/Z99FKk4hb4aPWqfs3GwK1QnxauCloNUhaQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 17:13:08.3576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 194d13b6-8f55-47ee-c7df-08dd6576fd26
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8696
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 17:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213117

If tag.gpgSign is configured in Git's configuration, then creating the
devtool-patched tag will fail (if Git's core.editor is not configured)
or it will hang (when trying to open the editor). This is beacause
tag.gpgSign causes git tag to create annotated tags. To avoid this,
specify --no-sign as argument to git tag.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/devtool-source.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-sou=
rce.bbclass
index 3e24800dcb0..9762003ba75 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -179,9 +179,9 @@ python devtool_post_patch() {
                 # (otherwise we'd likely be left with identical commits th=
at have different hashes)
                 bb.process.run('git rebase devtool-no-overrides', cwd=3Dsr=
csubdir)
         bb.process.run('git checkout %s' % devbranch, cwd=3Dsrcsubdir)
-    bb.process.run('git tag -f devtool-patched', cwd=3Dsrcsubdir)
+    bb.process.run('git tag -f --no-sign devtool-patched', cwd=3Dsrcsubdir=
)
     if os.path.exists(os.path.join(srcsubdir, '.gitmodules')):
-        bb.process.run('git submodule foreach --recursive  "git tag -f dev=
tool-patched"', cwd=3Dsrcsubdir)
+        bb.process.run('git submodule foreach --recursive  "git tag -f --n=
o-sign devtool-patched"', cwd=3Dsrcsubdir)
=20
 }
=20

