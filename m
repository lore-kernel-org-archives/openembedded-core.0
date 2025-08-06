Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68C2C87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 10:44:11 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.85])
 by mx.groups.io with SMTP id smtpd.web11.22348.1754477046313833019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 03:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=PbNcFU8A;
 spf=pass (domain: gomspace.com, ip: 52.101.83.85, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VchKh9vlDFITcj2HJ1uXvKEvBKOF6MCK6/cFNo4l8Jzyj5hO4z4DnMnYTJa2dnJC9cmwFMMhgmqLyN5ZfVZgF5mdCpS/Od28vaAyDXvTZKkFTfpaaRNXkhjK6OWKY9DhAoLJ0+veBD1bZKLNuBM/zcUDgg2jMqPR6KZpWIOtBxLUpRDBqXQr8oNmnACIvYXO5i2BAX2uOL5ooYr/hWuepi3+VRtxXBwZX2PAwbvJCbsJfofIoY9P12FJR5CE42kDdwH7zuR5kjg1UjgUsxcr3Osd6YREwlKez/aAPFSRWffT4IvjBWaKhUpd34z9sgcF6PqWiVwwoWNBRY0uY8bv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuQTZvDfMtaA9QpkZ/q+j07QkjtUOn0rp2st8gxDw/o=;
 b=cskcDdtKPRaScq7aZmRuNGNHNfg02paJpabaeQt9YvIH7PpkkYxC4ysoHvxEakGbcX1WJfvcZrwODaCT/vx6VQmrQazihGpB7XZEHYugyKAVP6FuSU1n93GDdmIyE1v9NDxluQuVo7SYholNGFsdMUmJ8t+raTGTFWu6J91x3vgi0UUPfx7saQrotTMb364Hbn98siQHkO7g0XOqbNUOsGN1pGgKK1vgu1hP/+twIrMFr3y9oYAEzAHBR9JGy8vRUPt+Jxbe3iUiAhW8TsJghtRmbHt+ntvlNIs5mEMzcnKfXeE14lu21bVTXLa4rlGcsgVU1oaJp1+Wl2K3bPbqiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 79.171.149.170) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=gomspace.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuQTZvDfMtaA9QpkZ/q+j07QkjtUOn0rp2st8gxDw/o=;
 b=PbNcFU8ArRglG3eeRijl0LY5xAtojTcRUiYax6qtQBH9b/35Pg9c2eeNkOxbUr4M1E1NdrZo/Vh5YNj2OStjA8u1CPSbE7heazB3XOGmiqGRrCzaEIsUb8hmDmDlqSbQ/k9XsQlTsLWhrmgYsPIcWfVKe8auaikxpjNf+Sg7gPQ=
Received: from DU7P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::7) by
 PA4PR08MB6141.eurprd08.prod.outlook.com (2603:10a6:102:f2::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.13; Wed, 6 Aug 2025 10:44:01 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::3b) by DU7P250CA0020.outlook.office365.com
 (2603:10a6:10:54f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Wed,
 6 Aug 2025 10:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 79.171.149.170)
 smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 79.171.149.170 as permitted sender) receiver=protection.outlook.com;
 client-ip=79.171.149.170; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (79.171.149.170) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 10:44:01 +0000
