Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EDBE6780F
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 20:39:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web11.24571.1730579960408673677
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 13:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Z1y4/aJh;
 spf=pass (domain: axis.com, ip: 40.107.21.41, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYYzrX5hHpMNKtdBiQwpsyJ1EtY44SRylwdzU4hawC+QdtxstVyUHaASDpT/c6wDErDsd6ODB/GzujTXHroiWX/YOjHoVnDaDnwoEdMdpSTtGuYKjnkdEb2B6DeC+VeBYnDOVUMCT7rZa0EVDBrDZf9YtQSLQjtXzt3WpD2XlmKoEGtMYxInQWc0VE+3fLMU4hKCXYKc60oi0OrD8Mj1dHNdLU32UyYy8jsrkS5olwTYg9PnwNl/HeMudXnozLZX0E8thkVex9RDB0yB/jt1NdihXHx8OOBUik1etitaHcMYcZSA88Cinzhp+pbA+BsH+76ElXnBAJ7y+WJk2/Yasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=571hK7qKp3knKUAsobQz3I0TaLR2941VO2Gfuz/BOhc=;
 b=wgHu3jdqrzfLxgLt9Hmphwz2YunjzdFeK1faULbUNaomQ6MWTsXoLodsLOrYAGTKbL0eprRwXgD0Km2dsTgxAVO9VIUe2/6mJWHRY4tyMyrd0zGofo+FI7QOWDZIzkZlcvGcS7aN6Mhkvjt1J57aRq5cJY2MTdILSHlsIi00Cb/gzsNDd2HT4GiJ+nKpKTcP9yxBvymlHau+Wm7KJQT96IJHHRL1HbFfGNQ8UZexgMg86DrpCFqCVNWIOZnqe77ahwvi2KUIeTqRGmGPr/ojzrPhJO2VLhNBXBz6LyB6A7mB7gAovAoi7BkVBnOP4WPJTlKYnrmNFLdrp9tdlS7LVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=571hK7qKp3knKUAsobQz3I0TaLR2941VO2Gfuz/BOhc=;
 b=Z1y4/aJhlcCXfj5gf//v/ZAjsuwMuoVMDkz/ax6oOyr3Wvnjus0IqmvjH17UQlWvhCu9S68GDjhmOJayxI6oRjhYKF7PElutDPOwJNVvIn6mNjPA1pTRmY2iebLmDdB7YaPxNP4UFWQv5Z3f6QZDYhgtb5X57hLQsBLypjCD53k=
Received: from AM8P251CA0020.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::25)
 by PA1PR02MB11103.eurprd02.prod.outlook.com (2603:10a6:102:480::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Sat, 2 Nov
 2024 20:39:15 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::12) by AM8P251CA0020.outlook.office365.com
 (2603:10a6:20b:21b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28 via Frontend
 Transport; Sat, 2 Nov 2024 20:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Sat, 2 Nov 2024 20:39:14 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 2 Nov
 2024 21:39:14 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 2 Nov 2024 21:39:14 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 755ACFE
	for <openembedded-core@lists.openembedded.org>; Sat,  2 Nov 2024 21:39:14 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 4A2KdEOP1267172
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 2 Nov 2024 21:39:14 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 4A2KdDID1267169
	for openembedded-core@lists.openembedded.org; Sat, 2 Nov 2024 21:39:13 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] busybox: Backport a patch to build with CONFIG_SHA1_HWACCEL on non-x86
