Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E72C982CD
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:00:08 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33638.1789627950616963743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 23:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=djnV+31C;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.69, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nx/2YMcrdfB6UUfJ1o5P+jZcvYW9gyU+91w/+pWPCUvVLh9IU7HbDAioFDcsHEG0kfehdPS8KJhwJhHeIxQnBKa/ziFAc86KkI44BTWGZYtfLXa4Cs4/DmOhfyufBNUzPVz03waXZ7/c/mv6NDtdx+rfnq7QS3sySH1W6YEPYopTLHUAunUsuo70bn9R5iIcUnKtv9PmeG6B/cvlgZ2Q52A0okt9nXU3yG5bGCNK3EKsZZIqYeu6m0igTqCJPQ9Llcj2K+8Ki9kjNFV5z0gOdP20vKpZraWyQr7EstMw8sYfFOzga036zNTDrgKWCiyz8Ub7Oe1esXMVu0+A0TQzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jYbjCWoeBCwjD2LzYPW9HDB1Z6fbw1boLFB9ey8feE=;
 b=YTsiVSlPJgdPQu+k6PaLEh5dyV0RHwoHboU5mtLcvi5UKT3ZvxzD5fxBhLlYsyLILjq594Ll0QMrEiNS24DgRmsHGebUaXVoq29FSG/3oh8wFvyluhRKJumDwht0aO31VG4Ghoik+nnkl4GQDu2MLIt5vdpl3IKTN7lTe1U9lsrd16vyx/1mZuO/iAUI5E9FyVQKtTF1fXEY89DrHsoB9GlZMyvsFce97TFL8ldJMuXy+9dYnD2NLZhqpcSQoSFAnPbzSH620D3CsDWXMBegjJ2CDjO7sGivOTwM03Qq8oada66l3DFWsJwqhNpyWeKKsfBgPvooXZnNO3ApLAlwYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jYbjCWoeBCwjD2LzYPW9HDB1Z6fbw1boLFB9ey8feE=;
 b=djnV+31CkYIdUdl1JiQMxdT2br1e3uY5Uhr+q9fCrWW4S7Ly7ScVuyAp3dEo1lQYVe5nRb4JB2o9xDruC/40xbcKhoMTRixk767d33NzyCw3f755lpFc+SJ2MyGmaubbxUvYsfntK1KdP1tRVhGqQTinZQ0meB+r2LY+Xqy7nSfcywUwSkElXzSGBp5qy82LgJ9wCl/7ym/Iah7PxA6XQsZBfbEjlod/dD3EiXQkj7/EJEx4di5Qe4fLDMABQrzdAI2SzmkYiOiX+wVq7i/aRdlnro+UkURw1eHdYLaACtPHdfgG6YPSKKPHy393cRA5k4an0UU8wploVNOD82iKQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::156)
 by PN4P287MB4703.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 06:37:56 +0000
