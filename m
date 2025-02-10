Return-Path: <jhaller.oss@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E83C0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 10:13:09 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.54])
 by mx.groups.io with SMTP id smtpd.web10.47476.1739182378457805395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 02:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@Philips.onmicrosoft.com header.s=selector2-Philips-onmicrosoft-com header.b=G41P8FAQ;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.20.54, mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iql9S2APRXWsTAvBgl0xYrLqWx0L5f0XPWFMJCAautVkY+WOSR50pVDB4V05gQo/VYtkCUAR3S6Tp8DUMU/3y1u3VMUkD1oDRXv1MK/oNC4SEDZrEYeVIfMGsI8kLOLxuTS2xsMMAP37FHzkOeHHzVp+kBn8fpC7XZQPOLvftperjpejF3P7JfptJwCDTBs1DE4kdNro/FRwLZTsyZLvouINUttmSqFAoqLhneLjgEQHRiP92YXtYxSPLxRICUlEqgXQlCfsfafZko7kZZhX4jrf8m/4IXczc03dgzzV1yoYpUCEvIUnOFjRaEyhFYOOEJNVGdeBMZEDGv9uDWO5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i14+2O/biAaSYxej/XfG+kS4tfUHNthVg/0X1nBIXx4=;
 b=ScEgsI2l6RJ1I5hsQAhJVBq/WmuevN/BAFwpLpJrCi7gHmNeKcBT7QF6t6hJAy91MiJvFTqUlTUdNFPZyK7kDhhj4tKpJcswIGSZNcgrFp33D+j01BSNpFXMUkLPqctfix7jUpCTkBbBhXW5hnk5R+VodU+2V5xidnWe/tSMXchJLlKPKXCv2wSl8AAKdSTbMVkDjp19Oc636Jhz7ObESoWSR1AH99u5otQhYjJE02c0kkmNPuIREeG6tVk038JlZi7fTw6TJrpcAMWwTsWIb9D9NuKbu7AftHjijcbrEAv9uEe8KinH1UTiBbDjmf5aqBOREpKgTczir/lkCm5PQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=fail (p=none sp=quarantine pct=100)
 action=none header.from=gmail.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i14+2O/biAaSYxej/XfG+kS4tfUHNthVg/0X1nBIXx4=;
 b=G41P8FAQFVrocltozaWRndrSoM0rI/8qKePstJvfHMNR6xGp0isRQ8OHqs5H23+kGiJO8vsA4QxLO7MHMaYUnnxB1yr5GgohKZ52G9LIHskWWuZUyLjH7axh10w2Nv2aml7EEpeF7RRvsDnbZjr8WH5K8mB96LyD9O6nO2CmqhM=
Received: from DU7P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::10)
 by GV1P122MB0351.EURP122.PROD.OUTLOOK.COM (2603:10a6:150:e6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.31; Mon, 10 Feb
 2025 10:12:53 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::e1) by DU7P191CA0004.outlook.office365.com
 (2603:10a6:10:54e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Mon,
 10 Feb 2025 10:12:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 3.248.88.141)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Mon, 10 Feb 2025 10:12:53 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id hK1ttRSuFQb50hQmbtQhdz; Mon, 10 Feb 2025 11:12:53 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id hQmbtVpR6FWGrhQmbtchua; Mon, 10 Feb 2025 11:12:53 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xux9.bbl.ms.philips.com (bbl2xux9.bbl.ms.philips.com [130.143.221.94])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 04634184810
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 11:12:53 +0100 (CET)
Received: by bbl2xux9.bbl.ms.philips.com (Postfix, from userid 1876)
	id 0075D52023B; Mon, 10 Feb 2025 11:12:52 +0100 (CET)
