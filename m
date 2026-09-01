Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DC3C61DE4
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 06:21:42 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1669.1788243693002455956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 23:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EJw10cRJ;
 spf=pass (domain: est.tech, ip: 52.101.66.44, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzsfodKAh9fiLgz90iMsWDFB39QiIBdJ0FUYUY1izKVOy+aLleXXW7jK6qW9C8A6UAQBlt9/VZfD3Ot4i091bjwFiH+7jprx+4UBPtPlie8GgQ+q8W17tS4Zla64j7UUyywVX3Si9vPH3ttbszR6BZzWFiFdO8S+1siSORLiKGnBjwU18C4Wq8qVSWw2NrThxJHaZEynwMQlnVr3i/LMjfiZMeBuv1YR5wyOoHyT7erxUPyYRRsAL6qdAZI7QXF3QGxt50lsgQ6wfSbby88he3q5aRf5Zaxe7QK6PPu9jQWr5tIDpklXXllkYLY04Bk4guINNqEalpcWS3PoqqxUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9tkR+AhtdAmOzLkbLlmZUPykfZPEUwaQ7TNcdT+MnI=;
 b=OwP+P9PYJcmXLB1s6JT6G12gTFQrxR4KkekYNxCBiv9nG+xV7MD37WkZ46yoWUKis2EuzPsKf1YhwbDiBTjJae+MaPIhVyz54+CxeAaAbbH9J4iXHj9SzdaKfbFBnl9N3aKfOoTgIeE/twD1yJwAz0XCNeVQNBujvaAlhPekjoMTrjok6gGfrYStUTelD4YtBMobvbMyFu8lk+EgZ8QoIudVUd5bhBjXxHFW4xjqWxn51NHS5qKgeYFsGggfa+5Q+MrSxiSGWt1EyoC1/VcuIbk6VnZeCISDUEUdZpSfy32a3kLyufhG8wD9D5kE4Ars8dcs2rAD2PkTdoaU4STFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9tkR+AhtdAmOzLkbLlmZUPykfZPEUwaQ7TNcdT+MnI=;
 b=EJw10cRJWIo6aoavMBTqo28CgC3s7Yrk4CWYcCoPft6lPIKVOwts+p9hlh5xVD60dw1PDDDnQOHAwY+eqBedV/KQTTJEBRgBqOwYcNt4/FJK3d2U4TgkSzKw4o9w9T82U7Mc+f8wEM2jxj4YRqMGpSu6xFOQzlbuPkYMhwC1H/RrOZmGP+iee+wXZRJODZwBk8usABzrxN3edNWa21q3BtahEsFQiQK0i+VVl/88l0FqIs+FPYj0icv43asBNiEp68JlRJcE9qxDCQ+uiIAPccxu5Zw2ZbfOPFIKiHZwIenz3/np2DIPoGBXzDKY0VuAuQFVt34rNO3purk5TADN4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV4P189MB3535.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 06:21:27 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 06:21:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] upgrades: expat, libpcre2, gnupg, librepo
