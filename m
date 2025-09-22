Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EF5CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.3])
 by mx.groups.io with SMTP id smtpd.web11.46844.1758529007814472072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=iTjYyF7D;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.130.3, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knpTmoUYGJ1cPdyt/Waszrj+UIGjkUVV1/ySzxGgjaUwOA2yqAbBzw6JPKSMRsuEYNfn8SJwZkHpWt/HZX+6h6iKpmH+145ezAfu1EZArqwSbx595uHGJQeHMdDOdAPD/SFTdZrgOO5V2lRcNEnFFEnHl2WDsDpHZLPhzyQYQ3Jr0vQ09LWJtyuLJt7tFX+vbW0eTkq5WicX4tjUvC1OaO3acZijZfKMNwwQqCxxvkHQ+gWd7qHPdsfgC0GdNN5iG2yujbF7eH2s518XEWcSW1e94n7/DjnIwrdakDd7SBTsnRJ91vVURF5oDhSZDd1919hsU2f373TooOlL4wLgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dRhSJ3oBJQBVUlqj5VfPN0hjJAZvzIOoEY2pmzfQbM=;
 b=v5UnG0iWcdd1cSL5TbfiDGyZni587UYAlvEHrNw3as9k9o6f2ttvDWWwKDeCG3Pf1nLZY7HDJMn1HPBHqcHx1si9rwKc6nCydRTp5Xg022soNK/pHiBzpFbqQBLVcHaX06tC70HwonJFo31LXM5r03dQNvv7a1qWGj+88v7ouhbenRREMSBrdDoPyzrQnXbr4pNGgobixzUn39wW3v94bvai6KMf7CPbzDRyl0mqqK/sytlgQXSZhCOSDZdnJ5NgOP4PksrWYkB0ol5JY+rrjt9tIVVbKbnzoftRihoTtWL7nhypL5iiFb6iYi/cyCKrPWVrwDgQ7L1ckuN31fYHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dRhSJ3oBJQBVUlqj5VfPN0hjJAZvzIOoEY2pmzfQbM=;
 b=iTjYyF7DDXNjKJ25OfJG3xoojaqF8cnX3FmIX9Q42jvqn8JdCtblyAU+L9ebUihELc2Cf09SsJ9ktj/aqqFFlohDcGF7fniRdmcVBMoeVtHd5dRVtUGNZGqIRZsF24OXowFMUFm8M8G0pV+wo9njD18TEax2jvM30OVHuvmtwyM=
Received: from AM0PR02CA0005.eurprd02.prod.outlook.com (2603:10a6:208:3e::18)
 by PA1PR06MB10114.eurprd06.prod.outlook.com (2603:10a6:102:4ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:02:01 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::8b) by AM0PR02CA0005.outlook.office365.com
 (2603:10a6:208:3e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 08:02:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 08:02:00 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 10:01:58 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: bsp-development.geo@leica-geosystems.com,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/8] systemd.bbclass: add ${sysconfdir}/systemd/user to search path
