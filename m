Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1337D2C55F
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 14:27:15 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.130])
 by mx.groups.io with SMTP id smtpd.web10.19656.1729607229379722801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 07:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=AthkpWFT;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.105.130, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lm/xF69Co467pU+St26CUKgrZmPObM69POAvUZFWyQkhK1NA612CXNt6c/oKmvGrunqJNkZnzawKFBvqPZlKDMVJ4o7VnbuEBpxqe1F32odub5N/vn7uVxTN2wN8UhdXNJ6IXI/6dY4vMD2mHhvxaXW+1gbok01VxAAwUoghLnwGeBREYHz8KpRElxCAMWWTMDQDhxMTKJ/CVc8FK4rlOeDfn8PuPRFxJOn8ZhPMTvZ0pgnKbgqDCmAdzj9vtLs5UQVYex03pkrqvBA77owofIL+FBYbe664TrwzC6kvPDm+dus8VjpEYoDNjHmLE3ywSUkYAjJX4Q6bQ9lPDPSQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dj3bOcRIcwgD19YrDA9wSGGZXfMeCirqDdcNT1IjlB4=;
 b=vlKGCFqfv0HJ5tWHc9XGoazpytrxCncEYBxDW8PNyRi1AhKcjPDRDLxX5YbIDiaGwgsFQZC0OYdNHVqSPzHzVKihTQJHhCvAqPGckJhRGgGNmx8jw1qaWRWQ/iPIScFhAtuXhyYaUh8b8ZmrP/5zSBNxfzHdnizCUMDmacXNje5Fkoc0DmgLLtdPfNjYxNYSSIJK43iTzlWD/YQ+/zKE8xjYl+gTNzz9cltN/acqT7xDvBQZNaeq+/dNyVpFt3lBlOlTLxRXWj15sFS1urAUDosNM15KpE22lhv8jLdtfavIrUuqzAIZdsnYH62D2ai0FYDoVZMSeSGxuPKJ/Vp/Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dj3bOcRIcwgD19YrDA9wSGGZXfMeCirqDdcNT1IjlB4=;
 b=AthkpWFTzgfV4VYElAQg+7Lks4N5acPFG8mHZAOt2kOpIqgR9+Xr7B0EFfclW7EEPml3bHBWScjHZztSMkJ5YIeCb+ddsqqS2kdXDU/lUXz61amLGKvLATAm7CFQRdzcLCLtHXt4+t5FMm1FONMe32kneyLu9TWmqFh0HwUvT0nFZVmwth8yh+UnJ7EkPBa74OmT82GU4S3SO4QZJsU6NzlqTEgGY+0JPYqFKppNZNF8UKhIMK2vs61Zbv6/M1//Ql02NC61DdwB6bE18MWsi9citU8FTEhE5DCoYEImfo8mCPJDF7dMxKRnwxBYmDEXtd4Ll3+oEvCZxPJnYtCqXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9130.eurprd06.prod.outlook.com (2603:10a6:102:467::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 14:27:05 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 14:27:05 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] sqlite3: upgrade 3.45.1 -> 3.45.3
