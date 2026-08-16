Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DAEC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 16:26:27 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12743.1786897581017369743
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 09:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mt7vT/9R;
 spf=pass (domain: est.tech, ip: 40.107.162.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEc8/nKuBT1BYXhjPOaTA2aa0Tg7Onun7fdtwXiHRZw8wKr5df+TaV73LfYtM6JifHoDJWuGJDWnBxHTFeUS38YiVbVX7/JXZVNDnbNfq8NIiHfPwAfhsZ+JZ4ZQw/2Hur15iAbC5xRJ960pGjvmbtYPue4GsZCq5V+Z9q9Qmf7wTK2ngEFflpcwWesdCRS+QgIjELGqarX4to1XwcvTjKk2qNsNhT4vGpsikHpS1n95b9bg0rRZFaUkEFSMjpeZvmJCGYEO9q+uaz60NiU6fsfLUaqLu4Jhuw5NgvMhu0BgRWu10TJ2HEKwgiU7dohT7muioUtHyqRQnZjFmIo+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwrcTOuN//5qoQWTtNO4Jn1HILiJ4krKDZGKV5QEqP8=;
 b=c5bmC0Q+oPpn0f2GEO1L+5s2QTZKWfqZU4Z38CKKdTr+676kZnkZDzYGAunxLZ+iowedJxTlwMLJn2X3HX2/xAcey0v94Uwm/Dgv8GmQLlKf4FTglTB6khsTb9LNBvu/CtUWB7rQnqeufWOMIMmy0iylaUylGv4CjI05Ur8X4l/ZaFmywkTua2QugAECs/LwOJdvLH13w/q0K2L/X1Jf/3k4F1h2tXw+Rjp2bLmC8QSryGmKhyHy55yUMRpgBAKs+c80elGirNRymshZ9rUYtzIXMfFf0iRxMBLoJ9XKZK9FlZv2kTeWlp0ShcTKobKxgHi4KLorRsyVulbqCyk8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwrcTOuN//5qoQWTtNO4Jn1HILiJ4krKDZGKV5QEqP8=;
 b=mt7vT/9Rk6tIBoVW4jV7JndAY+Cu/HiIC4nW0mUXGO3jzHJtaFd82GxOMMB7LzxSqOyVlArSPRnZ+m4PtsGpbnHEiLHjYYOXNNQVek1s/F5OZs22xR5lkXr1f+O0SlPreNlCHdd9R/1rA/3DD39mvvXKmbRCvpj9D2Q9/QgF0poa9uRVFe/a9MwAFhf92eoFWjVA8CSyjsHfa3kkyTm4wDMSCD7U6x1t9A7e7Z4SEWOEV768RLXpV3EmFWdonvCaLc+U/r1rRwJ2FG3esR2fs1fSvVT/ptBaQ5Knwj4oF+VP0qiZT5OZVYc36fEPF32+cAnU9TzIO2rpI33dPIBMXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GVXP189MB2751.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sun, 16 Aug
 2026 16:26:14 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Sun, 16 Aug 2026
 16:26:14 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 0/2] boost: upgrade 1.91.0 -> 1.92.0
