Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B0FC624C6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 06:21:44 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1704.1788243697599189245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 23:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GwcBG+Fr;
 spf=pass (domain: est.tech, ip: 40.107.130.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvcGJ6KHr9EIQ3n0i/o5sU8L45dP3UvAKxMhcj0ykIIUJuvnoxCCnAG6fMZLngQ/bGI3+WvZsTXc8rMYzsnWkVRpgR+ydp1roR+tw4braHUX6LcCwAv+l+yaQ4i/tMGAWs5M4JNo/JjF8O5+sMYjkUPB9Fm9CA/zP/xDFhARmatRrTo/tVX7Q6iuXRC6IdJDrByHiFYfVMhSkZQN1By5SMj8VvDXiC0VDdTyb+TtOFWQ0JJZFbgESOIsqfIIdfLEy/zqTeHoFTR8TIhyz0zvFbaYnVhaKcO4Zw/PvQEMJVy/Zw+fwsHQc1LHfe39v5GFu0kEkIP2sUhtH6dupLMj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXeZbb80WvQQOT1ryZ7af3AdAReJOQL/l7tQDoz3WjA=;
 b=vXDrkzqo4Fyk8lZprQbkrrMDlskpOZdZYFV2VK2lMV7arhAZ8FtlWI7iktrWrZWOqh2KkVdICur3hH0RFtkwMYkW8MSEwlKTe0YLps7qWZYy9/KCoyZongZDO+iunPM1G6doZ3opm2O3G7NMEr7s09Sndhtwz9PmfD0tIiQ8va7UUy0zKulsq9pSBJ7ZJK671WT5iH/t4dgAK8b/4crCjuG7S8Y4TcxH3XGC7I7/wfI+iIaNvENp7vzNdFyUDiIh7TU90hZbUiu1iDgZRLT5tHxtJofpiwFyfAmXoVSyHiknmBEVMmULDhLH0lPd9DE0DVzpKjHF+Nx+P0q9yC3glA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXeZbb80WvQQOT1ryZ7af3AdAReJOQL/l7tQDoz3WjA=;
 b=GwcBG+Frss5jE9yVslgrSQJq0rNM4PQP/pKhaFHFLkQXECmt/N9d78xNInMWQ3vvpT91EY9sXvC9SLtMU5NxtYbn1rKVbuh6UsqMNkY/zzRCcrSfG1QSi9RtiODycApuqsRWZkS62Lep4yXQyBxojdEeq7hQDVgItpi7u2ieoyJIe521sf5nMOLfsoKWA8P8HideXPWca1iQ1OSBJyIIBhNle9lIPsESSvjHXjRFAVE8TJuaBUCAKlhfnx1frCXpV+9PnnZFVFv+sb8/Jq3GfPWj2jHmq5TYAqxsU6aO/wn5Wckt4l2weKY4m+xWCpdmrfpAKFDoK4LcqongC8QR3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV4P189MB3535.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 06:21:29 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 06:21:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] libpcre2: upgrade 10.47 -> 10.48
