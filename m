Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9AEE7719E
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:55:13 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.86])
 by mx.groups.io with SMTP id smtpd.web11.37273.1736693709308107210
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=RrCFKMpm;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.94.86, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zo1XRK4Up4Oci6KcQjSTbBnEyi4HNkO5JRg/ZegGolvOX5+wYE3RpnubE/nxnbr8Bs/2prx25owhzddRABgh9yQyFUUavH7hxKd2e5R3e2rDCTazWkzw4Wd/mh+n48MsTuRnI+90+3AFQQEJRd0bFMJVRcWfnWub+0QmmkBah5b3l2qfKCM7JwHOAm1UoO78aUGNnmsocgXRJqVNqXUioo1jHZc/neNCIqv226FkPP3ObmP2OONzy703lFoXF6MQKHJuqHWHSzX0ei9HhgUz/Zj3vszEFnAdAB/6TEaNRonXkVXYsG/i+ogW1HS0GjW5X+ZP2ZKwVh4uLuMPy+OWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3gbBIlny30UJPjxDvOcDCHD1OaIWUXTv96rtAwnaWs=;
 b=J3QEjR0ZPSq/GTba4rHZ76qMWEZpk4RSt5MS24veN4n6YdCGKGJSnKbiQV91f+xDCwxUlhDhANsuwO0ub3SUwSUTBYZcoHSNzs4mAHUElVjyXIIX3pE98bMofT0BU8pmLl5OmAVSK60GuROxJuI8u8phVIjSjL5qseZv1PwOe0cJi+RolaYdgjAZqj7yQp3/p5TCYHVrxjU/045TaEHefq48ctxq6fMd+yLwJQERCFcH89/tKjcp7jZ8+IcA56K+obBjsgmZ9Xa9Ulrq/F1uNM8FCnylevR2/aBNB1VvawHYOuT/79cEWzoC3QBOLPtMqS2dW22nXqRNUcOQ7rF3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3gbBIlny30UJPjxDvOcDCHD1OaIWUXTv96rtAwnaWs=;
 b=RrCFKMpmELsh29+j85dk6lWLUJYL3acX3HKPYLTpMLX9XIybrt/ojYR6M1ctzZAPZC3tG+6vZWitFo8mQGnLEjR5g2Cr4BoC48n9usTxQui9d3v4HLn6mLAwQJky169o0TtR6R/GnG2xDkyFPN00xhBlQiccZvcG9v1LTzkDIz3Rsrb0r8Omm7omV9TjSDVZ6kl/C0WxzqmVo+6CwDAHgIwD0QUcG3O2tjNj1wK+aUvQ4lwYN/YAGq2ww7chj7bUgLltZUjPYW38dKjcix2DFgF1JqcR2G7ST6jc85pzPthKEa88Lmag43srvZEg3MD7Qh5zjcCeOcr8a6kKWEgssA==
Received: from BN1PR13CA0028.namprd13.prod.outlook.com (2603:10b6:408:e2::33)
 by SJ2PR12MB7942.namprd12.prod.outlook.com (2603:10b6:a03:4c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Sun, 12 Jan
 2025 14:55:05 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::92) by BN1PR13CA0028.outlook.office365.com
 (2603:10b6:408:e2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.10 via Frontend Transport; Sun,
 12 Jan 2025 14:55:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Sun, 12 Jan 2025 14:55:04 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 12 Jan 2025 07:54:58 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 7/7] devtool: remove unused 'config' param from '_create_workspace' method
