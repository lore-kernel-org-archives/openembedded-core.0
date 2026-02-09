Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B6CE81BCD
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 14:21:49 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48263.1770646903321148315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 06:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=VqGqJ2Sh;
 spf=pass (domain: est.tech, ip: 40.107.162.18, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTUavpyiKNzJVvve1F/Sg+fZFrkQQxnuzkMje4SnJLBq6tZ7C6LO4OncDPg34/4asw+CPtSaeA9ILJdS53eNKaGGZh66kBif3j1/VeFCsd9nsLAc8KdXdHqvv9/m9y2F6r8VU8b4h5LXncjxHFEOlZNRZHp4bDa44da8ded8lYUCzFLesShRSTqDFcED9lEKYRyWCNAKeLUzgZfKfRbZyCgmCdi7/54YLzNW8gUD2hTMWNA39DYdqXEK0DCmavqLdhC/EUw463B1EOuExP8yxc/Pb6xLoUX1g1Z/eiGZ1fPiEvXadmc1ri+OQMK4pLpQmFj33GHMPMWE2MkoaVZ6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxI9mcen1iPr8yo5ou9SaE76khnUt9QaqryBjlgR9lA=;
 b=sIvO0awHeQc2Fp+h5rHNfH+ea4vRwB17cOBuKqklzwUz2pXZqa/qn3tmYDZkjm+j6PDUOHP+XYc+nST9R+BkEviLm4KG/yf0EDgjtjHPkDnf5i0alZn7bQPOP9yxamBJJvrqEcXh6VfXhVTm2nfgJiN1yb4aDdsvT6BwbPAUGsEThQVqbXhA/eskTUiq6XH5hqTxQpne9RHlPESrcuq1ahp0b1CZlcpyhQ78cNztPKMdj/4LGq+gPVWG6IxwagLU55Cl98hoNVigARq/AClsDwD8Q/d1wnBpBZSy5PjySxFeKeNjX5BO7is/MhW1GEwBujIjDLa4FcFdLSuhuH9WVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxI9mcen1iPr8yo5ou9SaE76khnUt9QaqryBjlgR9lA=;
 b=VqGqJ2ShDZc36wbgeFa3esfZ20BBqZ/zwUNqwgApRZKnDRQ7TQKH9dMIJzYMjvmoW08aGGKbIWoWQA0QkIMguLaLy90lSfsNTkc+nqX83Nn+QIHZv/nUkLfSFBQoGUJ0PL8LSyBX1MnEcJQydLsXeDunIPM7AcQb9BE4pUNc56KXKjgfO4ukphfTBQAubksmjmgNrqfFsncBdiQjwpHzJnX8Wy/nvQRfv/R86JXYyL4+rnrOJvTDOPnACcCzX/JGLbt8gx4ZdmcoujF9NQKhzDWDSds84/zyETQ0s7vzdwihPCMYJM1yDi656eYcWzhOMYmmvrjFMbry0jEXofTuvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by AS8P189MB2316.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:21:39 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%3]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 14:21:39 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 1/2] avahi: patch CVE-2025-68468
