Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB24C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 16:37:17 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.74])
 by mx.groups.io with SMTP id smtpd.web11.64085.1749487035965640160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 09:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=hLrZMVyZ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.74, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COeKcWV8qikjGplqAN6cz8oChpyklREyPIZ/mtw6D+ytuNg6MMBpOvrNh/TgVdJ34hLlO9PGWSX9lD7MZHbARJ3BQcUkrVNMmyeAvkDEmRkon/D6qQpkw3kQWTcR6cYWK/XFPncSWS1b4vAEevwkQHKnmpvLo1S9UwIzOthZoFYb5/FHGTjSfiUubn+MdDCt7shVouzdzoYm5RInqFx9XCbEOxQcThrbiW6hZyP2cS+Jip1Y5n76trTrW2L/jO6u63DSzEu3VUGtVaa/2txrjYK2fTsbA7aKicprdQ//OfWlX/HQrGgXeAFNF3G4aNgH9i2xLXQYQ8g85/VR4LqPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPtsSSoRglV4NjHA24HCpsV1436iWjxalukv/tWLxyA=;
 b=gG7VcAAFbI0eTmTTLE6EMSFE5JSg3i/lN6GFQAdHUWc1sDebiIfr/zXNouGepDon6AFqR7slyyN+Pk6yp5F7lAO6YOweCqXvUUMqtnrZ/Gweh9SgXPUMKsQ6hUuF6t/DcfTmR01RsQRCooAhgaAxY6rQ6VDQnzyHF6wbairofkMpg8Jrgvwbe6HtSlj98A1Zu2ott7RCS7+B6VWTlA4qJWLdQXUjo978aoFDlVzPfK2pO7YlObQWbgfQoi1T+FFbuiBnsrxWMA8OPln5oBlnC/B/qXMZjn0TMTAUndXHaGV6rLg36sBnsp+/a4gfS7pXh7ylnFvPGyKdKEYNCADvGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPtsSSoRglV4NjHA24HCpsV1436iWjxalukv/tWLxyA=;
 b=hLrZMVyZ/6BOotk2AFXv9QBlE1ruclsLKWVRl71htc6nYhDdrrG8qv8XJWg7IoTbON8UlTrr4S31+0EwEn4aDp30G1Ww4wBYceAaC82vldRSx+IEaJDDHVa1UNW0JpVUKrwkexuSTcZBskv2tHCnp0rrr//8vu2g3XUxxMdixoM=
