Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F73D1625B
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 12:41:36 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.107])
 by mx.groups.io with SMTP id smtpd.web10.54054.1728909695187321828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 05:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=rtYvz1mK;
 spf=pass (domain: kpit.com, ip: 52.101.225.107, mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFai7ZviLrfqfILvl4WuZ2jTpuen5CEyqoUu93THWoXz7YGJd+hyI8d+zswvbxNZ5Z+POkeHnUS5kUkdLNn/YJaQ9pRvnCwY76qZzH2Ty2u0y5KxEg6vQcvO3i+BMA4n7qdDRQEaLhxO2B7LjlpHDrE8s/qUlTtltbrv2f5YhED1zJ7eM3z5TtxCzY0JOaXZks9jXMnMxwNGgQyHloP8XyUjr7Sc6lAu5g+6LK0nNi1JK42QuaFcmGxxZcZktd5NieV0rxZZEwxwC7sDwH3I3AVjbByI22oLq53J9NMvvACdQgfHdiaZXHQEYML81V7FIJnUu1VSB3+nLd7HVkGhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWjnjtpkJlShEObgQfAXKi5B2CuAGrUegv05IxvEU08=;
 b=L+grDQNHKR5YVC/AOQmpLxAXavsA6TeNFWTuMij43aFHSIk52Ch9ma2qpWF/sSF3smbFqnZpdU1N76eJDtmXXjTjovuZHsfNm8Bl8auLZ2b9hcucpbgeL7PDAcQkEvMGQdJr5JcB76ZPDHBg4JKURhBqMuR0FKuOkJBBS4NtyGWfYf980HvmMmXPJvqrtskopkZanOyQbGKs8Te71x6Xah4l8+vw1t7TnR/Z+7h5wXexReleCxWBzaDeaTuK5+6qddxj/UG6RLH9OZbLl7Ugp8+G6p60IrjWbyOOBVQVmw8YuT6XtAaBLLO366hTN5ZAX4gX7//UGPRa71e7KL895g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 103.243.227.16) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=fail (p=reject sp=none pct=100) action=oreject
 header.from=kpit.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWjnjtpkJlShEObgQfAXKi5B2CuAGrUegv05IxvEU08=;
 b=rtYvz1mK1rIcTqxQXfZ7T6+bsMqsKLKp7Fps7j2IPs+8t2QCF+p3yT5pau5a9cUHz+ck5sXrs8QcERqSeMrsDRlDVJpWBgLqnFyWmTcFoHwo8KculSc7sFLrFvKQFfH2Z6xSX6PpHte0ZuikhQ1p7DNqzFFUAQKy09kuMJm0yPw=
Received: from SI2PR02CA0050.apcprd02.prod.outlook.com (2603:1096:4:196::11)
 by MA0PR01MB9832.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 12:41:25 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:196:cafe::90) by SI2PR02CA0050.outlook.office365.com
 (2603:1096:4:196::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Mon, 14 Oct 2024 12:41:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 103.243.227.16)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=kpit.com;
Received-SPF: Fail (protection.outlook.com: domain of kpit.com does not
 designate 103.243.227.16 as permitted sender)
 receiver=protection.outlook.com; client-ip=103.243.227.16;
 helo=mail.kpit.com;
Received: from mail.kpit.com (103.243.227.16) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Mon, 14 Oct 2024 12:41:23 +0000
Received: from LL-1259L.kpit.com (10.52.130.22) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 14 Oct
 2024 18:11:23 +0530
