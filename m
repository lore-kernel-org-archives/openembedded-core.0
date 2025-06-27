Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5DEC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 07:27:15 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.69])
 by mx.groups.io with SMTP id smtpd.web11.7880.1751009224337731860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 00:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=AU+oIzh7;
 spf=pass (domain: arri.de, ip: 52.101.71.69, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwlUxUyAu9dHJgyv0RLxUbdtqa+SxGff0rohMfr1x8wsUkGfAQZmLPW1VIksr4RigsKci3pEwmcQCqXgG1wSJz1pUqwhYxqidmxbyf0ZwmxDNL676Wx1jMyHLtmCvk315kX4qlSn5fB33x6CD5b5hX4MuaEMTcipDgy5lItqmsN/9VSzcyrJJ6j2yV3hNSeRTVo3LR9EzMO0udmO1sBpTkZjSYVoupOqzKpADWUCKZUQ2yp45dy7PfI8ryAXFZ3KOEmxkN2Bkcz90OvhDM4G6RtE7jdgbjJV1YF7d9GlFiSqOyaREIVE0q4ux/9XF8h0avfwl7bDkWQSx3TO+XXWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5apVSdXyuDftn+AcxNJieP1FFoFC7lNXkmmWy2Qksc=;
 b=bsuT5/ZPuSrgwooZWzcS1WYK+hGD/exgAkkR6fij57TygXFBKMqdMxWQLQdoAfJzgxdS/hOXmkEVlFTBvfvyuzAykIyaWtpu3rVCuFUtiMlfvahLswKXrhdhLcwD4KIhzh5lQD4OsM2c4ZUl9gn67Sv5dTxdcb1/T57+rX9RY47HyymLyejDC9K3taRlTlQH41Vpah55HlOPzCp+akd4xpxzmGAo41ItOI5b6HVcVfq4xEN4A75r6B7aRmBW1Aay+OQ14FrBHnN8MKy9GrcuFw6XqWPmXQCIqgTngO/BmSauyD/ncOHJnSq9QqPBajtD/j8caRVWDer8axy00zZN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5apVSdXyuDftn+AcxNJieP1FFoFC7lNXkmmWy2Qksc=;
 b=AU+oIzh7wHsgxP2pBxNLZw9wqwWHCd6ze7yKiNkRRXa8ICb2JtfhjZ/3sFv2519x73mNC6Oe2MNZgWTj/03vyVT2Bmnzr+0JkjKYAGxSNB/woy+BX7JPo0XBFwu5TQ7UPw0iPk1Q5kNUwYCPJYmy2RcLD4SBid+++4Knih/SCBI=
Received: from AM4PR0302CA0010.eurprd03.prod.outlook.com (2603:10a6:205:2::23)
 by PAXPR03MB7698.eurprd03.prod.outlook.com (2603:10a6:102:204::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 07:27:00 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::bc) by AM4PR0302CA0010.outlook.office365.com
 (2603:10a6:205:2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.18 via Frontend Transport; Fri,
 27 Jun 2025 07:27:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 07:26:59 +0000
Received: from N9W6SW14.arri.de (10.30.5.30) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Fri, 27 Jun
 2025 09:26:59 +0200
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] bluez5: add PACKAGECONFIG for MCP
Date: Fri, 27 Jun 2025 09:26:43 +0200
Message-ID: <20250627072643.16692-1-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.5.30]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|PAXPR03MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b62623-a00c-4986-de89-08ddb54c0140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WXjC4rJWD99Na3BSlJKQF0GkHm65LkKQyD7c/KEM8uK2LgUDncsJInmcMKU5?=
 =?us-ascii?Q?qxlA9MO9zZFHUoKO6tCFg4HPxl8VIgjKG2z+KdWnYl6yWLPMaHV4YfSAg4Hp?=
 =?us-ascii?Q?Im2kQbcWwbq6BFYpWBducZgk+/N2DzRVs+bUFbWQvMmtmFirZwEC5ygWrI/G?=
 =?us-ascii?Q?aQ7d05kTQrDIPfuRA32A2JAh7SIUOLBHWmEOjMb8fbJk5wOCk0A3sjw3tD02?=
 =?us-ascii?Q?EKIB/AldSc8TFJE7d6rrGb07+FJg+CnoJ/2Ic+kQ2Dng6fANqJQTLZEpK8O4?=
 =?us-ascii?Q?IU4eCNsX8Pvh6JmfpWiuEngjTvX5GR3aQ02WZGmt8g4oroYqovw+KRCKVdFE?=
 =?us-ascii?Q?R0D0ZPVhvEQ4Q3Ei2OfF+5XKMwL2NOpP/p8lmCzj1YkHeHTMGtdWLKeWAuR7?=
 =?us-ascii?Q?WU97ghpFX/R/t5A2uFCAQiJiFmrk/5Q5UgTTYb8wQIaoX15aBhKC6ugcQi3u?=
 =?us-ascii?Q?+3BLDcw60Xa0vTNQl7eoxZPISd1CUFi4F+nEKS0nu4UnO4rkLAhpzUrimfzR?=
 =?us-ascii?Q?gIB0oimf4G/PxD8ClYRRzVVLdpRerwX7mhR6trJxIZa5ZsQmjsr0iyCwUGOh?=
 =?us-ascii?Q?TahGnxqU2bGIN8NBqs3ExFeWi9biTCLuSL21ioYcj08xFJRrIQfI10rMzzbs?=
 =?us-ascii?Q?O27dTGxuHNDoovQG1UmYI8bEQfqW5fk4qRqZUB4M52w1BUuXyr1GazaXjBk1?=
 =?us-ascii?Q?LY116RTyL4gvadfikPRCq10ZMtfU8hg5w8qpVs3iNuEG9Lrkm96O0UGds6XM?=
 =?us-ascii?Q?b490H7IQr7d2lTSgNy5GsusS6n7i+L0tKvwFFtPYGTLuUWLGP5X5ekCyQ0z0?=
 =?us-ascii?Q?PjO19vBmm+eFUtDJmArHJ/zH3T4lw9n6U43YAuRKvfpf5xOR90V7EsPpY0W+?=
 =?us-ascii?Q?6dnQAgDakCAdb9EeHY8yi8IH+FrQ4rbfeP60lZIbmMy63EGQ6DUcdqSW+lZN?=
 =?us-ascii?Q?1yhELjBrmrFgNkgs0H99GK2lmCr2K58lXruyojWR82Gkfh6njdMl1P1TKw4I?=
 =?us-ascii?Q?4WrHPIoUfuO0SmWCYK01Sqh8LmYFGCIogQyP7pjnNKqze6Dg4d3l+rPgfeuA?=
 =?us-ascii?Q?NDwuLrUL5dTKWRisewkLbGqbcorM1ZRa4e6LXJgeW/D+YIorlYJE2slUb0M4?=
 =?us-ascii?Q?T0gPpz0tD25q3W+W8MFrcnR2GuoaKc/3G/nlJfbDeUSzEE0FY9wuYOb28Mei?=
 =?us-ascii?Q?XOqvoE5IgAHh2IHRI5viVuuT9S92IrNLdzkQT//beq0p1NDr5N0EEE0Ca5KT?=
 =?us-ascii?Q?SlKTYJnJjLriFqY1gKkS78jiH2JgMWA8ByWIpeAJZ+LXAQpn0+Qxo6UaUQ1H?=
 =?us-ascii?Q?074EjSQxG+Go+SrYrqMdhSOrdvR3jPLA+pjrYbcLd7D5UtSO1Hbj8ab7tRO4?=
 =?us-ascii?Q?B4Z4hurfBAaIAygBzfGWjrbvBtUwFKBCk5NmxgMzgTKY6v3IuGvdTIGE0nDa?=
 =?us-ascii?Q?c+vxY5x+KUVvq9mw3D396IlHmhFqufJSdhtdRz6IjbMdimoL32jWsn+vZ8uQ?=
 =?us-ascii?Q?44gvN8sn6svTh2MfJcwFhGR8+01XTCoOtVkN?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 07:26:59.9167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b62623-a00c-4986-de89-08ddb54c0140
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7698
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 07:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219385

Allows to build without MCP profiles. Keep existing default value.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc
index 287ebf658ef3..0d97413ad365 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -28,6 +28,7 @@ PACKAGECONFIG ??=3D "obex-profiles \
     network-profiles \
     hid-profiles \
     hog-profiles \
+    mcp-profiles \
     tools \
     deprecated \
     udev \
@@ -54,6 +55,7 @@ PACKAGECONFIG[vcp-profiles] =3D "--enable-vcp,--disable-v=
cp"
 PACKAGECONFIG[micp-profiles] =3D "--enable-micp,--disable-micp"
 PACKAGECONFIG[csip-profiles] =3D "--enable-csip,--disable-csip"
 PACKAGECONFIG[asha-profiles] =3D "--enable-asha,--disable-asha"
+PACKAGECONFIG[mcp-profiles] =3D "--enable-mcp,--disable-mcp"
 PACKAGECONFIG[sixaxis] =3D "--enable-sixaxis,--disable-sixaxis"
 PACKAGECONFIG[tools] =3D "--enable-tools,--disable-tools"
 PACKAGECONFIG[threads] =3D "--enable-threads,--disable-threads"
--=20
2.43.0


