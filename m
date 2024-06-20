Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6138EC2BA18
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 11:51:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.82])
 by mx.groups.io with SMTP id smtpd.web11.45424.1718884293326132257
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 04:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=C7b9g6Cf;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.20.82, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFr8y7lxuf2f8KE7xhxLV/dLOXlPGvody15ExppAtABn4cs3I9jwEUjmOnr2mPpA/JSATBMocXEnav+Uk7euQWLVv8xgGPxYMBGQ4Mxszs+f/bLwid97JaLQru31eEAlqfM6BmfoxLObN0wNvgpuAcbeheqsH/oGm+PIZrYwC9ztTlMgZprEa1Tc7LRCz+zpZERERdFIsJ+NokLwJyHJ5eOmJ1ZxilNvlcX1Fj58DEpCwOQRzKjV11TZPS00R7uyUzq4/mc7QKbwT4IIrkPlGbUe8wJJvrDRaCoZHXYydMbLYEKZQICzoXzYT3ums1WulrzhKH38cf/l4QhFwLHYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yR+tceOJtwrhHogTZr9+NPbjcGqKr4Mu/tT2qEP438=;
 b=V/VDDEcQ1X7p1ErUCB8eRJQ6RBeoqwBZy9XVFIOeZwuAcns5+KIJ0Dxy/cADhUBDwUbITJwvQpYbNPSIq+jSi/x9cPnZ+esw6gyrLApHsTUgpzn4ui2CL1FKnHGzMUAExLTxrKY3H+HoqOH6llox/cB7D26GYGWF/3wTWzEixaiZt26+him03amwvNlgVJFwHayKzXUJDnFmwr1XX3igBnz1iyqFK+dVsAXe/QWivp0ahMoMjU5OiOVUonNnBiVixCW5RSfsOEVFtvLGAuSZIXLNjRcYsBYG6OSn5LTOy6mbNKMNFFyu//y+4pJ6b2qjjtug6qn0m6D/3eO4US/HtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yR+tceOJtwrhHogTZr9+NPbjcGqKr4Mu/tT2qEP438=;
 b=C7b9g6Cfbvv7A5VfA73VO+IVj8LVSq6LPGaFS05KxHpRe7zJ8i+NmmtMyjtNET14UCB+WQYKHyhZhabJWwyAys8ayCFKvUsGA6ghYn6fde4Bz9TIz+VPG39k0t/eZsNJ8m82CA8kItuzWR4Bq5vVe3LJ+0n5KkGKfrjxddhMUrI=
Received: from AS9PR05CA0084.eurprd05.prod.outlook.com (2603:10a6:20b:499::24)
 by GV1PR06MB9075.eurprd06.prod.outlook.com (2603:10a6:150:1a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 11:51:30 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:499:cafe::74) by AS9PR05CA0084.outlook.office365.com
 (2603:10a6:20b:499::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.34 via Frontend
 Transport; Thu, 20 Jun 2024 11:51:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 20 Jun 2024 11:51:30 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 20 Jun 2024 13:51:29 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	Ross.Burton@arm.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v2 1/3] systemd: add PACKAGECONFIG for bpf-framework
