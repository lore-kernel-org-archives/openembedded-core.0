Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D1EE9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 16:21:45 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17450.1771518096200604477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 08:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=g3PZwbKI;
 spf=pass (domain: axis.com, ip: 40.107.162.8, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xm3eDOmvs+2laM6peYPBhsiq62tV2OiSwTNyizDviQUKeaqXWpdkiNhiTzeMJC44o/y8gvfQXrUOPRc2npALoblnccJlRyZgq+1YeHjNuP2taZsjIg19Wv/q9u6vDZByZtk/+s8jE6JCg2j7KuG4GIKXySyseUAi2wuXzlMoFdH27LcTxvAZjb9vEZEnPX8FEWoAt2fmg/uWbFAs0MpduyyeOEJokcz930cY3gLaX8buZJJCigYLAwJ2GQLh8lggIV4ZrAtOPcUaGyBSr6+XB0Vh2cwjFLshm3kUfN/8vXTKUFyrE4ahFsmWX8e9ClTyFsUqeiR+bO3FQ1qekDsAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwUULi3c6/ABqIHBdVCnnDOPYtTortAXb+zXK681wFU=;
 b=xeD4ZnpPlUm4uknLFc/pK57XZDn+weXxOGMxGSdM1ghMX0sjvHGVtDQSABV+SC/y0elOoGk9c2qqfHRV+p97r9s3E4bU4irTkcDQAka4HQY6TfSZiSgT4qqvEVCDa+rNY7VPegfOzmH59YPXdr51ruoCZPKi+CVhIHZuaOqahzRrDZAqyD8RHhqx2joD9128l+mxqTQC4SJK2CI6ACqA+Mo3nnRzulIxdlEqa1rbbt2RQBeKdkrD3h+DNHP7/R1QQjT0whzkvuIvZeTn2rFladWjCccDKH6QHrWhL54xmlxHNWooN/E21/a3RQ/nfSkpCiQ/xa7Suy+e1GTdU6uRvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwUULi3c6/ABqIHBdVCnnDOPYtTortAXb+zXK681wFU=;
 b=g3PZwbKIpZQSeYZdxiv+rfdv28GoLms0ajXrFS6xqNGU26sxCOqgJnvl8OymamFlPMBFpVSbX2Z9csGJFvHpYXZJ5T938taRvWnTbECMBhwoG0W13AbBi0y0HvTi017oN1gtj+TTl4eul8vkCML49MfpvQ71KTQsZ+LXqStvaak=
Received: from AM9P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::17)
 by PAVPR02MB9039.eurprd02.prod.outlook.com (2603:10a6:102:2fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 16:21:30 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:20b:21d:cafe::d0) by AM9P192CA0012.outlook.office365.com
 (2603:10a6:20b:21d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 16:21:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 16:21:30 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 19 Feb
 2026 17:21:30 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 19 Feb 2026 17:21:30 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 3DBA53154
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 17:21:30 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 380E21202C3; Thu, 19 Feb 2026 17:21:30 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH][RESEND] sstate.bbclass: Always show a progress bar if an sstate summary is wanted
Date: Thu, 19 Feb 2026 17:21:17 +0100
Message-ID: <20260219162117.2565725-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000091:EE_|PAVPR02MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: ea8d17c5-4a2b-4a0f-0d91-08de6fd2f0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WRBiP/0AAI+CP2b5w96K3dIvHhXPyZt498SQfVwPBgFBlXNKI9GWWhXikoWc?=
 =?us-ascii?Q?cpeB4s3gBRDA9RqAsHM4HSy82w0aNAOZwP81bNtrXQZPhJyRWxudMS+ZMAg2?=
 =?us-ascii?Q?E1KkEIk1YPW6cM6XyFQUlFNibRfWWwNKi+d64ufZIRAEN10uOYGiPbDhEL18?=
 =?us-ascii?Q?dCdZJRLhR+dze8EiLB0qPCLnBGl1kKyOfKkBNr3yyEoYA4JaK9sUFW8SHNPO?=
 =?us-ascii?Q?rYJcQLPr1CQYRD6Hvr640eMUl8rk74iPtuUR4lh7u7tII3zrWTIkrE9jhO6c?=
 =?us-ascii?Q?VDLgGSpwV9+83KMNnK78FNukJgxZyN14eEsMkxJVE6sXoJXJODTNXRdKz2RJ?=
 =?us-ascii?Q?HQA6Kso8Mal6441QPnx+YB7Fiw5D9yG+GumobmDhp6nZPZJR5VNm+31utVYi?=
 =?us-ascii?Q?HmiUuAkpKQep6ceGNQZMSqCIcbpRJ3a5L8ZWA8k9cssl+b10/Ep7vYy8pRiQ?=
 =?us-ascii?Q?MW+5rzaXBOn0m4/syFY/5xXminCbjbRO4IWHWkOusz7ufwW0EhNOOTNplEYn?=
 =?us-ascii?Q?Bnmd1qyEM9KDP9RVjwWy6LNRNcTsV7ni8IyFH70kX6y8yiFPbW/Ec8aMW60O?=
 =?us-ascii?Q?QH5Ntthcqw2ToCQ1h1EO2nQ1/toAN94+i/fZNk2npporPqJVlfDYe4gyeXYc?=
 =?us-ascii?Q?0gIZdVuvueRQfDrNGF6EWLoqcv9UEOTuV8t3/xB5DC5qhJzCCgVXyLNUvAFX?=
 =?us-ascii?Q?ee1Fm7ljBCiO3j9/2Mjp4frbckCohzbUdMsCFCc5zOIm+6l5HOhF8U6IhrSJ?=
 =?us-ascii?Q?bBE5T3r072n59XieGjkOTiEZCxfj8AjQXLrrLtgBTPehYxelI+G+gGVRQFl+?=
 =?us-ascii?Q?GtEBTkdErmHvxe51yZdjqjOX6v86ff1LlM7adQ6nRH5VyN1Wf9wNRVv39Rj0?=
 =?us-ascii?Q?4WdM6ncSEUYgscZWXBPKsSvI25fO0vJoNg+4LdKYY7tqGSxeUauWY/9QLRyc?=
 =?us-ascii?Q?/UArk3LYFD7DR1SCy/qsQ5fi2oTNObeATatT682A5/+B12/W2JwrpasseGT6?=
 =?us-ascii?Q?cPiGPfjJuXuM31xNk97jJBR17oVMFKUwvO2oOEUMmavwowVbuUa5WJKugKdF?=
 =?us-ascii?Q?p2rdvnXs4MAjQpFYx6mIVeEC0ruBXDYhlMK5hHBkn/EJ5MAdIXZdVsGzuGlr?=
 =?us-ascii?Q?jQ9lUx+JYjpKSie2954Ct+Xmqpn12Of/tPqEjHth+RGJcvpRLUFXToi8hxSR?=
 =?us-ascii?Q?p1xBl37UJk9nQZDEpijKTEpamiEp5ctOINa/g4WWYvLMRRjlWVWylt3GPiHc?=
 =?us-ascii?Q?mREdN8Y+AHbHPDDgipg+kEtQrVlCBXnKMxK0FnFDS41/WhD1EocyBkE8A02c?=
 =?us-ascii?Q?pMhvufnyxvBrouds0pYV3kBU/lcBPIfRkOZi+kwtX72txqthFtZxO5FLIhU7?=
 =?us-ascii?Q?h2+jamzSjGw7FU+xT/sVbFe0HVWacIX6K0t9REOYDoyke2163p+UqzBc8NtR?=
 =?us-ascii?Q?PjWSB5hLACHJCdyuRbknBB36UdfrgQhJ7X1+q+Vo6ELkbPNIJQbMvkmBOoPY?=
 =?us-ascii?Q?j1M4+4+PXU9QXcP5FA8g/J/kj15HNOpOyuq/aqovMo8Uu1ZuNT0d0T7XP5up?=
 =?us-ascii?Q?+pgqD8w+hm7vLkK7iHsnYaUf4DEEH7HnWICDGDf92p9pyQg2QHEN+GTLGwkk?=
 =?us-ascii?Q?OlDPGc3kRco0EoyV+368VYEqsiWrXmm2TqpznC5rNAg4UJMiobAV0V10R8nm?=
 =?us-ascii?Q?bQqlHg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iw6/4otzwrX+GXcOZtPhv7L7TJmjEzOdoJ0+1gn5ZWLeS+8+O/Z90SQaWTLeqMIJXKcawrqfDC0Umeqv4HAxz2tCSYBd9M5unop7TsceejewDfx6cVqHcTBon+/APLaOprUGPNa33iY3YRZuay0J29NEf9DvfZNDiFBI1yF3GKa/xLiufZuVbW1sMuTW8FzBkmnYajHfq289hBgkjKIoR0R94hhRTlqul5y7fBx1qMAhBdnGg5Vk6BpilIcj+WTAzGGHI4GAStUcOkC5Q7J3FCm6s7e+Ih1WSZTvV4hsaCs+pGPDe4lSO+/v/uo7L1KbZrQDD7pv+NhqwDyper14/uTiZz3TSdCullv+R07byf6CRrv/0VY3df7Z3Lp/3/nzXQ72Iopd8ozVxLSAjN9q4U/zFGq5pRsOiwf9L0IYFfpEdEVBeJHvFZediaX/P3aE
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 16:21:30.5618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8d17c5-4a2b-4a0f-0d91-08de6fd2f0be
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 16:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231434

In case sstate_checkhashes() is expected to show an sstate summary, then
always show the process progress bar regardless of how long the task
list is. Without this, the sstate summary could unintentionally
overwrite another active progress bar.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 2fd29d7323..6f72490065 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1048,7 +1048,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, c=
urrentcount=3D0, summary=3DTrue,
=20
             ## thread-safe counter
             cnt_tasks_done =3D itertools.count(start =3D 1)
-            progress =3D len(tasklist) >=3D 100
+            progress =3D summary or len(tasklist) >=3D 100
             if progress:
                 msg =3D "Checking sstate mirror object availability"
                 bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)),=
 d)

