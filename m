Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D98C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:15:28 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.85])
 by mx.groups.io with SMTP id smtpd.web10.19618.1738174526121121790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=YRAJPWfq;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.100.85, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKDoq6WElbKHBBGBwxee1ft3DcyLhKYJ9gXdVZv2cp9bOhNo1ZxRl58gyZqiHhrF0Aq2T4a3FuLJypBuuEflS52VgEPxIQeqfP3qED3AC9n1AiHim3kf6uSaT261tmc7JYZstTzg0Iv+t0/xr8J2a/fmyuyFwAhJgRMbXZt+cMEdmRFMjvS6H5XwzZX5r6rbsmk1342zr7I56O+W2s2+WWk7el5pZzeCIt0XUAfzsc2aL3mURNUy4ltFd2X3XB2SOzZDBA/hRvEqKYg4ToVaNaYibcj3pc7xW+v6znAmdMP9kA7sSE8xMDcHMNqkZ2VzpZ4V1NzuuOJqFHputelfFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kUVxHHuq27/f80AZL7g2Ae26nnrUoPuW8nnia8Ge2w=;
 b=rSctpUOIh4WXfUP+EzvDVPwZFyP1oBRbqnchPALg8CJZkwBtIQwR4tgvhTmZne+i740H/x980fdyEJOJd4wtihQmiERcns49xqadBU868AJkfKURVHftqH64Nv9fa2d/Y+Qgzjg08BeKPDnUPd6dhbCaMGASqbgtLtv29DU6k4+IIjiovQoz4hvgiw0IAjiKdhGUDitnm2SH5zp4egAh90M/o8C/p9n35n40sOhK/ggl+Nj69ZJ0BDCV9eXfCHHRIfmpMfFfnpBSK7a4W4cz0iUn4bQsMsrsDWIQcnEiLolapAyDq56Mf/csa8Nlirur07HJ2NQaO6EVbO4kqag8ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kUVxHHuq27/f80AZL7g2Ae26nnrUoPuW8nnia8Ge2w=;
 b=YRAJPWfq2McLEHzVYphFwRWTFxjDOllvaEuAyKeWLTKvyNNlhzX3BMygnBXeJCcSvABH7L3d9dN46YDTxSu4Q+OU6ejVQV3IMVxLyrqe51Rc6R9espeobMdI0ka2aUxOxgBBiF5vPCEMe4yLaEzuZhchrT1levEfgeGbCZwEad+j5o2AesP6vlDFVx5AEdsuTuW09Og99fPtZ1HCLSf8AIT7iSeBwAp7Gmrof7+BTlxop5f6qIMvKONv7DVBks/9XD5bGPjXkqOr22C3NabjTzypMLWXmxRM8YVp7FNLs72LSqrtI2NQktMyPe7D4mappCYlcM9AekW8HsTBc0UbEg==
Received: from BN9PR03CA0117.namprd03.prod.outlook.com (2603:10b6:408:fd::32)
 by DS7PR12MB5861.namprd12.prod.outlook.com (2603:10b6:8:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 18:15:21 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:fd:cafe::de) by BN9PR03CA0117.outlook.office365.com
 (2603:10b6:408:fd::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.24 via Frontend Transport; Wed,
 29 Jan 2025 18:15:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.37) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 18:15:21 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 11:14:40 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 2/5] devtool: standard: fix typo in variable
