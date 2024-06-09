Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A916AC27C55
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 08:09:13 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.79])
 by mx.groups.io with SMTP id smtpd.web11.13870.1717920544082220674
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jun 2024 01:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=mB/SLHHl;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.79, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OW+9+QiV3Fq0CJQBubNJPuKsL/Tez6RZ6u2IXCW+Ajc7Ih6oFHZUWCEfHpnBzgrR85CcPAPfjozmXGanYbD0eyUHjhYSp4TdYNZicoMhqrres9SGPBNLMN9roS2eERnOja6MqCpjpJQeYRyzKXnZI9rnhQqFfaCxEGpjQrdu8XiC395BR9EIU0vmocRToqnkeKevsIUw21cSH9peCU8VeOM+8xgSQkvtx7N6uhaQi+/KtfS/P8+O7uG+uB1RmfPuVOPHcOrstX5MTtwlklF9r7BVutJytXLE9V1sWbDX9TZax7ynbM44L1Zstm18hsiZ38m3cBmDb+Qlr1II/Mh3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVyFGlMF3xzMfpCEXXBwSMVEkxkghm1DjXidBDlpVeQ=;
 b=eCQrxRzasyb229e5nWdz4pCNcjug99ep+ByWiQysltHS5ETg3bLefPHaYjAx4ZrpouYV33Ohw4+b3L89TUxgrvSgqS4efOeyP+wP1jkQ82IF0ge9rh6tWOs8eA4hJzn67gwhdyZQdxC4duIbL1586VJRKho/u61Ro7nuYNRYt0sGZpHldXK8u7sMxSK42gmWTWZA7xqG0na+FNBAYf3djptFLR26Hh7LEyann7ym7ndg0SikTz9YFKiKEL4OmwowswKF0oPtGYwNp+wsKmtUrZxVTpD+BCgHt4PjZpqNMO3sXqXI+FfticAlVonH6Idv6K6tYrBZsQETEYmPFWJsWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVyFGlMF3xzMfpCEXXBwSMVEkxkghm1DjXidBDlpVeQ=;
 b=mB/SLHHlDRTxy4xoLpYacvwvwhX4KiDa6j2HdSXpx4G0C6PNOoc705g923totHznODIjeiBUSMAGQ3veqm4McSpDewjF4eFjQY+5onx9tc1fmys56QT5DDOGS7e5RFVNnbO5f7DNx2wXLzYvCRqiPQm79cjj40euGAz8cIr04+g=
Received: from DU2PR04CA0258.eurprd04.prod.outlook.com (2603:10a6:10:28e::23)
 by PA1PR06MB9251.eurprd06.prod.outlook.com (2603:10a6:102:464::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sun, 9 Jun
 2024 08:09:00 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::f4) by DU2PR04CA0258.outlook.office365.com
 (2603:10a6:10:28e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.23 via Frontend
 Transport; Sun, 9 Jun 2024 08:09:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Sun, 9 Jun 2024 08:09:00 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sun, 9 Jun 2024 10:08:58 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1 1/2] systemd: add PACKAGECONFIG for bpf-framework
