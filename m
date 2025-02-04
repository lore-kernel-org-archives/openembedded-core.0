Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD106C02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 16:06:28 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.15])
 by mx.groups.io with SMTP id smtpd.web10.120186.1738685181891853402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 08:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=BYEVMULD;
 spf=pass (domain: axis.com, ip: 40.107.162.15, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5rzz1Q94P5PqDrLg5hi5sSrM3sPk0zqJxSXi8qKfKfbFK0O1dnsQzn2u45k1Y4exZjUBllQXqJFMV16V4Oa/1uCRoJ5ynN22vpA4WX+9LVwolLsClXOj0n47fwLq7s2F+XQsbEPreHHpXRyZrK2ubAU43kWxKvjiil0RCJZNu43V/tl0FTZWTfQmqfo88IW7S1la2yCjpSA3jUyFsMJ3lCxiE8D04NkgfPmVpBeIyENaYXb5MjkWAeztAwsCSaGnXsWJWb/B/Uhj3J3kbqSJZfXBm2tZvDr9M+xq9BBBpgFfXO4Qm4jAEmQTQhhzIc/Zv3gMq1xwon0+A8G6+XlUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ts/YDtZKPY1MJ0bYM9KanGbXaJTHAQ/TYrCULMFMKds=;
 b=mSUmLCBUoCg+UfyfzBLU3MsCge8RJA44MAXyFweLPECOgKhXXdmlNxTXGwdpmmT2jAmJlCVUmHCQDMh0ABd5XF1Woo/YZcxu+l/WV8eX32VR2vHJGuAGTUKF+zWdCZByl+en+WRTl6m35sHSdIRO7Qls2EgWVcSEpdB3A/DHGHOkjVwrtyLzu3ZL28O22/pNm+SMjSrnu1bTxnseZrfkfsR7/KPuMrHdKyklWW9OaQvwcL+qsbajVVZDCXxqWWiH0jOa+YxFWOowdbxO/VjQxM+mB11nFDwujG+wUAG4GJhsndACY6DcwRxBBK5/1g52mY8abf1FCiOmZ5/ua6k9ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts/YDtZKPY1MJ0bYM9KanGbXaJTHAQ/TYrCULMFMKds=;
 b=BYEVMULDD2b9h2M5ovBM83/rWq/Bj06sBzH9redYL1sAACwxkTP6E0u32vjHHHXZVN8uhHQDipqzdpIH6atVoMcXVZD+pwzoVoDojDj0H0oE/m3ghkFcWIDJGPbSif5TIv+nAUhnwf7R4JGpzwRFtSw9QfVzM5QvD/+01k6svcQ=
Received: from DUZPR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::18) by VI1PR02MB6239.eurprd02.prod.outlook.com
 (2603:10a6:800:199::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 16:06:17 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::f5) by DUZPR01CA0015.outlook.office365.com
 (2603:10a6:10:3c3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Tue,
 4 Feb 2025 16:06:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 16:06:16 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 4 Feb
 2025 17:06:16 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 4 Feb 2025 17:06:16 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 07CE72B4
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Feb 2025 17:06:16 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 514G6Fxs1646905
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Feb 2025 17:06:15 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 514G6F6C1646904
	for openembedded-core@lists.openembedded.org; Tue, 4 Feb 2025 17:06:15 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] meson.bbclass: Specify a cross binary for cmake
