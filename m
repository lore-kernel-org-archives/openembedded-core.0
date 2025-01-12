Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA20CE7719F
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:55:13 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.72])
 by mx.groups.io with SMTP id smtpd.web11.37272.1736693707697541873
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:55:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=nGj0TAWh;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.72, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgEHwxr/pRFWeR95C14SxIBMpat6TJ43ZKp2INWpSfBT5PGxhBUtSdEFQLDzzKXq0dVeuIizWJoVgYR3A1tC2+lu25hSa0LPpIbKpnSplcuxbeuS/uP9kK6fOGImI0GLv2JaclLGOyz5VudoaBCS2og8qdatibgzgC4/belNJMMYtV2ya6wxKopEgikyLZuulpIpx/b08Vmmg+sVmQu0/Jeo5erP+gQpYeen0adeIWBOtN7tcnxd4Ov8Ccv/y6Vmefgrw5w9TZGqZf2Zr4SUE6FKPsHRBD8pX7vpiSzvg4DWKQScNN8EQkqqT089NbjCzpEhvF+OXjj2xHo1UduY8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOqeguJGOBq/m6/XAmAe+WALtOltgg8RvRM9W9sQM2w=;
 b=Ux8HMMT7b4LBbVfa6ytE2GcbYIPm8W+qbKcpTiuc/fSzA7inD7GcXULi16xQFc1jfSzkFyPUDQTpiMhCSGiLNkHdyPQfaLm4P3KWnoJ95fEfCGSGI2JFo5IvgvUEFNQrEE9mXE3lLivxwW4QLTjH+jLiRrdkfHqD8zDzEumH9/iaCGYaFrzg6GYGrayFsOyWmHal4lTMb6gAnMnZkZvVsGoDY9ltd4uwlIG0UOIKCWHuWO1MszXBauxsj72XlUqxuputSzUR+CH10I6pyrYgBWs3evs6RQt0apX9Wys3QhqSOYfUIu+qWegGALE2qLYw9lnS+39Y9eMpUF0mqob0hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOqeguJGOBq/m6/XAmAe+WALtOltgg8RvRM9W9sQM2w=;
 b=nGj0TAWhV4Po/G5ly831+1Ugg4muc5w/5LN+Ijj1pXuODhG/HMnS8UiJVJbT2IL3jwpKjMbbSRcgfLnjwz1PI2B7z4xonwLWMHWwH1eHtP5nkMJYsJBecQ0xmTonBpGRPbyaXQPriSRsYtdcK2S//959URc30dsGtgURdDN620Q4ymWwoMgNl+D0YG+hHCtNZghRZlVhi3u6ldL6JJ881/HHIkZlCsEBws6mqic4K+To1QkcYEtjYSdgCcMyMl/WvewCt1dAghRbuIloGntbPDvxMEZSTvv7tf4DdUrghRKz3EpI0GW4jZmjoccY+4ZM74SXqjURl4gn+dDqrhFYLA==
Received: from BL1PR13CA0155.namprd13.prod.outlook.com (2603:10b6:208:2bd::10)
 by MW4PR12MB7215.namprd12.prod.outlook.com (2603:10b6:303:228::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Sun, 12 Jan
 2025 14:55:03 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:208:2bd:cafe::71) by BL1PR13CA0155.outlook.office365.com
 (2603:10b6:208:2bd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.9 via Frontend Transport; Sun,
 12 Jan 2025 14:55:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Sun, 12 Jan 2025 14:55:02 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 12 Jan 2025 07:54:57 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 5/7] devtool: un-globalize 'plugins' variable