Date: Wed, 29 Jan 2025 13:14:53 -0500
Message-ID: <20250129181456.1826467-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129181456.1826467-1-chris.laplante@agilent.com>
References: <20250129181456.1826467-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|DS7PR12MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a06606-3e46-435b-d330-08dd4090e49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cS46PB0bJGsMcI3nC4+b5Kij3uKNzNeFtwCCK/ViyhC8lB7fMzMAl3yBICU7?=
 =?us-ascii?Q?vbPBOESKl9HXL+dR/b8YEtxMK4WerZeZ3Uue7WwB530+m8xeIuFOM8rqUiNd?=
 =?us-ascii?Q?srVrr6ohoZHJx1w9uyi6jpGvw2MW3x0vwKSLRVXZBgpUNDHnbuJO50PmAcXq?=
 =?us-ascii?Q?eP+9ulNEeZ/C1c6ZH5432tMnFYeXOf3tU6Svqj1TI52iOikfZetmOGRrUnL1?=
 =?us-ascii?Q?ZEeevHtHzwbsvm13GPFf/wmKmtCVZmpXMcqfOzKhRaKFgHhoHtVLfnKu3joo?=
 =?us-ascii?Q?oYr0s+VpXyp5DL0xKJkbLsq+3BeMxkKHKWrij4mHqVSJhYozzITycR1ttJgl?=
 =?us-ascii?Q?RYyYdrb9e1TaeQMupxmjWEIVdd+UDq2z3COhyaPO8wzsLABu/B62c028Tuew?=
 =?us-ascii?Q?RC9Ye2GXZzHdXoPW/UD3XaMzBpxFpLfGRAzrobXycttIqtyChtUCo8Yb+KVr?=
 =?us-ascii?Q?hZ+vyLb68TWYzyb+qbQn0GxFOv1ufJ1QYMZcc8Ih22laaPj0hmK2JV+s/yem?=
 =?us-ascii?Q?yEtTitRp13svQC8eZrW3ZjYoKsuGv2M0+WimO/+LSJQwhqyEVZPzVRhDNehG?=
 =?us-ascii?Q?1Qy3pLsiGUzhmOGZSlhPX/R4KdpZgixKk7+mqqkt4LmaSBD8mN/0wxWEs7a8?=
 =?us-ascii?Q?BOBNWsKNaUgVllz4da/w9PkeFM0HPuzwmqnPyebEkyZIM93EKdw9nmJNhrmj?=
 =?us-ascii?Q?G4tA81o+uwDWCwLtWcNzIQM/mRzU1nPSfIbQxLOMfaWlIoY2q9fjkfZFFhJE?=
 =?us-ascii?Q?n8eAxakvlM7M3DMIKMVAniCthV1MSWRCn1Nxl92+8JeGMVz0h90ocQUTx7YB?=
 =?us-ascii?Q?Z0+b8tLD5K30yeczF0vPA2J03nEUQgXSunUeIJXu+La6DEit2LokZcc4Vy2+?=
 =?us-ascii?Q?QenFn/1/9r2GhNc/nlPlQ0a86shDiBktjNauhI2mQIDnbYP3mj18bdZpYSdQ?=
 =?us-ascii?Q?gRvemzGifykmLdDOMCDkXx+h3iJtNac8tp/PO5yZN7WulxyjaMoXJ3GZuJHw?=
 =?us-ascii?Q?KDdTdWDT8BbtwKicBa1Xxai1hepgLoB33e0o12mnVZ53MyBFlhOSlGI4qSUJ?=
 =?us-ascii?Q?s/IkC0bYw9pCMzUsdoe2tL8usbjYeCamwu2IuYXsplEz7OeYTvsgLVPv7wKV?=
 =?us-ascii?Q?hG9XxowXrgY5CYFQkq7gJA5cUfGOX9M6m60bop991nayE2j1//9swfxQHxOQ?=
 =?us-ascii?Q?jmSsddY1pWw2toMcp3NUfaHJNQ4ttEgMMqxvvAneTi6thbPVlDi5M7XkZThB?=
 =?us-ascii?Q?VfwzypCP5abDm0X2yAZvoqFtwtzJU1VHl/TJqeoP2mKehVpQhgYs2NxJKQ6C?=
 =?us-ascii?Q?Esare91FoyETafYtSu7T+8IvGuzXoNT5PAPz6j4jF/Hpjs68CE6aUGMWVpZ2?=
 =?us-ascii?Q?dP9XQIgFS6UL6lYh6JoBOZa0JZXIqwUlOjlAApehGzqhkUFe2ifheW9ILbNT?=
 =?us-ascii?Q?qxHxMVBz8tlZT0LYT0G0u+t2k3WPnmkh0omjO7BKYgzIGGjUp0hL0ak0RDWJ?=
 =?us-ascii?Q?VwQDGhns1/nvCyI=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:15:21.0310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a06606-3e46-435b-d330-08dd4090e49e
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5861
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210405

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 305536f6f0..ca89c8e882 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1477,7 +1477,7 @@ def _export_local_files(srctree, rd, destdir, srctree=
base):
                     added[fragment_fn] =3D {}
             else:
                 if fragment_fn in updated:
-                    revoved[fragment_fn] =3D updated[fragment_fn]
+                    removed[fragment_fn] =3D updated[fragment_fn]
                     del updated[fragment_fn]
=20
     # Special handling for cml1, ccmake, etc bbclasses that generated
--=20
2.43.0