Date: Thu, 20 Jun 2024 13:51:25 +0200
Message-ID: <20240620115127.36172-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620115127.36172-1-johannes.schneider@leica-geosystems.com>
References: <20240620115127.36172-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 20 Jun 2024 11:51:29.0448 (UTC) FILETIME=[3011D280:01DAC308]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|GV1PR06MB9075:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3a93c121-c6ea-46bf-8b9e-08dc911f5305
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|376011|82310400023|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u9jKNLDAjHf8l7/ovMjQrXFeCukKWn4UiPpMF0xKDPgnsjaljkJ13K7pfeGr?=
 =?us-ascii?Q?FFne83I0+PdPxUqHtKYwsKXiXSC2kMRYmOr6cU9yle9YN2Kh2uVpENrLLjsk?=
 =?us-ascii?Q?ogHlh5IDm402qH2PlbTR70gwW90of1eITEZnQqCOJoxF0w4F3LdMfRzPSM4I?=
 =?us-ascii?Q?oFMfHzHXsOG+ibmQYEHuQMEfcKWKi2nfJ/bPcsOiPJcSYvx+f2GmeJhUTMKP?=
 =?us-ascii?Q?S4nHdIUbeIER/pFKDOze2mislaYBO/JVXnMaDBmhOCIxdMuwM/k2SCtji6nQ?=
 =?us-ascii?Q?ucOgpUeJkMZBqjIkrJDJxdNlOsPw7nel2H9LoPVp4zSAsaijbpvEmK4upfzx?=
 =?us-ascii?Q?B1gBttpzRbI6LVLGaT2y9CPd0Eknh2dK4axhPgA5D+gZbM/ZSufafubmr49W?=
 =?us-ascii?Q?TegoBHp4yc8QbLquqnL26NIq83/Q1aQJcrbazQt4HVjlNtFZeLPSfPzC7dLu?=
 =?us-ascii?Q?4/lxendXk8VA/m7ReX3Nv2IsVSb4q59kCYNLiZSZTd3sgrQm2YvqyBng+Mxt?=
 =?us-ascii?Q?txebFKUfOT4wbFKv1847Gq11gVZEJDQmc7VwfoPDeaCia5OLn9yFz813rKvJ?=
 =?us-ascii?Q?HIPCSc8hOI8nJD/qMD4In5q57Wb8hBLZBp8/L/jI/WmR87NE23EPIyv6pQn0?=
 =?us-ascii?Q?bZwUAHsvhVO5MIwO+EiuAjLb6gkGzF7UD5hsqA+rNqsP2dEQwu42jnBPIi/R?=
 =?us-ascii?Q?TxmMz4t/1UYRVvyr0aDe9rOfeTVPNy0c38liNOgfRW/VQUWCA6Zvz1bObPaJ?=
 =?us-ascii?Q?l1G1aCXFR0tHVHHlzcJc2gd1OJzZ/7PsO9KSdCeSLWEK+4yxmSJz0jEtkFJd?=
 =?us-ascii?Q?vNoj2vCd++RuUYPLKufWh15M3yLSg1X9LWTZBdNdAVSCG+MXJTUMMEHcRse/?=
 =?us-ascii?Q?V/BBbflQ9nMImR/vmYr+YgabilP/Lee9qt9OMR9dl7H4lIK46/vNzpR7YctJ?=
 =?us-ascii?Q?JxNd2p2y81vV3Heb06b5QINMHGCJO9LI6FByBHRcm1IGXeVKnR+jmBd6Y+ei?=
 =?us-ascii?Q?9jj/HBswSx85f70HhaqAtNU0+fGXcT9Sp6PKOH910dgHLIj/RT20HZJ+MiQZ?=
 =?us-ascii?Q?6oYwmqGKtdymVin8xJfPCvL1hHz+gbGte69aaUhll7qRkf5/9C6zOa3cD+6X?=
 =?us-ascii?Q?K3LuJOmkpxdQw06h+8JKI7I84nj1L+3HAivad78s4lkd14+uaGpUS3th9vmu?=
 =?us-ascii?Q?9AjKLtbHBcCMBRdm6k3UDnyDaiKptdjXMCXhcR+O3WqyRRzmw62yLWeGujNR?=
 =?us-ascii?Q?A7vmsl/ZQXuZsp2Rptcdf8XFT0JHIXZKb41XWbUWgWfxqAhO2xC7WKfIT14V?=
 =?us-ascii?Q?fNFrAWUQWmFYZCvWL2TYF635Bwlcf2b1O89Z+H21yul+ZO8OLZjkLd0J3ybG?=
 =?us-ascii?Q?wmheHrM=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230037)(36860700010)(376011)(82310400023)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 11:51:30.2341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a93c121-c6ea-46bf-8b9e-08dc911f5305
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 11:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200947

The bpf-framework is used to pre-compile eBPFs that required for the
systemd.resource-control features RestrictFileSystems=3D[1] and
RestrictNetworkInterfaces=3D[2] to work.

Apart from 'clang-native' to compile the eBPFs, the required kernel
switches are described in [3].

Link: https://www.freedesktop.org/software/systemd/man/latest/systemd.resou=
rce-control.html#RestrictFileSystems=3D
Link: https://www.freedesktop.org/software/systemd/man/latest/systemd.resou=
rce-control.html#RestrictNetworkInterfaces=3D
Link: https://kinvolk.io/blog/2021/04/extending-systemd-security-features-w=
ith-ebpf/
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/recipes-core/systemd/systemd_255.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_255.6.bb b/meta/recipes-core=
/systemd/systemd_255.6.bb
index 15b631fc07..defdb15620 100644
--- a/meta/recipes-core/systemd/systemd_255.6.bb
+++ b/meta/recipes-core/systemd/systemd_255.6.bb
@@ -132,6 +132,7 @@ PACKAGECONFIG[acl] =3D "-Dacl=3Dtrue,-Dacl=3Dfalse,acl"
 PACKAGECONFIG[audit] =3D "-Daudit=3Dtrue,-Daudit=3Dfalse,audit"
 PACKAGECONFIG[backlight] =3D "-Dbacklight=3Dtrue,-Dbacklight=3Dfalse"
 PACKAGECONFIG[binfmt] =3D "-Dbinfmt=3Dtrue,-Dbinfmt=3Dfalse"
+PACKAGECONFIG[bpf-framework] =3D "-Dbpf-framework=3Dtrue,-Dbpf-framework=
=3Dfalse,clang-native bpftool-native libbpf,libbpf"
 PACKAGECONFIG[bzip2] =3D "-Dbzip2=3Dtrue,-Dbzip2=3Dfalse,bzip2"
 PACKAGECONFIG[cgroupv2] =3D "-Ddefault-hierarchy=3Dunified,-Ddefault-hiera=
rchy=3Dhybrid"
 PACKAGECONFIG[coredump] =3D "-Dcoredump=3Dtrue,-Dcoredump=3Dfalse"
--=20
2.34.1


