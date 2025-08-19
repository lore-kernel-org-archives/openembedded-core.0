Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34A6CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 10:47:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.36])
 by mx.groups.io with SMTP id smtpd.web10.10831.1755600469541333384
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 03:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=VES93dWn;
 spf=pass (domain: ericsson.com, ip: 52.101.66.36, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgOy5FwWx4WG1LT30wz1vdSzLuyTjSBJWvN6aIiSf5LGS8KeGPALof8TwSJ0Q6uIlFVzbICqllRZAOnecKrKM9CGA6Yj4to8H47G9J3LavhtoO8aU7Ml8qEmEIzBTUevnV46CF6CVxV3QsLwWTunVPH8RWjtEMF5R7p4PfWMzXxICzaOnNiFF5YSAKh2UQBLz8UlSvVZZxUxQiqNOMmfNBZ6yLLOWwNtOt/VokzJSlC0YTr++6tkidRWM0ulunZv7MEpjAu0aoJGY66wp1zE4g5+jgqGeOOAB6FM9Ku307APzK3kk0PjyiMwYSHqOvTwJ/HadrH4oqXUeYR17OFi/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMQVJlAR5oxEIPt/ayEOMSz3Ux82IRMDnoJXFAuLifw=;
 b=ZiTj1n6/eBfKxsDb86cIDqORdMx21mIJhepwIoPGakGaVd9a+1+s5R0E5EeCBfk0/uCmXIWayH8w3b0N32KwK1WyajEKEZLrp1Cl6RkccoHHPEekhYY2g2eFHqF9la0rJDuYiJHpMCpi3oaQ2y5ZolpNDtOyXDOrwEaFVtD4sq45wDvetkXay1tDqNBXNHfWhrFAjc9CLiwM1Wo3f+nJK2OmptR8U35lisCZSP6CDGCJplSzJVHVCCTSEVZne/Sqz+96k32Yj49o84AButoZZ0IUuSt7eMBQ0ikh3pit9FRv2KZm6MgOIvGr1qbZ+8tSFoAsFA+yau2bWTgzC02/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMQVJlAR5oxEIPt/ayEOMSz3Ux82IRMDnoJXFAuLifw=;
 b=VES93dWnkg/XJ7/IMvM6+S2CHGsyY/M/uVO9C36k4P8FzNwe66K3aRtPCCUJLQBizx+oSgTb7VbW1X8n8ZWJKu9xSU4pcne/XfGzsXpdw2fysFhTNmYQlpkswR0Jp6EZKm1mwbaaxavg8Rf3gjuHQ2/vwWxQJI5Up6bOfodgYL4tcy/8x/ogzNMyN7Gc3HPDVqCBLGx+bMdLg3Ecdr6v5w3RxtvBISZHchhTZ/1swck40zGMO2jVAPOtvrl9dhjrVikDuFYgCCYs8jsNRktB6tzi0lNTYcJOkVcrKU5HTDnkpp7lsh60oJtuscPDE74UJFe7D9e3hVRm/AXpeSJHDA==
Received: from DU7P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::33)
 by AM7PR07MB6392.eurprd07.prod.outlook.com (2603:10a6:20b:13a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 10:47:44 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::81) by DU7P251CA0003.outlook.office365.com
 (2603:10a6:10:551::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.24 via Frontend Transport; Tue,
 19 Aug 2025 10:47:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 10:47:44 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 19 Aug 2025 12:47:43 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 8AED395683;
	Tue, 19 Aug 2025 12:47:43 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 6EDBE700456E; Tue, 19 Aug 2025 12:47:43 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH] libxml2: ignore CVE-2025-8732
