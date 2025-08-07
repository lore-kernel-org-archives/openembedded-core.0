Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56AFC87FD2
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 18:13:22 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.48])
 by mx.groups.io with SMTP id smtpd.web10.3004.1754590399186166964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 11:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=tLEIMK/P;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.96.48, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r50sk7xL3LgCLiVF3MZMeKKrZku4xDvbV1jx6xt0+7SiawlBliHiKd+1QKSa6TDzyZ96PhHsXXXSJ7Wk105Mpxf2cji0TPqOkgcK7uGWBfieMeTCxQjDtlrOweVU8pX2JY76IfPXze+voP3dD5QNlnDsfQBOOL2VPDO61Gtz0ZLUNyxaeIEeAvmgfSL87LBPTa70x8MguKJU/ZnYQaCMwovEW6zbSCBPQ643uptg/CXnBO5EnAVa0nqAvdyGQj/of4XOTh/uHIjsZd/f23t7aLCmGklK3Y6fmqmk2nwqthCpGoHAYCpNzgn6xMu5YbLbE5BRWcVEPhJhczl89IZE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtZslGNUWamKqNNDpfRr+585Xo/zqkjIrk4ydaqFM8c=;
 b=QzN4ihFeceJW/CsRNIZW3Lcpah60xGTR3fOI+57paCw7AMwPOA+aN6/hO6y5gSatyL760g1L0s+lbXUI6+TI6ATaBNci/YiXntkFb++dci8nbh3aJpj+M6JRREfnCwm2aciI0mJQvzTYTnGVjP0R/X3GswesmHjSUaJ4GbHPSjetGfhHtDunpmwDsZTlivhlGGfmYyLBxOdZPEQhqgONmmmkCNkR5jTrkaOUcA2MZkOa0DNjeoVjjub731Cb3twsadGPoplCuU7ZvOSE68yZtzFQe46akbbgeL16fUcycazezMprgWnDGolIz4k2UYX+BAie3VbTCVj7CSFFabNs0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtZslGNUWamKqNNDpfRr+585Xo/zqkjIrk4ydaqFM8c=;
 b=tLEIMK/P3Y3LWaB8faOzLwL/luDJ/eQR+ye27bucHQ4mLHvldLpwjVj9Cof4wBodoMbzp/07u5DRk97exSrbwzC5Nj55xWINWVf2T64m/fF1VXyDw0zxySkp2DaccgxYIIVvsRB1HKSvoKcqetyylE8nYtfn17AaqOcMZ/4r5pTW67Rjil5Kx3uUwNtgRpv3o055jzE92IDATTWnn2wj7UmAtJXzaR4uMobSUh461giOcMq01l0fnyDt4NkOkzZnfiAV9F5DKYFpawV7acbwAt6uUkg9Gn/IvOkSB+GSWzQ4YiNng0u64eOxvfg4FlW27O7SkdmfU6Xh3Sud1Uf1sw==
Received: from DM6PR10CA0018.namprd10.prod.outlook.com (2603:10b6:5:60::31) by
 SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.17; Thu, 7 Aug 2025 18:13:16 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:5:60:cafe::ee) by DM6PR10CA0018.outlook.office365.com
 (2603:10b6:5:60::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.14 via Frontend Transport; Thu,
 7 Aug 2025 18:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Thu, 7 Aug 2025 18:13:16 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Thu, 7 Aug 2025 12:13:06 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 0/1] sstate: fixup calls to bb.event.check_for_interrupts
