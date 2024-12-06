Return-Path: <pratheeksha.s.n@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0503CE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 09:28:00 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.41])
 by mx.groups.io with SMTP id smtpd.web11.33208.1733477272093340479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 01:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=LJ3HP0b0;
 spf=pass (domain: ni.com, ip: 52.101.57.41, mailfrom: pratheeksha.s.n@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqoFAc7WUjUUR3Tdlfhk79bA1stJr+Mt1k5C7KCvyiRKTaffEW4a5rV4LqUjQELwjqWYWYO9yYUKinwPjQoVQ9dgYZPlH+A4jPg1j3cdB7s5cNUSHxfodH5czJT3zw1/fbCDeJ06gF4YTRCMruJZ9IA5aBgrSBIrKEK3eUvUwwdy2F1epC3OwIIDehMNZac4S0b+KJo9B/EEdpUnzs/Apfq5pG5tiODAq9hHynNjC8/BCxrCIczqaKgoe25aVfGuVoUHhz9enkxnKAo48dy40XYMyl//wG2IcxJOW+yb0yk3aU6kFa/8QeyGhoZdTLTed/JeDG1QPkKUiLMLKRylTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVqGsT760Yo+pF7ppab7R8AIiRi3X3m7CzOdZBP3wak=;
 b=QnFkTc3yGprn8mznbMXpRRxa/rrZm0u+hdsKZAw0MiIB11uDa2j5BEWFy1e6hs68cGAW9CTqw9I4/Be+rfudSh0nAaMApl6r4u76f4ZbSrnUCf0lQLr8/uaOjSfpB8b6R7LehYBfL41tHQ8oOJSuxFKTRQGsWdsgJACZTtT88Ucuqig4x2Ktn04LsKBJjVIhaTsWQ8JsoThX815/bhAcV3heWLQ8uUDusmx5ckxfMHFU7RzUIwGoy3mXrBErvR7lm99pRScwhkv11xZYgDSVd9940WuMCa3nCnL0+BYcu1yoR+CbSYBIXKDIE33wIIxertOks7lujL8wUZmyoPRzzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVqGsT760Yo+pF7ppab7R8AIiRi3X3m7CzOdZBP3wak=;
 b=LJ3HP0b0DriSA7qcVN7M7AvCXHmQbJGEVjTkc3+6tyRfo2JbwCA6OAFkvzltSvD5IL/sczEG3Wl+P/oTVR2XQeVjiyHdHe8NqW8kQ4Va1vd75R3vj1m2dXKD+++ZA8O6BvobPI6djzm6tsZYShp8/24G3i3qNtA0KKzdQXPmidU=
Received: from BN8PR15CA0023.namprd15.prod.outlook.com (2603:10b6:408:c0::36)
 by PH0PR04MB7574.namprd04.prod.outlook.com (2603:10b6:510:52::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 09:27:47 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:c0:cafe::1d) by BN8PR15CA0023.outlook.office365.com
 (2603:10b6:408:c0::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Fri, 6
 Dec 2024 09:27:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.1 via Frontend Transport; Fri, 6 Dec 2024 09:27:44 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 6 Dec 2024 03:27:44 -0600
Received: from INRD-PSN.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Fri, 6 Dec 2024 03:27:43 -0600
From: pratheekshasn <pratheeksha.s.n@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: pratheekshasn <pratheeksha.s.n@ni.com>
Subject: [PATCH] opkg-keyrings: mark IPK as allarch
Date: Fri, 6 Dec 2024 14:57:40 +0530
Message-ID: <20241206092740.1896316-1-pratheeksha.s.n@ni.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|PH0PR04MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: 88740c5a-6bae-40ad-69f8-08dd15d83dd1
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QHKftlGWkYpFfd7KHTvxt0FZxyhgCkYgTHGYALH3A/pMySRRd3FX8JMX6UsP?=
 =?us-ascii?Q?XXzcpfQEWdlEAtiWSd/cLJa5MOy0fowj3ln8fVgUROAQmcJlJCPoIk/uP9+A?=
 =?us-ascii?Q?zPO6Kqz/SNmKRy5mn3xtEwpaovQt0PZqR6LKvrj3nfuYTXuQh+hXAeadF12I?=
 =?us-ascii?Q?RIkanZJqO3lgMvEdQ4s+XuXjA1JVpjvMwL7cIyNY02SFeS3o1jX1oYSMKhA1?=
 =?us-ascii?Q?aaNcKfQdDG5Kcs6NwzOtjc9o5yR6X2JNQn80lF+NHe6JDR2kqCpPVARXiWXi?=
 =?us-ascii?Q?bGcgrFr26Lm9SkVFhxkEfnD0C/Ft7WHYHbuRm3V0aRPZjw+O7uB0jOx78PzD?=
 =?us-ascii?Q?DtKOAP/01Ycb4eaLRmvZ3/JrNaedV7SCjulYGxJO0VgMyVZe6VIjBt5f9QHM?=
 =?us-ascii?Q?zeFf0gy1qDqqjUYg4cS10A3goEbuTP3aFM9Pzm/eRflqX2sVGT49IsfxxouH?=
 =?us-ascii?Q?mfNdOnoCU1elEsjjHQBmCG7iAxCRYKWeLtrv1xb2J2U6GPYde/UjORKwmh0W?=
 =?us-ascii?Q?ushxMywt54fEf9HaaEYqEG0Dad0yvaS3eLHMXPgX0bIe6wvBgjPlD/YDliFr?=
 =?us-ascii?Q?3Lw4H/B8K4jO6f/TIYL8xcNqQAFaAHSKOROPMkefl4PO7WVfQpz4e1fc5HQN?=
 =?us-ascii?Q?cVAu8uS+3z4MDS1aoAXX7bch/vNPmqYBZvkUmurgg94+4xMIBKkuGv/xI23N?=
 =?us-ascii?Q?uLiiM3nz1JV5kf3lrgE8GLRaFpp7vV5EmcNDm4IQjtE3aazmDCDQWJVn/8/L?=
 =?us-ascii?Q?ORzNJCHj4UqOS8AwHl6+IxdTdy27uYoljp/aM5HzV8d159yHQVvgOWGAZ7Dc?=
 =?us-ascii?Q?ItiZ3S3O4ev2YBtfgfm5wxzmHTpsTwElhd21nxcGgsvfCIkzs9GNXRTLgn7a?=
 =?us-ascii?Q?/KV4ElvN6lYvR3CNxPZfTo6+iKZQGTapqRmFO7ApNvRfvmhW4g73GwbutTD2?=
 =?us-ascii?Q?Z2kzRY1SCxto3cxKIuA7ga4Ka3m1ZdCg6bUeMPLwFqDg8UbsX7JO2ZxMHb6Z?=
 =?us-ascii?Q?xbzvA8KOPHfyL+BJV1NUOEvDIFEKaUC3uaECs4NIV+FSccf4HzTHLo+HB2cG?=
 =?us-ascii?Q?OjJJJMCMbmS/mDHxlPczwoi2KqP+mmlPWmDuU9CbN/LGSSMbD60jc+o4uLjm?=
 =?us-ascii?Q?RcVomuwNJcew5gffaWjc5xDJYwopqcvNFBD5ebZqrKyf3W3K2cBrrDg+kx90?=
 =?us-ascii?Q?npLFTTX2XBL9ZRE92AR/8kkGcAnPGe/l0ao0a4fFcDGfSfe/dHlaCM6BzQNG?=
 =?us-ascii?Q?VGsVD02mAJFmRZGgY1zqHMTTO3Z2rJZGn193MYcWK3SGFRvew56y2v4VBKt7?=
 =?us-ascii?Q?KMY4Yzk6+FWruSHaLcGobPB2zQEHWezwfSiNOJdesrmuI7uCWcpSgpVHDQgw?=
 =?us-ascii?Q?ADg8GrK0DyvfXtL0X2ifclRfyFQMY67j+w+Yz/d654undRElhAUj6Z9paehH?=
 =?us-ascii?Q?bey6sr5b/iY=3D?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 09:27:44.9794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88740c5a-6bae-40ad-69f8-08dd15d83dd1
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7574
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 09:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208408

inherit allarch as package contains entirely cross-platform content.

Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
---
 meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb b/meta/recipes=
-devtools/opkg/opkg-keyrings_1.0.bb
index 84aeb98068..75d5b5216c 100644
--- a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
@@ -2,6 +2,8 @@ SUMMARY =3D "Keyrings for verifying opkg packages and feeds=
"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
=20
+inherit allarch
+
 # Distro-specific keys can be added to this package in two ways:
 #
 #   1) In a .bbappend, add .gpg and/or .asc files to SRC_URI and install t=
hem to
--=20
2.43.0