Date: Tue,  1 Sep 2026 08:21:21 +0200
Message-ID: <20260901062125.37994-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0043.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::29) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV4P189MB3535:EE_
X-MS-Office365-Filtering-Correlation-Id: 146df14a-7033-4a7f-d69c-08df07f1410a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|23010399003|18002099003|11063799006|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	tdlPycPLG0bgfQQnQOwlFoRD2TSikSw+f4T6ztp5v7BLJ3eGe7R7glPNHxtMZTkvZjgg50voirMVb7APdOBbsNeSZ3cH7Z6DZ0BuuFmn2Iivq+LkikvaIhk0EmiyeQ4I8eTNpiLkECQrjbRPlr/EOfpP9LFTt9u8MpP/mXhADVJecIkHSRpxkHJRJixFTLR2M91zAxldyiwHDVuTAkk6OrI6SxCu7RaiRMOm0bEpZwkURiw949PzM4LyO7wPMdKFZWNz765zdH+GgP2afN4qOQMKrLOr1ArCb/q9GOxYTGVk+/bnvbw7j8GtJWx5ONJeWgrgsC1UoW67eGY4AE5Ymif0v2xwdSSOBgd3EeHDyXu3UXhFTZJkTuRcVVtpYmioIBqNQZD+LUYdBNLAW8xRAj/bs0adV8SN7X44reSuF+9AE6NGn3HYAP19Dg1xeFxlsEYjd3zGlNiVjank7aFkKUOAS3fhH6o3uXa5WLvTsCDwqwZ6pFdj2wdhOf8R5aeOupim2355BWqWy/Ha1+7vedAV06HDpub95Be3RHE9LyO3N1UN6lFdJyKAVCiBDXGdlTAgqVlxtGvucBbW55GQz3r8910MSGcnU0YCzlG2+I1RrjnfZQAk0/xuF2bP9EyhRJeTx+MQzGZRmvpTjVIuE2voOqKkQoaAE1zUBKtTV7k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(23010399003)(18002099003)(11063799006)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JRIv4EUjE2iHcdr69RLSYbTFy0wQtqvx2ZijUWk05DwBWNVCPb76oLuL1UI/?=
 =?us-ascii?Q?vHaFKmph4MpN3WenV86xsWpzLyUSWHJGJhFQh8nxlTyIVmwan1jBmMrdVGTe?=
 =?us-ascii?Q?9KkFPnz2lm3HW2YDGN75MXvJ4adcswx+QvRAea7NKkRUCt5bE2NUMDhsWmkO?=
 =?us-ascii?Q?NVPm4rPDu/Rmad6HfJFK+MQbS9Mrj+QWFnzViaJTurt70gStxsXSZiRvRSRH?=
 =?us-ascii?Q?EgknUYxWrmotnhGxloPy2AbMg8Jx00mPIZUNDC6skqY5xZxgugoFCSVaM0xp?=
 =?us-ascii?Q?F3olPFjw0jjknH4w0Meq+WQDnzn50uXSe15nlFACNE6irsqYsk6jLYCtUqwe?=
 =?us-ascii?Q?k1Sh7h5eUsWq+QSTXDYNvsUhRq30SKauBvFE00bzSACl8BpZC5uDGWWwBWDi?=
 =?us-ascii?Q?OMb7mhcxmOWwpe0MOwtRr25m+I/SPQD5A5fhubhP6gWVGE5U9ZOUqk2jXkhM?=
 =?us-ascii?Q?4MqV2agKOTnrfrt+EAKR10TKRLOHKUWDnmd3+WnEoMfuIPcnZ2lIpq6ZYdiI?=
 =?us-ascii?Q?w8f9EQ4hTiOmdA6zPnlmecBZ4fy/pOxawgtGi15xXUdedSFEEPrwo/S7rsuX?=
 =?us-ascii?Q?RPP/3vzLzegT3Zhg1yySE9CvjDF8v/tka3XN5hUqDgt6dbOCrSSt9ticbwE5?=
 =?us-ascii?Q?NBf9ulKqFaDv4/wLLS0m9PPWgtxTY+/6gB/gURBeAsPU7ZDxmF1lnFKuE1d1?=
 =?us-ascii?Q?kJdCi1Jf8VyWS9RMwwCbXe1eDeoiHGHA1C65PT2NEZ+h5q4OPYayR7N2MU8V?=
 =?us-ascii?Q?am5fxeLagMNaoSHf8JyH9du00w67gLuYMOkcWw1AXhtgZflAgRwP+I7eet0L?=
 =?us-ascii?Q?UvQCYrBPY6ks2ruNGdBpYw+i36IFYuvQO/7syxYwBoDOyWE1GTC/L+EW+IV1?=
 =?us-ascii?Q?vzObqOQHQubD9n6bwVoAkqggw1tCV/UK3HxF8LHGmQhzmSssZw1KV2kg0qMQ?=
 =?us-ascii?Q?X8hB1XIgPZ0hROOTboVQljnZOaswqFGTl4k5iw8Ibe2YAPgIc7lKpw2b3Z05?=
 =?us-ascii?Q?lqOJ2oy5CI7y0M3BAhzgBgjLGCIjaNmDjy6wovvlXVbBko8gH4BhYD1GjEBi?=
 =?us-ascii?Q?j2Goh7bbpxiqzevhuevQlJoCVBpp0X/7aaTt3Qwr6sSujuY++KuxDRtprbRe?=
 =?us-ascii?Q?EbQXgTdde4PIwnty4GoYzWwTKAY55mvyFJAVkUtZZCfsjn0mV6D5ftRq0BaZ?=
 =?us-ascii?Q?CkEFK6pPTTEQtg6dK5yN5AWp3Dq8W6pd7QP/DLyJ4EHBcvR01YbA/WXxjN3H?=
 =?us-ascii?Q?VM9avD4U5JzQg11WilHB6JgBzwVBOibYNEJQe1nVO146dWY5Jmzq3+kPZCoc?=
 =?us-ascii?Q?5bcD03WJ7aStV8Ky/A4Y+uJ1rsQn7ItakwWPyzX5kRwtGteHY5xIu7gETgqX?=
 =?us-ascii?Q?koMW1xm9SLn5J7gQnejFAgNur0T+BEPACm3YUVkUM/rriwrScd4LymGrUqzu?=
 =?us-ascii?Q?FoHvzhQOdjD5jlhqclmQPiesizSfNwjhR2LBBtdFWq0bO8FTaPN+W0OKI90Z?=
 =?us-ascii?Q?gQRaKHef97pB+hULpZEEHfkTUN3aKiBp1NJBVWLqRjIsXtbCSOI7FiHKzd3O?=
 =?us-ascii?Q?uyv2AWrlIYbvhj9C7f3dMM9qkCuHQsyG0rurshVP2YBaYZOKLVMuTgVoF2KI?=
 =?us-ascii?Q?CjBn2F7jL3CpAX8bxLtrWbdfhTmQBwp0VGSlRiqON+o11mdqM0sJrF9Hj1cu?=
 =?us-ascii?Q?GGhtv2Nt1KoLJ4yUKpNd0uKyuwsj9QYtR6GmBUl1D2sRyb184wKsysj5DaK8?=
 =?us-ascii?Q?3UJtD8lSCT8IkC9/3TCpQt5c2iHVfQ9ZezOvJkrcniT9mM/JwKpMEA/m79QG?=