Received: from DK-AAL-EX02.gomspace.lan (10.0.1.86) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 12:43:57 +0200
Received: from ThinkStation-P3.gomspace.lan (10.0.8.56) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 12:43:57 +0200
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-core@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [PATCH] systemd: upgrade 257.6 -> 257.8
Date: Wed, 6 Aug 2025 12:43:10 +0200
Message-ID: <20250806104310.3178928-1-mns@gomspace.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9F:EE_|PA4PR08MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 623d73af-5c88-4a58-98d5-08ddd4d627bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZWs9cy+6yYQKGxq2woraryH5jdm3H4nAXrD4AO6uPIe+1SOTyoD7lvLzcACp?=
 =?us-ascii?Q?I72jdOO+1RplksO0ys/9NnKQgspCbHVIs7so8jp99DSM63kjggAJUAEEHLEC?=
 =?us-ascii?Q?1jbeYY37ezw0sw31bGQ2dSWzHbP+mLclpaqRXsqfIkMIztPgH2+lS08j1mXr?=
 =?us-ascii?Q?FaOzq6zZf/xqOQuS+mNDw0U0dWcKVszYrI52NMq+Gjl8DD4gVNuihtfX5v1X?=
 =?us-ascii?Q?3x51D5pC2gYT3oqWhTNlsqFrUa+P7t4JXTvJHEghoK1eYMgpoTQIMJkSiPpM?=
 =?us-ascii?Q?5ajpuKu/ua2asCcFeyvldLWEswcg4tAQk4ko6DFOTWMrNwPLouasvfvd9H+a?=
 =?us-ascii?Q?1H5oyiOKQTR4jl6m5t4Nr27MKeOyk0Soiq7TPJbwTCRznPzFoVk3LIVrbw9I?=
 =?us-ascii?Q?xtLcYxQHgyUOjGo14wwHGuUmOcGYHfXo7l2wCEPWQgD2rgZsNhKOIyF9K9Q7?=
 =?us-ascii?Q?JKDw3rYUjCPIM4eK5FPrgFMRN5fBAwDZ8ua1gOx91Uy4aWbV0U0iiKwCqtAQ?=
 =?us-ascii?Q?a81G+GjyzOOku1hz4Vk1FDJQRgWdnHZ5o+f81esmjDsjnt4WFsF67Hlhuc5t?=
 =?us-ascii?Q?u67uLMVFGUwjV4chZxp69XFZd3gZCjOWW4Abf/A99fzked8dKiG2ILqgIC9K?=
 =?us-ascii?Q?QWyZPia4hc5/NBDVTH+D5SUT5IBW2MLiNgn01MuR+eK4q3TNDZf/xr/Px7xe?=
 =?us-ascii?Q?r4m9Q+3gfuiXVxQr3a/YIrDpstjXAwSacEzqB7FUugMGKOO/tzz79l+ALDQN?=
 =?us-ascii?Q?GG2OJL1L97yZnm9IifPty/BZVKDe4qm+T8gZsnO2ygaVyS2HPmwzG4EjhPB5?=
 =?us-ascii?Q?vlnPYXIMwsSr/EoiI3pU2nHWUuKJU/qFol9O8XiASk1bxz/8EEWxbsdMP0A+?=
 =?us-ascii?Q?78UEz0K517kVb1QNOwzahZ7YkdSprqzza+tmzaGxvsQlQv0EKc8E7jR51Vte?=
 =?us-ascii?Q?7x5D8pxYeDpnSvXIfCHzkjRRuE8WQjZeNpBEmQbeOi6jXkBJIC3/bz57DfY9?=
 =?us-ascii?Q?iUWFC4AcouCHTWt6M+jyVBZeDErS2eDx0m4alo5w+rupHm4ioLMOr1vQLJMH?=
 =?us-ascii?Q?pwQ9lz0DaJSIhbvaYs4DtQFtFygjfHGleWDGr7UiPZtvNQ1ZA7s6uqSLFyQk?=
 =?us-ascii?Q?t8G8wTDAhNhgij3LR6eqxBJdwXjSyKh/hXgPsZ9dLDG+pnv6t3CFjwWQdlpn?=
 =?us-ascii?Q?F3zZx03GU0eUTqxI8l7EQZSn8nkBypIvR5chUZnnNidlAE9pO+fMrcysQNt2?=
 =?us-ascii?Q?ulS8jPuB+KMA+2D7dRUQlMEk3lk1C7EGZYPbmq/UQLUwmzF4l6tDz8NNjW1h?=
 =?us-ascii?Q?btKwIg5AZnNONVHPDwshThdBWZZVLTJpxUrE7fdQ8cl987y7DeYst8oo/OPx?=
 =?us-ascii?Q?D19tUqOvK8FLOORsf0hvO6jBLfEhuuFBmJ0XZ5DCjOKL2LDN78HWQvEVonxL?=
 =?us-ascii?Q?Bv2frotteH1arTN9FYobevj0a5nNK2eVBci5AgYZ8ioJaCDCFR/w2BobG0tP?=
 =?us-ascii?Q?kBIt1DpG4wHwSLy53flt/3qzYC/bIQXBYvR6?=
X-Forefront-Antispam-Report: 
	CIP:79.171.149.170;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:webmail.gomspace.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 10:44:01.0561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 623d73af-5c88-4a58-98d5-08ddd4d627bb
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[79.171.149.170];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 10:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221531

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


