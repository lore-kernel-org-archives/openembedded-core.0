Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35879C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:14:01 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.58])
 by mx.groups.io with SMTP id smtpd.web09.9592.1633601638149770076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=Ml6u5cMp;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.58,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPhvTxw7dbm6+SgiFgcgOg4YeoA5RSVolYPH4e0xaMLKpmwXZJ88DlTypD4KUhjQhA1QEs8u8XAgCRYhIxL1SFxjkg8KLu1lQn/Jn//Qorfp+RkaNaWA3OpNIAAMB7fm6hmra1mQzGl1LBWDwamsDh5M7AQofFOz5q0OnU43EgV8R/tbLTWaoNa0aNpirJAqGsMPjMF4SP8+3/ADm5Fydc03q+5Xp5UvEjtTr/lynh8MvcSzFMyQN1i+Smueee50pYxW+gWFy6yaUrCyvJ29cHU1N/G8g3wR1Tjf5AlrriaTkigP88qrl+xARy2M9iDpUDAAMkI77xPGm4L0VPUMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVxCC/t4OXgMnu2+HSzF1rmIvQJvhASn+jUy8MDgef8=;
 b=BatPieRuDNiaEpLG9CL3OOZrdLEgIlyUPhJTrpE0BwYqpATjJLkNc7E58EXS8RjJN0s/mPYfMljbNFv9ovysdd3djfg1xKmmos7dRTw3hJ0A3aiPxN5hD45/muMr2YxSKOdFpq6F4R0nmXzN7UFATY/adp+xru+USUkl+PW0MIFwSSXukt2QYO3d68G98KnSUKvqwiqEIkooPF1BHI2dTpbK5C42wZwSIypr0e1GiNC7Rbthx2hf9KPDEvozdosSNAuMDH/TjibOvE2qu6BMXNqOg6gVo7NQCbCRjMGAmS1kcj1SY13zC/qc46VD1EayEcp0akoFhPIik7qABEP3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVxCC/t4OXgMnu2+HSzF1rmIvQJvhASn+jUy8MDgef8=;
 b=Ml6u5cMpUtiA12plz806/7dTz0jz7qvLOsGgY70HKuFR9zwd1VxLQztM1e/Ty77Vw/k88zk5jsiNHAicfZeq2ro5Qv/WPXbysnCNK3ABbnZ7wxgMtM/8rnaiCZFM+v5jB07jhwH+Ex+AGD834f0YTzx/ui4i3bxkrKmYWx7PPgY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4649.eurprd08.prod.outlook.com (2603:10a6:101:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 10:13:51 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 10:13:51 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 10/12] npm: Add variable NPM_NODEDIR with default value
Date: Thu,  7 Oct 2021 12:13:24 +0200
Message-ID: 
 <20211007101326.11075-10-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::12) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.103.254) by
 AS9PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:20b:464::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 10:13:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76285912-2814-4984-7bc9-08d9897b294f
