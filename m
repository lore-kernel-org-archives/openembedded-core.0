Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DBCC87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 08:43:38 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.143])
 by mx.groups.io with SMTP id smtpd.web10.46607.1754556213589213431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 01:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=lB9FdBGS;
 spf=pass (domain: gomspace.com, ip: 40.107.130.143, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJgwXdrZGGRKoWF4rl/NOSWF9xntkE699GyvgEvm1OMJq1wgkUYstmF7UJ1HJ/8DTbDeflsnuhKTbHBtRMo5OBieBY3JAEZRhZjOTHAK+vSqskHNJyQ1maHluEUtsvAnoe79Yb5ZbuZstSDZX9MjIP7JKxO5JQW1N61ByxsvO+mcoO/B4UUgjUu1PLIIvL3EuBanPWJ634hJL/uFpiM8w3Jd+uGAt7xcKZf169DrvW91qvImy4P+zI3H3AUNmmDeq2AyYCkDMrEaGfcAFrhO0m1QA9tDkUFuxxctSA0qrAuCdkd1Kml1UxQ/g4DyRD3vhkfR2JaLtXOQyzRZdy+ArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5YKh6jLEcCeJFamVdC/CFqF300E892bwzyw3crz1n4=;
 b=FghsKAVn6IS1FFjmzGK5/6pzjZ5ai6kTIkvX1F15ffDtzLWNhml6eB0MMPOOT0zhEDVlQcZWY+/iQzi70vW6GqvHCRFJWpXjzLqSlFauuxuWcjUygOMEJGW25PtJDQ6vF/Cs4rcrCNSSk3nh+Aa+fv+BlB3MvaW8ex6/QuShIjuVRb9BDbQeNzWXFp/+jIqUjNC2HO4Wk5FXEphMxu+oefDRBEkt3cTDlKFQst3jo3CUX/sgpH+mdVjhoT37khmXNHaXgh7mfflhUk+AYbUAqc9Le1LIw16NwnWyfR55Vff9yTc9ZT3p6+afJEZuS9Wlj1Tbi/0at23m/IBu9qRbiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 79.171.149.170) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=gomspace.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5YKh6jLEcCeJFamVdC/CFqF300E892bwzyw3crz1n4=;
 b=lB9FdBGSyOjnWa6abTsSd90GZbecMoZzQjFPKNQtATPNj7B/+WjrQzSXUkg2X2qbdv+RhCr5h0U9ezAD4NK+DdVzIvO1KDD2WCKCqkW3uo/Mv/AkbICV1/94rmjiER5fU+Xh4UjQv2sYFjKiQVSOUowHexUTXStHx/Fy5tF4AsQ=
Received: from AM0PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:208:3e::14)
 by DBBPR08MB10409.eurprd08.prod.outlook.com (2603:10a6:10:52c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 08:43:29 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:208:3e:cafe::2d) by AM0PR02CA0001.outlook.office365.com
 (2603:10a6:208:3e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.16 via Frontend Transport; Thu,
 7 Aug 2025 08:43:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 79.171.149.170)
 smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 79.171.149.170 as permitted sender) receiver=protection.outlook.com;
 client-ip=79.171.149.170; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (79.171.149.170) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Thu, 7 Aug 2025 08:43:27 +0000
