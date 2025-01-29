Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE800C02193
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 20:20:48 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.66])
 by mx.groups.io with SMTP id smtpd.web11.22637.1738182041492393377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 12:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=B0JBsecG;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.101.66, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7z6RHcRg6vwQBxiJhCDzDY9DOSnMgf20eJT+FnVFsTK4PxNVR5V88RHl4BAvTy+I/84Vxjoowk6NxXBS0+mC3bU3fFeGhfMr2Q9I6QZ1xNcAPKGcKyMzrDED3Dc+GmXxaTHAaIOxIYLvN5QcTNAXcWkNnF/e5O1MUrFuGMw4WOOT1DNZoM03RTi283uqJi9oaSJ7mndZfjK02XW5l/2aRs8RRfEmfXRoz/ZRlgohF5JMrNwU7oZcbXswP7+CU6we/Ch6V8T3DEt6qHI3MtSxzCQmn8jjtAFaltTrsishquGVgynBmSB6geSHCAVw/eR1W8XdRnknSh6v0rFRl7hLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhcMleQsFz3/qTxQD6gr4pxYk8geNmCRjSb2diU+LLo=;
 b=LxfbNvEQkcWT8ChXYGGSsWuIV8EsZeUNnaM+hi3ywTW7odlqJOpcsCEgJiSkI+MrKz46lTTZRa/Qt2kedfwIZfwCUVceMrEk+4NkHZwIRTh/y6i+YPAUSo3nOONoJhZEvKilFuH0gl4xIVOtnDFFwU23HkoG/GWbHLW7CuLQkP7K+BT3yuTQkKMu847ZMH17lCLX4MYA9Sj0xuhp9fI2O3DtmfW7OnqFFSzJ+jH91iDxZFlDeipff9FneJOnWQLEv9U/YskhPp/HQEZIgkvu7GGiyUzQVf0x492qS6nJaBZ2n8pwsUGPpAcu5LLxurihvhfGnJVDUwQJP3A7s/IHPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhcMleQsFz3/qTxQD6gr4pxYk8geNmCRjSb2diU+LLo=;
 b=B0JBsecGX7cgDwEllkGEcdkll+K6M22lH/ob83vGat5sFhCQhZmf5h5HeW6aH7ayw4bzqJyoWwMLeG7Hu68V7VYM/n/ASWk1+xuOrD9qe0GjRhslISvpViNJIEFpdlPW723K+3opD8B4pXVdZNGf3AoRKcDAJTkCqQXEgJnsLYUC2rtK5EVwOGKywC2rr9YPkB4tNOoEJPJ30POvMZRyRDOv8RvUMMMDlZS591Lfm/8ciOxEyvaHldHgRcdHrUefsoIbair6iAOJnHSqQVLBBAq+E5xYTMP/VgDSowmdOLUEKi6J9o6UCOBgO4KvvJ9zJ1GfvO1czUqICVh7yQXa4Q==
Received: from SA9P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::24)
 by CY5PR12MB6383.namprd12.prod.outlook.com (2603:10b6:930:3d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 20:20:35 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:26:cafe::96) by SA9P223CA0019.outlook.office365.com
 (2603:10b6:806:26::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.17 via Frontend Transport; Wed,
 29 Jan 2025 20:20:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 20:20:35 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 13:20:28 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2 5/5] oeqa/selftest: also copy local changes from the 'scripts/' dir