X-MS-TrafficTypeDiagnostic: PR2PR08MB4649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB46491A14B3B3EA8EE901A452D7B19@PR2PR08MB4649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s4uoKipuVQS0YC+Ab6SZumh+TeebOadkvtBWAuH1tS/f4B8jF9tK4NyPkoR5fxzaIs74LkeJIKvUi5W63aqK5KiKGTrw0dAo29c6qv5jnxEDxqMaLzoJtLEiITdYvwykKbbQHnnvuFI0f0/LgVFgVRpwyERzB7SRF7t0S0K3vBmbJjVS+HTaC3Aw+/7Bn6CY/5HRK1Mhv8Gp4wdtGJGEpEYs8Wn4iLm8Bfy4zJ7jbkozsXXTne9M68W47Z6xicFmgERkE1CW/8tuOOUKBCY+GrBHLYLl2/zXywWUHuuRccrwqslrpV1rrwJEmd+LbPV+b9mxOlfB4J+7xi+UWYcOzveBMvkXVokktCrD/Gwv/Xz5HAh8BtBT8b/1MyZEDPUVJE2t4Z5PY7BaJfgB8Bmx3tucp3pUbKo0l96zmDrW4Ry5zzLy1U5c/HQNTb+0gwL0nT8wFc64LRu8jpKmkz8qnQZwrdMQ3lolhRPaNQU9m+mUaodfTIJyyW+UrzK05LoDteC8TzIoI/kehyNupJNz+Et/iRO5Zta4KHQhzTLgoBnpsl6FEXRyKgzvXNfuVAZM+Zmp3XA3ume+ftDyYcZwSJzA/dhttOf/6jKUdSonqVsVl+3VPeB0uQQ9UMNy16TUu5SZVC90DiKp2lcASxyuAA+xLcQDPBpa2kz35VH9EEAtp1PcSXdNeLWqZxVek2NF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(86362001)(6916009)(8936002)(66556008)(508600001)(5660300002)(6486002)(1076003)(52116002)(6666004)(7696005)(2616005)(4326008)(956004)(66476007)(2906002)(186003)(66946007)(8676002)(83380400001)(107886003)(36756003)(38100700002)(38350700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kwIXI1Rn7BxMqhJ9h8cbtSd+cZ5OGEyoCV/su/xW17/KLSzzrDn9qcmM+z8X?=
 =?us-ascii?Q?8cXDPiySvZd62nw+meluDl13vtzOGviaTnUPTmnJvWYcIyrCqdvpm3S3TLyT?=
 =?us-ascii?Q?TgODr4V6Dj4wL0Lc9tH44mW40wxYq+y2BXPYNoDhyQlDMWYakTHmVUrh/P6S?=
 =?us-ascii?Q?rvQ8MbL7ezhf9Z6bylXvVowAb2HD0LexjmRrJge1eW+yRVhOXbe7RRaNDjjn?=
 =?us-ascii?Q?79VM8N+RpuaYzWG/gu0YTLSSpR9MD1tkhD/aZPH2CHqTJjnr7JxARc8Bu11+?=
 =?us-ascii?Q?EenEQPOwHft/Dn3HlwEjdkPykT7tACUNsb+XlNcP9DxnPTi9rXUnsIjKWAo0?=
 =?us-ascii?Q?rSadkEWFs0zkl7ReUfMiI+2ZYB4ZjnSKmhCl4K2pLAHxYaouVboF0n+4qr15?=
 =?us-ascii?Q?+DJMhDtpeob8yLaZGC0lUds81xOConK0VJZQR7E0JOM8w4l4MgfnEyrmQt1Y?=
 =?us-ascii?Q?tY03mel5edmiXjo1VP476AepP5BPhnb/Y5bUAPn98FrAS2EI53Vzosnyd7kM?=
 =?us-ascii?Q?9Kmg06YhqdPpnpQMmV4GQV8ouh4ko/LPTrLyUyCzLWfyVTRIOBSi9d47Y4iK?=
 =?us-ascii?Q?D07Gaxj9fFXrt3LWscjB0JjaBWgawrszggN2HODpKgCnobO+Tqvsay0PnsMV?=
 =?us-ascii?Q?GFm+kvb4SQ7xigQlJ7/A4v7Pl/D33VW1eicj65P4ec/4g3rzVugrz94kqZBG?=
 =?us-ascii?Q?/MZngqfzQ8NuAeWGyPHB/ZHEnKcaJopstoj8Yc6H6J5CZjd5XwDNAF7SCXs7?=
 =?us-ascii?Q?jSrPndsWBn5xCw6Vc3j4dgyB5rCNI1vnagAMLc3Gwdsy1GrHqTpzt7yinbvJ?=
 =?us-ascii?Q?GjAe7qZAr88hxBVpm7NXoLqTU3LFe2nrC6LBfVeZtW5fhsHWavYqIav1hnlz?=
 =?us-ascii?Q?x8NaiykOoiKC9HYtdTAAP7gHfT2IPNQM8bUv2hnLsqzRhDWn3fhSw7hdoPAW?=
 =?us-ascii?Q?AzAUvHnvpT01JOo9Gs4zQf1c+/RmwQcVkLWqDhyEai4Of+iDmuE1YUNHm5sT?=
 =?us-ascii?Q?Q2qR+KOG97yMXwRj46BFeX6IlbruVFEHwnoRxhI0AgztqG0cQAS0f/ktMSA4?=
 =?us-ascii?Q?qZGQDukU3V1tobI1mwvy3vGRdDYWDypzUiK2OT2LmiQxWHzwZCswuufXsRbK?=
 =?us-ascii?Q?Yif4gjkw63w+eA955prEO2uPNRS5iqel2doP2rBaV4xU/O1usVut8E71Nfw/?=
 =?us-ascii?Q?7btBSQkCn3F3D/x5PniVP9ZNZpMLqMXKaP4t/TowNzIEQZN+uZ710vVD8kw6?=
 =?us-ascii?Q?y4NQRHEuIz2YfZgDPVJ0H1U3cIEU1aI4iQDywm+zZWkr3tbnhTQRWsRVXn3P?=
 =?us-ascii?Q?JyUQDc4YGiRqn4dBEQw41QNy?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 76285912-2814-4984-7bc9-08d9897b294f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:13:51.8007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 loVWHYFoBtP+VRW5rfC56m8H9MU+QyHh+XgkAebLSAAEHJ6rzUbcSZRgsjwRfDeSdLzxMaqPHoYaCquHhKzN3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:14:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156718

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Replace the variable NPM_NODEDIR fallback to a default value inside the
code with a variable NPM_NODEDIR with default value.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/npm.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 477b40d921..05bb9f578d 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -26,6 +26,8 @@ EXTRA_OENPM =3D ""
=20
 NPM_INSTALL_DEV ?=3D "0"
=20
+NPM_NODEDIR ?=3D "${RECIPE_SYSROOT_NATIVE}${prefix_native}"
+
 def npm_target_arch_map(target_arch):
     """Maps arch names to npm arch names"""
     import re
@@ -249,11 +251,7 @@ python npm_do_compile() {
         # Add node-gyp configuration
         configs.append(("arch", d.getVar("NPM_ARCH")))
         configs.append(("release", "true"))
-        nodedir =3D d.getVar("NPM_NODEDIR")
-        if not nodedir:
-            sysroot =3D d.getVar("RECIPE_SYSROOT_NATIVE")
-            nodedir =3D os.path.join(sysroot, d.getVar("prefix_native").st=
rip("/"))
-        configs.append(("nodedir", nodedir))
+        configs.append(("nodedir", d.getVar("NPM_NODEDIR")))
         configs.append(("python", d.getVar("PYTHON")))
=20
         # Add node-pre-gyp configuration
--=20
2.20.1