Date: Mon, 22 Sep 2025 08:01:45 +0000
Message-ID: <20250922080151.3483394-3-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
References: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 08:01:58.0636 (UTC) FILETIME=[2BA1EAC0:01DC2B97]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|PA1PR06MB10114:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9d2356-b34f-42d7-7adc-08ddf9ae4ef7
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ebDKrS2544bSG5k0CBnLFYV6ukwgSDPo7i1V75oFBI2UZvgAZK6aySmJkQun?=
 =?us-ascii?Q?ldHy/p7X9mNYQLsUQskjTjkYDn20DF39d74X9YdKk878+MZEUI5hTVvgjvyk?=
 =?us-ascii?Q?yd0XpVtdw0SQr581J76OaONP1PFpVwg+akEYhRZwgN42XTREss+5bndtBOhL?=
 =?us-ascii?Q?23xSSoF9MD72HverYBDdO4ymzYONcFsbdKzD+nk85ZC9XEhf1XeY/EoLivlx?=
 =?us-ascii?Q?+qCQ0udaxBdtobrhDgPh2Ooy0dMNtKwHDyGUa/Li0SikggYjlJggGYLu+pvr?=
 =?us-ascii?Q?f/0w0O19mb/09Tt5LYnkIzPLG9dc0jzqpN68dudBYjJQ53e2CUQGedCwrmp6?=
 =?us-ascii?Q?LAXvYRjMwUnW/t99OlKosvwgFUix4KOlFYM5kEw6Q64iyPcax3vL9w7UHa+g?=
 =?us-ascii?Q?8GTck0d6m2e5Xs194wi0lGN40I5zFU1gOfz2Y6YonBHo6kd92U3/ErRNDeLZ?=
 =?us-ascii?Q?Q4ZLRZKRp7o98GBD+mJg2o7vLhKckrlFByRYAtypCnrzV6MFuBG7+if3JBbT?=
 =?us-ascii?Q?ZfuKhnKSgTGtmX5oPQSGmaEsH8QXOQUnJQaszGdBfn1WxwrhkaQiQI725RZJ?=
 =?us-ascii?Q?TWEN4WalUWtDRpFQzexQHYZnjB+maq5ka355/g2WFL5VlINnlkZleCye/WxF?=
 =?us-ascii?Q?bGU/6pFq65Z1b/SrQTelGt8M7MsgmjE1nAh6rocVVLNnxuyhaqL//CoPOtXN?=
 =?us-ascii?Q?3YT2FQbr2/X8JgB5S0RYxrk5orBhzHaMTQpvObzYgSykbQVKS8CbhSOkWDzs?=
 =?us-ascii?Q?BOWLtYJsr8TVcWbdE7n5HO11oPqsQr9Bo2JqUlqWvzlHLfer1vTNd35SRuuz?=
 =?us-ascii?Q?JVUPI8ItvqZjHwDONnpWPf1jkA8Ax+ZHZ6GVQvE2t6aPmA7b6ICVo/xWpYpC?=
 =?us-ascii?Q?Gml+lU+NGrkDe7kwjUK+LsvLpKA5Ip63hSZPyqjj5ovT4vhD80wH/2eq/lWy?=
 =?us-ascii?Q?L0Kdgkp9KVMXWzCH+kiFbc61roqN38K90jaw2Sv1EdEGT+fFnzmBgflyQFK8?=
 =?us-ascii?Q?fr28AXPZCEaYGkd0uuPBv6PFcPcMiCpJDd0zvwb17MRREFF4nETzoEAE8OQc?=
 =?us-ascii?Q?eZo8i4jB8V42vOotRmmrVIT3mamtsRbGtk+one9Z3BFioIpcQkEsjF4X48HC?=
 =?us-ascii?Q?+yfcXxwDkPb0FO09AxOOxWdhN8L6Ck/FYIMT1hnJAb5pt6gxq22Gp2sPAMUk?=
 =?us-ascii?Q?+zhYIB4NzQLPb1n/mP7eX/m0GN0kow1jI8Om8yNWclPLlvbYRjyg+q0CVIAC?=
 =?us-ascii?Q?ZGKC86698dTqjSzU9glTICFcGXBYlCeIiV/ErDZBXmiMhrQEDS169lrp4RxE?=
 =?us-ascii?Q?dI/2ftoGjapjyrtWKCFmWmm4zj0p1WpR+cclzSD+Qr0mhEnr5QGatO7CsOLW?=
 =?us-ascii?Q?doqyTDadW5axvCVbt+cqUCPihO+F4mB5HcoiPfnwpnqMAen42RPk+B0QmY1t?=
 =?us-ascii?Q?1TyOt0ObbPZSaXimtXDLeIOMiHvBhvhbuK6lu4BX6CO7RYGblQcGNbLuPyp0?=
 =?us-ascii?Q?0AwsZ05Wd5M642OzZ7tFjOO7ThW5irPScE91Sxvk2SiP19Yj6wYRLGh4Sw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:02:00.0606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9d2356-b34f-42d7-7adc-08ddf9ae4ef7
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB10114
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223838

From: Artur Kowalski <arturkow2000@gmail.com>

We already search for system units ${sysconfdir}/systemd/system but we
don't search for user units in corresponding directory under ${sysconfdir}.
Keep the behaviour consistent so that both unit types are searched in
${systemd_{system,user}_unitdir} and ${sysconfdir}/systemd/{system,user}.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df1cdf1bf4cd7d9f17c6a02538057ccfc2efba64)
---
 meta/classes-recipe/systemd.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 0f7e3b5a08..4cc23018c7 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -150,7 +150,10 @@ python systemd_populate_packages() {
=20
     # Check service-files and call systemd_add_files_and_parse for each en=
try
     def systemd_check_services():
-        searchpaths =3D [oe.path.join(d.getVar("sysconfdir"), "systemd", "=
system"),]
+        searchpaths =3D [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
+        ]
         searchpaths.append(d.getVar("systemd_system_unitdir"))
         searchpaths.append(d.getVar("systemd_user_unitdir"))
         systemd_packages =3D d.getVar('SYSTEMD_PACKAGES')
--=20
2.43.0


