Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93754CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 09:00:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9383.1791795637860349831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 02:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=iyZZkHch;
 spf=pass (domain: est.tech, ip: 52.101.65.24, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcmri+i/OHb2hE0YOHY6jPwgvu+bvEjVE0vBSZ1ZOCN4UdDeCAG/xqA+Y3FB/3rHDwNa2SHBbn/Gg7BePKOed5v4rVA/N2xRWU5YzJWqpFmJRsKR13eeA4Jyvlz7omSYw1F3zlLqWGHqDN0wEi2llji3Few736Vr4mBa4ths+1mCNjY0cS6Svafs0xfRCIySeW05h1oTY1o4d2VdJ8Rz6hPLIwasFK0/63nMUTqAB4uKbgZVKOU6eSanRhVUBGZi6wHezu9BQsbyJixJsDLTJkZ0j5F1TCOn5HmyAje86Pi6vhDyO/VJ8xZf47/rY/zJWZ+elzEtb4mpbmAhbEnreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ua1YvUj3DtJCykobhazLm0kYAtt9HiknHvkw2wjravQ=;
 b=USYds8haHkpD1JrABwD6X9C7j+MFwH9IzVFw07ireByke8FrlsXA8GP6hNHjUuDRtC0PuddF4bM/ewmiPnE8Jc6fezNIafXC0YcpnhGLoziR++/PBMFm3xfuEIyo3mhdiPAiGLD3dHIa/DPGXvD8eALzBbwo7Yr2UAq26vhkZDQHlSTuXs2YB3VkEzGPnedyHBVy3+k8saFlxn6EShPAxctvI8121J5DBa+wARiHu9Ldv/+PcpNco2R5B7PU6/2fehfB7BONeiQno9pjWfsebe1vfigvOQxDc3Ct67lCDk2g6uklcElZLawL4iR7oy7A0M6eEZtxPxB4OU3Y8VngeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ua1YvUj3DtJCykobhazLm0kYAtt9HiknHvkw2wjravQ=;
 b=iyZZkHch+iAIqNpvtBDR/ehqFefmT27SMwtp+CH606LAcn89AQ3LMbzQ0TKQslzZ0eLxUcg4FQEZaVhbli//pyZvmhcjSVhn5qbSo9I6JF3UdbA3dEk57BU0M5YKzPPmQPLy352szYRb+s4XMAxyWwR1COnt68Tbu+k/UlkOa+Cku4YXv8suIU8Ob21PWLf0pyL1ROYqUa7DpjcDW6VanN2o36jTHqlb2oxp+GGedFN9Qh9MHaJrykcR2wsmgXXofVBtJnBwYpzkagQ2swjlRZK9u/ERyBZPONVj48AO1VcgEGV5/XG9T+oA1d5AnDqK7IKXdabNyxdBds39hjGrgg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU4P189MB2719.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:55e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:00:34 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 09:00:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3: upgrade 3.14.7 -> 3.15.0
Date: Mon, 12 Oct 2026 11:00:30 +0200
Message-ID: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012090030.95901-1-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR1P264CA0079.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU4P189MB2719:EE_
X-MS-Office365-Filtering-Correlation-Id: df8641fc-d1e5-4ba2-7a1e-08df283f4670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|11063799006|261009221227099003|261009221727099003|261009220027099003|261009223027099003|261009223327099003|260925021311599003|260925021911599003|260925022911599003|10067099003|22082099003|18002099003|6133799003|12006099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	zIIHyf1jlyfeSFBronTS/gdis6y3GgEMEls2GU8eOAKwewwbQcKVeLgYHcWDmPZFvYzDjIQIVYMBkrSgWom3MrR/XN6prThef+jiEm83A+akPCEhVX0DIxYuD/R5S6EnUNsRoa9yq8YoW1A41SYrZJRdj0xQGoVo5sV5NZydJvQoavtIZ8TdudPBDe+ewFVB/1vgIfm22Dm86dZ6yHHoWcv5GmsoWsywUtLlDJzvStNTLB3/Dkpb/A/658I7IzvqKXS2DTB3Ebi3heXbI+D7Fsb6dHbfuW4Kd2AzZ3o5ZYIbWyi75tWmuy/9HkH/He/S98d+XIfmcejQexvyoIWrSYl3zvicDNy3up3nHWZmxAMDI+dcHC84Rul/Sgfc6rb4V7zET16h0pmjvt90L6+qeLtiw2HJjBps3tPWVMh5aVB6t6xiJcPOTJmTveIcCml8MwIZTpvuyBSkwxaKckleLbLWieq2ah1gmAcF9bCjTU1Hnb/tUMMC4tNulTa3knAGM7BhMqhZq9FacYweHKUFDTGnBrcDaZp6Y90cfkqGe+MjDhx5tPZLhOj/7Z5y3vYyYgGEb56cfcGOvmmLDQk6rZ419tOkkm0erE3/qjI0wJD4LdkylbhSpH9X29kHFmVfwKx/UDZuxlvBUorax5xzbuzfkX9ylvZwK8eK1uMBkeQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(261009221227099003)(261009221727099003)(261009220027099003)(261009223027099003)(261009223327099003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(22082099003)(18002099003)(6133799003)(12006099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PToxGHyt+SOXC9M8ZrLm07pLxYKWPtbPDVsy79U09iV8woTHMu4rUb4UPkiY?=
 =?us-ascii?Q?YorYhmN9S9Q0lpFQTYi/DeE76mpb7D3qQHSHCpru/qUlPdbFjpoPPkfDz84h?=
 =?us-ascii?Q?vqciqneUlf30TpV+rGG9tSnNnlvZl9cwNabwcnNxf610a/9ieqj1P4xmrTAr?=
 =?us-ascii?Q?H+9kbBYUMR0lPxBapbwpNoS2oZolLWCPqvi1JJEsOizlwZP2GsFx/pJ4NOFS?=
 =?us-ascii?Q?Oq6u+yklDz/51m6geQnioX2sehfQyckAQaDzZTuwB0TGpPYI/pDrXxuE7azh?=
 =?us-ascii?Q?rZ0V/XWDcQAPIs/eYKOTC+W1PTb3zivuXbAkoNQ04DLUUh4sI78KzSwmlR/U?=
 =?us-ascii?Q?HTO/9LC9dyaqKLJlOUbxVIpbi5cCCZi5by7nLvx+Os53lMjWriVw4PkRWM3F?=
 =?us-ascii?Q?5EsoiMNZK/yQ6vYSclibAmu+k8UF/Ql8kpzsJk+dCEtEopyZwKYjTbPS3/Xb?=
 =?us-ascii?Q?Sdt14p6jgy0S0tjUKpvSm730ZdF/qBLGaV+/o8Az5N2ZgfPiRlan6gYQYH1D?=
 =?us-ascii?Q?+hOpM1c2Xwlj3JMRPmsXAu8tk15LvSFK/3fWLSFhUbrnUNDn88VXIpn+Zupm?=
 =?us-ascii?Q?vENxb6VnjfX1IV1oRN5NGeWV8JOSKMCKzG1jo3zD6KT/fzzYUhGbQJGEvzP+?=
 =?us-ascii?Q?j839K2EASO2wY0FdjjQpR/wXeGsHRYmvhSmFpJjlMBmn1yjgmWc4pd41EFWE?=
 =?us-ascii?Q?yKxz7luECqbzl55vPeuh5E2sL+FTOkx3cKN4XdKplBhO9rr7S+8ZGct4ce0S?=
 =?us-ascii?Q?53WsE07/vaxYXxkHAl2wW65cBjOECoBbG9Bb9CjQPCDoxM4Ikl+T1nq/fi/Z?=
 =?us-ascii?Q?Bu6OxfgjiJYQU6AxbNAF1dD4ndCPKhRGNGxO0AJPeYG7we+GH44Q7lsH7H3s?=
 =?us-ascii?Q?xBNy6aiQvHhcAtdr3bgf3OFc6T1afdG0Rc45+kXoD0QIPUe5NHjBt/UrxEqX?=
 =?us-ascii?Q?K0nXu0QwC2UYvFgppiRTjnUv9BmnBw0Xzdf9QwVMQAxwKmwh903OZsvVgKdf?=
 =?us-ascii?Q?P0eQuOHN51OYdFb9h6L9j9gG5jSOxcRCfOrDV81sZMCLMqF/U4BgxrfvOfyk?=
 =?us-ascii?Q?s7WS2IMN2Y58itItHdGz+ocW2KJIiZT4B4cXZlROmtSKsddbc3dKDLNb9GHP?=
 =?us-ascii?Q?pdPtu3Z503xKw0vzZXwts0KfU0Mbe9giGfLpBzPgmLDgcYllu1dQpVUJRJE5?=
 =?us-ascii?Q?F4dSq8s7WVGEC8v04d8bOXOBJdz/npHkKTsJLHXpgf6xybO+TFvOW7nEVaIJ?=
 =?us-ascii?Q?it/FKUC89eXDePSk2eBF5bFErx7lXEaj6vialRXv3hGbqvEgXkFTL0K7vsR7?=
 =?us-ascii?Q?A8W9TD2Aov/cZ9s+OrTqZPo0Utav5PO7OXPp2Zrg/BPdvKwXikm9Am/W//DG?=
 =?us-ascii?Q?81XL5U0FQVyRZyCHOE+IV5+e0JtpUIUH3KJD6Wg8OFGDc8jeaJ1GTqtxzSFv?=
 =?us-ascii?Q?+v3b3DFwjsHDiNhUuFpfeUpzuxPOu8x5PBS/Kbh54uEJAi5RLifEw2rKRskK?=
 =?us-ascii?Q?hGbdPqLa7waOZInuFsFgH67iBnf5dfRdEuHt3zYZz2zGV7qTnNRXWJazE5h5?=
 =?us-ascii?Q?7opUPu2/HDqLxcAhT7VFvsSmRCtBrEa+JO0rjk4syHVdtLhtknl4vwTZj83x?=
 =?us-ascii?Q?Ko7+uGtQ5Rd713lF1CWdDd8UhUb5EFXq4iofVh770qiukoM5CEQbIIM3lHkG?=
 =?us-ascii?Q?q7nuVFZQN00MLak/lto8oozbyjQ24xZ8AvIoNMGpbgvLxcbcKb/Jkpp5Ibms?=
 =?us-ascii?Q?m8vfxUbn5A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: df8641fc-d1e5-4ba2-7a1e-08df283f4670
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:00:34.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCdpbMhRan4/bn9p0XydWhFpHYhwBMvUqS8fqNrNG5pAs3hpIUJtCjWx/r1xmR46cF+pQkfHjfhwRK/f7Ilz+3jEWZv5cwL14bFEOX0wp/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2719
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 09:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247617

ReleaseNotes: https://docs.python.org/3/whatsnew/changelog.html#python-3-15=
-0-final

- Drop patches which are part of upstream release
  - 0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
  - 0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
  - 0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
  - valid-dists.patch
- Add mpdecimal dependency and --with-system-libmpdec configure option
- Bump PYTHON_BASEVERSION to 3.15 in python3-dir.bbclass
- Refresh existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/classes-recipe/python3-dir.bbclass       |   2 +-
 ...shebang-overflow-on-python-config.py.patch |   2 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   2 +-
 ...-use-prefix-value-from-build-configu.patch |   2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   2 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   2 +-
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 257 ------------------
 .../0001-prefer-valid-entrypoints.patch       |   2 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   2 +-
 ...le.py-correct-the-test-output-format.patch |   2 +-
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch | 234 ----------------
 ...utdown-test-in-test_ssl.test_got_eof.patch |  41 ---
 .../python/python3/makerace.patch             |   2 +-
 .../python/python3/valid-dists.patch          | 164 -----------
 .../{python3_3.14.7.bb =3D> python3_3.15.0.bb}  |  11 +-
 15 files changed, 14 insertions(+), 713 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-146207-Add=
-support-for-OpenSSL-4.0.0.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0002-gh-148292-Upd=
ate-_ssl._SSLSocket-for-OpenSSL-4.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0003-gh-148292-Rem=
ove-shutdown-test-in-test_ssl.test_got_eof.patch
 delete mode 100644 meta/recipes-devtools/python/python3/valid-dists.patch
 rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D> python3_3.15.0=
.bb} (98%)

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/=
python3-dir.bbclass
index 3eb0dea9b2..b26621f365 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-PYTHON_BASEVERSION =3D "3.14"
+PYTHON_BASEVERSION =3D "3.15"
 PYTHON_ABI =3D ""
 PYTHON_DIR =3D "python${PYTHON_BASEVERSION}"
 PYTHON_PN =3D "python3"
diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overfl=
ow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Av=
oid-shebang-overflow-on-python-config.py.patch
index 7a60538364..47ac29f209 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-p=
ython-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-p=
ython-config.py.patch
@@ -1,4 +1,4 @@
-From 3f2df0e1fce8c7425998dade00d084f1b101a982 Mon Sep 17 00:00:00 2001
+From b19edb306e2c035536a904c82c2fb4b18f529cf2 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-st=
din-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index 532adfe69a..cc2fdf4bb8 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O=
-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O=
-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From 9cd44429215352eb2753e0fd8e25fef24f714006 Mon Sep 17 00:00:00 2001
+From cb744d2ccf74d5ef21fa496a418d2963df28a38f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/=
O
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use=
-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 60391e726b..0fce0fc027 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix=
-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix=
-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From b5aad6a9b6c5add7a85861aed8aa030c1ad3d52f Mon Sep 17 00:00:00 2001
+From 5bd6a3c5f957cacdf51e07ae94c74fbf6e7f0f28 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configurati=
on
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qem=
u-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index c7f14cad1e..d83d00e0cf 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapp=
er-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapp=
er-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From d6f77e3a934616d1f6c083b7144c50a32e08b70a Mon Sep 17 00:00:00 2001
+From 64a42f1a618be7af4e5d31ffbeeb4169bad865a9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile dat=
a
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfi=
g-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-=
Update-test_sysconfig-for-posix_user-purelib.patch
index 5509b7475a..95d7e4bd07 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-p=
osix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-p=
osix_user-purelib.patch
@@ -1,4 +1,4 @@
-From c608cb4b3c8c31f1aa25ad1264ff58733fb99769 Mon Sep 17 00:00:00 2001
+From 2cca08e2cb4be0a725c4c9ea76234bfea5a8534c Mon Sep 17 00:00:00 2001
 From: Wentao Zhang <wentao.zhang@windriver.com>
 Date: Mon, 20 Mar 2023 13:39:52 +0800
 Subject: [PATCH] Update test_sysconfig for posix_user purelib
diff --git a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-suppor=
t-for-OpenSSL-4.0.0.patch b/meta/recipes-devtools/python/python3/0001-gh-14=
6207-Add-support-for-OpenSSL-4.0.0.patch
deleted file mode 100644
index bef6044358..0000000000
--- a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-O=
penSSL-4.0.0.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From 3364e7e62fa24d0e19133fb0f90b1c24ef1110c5 Mon Sep 17 00:00:00 2001
-From: Victor Stinner <vstinner@python.org>
-Date: Wed, 25 Mar 2026 07:44:47 +0100
-Subject: [PATCH] gh-146207: Add support for OpenSSL 4.0.0 alpha1 (#146217)
-
-OpenSSL 4.0.0 alpha1 removed these functions:
-
-* SSLv3_method()
-* TLSv1_method()
-* TLSv1_1_method()
-* TLSv1_2_method()
-
-Other changes:
-
-* Update test_openssl_version().
-* Update multissltests.py for OpenSSL 4.
-* Add const qualifier to fix compiler warnings.
-
-Co-authored-by: B=C3=A9n=C3=A9dikt Tran <10796600+picnixz@users.noreply.gi=
thub.com>
-Signed-off-by: Victor Stinner <vstinner@python.org>
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/3364e7=
e62fa24d0e19133fb0f90b1c24ef1110c5]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- Lib/test/test_ssl.py       | 52 ++++++++++++++++++++------------------
- Modules/_ssl.c             | 27 ++++++++++++++++----
- Modules/_ssl/cert.c        |  3 ++-
- Tools/ssl/multissltests.py |  7 ++++-
- 4 files changed, 58 insertions(+), 31 deletions(-)
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index dc795c6bd8a..61355927296 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -395,7 +395,7 @@ def test_constants(self):
-         ssl.OP_NO_COMPRESSION
-         self.assertEqual(ssl.HAS_SNI, True)
-         self.assertEqual(ssl.HAS_ECDH, True)
--        self.assertEqual(ssl.HAS_TLSv1_2, True)
-+        self.assertIsInstance(ssl.HAS_TLSv1_2, bool)
-         self.assertEqual(ssl.HAS_TLSv1_3, True)
-         ssl.OP_NO_SSLv2
-         ssl.OP_NO_SSLv3
-@@ -586,11 +586,11 @@ def test_openssl_version(self):
-         # Some sanity checks follow
-         # >=3D 1.1.1
-         self.assertGreaterEqual(n, 0x10101000)
--        # < 4.0
--        self.assertLess(n, 0x40000000)
-+        # < 5.0
-+        self.assertLess(n, 0x50000000)
-         major, minor, fix, patch, status =3D t
-         self.assertGreaterEqual(major, 1)
--        self.assertLess(major, 4)
-+        self.assertLess(major, 5)
-         self.assertGreaterEqual(minor, 0)
-         self.assertLess(minor, 256)
-         self.assertGreaterEqual(fix, 0)
-@@ -656,12 +656,14 @@ def test_openssl111_deprecations(self):
-             ssl.OP_NO_TLSv1_2,
-             ssl.OP_NO_TLSv1_3
-         ]
--        protocols =3D [
--            ssl.PROTOCOL_TLSv1,
--            ssl.PROTOCOL_TLSv1_1,
--            ssl.PROTOCOL_TLSv1_2,
--            ssl.PROTOCOL_TLS
--        ]
-+        protocols =3D []
-+        if hasattr(ssl, 'PROTOCOL_TLSv1'):
-+            protocols.append(ssl.PROTOCOL_TLSv1)
-+        if hasattr(ssl, 'PROTOCOL_TLSv1_1'):
-+            protocols.append(ssl.PROTOCOL_TLSv1_1)
-+        if hasattr(ssl, 'PROTOCOL_TLSv1_2'):
-+            protocols.append(ssl.PROTOCOL_TLSv1_2)
-+        protocols.append(ssl.PROTOCOL_TLS)
-         versions =3D [
-             ssl.TLSVersion.SSLv3,
-             ssl.TLSVersion.TLSv1,
-@@ -1205,6 +1207,7 @@ def test_min_max_version(self):
-                 ssl.TLSVersion.TLSv1,
-                 ssl.TLSVersion.TLSv1_1,
-                 ssl.TLSVersion.TLSv1_2,
-+                ssl.TLSVersion.TLSv1_3,
-                 ssl.TLSVersion.SSLv3,
-             }
-         )
-@@ -1218,7 +1221,7 @@ def test_min_max_version(self):
-         with self.assertRaises(ValueError):
-             ctx.minimum_version =3D 42
-=20
--        if has_tls_protocol(ssl.PROTOCOL_TLSv1_1):
-+        if has_tls_protocol('PROTOCOL_TLSv1_1'):
-             ctx =3D ssl.SSLContext(ssl.PROTOCOL_TLSv1_1)
-=20
-             self.assertIn(
-@@ -1675,23 +1678,24 @@ def test__create_stdlib_context(self):
-         self.assertFalse(ctx.check_hostname)
-         self._assert_context_options(ctx)
-=20
--        if has_tls_protocol(ssl.PROTOCOL_TLSv1):
-+        if has_tls_protocol('PROTOCOL_TLSv1'):
-             with warnings_helper.check_warnings():
-                 ctx =3D ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1)
-             self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
-             self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
-             self._assert_context_options(ctx)
-=20
--        with warnings_helper.check_warnings():
--            ctx =3D ssl._create_stdlib_context(
--                ssl.PROTOCOL_TLSv1_2,
--                cert_reqs=3Dssl.CERT_REQUIRED,
--                check_hostname=3DTrue
--            )
--        self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1_2)
--        self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
--        self.assertTrue(ctx.check_hostname)
--        self._assert_context_options(ctx)
-+        if has_tls_protocol('PROTOCOL_TLSv1_2'):
-+            with warnings_helper.check_warnings():
-+                ctx =3D ssl._create_stdlib_context(
-+                    ssl.PROTOCOL_TLSv1_2,
-+                    cert_reqs=3Dssl.CERT_REQUIRED,
-+                    check_hostname=3DTrue
-+                )
-+            self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1_2)
-+            self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
-+            self.assertTrue(ctx.check_hostname)
-+            self._assert_context_options(ctx)
-=20
-         ctx =3D ssl._create_stdlib_context(purpose=3Dssl.Purpose.CLIENT_A=
UTH)
-         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLS_SERVER)
-@@ -3654,10 +3658,10 @@ def test_protocol_tlsv1_2(self):
-                            client_options=3Dssl.OP_NO_TLSv1_2)
-=20
-         try_protocol_combo(ssl.PROTOCOL_TLS, ssl.PROTOCOL_TLSv1_2, 'TLSv1=
.2')
--        if has_tls_protocol(ssl.PROTOCOL_TLSv1):
-+        if has_tls_protocol('PROTOCOL_TLSv1'):
-             try_protocol_combo(ssl.PROTOCOL_TLSv1_2, ssl.PROTOCOL_TLSv1, =
False)
-             try_protocol_combo(ssl.PROTOCOL_TLSv1, ssl.PROTOCOL_TLSv1_2, =
False)
--        if has_tls_protocol(ssl.PROTOCOL_TLSv1_1):
-+        if has_tls_protocol('PROTOCOL_TLSv1_1'):
-             try_protocol_combo(ssl.PROTOCOL_TLSv1_2, ssl.PROTOCOL_TLSv1_1=
, False)
-             try_protocol_combo(ssl.PROTOCOL_TLSv1_1, ssl.PROTOCOL_TLSv1_2=
, False)
-=20
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index b45295b4c0c..6f75af86113 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -164,6 +164,17 @@ static void _PySSLFixErrno(void) {
- #error Unsupported OpenSSL version
- #endif
-=20
-+#if (OPENSSL_VERSION_NUMBER >=3D 0x40000000L)
-+#  define OPENSSL_NO_SSL3
-+#  define OPENSSL_NO_TLS1
-+#  define OPENSSL_NO_TLS1_1
-+#  define OPENSSL_NO_TLS1_2
-+#  define OPENSSL_NO_SSL3_METHOD
-+#  define OPENSSL_NO_TLS1_METHOD
-+#  define OPENSSL_NO_TLS1_1_METHOD
-+#  define OPENSSL_NO_TLS1_2_METHOD
-+#endif
-+
- /* OpenSSL API 1.1.0+ does not include version methods */
- #ifndef OPENSSL_NO_SSL3_METHOD
- extern const SSL_METHOD *SSLv3_method(void);
-@@ -1151,7 +1162,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJEC=
T *name, int no_name)
-=20
- static PyObject *
- _create_tuple_for_attribute(_sslmodulestate *state,
--                            ASN1_OBJECT *name, ASN1_STRING *value)
-+                            const ASN1_OBJECT *name, const ASN1_STRING *v=
alue)
- {
-     Py_ssize_t buflen;
-     PyObject *pyattr;
-@@ -1180,16 +1191,16 @@ _create_tuple_for_attribute(_sslmodulestate *state=
,
- }
-=20
- static PyObject *
--_create_tuple_for_X509_NAME (_sslmodulestate *state, X509_NAME *xname)
-+_create_tuple_for_X509_NAME(_sslmodulestate *state, const X509_NAME *xnam=
e)
- {
-     PyObject *dn =3D NULL;    /* tuple which represents the "distinguishe=
d name" */
-     PyObject *rdn =3D NULL;   /* tuple to hold a "relative distinguished =
name" */
-     PyObject *rdnt;
-     PyObject *attr =3D NULL;   /* tuple to hold an attribute */
-     int entry_count =3D X509_NAME_entry_count(xname);
--    X509_NAME_ENTRY *entry;
--    ASN1_OBJECT *name;
--    ASN1_STRING *value;
-+    const X509_NAME_ENTRY *entry;
-+    const ASN1_OBJECT *name;
-+    const ASN1_STRING *value;
-     int index_counter;
-     int rdn_level =3D -1;
-     int retcode;
-@@ -6967,9 +6978,15 @@ sslmodule_init_constants(PyObject *m)
-     ADD_INT_CONST("PROTOCOL_TLS", PY_SSL_VERSION_TLS);
-     ADD_INT_CONST("PROTOCOL_TLS_CLIENT", PY_SSL_VERSION_TLS_CLIENT);
-     ADD_INT_CONST("PROTOCOL_TLS_SERVER", PY_SSL_VERSION_TLS_SERVER);
-+#ifndef OPENSSL_NO_TLS1
-     ADD_INT_CONST("PROTOCOL_TLSv1", PY_SSL_VERSION_TLS1);
-+#endif
-+#ifndef OPENSSL_NO_TLS1_1
-     ADD_INT_CONST("PROTOCOL_TLSv1_1", PY_SSL_VERSION_TLS1_1);
-+#endif
-+#ifndef OPENSSL_NO_TLS1_2
-     ADD_INT_CONST("PROTOCOL_TLSv1_2", PY_SSL_VERSION_TLS1_2);
-+#endif
-=20
- #define ADD_OPTION(NAME, VALUE) if (sslmodule_add_option(m, NAME, (VALUE)=
) < 0) return -1
-=20
-diff --git a/Modules/_ssl/cert.c b/Modules/_ssl/cert.c
-index f2e7be89668..061b0fb3171 100644
---- a/Modules/_ssl/cert.c
-+++ b/Modules/_ssl/cert.c
-@@ -128,7 +128,8 @@ _ssl_Certificate_get_info_impl(PySSLCertificate *self)
- }
-=20
- static PyObject*
--_x509name_print(_sslmodulestate *state, X509_NAME *name, int indent, unsi=
gned long flags)
-+_x509name_print(_sslmodulestate *state, const X509_NAME *name,
-+                int indent, unsigned long flags)
- {
-     PyObject *res;
-     BIO *biobuf;
-diff --git a/Tools/ssl/multissltests.py b/Tools/ssl/multissltests.py
-index 3b4507c6771..48207e5330f 100755
---- a/Tools/ssl/multissltests.py
-+++ b/Tools/ssl/multissltests.py
-@@ -429,9 +429,11 @@ def _post_install(self):
-     def _post_install(self):
-         if self.version.startswith("3."):
-             self._post_install_3xx()
-+        elif self.version.startswith("4."):
-+            self._post_install_4xx()
-=20
-     def _build_src(self, config_args=3D()):
--        if self.version.startswith("3."):
-+        if self.version.startswith(("3.", "4.")):
-             config_args +=3D ("enable-fips",)
-         super()._build_src(config_args)
-=20
-@@ -447,6 +449,9 @@ def _post_install_3xx(self):
-             lib64 =3D self.lib_dir + "64"
-             os.symlink(lib64, self.lib_dir)
-=20
-+    def _post_install_4xx(self):
-+        self._post_install_3xx()
-+
-     @property
-     def short_version(self):
-         """Short version for OpenSSL download URL"""
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypo=
ints.patch b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypo=
ints.patch
index ae3698fac4..030f82f99b 100644
--- a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.pa=
tch
+++ b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.pa=
tch
@@ -1,4 +1,4 @@
-From 8d7fcf04c6513841c7985e64b746b1ef5de0c426 Mon Sep 17 00:00:00 2001
+From 8889d373f2218253555d69b9ad022f52bc4ad78d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Apr 2026 16:53:42 +0100
 Subject: [PATCH] prefer valid entrypoints
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-pla=
tlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-=
sysconfig.py-use-platlibdir-also-for-purelib.patch
index 7807827d9a..3ac97d348b 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir=
-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir=
-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From c10d1b295a9fb93836830cce441da3f22e5c7cd7 Mon Sep 17 00:00:00 2001
+From 31ca770452781c56c19b98e584db3bc964116b44 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-corre=
ct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001=
-test_locale.py-correct-the-test-output-format.patch
index a60d082e2f..8e72a374d9 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-=
test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-=
test-output-format.patch
@@ -1,4 +1,4 @@
-From f0ac5b479b99bfb7f5e937a941b31a596f4caafc Mon Sep 17 00:00:00 2001
+From a712d1ebb55ac8e5801a5c2179945ce26638a548 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
diff --git a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ss=
l._SSLSocket-for-OpenSSL-4.patch b/meta/recipes-devtools/python/python3/000=
2-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
deleted file mode 100644
index 587f141dd4..0000000000
--- a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLS=
ocket-for-OpenSSL-4.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-From 3c2a3014af7d73cc34f2498f60fdf863d9bc7c6c Mon Sep 17 00:00:00 2001
-From: Victor Stinner <vstinner@python.org>
-Date: Mon, 4 May 2026 13:52:57 +0200
-Subject: [PATCH] gh-148292: Update _ssl._SSLSocket for OpenSSL 4 (#149102)
-
-The _SSLSocket object now remembers if it gets an EOF error. In this
-case, read(), sendfile(), write() and do_handshake method calls fail
-with SSLEOFError without calling the underlying OpenSSL function.
-
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-(cherry picked from commit 7b7fa3f9bf3d7cdf3eb669d02b386e05b39c402a)
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/3c2a30=
14af7d]
-
-Note: This is from the unmerged CPython PR #149783 which backports
-OpenSSL 4.0 support to the 3.14 branch. Upstream deferred merging
-until after Python 3.15.1 is released.
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- Lib/test/test_ssl.py                          | 82 +++++++++++++++++++
- ...-04-28-17-47-55.gh-issue-148292.oIq3ml.rst |  7 ++
- Modules/_ssl.c                                | 42 ++++++++++
- 3 files changed, 131 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-=
148292.oIq3ml.rst
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index 965dbc36f096499..03d9e3f9e5e96b5 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -2711,6 +2711,36 @@ def close(self):
-     def stop(self):
-         self.active =3D False
-=20
-+class TestEOFServer(threading.Thread):
-+    def __init__(self):
-+        super().__init__()
-+        self.listening =3D threading.Event()
-+        self.address =3D None
-+
-+    def run(self):
-+        context =3D ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
-+        context.load_cert_chain(CERTFILE)
-+        server_sock =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-+        with server_sock:
-+            server_sock.settimeout(support.SHORT_TIMEOUT)
-+            server_sock.bind((HOST, 0))
-+            server_sock.listen(5)
-+
-+            self.address =3D server_sock.getsockname()
-+            self.listening.set()
-+
-+            sock, addr =3D server_sock.accept()
-+            sslconn =3D context.wrap_socket(sock, server_side=3DTrue)
-+            with sslconn:
-+                request =3D b''
-+                while chunk :=3D sslconn.recv(1024):
-+                    request +=3D chunk
-+                    if b'\n' in chunk:
-+                        break
-+
-+                sslconn.sendall(b'server\n')
-+                sslconn.shutdown(socket.SHUT_WR)
-+
- class AsyncoreEchoServer(threading.Thread):
-=20
-     # this one's based on asyncore.dispatcher
-@@ -4747,6 +4777,58 @@ def background(sock):
-                     if cm.exc_value is not None:
-                         raise cm.exc_value
-=20
-+    def test_got_eof(self):
-+        # gh-148292: Test that _ssl._SSLSocket behaves the same on all Op=
enSSL
-+        # versions on calling methods after EOF (after the first SSLEOFEr=
ror).
-+
-+        server =3D TestEOFServer()
-+        server.start()
-+        if not server.listening.wait(support.SHORT_TIMEOUT):
-+            raise RuntimeError("server took too long")
-+        self.addCleanup(server.join)
-+
-+        context =3D ssl.create_default_context(cafile=3DCERTFILE)
-+        sock =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-+        sock.settimeout(support.SHORT_TIMEOUT)
-+        sock.connect(server.address)
-+        sslsock =3D context.wrap_socket(sock, server_hostname=3D'localhos=
t')
-+        with sslsock:
-+            sslsock.sendall(b'client\n')
-+            # test the _ssl._SSLSocket object, not ssl.SSLSocket
-+            sslobj =3D sslsock._sslobj
-+
-+            data =3D sslobj.read(1024)
-+            self.assertEqual(data, b'server\n')
-+
-+            # The second read gets EOF error and sets got_eof_error to 1
-+            with self.assertRaises(ssl.SSLEOFError):
-+                sslobj.read(1024)
-+
-+            # Following read(), sendfile(), write() and do_handshake() ca=
lls
-+            # must raise SSLEOFError
-+            with self.assertRaises(ssl.SSLEOFError):
-+                # The _SSLSocket remembers the previous EOF error
-+                # and raises again SSLEOFError
-+                sslobj.read(1024)
-+            if hasattr(sslobj, 'sendfile'):
-+                with open(__file__, "rb") as fp:
-+                    with self.assertRaises(ssl.SSLEOFError):
-+                        sslobj.sendfile(fp.fileno(), 0, 1)
-+            with self.assertRaises(ssl.SSLEOFError):
-+                sslobj.write(b'client2\n')
-+            with self.assertRaises(ssl.SSLEOFError):
-+                sslsock.do_handshake()
-+
-+            self.assertEqual(sslsock.pending(), 0)
-+            try:
-+                sslsock.shutdown(socket.SHUT_WR)
-+            except OSError as exc:
-+                self.assertEqual(exc.errno, errno.ENOTCONN)
-+            else:
-+                # On Windows and on OpenSSL 1.1.1, shutdown() doesn't
-+                # raise an error
-+                pass
-+
-=20
- @unittest.skipUnless(has_tls_version('TLSv1_3') and ssl.HAS_PHA,
-                      "Test needs TLS 1.3 PHA")
-diff --git a/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.=
oIq3ml.rst b/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.o=
Iq3ml.rst
-new file mode 100644
-index 000000000000000..e1f308df5a678e6
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.oIq3ml.=
rst
-@@ -0,0 +1,7 @@
-+:mod:`ssl`: Update :class:`ssl.SSLSocket` and :class:`ssl.SSLObject` for
-+OpenSSL 4. The classes now remember if they get a :exc:`ssl.SSLEOFError`.=
 In this
-+case, following :meth:`~ssl.SSLSocket.read`, :meth:`!sendfile`,
-+:meth:`~ssl.SSLSocket.write`, and :meth:`~ssl.SSLSocket.do_handshake` cal=
ls
-+raise :exc:`ssl.SSLEOFError` without calling the underlying OpenSSL funct=
ion.
-+Thanks to that, :class:`ssl.SSLSocket` behaves the same on all OpenSSL ve=
rsions
-+on EOF.  Patch by Victor Stinner.
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index 1603d0ffd559559..376df32b7cb4bd6 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -352,6 +352,16 @@ typedef struct {
-      * and shutdown methods check for chained exceptions.
-      */
-     PyObject *exc;
-+    // gh-148292: If non-zero, read(), sendfile(), write() and do_handsha=
ke()
-+    // methods raise SSLEOFError without calling the underlying OpenSSL
-+    // function. Set to 1 on PY_SSL_ERROR_EOF error.
-+    //
-+    // On OpenSSL 4, if SSL_read_ex() fails with
-+    // SSL_R_UNEXPECTED_EOF_WHILE_READING, the following SSL_read_ex() ca=
ll
-+    // fails with a generic protocol error (ERR_peek_last_error() returns=
 0).
-+    // Use got_eof_error to have the same behavior on OpenSSL 4 and newer=
 and
-+    // on OpenSSL 3 and older.
-+    int got_eof_error;
- } PySSLSocket;
-=20
- #define PySSLSocket_CAST(op)    ((PySSLSocket *)(op))
-@@ -499,6 +509,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
-     PyObject *init_value, *msg, *key;
-     PyUnicodeWriter *writer =3D NULL;
-=20
-+    if (ssl_errno =3D=3D PY_SSL_ERROR_EOF && sslsock !=3D NULL) {
-+        sslsock->got_eof_error =3D 1;
-+    }
-+
-     if (errcode !=3D 0) {
-         int lib, reason;
-=20
-@@ -654,6 +668,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
-     return -1;
- }
-=20
-+
-+static void
-+set_eof_error(PySSLSocket *sslsock)
-+{
-+    _sslmodulestate *state =3D get_state_sock(sslsock);
-+    fill_and_set_sslerror(state, sslsock, state->PySSLEOFErrorObject,
-+                          PY_SSL_ERROR_EOF,
-+                          "EOF occurred in violation of protocol",
-+                          __LINE__, 0);
-+}
-+
-+
- static PyObject *
- PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
- {
-@@ -901,6 +927,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObjec=
t *sock,
-     self->server_hostname =3D NULL;
-     self->err =3D err;
-     self->exc =3D NULL;
-+    self->got_eof_error =3D 0;
-=20
-     /* Make sure the SSL error state is initialized */
-     ERR_clear_error();
-@@ -1041,6 +1068,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *self=
)
-         BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
-     }
-=20
-+    if (self->got_eof_error) {
-+        set_eof_error(self);
-+        goto error;
-+    }
-+
-     timeout =3D GET_SOCKET_TIMEOUT(sock);
-     has_timeout =3D (timeout > 0);
-     if (has_timeout) {
-@@ -2504,6 +2536,11 @@ _ssl__SSLSocket_write_impl(PySSLSocket *self, Py_bu=
ffer *b)
-         BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
-     }
-=20
-+    if (self->got_eof_error) {
-+        set_eof_error(self);
-+        goto error;
-+    }
-+
-     timeout =3D GET_SOCKET_TIMEOUT(sock);
-     has_timeout =3D (timeout > 0);
-     if (has_timeout) {
-@@ -2644,6 +2681,11 @@ _ssl__SSLSocket_read_impl(PySSLSocket *self, Py_ssi=
ze_t len,
-         Py_INCREF(sock);
-     }
-=20
-+    if (self->got_eof_error) {
-+        set_eof_error(self);
-+        goto error;
-+    }
-+
-     if (!group_right_1) {
-         dest =3D PyBytes_FromStringAndSize(NULL, len);
-         if (dest =3D=3D NULL)
diff --git a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shu=
tdown-test-in-test_ssl.test_got_eof.patch b/meta/recipes-devtools/python/py=
thon3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
deleted file mode 100644
index af067f549c..0000000000
--- a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-t=
est-in-test_ssl.test_got_eof.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 81911909bc439d6de8ce6a173b0691b3c58e9e1a Mon Sep 17 00:00:00 2001
-From: Victor Stinner <vstinner@python.org>
-Date: Mon, 4 May 2026 16:20:25 +0200
-Subject: [PATCH] gh-148292: Remove shutdown() test in test_ssl.test_got_eo=
f()
- (#149366)
-
-The shutdown() behavior depends too much on the operating system and
-it's unrelated to the got_eof_error change.
-
-(cherry picked from commit 1e21cf6fee3830012e458c0fe5dbc6fcd45ace92)
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/819119=
09bc43]
-
-Note: This is from the unmerged CPython PR #149783 which backports
-OpenSSL 4.0 support to the 3.14 branch. Upstream deferred merging
-until after Python 3.15.1 is released.
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- Lib/test/test_ssl.py | 8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index 03d9e3f9e5e96b5..6445f122b4272be 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -4820,14 +4820,6 @@ def test_got_eof(self):
-                 sslsock.do_handshake()
-=20
-             self.assertEqual(sslsock.pending(), 0)
--            try:
--                sslsock.shutdown(socket.SHUT_WR)
--            except OSError as exc:
--                self.assertEqual(exc.errno, errno.ENOTCONN)
--            else:
--                # On Windows and on OpenSSL 1.1.1, shutdown() doesn't
--                # raise an error
--                pass
-=20
-=20
- @unittest.skipUnless(has_tls_version('TLSv1_3') and ssl.HAS_PHA,
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/rec=
ipes-devtools/python/python3/makerace.patch
index 248a521118..c6c01332ce 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From b41557f570ff4451c477669d6ca5bfacabe21c66 Mon Sep 17 00:00:00 2001
+From 7b796f0e8953a9c9e9402c8c60eccc19a33874a9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
diff --git a/meta/recipes-devtools/python/python3/valid-dists.patch b/meta/=
recipes-devtools/python/python3/valid-dists.patch
deleted file mode 100644
index 7fe18254e5..0000000000
--- a/meta/recipes-devtools/python/python3/valid-dists.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 66874ce1a9f21b4b00dc85919734d58e6243ca29 Mon Sep 17 00:00:00 2001
-From: "Jason R. Coombs" <jaraco@jaraco.com>
-Date: Tue, 23 Jul 2024 08:36:16 -0400
-Subject: [PATCH] Prioritize valid dists to invalid dists when retrieving b=
y
- name.
-
-Closes python/importlib_metadata#489
-
-Upstream-Status: Backport [https://github.com/python/importlib_metadata/co=
mmit/a65c29adc027b3615154cab73aaedd58a6aa23da]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- Lib/importlib/metadata/__init__.py   | 14 +++-
- Lib/importlib/metadata/_itertools.py | 98 ++++++++++++++++++++++++++++
- 2 files changed, 110 insertions(+), 2 deletions(-)
-
-diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata/_=
_init__.py
-index 8ce62dd..085378c 100644
---- a/Lib/importlib/metadata/__init__.py
-+++ b/Lib/importlib/metadata/__init__.py
-@@ -21,7 +21,7 @@ import collections
- from . import _meta
- from ._collections import FreezableDefaultDict, Pair
- from ._functools import method_cache, pass_none
--from ._itertools import always_iterable, unique_everseen
-+from ._itertools import always_iterable, bucket, unique_everseen
- from ._meta import PackageMetadata, SimplePath
-=20
- from contextlib import suppress
-@@ -404,7 +404,7 @@ class Distribution(DeprecatedNonAbstract):
-         if not name:
-             raise ValueError("A distribution name is required.")
-         try:
--            return next(iter(cls.discover(name=3Dname)))
-+            return next(iter(cls._prefer_valid(cls.discover(name=3Dname))=
))
-         except StopIteration:
-             raise PackageNotFoundError(name)
-=20
-@@ -428,6 +428,16 @@ class Distribution(DeprecatedNonAbstract):
-             resolver(context) for resolver in cls._discover_resolvers()
-         )
-=20
-+    @staticmethod
-+    def _prefer_valid(dists: Iterable[Distribution]) -> Iterable[Distribu=
tion]:
-+        """
-+        Prefer (move to the front) distributions that have metadata.
-+
-+        Ref python/importlib_resources#489.
-+        """
-+        buckets =3D bucket(dists, lambda dist: bool(dist.metadata))
-+        return itertools.chain(buckets[True], buckets[False])
-+
-     @staticmethod
-     def at(path: str | os.PathLike[str]) -> Distribution:
-         """Return a Distribution for the indicated metadata path.
-diff --git a/Lib/importlib/metadata/_itertools.py b/Lib/importlib/metadata=
/_itertools.py
-index d4ca9b9..79d3719 100644
---- a/Lib/importlib/metadata/_itertools.py
-+++ b/Lib/importlib/metadata/_itertools.py
-@@ -1,3 +1,4 @@
-+from collections import defaultdict, deque
- from itertools import filterfalse
-=20
-=20
-@@ -71,3 +72,100 @@ def always_iterable(obj, base_type=3D(str, bytes)):
-         return iter(obj)
-     except TypeError:
-         return iter((obj,))
-+
-+
-+# Copied from more_itertools 10.3
-+class bucket:
-+    """Wrap *iterable* and return an object that buckets the iterable int=
o
-+    child iterables based on a *key* function.
-+
-+        >>> iterable =3D ['a1', 'b1', 'c1', 'a2', 'b2', 'c2', 'b3']
-+        >>> s =3D bucket(iterable, key=3Dlambda x: x[0])  # Bucket by 1st=
 character
-+        >>> sorted(list(s))  # Get the keys
-+        ['a', 'b', 'c']
-+        >>> a_iterable =3D s['a']
-+        >>> next(a_iterable)
-+        'a1'
-+        >>> next(a_iterable)
-+        'a2'
-+        >>> list(s['b'])
-+        ['b1', 'b2', 'b3']
-+
-+    The original iterable will be advanced and its items will be cached u=
ntil
-+    they are used by the child iterables. This may require significant st=
orage.
-+
-+    By default, attempting to select a bucket to which no items belong  w=
ill
-+    exhaust the iterable and cache all values.
-+    If you specify a *validator* function, selected buckets will instead =
be
-+    checked against it.
-+
-+        >>> from itertools import count
-+        >>> it =3D count(1, 2)  # Infinite sequence of odd numbers
-+        >>> key =3D lambda x: x % 10  # Bucket by last digit
-+        >>> validator =3D lambda x: x in {1, 3, 5, 7, 9}  # Odd digits on=
ly
-+        >>> s =3D bucket(it, key=3Dkey, validator=3Dvalidator)
-+        >>> 2 in s
-+        False
-+        >>> list(s[2])
-+        []
-+
-+    """
-+
-+    def __init__(self, iterable, key, validator=3DNone):
-+        self._it =3D iter(iterable)
-+        self._key =3D key
-+        self._cache =3D defaultdict(deque)
-+        self._validator =3D validator or (lambda x: True)
-+
-+    def __contains__(self, value):
-+        if not self._validator(value):
-+            return False
-+
-+        try:
-+            item =3D next(self[value])
-+        except StopIteration:
-+            return False
-+        else:
-+            self._cache[value].appendleft(item)
-+
-+        return True
-+
-+    def _get_values(self, value):
-+        """
-+        Helper to yield items from the parent iterator that match *value*=
.
-+        Items that don't match are stored in the local cache as they
-+        are encountered.
-+        """
-+        while True:
-+            # If we've cached some items that match the target value, emi=
t
-+            # the first one and evict it from the cache.
-+            if self._cache[value]:
-+                yield self._cache[value].popleft()
-+            # Otherwise we need to advance the parent iterator to search =
for
-+            # a matching item, caching the rest.
-+            else:
-+                while True:
-+                    try:
-+                        item =3D next(self._it)
-+                    except StopIteration:
-+                        return
-+                    item_value =3D self._key(item)
-+                    if item_value =3D=3D value:
-+                        yield item
-+                        break
-+                    elif self._validator(item_value):
-+                        self._cache[item_value].append(item)
-+
-+    def __iter__(self):
-+        for item in self._it:
-+            item_value =3D self._key(item)
-+            if self._validator(item_value):
-+                self._cache[item_value].append(item)
-+
-+        yield from self._cache.keys()
-+
-+    def __getitem__(self, value):
-+        if not self._validator(value):
-+            return iter(())
-+
-+        return self._get_values(value)
diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-=
devtools/python/python3_3.15.0.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.14.7.bb
rename to meta/recipes-devtools/python/python3_3.15.0.bb
index f917edebd8..71a2973e20 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.15.0.bb
@@ -18,19 +18,15 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch =
\
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-mast=
e.patch \
-           file://valid-dists.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch =
\
            file://0001-prefer-valid-entrypoints.patch \
-           file://0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch \
-           file://0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patc=
h \
-           file://0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got=
_eof.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-config=
u.patch \
            "
=20
-SRC_URI[sha256sum] =3D "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e25=
2c11a66be27f81"
+SRC_URI[sha256sum] =3D "ba4bed1ba346b916890b76d9e320451420aa69f6408997d33c=
66482eeae3d575"
=20
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -41,7 +37,7 @@ inherit upstream-stable-release-point
=20
 CVE_PRODUCT =3D "python:python python_software_foundation:python cpython"
=20
-PYTHON_MAJMIN =3D "3.14"
+PYTHON_MAJMIN =3D "3.15"
=20
 S =3D "${UNPACKDIR}/Python-${PV}"
=20
@@ -61,6 +57,7 @@ DEPENDS =3D "\
     bzip2-replacement-native \
     expat \
     libffi \
+    mpdecimal \
     ncurses \
     openssl \
     sqlite3 \
@@ -75,7 +72,7 @@ DEPENDS =3D "\
 DEPENDS:append:class-target =3D " python3-native"
 DEPENDS:append:class-nativesdk =3D " python3-native"
=20
-EXTRA_OECONF =3D " --without-ensurepip --enable-shared --with-platlibdir=
=3D${baselib} --with-system-expat"
+EXTRA_OECONF =3D " --without-ensurepip --enable-shared --with-platlibdir=
=3D${baselib} --with-system-expat --with-system-libmpdec"
 EXTRA_OECONF:append:class-native =3D " --bindir=3D${bindir}/${PN}"
 EXTRA_OECONF:append:class-target =3D " --with-build-python=3Dnativepython3=
 PLATFORM_TRIPLET=3D${HOST_ARCH}-${HOST_OS}"
 EXTRA_OECONF:append:class-nativesdk =3D " --with-build-python=3Dnativepyth=
on3"