Date: Tue,  1 Sep 2026 08:21:23 +0200
Message-ID: <20260901062125.37994-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260901062125.37994-1-jaipaul.cheernam@est.tech>
References: <20260901062125.37994-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0262.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::27) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV4P189MB3535:EE_
X-MS-Office365-Filtering-Correlation-Id: aa67902f-1ddf-4d25-59a2-08df07f14252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	4u/8YcT6mBQoLm9zBj20Z1F6pfEsZKhIPfFS19jlr6LO5eiLGerONJYv3XlPOExjNMa6zBTNvmWQId3XOGJZW6ILm0w5kuMIqTuMY34veRFQL9k8FnqSyAK1WU5+Txy6o1vD8TbZOSREiS4/VO4kZhVo2h50MrRW56cfj/8/rh5XEswbE766vBjI9xB5csJ2cClDvmoW2tW00b0Nt/esa8PT9QbHQNCDOZe7iz92aByfjV66d74HJi1iIj70+3AvkhYw3tutrkL9u861TnnmuiephFLGscRUb6AL+1VYGaQdrSk7qwpwyJlyyigT7GbBjrYVbpByzu8+gOA2k/KXgDfG2kKRxsBPSSmUfCkdcY5bU2VGAZGpiKDnDeGokw+OMQLF55TqbJwab51kiffHfPaPZAFRNYea8voGH/f/MOe2nvb5v+XZcfSylY5Q3b6kJ6b6ZH/ABshDNUsxcnyjaShhnMn6vI+Qfzcoej/ct8HCVchv4KRDRkDm3NJJweGAEjbmDDEvZtRld1fxeZAkTgQTcfLh/CoIY5WOIeG4vqjSAtf1ds8sCQQkmQhjb9zGNEy+JWLYiOjmxpDQjWB1y7SVQg735M87DtCOx6xGUhlj8sY6QEZibS/BJbzSzO5UiRXZMt9ix5vQ5de76m60OZc7LxFr5WQb+IJy2xgtCG4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LX+HdDlB8XsYuhZprTbLcFoxZwzgWE1YykeqAl4SSUQORswjzHrhcrcxw4cT?=
 =?us-ascii?Q?ba5+wuDXyGhhAy5Ne06d7SRneYRVG6GlFM2ZYT2ErrgYk8BE/kou9iUKBYqu?=
 =?us-ascii?Q?dAcFfU/d5NHbPSTJzxqH+SHlyBecOoi+M+Zs37U+DdzbV0HxOiKxLJgy5dYN?=
 =?us-ascii?Q?C1K6gELsS9SmRoF4i/LIbbdaUwGeX2yacNjoF5DNxVyfsPbYc9/XTXAjDksr?=
 =?us-ascii?Q?AQx2jimGTnl+hDLFtaxJmo7WifnhrT/451kz9aKplw9GHwx3mo0S45t9YZK6?=
 =?us-ascii?Q?Atp0mJmxeyIQe+Ts2mLRyxZKtrQhrSrVU22H983vfp2JPDG5HoGeY73GVwCL?=
 =?us-ascii?Q?xxaM1XgkMmZ/KP8R3TtGEpNYcd/6sAJAhgMBxAbqmdmTFCMsRsrpDZYeBIJt?=
 =?us-ascii?Q?p7GLkzAX9GZQsgV4aB1QPD97tSzfiTBs3FuAe37njN+VCuUHwfqzQzx3bfPB?=
 =?us-ascii?Q?EepbKx1e+w3tb4wV8CjWDuRZ3bxqeN8lAdQBBpdyEyUkyB1sfM+USa79B7Nx?=
 =?us-ascii?Q?R6upYOytJGOdbzYxqWmP8VY6cZlf4AnGiWHPdOInPi/XcUQ6ZOordeDbOuqZ?=
 =?us-ascii?Q?EieLqONRRjpdPwhXmNvJLH+HIQ37iUW7GY52yVYddqZI7MIBPk5r4eiIwbyn?=
 =?us-ascii?Q?XwOC/1rLFvgXwOTNZeRzzPw34mUIS6nMsIUTGVax3M9jktE0nbsIx+KpvTWH?=
 =?us-ascii?Q?xiMjsO8EdVzmueyfrz+KBtKZm/ShEdNiHiS1HqkbMu3Y4NGRFzKV1Jr6ZJa1?=
 =?us-ascii?Q?ntehswwciV5RLB6iq8Cc7ibgoOQ2vQSC4AcQKQEp24NozQUZmieUUA8PG3JK?=
 =?us-ascii?Q?JKMLggRcXI2ItGcOY3zRbloOF7jJPSRgbC1OoBfWcBUN1Y9SlCtsVgUw2JbL?=
 =?us-ascii?Q?9VgDL1jrBNES+FmKrdycZ/hvSR9SOgcWtND8bE52V2ezn/gOwziUdaegRFbr?=
 =?us-ascii?Q?RLgkrN/XqMWiD2zh2EtuMWYy72cYDWcJ8cDECXlLhzqRZSvb/NiLZm4qliaG?=
 =?us-ascii?Q?+VRIJgozW/bCZ6YiLjUPzyvut1NA0R9WPHR8cqVAaEqS0L/9QexpkCI1aWm6?=
 =?us-ascii?Q?undWacrIyHRN7UESdO+PjKnbo5kd0h0bJdaKdMfyJLXOMClh4LjUJtE59LAy?=
 =?us-ascii?Q?m+dfUQvaxcDnRHHLypimymWdk7A8bYyTWwMpGJndL5F3u+/Y8K9RWLkxudM9?=
 =?us-ascii?Q?+TA00oi3S/wQaHkknNf9eIRzMiBJRlQRKn0kSijz5CBn2lltKQFxxvonZLaU?=
 =?us-ascii?Q?ASBfzNA1yz0wB50RAk2Z8wrz9kZOiDrMYgSraRIs2BnAY7Ab0XnOcB94XT5n?=
 =?us-ascii?Q?OeQTMujWAD1AhvTULrU51hxC73BONdFMAzBqdC7/FyOEh0vRVboDcKVwARDb?=
 =?us-ascii?Q?eXb1itFvGIBwy6RueHnqOki6n8sIMUAwBcudWrEea7wAS8Ll3IJ+B/EfzABY?=
 =?us-ascii?Q?oW1LY8IJK0+fEJXwGoXrmJwwQgg1TzdXsUCYzUQ0rZtFTsbgeNQAU1My9j3i?=
 =?us-ascii?Q?1slcmq7gSPspphr+6HQF1lNqfLl3DLE01PhN4686mhO5iRlQTLvvBBg61WpP?=
 =?us-ascii?Q?+r9jpwbOaxRyGkBdpBA49gcpoQS6YUzWtJXlf439/qQb9bz1C6kI1OXFR8li?=
 =?us-ascii?Q?BPX4fims7Eq/br+tZlOwcoXXyiIsrVKWR7zBOjI9zZ7Uczg0jWpFO4DQ6u7+?=
 =?us-ascii?Q?W92wVRl2y/F6baz1zxivG5s09bwXvuOFcNkYhNW9zOgqqX0EOWqy5OG9m020?=
 =?us-ascii?Q?dCy5ILPsl689NJecJBuNOxwLSJIMTn6SdLcYL47w/Ty5Wn8p/IFkmZCPHd/a?=