Received: from BYAPR02CA0062.namprd02.prod.outlook.com (2603:10b6:a03:54::39)
 by CH3PR12MB8727.namprd12.prod.outlook.com (2603:10b6:610:173::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 16:37:13 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:54:cafe::ef) by BYAPR02CA0062.outlook.office365.com
 (2603:10b6:a03:54::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Mon,
 9 Jun 2025 16:37:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 16:37:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 11:37:11 -0500
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Jun 2025 11:37:11 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <jon.mason@arm.com>, <ross.burton@arm.com>,
	<mark.hatle@kernel.crashing.org>
Subject: [OE-core][scarthgap,walnascar,master][PATCH v3] tune-cortexr52: Remove aarch64 for ARM Cortex-R52
Date: Mon, 9 Jun 2025 10:37:11 -0600
Message-ID: <20250609163711.2401924-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|CH3PR12MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: a73707e8-d966-4c36-7f23-08dda773e2d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GMMmTCjTN5oQ4rCc8g9FhiXv1cb7QgEFITFxl9TH9p8EhRUCQgwqKRffjep6?=
 =?us-ascii?Q?rEUJwZoMfIxbr9YQTNLPgMFf1XXR6Ik/jGFFKnfBu9PfBN9+dtXOjWYK5Z/T?=
 =?us-ascii?Q?4CIbpbyS4Qs5k2yDotel8RZGphMUrWEOdW/fVkNrFz7GmWMgaC3mlFtEETf5?=
 =?us-ascii?Q?SVX430gdnO69w9A7/ngU1ltZ7A3c7dx+tvZEkp95KgiMmZIaKfLBXbLRkppb?=
 =?us-ascii?Q?L7R/gZ6245cjB2HUDRyZWo7G6LxIB4jzJSNEKo4mwP/3aPG0zDnDOGdRD0c+?=
 =?us-ascii?Q?aRn+ySJKpwV4O0GQTq6zIsIDHxleQtoth/jChiF4g9b7iviLWmGO+lmeg6eE?=
 =?us-ascii?Q?59iXz5c70865RGE0QvOZDPf10HVJp18hn/Smurp0Jkzcn/VOs/LD/4bw3qqr?=
 =?us-ascii?Q?H18t6zjNIN+ggdEPEJwGS7+BuQfXUBxZrTjQu79oQsk3UG38f3TPl28qahgr?=
 =?us-ascii?Q?Ueu4qiknjO2Apq6ov2PyyNewWjXnqzRApeDPNCyicy5IV1/zdBzxMhj8qHmD?=
 =?us-ascii?Q?QijhyglX+0trjawB89dfU4+fBx4VkSobP6Y+OTXCfsleRHrB91q/iAt5+toW?=
 =?us-ascii?Q?3YitaXTYygOBSgYD4Er9j+M4ihEz5ZuonJfiihHVlONOx0P7wM+vL1iR8bae?=
 =?us-ascii?Q?d1lkxQJljaptRa2yOIlgReg5lxXPZctmFqH+urIGquaGtYYxYsL+Xr0usX5/?=
 =?us-ascii?Q?MOeBWum3uJtCBoT6ZuiYMRwMhdyAKV8MZMdctQggNXhANvBjkwz1PxuhEuRY?=
 =?us-ascii?Q?IU0bQfFudjC1wkclaWIBk/zJdmfjMg94aFSSHomGyZnE5qLe6VrZuhoQHOX/?=
 =?us-ascii?Q?9tSISPaS4H/9Iw+6cP/tnMT+Hf6Qbq7bheGsJeflVgsEpaGYHSjgCeXwKJJM?=
 =?us-ascii?Q?asKe8JsLS2HViTl43jR7dgbqogS+nYIVcN9lxDi+lo8tieVQw/NR1aUlfmG1?=
 =?us-ascii?Q?g3odyjy+GRsaiCm71ESEPT+pVCaBoOndh4jKCne163I7hSzdz9RGq03t30XK?=
 =?us-ascii?Q?2+0owEbu7t68Tlah3pZMs0sJQ3AAsxu487RlT7vEyi933WSGO48fWbUIUe8A?=
 =?us-ascii?Q?TGsoorBgwX2Xm5AgYLnILOMhCLEIORrv8BKAqjULq8XQl1FAzhmok66BHWU9?=
 =?us-ascii?Q?Wkt09TXFWXL6stYnwh0/OI/px8Pg5Iyh/YmqrT1IZJRTgPM2QJq/IwUEnU11?=
 =?us-ascii?Q?dtDi4mgiOZUiHhU7GvTwhQkJz8FHfM7/8BOYjkr3MtAXJraQ4HVtdCASNfWL?=
 =?us-ascii?Q?IIwI5TMmwyrU9iDJSYyDqK3lVr5R1HAnu+9niwg/YGy8O7mHfqwUZYQFlr6V?=
 =?us-ascii?Q?Ma9+Zn9x3KCQE6y0aRb3nXWs08Zuj1OvVRMZSSQ2k2dhseNyfXAA68VP/ZAu?=
 =?us-ascii?Q?jKfsEJOT+iSvtPJr1eL0YNfkfwpgPBQw5nHrKjHItV+wbJHu7Xh/AbNZe3H7?=
 =?us-ascii?Q?NefKrFcQWL9QTbTf/zjl1EbZVmjHJkkf9VCQ5TVMCkCe17yJqndrSBy4eFIS?=
 =?us-ascii?Q?s+bne+lKTHgzAjwehgS6j1g2Leuon+AfbilR?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:37:12.4128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a73707e8-d966-4c36-7f23-08dda773e2d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 16:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218298

Remove aarch64 for ARM Cortex-R52 processor as it supports only 32-bit
ISA but not 64-bit ISA. Also update ARMPKGARCH for cortexr52hf.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Signed-off-by: Sandeep Gundlupet Raju <grsandeep85@gmail.com>
---
Changes in v3:
   - Add scarthagap, walnascar, master branch to patch subject line.

Changes in v2:
   - Change patch subject.
   - Discard cortexr52-32 patch implementation.
   - Remove aarch64 for for ARM Cortex-R52 processor.
---
 meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta=
/conf/machine/include/arm/armv8r/tune-cortexr52.inc
index 89f0e09450..e8667bc16b 100644
--- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
+++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
@@ -10,11 +10,10 @@ require conf/machine/include/arm/arch-armv8r.inc
=20
 AVAILTUNES                             +=3D "cortexr52"
 ARMPKGARCH:tune-cortexr52               =3D "cortexr52"
-# We do not want -march since -mcpu is added above to cover for it
-TUNE_FEATURES:tune-cortexr52            =3D "aarch64 crc simd cortexr52"
+TUNE_FEATURES:tune-cortexr52            =3D "${TUNE_FEATURES:tune-armv8r-c=
rc-simd} cortexr52"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52      =3D "${PACKAGE_EXTRA_ARCHS:tune-ar=
mv8r-crc-simd} cortexr52"
=20
 AVAILTUNES                             +=3D "cortexr52hf"
-ARMPKGARCH:tune-cortexr52hf             =3D "cortexr52"
+ARMPKGARCH:tune-cortexr52hf             =3D "cortexr52hf"
 TUNE_FEATURES:tune-cortexr52hf          =3D "${TUNE_FEATURES:tune-cortexr5=
2} callconvention-hard"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52hf    =3D "cortexr52hf"
--=20
2.34.1


