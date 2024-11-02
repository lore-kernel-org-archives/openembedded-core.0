Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3615E6780C
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 20:39:21 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.45])
 by mx.groups.io with SMTP id smtpd.web11.24570.1730579960258583975
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 13:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=MUhpSEzx;
 spf=pass (domain: axis.com, ip: 40.107.20.45, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGDNKEIqYsfluywQsplVc0y0RmsCEEzq5539Ldoc2oMLAeQh1wKCCf0Zy8mm2pShF7Diz9r7snjZJCHdM8ADel5IebmE/KRcTrEvgQtAWdz40hIdWt/xz6qr201M4Sk6LWIlvcGLc5wrcbYdlkQTgorWgGjTqViJxzYGTAwwAfymkzz7ZBJcKnE3b9iuy53wRXzbeNhYOI4NhsaEoW3Ycqep8PtrciD/A1Od/Uxmhoq1E3sEZVuQpTUasd2SSEszh6Ze6lbrLyxWBZjykouOgjng4p01i1zp/2/GWOYWo0BSKyn6LaN3924nQPkoWCHFfkPybXOkuWusiv0hXQsLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sh+lxIPtXLY5MFacHHRI/EZjefuYchKv1avF9SOr3+c=;
 b=TPR4qSJtIaYFYaoICIj3lsvHNeYpCfyZWXQTWrAlHZcc3mMueZr/hJLVlwGwR1BPbj5jbc5SSkCo3ZV/SpE/ZtaTaTrfFRRBm4D7QzzoDaBXfcQiewgzQSKJYdaSf35VFE+1wkXFo6GPgc2lftAJfYtN22aUhQHpiRMjgBIagAR45q6y8mojZm8zj6F4On9mdNSGKzQ5d0FjTPESPP0cmW8dV8S9j80/impq42JwQNk1VzWNWbI/zdCT5pS7Zl4wenJJrm0kcU4q9S2/s6pko/Jenpp4WP/wvtZ9eQtWtpfo3sE6ClQEt/Fl6cILt0f5qKMEtyjMijk17oSiT0AlIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sh+lxIPtXLY5MFacHHRI/EZjefuYchKv1avF9SOr3+c=;
 b=MUhpSEzxQ/dT3Gdh6pJGYXiVI3S8t+m8u9u2E4iiKGvJ+x7bqhYGVt/JJs6Q6qGGTTnETwCXftblNjOP1rN00+cmTT/SWXe+LL69w60UpFBuLlYSvvILqucWWcYXEm5n31c1+5Kmiwuw9Ik1HNEBKmirKPE96wCmRUqd0WOg2nM=
Received: from AM8P251CA0004.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::9)
 by DBAPR02MB6391.eurprd02.prod.outlook.com (2603:10a6:10:194::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Sat, 2 Nov
 2024 20:39:16 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::fe) by AM8P251CA0004.outlook.office365.com
 (2603:10a6:20b:21b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28 via Frontend
 Transport; Sat, 2 Nov 2024 20:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Sat, 2 Nov 2024 20:39:16 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 2 Nov
 2024 21:39:14 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 2 Nov 2024 21:39:14 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id C278C1EB
	for <openembedded-core@lists.openembedded.org>; Sat,  2 Nov 2024 21:39:14 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 4A2KdECU1267180
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 2 Nov 2024 21:39:14 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 4A2KdEN01267179
	for openembedded-core@lists.openembedded.org; Sat, 2 Nov 2024 21:39:14 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] busybox: Remove CONFIG_SHA1_SMALL and CONFIG_SHA*_HWACCEL from sha*sum.cfg
