Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CDEC021BB
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.137])
 by mx.groups.io with SMTP id smtpd.web11.1143.1739286064813401053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=pzOOwRWN;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.137, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4Xu9MyrhvCZBxAVnaqxsY/BgE4tpLEAJYW2/p1pB3zFWryKcOnS6EVDh5HSLZ9d58f0vvWxr48SrJ479NLGsr1bllJgG6QRQQA+S3UW6uycZuik+7OV05HMGDC1RRXMs2DkJudAQsEahOv3dzF4y02p/mXdXZw7k9Ybwg0oJfgfoeAnzLVDmWFunCjNr5j79ELne9iKz+i9IrzHlCd84l01JdwziKKee7nuIgpSmjXuBdgHHqQdjuOhmXdTlkc/BUrjiMHfT7hjMCggrDMKDnH87feenMWpRJ138llVPIICN9jLQV8fuc1ufWDbDvlw5gUZHGdL3kl80MLkwmLpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbgsfgMioBNh1Fzn3pLnrtXjHpcpxCoFZXuVu02doSc=;
 b=pYQ8NjtupTl4vH1tgxChMjdAdJw+hwUA8IAHLgHe6iEdA7LhgDSGlFROjP3lMZXXYFFqwBu4iZzSCLNYSzCBYVLNfidXTl202FA1+a1qvzkmq4W1gaedWkDCLwjY39H7MZct/7T+v3WffRcgNZwOFzS68c831UptFVI3alhCOAgN84mdHH1Y5JQEbJrUbRDPB3qabNfPzC+ZNBQMQL8CS30I0Uro6nvXEM0+So5203blcw81IdqP5hPF8RKtVHTaI9mKYBkWFpxrw8phviNGcPAW8V9sINeKRX+SgeQWLullFENqIMU9GgTZ4v9Df6IR82FPynmaZnm5nSHtWug/Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbgsfgMioBNh1Fzn3pLnrtXjHpcpxCoFZXuVu02doSc=;
 b=pzOOwRWNGsmi055PuMQnjC+qowSD5uNlauwwLoOM/ylSogPEULFmVW7izhg69aK7qEmxPVpRDjXti5YOqJGpk3papHBruFBY+6avmSaXFWpmejPvwqlvkTu3oAwWzqL3ZYFnfh0o+TfGgxIUSwqExcWMPxhHfx0PiSUugUAzLMEsPf0P6SkY99gNJittJGMw2vI/KQp0PZuoIp7loVuzqZSRMddo0WTiAMiZ7IUuZUkn45nUn1TirvE7GDqzBKoWG0693udMS8V+Qph+igzeP9D2Iq3gMTlAWgSyDRTi8uyymOBUgDJKLnrzNNmBSClmokita88ljMVNCw9XgBTklg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 15:01:04 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:01:04 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 24/30] python3-rpds-py: mirgrate to vendor cargo class
