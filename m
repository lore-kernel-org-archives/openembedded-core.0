Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F17CCD187
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 03:13:01 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.57])
 by mx.groups.io with SMTP id smtpd.web10.4426.1760152375253004882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 20:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=l7y62829;
 spf=pass (domain: axis.com, ip: 52.101.83.57, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0EYVvI3mYOcXSWs+o5CUKizA6h34tu1T/HtfARw+ekM87XcB+WmxvQrz27BI5g6PQqBAc5ra8VGHXBhVb/EA0Cs9UdQZNfEGk9Mp/HjL04LUjVQwVcrYIOCBb3n3U3y1bXivue222Vh8zRNcEUQldQgRM3TXa6JO8kgPeE6rO2yWqd3dm93g2uQMxnKWzHYsM1nugnm84X1f5ggaVkM2opwKAr70aG5DnGgZWejssZxqV/74uHmkNmDGzaq+Ogh8KOoCVNaQ3TQSgPnH6oaJ29PuzTRrLMaWcRfZc8zhCw/KRApKgyIEr4unpLVC1EbdUx8nF4vxH1oj4xv+E5GJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwUULi3c6/ABqIHBdVCnnDOPYtTortAXb+zXK681wFU=;
 b=iL2h20F8SkRU+SZKpZitNKz8rOFEt3BDXQCEo/QlIbWY22a1ch/avlZ4QO5AuF9rZEmaFbAM/czbKxaEaGvdMT1kh7B5tK3XtF41Rr7WV0qHrBiyEvuqq/uF/R4XCtcANDZs0s941OD4usrqt9V8Gm1u2zMdQ/qoAhjcmgOvDnGirj4eo12BJRASaS8EA5oqb2ky7oHYy4B9j34dwAXmHnpTMbL+Urkf5eI2zVP2D9ndoGxGzV5fsBEKQ64F3NuWVT/XpJxXlOCwRhrX0N4qEkKKa8RFo3kaSFd3wPZaqWtqv8lF1xfNAMawidth1Cwb2/sa4g9yB1JM8D3OTm/1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwUULi3c6/ABqIHBdVCnnDOPYtTortAXb+zXK681wFU=;
 b=l7y62829hWRB29/LCimO8zVQzbnCbI9uw2EmXvnnmGSnXazv3G8jN27Ge5Ih0+ib6IruIlV5i0VbtkGImr1dlt6K4uzbex3lvSCvAOhFkVX/vAik1HePK7op3+gdazJK29KfeiEyMoKnLdc0wenYM+Z2Q8eQuhGRJLu+7WaGpNA=
Received: from AS4P191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::14)
 by AS2PR02MB9023.eurprd02.prod.outlook.com (2603:10a6:20b:5f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 03:12:50 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:657:cafe::98) by AS4P191CA0041.outlook.office365.com
 (2603:10a6:20b:657::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.11 via Frontend Transport; Sat,
 11 Oct 2025 03:12:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9228.7 via Frontend Transport; Sat, 11 Oct 2025 03:12:49 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Sat, 11 Oct
 2025 05:12:49 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sat, 11 Oct 2025 05:12:49 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 6B6241C8C
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 05:12:49 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 441F8120675; Sat, 11 Oct 2025 05:12:48 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sstate.bbclass: Always show a progress bar if an sstate summary is wanted
Date: Sat, 11 Oct 2025 05:12:30 +0200
Message-ID: <20251011031230.2243947-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|AS2PR02MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: 6816e297-89f2-4375-0790-08de08740f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VAYadkOHpD1YFofmla690LgESSM17/ZlxEbmNxFZ7wjC2cbMJNGobzh5D/f7?=
 =?us-ascii?Q?/sCAXJyYF7no5LprPbr7k0c9Qne/j+IT8Er2eWl3S3qYeucbPUES2pvZ95Yr?=
 =?us-ascii?Q?pqHv2nzGl/by/wfuyq9Ddfzh9PDj6eoplEF8pG4lFultleicKTkNN3a4sgKi?=
 =?us-ascii?Q?7ev1AryX0hXByVxguXbXDsivgZY9StK0f85U57g7galUCZ67Y9MiiJVHq1n6?=
 =?us-ascii?Q?WwhldGMMaZ6CJDnRNP7+0weVjCnaTfTMgUNmox2BCOq2v/LA82Y6qDDk4nYX?=
 =?us-ascii?Q?Cly0kRdawIrNDxQF1CUwN69q/bkPgeroWFQ/31nwZDAK7mMN1GevJkO7PKNb?=
 =?us-ascii?Q?kdW7GaI2qmLuowp3rpmQJ+A8teeGRDp9YIKddZ/psBi4GHcvrJeLQ6tSwvea?=
 =?us-ascii?Q?4JyoPQ2z/jh5+QiW12ay5pLlmkipyVreEgfpqepJkpQZIyOoL9f0pnFuje3h?=
 =?us-ascii?Q?PIRlxo6qe7aHUBnjZiu139CCMkO1Eo0zVpyHVqiSMPxzAi8b26VLXlg500D0?=
 =?us-ascii?Q?7AILSb7HvsJ8/pGL+wkHAPFGMLwi1sAnef9/tzJkrHTp4NaKvC3I/DpKF3On?=
 =?us-ascii?Q?4B3k274EHvmqEoUfvVQ37CPb1JKc+M1S24qXj/Bq5hSjcqUdqUMFpbVZV3eU?=
 =?us-ascii?Q?a2aVTGKI+GK3Sy4GHtghI5V7ZYJnGxHUcT5vUDmEVHVARWqfaGckQfQoo5ol?=
 =?us-ascii?Q?tyHWIecwvvJfZ3diBkuTHmA+GTeAEkEozafEzAyQ/tcWjWsi7RdhTImkhmOH?=
 =?us-ascii?Q?oST6rOiqO3Fnz6GZLiYVwI7U0oxrVglfXqviN6egLQtZ2vKsPT4iHoGppYbr?=
 =?us-ascii?Q?czqBMEXt17SNGvWW8dxWC6UuvghAzPscYOGj0Zv9m260pRlwmupclB+IdCQv?=
 =?us-ascii?Q?2IfJu3sgL4Cyr4Jbd1PhC3Iscr9i4/t8u4ZnlewQIjwxc4vw54PwktDzAF/P?=
 =?us-ascii?Q?ij3sMToOQp5u6n7/FX1IKlNF3vXeM1y6nXyRJsSa/+aWV4w8sNeMRHo0Jef4?=
 =?us-ascii?Q?FsRjKMvVwnOR4GjlTOQXoqflNexNOvLkNXu0UXcqHthp6F3IyRczZsjoyqU+?=
 =?us-ascii?Q?pGF3oHK9Svum0u0K1lwxLjSQ39kt3RoftgZoFDnLvQasiz/MPnAKMUVdyrKr?=
 =?us-ascii?Q?nxIqE5mQfppFLW+b80Hx3RoiUpBnXBhjnWnWKz1iyEPMNdaRS0VOSZHb97H1?=
 =?us-ascii?Q?06/ZPPw3rbl5YNOJC17W0OAnFBgK2C/Ne1LaU7xFU3o9FHfEPdsOJeX4dKAz?=
 =?us-ascii?Q?z/hxopFzH46SY466hH+DMUTxXmzn80Y/lbvm3e+yHaE2LdhzZNrcsz2vCVX7?=
 =?us-ascii?Q?fCfOXt+oq/d6y/S3vWJm+ovzdD+xhkQmYDPIt6uJLAlRmb3DH3hKWz1TPHd1?=
 =?us-ascii?Q?NlTtDtbkdizMxtioj6qS8WNeOyyVaxuQdMhGauF0dFMwaaDTxycLGMPHPRTa?=
 =?us-ascii?Q?wgp3uD+KnxBhpyuj97bec52Eku6NslyUJFp/SFKKpkRC0RSwqUWRNqBODvvc?=
 =?us-ascii?Q?PCRxGdmXF7zCQGpycRD9Bz4l+JmLyDuWQ42EP5xhYcKufmh1n8wJpFWx41EZ?=
 =?us-ascii?Q?8w+Kc7C4AEIbUsRwH8M=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 03:12:49.7376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6816e297-89f2-4375-0790-08de08740f39
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 03:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224712

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