Date: Tue, 19 Aug 2025 12:47:24 +0200
Message-ID: <20250819104724.2283206-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9F:EE_|AM7PR07MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: 780765c8-ffb3-467b-dfd4-08dddf0dd40e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yE5c8vZr72P2PMAfkyAGLYSsqV7jq+vT4bneXOgSzg8xG7PLiFfulH0RWGWH?=
 =?us-ascii?Q?PgE50tQ+oXVfYg0rUxm+r6iJ88okQ4IEbcMyCDxc3MwhQm2z7kNasoivoHH1?=
 =?us-ascii?Q?pkz8nHn+KINq59QLHJBSNRjs62u8wWan6BM5ITcBf1TfIsArXGum6p8X6mVJ?=
 =?us-ascii?Q?JQctEjvbqjMHp7e5IhG039TJH8SxJKpxxa34P3zrgY9BnBFPj33Ln+MIBoBB?=
 =?us-ascii?Q?aMuSDXxEYHHomCYhDieDdodCPaV2RRFjFfaVEHMvAlrxMtBkoFaCwOR2wsSr?=
 =?us-ascii?Q?jWhhewXYa34rartMw2ZzzvI4YsIncNfL76lQsdSRWQFb853JArttbL1McbyA?=
 =?us-ascii?Q?dgSkqAkVYPHe6nmAL4kE9W134ExWBN/UB6TTt9n8R3C/2Zj5MJUK8Gc5CUFC?=
 =?us-ascii?Q?pPphVjCSDgGXClGPo8+6HoKIN1QFhLk9lAZnmdiN20SroTiu/ioZ7eCJ2TQa?=
 =?us-ascii?Q?SaKx3ENzaIremGVRL+0VwoTj0m0pXsRqkttAjyuou3opf/f8k7NCQ5n5KPo4?=
 =?us-ascii?Q?w8wKgRczPmSyqAqbOvtBdi2PPkAyToKwwbI5xA50rjXfEDI7/GDTg5TTBbS1?=
 =?us-ascii?Q?Cqe54Tbm7bfqs8NioT2W/Afrk94bSPnRq+HN1hPuNmjBW4t9wFt4lR3o1JMu?=
 =?us-ascii?Q?hEUKJQBzWxrTd7yn2eFjNorVz929ZGDTy915nfcYXo0eQbQBbmzd7kGkrp8u?=
 =?us-ascii?Q?xcfIuaGWPxQCa4xy2feNnFF2vL8aLQUji2IYcXSQnyHEwjgAvoH5NJZdr4hu?=
 =?us-ascii?Q?Eaknaagz5g2hN4GLzyChMLDzhgtWMnypYVaaZcLHCqY9e37tRjEXCfCuzQSd?=
 =?us-ascii?Q?DKqo/qpwSyyJBJFYuJ/5EcBfCR2ALUiAkiERorWBnQcPXsS89e+21PYFhXoL?=
 =?us-ascii?Q?ARTT0y5u4eMFibzAweBoHraWoynxZ5Td8d5a6pRkDtzxvBFjdOwZeSSGDcu0?=
 =?us-ascii?Q?aJZXd6Rvq4f8cPAkaWdcbDzFC04sUI+oQpKzDVgDtqbW78Acti0OKbYt5AU7?=
 =?us-ascii?Q?/Ws33EaknsHnngugnt4Y6puXO30LXCreQWkZRzRYJDh84F7VjPT4pRT7KCyh?=
 =?us-ascii?Q?C44Sj7K5kWg4I01DirPQUYfawpPCZcLb4HEE8puuZhTv13+u15jVkg+JMWL2?=
 =?us-ascii?Q?ejdjLKG9gNqRvsu2oYtMN0FqL6IxyR2tgNkKFVFjpGV+GLy5E77p1I/jZNtW?=
 =?us-ascii?Q?nHDyE6SVASIv67VmxGayw1MnJACayKOaVQFtqn1EDPQKt+r4q1kSarfMK7gJ?=
 =?us-ascii?Q?OsfG6NS/ol4+BsLy6doEZ9jZZC9cKg0xGh3olX5k+QHkQ0U5wOUQD9JGNzLH?=
 =?us-ascii?Q?5bdk+D+Jh7PJcK6Yi3/OZE3jFpg0Iblwc3a5ZH1V2XLQAc2EoFAJLkxzn9If?=
 =?us-ascii?Q?kIhmiO7zhTZ3ePcYRTe2p8hXgKvSjZErMedj4JoHvtTiMShYkj6+vDEeVtFG?=
 =?us-ascii?Q?0AEg/k4CK3/OD26hcp082MZ9oX76GzVrktmkVsaSmW/yEEggb9bZS2xDEyVE?=
 =?us-ascii?Q?dYt6QqrWi+m2ftNNYd3gw7WhmHDmWfsNeZQl?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 10:47:44.1070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780765c8-ffb3-467b-dfd4-08dddf0dd40e
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6392
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 10:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222101

From: Daniel Turull <daniel.turull@ericsson.com>

The code maintainer disputes the CVE as the issue can only be triggered wit=
h
untrusted SGML catalogs and it makes absolutely no sense to use untrusted
catalogs.

The issue triggers a crash if an invalid file is provided.
Source: https://gitlab.gnome.org/GNOME/libxml2/-/issues/958"

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-core/libxml/libxml2_2.12.10.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-cor=
e/libxml/libxml2_2.12.10.bb
index 078988286a..a155c3708e 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -32,6 +32,10 @@ SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97=
d68e6c4b5c8d83e69a2be47223
 # Disputed as a security issue, but fixed in d39f780
 CVE_STATUS[CVE-2023-45322] =3D "disputed: issue requires memory allocation=
 to fail"
=20
+# Disputed as a security issue, if attempts to process an invalid file, it=
 fails
+# https://gitlab.gnome.org/GNOME/libxml2/-/issues/958
+CVE_STATUS[CVE-2025-8732] =3D "disputed: the code maintainer explains, tha=
t the issue can only be triggered with untrusted SGML catalogs and it makes=
 absolutely no sense to use untrusted catalogs. The issue triggers a crash =
if an invalid file is provided.  https://gitlab.gnome.org/GNOME/libxml2/-/i=
ssues/958"
+
 BINCONFIG =3D "${bindir}/xml2-config"
=20
 PACKAGECONFIG ??=3D "python \