Date: Tue, 22 Oct 2024 14:26:43 +0000
Message-ID: <20241022142643.1601978-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BAD.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:7) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: d39b932c-cba0-4f7f-7111-08dcf2a59a3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5xvQeRK2BiWPsWVkL/dN0k0O0kx8fZT7AboWb9J25qyLVzl9gTROUTJzhday?=
 =?us-ascii?Q?aVMzXiLlpBT5q6lgw6S70mKuNv3CndYtn9GxkI+Uvz6lAiAs1MgrPzwXAoss?=
 =?us-ascii?Q?GF6zX1DcmyqT/GelLVpbCdCoYJYA15NuxYFIwrv3G7j045O9RXr4f2iUjkXK?=
 =?us-ascii?Q?KMRtsnN7/7RN56wxsCJP6VAwXlABSh1xR3ruYQClH0bCJswSJAULDqAHVg2X?=
 =?us-ascii?Q?t3/ZZiu82Wqge89K6eQMjSiOOBSza1FuTvkQDxy0uWL7rk+Jk1dpPOMr60xR?=
 =?us-ascii?Q?WMNGP65LrwEN1Abah8OyACFVUDp9v3ZYb/y1t6RVoFQqKupfXuH+bp6WDblg?=
 =?us-ascii?Q?kSSM4vlT3QvfjDmbbHvp8WDQ1NFiDC+MbwdW0bTOYQdmuZeZL4ibnPJUr30S?=
 =?us-ascii?Q?pjCZD4M1uv9hVkdF/ebdCfJoidqm5p1J/6RxOwy1ZzTnS0Yamb092N9bT+nJ?=
 =?us-ascii?Q?mDPznNnTH8xIlouXEayxnqpYpWJyGxNIUIDs0IHT3AImYA4gPblFB4eEWXiN?=
 =?us-ascii?Q?1pf2fNGsIk2c+mXN1FG3sqYrCveL2lcAjNmgHQH22NkvDpJkR+OAUK6V2sEl?=
 =?us-ascii?Q?yRg1LB1n4YFGy4c46VDY3eU1flPjO+uCMILKs9OpL7YYi79IcDlNumMzQPGb?=
 =?us-ascii?Q?MqoICIIkoVdhQIZmWwJMxLO2Uh5v7VyQwDF2hSYnrCVkruyugbpSjWTx4Nnv?=
 =?us-ascii?Q?LFgtxCwpG4dG5xYh5myEDy739Ao0FCdXYUYonQX+Q/IVuLPLrHqp1UWO8iOd?=
 =?us-ascii?Q?Me97Z7JGgvbev2V6p39Jujz4qaW1ennNUfN/8KIP2Pb4cuCwuVGJd4OwtS9d?=
 =?us-ascii?Q?zW54R2OFFTrsI/TQ15HQJXQFc9PcDog0BRX6549+Nc9SwMAnTeQPs8g0cst4?=
 =?us-ascii?Q?261B0iCGizE0ct78KowZqVEIdOhODaCzore5HsJCNG3PBi8vHAdWf8CZMtzg?=
 =?us-ascii?Q?6w/z086tWf54mY9xIxHKjNXQ6USaBfRnBmvVSIbH5Pz4LGrABBdQs3wF0bg9?=
 =?us-ascii?Q?/YRv/aK0FGFPQJYbkLd8/qwrjbtHDq08Zrie++pIotzs+7EV9AvFZJi9PWKN?=
 =?us-ascii?Q?2M/7iMILc/j380IkzRLNzpETTleyYLsn145YCBe1uDsIG+/pO84omTsUbmzB?=
 =?us-ascii?Q?P4a+JsrcaCMPClv6kKQP/p0S0q43Xw11OKn5MTqYM4KVsjJf4RYDGE5hweIx?=
 =?us-ascii?Q?gJnLwjNOixyVBciQ46a0Y+of9xPBC+kmDS7JdHUN6yMPuxGvN9KASjLQwM/D?=
 =?us-ascii?Q?7d9i3Do104Olu+QT7Ytx0ivVeFw7s/inbLKAT7INgXDTiSUtPM3lcwoJAjV6?=
 =?us-ascii?Q?DfFuI2U6MIxM9kp3O0KNuxUQpY3E+5vg05pmlfyJZcqQX29ldX0zclRNGhLN?=
 =?us-ascii?Q?ilcv7xf5PuWtd1W2DX8daYBLi4Ok?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dWLiuIM8eu0vH41z7D9x1DjNovhXYd3xt5XeS4YZiQQ/UEYOKeHzjWNvd0JI?=
 =?us-ascii?Q?dgGhgRAgEbHtLun5Rx6aWdUHuUKuhpwm91OAudbDVG/t1mDWyhqS4MrpMKLW?=
 =?us-ascii?Q?Q5mN3eAQQykkiv3blhkXWycTstllv/8HS3xN9tDeThZo6ipeLyRrXQDcg68+?=
 =?us-ascii?Q?oP7qYSlBl7tKbWgDVdRLN9p6mFs0kt+0QvfMZTinFa+T5Zd5f31Eu/mQDy1L?=
 =?us-ascii?Q?+mgnNeAkI/YflrZZc/xuVT9rnGR0LIsohHD0zh/4gjH+kfazXNfJAM8R2RtV?=
 =?us-ascii?Q?xert4+DlltIHvdtwCu7PiFXNZPT5uKifmuy6Ihz0jP+x3u53Rn5EZEimX8tZ?=
 =?us-ascii?Q?INwEZnXuJSNlPjJgnZ/MH6Omhwi2ZUXnB2wY0NO6HuyQQ/ZG3Nb/yM+Jgyzg?=
 =?us-ascii?Q?4ENvh53d2K64gyt58jFu4T0qMAxf3spHG6SrsIie36KVhgm9MWxC+VCP6VOF?=
 =?us-ascii?Q?xisFAHLrO2PgRuBxBFMWVIhIA+gXv8BsYdQbhjPUDzLPsaUh5lZVmw7YmYkr?=
 =?us-ascii?Q?9IeN3FByM0IqrhN5GUezaruPbRQmhxTtO/y6WrKm2hB8m7p0TX27/2xzhkBC?=
 =?us-ascii?Q?enhH5+CcRqyaH8vQQFxV/Frns5h/r9wrGHTLg1UuYXTADOkwLGCSqSqPpwII?=
 =?us-ascii?Q?Gk8oZCLK2lJXxqQmkIdz8YLmSuHamW++EAL1SMD54cwB7oveFWNieJkrYgZN?=
 =?us-ascii?Q?heVpBh+ZOq2WeUITHUQUyKsAIIEPrAM9X+BWvmAYd2c9Gh1PV0IyQNjdDKld?=
 =?us-ascii?Q?BiMzN0S7QVeCmhpu/CixzYXF3NCWN5PYDFFv0RDwwjWFqD4ws/AJoCx3p/Qt?=
 =?us-ascii?Q?jZhxWpYsOi2pb4nsA29ZgcdQFf/RFpWS/FTUlNj0IipXRoOfB3u391i9RPh8?=
 =?us-ascii?Q?ahZtgvopBJ8BvXucepggLmQMWgTTnKdljd+IVSAjtQmvZ9MBiqv5uQdoZXRy?=
 =?us-ascii?Q?gXUsvUcUenEiBwOiDvmuSUzNa8Qa2QaXL/k9KimeC4Vq418EhtFdvk4XU8zV?=
 =?us-ascii?Q?jcTmKTxlszUWHq3TiRw1k1bfFmlENaxRvShwgDs9pKBXRLyoYmn/tiC0y5Dv?=
 =?us-ascii?Q?KpZfLLTwn55jEpFoutYwW1PL05y/QunwgoAxrg5A0uTflmwGN/7aii4pA+GY?=
 =?us-ascii?Q?+LxLX23mnTgVX/fyEWW0AN+ENRXqzm81PYx3QaeHn3hAOF9vpVmCmbOS1Y1D?=
 =?us-ascii?Q?hvOQRHMpr7SDi8fccTv+Np+o484idTkgOwJrvv85/PGuPhOkeOoTrMgtfVAN?=
 =?us-ascii?Q?F3q2jFcflzfPfW4Fx+0BAp3j3+n+EZiVwIVKoZbh1UsoLWqHezD0jhAwEpOc?=
 =?us-ascii?Q?+w1sqxcROFvZLfyKC8aezojhXGvaHtBbrjcqOfubDsE5A9RNnSj9YSNSnNeN?=
 =?us-ascii?Q?cJUkCu+4LDKiNA8E+/TU+O5lZr51IXzfzpil8nHa9INH/SQiS0QYg4UibKKL?=
 =?us-ascii?Q?fXLoxH2oYA1IcK87RZFidWe16cNpq7sj0KmOtoRj5YmGZJWL2G6oHF1sEyF/?=
 =?us-ascii?Q?oigniJLZRxoBCqFKi3LNA2f0c3L1pO3GVmt2dYTLhaZCwiOXeEWJnDNj6lRj?=
 =?us-ascii?Q?+r+GcyUIZOBYfe9Oai6Ca2zNMPQOOQ2TSzQ5VlVfKfTKh05V4pIJlEs92K1A?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d39b932c-cba0-4f7f-7111-08dcf2a59a3c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 14:27:05.2273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUqxXQfKhxySnejwSAykqyMKF1ApH4aHUIYRRbTyTe9a91WW+R2cJ1rCNr4+cIUIcSJqwIEyGXmYwVsqE6yh5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 14:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206154

From: Anuj Mittal <anuj.mittal@intel.com>

(From OE-Core rev: a5c24e05e8397e2e353d2d27d9da98375f6ec036)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sqlite/{sqlite3_3.45.1.bb =3D> sqlite3_3.45.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.45.1.bb =3D> sqlite3_3.45.3.=
bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.1.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.45.3.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.45.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 50612feb25..03d70bbd38 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -4,5 +4,5 @@ LICENSE =3D "PD"
 LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff03f=
4fd9e4a77ed00c66"
=20
 SRC_URI =3D "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.g=
z"
-SRC_URI[sha256sum] =3D "cd9c27841b7a5932c9897651e20b86c701dd740556989b01ca=
596fcfa3d49a0a"
+SRC_URI[sha256sum] =3D "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270=
a5ee9a38191531"
=20
--=20
2.39.2