Date: Mon,  9 Feb 2026 15:21:00 +0100
Message-ID: <20260209142133.55500-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0422.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::13) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|AS8P189MB2316:EE_
X-MS-Office365-Filtering-Correlation-Id: e8db3135-131b-448f-3f7d-08de67e68a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a6f67Uh5rqIIZfNbxLD6+ddlJDOSJ7mXCXY9P9mhM7Eoe3m69bTE7S8jpRWd?=
 =?us-ascii?Q?EQBRSkjftGowa4X0fO8Xv5NqLCB+1X007f64272HS75rCf6bDS0SLY1F0q2z?=
 =?us-ascii?Q?ebK0/BVz7/3+FHBkILmNF0v6x+BP0UZCLGBoLtPmc+5YSusc510Wj2dymUmO?=
 =?us-ascii?Q?e30mala2XvzmCV5wCiT2ogYO2OazdI8dC7fs39gcgs+3D+PEFh4Spi6EzpDP?=
 =?us-ascii?Q?clMpS+y31Ov0//3nm6JRnBHsCeffSt/iINJxJROzEaHTm5yY7jAtZGJOqtLZ?=
 =?us-ascii?Q?8F+hi+ZGWnhGcEDPs8aMT82PL8DkYD4BePqxZ+tbb7LIudwzFg/GLXRB0p1F?=
 =?us-ascii?Q?dfGRqJKDEUwCedj1r1/5NLaKI46BDA7NWYiQTrADtrqmiN6b7zB6ldzuGlX5?=
 =?us-ascii?Q?KaY3WQxU86Yc7zGHAt4j44d4IAlLyGw5EiaewVG92POrfqbyiqoTABgz25dk?=
 =?us-ascii?Q?SZCd3wK+3o89BUChizf4OxuL041RyKta+lrI3/R+atbQPBjJ0y/wDDsvo/mv?=
 =?us-ascii?Q?5isd5Vkn/B9bizvwbpb9PjZkkY5Z0+8EFv/v2CbH1e7hcjankBxhtXjP3UOT?=
 =?us-ascii?Q?bhZf2UFJ6j/9Pt9AQhIUP2eknPsVki3TaiqRkSCRR0+Neoo7ds2+EXmUrzpP?=
 =?us-ascii?Q?h7M/aiQyoPL/h9YJXaQd9bLCM4jkHV3EGk30/cQ46vz0HGIPVxt8vphUCzH1?=
 =?us-ascii?Q?+z5/VaqNwe9aKAS29dr/Y+SVVolixsdXga/0DlgQKiQ6YzcVCYMQEKD+Qyb+?=
 =?us-ascii?Q?A93QMotYKZ8jmhfs/Bcu/wTZ+bNHvB3O6boz97KTsCXsypraYT0PTpvode6f?=
 =?us-ascii?Q?SKfeINB6VKmQAS6SLZtCSYKVsAV0N4k1kc6WbDb73ALsOFSUSkZNMd7iNGYl?=
 =?us-ascii?Q?CsqvT3xRWxRf/qXd2FFJRkk1Pqr69Kyy2WAPO8/eByV05w1M536u/QCY+Y10?=
 =?us-ascii?Q?SGQq0qeseP9Etxt/cUOohasVE2zNTpx412lsya7Wb+MoEnJEBJJuhaYpmwcF?=
 =?us-ascii?Q?07MsZ5mXPC8fHFfzvaUhmyjKg0+RVZOAoTT2NcQCZ/xMAYJYR9K7fRVIkZt7?=
 =?us-ascii?Q?7fO3z1UFzrCsQMdRg6u4i3DLqI5wfdubkAPKtN7RUZTjWZqHOaL9DEei5WnV?=
 =?us-ascii?Q?SGAqEYeK4am2uC0SBaRE5fxBGR5ITIVHbiaDT6KAEe1pvsxnnxLErh4thHJ8?=
 =?us-ascii?Q?oTS/uATJpzry1DRlgFR36dezKyDxxAp9yM+Q0rhL2pZyfF/nOFEHhtC4X9vq?=
 =?us-ascii?Q?t751tsybO4Ie18MjrAax7V8AE6NoPQIhhdifBqk0SmkN/1BC1R//UjNMmQ+U?=
 =?us-ascii?Q?oE5pqU6YcMGwYhzBmdcyXqhMETeeIBOg5TkwsDSr58F+8LBn76jvRkIoKW5B?=
 =?us-ascii?Q?pVezEZFuTpo41qp+uY31UNbOTfDsiAVgKaGhVStZzn/MAuMxF2V6pNG65Scp?=
 =?us-ascii?Q?50e0n+G7mkUjVhw77ip1aVo81XgkgbmL3xR1cBzg+ZpMH9JZNTC5PDwp1p7a?=
 =?us-ascii?Q?ukXCcWl9V3dD7Nbu5UBlFxV1QuYw52wBKB59?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I3L9Wz3mmUvPrNqq3FHY5ovcZ/dofzwQBzQaLIVj8AP/IM760TFu9lN4Dv87?=
 =?us-ascii?Q?oYkbJcAFzoVZYnnmz7aT3ga9xXuHkarOsUPmK7YXeu8cWnNA+nhsbo1CKVki?=
 =?us-ascii?Q?1WBjYzwx0xWF3cPccpZ6oFBMNo/7Ly/fnYl95qC0Vo3MzAqN9myZI7BY6y8b?=
 =?us-ascii?Q?OnQdlWQ6n+iVFNkpEOQlaDDvQVQluA42dx98e4mW+3G4ztNeX7AgAxURUlXk?=
 =?us-ascii?Q?Zd+VJWBuVmC9o5HJMvvs+feehy3rMwOxtA7jlHwwHUlNks2sner/7MuCHXhm?=
 =?us-ascii?Q?C3LkhzTKDaChNto+gTvMb5gyIeZiXSH+Hty3188kPRx9heZEXTnDCKlvFcw0?=
 =?us-ascii?Q?Dn9QkPBOSFTtLJ23oQB+V2XwvJRMgrMm3tfWwWXZQ7LFxadLny2f4KMtC2TT?=
 =?us-ascii?Q?kcRlbuQJE7Pqz5kMooqZA0T6KhLKjgZQXbkAtuXcAYv5K4BKWzRKbqpedwLt?=
 =?us-ascii?Q?DzqFlXgbQnaVywY6npc8ag4usl9Rp1uyesKA3AzjTK7TqQ92rfErIEtmufFD?=
 =?us-ascii?Q?bMTio8Y9fnmL+fr8b18enbcZrpB8I4eYlAdcuiuWEc55TsjUEQyxi24OaH8D?=
 =?us-ascii?Q?EdIc/KclZ/bieB4nmfSkfl4+twgtug7fV1hEm72/Ni/pftu6l3yWW7oNo5NX?=
 =?us-ascii?Q?3OYJS8WNnRIXc6JrNfKweIeJYlVXNELvxXwckG5cN7yOtPLEyuYWIk/7/FZR?=
 =?us-ascii?Q?/JD9KcXMIqBiFtByU54v5MfyCGKkcaqKW3OFCVDEzXbfKN2oh+xwdfZUHZ9I?=
 =?us-ascii?Q?zgrchKaxdfN+lym8J6VBU8PehtCHkrXSHwVi2yaGQmXBwEv7QY9+hUhdK6U+?=
 =?us-ascii?Q?qldiMkgbmmTvtKdiOWOA24bH7iZKJc2By2bYdJpsHLNrqXEYH5/DHFgyHuTt?=
 =?us-ascii?Q?L+HKQqBvn9m2CZmvTy/JTXwA4qjDlSUniiP0aF0gFBqkSoxJlOuhH9RhssNi?=
 =?us-ascii?Q?A9LcWFV/G6o5EqFSh5sknbS8SzxHRbonwiq5RFpWIb69vmFe9dsW6b6cx/zP?=
 =?us-ascii?Q?qy8A5lm8A/IdEEl7h0N3yMca3L0AXsutLg1fxSYh0rD+FkE2Va3yNHFrJC2n?=
 =?us-ascii?Q?Vuov5bJbW4O5etJUOFq9QiXKkaorbeRG58p/XCSLnql28V7bM/YRARZAyEx6?=
 =?us-ascii?Q?VXtDR648Y4j0itKTbAEpTd7UbabAQzyP3NdI2W8mDKCpCoYfMkm+l1DsZes1?=
 =?us-ascii?Q?WeqKVudCaDhnBSpeMc7sUAumU/kwiMff6VLPGJKxU5caeYLsE9qD3URKvEq8?=
 =?us-ascii?Q?q9L4fsyz3+KxUkd+M80ci6uGWaXnbm5VXVYOh+6fM5F82+8CQlr158pXdpGU?=
 =?us-ascii?Q?uT1/JwJRx4Q9AapyWXQjqRtZvLmSjBrYSPI/41pGUZcrYAb4qBqIMYRtvBiT?=
 =?us-ascii?Q?WVD9OtWhU77vaJmgzDpUmxEWi46p06jCEo0zw52if9XctQEz4xf8s45hKzHC?=
 =?us-ascii?Q?IouAukBQT2U330WbOjD6jEci68fL86R9YJsBvWqtKLp/LtyjQSYSkHGMXKtP?=
 =?us-ascii?Q?jMXymHMKNWsYlWjFL/AOwDOOMOzh6j1OR5Kf5Om21/etYfZyFuzd1SjFLNWA?=
 =?us-ascii?Q?1rg1t2g6GoAQeo+cHMXJZQtwoiN1yeLH6eaxEtkT5ps/Jhs2yWfuE9U2WomV?=
 =?us-ascii?Q?lkKbbxDwugXEiuEoANmXpLO4X8+n8bfvq4DQll0bvZW3f54BdycZo8m/6i62?=
 =?us-ascii?Q?Au9e7jINn87INbw5aWw/SzFZtYH4EBckAgGkIiVPhXYf0mIsZ1v0RI38iux5?=
 =?us-ascii?Q?szUU8dHB8Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e8db3135-131b-448f-3f7d-08de67e68a31
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:21:39.2389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHvKQiDfa9R5ymrLi7diXPB2YNkxz3u8Qyhi/nidxdmQZpFqGYKQoapBE4qn7jXgRBjCYrrquaseinKrRxP5ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2316
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 14:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230801

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68468.patch          | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.pa=
tch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index bd61c39dbf..4efb29a7d3 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -38,6 +38,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-${P=
V}.tar.gz \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
+           file://CVE-2025-68468.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
new file mode 100644
index 0000000000..3635cc8d53
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
@@ -0,0 +1,32 @@
+From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
+
+Closes https://github.com/avahi/avahi/issues/683
+
+CVE: CVE-2025-68468
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b67240179=
d309a]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 86e4432..79595fe 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
+                 lookup_drop_cname(l, interface, protocol, 0, r);
+             else {
+                 /* It's a normal record, so let's call the user callback =
*/
+-                assert(avahi_key_equal(b->key, l->key));
+=20
+                 b->callback(b, interface, protocol, event, r, flags, b->u=
serdata);
+             }
+--=20
+2.43.0
+
--=20
2.52.0