Received: from DK-AAL-EX02.gomspace.lan (10.0.1.86) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 10:43:26 +0200
Received: from ThinkStation-P3.gomspace.lan (10.0.8.56) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 10:43:26 +0200
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-core@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [PATCH] systemd: upgrade 257.6 -> 257.8
Date: Thu, 7 Aug 2025 10:43:25 +0200
Message-ID: <20250807084325.1980877-1-mns@gomspace.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C711:EE_|DBBPR08MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7c1e80-be59-41ea-375e-08ddd58e7a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hQBfEqzLfD72uiE+/2jVSsRmV76EMLqcaq1VVby8M3oEcXEsLWpg6MurHIlZ?=
 =?us-ascii?Q?2MYf15bPDEPedaVZl/ICW48xeoo32xSWb1wJMwG7JSePSkOsssU/Idne28Fo?=
 =?us-ascii?Q?st0Vj9iDmlqVVGls6104IUYu/qn20EHsdbGhATzAPGICp1qks8vTvMcspoC7?=
 =?us-ascii?Q?t5M9fIJwxM4ZvNI96TT01aRCD4lh6G2On0S3iZ5bFISBLMBIMTnLlvPMQ7BD?=
 =?us-ascii?Q?ClM46YFdNnWvFrLrWlDzUUbgiuzp/nwrjWhLPtKjtpyCVg9R3Yt+65mCEIme?=
 =?us-ascii?Q?4gVerLVNrE+3RWumXooFREukLh5H4HQRZR5YSCkGboO9DleL78C/28ijC1al?=
 =?us-ascii?Q?nXHFpXZmTf6aXQEWIfLcsNxuLsfvvi3YJ7EBymh4ngjfcM5IhMcGfRQrkLve?=
 =?us-ascii?Q?YdYLGkYhFqrMOzji63P228uc6lh23qRh8hHA4zs/9uc1yuKeTxk71r9+uDBu?=
 =?us-ascii?Q?dAdVhGzrznv4JCx5nlaSobIv37v5gvlgvZA8wFKYhWguqHVgMz0IS5CtoTua?=
 =?us-ascii?Q?bwdxXSXYNE8IdC7rBToB3q7L1EllMNT1mxKfBUGR471No0Jqlq6otv6HEtLi?=
 =?us-ascii?Q?MS+dkxmNXB+MUMk9Zgtx5jkzvqXYa7EHzS8A8OSPEyy50gvgkM8KX5Q3vKfy?=
 =?us-ascii?Q?TFlglJu+GBzCMBUsfl1wUUbWotyBGdx9QE9krGVnIFnk9jQ1lFmgjZ1/pgPk?=
 =?us-ascii?Q?jM2LSOuzLtT3wem4wG2bqptqTomB/17TU6zx6gDLT+U8Hy7e3q4CqZyLgS24?=
 =?us-ascii?Q?3DBaF487xue4+L9Im5dFHknH61+/+gNdD6NxM3cbZRPHxzIz8waInxJD0g4a?=
 =?us-ascii?Q?MtFzHLI3/XA6dulMSu4TL4sVZa6yhhoxBc6+sVDnZrCYmuzQPc4dpkAlSoGq?=
 =?us-ascii?Q?yosZy9Mk1YqAb6aOZASivIKJ7suJEsIzCrCK5WOvk18TGJcYZ6EppgNo+UbH?=
 =?us-ascii?Q?6SmLdcAx9NoyY8iym75YeXYl9T/LZEBu3nAcgfFXd5ygb9XQTjwoK9ZiHfnj?=
 =?us-ascii?Q?KvM+k7dKY7poREoR1yepG+i3i0sZgCmkX0AZ+N2AJ8yRvvS0YPiGrFuFTNrR?=
 =?us-ascii?Q?9rlymivfnB90Yg7GNDPXtkMoxtZrZAhta+ARLy48RRFtKVO9aFnaSAPWaR/w?=
 =?us-ascii?Q?Rv7Se+UBLDgRInUH82eGLN/Fk5nJF6sjlMv25OVnLccX+f2BlLdQeuxeYirE?=
 =?us-ascii?Q?IZERJi15qbbKtfkbQvrTpDn4FLRBWfZivQRUFJgBftQtDrQjZ37k+/z+i6sO?=
 =?us-ascii?Q?4gRNsiuapQNzt1Eko8dcxzB4xGtmOrihec8xcB25CaJ4uyW8myPz2EfQ6gBa?=
 =?us-ascii?Q?9lRnRiBi6aAcvEyS3By61Wf2vdhpoO+BQ3zQvevB1pEhmc65R7aif6I/iB5G?=
 =?us-ascii?Q?Odb6kz3Yxt5VCCNVpBHX1nDfqXtOrSQWSu+TX0kZygEp0QYMmRPDczwDAF4F?=
 =?us-ascii?Q?DUBxerM0Jg/5yj4rN+hTZ0KKJXbAuYBts8xjJM6Rk5f04BUdYEgIT0B0kZLy?=
 =?us-ascii?Q?7qKwK+H31M9nT08L7w4HEiicYENVkIYaklXN?=
X-Forefront-Antispam-Report: 
	CIP:79.171.149.170;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:webmail.gomspace.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 08:43:27.1521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7c1e80-be59-41ea-375e-08ddd58e7a65
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[79.171.149.170];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10409
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 08:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221559

General maintenance upgrade

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 ...ystemd-boot-native_257.6.bb =3D> systemd-boot-native_257.8.bb} | 0
 .../systemd/{systemd-boot_257.6.bb =3D> systemd-boot_257.8.bb}    | 0
 ...temctl-native_257.6.bb =3D> systemd-systemctl-native_257.8.bb} | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_257.6.bb =3D> systemd_257.8.bb} | 0
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.6.bb =3D> system=
d-boot-native_257.8.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_257.6.bb =3D> systemd-boot_=
257.8.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_257.6.bb =3D> s=
ystemd-systemctl-native_257.8.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_257.6.bb =3D> systemd_257.8.bb} =
(100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.6.bb b/meta/=
recipes-core/systemd/systemd-boot-native_257.8.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_257.6.bb
rename to meta/recipes-core/systemd/systemd-boot-native_257.8.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_257.6.bb b/meta/recipes=
-core/systemd/systemd-boot_257.8.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_257.6.bb
rename to meta/recipes-core/systemd/systemd-boot_257.8.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index 101457140f..761660f2c8 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa=
882bbe \
                     file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b=
364516c"
=20
-SRCREV =3D "00a12c234e2506f5cab683460199575f13c454db"
+SRCREV =3D "5e38d199a623563698ab4a69acbbe3afa9135198"
 SRCBRANCH =3D "v257-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH};tag=3Dv${PV}"
=20
diff --git a/meta/recipes-core/systemd/systemd_257.6.bb b/meta/recipes-core=
/systemd/systemd_257.8.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_257.6.bb
rename to meta/recipes-core/systemd/systemd_257.8.bb
--=20
2.50.1