Date: Sun,  9 Jun 2024 10:08:55 +0200
Message-ID: <20240609080856.1020300-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240609080856.1020300-1-johannes.schneider@leica-geosystems.com>
References: <20240609080856.1020300-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 09 Jun 2024 08:08:58.0775 (UTC) FILETIME=[47E78A70:01DABA44]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039232:EE_|PA1PR06MB9251:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 552e6c33-0fa9-4ef4-eed6-08dc885b6b39
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wuBt1o7nODdqrsCfRhWyVK4G+TBZTpFyW0wT4sFny5qBvOQzm3AafKELTa2t?=
 =?us-ascii?Q?0mFkm8sD0iuu1AYY3AN8gmc35PpF3IdZ7E6doKeDRYjPvgWOO54h/3xl3R7w?=
 =?us-ascii?Q?uWxRekWbMNleZmZVdrW3eOOc536KPmSqrQlSG8hiZ90neuIIzDglKnbMgjkR?=
 =?us-ascii?Q?+BOrcmzgoQ/hzM2DXCiUAvEz8ACTeC379sn3Rz1Qijy1GFRrDPQV4mKdhBE6?=
 =?us-ascii?Q?4nPHdJ6+rc3VWUpPqGlrS3GiNamrRV21uNc2I0O4iz8hKBXVNejQpyIZjC1U?=
 =?us-ascii?Q?jTlJDMfLEErY4V+cqys6yElR36wJNYONeqo/caVF5c8UrsW8R+ZOnPT34d0+?=
 =?us-ascii?Q?IYmlnHj1Wt7bIxl12GbqFnHbrYlrQAL5yvK+4H5foMtQc/DcA9LdTBfbcec9?=
 =?us-ascii?Q?9qtEh+VUgSLFKOGO0grYdbNjVJ6AfsNbJbvRn7vYi/sfCLYfhEtl4/RNlcJE?=
 =?us-ascii?Q?m9ZDKdtMAzrdleoDHrjvRax9m4CoV7cI67p771yu0k1VzviYWflw/PEr1UMV?=
 =?us-ascii?Q?m0zQOKyFc4/aW4jbqasG9kwBtoMaxhuTP63TU2kS0rULCMCUrmcA26Af+ZsW?=
 =?us-ascii?Q?mQEeFXWh+Y+6uq1XebhwD4AItPXVG2tU4YnSFV1X4aJllp4PevHHMNa+lSFh?=
 =?us-ascii?Q?Aou6Vr3YhJ0b4E9HJEf8bmuypLDZoMZCMSV0hodLXvGaYzDKcAwkweyAqpIU?=
 =?us-ascii?Q?orPfCGFB38KGOH0FIgw8/9wdkkfpiflfVuUzQDRGlKuh+k3hOGkKuqmxf72h?=
 =?us-ascii?Q?XvSCo8O7z7X5maPzGPI3FxOSxxfo2hkKWHBxKAnxvw5b5TZsK94SpOeJW1bN?=
 =?us-ascii?Q?ABUMtASVFccY6fuV9qb2447R8SeVQVRX7DD1wdsuIRxjLtzwIi6xxXz3CcTH?=
 =?us-ascii?Q?4clh2UPL229kkuD2p8VZULOsVGU/FmZPiILr4IIMFBgadn6RLmUlwG3CyFvN?=
 =?us-ascii?Q?xSD9mcBZ11RDLWv2hUrbRJyA/NghAojMvxaghUDrs4alWzBCOSKP8ibpGUfY?=
 =?us-ascii?Q?mQKWNwhkGwfMnJhE54EPOjWbdnA2b6RRN0I4m6vYx2iW0wgQFVP9ns7+7IKB?=
 =?us-ascii?Q?MjDWSjG47ukL7yFTv6CM2GmUIaofjufxtSzelg/kRGWPYP80Gvvo3AnTZmLV?=
 =?us-ascii?Q?X0Gv2c+zX6yjVnWNbvLfKl+aUf2hhcYjTEKNUE7FE3DqtCwQlhb+LuPJZIWD?=
 =?us-ascii?Q?7Xg3yvePlo8w/JTM0Wc7Bdef7sXE7LXiZWeL8yH8efG4vrNwkZYZ1VefYWYO?=
 =?us-ascii?Q?dk+bWWxWnoElVtwOVGl0/bZwBhrfUwAuaIfY9HrjNLaTJOI2Eykn/YCFMbzn?=
 =?us-ascii?Q?L+hxaBTUCRXISLjEwW+Qx7ZjJZF1dOeE73UVSflfik4mY38NLHyXw/qctEeP?=
 =?us-ascii?Q?TqrJUEo=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2024 08:09:00.1502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 552e6c33-0fa9-4ef4-eed6-08dc885b6b39
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9251
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 08:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200453

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
index 62842d43c8..e70c9c738d 100644
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


