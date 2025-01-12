Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA9CE7719E
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:55:04 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.77])
 by mx.groups.io with SMTP id smtpd.web11.37269.1736693703195545735
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=K6AfbwSA;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.102.77, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4SXMyzsPztXqa5DACd1KAKispp2vk4o2oxUuLsdIjo6fH7v7YlNBxeQHc0FVm6bJXgHPL37iwncaSw0BNOkhfl/YH3fLcEUbuNKG45RAaHFUnNLY/je0UTAxY1//492lApL4FQc5OpHNq4+CIPag5c4JCdO4+LllzlFpRVVjPCssA/JkyMzzbL6gD692u+aXyKVoEdwL0Bji3+y/gtRxb4XnVQ+bjUQ8LX+lcNuhFcGt2I2hWB+q16yjjv9L5zDYMIQvO+fp9gDdskKT6bhh0LubGPJql2OBlM94mG2qRC5rCGoE3A9j4Z+hY5LvexLpovHBMScPXHinWUfSdnj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJryUdLbY+xrvsKtnjrM7MyYoUPQgBZfY4UiJ7bZKCA=;
 b=pNOaxWm5P3/gaftYwAZRiwlxVAwHAAAvq2jU8mWGdDTqqTR3ter+A0BEgA46wMYvYAlzOJaIMxOUACOza9fhdMjG6A+16jBal6DdJWCqyHkY7SeqTq5G0Miyxr/Zcifaa8FWkwxQQpqeopgYPLJFuPo8Tq8anMuvCVyZLijGfsKuGl4v3EbQEpGv79mwrjb9Zw+S2VryGWlKj954tWGHaWO6k5bl/iyJ2Tc5S1iq0qJY0MTCG8KJwW8vR5RT0N9nVjKmGedwIoC5fJanMH9JHl69bMT93oIEH1667HvvKe/xUA+RdLwrQx4EcW78nEtK3Yw3JK8GChK4ey4T6f/0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJryUdLbY+xrvsKtnjrM7MyYoUPQgBZfY4UiJ7bZKCA=;
 b=K6AfbwSAcnM06u28o1h7UY+vbSQP2oeHJMhVIUbxXj1LiQ4P+jTrri81cZhXn9twBZ1yUEDhSXp48lelaEY4szGMCnhXyo80MX/O7lFEMDLf+2aKfyUu7qYurL+Cncsa3zUZ5YsAL+EwTyr+ey2gUxZy/9//arYxcZh2DwEe8F4RpIdRcQuulePTONuCe4hayCfPwYzH16WaAGbrsh2dMTlYigaFJQU+8qlYjTbnPnXj51vZcB0ajNF3KKThOcxV4MFrIGUg57o5gn7XOYD0qbIxnIXEY+IV8ePAAprCatNyY+Aa36kZGhtiHlK2nnid5eTrOenZNCNIF5b4G5mL1Q==
Received: from BN0PR04CA0121.namprd04.prod.outlook.com (2603:10b6:408:ed::6)
 by CY8PR12MB7217.namprd12.prod.outlook.com (2603:10b6:930:5b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Sun, 12 Jan
 2025 14:55:00 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::9d) by BN0PR04CA0121.outlook.office365.com
 (2603:10b6:408:ed::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Sun,
 12 Jan 2025 14:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Sun, 12 Jan 2025 14:54:59 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 12 Jan 2025 07:54:55 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 2/7] devtool: un-globalize 'workspace' variable