Date: Sun, 12 Jan 2025 09:53:59 -0500
Message-ID: <20250112145359.607585-8-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250112145359.607585-1-chris.laplante@agilent.com>
References: <20250112145359.607585-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SJ2PR12MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: a015eaf1-5ecb-42cc-8588-08dd33191936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rwHZxRaWNOdWr7dhzr22E19zvtaXieJbvuUlJznBNfRlr43Ob3ig/SrAj0rc?=
 =?us-ascii?Q?qNT04az71yc3lswV9nDPYPShbFKgb+DfkakacT08Qp23v2Pwcz7mpf7BIDz3?=
 =?us-ascii?Q?azWc10oud0jvz1Ju6K1dyAHpEd0pi6ompiY9/riXIdC1lboBBzj+avpePcrY?=
 =?us-ascii?Q?Zweu20iIQuZHek9JyR0q0nTwqqUqKYRmhkUpfPpXTQLOYge3mUGnRCWfhTDB?=
 =?us-ascii?Q?sxgC5FP9NSc1PoDGP8shvrQCWb47SnIbyoEA017KXQs1zMwXcLS+z+NMJ/Kn?=
 =?us-ascii?Q?nnphNF73rHMFbxqJzJpZBfDzz2qBknZwpyoBQdnUod/imTCXbKhWdLlZQcVq?=
 =?us-ascii?Q?SMYgDI/dFDFg0aYWuucHImUqqmjjDc79VbgroI0GOcAcc6c63/7QXWV85G6k?=
 =?us-ascii?Q?zulaZ+n9qXLnKPE7ddTqRmhuWQXwoN9yTQUxO/SCuNXWHtAw9UdX0kSDMbmZ?=
 =?us-ascii?Q?4VbWwPEP4zKOHqWFSxcWrVWrBfZvtcTdE4Z16mP6KjiA6QoZZCPm95R2Lbss?=
 =?us-ascii?Q?idFTpCrHxcxMhho/Xtcz2iGBMeBpMW97vsZtJeItHJISLEyF/CXuzjZSsdga?=
 =?us-ascii?Q?DfBcWrvv2DSgfo27cbGO+FP63fZetuYLwnTCf9rWMbMMV4wi3pU6CflcePsz?=
 =?us-ascii?Q?h3Cwa+1kJypmgESCiAiBK/1c3qsFa/AuteNJNw39yzK9Q6dwPNO3tRF9siZz?=
 =?us-ascii?Q?phjTufiZpbUv9govQ+oUz2JOgN/WTF4ZRqveoTPrxGHQYphhW0jglRPkvZL3?=
 =?us-ascii?Q?T3/Jt4ljJKdCW7jPpYX7ftGJ+uqHEtSs5K0+cBXU1z0w2Yb6JiRkbL1Rur8+?=
 =?us-ascii?Q?YG9/b67dueM/fS8inBUssh6EjgqfZLZYqGT+i6AmiCI9p6EfL2F1GJ6F88f7?=
 =?us-ascii?Q?9iADc9PSXayfw90R3rMb5Jd4RdTPEGjmxUGgaETzAsytcMwO8vvXm23jznth?=
 =?us-ascii?Q?66d538mABVUq+Rtfg1kvOGRDIEKu2oS7VVwNh9NJF0jjWXb2sLCfFtN44hly?=
 =?us-ascii?Q?rCbRKeRjQb56g0evr/60MAsiFaXDQELTJ5YVuJ7+dRSe1Txx5vKjY1NRzEyl?=
 =?us-ascii?Q?XQjgXQWNt/mNG3EbMUNbadko/vhFHGPoJUpEQ5tnkXY7pmVUHh4kk4L+BLSD?=
 =?us-ascii?Q?2Cg1CfQI3yV2t3D4qdiV1g9ceKCcsbmH3jYvCCbUtwP0p/jd9rHycn6zIcrG?=
 =?us-ascii?Q?2LzlqvdSCY6y92GM5ANbtfSzC/5GuCJgRMfZJpxIPsVjsmibGzaERSmmmr/l?=
 =?us-ascii?Q?lMcVUlG+Jv1U+X5Jn4bUwuLbkQjJaSUy/WS90+nRE05WvZmSu0i0QSjG4V7q?=
 =?us-ascii?Q?M9wbuPJ5/wATffJUWZ8MqOnaf85bv7NWJ5mt3La7qQz7drMI1prmS0MNFICv?=
 =?us-ascii?Q?IN00pRzKYZ7HVnr587a4Ma6/UsOYzHgEIXuJJUT3fcd9vSk1cVJ8VmiJvpse?=
 =?us-ascii?Q?/iOIHUSgKNhPUpdWXWSxZU3TrChNdasAip11Pegffy6sVn5d/VyPDg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2025 14:55:04.5274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a015eaf1-5ecb-42cc-8588-08dd33191936
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7942
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209696

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/devtool | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 1994d4b507..ebd3e4c11b 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -95,7 +95,7 @@ def read_workspace(basepath, context):
             sys.exit(1)
         else:
             logger.info('Creating workspace layer in %s' % context.config.=
workspace_path)
-            _create_workspace(context.config.workspace_path, context.confi=
g, basepath)
+            _create_workspace(context.config.workspace_path, basepath)
     if not context.fixed_setup:
         _enable_workspace_layer(context.config.workspace_path, context.con=
fig, basepath)
=20
@@ -134,7 +134,7 @@ def read_workspace(basepath, context):
=20
     return workspace
=20
-def create_workspace(args, config, basepath, workspace):
+def create_workspace(args, config, basepath, _workspace):
     if args.layerpath:
         workspacedir =3D os.path.abspath(args.layerpath)
     else:
@@ -142,11 +142,11 @@ def create_workspace(args, config, basepath, workspac=
e):
     layerseries =3D None
     if args.layerseries:
         layerseries =3D args.layerseries
-    _create_workspace(workspacedir, config, basepath, layerseries)
+    _create_workspace(workspacedir, basepath, layerseries)
     if not args.create_only:
         _enable_workspace_layer(workspacedir, config, basepath)
=20
-def _create_workspace(workspacedir, config, basepath, layerseries=3DNone):
+def _create_workspace(workspacedir, basepath, layerseries=3DNone):
     import bb.utils
=20
     confdir =3D os.path.join(workspacedir, 'conf')
--=20
2.43.0