From: jhaller.oss@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Fix sstate mirrors with BB_FETCH_PREMIRRORONLY
Date: Mon, 10 Feb 2025 11:12:52 +0100
Message-ID: <20250210101252.219539-1-jhaller.oss@gmail.com>
X-Mailer: git-send-email 2.43.0
Reply-To: Julian Haller <julian.haller@philips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C5:EE_|GV1P122MB0351:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 83111c43-4544-4ad3-86ab-08dd49bb7b4e
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|48200799018|61400799027|7093399012|35450700002;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9M7vZpCfTFX6mTxAAN1H+TW8PMTRYqK/Oz5n5Q33qpe2fCZ1TBwPioQ6oj+q?=
 =?us-ascii?Q?Yd6ce2k8XOZE7WRI/HA6IDcI7oZOks0AEz45ZbJ3+3pCMF2afXmtMh7gZSPn?=
 =?us-ascii?Q?XLanHZLr5syRptR7v4+vy5Our+6XGl6e/N/8RbZBIMT18gK17Ug0s9h4K0Le?=
 =?us-ascii?Q?vK3bhFiOqsBRFo4OirJ5Qz1DcG4mNO1YkMzpe3KflJSMftVgamqScj45srvc?=
 =?us-ascii?Q?t5DABbx6SoaAsClZVVJidJyHwGj19x1Yq/Va8JFhxGy+C0ogvILwTk6Vmd/L?=
 =?us-ascii?Q?8BR3Uybfi+DhkpMcnSYRuLsbnF6Uym95YD4dL57IEKU6w/C8vHT3V51KO+l9?=
 =?us-ascii?Q?keFAxGLA0ZUHhSt/7XpLXqqcNPChKvzK69P7GeZ/9mHuV2ASVKjiOgyqCdqv?=
 =?us-ascii?Q?aPyWZADIMO65s3eWaX3bLslPoG+4cQV3/1UGxmC26QBmZqkC0BOLvtUI1zoP?=
 =?us-ascii?Q?tiEZb2A4UQIZp16KH9KLeFb5XSnaQKqNUgM2U59zyvaGhvbd3yU3m8Gj/eSJ?=
 =?us-ascii?Q?dN2ZMkoeUVfgC6j1qomsXQQgjAVOOWdM0tZHaCia0SGv9Pr9qyPlP+IejfXw?=
 =?us-ascii?Q?0+8GjIlYhF/4bc8zNNzTuzKTNBhOToEGpshULt/OhaVENmT+99W5PzEsyQ7B?=
 =?us-ascii?Q?XxYWjDTqK8fy9NzBHArZokmBjc3pYtWRxYVh9HlwIyWnDISq+WbL0oqhDW3h?=
 =?us-ascii?Q?+5oviKF2ppVyOp8ICHhEg/BALoeRJZeMAFIMZoeQ26iqv5cZ7QGz16ZPCcI0?=
 =?us-ascii?Q?40bWQ0angb9LB39/EIxbPsgq3B7/M2IEAXO+CLePmwyq0N/pzQPTg+ikn8tA?=
 =?us-ascii?Q?lyezBqF1pvjldnL8voCGGw3Tl+c6naI3DvJeT+Dw9ctiFs7ZdZu8lqmzcRtc?=
 =?us-ascii?Q?Z3qwhAtVYs8rql5DNfEke0FFgvXB+7axs9wdEJJ5u48OtNW7FAStMozDK8J9?=
 =?us-ascii?Q?uqvpKP4ApGvF6FygA51jiJO5J2BndVFf9ucc91lHFHJZjYbRfPB6ioM3cSPU?=
 =?us-ascii?Q?fAREn41chus2BDD6XnH6s7yXqyg4dgE0pBdIuPpb9vPYYb8cNAGIBuFVaLUl?=
 =?us-ascii?Q?YkGhJYJbf/MbhwwPJAcGQZV5M4PXgkjH+soneDf6SnGG1wo48XCbIuR9zkqM?=
 =?us-ascii?Q?oon5sJputYCbwHkmQ/0ppbrBVNvCIYJJiOnl1Kxp2V/fd239XKwVX8cdvnJm?=
 =?us-ascii?Q?w+PiGjGRafOofD5sXWiQ+mpT9SMIUctAqHjKSmuR3RSKNO24fvkCTEuKq0Gn?=
 =?us-ascii?Q?5A9/G0q1H0fafDSASyuCWh9Kvt2Q1JxbJrcSLsrocGvkxG2IVpWnkhD0rm7J?=
 =?us-ascii?Q?dcJS8QfDMCa1CU4h3uWHkr4RAm5flrldreDuk1Lt1AB6wvOvb+yrfkv+oHtQ?=
 =?us-ascii?Q?jfGD1OqzOxdrHRCSxnPAY0R1gw5+jQ3IgN2s2VB2giYGQSVUEAbKrlCoRnkq?=
 =?us-ascii?Q?6AF596uSKTpZtuIOYHYF7Zws+bUpJPNS2DwLlQyucIMs2WjBNM7FTMjXT0Jf?=
 =?us-ascii?Q?xD+4pXxnVyIJGgv/pLXKxDctxAUL5OQn5yb0C2f3A7uz4Viv/E35YEEPzw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(48200799018)(61400799027)(7093399012)(35450700002);DIR:OUT;SFP:1101;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 10:12:53.2934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83111c43-4544-4ad3-86ab-08dd49bb7b4e
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P122MB0351
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 10:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211085

From: Julian Haller <julian.haller@philips.com>

In case BB_FETCH_PREMIRRORONLY is set, the fetcher.download() function
sets BB_NO_NETWORK =3D "1" after downloading the first file. This alters
the precondition for the second and third loop run, disallowing network
access entirely. As a consequence, the .siginfo and .sig files can
never be downloaded.

Fix this by creating a new copy of localdata for each loop run.

Alternative solutions would be:
- Setting BB_FETCH_PREMIRRORONLY =3D "0" in localdata
- Setting BB_NO_NETWORK =3D "0" in each loop run

Both alternatives are highly dependent on the concrete implementation
of the fetcher function, thus making them likely to break in the
future.

Signed-off-by: Julian Haller <julian.haller@philips.com>
---
 meta/classes-global/sstate.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 2c259a6657..eb988b2ca8 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -747,10 +747,11 @@ def pstaging_fetch(sstatefetch, d):
         uris +=3D ['file://{0}.sig;downloadfilename=3D{0}.sig'.format(ssta=
tefetch)]
=20
     for srcuri in uris:
-        localdata.delVar('SRC_URI')
-        localdata.setVar('SRC_URI', srcuri)
+        localdata2 =3D bb.data.createCopy(localdata)
+        localdata2.delVar('SRC_URI')
+        localdata2.setVar('SRC_URI', srcuri)
         try:
-            fetcher =3D bb.fetch2.Fetch([srcuri], localdata, cache=3DFalse=
)
+            fetcher =3D bb.fetch2.Fetch([srcuri], localdata2, cache=3DFals=
e)
             fetcher.checkstatus()
             fetcher.download()
=20
--=20
2.43.0