Date: Tue, 4 Feb 2025 17:06:09 +0100
Message-ID: <20250204160609.1646883-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C0:EE_|VI1PR02MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: f97378e6-6376-44e5-ded9-08dd4535db1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|34020700016|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?li85opxaki+0EguhWleDbP/jiVXDWUfdRFXezU0TPulN3hYjJtfDHaJr6KUo?=
 =?us-ascii?Q?TaxmCpVzT69uQSoS/UVzGbJGuGLXoiuP7sqmCrFNfejbcY1NLk5aqAwodge/?=
 =?us-ascii?Q?5Hnelmo0O8/LyHm8t0DR6g4LGQRJzIJ8RJOnwav2RL2uqIzDwgsYN7b/pwRy?=
 =?us-ascii?Q?4UxJIcO1J6xtiEQgyC+ydUZcS2cU+fLbND28G46ODmKCHQ5Z+azFCChhcuk1?=
 =?us-ascii?Q?NJOzWUjxOIZ0EalMH5mnx/5Ti/5ZzOiWzuv4fEhWlC7vQB2EBg82UgZPF6vP?=
 =?us-ascii?Q?N10bdbGqU11xFKOWv6jcWpf2MmJzCbymG0Qf044ef8Nt62mzM0Lx429lYYmB?=
 =?us-ascii?Q?CkIfhfJnH/2uuhplNFKI2jpJv7evef4o9u5YWmThH/TUbxtwh0LeaqhSakEB?=
 =?us-ascii?Q?ISSr8TDuaIqtq5BvwJVehU4RD90ECKW6fGC8nPhbmck+N5ZkZzlJQke71i8E?=
 =?us-ascii?Q?pQE0ipmWMzWb/f4L26gmhqjtBCbJLAtS06qe0pDB4nNNvfPtbnJmJzvos9FH?=
 =?us-ascii?Q?PzKI1u4l2TFDcHipY6FVAXCvrnDweE3isYhzqh+a7z2M5fXOtoPcx8GCUG4l?=
 =?us-ascii?Q?X+qmWyzyYwFBlZMj3O6KkqB2wNyjOlLGTmAJsVwynajDhwMJd1Ad42kwqtae?=
 =?us-ascii?Q?kBvZv4agPrw2kjf0k+9FjUcZR7jNfaiZRtcrvk0iInedoXPq7b7o8I+imb46?=
 =?us-ascii?Q?qQvln2HLlY5GiEMErquQYr1KS3O9D7xdzYgT4kkzuECTjR8lT1lLeIbKDpZD?=
 =?us-ascii?Q?UwFUrH1WsEUboAnuCCaUDnLpzmgMIXBzpt3cX+MqXEJTRhP7dUFuApWgki6l?=
 =?us-ascii?Q?JKJOFMaty/kDuaVZy8ytwPRWN0UAglrSiACJ2caTeMd/YXnxDX1HqcZmz4CJ?=
 =?us-ascii?Q?EKvZC8gF/cCAfEFftxKTDSHJin3CjFRRzSv3K5kFi0PC7wWWOxQzgQP6OMxD?=
 =?us-ascii?Q?5wr/cVahvNDlItnmtmUSWfwVxsySbiu5tp8fAeI9vSSaHUbl9Oz4sEEyj5K9?=
 =?us-ascii?Q?wRmFT4EvzFvCEqrVGRsRysK3aVd8wKbpULBPL/TgVymn6cr8RcRU6cGqHn1W?=
 =?us-ascii?Q?fE9BGYxjW3NtKpGhggUa6lgJGC8OlDPi5u3jSNR5oS8vo1/7jNNd5Uupa+19?=
 =?us-ascii?Q?vpQfwE6CL+AuW4hUH+MPmJ8DGKWlHJfTBMkAp6wshI0CA+2/15ZB76JFK8yG?=
 =?us-ascii?Q?XDFJFoxDVhzJmaCWAZ6ptYBy/hBt2bkKGhkw5FSRamO00CtZ8FfIr0NbGLX1?=
 =?us-ascii?Q?r7KaYR+YAKpBb0vbsHgxiroT9RSg7KINjs/f/3dZhD61l7oJ3ruH5dxwnajM?=
 =?us-ascii?Q?Kd93RQ3++upPEzWJjRSKP4D9fbN5eKa305zeRFvlrl2LzMxZR3fUyUxXF3Zb?=
 =?us-ascii?Q?gnML2i9ha6Mk3dwS0iSHv047cVlfrYccpo8RoPA2eoRuO1hxAgHUqkhjI2oB?=
 =?us-ascii?Q?pIf0vj+rpnrJU2ep4med2DwRH0msvC3js6hyEqsA3TIxaz39dnz6lAXwC92G?=
 =?us-ascii?Q?Vw8yXu3j5dniY1w=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 16:06:16.7407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f97378e6-6376-44e5-ded9-08dd4535db1a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6239
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 16:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210810

This is needed to find dependencies that only provide CMake files, e.g.,
json-schema-validator in meta-oe.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.=
bbclass
index b343480f9a..bd1b86e931 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -73,6 +73,7 @@ nm =3D ${@meson_array('NM', d)}
 strip =3D ${@meson_array('STRIP', d)}
 readelf =3D ${@meson_array('READELF', d)}
 objcopy =3D ${@meson_array('OBJCOPY', d)}
+cmake =3D 'cmake'
 pkg-config =3D 'pkg-config'
 llvm-config =3D 'llvm-config'
 cups-config =3D 'cups-config'