X-MS-Exchange-AntiSpam-MessageData-1: sss4PyxGMTf413ZItluhYEjLZH2ykCfOkEs=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 146df14a-7033-4a7f-d69c-08df07f1410a
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 06:21:27.1357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjykPAJD8W7yadcaabClqlT87Lkx7NiLCE9rBE7f0hvTl5keiZjjughvmGPOtvhqpou7O5yGbENBjK5gZhL6zauV3/3UpyG+8ZydDiFPxgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 06:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244795

A batch of routine version upgrades for four recipes:

  expat:    2.8.3  -> 2.8.4
  libpcre2: 10.47  -> 10.48
  gnupg:    2.5.21 -> 2.5.22
  librepo:  1.20.0 -> 1.21.0

Jaipaul Cheernam (4):
  expat: upgrade 2.8.3 -> 2.8.4
  libpcre2: upgrade 10.47 -> 10.48
  gnupg: upgrade 2.5.21 -> 2.5.22
  librepo: upgrade 1.20.0 -> 1.21.0

 .../expat/{expat_2.8.3.bb =3D> expat_2.8.4.bb}   |  2 +-
 ...btain-PYTHON_INSTALL_DIR-by-running-p.patch |  4 ++--
 .../{librepo_1.20.0.bb =3D> librepo_1.21.0.bb}   |  2 +-
 ...verride-init-is-not-needed-with-gcc-9.patch |  2 +-
 ...e-a-custom-value-for-the-location-of-.patch |  4 ++--
 ...-use-pkgconfig-instead-of-npth-config.patch |  2 +-
 .../recipes-support/gnupg/gnupg/relocate.patch | 18 +++++++++---------
 .../gnupg/{gnupg_2.5.21.bb =3D> gnupg_2.5.22.bb} |  2 +-
 .../{libpcre2_10.47.bb =3D> libpcre2_10.48.bb}   |  2 +-
 9 files changed, 19 insertions(+), 19 deletions(-)
 rename meta/recipes-core/expat/{expat_2.8.3.bb =3D> expat_2.8.4.bb} (92%)
 rename meta/recipes-devtools/librepo/{librepo_1.20.0.bb =3D> librepo_1.21.=
0.bb} (94%)
 rename meta/recipes-support/gnupg/{gnupg_2.5.21.bb =3D> gnupg_2.5.22.bb} (=
97%)
 rename meta/recipes-support/libpcre/{libpcre2_10.47.bb =3D> libpcre2_10.48=
.bb} (96%)