Received: from PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 ([fe80::a44:7591:bce5:fd12]) by PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 ([fe80::a44:7591:bce5:fd12%4]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 06:37:56 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [oe-core][master][PATCH] libgcrypt: Update license for dbg package
Date: Thu, 17 Sep 2026 12:07:47 +0530
Message-ID: <20260917063747.1037155-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN2PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::28) To PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::156)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PPFE40D44641:EE_|PN4P287MB4703:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f243bad-c5f7-4343-bc5c-08df1486354a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|52116014|1800799024|38350700014|10067099003|56012099006|11063799006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: 
	g7f+ZEO1VkaVL9tnh/AHb02VLxvQ0wlfS+IF/lECFVwqmgYeBnjuCrqXSJNnCJkPcc+ouVxDcWT4xdA5zhTDYVCcteKA1rlkosPRwGWrd0RlBdhVa/DRm67oWl1Jv1+lmGGyIzG66my9KqIfUEer3WUTTqpmg5ZdRQUZdEH4jxVEAUwpTtLKDvtB9n6onlf1hVuIRn6hvwjgFrF6SUzQ+bpdw/QFpp4v1QXhB/8zocWC8sAweupor2yEmLNnmua0fbNUdEGxhOow2MnqvIPdYw7bdUqe0ZDJnF9+bUDn4bAs8qxryjL2Egh2n6Yf8dHm1DYIEgkLZchCIWbhMkWSrFabT+uFGNIx2y5iy5xJ3eXYV/hnXvshMEgI7etHlAOOYUPCNHR/xMo0/HcBC3wmib7HfcD26H+CfM1ZxhUMqzN8SRT5toq+wVCil9I7FoynE3kyJLQT5GJ04egC3ykxfBnlAjfGmP2947qhkXTVbf4hZkPM3YJBh2Y7IYaTPBIRU0fSCgWxJkOoLY2p/sCuarhXoUuvJxOOe9H7gpfQ2PZ1OqLUm8Tz95gnTUr4BiOK54uVGBimNpM6XMMso6D90P2kBEqY3bwYnTy8gxiqEVyrAG9eb8sogNxRsjSYUKcIZMUFS3wZcrfDtZCQcNTOIKKTsAAvXr8zsI4bqU42ohyOogmnioUiowQOJDheE3heyI7iHFMuApVMCFjamEYk5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(52116014)(1800799024)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zzevh8V2IGRtBbmpaJdyvcrMy5Rq/Zwn66Oaw9CUM7XBw+/q8TzmUjqpHjIo?=
 =?us-ascii?Q?49V1Ot4iAPW704e9kcCQH7CZPGIFAML03LZoVbEtoWQxqqTEbYApsLLuiHGM?=
 =?us-ascii?Q?1ECJV1bxMI2VwIXBgSb6kyNCtCLOEXuSEQGwOilTtTeKJX5fgEVHKdRkK4ri?=
 =?us-ascii?Q?u9MiFYe1hE4hIbUj1bwHQdcvY+kFytg6xLMP/sd9UFDOHx7M9Qkx2F30NEcM?=
 =?us-ascii?Q?3GJjJVB3G+y/MAJbwbNrwVe3nB+82Q8Qa1Sg2hoPdyph6btRuDUJf506enlW?=
 =?us-ascii?Q?HBkU2X6tDJ+pAGirHV4x8X+VAEXpvXZt0UCt5Unogrq6iACREfMCzdJB5rce?=
 =?us-ascii?Q?NYEBD+KAA0Ee42JoxheVZWe8cgnYXYztdAB9WCEtDOPeBTu2igf8KmWuAGia?=
 =?us-ascii?Q?sT8nKC7bgm/fM/B6wMOZZnZOLHlSGHqiDp7LHUJPKgdGafnU8742Q0VA+Lg9?=
 =?us-ascii?Q?mmHsb+Bn8VYnAB7b10Kbp0wtR2swp8vU80+FicWR+V1SWzIYL+8seRJRRrPo?=
 =?us-ascii?Q?ie/URQZu3OaRBkJiHH6a9b39IHAEZzPMWgqlBni6NvRrQ3ZDvneB1g3r1KQH?=
 =?us-ascii?Q?FFD4yAKkkP0bWMvuXp51x5Y2Q8kKWOyXUbSZR2WzoINu+NsmKDofGbnTwlA1?=
 =?us-ascii?Q?ZcURQsWF4unYHCaNsGR3bTke3Y0DkdUVLr1LEkBC1m1z93PuurXloIy2m5Y9?=
 =?us-ascii?Q?+rgInd9wOOn4r+ef3lYgysKheBMfVV4dAx2qdV1fuEEfSih6M11VN2/FWlT8?=
 =?us-ascii?Q?cpzIASVqTyUa2dqGzE5dgw/v2eSSbwEXg3i7CpsgJcepYdrl6gNq3ot3Kt5w?=
 =?us-ascii?Q?eUTqpPIIsq0XxdA4y9G3Z1TOkEg5YVGDuPpaS/9tmVSjj5MCiAE3fX6qzGt9?=
 =?us-ascii?Q?QtSGznZE28sWGrPhq5UsyLaLGpp4mEmpB7Onsj1NbAgodgoCUZK1F+ifW+1/?=
 =?us-ascii?Q?xXHzX5Su7JaQJPFRVE6kV8fpd5SuIWnIozDVJkGIL+h4qgNmt8LGKOXGun9T?=
 =?us-ascii?Q?C8q1bnEyEf6UtXGrlHRRlrJwOtwj9C8S5+YlvsAh5mtVcGkDiRhIUn1S9RZj?=
 =?us-ascii?Q?XfKo5Wuj08xf1supYmBBcqwrb9m2uNtU/pAwOmka6Gwt/COseTCf1ObhRGXB?=
 =?us-ascii?Q?TgiHMYlQnI7aW1vBOZAMuN0RtIBwa4HfJKPu28lBEW9anld7LBjNxnG+t48N?=
 =?us-ascii?Q?J7D1MGnf3W+MA6/1u/AK2Bx1Et5EzkQMKvQVNfVUcxQKRoETFit5VUg1Z3bL?=
 =?us-ascii?Q?Bvq9u4TVOOhz3P3m6p8zzv1I0mySyKgxTuABMUd5tIl/FxR8kjqrw6k+zRy4?=
 =?us-ascii?Q?PXfhfGBPzQbgZx1S/gbK02TAHwQ1hoGbN5Tjq0OUMIxygL7c2dfbr2W+sxSS?=
 =?us-ascii?Q?c7igzOXime/P0KH8cc99366yHD5C3FwEvINfDKCEYjQap0wzh0/ogIW0liKl?=
 =?us-ascii?Q?7Pb0Mt+cp27qqCZx3OAYrYcjuIpDp1sPLi/w3GUxFTmRIP4vUapoOeU+Io6u?=
 =?us-ascii?Q?mivRP/m0AIGELrIDTK1XrV5y+magf+pKcSHBLbgtedkvxbFJPwU8ZX+3dLRl?=
 =?us-ascii?Q?82xjCzsi8iKNKHzjeTqGIlrL5zp573HyPrhfh8UM6P/+omP62SQd6mrPuQNf?=
 =?us-ascii?Q?s+4nRsX5ZfaGG97yeU6KqAB10l47Sik1k2h5V7OyFMlNAYJwFHDKwsa+Bhk5?=
 =?us-ascii?Q?TxR5t8qxQgVcb3K71UHEXo85z4WrowKZVX9U8Y4UmENeODSrkVfi6GxII4Ye?=
 =?us-ascii?Q?leZ40VyIIZRS8B/5fOg6bUhJCvj4slw=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f243bad-c5f7-4343-bc5c-08df1486354a