Date: Sat, 2 Nov 2024 21:39:08 +0100
Message-ID: <20241102203910.1267120-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79B:EE_|PA1PR02MB11103:EE_
X-MS-Office365-Filtering-Correlation-Id: b46d6e74-4d05-4584-9a6a-08dcfb7e6a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rhUny8iIw0xj3bWwv6gd9P0+FNMzQ8YaXXB/+JqFR2qBwTReFuJzdBBqC2QB?=
 =?us-ascii?Q?ktgOtIMAXeUmBf3T3KWU3x4i3+wlVx6tnuY8ZQnXhUtnHo2rfBPs7g6hlkRK?=
 =?us-ascii?Q?7ir8s2ad8y1LHMb+T3PdAf/26RwNIgNDIALPFEVogJb+uVG1291c8PwNWGQD?=
 =?us-ascii?Q?CFt+uuPiDxwMQWz5Kp99ZTUPy1ZfgU4U4LflyU8lmNHjSgGy5bJ491++owkf?=
 =?us-ascii?Q?MhXcD+fsZEcplFfShCMUsnGegdR/ThZZoWjnqny/UqJdb6rXZTXahpP6OXim?=
 =?us-ascii?Q?U3c/ORthcgjgSP9cCoFVezCNtQRKV0rvdca5+ovHu2a7l/dA8GC9UiQhf8sf?=
 =?us-ascii?Q?mcPHlH8PFlTDx+jnHY3xzN4wlidFFhZ5epqmdOAKKxLkDg8blTkcGJim9CFt?=
 =?us-ascii?Q?yb89BdjdtRjkLTgrcjrOy+h3eR2sR7yxC8iGndY0sLNMilUmyxFUdALIUmFx?=
 =?us-ascii?Q?Qxd4+GWjH+5OQLqVgmEFPmRV9XI642woyqKP+/0xPM3yd1XWng8GW82pbA47?=
 =?us-ascii?Q?hRCgr7mZPjCjkOe3RErHu/nb7dj0lFNuAHoZ6JOw6zOjgSfvz009CIf7AVMZ?=
 =?us-ascii?Q?uHd0CZYIieeFTOV+rQLUGSOvoM3TCUVGj+zagVUuFlXttM2RaujwHJ4ODtvX?=
 =?us-ascii?Q?w8+N2XQ02vsxOtiBTP+1l9jTjr8KcTrB9aPw3YV6Sst4WkmmToeVSR3zByhx?=
 =?us-ascii?Q?Mdybln9oPKJZSQ+Uwic4QF28ZG4QHektGVrW87ujA4dIFcmFb352b3F4mCry?=
 =?us-ascii?Q?a85/UUANMKCnKK1yJnkN1Kz5dkDEBxQmHTQp6wx9aJgOlc+xghnLUmyxO6NG?=
 =?us-ascii?Q?bzF302z9f5h09CVe2PBA4x/fgOpM1diKoLI3KkFMFXJKwcTa3r5I9LdHGrVT?=
 =?us-ascii?Q?tZK1xpxnr2LY0HAXHStGsEoHAodelGDeOwlfnFPSf2lBbS7hLO5lHcPnJCgV?=
 =?us-ascii?Q?jF2TGGwOUV6C6lBOCrx5hEuQUOcMhC6I6nrsr/gdmQOYtSZOSLHk4430NAW5?=
 =?us-ascii?Q?NsX7zs5JcxTkRxoAFQAAilXBJ8PqKuK0ACoC1u+FBA9NH2arH6W2eUbPRSlB?=
 =?us-ascii?Q?qsZ4YPwKjOEbgQl1FZ3B1woMY7cG4Eh1dEIkACKml2yMNvN4v1v8tW8YmemH?=
 =?us-ascii?Q?oSIIAdSIYGRvA2k27oRqObramn0KYH8Zny5ZSqbwmgmfsUGzWvQmxAklH77I?=
 =?us-ascii?Q?Ci0qByoULduA9LW4fTL1f6TRjUp0fh7sEA+CZOd8LtoVbEA56F0SgVUsRnGc?=
 =?us-ascii?Q?cNqfOYXXJSLeCcAssmokKQOn+OZkivK5pluC8lJvbZQE1SmyXbWwm0I3hr5G?=
 =?us-ascii?Q?e7ACQAsTmJ3GYfOA6r7fdkJdNiXotq1D98mm2Qg3Re3i/Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2024 20:39:14.9055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b46d6e74-4d05-4584-9a6a-08dcfb7e6a69
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 20:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206655

This allows CONFIG_SHA1_HWACCEL to be enabled regardless of the
architecture.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch | 33 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-libbb-fix-sha1-o=
n-x86-if-CONFIG_SHA1_HWACCEL-y.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-libbb-fix-sha1-on-x86-i=
f-CONFIG_SHA1_HWACCEL-y.patch b/meta/recipes-core/busybox/busybox/0001-libb=
b-fix-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch
new file mode 100644
index 0000000000..2af188938e
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-libbb-fix-sha1-on-x86-if-CONFI=
G_SHA1_HWACCEL-y.patch
@@ -0,0 +1,33 @@
+From bf57f732a5b6842f6fa3e0f90385f039e5d6a92c Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sun, 29 Sep 2024 17:57:55 +0000
+Subject: [PATCH] libbb: fix sha1 on !x86 if CONFIG_SHA1_HWACCEL=3Dy
+
+fixes non i386 and x86 builds
+
+libbb/hash_md5_sha.c: In function 'sha1_end':
+libbb/hash_md5_sha.c:1316:35: error: 'sha1_process_block64_shaNI' undeclar=
ed
+ 1316 |          || ctx->process_block =3D=3D sha1_process_block64_shaNI
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3Dbf=
57f732a5b6842f6fa3e0f90385f039e5d6a92c]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ libbb/hash_md5_sha.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libbb/hash_md5_sha.c b/libbb/hash_md5_sha.c
+index 57a801459..75a61c32c 100644
+--- a/libbb/hash_md5_sha.c
++++ b/libbb/hash_md5_sha.c
+@@ -1313,7 +1313,9 @@ unsigned FAST_FUNC sha1_end(sha1_ctx_t *ctx, void *r=
esbuf)
+ 	hash_size =3D 8;
+ 	if (ctx->process_block =3D=3D sha1_process_block64
+ #if ENABLE_SHA1_HWACCEL
++# if defined(__GNUC__) && (defined(__i386__) || defined(__x86_64__))
+ 	 || ctx->process_block =3D=3D sha1_process_block64_shaNI
++# endif
+ #endif
+ 	) {
+ 		hash_size =3D 5;
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-cor=
e/busybox/busybox_1.37.0.bb
index c3131eb453..3aae6eff4d 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -53,6 +53,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV}.=
tar.bz2;name=3Dtarball \
            file://0001-syslogd-fix-wrong-OPT_locallog-flag-detection.patch=
 \
            file://0002-start-stop-daemon-fix-tests.patch \
            file://0003-start-stop-false.patch \
+           file://0001-libbb-fix-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patc=
h \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg"
 SRC_URI:append:x86-64 =3D " file://sha_accel.cfg"

