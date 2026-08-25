Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1FCC61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 19:17:26 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30225.1787685437209500681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 12:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=D+68fgfU;
 spf=pass (domain: axis.com, ip: 52.101.84.38, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXtyXTrqivfz8v/cIUUubmXuFqxVWnd9PP1fTByCtGFAP1tImKssthM6HIO7vJPSil+y9xOoLXpiCZRod0BT2zticR8dVgkK+XXKjPDe9cufrQN7N8vjMCPLZm6STl4IhqSvjmSdJ4GsUurX+uPSHUgDPlvvCGuXkuzUt9sPTEjdxkIdPXfueCp13Mnlx71DLJo/H3FY1K57b74Gm5owPn6QLhgBSsgDITswWUo8ABvBvPetSqLK1UGvbwRCsqd+91xyhSNsgNVwTunDb8l1b/lLSiXItlfOPbFGoslo0VXnXym+03i8S7S5YesZrsbCMZWvfsnHw9cIzAEHiy0l2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezaw2EFz/bITrSutU9e+q2U0OUUDuqMasnn+9YJz61E=;
 b=LaaSyq1bsuDeJOAbdrl8SjUwlrPYdFfOpNar+j+U5kvZaABZI8QciPkG1YlxCkjosnMgLw8OjYgxkjIBWRg8vLfHVp4RIwVbYRoBbfdo/l5ruQzVkcnKRfyKFCAmGPsajePw33Je9bP5JqEZ+faRwQ/DUOvTfrX879roaIED/ICAGj4VDlnDQxKvTdKGdfhMngWGrWtB03OrU5Y8/0KUo5vo7aPyMiL1jDIvfOciqHWT6yx6cu5pN631TpJPoHNQkc1vI6zgdxi8Nld45iELa11ZWJ0hrzemNxrlxyYypf2GxFx66hKCRDSZqtuwaGFQ/eRuN6oXvEFOXx3gPIrm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezaw2EFz/bITrSutU9e+q2U0OUUDuqMasnn+9YJz61E=;
 b=D+68fgfUBmdKdisFqAIzw72Ujax6zFoZYKUo0RMWWamqPN+Hpzf8nmz7J7fgID3fC/lle7fBMKaw/XF2p+xplAwNnH9HdXaLa9mSh/FLuu/S4uwszmrDjiNw+PCFJrLy9OJVEhjA/kjxfa97boebYtrzObe7glK/icw9W63n7Os=
Received: from DU6P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::19)
 by VI0PR02MB10586.eurprd02.prod.outlook.com (2603:10a6:800:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 19:17:12 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::ae) by DU6P191CA0002.outlook.office365.com
 (2603:10a6:10:540::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 19:17:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 19:17:11 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 25 Aug
 2026 21:17:11 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 25 Aug
 2026 21:17:11 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 25 Aug 2026 21:17:11 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 37A912CE2
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 21:17:11 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 340C112B4CC; Tue, 25 Aug 2026 21:17:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] Revert "busybox: Make provisions to disable sha256/sha1 accelaration on x86"
Date: Tue, 25 Aug 2026 21:17:07 +0200
Message-ID: <20260825191708.3014535-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|VI0PR02MB10586:EE_
X-MS-Office365-Filtering-Correlation-Id: 977fc0d2-4fa6-4ee4-80a5-08df02dd7708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|10067099003|11063799006|56012099006|12006099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	GZoqli35eqbZ/IGM0bZiuJU+0DhA9FABe6OQ/WCgnYau2PWIWose6bP7NDh9S0GX6XKcPTVdgQ+yiqgX6wD3oOjd39mck58FOwSBqmTs1SiqjgMqGA5FgbvhKi5wz8KWOsA+3PX9piOuTEqDPJ2DDbpS5l0z2onyVT5GINko6dE/h+q7OXWK6gNJ4RRUw2/zbSdu3Bv0fKxC/EhleWbUazFHZ9aD/7uc7dVEOKqC2jvJWc0qzk/zlz34h8dS6rWoMqm9Y42+++qaPK9RirslmwMd/JI9JJhSAgwjA7ICW4o0tP6CAgr9yMA7SNLkYjXrTWQIRJtGV751fS2yudVpOeBGjzRdj4fRkRNlBwFCA3FVtZS1pYtFU6rXPp7ycjxdm3OZJfFYY2DsC1dKsX6AS4IcJEqdbsiKRGT7wZrl9LRT3DFLh2tkfmRHomVKV/70G88Goouz5HlZPRlqkdmTMH9Qs2ZwOae2Ku3bRZrvwCOxiI4KdRdTxO4sliG+SkTAki9PxoIjqn86oLtHKBsNrUBJ6EG924zy7FK47WPAIigIZqRAs1bNPgq3KiWrBqSPzFD6cdiNJbcB0Usfxha7KA8Gw7Ijkfx0YarmmkwAy8UxJaU9W+45nSIgunwavPO8B+zmZn57DyWuhFliLXYiVg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(10067099003)(11063799006)(56012099006)(12006099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MkN7lzhPPirW6FgT3lpJtq+CEv4LW3yy3j+jZudV2DWkefitRWqidqOl6jIQsEHXsOpxK6HvShqS/tT+NA1FNGjlG9Ks5/PMFWVmE4ALEhQKZqEukddEeoRHDculre4Lxn/9nnPNbqGLJXXBqUSvaR8QOsF/pzPiLJ78zLy7aotcFx/xbdiZeoAO7cOBRploJx2g2tdli4xpPf42uhrKNhS7b2R9+M0IvWGz5flpZFaUx/KhGBBMcHwZxQaDLcUXq3sbty4wCsWIEQRmrYdNzwqbqyP/AvIS3oNWM4O/Du2QAF5VaZxkRz+b54sj/TKJVryxgRqsYrd4fef+19+MMLUohkr0xhVimyOSsVuLtD11g4XDSJy/QuK0O4eO/9P4dM8gv5nKpiukaqSmqZwMahtXJZ2t4qTcgQ8h8PJqOzkAwtyFHJX9w8uNYFbiYqZL
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 19:17:11.7461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 977fc0d2-4fa6-4ee4-80a5-08df02dd7708
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10586
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 19:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244270

This reverts commit 22f639d61127f4b82a79008c5305e44e090a3680.

The underlying problem has been corrected in 1.38.0 [1] so that
acceleration can be enabled regardless of the architecture.

[1] https://github.com/vda-linux/busybox_mirror/commit/bf57f732a5b6842f6fa3=
e0f90385f039e5d6a92c

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/busybox/busybox/sha1sum.cfg   | 2 +-
 meta/recipes-core/busybox/busybox/sha256sum.cfg | 2 +-
 meta/recipes-core/busybox/busybox/sha_accel.cfg | 2 --
 meta/recipes-core/busybox/busybox_1.38.0.bb     | 1 -
 4 files changed, 2 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/sha_accel.cfg

diff --git a/meta/recipes-core/busybox/busybox/sha1sum.cfg b/meta/recipes-c=
ore/busybox/busybox/sha1sum.cfg
index 151c447658..01137a2486 100644
--- a/meta/recipes-core/busybox/busybox/sha1sum.cfg
+++ b/meta/recipes-core/busybox/busybox/sha1sum.cfg
@@ -1,3 +1,3 @@
 CONFIG_SHA1SUM=3Dy
 CONFIG_SHA1_SMALL=3D3
-# CONFIG_SHA1_HWACCEL is not set
+CONFIG_SHA1_HWACCEL=3Dy
diff --git a/meta/recipes-core/busybox/busybox/sha256sum.cfg b/meta/recipes=
-core/busybox/busybox/sha256sum.cfg
index aa0b0b0b98..a5b0ab22d1 100644
--- a/meta/recipes-core/busybox/busybox/sha256sum.cfg
+++ b/meta/recipes-core/busybox/busybox/sha256sum.cfg
@@ -1,2 +1,2 @@
 CONFIG_SHA256SUM=3Dy
-# CONFIG_SHA256_HWACCEL is not set
+CONFIG_SHA256_HWACCEL=3Dy
diff --git a/meta/recipes-core/busybox/busybox/sha_accel.cfg b/meta/recipes=
-core/busybox/busybox/sha_accel.cfg
deleted file mode 100644
index 70038a8509..0000000000
--- a/meta/recipes-core/busybox/busybox/sha_accel.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_SHA1_HWACCEL=3Dy
-CONFIG_SHA256_HWACCEL=3Dy
diff --git a/meta/recipes-core/busybox/busybox_1.38.0.bb b/meta/recipes-cor=
e/busybox/busybox_1.38.0.bb
index a75c6394e9..8990e2a97d 100644
--- a/meta/recipes-core/busybox/busybox_1.38.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.38.0.bb
@@ -62,6 +62,5 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV}.=
tar.bz2;name=3Dtarball \
            file://CVE-2026-38754.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg"
-SRC_URI:append:x86-64 =3D " file://sha_accel.cfg"
=20
 SRC_URI[tarball.sha256sum] =3D "34f9ea6ff8636f2c9241153b9114eefa9e65674a45=
318ae1ef95bb5f31c53bb2"