X-MS-Exchange-AntiSpam-MessageData-1: LYLj3tBvssVRhQ4FKbWgUGYRRoYqG0UlWZw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: aa67902f-1ddf-4d25-59a2-08df07f14252
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 06:21:29.1830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyPDOHIHf57cp7z6RC27z9jH1WxjpcVzNjHtVIMCWs+QX1nH6cmpM2sLo/Q3PgHeLpbkG/+eFakx/SBoNcAoj+7ZNUqGHi330U1UFyR2ZXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 06:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244798

Release: https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.48

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcre/{libpcre2_10.47.bb =3D> libpcre2_10.48.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.47.bb =3D> libpcre2_10.48=
.bb} (96%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-=
support/libpcre/libpcre2_10.48.bb
similarity index 96%
rename from meta/recipes-support/libpcre/libpcre2_10.47.bb
rename to meta/recipes-support/libpcre/libpcre2_10.48.bb
index 35330845d1..d5daff03c0 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.48.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre=
2-${PV}.tar.bz2 \
 GITHUB_BASE_URI =3D "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
=20
-SRC_URI[sha256sum] =3D "47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d=
9ca03fd08d7bc7"
+SRC_URI[sha256sum] =3D "b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b51464=
91d12003f2c8ed"
=20
 CVE_PRODUCT =3D "pcre2"
=20