Date: Sun, 16 Aug 2026 18:26:09 +0200
Message-ID: <20260816162611.41933-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GVXP189MB2751:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8ee919-8e59-4a19-e4bf-08defbb31729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|10067099003|56012099006|3023799007|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	g7RwAkAA0LuXRUMM4PRjNXKkfnm/PN7Im2GwMzqd7Jbp3kvbS4gshpgr/IAGjbXKHn1ZQCLNirQYvEbAd9RX7bVbBqOXWhghqaa3fgeyk6R00g+UkuKkaq7vPRjeLBOu/EoSMEBqETwH0bm+DGUL7le4qCwH2JoCQKiF+Te1s4gCfnfusSRi0o8DI5UYSj6B8Z9VYr0JBhK/6jPuNnJFBxLzxmRmrrxKE3vqs4KK8+auVCswbKkuoph1o0zQHfd5L1h/6OcvGM6IxQizJUM/HFDB/acjWDXfw4lNlU9T7Sb/SHgZryTDihxYBL+vSTUyDOXa7RJZL2MsoHcPizHwChJkCQA7oHHW7ntbM8Ig37duxttFKigHrNkLt8gn1KDCPFvMsDz3C0doyNFfsPehpH/n8V/wl+Jyu2jhvWZHHlflzvJOBII0cQu86ves2zwyhv8Kw7qFubVRq0p/o/OYbws6kjWF22+yxPLXIEK5qG0f0SKE4tbiwaFMRG8LTT94LTUlkrdY4SMaczADyTVfUUaTIahKp1xdyUkzjV2JJEuO+egHMdpL9LoTXj+8ldHMKoynfnPei9OEEV9c+lsVlc2vLYn5hGzRsV+ZL9aJ0UStGLgBH1Nuv4odIWu0SER45i/AsYHF0WdUAFKWUazzkFtp61s+xotgZklaEFxmE24=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(3023799007)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l550Mex4kc9OSa7DbQ0qwl3J0yvrdvJ1VFSw6nIGaVgavD2GITE+4KhLqrJ7?=
 =?us-ascii?Q?Y9rIWXLCrVdDGzz7BRlvQQ/0jPGVPzfjmOXBJ95fHacMt7CY6qYtuQiom71u?=
 =?us-ascii?Q?1sOIN9C9R6g4jZEIWmR+AztiAIXYUpEy+d362rQf0KIGjNXfYuRCbg0zIQFR?=
 =?us-ascii?Q?1Cn+urNA2evP6A9XGcLL0bPW72TRtUT8PxP8ZBFmp2j6z6NGxdD/OD025y2J?=
 =?us-ascii?Q?vUgX2qqVQ3cF0Xw6CVGGaZAt8TadZEwuP2254LT6Cz6yFgYno0VV+0Em5Xdb?=
 =?us-ascii?Q?6kpjLWg2jYDtJFBnax6gehSAh+esyxoBQLzRv/jky73B9djXUHmb6lhZp6Yt?=
 =?us-ascii?Q?Lfxx7ID8DVcSCTVMZvDaCkR+GUsTQfsq2Al+kbCUJ5gwFbuCXhBemH6o747c?=
 =?us-ascii?Q?eItRQH5ZPeF997Ujdz6xrj5hFTVUWdevIJWRIgmW15jzOnxlnP6wdqnLy9w3?=
 =?us-ascii?Q?hXGuQFXkA5x38zUY/ouw19/mNNQE5/khwMx3IzD4CknOQBFet+NEnMe3TD1I?=
 =?us-ascii?Q?eM3ZO/0Ks4mqsBcJS17sr006HHAbePt8qAs2lEtH6q6XzggcrLviwLypqPss?=
 =?us-ascii?Q?/Fsz+9JnuDOKyM/r9x9M4KTbILPIFCIa4Skz+Wi0wh0Nxr4XCP+1YtIlrMZz?=
 =?us-ascii?Q?3uCneTdw+1PPPZGDzob7NLyLTdKaGpVERxcHiJu7f2ymrr6p/FJ8Sd+g21z1?=
 =?us-ascii?Q?9cyh9UybXSxKWdhDoK5VSg2R7dsYStJQsM+LO5RZk18EF/IflzTBQZRI5I2l?=
 =?us-ascii?Q?UjQzLCx4oT/Krt6VPI3LRwSwlEWqYWViosscrbPurDkAffFKB43xKv3Pe2hc?=
 =?us-ascii?Q?VFARv7LnYTaUYdc1H0JsKyw9g2+cNGgasc5uw6JiWOzV6EM/IO8QpN4eXzEr?=
 =?us-ascii?Q?Dsa+HvYAKaP8omSOm12ggE4XuE7+OJEo3sSrVtc9RCgU3NyJXmOVuHCnHDOz?=
 =?us-ascii?Q?Bm2KybBVMw5qQ5A7g3uHkDB0Gbam2/kdI5Fmilxdx/tPj+sbTIuGJZf/IMBF?=
 =?us-ascii?Q?e+iOM8+sf5RbvVtVNuahe+6Wfrs5E86EVz3+vX5ruTbVoeJ1+OrprKkuKzDj?=
 =?us-ascii?Q?snqCvLH3rDQDwNE8qqJhIi3mmMmxs/BviW8ty7Wr96ElUQsGvMEtE7n/q5XF?=
 =?us-ascii?Q?11RtrsrMCiTuUuJ1htM4kk/pe918cTMPBI6fWO9HGfkrOPZJmTED3UH20j1f?=
 =?us-ascii?Q?MLDQN3PgjPvAfYKqcQ2qzUymrgNFRIRF3JDxOWcQPav2Rfqj8WMgomB37usy?=
 =?us-ascii?Q?p/c5FQJ/IR88nYeZl/A6T3axrqtV5hKK5IPG7dhOdKSjlDu5AnLiVTVwvgb6?=
 =?us-ascii?Q?DG6CBrcqqQ+MU2ll7oIB6X/4TC2aSbPltf6rm1IGA5MS8csqPoOwWg5BvLoD?=
 =?us-ascii?Q?RbVwwi0AjoSsFM1dt66/d1FHuS7mBAw6QsBZha1FOnIza5XKMhKxZCxMe1mm?=
 =?us-ascii?Q?VMdXzQnt3xBkv/nciiRkePeMa+vTYwqdSacMCflSQIvfRgxTIq9Lse58jhGq?=
 =?us-ascii?Q?2RgNmu+wh+KIm5v4h73Kc5lpliiEnQhhdUljUmO0GnrVqRSF57fqsfCmRHMp?=
 =?us-ascii?Q?wBsr0tLyQrEYWrp94q4eOKdZebtzuEHRcIL28y15DX22UbneXdldvF8T2AOx?=
 =?us-ascii?Q?ApbPvpVWhj/NPzfxT91usrsBBZ3GEMZJVDq/MJiRNjfqMqrWaNLj+IxaE990?=
 =?us-ascii?Q?d+sZBY2W91wVwUzaoPSM50ivXUwKv2wzAnl+WHX16holDjN6BvVZx+ZV35fB?=
 =?us-ascii?Q?0ZPS6XP8JiECwl+J0Sd9ZuoMi0a+X5qCq+rCweFsctANCMImqH2maxS1Jv6F?=