Date: Tue, 11 Feb 2025 16:00:28 +0100
Message-ID: <20250211150034.18696-24-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AM7PR08MB5399:EE_
X-MS-Office365-Filtering-Correlation-Id: 196882ec-1bad-480c-8e8b-08dd4aace40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uDfeVDZcMN6wKOjinW6wEUtWV2an5POhtgwhYU5Q8j4cDSoparVNCjL0u2Bu?=
 =?us-ascii?Q?CssskyyEC++VVHvh1YoBJUFBJgHYGYKFtXHcDFUqHYNjpe8D5+iwmXvzO2WA?=
 =?us-ascii?Q?TKdFoMbKUHiVlB9C+ms8aGGq4ZZP0qHnh8jnn/uqCCAFwTZq2Ee3cc9sS5Bv?=
 =?us-ascii?Q?SrJdead6ruXZeasRbAUkn2sgLwHcvlZ+/aBWAaKi7VkYox8E20klBlmZ3688?=
 =?us-ascii?Q?KNEpNOL4cObHNvUk5q13NmQ356Y9IsG1sKqJaDNb5zjnSFO8/74M7Vy0ZMCq?=
 =?us-ascii?Q?YS3Coxm4vVukdKnkNxNu0Fqq6i+LBIJ8Lyw5HrmLfrq/hcGN3BT1y5ePCaHa?=
 =?us-ascii?Q?xw1L9fzl9mGS8CN6j89hYsQyly/4z7f+TaoeqKYjfbs7dLMkguTNdXHfQkRn?=
 =?us-ascii?Q?bW4a3jDzpIu5WdnfgOTY0BaoWGv663z40fRugYWq8f4XBI2nAEvsxeTal09L?=
 =?us-ascii?Q?QfFAvImefBqr3sYpZFXNNmlQHRGe9heUIjHo9F5nsP4rkj/Dht3w9ApAC4tJ?=
 =?us-ascii?Q?jGfkOTesEIM9AeL0qJsUdFWp8XF4/B5TfR0fIqHHUHf+lS5QCtqBv0JEYd9j?=
 =?us-ascii?Q?gumMsx7NMMZNRkgqJRTIdw1758racBP7td+eqD4mSt/TzpScHkkemJiwgvPJ?=
 =?us-ascii?Q?mGZwDVrnatJtxImvCMEZlITWpMBGcyze5hV1gun1bBdxTAniNy/aLdrBxYNm?=
 =?us-ascii?Q?IxcPboPGsVWdVdv3gfn3N3ePaaw7UBPYR5U619GzgTmG44BI69sOFYsaLSuj?=
 =?us-ascii?Q?gDUwPPS03t+HyiZarKVF7zqdix5qlikXMYy1hVJNZG/Wz+xj4i01fOpXqmOY?=
 =?us-ascii?Q?BbFakBVgj8sQQ5mqrlE5gXq28DCGDNOVPo8fKGd7HHiG/rPF4kQCAB/eCbHe?=
 =?us-ascii?Q?kAZ52xUaMQXzObP/6BzHmj/dKSLrevF1sG3IAJkkYt7vymOqkl78BLuVkHi3?=
 =?us-ascii?Q?KcRwNCdEY/ksDJguIPtdI8x0TP/HqRYLzAQpcqcZL0G+dF9DPu2A9C93oflX?=
 =?us-ascii?Q?1lqDUtUx7RD5/9N5AHp2IYzyaiu/NezTRckc3+Ouc1nlZIJRccv99pGYzH8p?=
 =?us-ascii?Q?t8Y78GEBS0GvtZCn8Hs775jrqEKSE8W9hvS2ll0SQXisc5ULrvRUqC+XbWTX?=
 =?us-ascii?Q?Gk6Guxru19O6lDtbgdq5YQ5yY7iDCKjB62fBO3rzwYNmISvRhMwPuF9H7zcp?=
 =?us-ascii?Q?Sv2FDasik3OtZTT0CRvpUssIKSWPUBrrfL/8sDW5/lcfjqiTvRrABJFSmMDX?=
 =?us-ascii?Q?WuDiFPO7k5pJkoRpBQFE4NV2UmD/NIN5bXtuyYQwNY5f7YqkgYc13cT3DQUD?=
 =?us-ascii?Q?12woe1BikGNob+g8ea+H/WEvKVn+1ur3Se9HP5qJhLSWzazP0t2Y5nQ07Lhc?=
 =?us-ascii?Q?zTtk8rQtgG0ujOc3/qyaA8KHMe064FmYzXf9ffdwMjB0vs8xy5DVh19Fgxj4?=
 =?us-ascii?Q?qLKLMhHYnjBeFTEQjIjGU9Kwqyd2Z7A0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hAOfG7F5L1Ny42+foKd1O9lRIJyzzGX/I8lOFk1g28ILt7HrDWMYueOwrtgv?=
 =?us-ascii?Q?UHDNYD7yFmUFYITAZYslG6nmns7qEXEo2QXTdkSinfqMf/7mJJ2yG/oH4HgT?=
 =?us-ascii?Q?070xjPYumziVtsVwcpymPnpzXuCqPuGY6fDIShjB6xI9g9UVx6OYSWtHbusO?=
 =?us-ascii?Q?aQ/qsKw0F/jXezfG4vUk1PTrxTShNJgRRczPTV3jW2ky43lERPqwCztshxde?=
 =?us-ascii?Q?1Zhe/cYs3KdduIplqxOPlOnetb1qWKVrfSXQS1IRZwpOQP2W7mXZsG3bKr/c?=
 =?us-ascii?Q?PPyg+WS9SSwJPZgUTeitrlWHq5FATkizsTwcCwJqkt13SPmY2zG5jdJ6r/5r?=
 =?us-ascii?Q?TZqb9Uzltbzh6MZU+D2uhXw/vjrxiL3Wle0qAuPwbWE4rW0MSyHE17d0gVp9?=
 =?us-ascii?Q?t6XW7ZXs9t34EgGoW2YYUz/pQx78wvEPvNxXQ5KJxeJ6MHR26cnzF8RkX47o?=
 =?us-ascii?Q?2Ev4hYqmendP3gAyp3/yN1jsPG8pnQ6P+WE5SdS9MBVTxpGsiiR0QDquWzUd?=
 =?us-ascii?Q?NRJEds9Lam+NIzXmyirweOsKKaKnTl6wUA53VCBmd47Q/3UhWcGcZR04QZef?=
 =?us-ascii?Q?nHVougDqxnBeb0ch1iAIN9gtH8tpsypo6Ut5mrUylSiOv1Qk9rJiAKX3pK3Y?=
 =?us-ascii?Q?Vs1IsqiGcfTksfGUJfrO0G1f7w8dPL1r+hAF7H5Q3GsgQDLrbfvuWCEISFY8?=
 =?us-ascii?Q?4k7yKJflPboX7wtuvawKZDBHrff2dmNWeyUeTyed0tLHAnV9Fnuw44dD/nTk?=
 =?us-ascii?Q?70IZqUt8Ek6ZSvBUEoUQYdWmUAyr+Rz/xYT9syLFD/upG537yw4adj+TE6TW?=
 =?us-ascii?Q?F3dsSKDmlRY2P50fCGGx69IXtkIq7BVW2hXtEEOIcnx5NnaeXKVc3bnKH+oU?=
 =?us-ascii?Q?kDwmVooFQmmoKgYsLlieSas2STPZaEr143QrVL0BIjzxL+i3sm321To6IIcE?=
 =?us-ascii?Q?WcIZTUjrfYLTPGBVdWqfa6d84sxOot9E81cSbTkATenE6tCIzaLBF09WfkDI?=
 =?us-ascii?Q?ExvQnkt9wAHztsonvIefTDMDgGWvz1/NEtfv2WyU/BqzBCMyctYV427D3bZj?=
 =?us-ascii?Q?o2gLAk9m9xXkHz6w6UzG15Im0+8rwEVC3GBeEQoTWa5fQoCtV4ITiOLokNdf?=
 =?us-ascii?Q?1HRVyJzbg+mabzQAhxcYPMVARNLp2o1VdbObRuHKCD1Vrx4wNcT7HOsw+zox?=
 =?us-ascii?Q?IK1OVFcLDxgZUWi3JC90lf4P/44MbzdyYFP3KGx2cZJqin7QOBzMpk2qzyuu?=
 =?us-ascii?Q?l0x3dQMMFGDzjw09rnWyQczQywaIVvNrDw6ZSLv+EQVky49jjKvlTz31TXnX?=
 =?us-ascii?Q?03Zi/E5L6B3bqkgpkBeuTTrs8zCTMtjEXl2u6xU9zakA1h+Hpb/AEeaC7RKU?=
 =?us-ascii?Q?sY7iKYoP8P3FzEwzQYk5nX4SRA48Pd+1/8bSRiOP54zqibJHOlbAXn7bkmXx?=
 =?us-ascii?Q?SwvOJIKAZF3/drDiuSAOfOiJkMl3qKPQ2fj5/yL54w3/66OoXieFhpppfNMR?=
 =?us-ascii?Q?48+i+eN9fTSdCAomMob6dx+JbDr1mzHqJZ4m7966kfZ3eIfblOJLii5sdmXK?=
 =?us-ascii?Q?kP5gv9QdnBXjg2wOg5/ZHza5O1uoqduHlbKGdFe36/+OS668ABBhHPiiUjTF?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196882ec-1bad-480c-8e8b-08dd4aace40b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:57.9063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55nAzhcvPOzVyo1CZH/wXGCbnTnmM0pbTF2GiElDvo/UXJBiDMo03+ifIZSIwVFDi4wJGK/uVpy7XERrIfns/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211150

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 .../python/python3-rpds-py-crates.inc         | 54 -------------------
 .../python/python3-rpds-py_0.22.3.bb          |  4 +-
 2 files changed, 1 insertion(+), 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-rpds-py-crates.inc

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta=
/recipes-devtools/python/python3-rpds-py-crates.inc
deleted file mode 100644
index 7022cbdcc8..0000000000
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ /dev/null
@@ -1,54 +0,0 @@
-# Autogenerated with 'bitbake -c update_crates python3-rpds-py'
-
-# from Cargo.lock
-SRC_URI +=3D " \
-    crate://crates.io/archery/1.2.1 \
-    crate://crates.io/autocfg/1.3.0 \
-    crate://crates.io/cc/1.0.90 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.5 \
-    crate://crates.io/libc/0.2.155 \
-    crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/portable-atomic/1.6.0 \
-    crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.23.3 \
-    crate://crates.io/pyo3-build-config/0.23.3 \
-    crate://crates.io/pyo3-ffi/0.23.3 \
-    crate://crates.io/pyo3-macros/0.23.3 \
-    crate://crates.io/pyo3-macros-backend/0.23.3 \
-    crate://crates.io/python3-dll-a/0.2.11 \
-    crate://crates.io/quote/1.0.36 \
-    crate://crates.io/rpds/1.1.0 \
-    crate://crates.io/syn/2.0.69 \
-    crate://crates.io/target-lexicon/0.12.14 \
-    crate://crates.io/triomphe/0.1.13 \
-    crate://crates.io/unicode-ident/1.0.12 \
-    crate://crates.io/unindent/0.2.3 \
-"
-
-SRC_URI[archery-1.2.1.sha256sum] =3D "eae2ed21cd55021f05707a807a5fc85695da=
fb98832921f6cfa06db67ca5b869"
-SRC_URI[autocfg-1.3.0.sha256sum] =3D "0c4b4d0bd25bd0b74681c0ad21497610ce1b=
7c91b1022cd21c80c6fbdd9476b0"
-SRC_URI[cc-1.0.90.sha256sum] =3D "8cd6604a82acf3039f1144f54b8eb34e91ffba62=
2051189e71b781822d5ee1f5"
-SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee582e=
bb74b53b4efbf79117bd2da40fd"
-SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b5d=
30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.5.sha256sum] =3D "b248f5224d1d606005e02c97f5aa4e88eeb230=
488bcc03bc9ca4d7991399f2b5"
-SRC_URI[libc-0.2.155.sha256sum] =3D "97b3888a4aecf77e811145cadf6eef5901f47=
82c53886191b2f693f24761847c"
-SRC_URI[memoffset-0.9.1.sha256sum] =3D "488016bfae457b036d996092f6cb448677=
611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.19.0.sha256sum] =3D "3fdb12b2476b595f9358c5161aa467c24=
38859caa136dec86c26fdd2efe17b92"
-SRC_URI[portable-atomic-1.6.0.sha256sum] =3D "7170ef9988bc169ba16dd36a7fa0=
41e5c4cbeb6a35b76d4c03daded371eae7c0"
-SRC_URI[proc-macro2-1.0.86.sha256sum] =3D "5e719e8df665df0d1c8fbfd23801574=
4736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.23.3.sha256sum] =3D "e484fd2c8b4cb67ab05a318f1fd6fa8f199fcc=
30819f08f07d200809dba26c15"
-SRC_URI[pyo3-build-config-0.23.3.sha256sum] =3D "dc0e0469a84f208e20044b989=
65e1561028180219e35352a2afaf2b942beff3b"
-SRC_URI[pyo3-ffi-0.23.3.sha256sum] =3D "eb1547a7f9966f6f1a0f0227564a9945fe=
36b90da5a93b3933fc3dc03fae372d"
-SRC_URI[pyo3-macros-0.23.3.sha256sum] =3D "fdb6da8ec6fa5cedd1626c886fc8749=
bdcbb09424a86461eb8cdf096b7c33257"
-SRC_URI[pyo3-macros-backend-0.23.3.sha256sum] =3D "38a385202ff5a92791168b1=
136afae5059d3ac118457bb7bc304c197c2d33e7d"
-SRC_URI[python3-dll-a-0.2.11.sha256sum] =3D "9b9e268ee1be609e93a13eb06839f=
68f67e5fe0fb4049834d261c2d5091c1b6d"
-SRC_URI[quote-1.0.36.sha256sum] =3D "0fa76aaf39101c457836aec0ce2316dbdc3ab=
723cdda1c6bd4e6ad4208acaca7"
-SRC_URI[rpds-1.1.0.sha256sum] =3D "a0e15515d3ce3313324d842629ea4905c25a13f=
81953eadb88f85516f59290a4"
-SRC_URI[syn-2.0.69.sha256sum] =3D "201fcda3845c23e8212cd466bfebf0bd2069449=
0fc0356ae8e428e0824a915a6"
-SRC_URI[target-lexicon-0.12.14.sha256sum] =3D "e1fc403891a21bcfb7c37834ba6=
6a547a8f402146eba7265b5a6d88059c9ff2f"
-SRC_URI[triomphe-0.1.13.sha256sum] =3D "e6631e42e10b40c0690bf92f404ebcfe6e=
1fdb480391d15f17cc8e96eeed5369"
-SRC_URI[unicode-ident-1.0.12.sha256sum] =3D "3354b9ac3fae1ff6755cb6db53683=
adb661634f67557942dea4facebec0fee4b"
-SRC_URI[unindent-0.2.3.sha256sum] =3D "c7de7d73e1754487cb58364ee906a499937=
a0dfabd86bcb980fa99ec8c8fa2ce"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb b/meta/=
recipes-devtools/python/python3-rpds-py_0.22.3.bb
index 8eeb954c89..33a4cb5e54 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7767fa537c4596c5=
4141f32882c4a984"
=20
 SRC_URI[sha256sum] =3D "e32fee8ab45d3c2db6da19a5323bc3362237c8b653c7019441=
4b892fd06a080d"
=20
-require ${BPN}-crates.inc
-
-inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pytest
+inherit pypi python_maturin ptest-python-pytest vendor_cargo
=20
 PYPI_PACKAGE =3D "rpds_py"
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
--=20
2.39.5