X-MS-Exchange-CrossTenant-AuthSource: PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 06:37:56.3187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvXzek1yyrVf3q9XT/yKGaATIjKjBhrcMFYO6LjhB11s8CfdHB9+I1xPc1q5HPfMo1J4XjOTwuOMO6vU/Qqr7z7gpvUhUURaFYTx8ei0RwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4703
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246024

From: Sana Kazi <Kazi.S@bmwtechworks.in>

Set LICENSE for libgcrypt-dbg as "LGPL-2.1-or-later"

Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb b/meta/reci=
pes-support/libgcrypt/libgcrypt_1.12.3.bb
index af5f00dbfa..500033a587 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
@@ -59,6 +59,7 @@ SECTION =3D "libs"
 LICENSE =3D "BSD-3-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-later"
 LICENSE:${PN} =3D "BSD-3-Clause AND LGPL-2.1-or-later"
 LICENSE:${PN}-dev =3D "GPL-2.0-or-later AND LGPL-2.1-or-later"
+LICENSE:${PN}-dbg =3D "LGPL-2.1-or-later"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D570a9b3749dd0463a1778803b12a6dc=
e \
                     file://COPYING.LIB;md5=3D4bf661c1e3793e55c8d1051bc5e0a=
e21 \
--=20
2.43.0