Date: Sun, 12 Jan 2025 09:53:57 -0500
Message-ID: <20250112145359.607585-6-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250112145359.607585-1-chris.laplante@agilent.com>
References: <20250112145359.607585-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|MW4PR12MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: 52aa381b-0448-43ce-f97a-08dd33191833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+43wA8hsCyp1A1CL/7cg+4bLrq6/zIsbkm3Z2GC4GF95WHkqsjoSF5z8uv3P?=
 =?us-ascii?Q?w5zGSWO8lzmFWoLa16ZdGBTqKywOoQ7qKxJ9vNoXIymO2YElOkCPKHT4gPXR?=
 =?us-ascii?Q?KRV0BP5WCNYKbDGMTAzI40wLomb6yyIJoJoROXiC8hry973rweIDx6JKnYG/?=
 =?us-ascii?Q?dI0mEpKFS4LoWWqzMdxqPo8pgIt0+GKJYV9Co376sDjRjJb86yiz0F1CjNXo?=
 =?us-ascii?Q?JgbFONZKPOnrHpW0i5IDDyAwfJj1ZxaNntdF32dZaWRG3VzrZVnWKx49IoYp?=
 =?us-ascii?Q?I/N3q6AoJD5ja6OytGW6V9qYWxcucinWGBKgvSAJ8l4NziCRrNhhNcW0ARLQ?=
 =?us-ascii?Q?fkbDb3pSF+bchFy9saMc2JeFeDCsaGU9Ak5uQCrH/ngfuzjtznCu40VJsF0L?=
 =?us-ascii?Q?4xYSq/XrmIaXy+hMfEl4WnQIAOHoMZhX5re/SmRBhGZ4j8FOKyUuCJANqFkm?=
 =?us-ascii?Q?R4r3F9aOeYAPmltNRsSmKnR1GEGAMo0Bm4y6yGc0P+ygVUNPKPqZMC0MVPLd?=
 =?us-ascii?Q?OHyql3UpWBiQFEu28JJ2/iidFc1N+bhCKntIXUTCAtS5qVa+uqWZgreSLwdq?=
 =?us-ascii?Q?5hUmqLfN35Y/yU3AgIVXJXF5jYIq4ujW5t0lp9PaRjcZiOMpNHmATcm33vA8?=
 =?us-ascii?Q?0xQS2e5J01RYhMuHJo7SrffDensUFmiSlTF5NnCcMC68uQwLTG5v6sxE+kAY?=
 =?us-ascii?Q?alecvWN4YqMj0Vj0g5TmY1AwW2NKaW/1QeT8+Szjwsa/w9Fzj1E5iOW3zmpS?=
 =?us-ascii?Q?Q72c2ZFyww12KmEDqoxDjsgyS7hD+8MwDHv8hJKu6GZFlkhz0iEvUdfn6bZ4?=
 =?us-ascii?Q?rMIR5vMopD2mI4ytTtbiSuh7YDG5VsaQBKt4Ku3ZFseiIPrVVVyLN0h+xDy5?=
 =?us-ascii?Q?W6/oUyDizlVJBlHyNM/oPHtZr3K4m0pCSslFBqyctyFlUktq8Qy78Jey8ZKU?=
 =?us-ascii?Q?VoH1r9ICb/0n0Jt76k0sVrLpVbNY9QHUzYO248+0Lm9gkBE9wrM5VI15CZPN?=
 =?us-ascii?Q?/u3HkhilDXgvU4YV0AWgr6WLZ0XZALymtFCYuXZmYFFUQc8FN6metBex++L0?=
 =?us-ascii?Q?kyVlixWqzjvDdnxgzO0QchKSeuQ7lr0nXQVA8EWpXaRMmorNsChB+7EsVHGf?=
 =?us-ascii?Q?CQaivbioXi0IegMg9CevkFEpufCjJa9/wRYliA99671pqF5XjITipRVMfEZt?=
 =?us-ascii?Q?9R3kySLK1OOFLBKXDd9AbYoV8wSrONCWgn3NFZcSAf1O52DiVb3qqJq2RbS1?=
 =?us-ascii?Q?Pka2NIJ+7hod6jDP/bAQCvEj6fMv9ARsTuzKoEeeX58d4R1UIVVgrbCpEx/3?=
 =?us-ascii?Q?wR6FYMg/eDnztDEejKC5As/jOaZhvGBdCPSPkRj07rbZdwQowGjhiyYk63MP?=
 =?us-ascii?Q?rYylqvgLQLLUQg2XyYbAWBH80K8VKcR8KfOodCnySA7ICEX2cbp38eENCdQ5?=
 =?us-ascii?Q?y0kdXIr39XjXrs4zDnTNOykPkLbsqk7/nAumFZvR/sahUTBgB7iuLG3UPrIu?=
 =?us-ascii?Q?1h8PO60yRISHaMU=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2025 14:55:02.8330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52aa381b-0448-43ce-f97a-08dd33191833
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7215
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209695

From: Chris Laplante <chris.laplante@agilent.com>

It never had to be a global anyway

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/devtool | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index d96d25a51a..b43a958497 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -28,8 +28,6 @@ import scriptutils
 import argparse_oe
 logger =3D scriptutils.logger_create('devtool')
=20
-plugins =3D []
-
=20
 class ConfigHandler:
     basepath =3D None
@@ -302,6 +300,7 @@ def main():
=20
     context =3D Context(fixed_setup=3DFalse, config=3Dconfig, pluginpaths=
=3Dpluginpaths)
=20
+    plugins =3D []
     for pluginpath in pluginpaths:
         scriptutils.load_plugins(logger, plugins, pluginpath)
=20
--=20
2.43.0