From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-Core][master][PATCH] rust: set CVE_STATUS for CVE-2024-43402
Date: Mon, 14 Oct 2024 18:10:57 +0530
Message-ID: <20241014124057.155172-1-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.52.130.22]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|MA0PR01MB9832:EE_
X-MS-Office365-Filtering-Correlation-Id: e315bbe0-fb7f-4d60-f54a-08dcec4d835b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2AdaBHJOjdgZ9mOheuvjDpkkY/JeIXHBLMsFKrQ3RK+AzZOoyLDdfcjO0l+X?=
 =?us-ascii?Q?sBSTNynRoKAEsSI3jCw0CxHGr+kMEVeS8ljAOmEkxjemgbsNkSlehMF3azsa?=
 =?us-ascii?Q?GIm7GmAAkAGgOAyI9qeKzPcTe9+VRgRr5zjuTepKTVPGu9hD1vn+g8UIO74L?=
 =?us-ascii?Q?mivG3xxfHWDtes6UgVZ5wyeIZjZRZoaz63lUXVT1A1Hf2GC+2YfeoK8XuD5N?=
 =?us-ascii?Q?8aMq3EN97Z4mDbKAp/e3F4BQ9qlZHvaa31+xvDpNz5kGAGIQHld9Hgk4/JOD?=
 =?us-ascii?Q?RcH1duSsi8F1H+etFjG71iA+jUBP2DLsUjZC7Y2sCWi3n9mzYosC+pWb2gIT?=
 =?us-ascii?Q?DM9jkW3XXDcEj8XYZs+xS5B/ASBah+U/O+9Xq/eaVfjARQ1YZJNjP0v9VdbR?=
 =?us-ascii?Q?/ue+mOUXbk5lQ2qj04jnhhxDr7thjCaC1YxwHULn66hy4TVEegbB8zdkrfa/?=
 =?us-ascii?Q?46G3FL1kk3NgiqQM+thNV5XSGYZQVUtl5B+aOiELhd/u/Kqk8g7yMq8Y9PzW?=
 =?us-ascii?Q?CP3KO+HvaFEXEgsuljBOT2LPYbPYiBjH+lqLqUABcpZezHfkUsKhsmEUcOYV?=
 =?us-ascii?Q?JpOXLXPfB0oMxZETMVrAlUZkPGqTEQJe8VmrJwImO1bmAcVcKYrPA3xYzZGJ?=
 =?us-ascii?Q?TaatKzy0XGZC0DOOl/hqlxs8S/oCeNEY22Vg1xL9IFIdWKGgZckeJ6RxKBMn?=
 =?us-ascii?Q?1+rEKmsrCm6nwG3Xz3QsmWaeW25mtClFouooiFG6dNW66mREsRTNcGOxZtjC?=
 =?us-ascii?Q?Q0wcIgoIwet3igFEkL/GZ87mP9JsoieAnhrq4BO2l6jUaHSFtMqusatxUmL7?=
 =?us-ascii?Q?cTJ60qrKFNOqG5BXjEPCes+PdvomV9uzbXxheRxfUdgKEOxY/YbIA0F94YgH?=
 =?us-ascii?Q?2o86XJApbqSKqX1lMrYQyxMIKlqFAikevFzdMY6Z5wsI8EokHRPjRR0zfHg0?=
 =?us-ascii?Q?KfwTzGPKSKCR5eQB+8FCA5plLPF4x4AlevA6iMVQKRogF8s1eBxiw3DiL6E5?=
 =?us-ascii?Q?Th2Wi4cig0THTFmmv+zZPB8uoZsn+y3VDa0vocISbYJwpZweRVvHDIQI8/0X?=
 =?us-ascii?Q?g5sbG9AGKOvqLueck8a9poFNNZthwWWFHzrjVsTjtGBz7+zQJz7M9YcUDI0U?=
 =?us-ascii?Q?v97ZSUUK+OhGUqZkBeRDmGuCd2dNxIuJBp/xzep1LMVSyFu1kP6YBv9y+95U?=
 =?us-ascii?Q?M2j51xR8bvMnAasemd0QLrWAGUDPvAzcQAoc9BD6gjOEtml10WwWEOTsAG9v?=
 =?us-ascii?Q?iLZXiGaz/pp6wmzvvBc5G2UbEy0X5XW+kjmMTRzllwh9AmuuzTHFQbEG1BLo?=
 =?us-ascii?Q?4+/uiJiIozSSyjfrjB8OFbID?=
X-Forefront-Antispam-Report: 
	CIP:103.243.227.16;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 12:41:23.8996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e315bbe0-fb7f-4d60-f54a-08dcec4d835b
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.227.16];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9832
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 12:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205767

As per NVD, this CVE only affects to Windows platform
Link: https://nvd.nist.gov/vuln/detail/CVE-2024-43402

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index becaf2b8ac..929a4a9b0c 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -18,3 +18,4 @@ UPSTREAM_CHECK_URI =3D "https://forge.rust-lang.org/infra=
/other-installation-metho
 UPSTREAM_CHECK_REGEX =3D "rustc-(?P<pver>\d+(\.\d+)+)-src"

 CVE_STATUS[CVE-2024-24576] =3D "not-applicable-platform: Issue only applie=
s on Windows"
+CVE_STATUS[CVE-2024-43402] =3D "not-applicable-platform: Issue only applie=
s on Windows"
--
2.25.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

