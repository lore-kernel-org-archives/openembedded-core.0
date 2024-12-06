Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD366E7717B
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 12:46:30 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.85])
 by mx.groups.io with SMTP id smtpd.web10.31405.1733465335673975354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 22:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=WFFUhdyY;
 spf=pass (domain: ni.com, ip: 40.107.236.85, mailfrom: pratheeksha.s.n@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObIx6T6YYS+17cBYjCfMGYBjjm8MVvanROgYGg/0cfkFIAsC9p6k7x5qQTFtZ2HB7AHKDmFJdYq/5Pqc0/nJtdCmqAtRVzSgalpOJpRKdiTf8Dy63WycQAbQFAaIxh6Rw6EOQbjOy4byqBpTd/ndtHjTSXeD8A3WKepKwdXegixkmxnWHa/9U/bUka+/F4BofdDug4b0qKAijyAiigTRGKYzvSbzsr8srC/F7mPyZEFO1CJLh7bnm4TaZxgCaBq+QbjUdDDBwPLohhe7mCbB2N6UZSiHn7Aj/QsWr2Kbfrq5+CaLgH1LKWsjMin53XbDMRvwv/M+BlAY73iuDNkpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVqGsT760Yo+pF7ppab7R8AIiRi3X3m7CzOdZBP3wak=;
 b=HRa93I3YmkoYguXFUsUFazdyV5QavPSq6Rc38Fu+binU40ewbtgGw+0pwEAvwCOsGd8NsDeHMq5T94zInxGdz0zsvaedukLy+NYvPvJEbTF2mawtR4+C0u3+pNO5t/d0a61QKio9wtxuJpfqV5q5lsJGgaqZMkKG1lfYF6J5W4mPYtQdYnxluxkkn94PWBLLLzOCw7xAxYG2tsdGapwpWMaWRtWHpMLnKPWoSwOUvkJgv1JD8JIbIZShOkwbzd0He0zifZZmbbl0MVaiAEOKNPQLUqB/LeEhtO1vBaqxYPKm8XK5IlwKR8yvdtlcKT5Vaj+QZHg+wYYxbP481kiAOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVqGsT760Yo+pF7ppab7R8AIiRi3X3m7CzOdZBP3wak=;
 b=WFFUhdyYOrQB5PFwA1R+JRSLRkceuetqQDXhmZROknzfAGiBJ8y8D4Vt6KI8PmgeWFib2Q5Nwx6kfwQGpW+A9JFtSaMitqAaQo4cWGvqrDbm1ZZAQQN5sh5EVnWJ9bQIGXrlNGTk4rfxYkZB1lNW/b0MeEgUEQhauJC4IRdUOMo=
Received: from CH2PR07CA0066.namprd07.prod.outlook.com (2603:10b6:610:5b::40)
 by CH0PR04MB7985.namprd04.prod.outlook.com (2603:10b6:610:fe::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 06:08:49 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::a3) by CH2PR07CA0066.outlook.office365.com
 (2603:10b6:610:5b::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.10 via Frontend Transport; Fri,
 6 Dec 2024 06:08:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 06:08:47 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 6 Dec 2024 00:08:46 -0600
Received: from INRD-PSN.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Fri, 6 Dec 2024 00:08:45 -0600
From: "pratheekshasn" <pratheeksha.s.n@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: pratheekshasn <pratheeksha.s.n@ni.com>
Subject: [PATCH] opkg-keyrings: mark IPK as allarch
Date: Fri, 6 Dec 2024 11:38:43 +0530
Message-ID: <20241206060843.3959997-1-pratheeksha.s.n@ni.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|CH0PR04MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 795ce503-5488-4ef1-83ef-08dd15bc7292
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4wNObyc2Yg/19FsLtcxol33aj6AXbvy4PovsymrXzeC0ULAa6ISkv6aC+T+n?=
 =?us-ascii?Q?Shx0IJTKq2AZRSiv7rtaEZCFM77Wh8VdYOSoD7JtUeMXWyDYAPfe5zHIQ63f?=
 =?us-ascii?Q?YVcCdTAoL+v4p5ntzYJO9tUnM1CYXaEbCJLS52hjW3STBwrHymlHF08j4zkk?=
 =?us-ascii?Q?VOSGG8Y27h655mDD8xfBYUolzktpv53/uHgBrkOaOglLurnYp1IjEYBTQb8q?=
 =?us-ascii?Q?dwO6/dGLkc2VXsgvbJh6Aw3D4O7Ccl2gyjrD5B+Nxjn5MV3W3/C3abl6lInb?=
 =?us-ascii?Q?E9G1f8Pt6a7DlMNtErlVrFnV3oHq6e77QrkdEfGF5hWI1bvGL894rG9O3yJ0?=
 =?us-ascii?Q?DLYeqyJ35wFSwyAP3vXO9ag6w3IOLM2EQ2vWgcfZlRFn9mW6DX2mI1XhA4Fz?=
 =?us-ascii?Q?efchMfNaYeuuqxUn1NHA2hWni2wQ7yQsiwRSpH0vLJmx2VKxa+88bheAXzmG?=
 =?us-ascii?Q?feRVi57QBhH9P5dYPyGTRKg6wUq9uoMvd6xRng4VyLZg3NGpXY60HqeuV+8H?=
 =?us-ascii?Q?hI0p6rMmXYYvoWnQVUd7T3gK4unh0usPXDvy6nAzQj7ygYZOvLBN0SPZWV97?=
 =?us-ascii?Q?yasEVSK/jJKdhMkLpNGLj9v+U0cHXdzfPVsvHQMOzpIitsw58bO7ASFFby4q?=
 =?us-ascii?Q?+c69mbwCkb2EwnnGpKDSzZCI8KG2MtHp7XDIQmUcqKV6Bu6wKcYv2exW/Oo/?=
 =?us-ascii?Q?Xqf7Tt20Db78ErKj45Dj2L3GBM9fG+KjoZV3wcgrRSjqc2riCDY4VpGtyCZz?=
 =?us-ascii?Q?8UuG+K/QdyQZQU2RI9qfE/y9G33u2PAJu+1eDZ8xdnuXSTYtxLS0JZUJk99J?=
 =?us-ascii?Q?xS68iwAPO5f2tbZf1Zm4iWB5ly56cQrFmQEoZzwjq244UpnECLimwQ/2U8OY?=
 =?us-ascii?Q?/m0zz7IRGkE9T1OYEcPnCpR5uEDAID9KH2eNCwH/l+f1HNLgYLtB05yr4rrB?=
 =?us-ascii?Q?6YW0doq8O6JRmqCQFrkZM69VTDzEz7WNtkcFN4402Wnf1zBGqPeV6gdkchgm?=
 =?us-ascii?Q?Ztj9auzU/LP2pbmijgNVmGspiKADPs+imGMsE0QpBBkkr212MS8SoMBqylu2?=
 =?us-ascii?Q?v+jVLz8V4PBV3y3QklxeDYLn1Bd8HWfooumH5U6iggbS94V177EkE6uKeXmL?=
 =?us-ascii?Q?ORckhGZ69ro0g+XyKrORuTwL3TYJ//VKNf6a6Y51BCZzpWJ42usaIzOhECuR?=
 =?us-ascii?Q?AxUrFPQ+ntWnSIgSdmz8w4DHEIzXqp2E31JWj9tKEjJ6ZTOj/gyTkTomLQvp?=
 =?us-ascii?Q?DCWkjwgdFYQfGiobxoe21t4uzYyoVqRpL2m+sSOmeHcxB+tCOkLGP2MN5tEb?=
 =?us-ascii?Q?ItKxeRenGJr8plD0P6vl7BB3m/Iq2CaNjdbZ2hKH7vHX8Cx2L9SI/dKQ5c/8?=
 =?us-ascii?Q?Up0ms0e5CQhTACPFAKQTClFtANFyIM+iIbodbRkrnHAi2YjlDtd89q7a6+kK?=
 =?us-ascii?Q?+W9rsXuLA51eQ36j2CENPAFDlUzTogH5nTpEn9uoS1JgjNRG+2zuEw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 06:08:47.5936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 795ce503-5488-4ef1-83ef-08dd15bc7292
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR04MB7985
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 12:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208420

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


