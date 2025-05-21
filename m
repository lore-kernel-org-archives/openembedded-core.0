Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF75C54ED0
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 13:44:38 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.7])
 by mx.groups.io with SMTP id smtpd.web11.11557.1747835070785205816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 06:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=YSK5hkiz;
 spf=pass (domain: ericsson.com, ip: 40.107.159.7, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIyGI7Uf8NSFQxppGT2VaaptSMFIfocSK6w7WWe0Diq4bqWYDDZlnlIvXD38cKHvZJLc1eRelnxHELGcyL/fisx03Z3jgWUtQ9ruQVYOXgwDcjWWahC3PKkjZWCZ3gzsOS9fJWaqqtRA9HB9ZXeX0nAvbt4fWN7RkdOXitzgl6nVSwqKrxqPceKt+BFsMDU5VF+8xSCq9VCerrElbAoGB7oJ6vNsksrrKuaGKfMElx/dJ4sYwF9Qp9jtNZlUJGgbDLhh2kk4+W+cn1UriTuMHmkIMMBZsDj12uaYbzB4Sn9kQbIgb2pnctjIPcIid6OfpeMTDx8gOtc8YRut428E9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12kb6Kn5H79VrvTi2boSFD4Jz0AIztSFHuCK9aRb6f4=;
 b=BDSpPwsYq+AxBbrXMpOYbRmHLDnUg76K8RjVfan2ZDKGlAF12RcL7eoTWAGjJuKnRGzytdtrloEG0CJ1C0XGRnfnaVOEYriLuGZhgOYdnrsAz2CsZEDHPnpW+OspdC5GmO12RstOQ/iy/WZsKVH0yP7JLXBpEWXT869usuzyPDrZAa76xgHewPNL8ljMzZ5FEO626pC4gimHMksOAF6hDIXeBQ6LDz8Rbo5mlDIgjWzyxxwOqpABKZQJaAgIu6nfs+ScExmBkPkBNdBgCqE+4u9lY8PHXMULgToC7FIblwTCYnm1CgduhlMswT35c0eoHyopw+yfmDbN0f7YhF60GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12kb6Kn5H79VrvTi2boSFD4Jz0AIztSFHuCK9aRb6f4=;
 b=YSK5hkizxSTTHlBUvSNb25OvocFbaPVBmMUXZakFqgtducAzPjkLAMG2xX9t3kOAgr7GX6DQOmnB9yvylwS29xf6MQjIjv+NX9j+HVFeJGY14JnebL/as2A17aFdEyw62ymPmG9ulV4ZuTG8DZh5ImiMcdvTnwxXK5Un3Wm6i2QX05zz1vfy4pERnK0r7mZcXv3ty86IRblXlWJFTe2HevlOowroyJH+01ZbZNM+ggWWPAfbKe+U5Vzw0Fa7Fx4GwRwENiDbudG1m86m7ag/XzqjIbXaVqzyH6N3xq7Gc0uJukhGbSY0IC6/HH95Y5NMl4P3/3bkuzbdtrgp78b27A==
Received: from DB6PR0301CA0070.eurprd03.prod.outlook.com (2603:10a6:6:30::17)
 by AS8PR07MB7814.eurprd07.prod.outlook.com (2603:10a6:20b:353::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 21 May
 2025 13:44:25 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::83) by DB6PR0301CA0070.outlook.office365.com
 (2603:10a6:6:30::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 21 May 2025 13:44:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 13:44:25 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 21 May 2025 15:44:24 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 31DA29582F;
	Wed, 21 May 2025 15:44:24 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 1E83E70B5B03; Wed, 21 May 2025 15:44:24 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v5 1/3] package: change location of debugsources to PKGDESTWORK
Date: Wed, 21 May 2025 15:43:58 +0200
Message-ID: <20250521134400.1733473-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521134400.1733473-1-daniel.turull@ericsson.com>
References: <20250521134400.1733473-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|AS8PR07MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f46631-ab19-433d-1c2d-08dd986d9993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zDOm3XET0nJgcFfBGIWxaIR2h2sdj0Ij2OrfKZowKsIQGFIBRf74AKlXQRy9?=
 =?us-ascii?Q?zH5wWu+xDeM1tNNSbAwYvn6zDbB2oA7A89aLtqzA5wiQyUdjeYSv1SO5XaOE?=
 =?us-ascii?Q?PjzgzERGZS9aNgRcvrsj9Qkg6LE3kBd/FWAAjk7QRXmvK1qPIC6o7SkCV78U?=
 =?us-ascii?Q?+t+CzI8ktVcH6FHrmhjT3O+rSN+EUBbUM6aI0K5gC5W8AcHh29gQyz/wdiTg?=
 =?us-ascii?Q?847sYvbVfffSRbLuVHcQzjVwWW94XetTLHE0zZ/AuledZBnNSc8Pen9LnPe3?=
 =?us-ascii?Q?aQCBb1M3YyjKJS4nuMYLzfil/0PjqlRlOANscc25zHbeIKlKy5+cR4BTfdek?=
 =?us-ascii?Q?RJYeDAyaNxhvM3zz0i3BqYoL4dsqjjJUbvW2LKdA7a0qB0NCNWrDeOSy02cT?=
 =?us-ascii?Q?tfJeIdvfyTAcQJkuXzvC40/8xXLStJPHwWxKhK0OTGiBvuCd/nbnSmK467st?=
 =?us-ascii?Q?lIjsTfxfx0q6WK2OVTwuPaWOYs9zFcu8LF1x/lRQzuEySIHBMMQA25GCrFCk?=
 =?us-ascii?Q?QoDT4WIsfmxj6XN/af/is8hRojAvjnMK7HBraBDBbOL2DgoORclDCxwuSvsc?=
 =?us-ascii?Q?JCaR20ltgTqc1mTvmjtQBHlNB2RoSXv4HS4DMS7eZDiWCTcsDbleiBm0yT12?=
 =?us-ascii?Q?cfWaGjba9G0o1t1QPFP8BrA3hcx30t16CJ+nGZHOnePYxXxMYI7GeZ56rb9q?=
 =?us-ascii?Q?xc492mYghy4gW18FKiZtQLpBz779O0TAury1m8tkAfS0iZdoom0lYIizsOmo?=
 =?us-ascii?Q?5b9mxdYEUoT0/5ZNVxSs4fJQP2fha5g0XvTuFqYqX11D0GsvDf9ElcIGywKg?=
 =?us-ascii?Q?uc9nvpCpMuPB5c6I+LfaFKfu/CINMnTO3DVaGNqjjMFoqolLEbYpWJdS5oOR?=
 =?us-ascii?Q?8qPT+sDs3n41ZgvCbQbNBLoYHKjLdKl501MI+3qPrFTSrC7NZfRbokU2hFsp?=
 =?us-ascii?Q?q0B7CS+Yzau7aGO3jreiGabucrFx9OSRsRhJpi5EM5D9oeg9TUtxTJ/8XWcK?=
 =?us-ascii?Q?NADwkiowVTkMEoN+3kDrt0GDknp+0ALRjaPwxQyYylNFx0LNWeq3qjHPIjsU?=
 =?us-ascii?Q?o6vPhuzGenvSufWE778ygoEnz7sWRXESZ76DFwU8XyyKIGeILCVRclWrdieX?=
 =?us-ascii?Q?+zLUmMk95sDZCOMI3a04DxLq67PpiZyLfsdfSQuAnBc0c/0XgovVLdJztK50?=
 =?us-ascii?Q?TQymIBk5t4fI/nnmQnFGoGYIPaS9MgvgYXYpBv6oXyPJcJVfCG2pvaBCNfeH?=
 =?us-ascii?Q?4Oh4izp1Sv8BHcc5atxd/GXB5oAyc8Rb8XE8xj3VmaKnNQ+bsOMshcea9eiP?=
 =?us-ascii?Q?SBbY09bNzyi9YehEjjfZUVBC15A40go7OcK5JUDAGOCQpOXAWhsIqqhx06F6?=
 =?us-ascii?Q?Fngme90znCHq1denSJKY4C9JWWGLa3CvGYCARDg2ANTQFxtgr63xG4kIk/E6?=
 =?us-ascii?Q?X//U3g/pxM27eL1qaEa2rW1ossemoy3d407NP5IbBOzgr0sZyG5IPnnnfbDm?=
 =?us-ascii?Q?QPoRZSVHHemacob1say9Qb9wuKs0Mfg1bueY?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 13:44:25.0854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f46631-ab19-433d-1c2d-08dd986d9993
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7814
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217025

From: Daniel Turull <daniel.turull@ericsson.com>

Storing file generated doing packaging in WORKDIR,
doesn't get cached in sstate and task depending on them fail
to find them.

Store it instead in pkgdata/debugsources.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/lib/oe/package.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 0bcc04ea54..6fcd001db1 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -972,7 +972,10 @@ def copydebugsources(debugsrcdir, sources, d):
     cpath =3D oe.cachedpath.CachedPath()
=20
     if debugsrcdir and sources:
-        sourcefile =3D d.expand("${WORKDIR}/debugsources.list")
+        sourcefile =3D d.expand("${PKGDESTWORK}/debugsources/${PN}-debugso=
urces.list")
+        debugdir =3D os.path.dirname(sourcefile)
+        if not os.path.isdir(debugdir):
+            bb.utils.mkdirhier(debugdir)
         bb.utils.remove(sourcefile)
=20
         # filenames are null-separated - this is an artefact of the previo=
us use