Date: Sat, 2 Nov 2024 21:39:10 +0100
Message-ID: <20241102203910.1267120-3-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241102203910.1267120-1-pkj@axis.com>
References: <20241102203910.1267120-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79B:EE_|DBAPR02MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 15efce3d-f543-4f92-e024-08dcfb7e6b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qVM7D13f6Z7VN0CxAvkcKMrDWkSBi6ybBHpZ2Iwb9Hy8hHkAJispjgnsvcsc?=
 =?us-ascii?Q?EF0jFwMU6ngdymd8XMgoUjaHIAtMWEMxQFp3+Af+IpoqVMEB5EL6cy54nSUl?=
 =?us-ascii?Q?lDGovthA6KCqTopL/Yum11Nsrtp1pDPWgUqajTT2V8O9SaD0EjFLfTgMZt5o?=
 =?us-ascii?Q?LWsbgjOj+mdHVobk39IwVXXLG7fWDzNUsAsEkQNw+fwnq60oHcuHEr95pHyP?=
 =?us-ascii?Q?n0fJ8gGYL9TY1IztPXKTXjIA15/u65ZnZzmjpCQCI/PWdI/Kq9kq/cerg13g?=
 =?us-ascii?Q?W7GtIJGSfdiLr28y1ujmoOeQpAOEZOnzPokc3U12h1SbCWnaTVWNpsdTASbQ?=
 =?us-ascii?Q?A2Kx/rJp/34X/KlqBzAlpGc7KuqKB4Zz7hfrdpnPlqqlvlZOxJpBK/4x7Mu0?=
 =?us-ascii?Q?cV4R6Eki45e7JiW6SSS7nWr9xU4LmF4QeFHQY/U5VNou2HGyTXrmlmpw0xed?=
 =?us-ascii?Q?4dKIYNLOM5lIyVXIzA17OvsHiOHyglWGCr0l/3OpUutkEotjdpYTjb8Lq1mm?=
 =?us-ascii?Q?CuQ33lLmDVFTaDnhgnIZWkXJpBQCz5cjuJb+KDVbOM0lQiMm6dW8ZfzVSvuq?=
 =?us-ascii?Q?XssIi4NG7Ov2vuoMNpL6UAdAsw5KgMxT5NcV8m6xsiMPSRed1Q92J9ClMNAc?=
 =?us-ascii?Q?dOB++wZpSOmwU3vj3MTUiiNTwhWo3LkpjzUkFdZ2bNK6epzsVwAtAgKxosOS?=
 =?us-ascii?Q?DQgqPWeAYbi733QfK3DtGYzqfWOy3KH9VaOORNOaR8ixbnD4WXNkGjftbFLN?=
 =?us-ascii?Q?kOkQj16be3VO7m0MNLPEUL3UI+gPFlZ8NgxQyydZ+8moM9S9THP/6oNou7zy?=
 =?us-ascii?Q?bTW5prsOgj3gfUFWo6S1Dw3sJKQClzqQQJyJ7JJ+/057C9fVMbm67EqCZifg?=
 =?us-ascii?Q?rrNQn/lK83vBpLbLr67fcSnKwQQBucrraqu99J2r9RDmPodtV1Y5wsxtFk+H?=
 =?us-ascii?Q?lXoVFPAFFJIDI9HO/b8fbm8Jl+VcGHMbWLhPgA8q7uyBY+ljsiXAK2fS1ZXP?=
 =?us-ascii?Q?bWqXqz23e+SdCq8hRTwsbB9lpSCBQSCarBj7PXK+AZZoVT0OXriWn2+ykY/Y?=
 =?us-ascii?Q?rLasQoPkNFCLY62dOmlZgQXZJkM55rxFunds5TaHOZ/mnlIltRD8cF6RLxZK?=
 =?us-ascii?Q?O/PUwr6Sg7mUe792KzZnB/OIIwOzdQc0CSObqmkuAvv4WEWSVLQr9gFRfmbq?=
 =?us-ascii?Q?JkgiGFyKFoJ3CEWW+z+96RZmATK438FNan6Ix9cl6X5QZW95jCBDYAUdDODX?=
 =?us-ascii?Q?z2pfbtYx9hjfVf23VF+VMZ5Id31XmCY/Ifxn8HkXuyCAugtDwek8sqASInJ4?=
 =?us-ascii?Q?l8EAPJrOkQtsFYuvtTiEnObwkuGW4L2nYbEKDToDwAxnVq+oBgagsFUPw+jH?=
 =?us-ascii?Q?DO1NC68lrUCtk6XxSqJxQyayW8dF/rahH/RRHnMShjKFGRDtXw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2024 20:39:16.2180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15efce3d-f543-4f92-e024-08dcfb7e6b31
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6391
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 20:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206654

The options CONFIG_SHA1_SMALL, CONFIG_SHA1_HWACCEL and
CONFIG_SHA256_HWACCEL affect the common implementations of SHA-1 and
SHA-256. These are used regardless of if the sha1sum and/or sha256sum
applets are enabled. Thus it does not make sense to configure them in
the sha*sum.cfg files. Additionally, their values in the .cfg files
match the values in the defconfig file.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/busybox/busybox/sha1sum.cfg   | 2 --
 meta/recipes-core/busybox/busybox/sha256sum.cfg | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/sha1sum.cfg b/meta/recipes-c=
ore/busybox/busybox/sha1sum.cfg
index 01137a2486..20e72d9263 100644
--- a/meta/recipes-core/busybox/busybox/sha1sum.cfg
+++ b/meta/recipes-core/busybox/busybox/sha1sum.cfg
@@ -1,3 +1 @@
 CONFIG_SHA1SUM=3Dy
-CONFIG_SHA1_SMALL=3D3
-CONFIG_SHA1_HWACCEL=3Dy
diff --git a/meta/recipes-core/busybox/busybox/sha256sum.cfg b/meta/recipes=
-core/busybox/busybox/sha256sum.cfg
index a5b0ab22d1..ce652ae4c6 100644
--- a/meta/recipes-core/busybox/busybox/sha256sum.cfg
+++ b/meta/recipes-core/busybox/busybox/sha256sum.cfg
@@ -1,2 +1 @@
 CONFIG_SHA256SUM=3Dy
-CONFIG_SHA256_HWACCEL=3Dy

