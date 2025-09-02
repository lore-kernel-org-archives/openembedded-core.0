Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF265CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 14:06:58 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.47])
 by mx.groups.io with SMTP id smtpd.web11.78250.1756822012081779242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 07:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Gl+NfK3w;
 spf=pass (domain: axis.com, ip: 52.101.65.47, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqnV1QlejpvUCUeuJlsKqFsnhh/LnmlIdLfozQ9wp9r9tUp1Gj7U5sBc10oFwu5shK6MGTYs++UxvM5IM80uoi1yERE19El9KN/7ILDwKPVVliXHYUiirpTqedU4wA7CSVHMT+8LN67neSohXAjLZHxhVhXChsrxFJS+9zs9x5i3qD6b50iKoHXMh6G8xhLWM/h8mMGSr5YEwMNRjmvpb3DTLbbtuoc7zv1yW5i4wYVF7xeg3TOCS054zm8xozPV4hCRSNnSIpId6j/W7No4DXHcFIW0BUhT0G6v5pCtwI5Ua9TzK0gdj5rmAbKi9odkOwKe2QqKIAWygakcikDLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6/zfs6goIvQ38nrrImOkwPGWw85uXVzmt8ubnhxvN8=;
 b=GzTaIWVQDR5iJEs1pSf9d7Za5DSocdGynyGHfqPxEecp/VkB7xyFdjwibIw5teJVWMPqjvRYzMxPHWh8rA/3Fyy7iGlHHrHsVMM86hvEj0ERqY594Y3gf2eaxwjbmm5pFbnXNIOt01PxRCA6Y4i9HpS8pg0oGc1Lp3V9KfelVPXeapz4nVsBGSmGTz93MEiAJXH/PQr+/j+4Qdfu9lL79jd5E9jUfBXHPNlcNCib1+XxRLBzA21el6WNYEy6+wVgYgsQ5QfiOsW9//9ben2+VI66XnGcdU1+oEsUG+SrKxX9Y4TeyecGW1Jku7JIM0tui2+Vxkl98jx+zbE40hMinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6/zfs6goIvQ38nrrImOkwPGWw85uXVzmt8ubnhxvN8=;
 b=Gl+NfK3wk6x9o+YY9Y1dQnHZsbrsIhVSR3sFZ4w0sStrldPzFgJG8MOLgJDGyE7jrRB5d9tZ4CMbaclR/eyJQq3MYmEILR6CTsbY9vSt+9lbxuw1412/at+c5e7Bq2S9/AbgLU/tsNbsyBc74s/7T3nTnaaAmWCvMUzMqN6j4m4=
Received: from AM0PR02CA0175.eurprd02.prod.outlook.com (2603:10a6:20b:28e::12)
 by PAVPR02MB9819.eurprd02.prod.outlook.com (2603:10a6:102:312::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 14:06:48 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::24) by AM0PR02CA0175.outlook.office365.com
 (2603:10a6:20b:28e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Tue,
 2 Sep 2025 14:06:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 2 Sep 2025 14:06:47 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 2 Sep
 2025 16:06:47 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Sep 2025 16:06:47 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id A7183F7C
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Sep 2025 16:06:47 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 9F1C02426D07; Tue,  2 Sep 2025 16:06:47 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/3] Go module dependencies
Date: Tue, 2 Sep 2025 16:06:44 +0200
Message-ID: <20250902140647.126140-1-christli@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|PAVPR02MB9819:EE_
X-MS-Office365-Filtering-Correlation-Id: cf78671c-7819-45c2-e152-08ddea29f4ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fI61f8WheiDuVPgfaczYiOH6OCgr31dxtpjlIi+Bxt2DACGjRBtepE+xKmbE?=
 =?us-ascii?Q?TnTasSU7g80aU2kzRw9hZ7YLEYuffJCB3BeSuKZL/1Ozj4ax9YBp8L5gKrSW?=
 =?us-ascii?Q?rpx2t62vlxGkhw5tEhIY5aeqozu6Azmeixor5nhdhkHE/XC8V6mhN3fELrTB?=
 =?us-ascii?Q?fFn9PUgwK5NSxUqIv/QUZtxf3K1DhJCpBMBMEpRLoFH/mhZmjGYNnLxzTVoQ?=
 =?us-ascii?Q?uJHgKrQJMF12vDC/fkotbj5s8T0SUj/gfzeOK8Ix+k2tbXlXCA2zzuLP7ZWu?=
 =?us-ascii?Q?sIn1wBiq/k25F7VOPZXIi1aQ42BJhK7FMWGdGDAljjG9BwHTc9fSpr6C7Hjk?=
 =?us-ascii?Q?ZWro5Nql6blhXdGpnqH6mKEDtqLiwZ+lH7cZhDpkgOMZH7p8vjJtlfEsXyzy?=
 =?us-ascii?Q?UcNHrrtKteaQh+fsRDo8KNjO583iijuiFknK8/BhcyAS1TJ63uOCsD7CQnrf?=
 =?us-ascii?Q?hS4O3f0dVtQPOoD7rnMdIx808b+2ykdgCYrzs77Qr7HzvIBB+B7qFMeyZSiw?=
 =?us-ascii?Q?5uZt/gh/KvSc2QeDyKObWEVzByrqLyyAsiO9PYYWLe1H75U5Zbm/fkuSn20t?=
 =?us-ascii?Q?5fxhdt/bsTVgefFm3oITcVyKS18QrQK8biNEj6mB3R7JMQK5F0B1ChZvhvY9?=
 =?us-ascii?Q?C/vzY2O0/4dpu2mpCclkQuK/1X1uZeAQoWMme+qVNzMshO33vf9Un/vSLjKF?=
 =?us-ascii?Q?OWnLlXzMS9ZLaLPCR9iRPSPy12ae07Vipxb8eLtKUb85MM5TxiysfmdDH+zP?=
 =?us-ascii?Q?KnCd3L7MDYZzgIJVnuDUSGPwvEZAF3xKGhJYJIGROogS+INPBsQ91hFJalpT?=
 =?us-ascii?Q?6qE3dpYHkVY/hxJ/RrWj7az8CYhh2SKa6fU2HfbkenuYyVUBJ7vity/i5j6f?=
 =?us-ascii?Q?UPLbXjzdKmVENS9M4EzV/IH0SxLQ89P+rEcao3M2aY0HEQn7J+uRk03nv0b2?=
 =?us-ascii?Q?vcg3btfTnQxxUL0WR5kp03gdr2+JIhGmrubhGR5dy+NnR8evn2tYKafWAAYb?=
 =?us-ascii?Q?/50iq81/NfnpXUwRIVyPvhjshPGh5oyu+FpMqXUzVjbt/esx1f32eDhSTxn5?=
 =?us-ascii?Q?bdvnYzhqKKLRgm7HBgVvJUK4/WAQ2woq6btpHp9Ex2FCJ0hsg/LyhbKqDaX+?=
 =?us-ascii?Q?+7zWl7NgfTAum5+t6XdvQpw2i9YEr4TDa1QMhHmTWsT6qamRYdZZCxo5aAyV?=
 =?us-ascii?Q?QiEGOcOHHOvzb8WpuqXpexBVg+NWUP8zgTzkrpi2oMCJBEFxCAy5PfdXcCSy?=
 =?us-ascii?Q?TchJa1lmmm+htTqLrNeSMz1wfdKk1zEwBQfSZpgArzHfdIazqGLAHL+8HlfF?=
 =?us-ascii?Q?lyYOIVqTLSt96ECnR4HDOqhYw//4PnWeHdnkbQrY3blWmeEPlNvHbUrCIoqJ?=
 =?us-ascii?Q?xuye1f/9+U71gHw4hgmp/x5DBbEE+apUs+CLMks09AvjVPCGIYA7YuUja2Gd?=
 =?us-ascii?Q?AbIZwBlCo0hSc4wRg/xMNb9hHyMzqiWrvLGfK/BU/qUQs8dtAlstoATtE80m?=
 =?us-ascii?Q?xNgPd5w+vilJ85XjB8eZfq8e6wVyUms5ctwO?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:06:47.9908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf78671c-7819-45c2-e152-08ddea29f4ef
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9819
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222726

From: Christian Lindeberg <christian.lindeberg@axis.com>

Here's a stack that together with another stack for meta-oe will try to
close the gap between the go-mod-update-modules class and the two gomod
fetcher based recipes in meta-oe.

Christian Lindeberg (3):
  oe/license_finder: Add find_licenses_up function
  go-mod-update-modules.bbclass: Update license finding
  recipetool/create_go: Tidy up a bit

 .../go-mod-update-modules.bbclass             | 30 ++++----
 meta/lib/oe/license_finder.py                 | 27 ++++++-
 scripts/lib/recipetool/create_go.py           | 70 +++++++++----------
 3 files changed, 72 insertions(+), 55 deletions(-)

--=20
2.39.5