Date: Sun, 12 Jan 2025 09:53:54 -0500
Message-ID: <20250112145359.607585-3-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250112145359.607585-1-chris.laplante@agilent.com>
References: <20250112145359.607585-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|CY8PR12MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: d067b462-6d54-4865-3829-08dd33191662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hugGETdSx6J+pO0pWxrOhgOCExbGOHDYQkPB2sCokxJugjvq5ucnFa1Ump1D?=
 =?us-ascii?Q?s6hCuNvPg4DNdwQ3jldnwwfEFu3DyvFHCX07yospvcby4AWV1N9o6uVPU2ec?=
 =?us-ascii?Q?4eFQY9mpzSTh038kjGJjqqEljcwT5AQ1JmzesaonsALFFafCgiM7smjzMtg6?=
 =?us-ascii?Q?9yexjKHrlpYfr0gop5dB6bJh7QhrQ287fKfL4HcS8CnYWnHtHtsp10XZ5AqF?=
 =?us-ascii?Q?wTK7FzfW4DOk1o/IQagn+o29raAngDH7GjiZ5ld/ytdrKUWBjxKGPbCGBR3v?=
 =?us-ascii?Q?E/+0aslY5hAoA7z+QnXjEcAjQWin/B7E+Jek6/nuZIBbfwHHqbOEhX3pO9h2?=
 =?us-ascii?Q?2d60gHP4YdhXDM3WXJVz2e2TBkO2LHgfdzaueZScAT3gH3zfwRDb4wtSp4aa?=
 =?us-ascii?Q?y7OUSDP4ImKKDj7txVFL23ejbm9kN7bzO/FSW5nbXMzcOaa0cMQMk4Dtr7vo?=
 =?us-ascii?Q?F1SJ0sKAR9HT2STi34zvdkkoNj916V5Rld+n4WTvORMBKpvBSXfojO0Ak2En?=
 =?us-ascii?Q?dV3SvX3sMqmKeK12LLcx2iFeXNI+JukNRpAjbWeZANBvpWHM+iY7N84QjM53?=
 =?us-ascii?Q?1NNOBNqv2zs2Z44qBxXSuRcmfCiGqCLbhQc1WPE9uYeJBIHqx0hQbI/QwyW1?=
 =?us-ascii?Q?XTuL7U1mxg3TF9T4tEz7ni5KPuegKI3BWgAxp9p2ju4L1E/tLvttpxSv46Px?=
 =?us-ascii?Q?PvX/j+SFFwYeCwVfKaUIddBpWMWqQnHVhVmelLu93nT5GVrlbMZp8bq53JFl?=
 =?us-ascii?Q?Is9jFK/E7RNXK1Vm7HMPoQD1h8vxOfw72M5klecwMkGX03rWw/1YAmaN7TMz?=
 =?us-ascii?Q?VgS4U4g22JCLCWwqHN53M/8ABJtqntw+PSKH/GI6R6W3VnHWWT/j9/52fhsa?=
 =?us-ascii?Q?fynn9IM25+x0jHmOtRVWzdIJQd8A7EWm9G9wIHDZFzNplZkoqcQI3kZZnHCv?=
 =?us-ascii?Q?aWeraXDtDTb2Edjnuc772Rn/p0cZM4C8ZzdvTOeXhcCPJl/D39M27GWOQj+d?=
 =?us-ascii?Q?ULYQhc6EHAtlpTgOMD5/4XJ8dQeIMrr/snkqlfC2geYL00xVFRIUPyxW1fU8?=
 =?us-ascii?Q?4wgN4NBRwSJ1jpeq6uN5eU96YWbt6u+yfzkrwe+THkBpg2Ibzm/vYhnebf6w?=
 =?us-ascii?Q?xLVd9IHIqT7Sni0c7RuHNQkxFLsW4NLIE2M6fuOQjigUl1jUk60/QStJXsy4?=
 =?us-ascii?Q?LjZdsZEmGK/5kAoPkf4ic/BS9U2gE41UZBa2yoxUH+f1BMDR20fabRG4Y26o?=
 =?us-ascii?Q?VLcqwgmlMocwWBMd8WqbABAzxFHIvAy4IoJoqFcZQTgVxeP5tQ0ifqi5jmFF?=
 =?us-ascii?Q?OUEI7kDcWW6n//QIPbF2lAGv7YjtmGd7I6cSrJi284Lmvg85HUA8QYOpO25P?=
 =?us-ascii?Q?t1cdHwdLcEuXxwTJx731ZA4x2iDjzGgTnhRG249UhIfIKAzRs3mKhG8gtqM9?=
 =?us-ascii?Q?gKRnd8xl96Dy6m+WDkVsPLseQhhPoXUTUW0uZhWn7xQc584F4KbJjCOV4kkB?=
 =?us-ascii?Q?cCALscOQOYzPOcs=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2025 14:54:59.7963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d067b462-6d54-4865-3829-08dd33191662
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7217
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209690

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/devtool | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index acc4e0e982..d7a5903c9f 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -15,7 +15,6 @@ import re
 import configparser
 import logging
=20
-workspace =3D {}
 config =3D None
 context =3D None
=20
@@ -87,7 +86,6 @@ class Context:
=20
=20
 def read_workspace(basepath):
-    global workspace
     workspace =3D {}
     if not os.path.exists(os.path.join(config.workspace_path, 'conf', 'lay=
er.conf')):
         if context.fixed_setup:
@@ -132,6 +130,8 @@ def read_workspace(basepath):
                 logger.debug('Found recipe %s' % pnvalues)
                 workspace[pn] =3D pnvalues
=20
+    return workspace
+
 def create_workspace(args, config, basepath, workspace):
     if args.layerpath:
         workspacedir =3D os.path.abspath(args.layerpath)
@@ -330,9 +330,9 @@ def main():
     args =3D parser.parse_args(unparsed_args, namespace=3Dglobal_args)
=20
     try:
+        workspace =3D {}
         if not getattr(args, 'no_workspace', False):
-            read_workspace(basepath)
-
+            workspace =3D read_workspace(basepath)
         ret =3D args.func(args, config, basepath, workspace)
     except DevtoolError as err:
         if str(err):
--=20
2.43.0