Date: Wed, 29 Jan 2025 15:20:16 -0500
Message-ID: <20250129202016.1833520-6-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129202016.1833520-1-chris.laplante@agilent.com>
References: <20250129202016.1833520-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|CY5PR12MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3c5c95-70d1-4caa-b568-08dd40a263ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tH24lDyQD69AMocPfTNu2OYuxzMqeblmPohMoPVsLeJ8vu70txisB1vqtLIa?=
 =?us-ascii?Q?abIeal3JRvL/XIPMuijujX5vjZfrLDDZn3YC7g/LcYVVY4+ibZrSMHDgsQiw?=
 =?us-ascii?Q?5qhQFNr52nD0UQ3qi7U9wnDbmmKzev6WAhr0HPyUL0XfigV1tSyfxbLSKx1L?=
 =?us-ascii?Q?FKUgNX3lXyfqbJfDB1yvq8+Bd+OfGTfmzmleLmVOJtOC+bOE3dTro/E0GF20?=
 =?us-ascii?Q?6LufRsNgjptqO0RUJT63haMaSfeSuDzOQm/nDOed3mUpzgbH161x9TgRxMCm?=
 =?us-ascii?Q?rq0HL+YqgG6I23++wyrNYieQx0ewXjwtJQ8QJtotl8feyRy2qPu3IzUeurnz?=
 =?us-ascii?Q?bo1AVCqp4HE0Z+MgZvrc19oLfF2Hkkb7YceKixs1KeoGhYBar/u8dMKc3tfK?=
 =?us-ascii?Q?aPMDzc4rNnknc5iGvSEaW0ugxo3OlWgO7hDedy3/rIxq7E8nxYWz3hD/4zrP?=
 =?us-ascii?Q?nqDOPYi8mWJ7w3UleD7iw8r4xyPH2U4LzRbMnzg9UyO0aR37Z/nkTYu7Ue6V?=
 =?us-ascii?Q?li0eSiFwnycn6kKyRoHIWT1ToZzkvR6gxFq2CVUXjN2y1psChWvrseFkIiMB?=
 =?us-ascii?Q?fDjnpgtnwHLZ2z5XOPYCBbk3nuaeGfA+9dDlzON/sYCq/iaTGwm3NInFb1jG?=
 =?us-ascii?Q?ikoTFaPYV4xw4q+smTBFUwTbu5AzmhSnJ0StaCHKU0Btdy4hF3CmpN8ET+ww?=
 =?us-ascii?Q?HbIxxpQHgpBSzmotIsDHrUBArZGuMh6r48kgveQPDKn5pTi5LD3MiLDcXGlM?=
 =?us-ascii?Q?j8HXp+GzmKaklaOjm3XCFTya62E22X+Dy5Xg0IOdMcEaJpGC6rlBtuza89W5?=
 =?us-ascii?Q?1hLCdVyylq/xl5Hu6VuMkGX8ziFZ5xtzlvBEJLk9/mUO+z8qY48pVuIt0H58?=
 =?us-ascii?Q?8O1jlGjSQwFtNpqamEfXg1QLziOQfBJMXXm3h2myaI0z6F48JJLOitTPFyzH?=
 =?us-ascii?Q?sQefKnZRQbKcUQ0vZxW3YePPw3sY1iOAC/DNsKFcB2SaWP22FzH+1Ok+9onk?=
 =?us-ascii?Q?OXNtS6cCbGrt34b1l2qOsLg4/b7k96YMXJmfBwymH/FAftbxG2ZO2T2jGgW6?=
 =?us-ascii?Q?9U3wSARPzY8QONLyCOQdDheCbeI9FjptI8FqFw4z1tMPGNhESKwUM+e5oeov?=
 =?us-ascii?Q?nkxSVkMjbGMuRM0QbQNV0VwkHyS/lxQFtstWCzRCZ/w22sr/VJQk53zfh6n6?=
 =?us-ascii?Q?Us0Tho2Re/ufqHjSky+3Yuzw2PkBCYsbBLCfDG7gYgALbmXZ3NusXexqKWgZ?=
 =?us-ascii?Q?2A20qnPtw2wRoLHU4JhVnZimwy6e3scRHZoXK2dHuX4On0go5F12UhtpS/dN?=
 =?us-ascii?Q?PxJQqsR8onh2xdB8OzyGqGMATIDt6QZpgWVBq59KjjJJh4yFGoCrWoLnJUII?=
 =?us-ascii?Q?0Z1BPQc91xtzhEwSfpw7+a4BuUnu+9hoEQZIhEEdf+GKTF3e+l+kB4PTKgdM?=
 =?us-ascii?Q?lPX6WorNxgZVxvbeg2o3HVEYihecaONpPHgrNG+MmaDOfLdPyJPqn1VMjp0Y?=
 =?us-ascii?Q?K3psqpoGsrvod0s=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 20:20:35.6814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3c5c95-70d1-4caa-b568-08dd40a263ae
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6383
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 20:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210417

From: Chris Laplante <chris.laplante@agilent.com>

The 'devtool' cases make a copy of 'poky', but before this patch, that
only included modifications to the 'meta/' subdirectory.

It's very frustrating to make changes to scripts/ and have them be
silently ignored by oe-selftest.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index fb9d7966ed..e09e9755a3 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -64,11 +64,15 @@ def setUpModule():
             # under COREBASE and we don't want to copy that, so we have
             # to be selective.
             result =3D runCmd('git status --porcelain', cwd=3Doldreporoot)
+
+            # Also copy modifications to the 'scripts/' directory
+            canonical_layerpath_scripts =3D os.path.normpath(canonical_lay=
erpath + "../scripts")
+
             for line in result.output.splitlines():
                 if line.startswith(' M ') or line.startswith('?? '):
                     relpth =3D line.split()[1]
                     pth =3D os.path.join(oldreporoot, relpth)
-                    if pth.startswith(canonical_layerpath):
+                    if pth.startswith(canonical_layerpath) or pth.startswi=
th(canonical_layerpath_scripts):
                         if relpth.endswith('/'):
                             destdir =3D os.path.join(corecopydir, relpth)
                             # avoid race condition by not copying .pyc fil=
es YPBZ#13421,13803
--=20
2.43.0