Date: Thu, 7 Aug 2025 14:12:55 -0400
Message-ID: <20250807181256.2693568-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff9034b-5413-4f20-c586-08ddd5de14cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LT1VT4DkaBvQMd8OjX/aJfP3WOMRS1Ey4APTIrqIWGv7BKyEVxkeLDaacrOi?=
 =?us-ascii?Q?0MqBLV+Nd6f/5jXOJt2ckiOj6pwbLYx4xXVgADd9vXB91mObClLNlCNToXBa?=
 =?us-ascii?Q?9GMS6eeMRGlDVoVfyKOj9lLOZiXUjSvuTsXoHIGj3SmPnoiMQNCB90LKjil2?=
 =?us-ascii?Q?3+v3yXbfXsb40BUNSN8aX2HNcgOFS9sMtF0mf7U0ttvi9B9lK0lDbFrMVfPq?=
 =?us-ascii?Q?ovwy7KbvNeBsF310tpiHVQ3hcHTmQzVID6F32mXxtTr4+SxNpWaCeE6JQAJE?=
 =?us-ascii?Q?tt2/tbApsrzKr3VbOV/mNN3Xwa9Q+MwpfxOuOXvHAVF9WBOyfzP8p0LRo+b1?=
 =?us-ascii?Q?G0PkmaVMc9tP5ge8qBCVX8FL5HmXzsXqIVS0Jn3qkvjps9DLkFbuQij7jGYN?=
 =?us-ascii?Q?oDI1wzccmuGZHQse9C8dTkN37axPfJzLApdYd/tUG68nx+gFePZNdE1XCupC?=
 =?us-ascii?Q?ld4sDx5pp3GaWgOtqof+37TgRNgw1W+l4iEWYFs1hkScYyHaWlb9Hr6oaUGk?=
 =?us-ascii?Q?bRUSOWKottguZJ58grPUBmZR4pRaMn6vurlNfvDbWD+g+9awTCcsNAMcVkGy?=
 =?us-ascii?Q?ZCbhMU6SnLBkMyIq1JjuAIjSf2lHGYZdDNqF9Vv6qnC6/Wgri2lB0dMq5mhv?=
 =?us-ascii?Q?NZESR60JCRlbalOMKwaY/HKB203trUnfHXxDAELNudt0HZ75lajxbQRplRU3?=
 =?us-ascii?Q?jJ7ipmjdRRBV1xerENP3Q89Fr5cx1x8RGVTD5ZAWaNP9vULvzpvKhq9cdy4Q?=
 =?us-ascii?Q?PQ68xlifBdBL8tHv1tn+sMht8teeixJloFudJCxBIkZm/mGrdY7e5HqqWt3t?=
 =?us-ascii?Q?ooSB/ykc0xKS8WzghyU3jsBHBvD6Mo43/n/dG+1/uUO7j5Ar22Btlp46VFNH?=
 =?us-ascii?Q?SxxL++13k3mKQYhZQJ08IHO2kwSWrx0D8zBqt+9lIaNZE+FFS8JfJMuX2wnO?=
 =?us-ascii?Q?LI2kXia6ZbbkZa4AEQdkfbxJhAtqUpqCZuw1fe8EQzzbwdOb/bz3zxJBabD6?=
 =?us-ascii?Q?kWXscj653Qfajcftne8R4/dzzEzhEE7QRXg1LtKwPKQURlYFD35OtsIUxJDu?=
 =?us-ascii?Q?V4kfWe+F0CKeAwZtueF+JfUXnfNFe8l1/vvz7kzx/jfyTARAWIvh/ljJ8GZ4?=
 =?us-ascii?Q?xASSxIGMu4j3Tev510yNC+YC2JWjquel+KMKcZ+Q6A7vReFBr0U1qBxBZt83?=
 =?us-ascii?Q?B+ERS3llVtzlx4ShodF/Fwn+xzxodAn0Wio7CKDhCf+Oe2Q3GoitZEfKKkCT?=
 =?us-ascii?Q?jpLTDqXFpKyTp5TkXISpKms+umdVzIevI61zGcFv2p/uojgPTWIV9MqEl9sA?=
 =?us-ascii?Q?gGPu/VqZc9bDnFi0UisjAXhq2w55KFyEnF3ExxJ5wYm4iyZ2DdzvCYLmIQRb?=
 =?us-ascii?Q?lYFGCVt5qxPl7k4USSo3teDXqUYoUGOvXVKa2Qthw82wkesRh1GatCmP7sxZ?=
 =?us-ascii?Q?QIgi4ta5tCH1zxg4e3IoQCM3oewT6rgbHROAzhGQUkKRMnBLAa1yKw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 18:13:16.3382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff9034b-5413-4f20-c586-08ddd5de14cf
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 18:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221574

From: Chris Laplante <chris.laplante@agilent.com>

This patch is required once this patch is applied in bitbake: https://patch=
work.yoctoproject.org/project/bitbake/patch/20250806145308.2052128-2-chris.=
laplante@agilent.com/

Chris Laplante (1):
  sstate: fixup calls to bb.event.check_for_interrupts to remove unused
    argument

 meta/classes-global/sstate.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--
2.43.0