X-MS-Exchange-AntiSpam-MessageData-1: BvcSTVAtKUSWifRNtaDFv1vfr3Ly6hPUTVg=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8ee919-8e59-4a19-e4bf-08defbb31729
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 16:26:14.0746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHGekvYTknQeG4nTXuzovfBdkMbDay9z1kPnTsVVP2+TaA6ZG7KaJ4hq3aSQD863SKr9p8kHffd9jy45GXE/TGFxJJI5AYDeV/suBzBZAjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2751
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243536

Upgrade boost and boost-build-native to 1.92.0.

Includes a backport for boost.histogram build failure and a fix
for boost.predef installing unneeded b2 tooling.

Jaipaul Cheernam (2):
  boost-build-native: upgrade 1.91.0 -> 1.92.0
  boost: upgrade 1.91.0 -> 1.92.0

 .../{boost-1.91.0.inc =3D> boost-1.92.0.inc}    |  2 +-
 ...1.91.0.bb =3D> boost-build-native_1.92.0.bb} |  2 +-
 meta/recipes-support/boost/boost.inc          |  4 +
 ...h-instruction-set-flags-we-do-that-o.patch |  4 +-
 ...01-dont-setup-compiler-flags-m32-m64.patch |  4 +-
 ...b2-project-requirements-out-of-build.patch | 85 +++++++++++++++++++
 .../boost-math-disable-pch-for-gcc.patch      |  2 +-
 .../{boost_1.91.0.bb =3D> boost_1.92.0.bb}      |  1 +
 8 files changed, 97 insertions(+), 7 deletions(-)
 rename meta/recipes-support/boost/{boost-1.91.0.inc =3D> boost-1.92.0.inc}=
 (90%)
 rename meta/recipes-support/boost/{boost-build-native_1.91.0.bb =3D> boost=
-build-native_1.92.0.bb} (92%)
 create mode 100644 meta/recipes-support/boost/boost/0001-histogram-move-b2=
-project-requirements-out-of-build.patch
 rename meta/recipes-support/boost/{boost_1.91.0.bb =3D> boost_1.92.0.bb} (=
76%)


