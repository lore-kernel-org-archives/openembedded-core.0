Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17589EB270D
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 20:04:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23749.1770741108384020169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 08:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mNwaicSG;
 spf=pass (domain: est.tech, ip: 40.107.130.3, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRi2O3hSelvpIhmJvGdiCS/VN/4RNqz4tmp3l//DRXYSvAZbgfSYu5lKc3x7frgXpU7yLXAyPrYh6CRQBznFToUyPqC5C5A+HqgltyOV3AR2ztlZf/t3SGP0bZ88mhHAJLWYMQRAJeCZKV0IddHlv6cnie79gA767oUJqqZffLZ6FU3YFAdfq3OyPkzHZnSx2FTavMVWc7sizo6sf3YhmXzEr1EqciRb6EAdm9vCCzMIG70q4PwpiysCTJ6VKEVc6/dAuifVUdH0dv+C0rp0rPTZLHQ3NW8v/h07nkaMsXImKBwVLfrl+95Gr/usJYtHLKFTyFpI5fpwuRMe3WHb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4da5lcTU+smsom2NaQMKvKpZ2gQsTfRup+QeTWrc7Nc=;
 b=d1JS75cNr7owisR02MxOcOiXpUqixIswVcr/gxnS0JbLfXieiDRBoBI9XgDkaBsiHinMCAGFP7VC6HegKvX1dVefC9u90da6IJsdsUnaxcgCnepd41ElQvEz89Oa2ARAO4dYdW7KuwlumuCqUMx4B1U0PP+eH6CduSdDX0mjLC+EelquqJZ0zEfejz18QdQCoIC7/UmcfyP3E65dAMDfECqvez99xDdVOk9FMzeTptztWNwY2So22mDE0c2y3RQre9Afpmntx0CZ90wHVlraYp8I5WowZpzga004Q+jyDTD7yTT8eUC0IQNUrtxnuoCaNXIz73Be7SjLslRHzS+ldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4da5lcTU+smsom2NaQMKvKpZ2gQsTfRup+QeTWrc7Nc=;
 b=mNwaicSG8RRlfwVCD3gM3X0jxTn6ZsblxocsalQivd9DL1WnIYbMJl/7hkzZlasgH8SwI5ORK6onrEenyQwvT2z0fH4cO7PiftKCsBInwvdGaS2xpWaYrZmy02dzleIeLVB+2sYEif1Q+bzTrsrWPRR6Jd5rS8fWF9eUuM5c1hOvEZXTVA8Csogsm6ST0ixvrgA7on8uegikh+UylEhJKj65dCcKBxL9aTrUFtJopNIkTBu8/c5MhvbayuzToEWUorki6chNT8bmRZGYcRZNlFT3771z0ojWjFAGw1FmSBevCDvZa70h0hxgkxM3qT2bPMwgJUT/zsjqwsXoSF9jGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU2PPF839CF08BF.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a97) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Tue, 10 Feb
 2026 16:31:42 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:31:42 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][master][PATCH v2] python3-pip: Backport fix CVE-2026-1703
Date: Tue, 10 Feb 2026 17:31:32 +0100
Message-ID: <20260210163138.91552-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0295.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::12) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU2PPF839CF08BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f94bfaa-c600-450f-608e-08de68c1dfd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x0ymighHgHZm6JmtEA/yDKJmucRxNnARtTeKoDS4L1sJBhY637E3jAOJ81VU?=
 =?us-ascii?Q?wZz7vSqWCBRokx+3ab0h/WsHdvu6XB6klpeP8uD0+2Y43DrOTweUbNWaRUq2?=
 =?us-ascii?Q?HkFEwuo/u9HEHNIH1kMf//d/vqeu4beeJjBg1bPqnLfOI62DeWE9VW9DJK3c?=
 =?us-ascii?Q?rIT2PCWgUUAYYsl7QuCmWohH6qyJhOSojMkeGWFf9TDYdC72Q1g5kYfi+pG8?=
 =?us-ascii?Q?70EUSPBmqj6tFt1YBtdQdAfPVAH1QiOwmCPk8yXYtkTSN49fBk2pFcNQXw15?=
 =?us-ascii?Q?n972rGtJM/6r+DTUI7Y65nSxOc9L8cqNabgVJIMTVOPEhdMWAr+8Xwm2nG/Y?=
 =?us-ascii?Q?3o4YlQsJKhBbxY7J3fwIEpIA0S1DVbOdVZSmsfXsNxulPiI7RkoFN+wrIk72?=
 =?us-ascii?Q?1C2Hym8jhTcQgkIzUNyx2RRpbzpZfWv2fhW79TEAH8hEHe4R/iFc3aMgYMxm?=
 =?us-ascii?Q?WzstEUlMgAAmZmYk1psw5xrSkeEZi374FMhoM+puwzzCt5NHyZuCEnYp5qNd?=
 =?us-ascii?Q?B1oYdyc9w9FF3Wot0GOrliFVeabojv6UDP5rRwh4547ytdRjr2NoXN5rAn3A?=
 =?us-ascii?Q?Y0NQkNR7m+bMn6RvOmyjpV58lJWn0SWaqh0jW4rBBIos88QizfCUR0Mm2oir?=
 =?us-ascii?Q?x7sK2P3pEfjUV3KJGyW0AZg39rBTJKa4uDTYEVzqvg/MBlc5saGPLZgXZkWe?=
 =?us-ascii?Q?QArNNdyDLBThRGmkQTQDe5tGqG0wjIgyfP+xYOHb/MFADHW+s99tgr5nX/P6?=
 =?us-ascii?Q?Y1c8piC8Svvuz2ONwRDB3nqoQDzgKKrIpQzPwQC46GYGS4XE1ZBHAR09DplV?=
 =?us-ascii?Q?aeIdEMyiDTY6scs0gVMbDLPXl3k4JXUCzjc6XwUpcmDHUntf+QjV68JGBLO6?=
 =?us-ascii?Q?1zTevtL48rQvhsu1+XNf6EKz3ZNbEyc2sTnXakSrAi5eh3vEzcrJ1HKxMtWv?=
 =?us-ascii?Q?TZ/mhZRtgVTSAy7lWNiQS7+7ja5igNMue0mV2p2prDiupQqMZGsKy+n/2Msx?=
 =?us-ascii?Q?hxJGD5XLn+q4eHktT1ntwOJebiTVYt8Y+uEMfJjWkPSrg2z00p8toJZUsSzO?=
 =?us-ascii?Q?9akUWGxVPV5d1SP7+/peDwefLRmPRA1cy41GmFEBim0KJK0AdV0lITIXvSdA?=
 =?us-ascii?Q?iUXSy3OWqR+YnR8NpfzLiF+PnGJ+VzxkYqapEoty11xbxVZ2TtPNb+XjesMd?=
 =?us-ascii?Q?52Alt1RsrF2DyGJApZ/m4nIqHZsSEShp+7paWYnhm05U0PlmmrWLQKlChgzf?=
 =?us-ascii?Q?KOs/mPJp/zT5r+r/oADpf/WzwqNYDZ1BEGaSkIcloB/jqjKstAdDaY26NdDv?=
 =?us-ascii?Q?h+BF1mPvbNcEqXoeusfNsHwUBjegoAxe3WAVHUKb7ilQ/cJHK8rA54geeBoI?=
 =?us-ascii?Q?oH8bSmCGVda5seRU8V2vNQ1cUTh8r+ieN9tvQcqXGZErDdNRkpc/MZCe+B7/?=
 =?us-ascii?Q?6Ae7/VTT5DEvSYq9MVDeUoCW3oEH1wu0YXL1YoxzLwXGQzgUo9CIkrTGXLYw?=
 =?us-ascii?Q?S23Urg2dx0tq3mKcWpgWpOI2aHGlxIElKQwa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qqnfnJDOTuMIvfO/We78zuWVFweCmS9rT5mSupifKmNgnmvR7K5BE01+hRA1?=
 =?us-ascii?Q?vyJWJm+3KUcSn+GlW1wPKZXSgZzs0qQPnonOLSA6L3RKrs3cuyZf0BNngoZO?=
 =?us-ascii?Q?W0ktafmPnOvBTkfuz6l6jMmCkRzPq2T1Bj0U1nSNZ2fwxrieaBrZucPWy4Hs?=
 =?us-ascii?Q?BV8fsrfK59U7K1iK9YcLnzkoaj1rt9bdHzt+vn04GiZHC4njutDkXaQXm4U1?=
 =?us-ascii?Q?LvGPCvj8NtzuC1BhyqPCdT3jgsreA4ssQUgsbvepSI9gEm8ecmLzLTpNjMzs?=
 =?us-ascii?Q?Wq7JPMsqkElqRyNIJv+dFSadRfqjlaUZCxlsPsmOsNMRHJguzWMhK6ThOj5S?=
 =?us-ascii?Q?GOASAXucmiT5+VnEuArdNk2BypN68NSMmCYrOjfocqyP5Z1SdUplG/xL5OmU?=
 =?us-ascii?Q?QeYcSA8LwaD9Q8m284Avlyf6TpktNZ8oNHSjbqG0zMFm+/FzvgEWjjrp4VID?=
 =?us-ascii?Q?cOB1NJUO8yQjB2d+rIT8FjavQncEdNyV8GAhRloJTQR0+9QWQ9o8vySKqVgk?=
 =?us-ascii?Q?gL0wdU4KT08I6xTcNHkTisRB+7RbuZZuaiZ9orPhnWEJFUXu4+0oviLkh5gO?=
 =?us-ascii?Q?GD+JJs4riYXXeN45QIq7MTdgexSveOprmVLy6oNOQ5xOK1E7o8Yjx7EbPXge?=
 =?us-ascii?Q?3sKXs5yRZRp6YTJC9VQfUT5M081kmA4OMEAkhfQYv0HZrzz/vK5Xbv9uc+Tf?=
 =?us-ascii?Q?qGcyFV2mr2XPZGpJg6qB4BvFxSW44gYgtA6U0gXYQyN7IG4h+qEIjj/KVJzA?=
 =?us-ascii?Q?SRlhXLGmlY9Tv76jPW9WrnthM2zQmX/KakWS+4EF1SlLn/wlSGWwXa7s58xS?=
 =?us-ascii?Q?CcImqnma5tLMHK8TIPVOphjG/UoRfkb9YC7iJliWWWvalO5/7l9zBWGurhVx?=
 =?us-ascii?Q?A065vXujOaiaFIp/h5uGKZL+LQ+nm+lFn7b/9uoWp1FJ1v2SF5BhStkZrTIr?=
 =?us-ascii?Q?8XX//4UV/sZx/oPv3mBg94olh8fZwyax1gt7f/KQp/oy0bRy5cdl+801bSTX?=
 =?us-ascii?Q?TzorbT43Ono2d+t4g+29UcHW5651+GDImRsNsnMv565HzSUCo+eHpqHV0GUk?=
 =?us-ascii?Q?9xHJjwi6QqrmdzNTbJLGqv0P3M6O02maMg+TfECfPNnmPbv0Q3dHOJpBjWtV?=
 =?us-ascii?Q?P/FVNO1eEdiRWgF0jlpFrPZR2sz5V+Z8M9AiSBu1NzNzkiKdDi25kcvS89fA?=
 =?us-ascii?Q?m3azpcUM+mWBKi8Pf4Knm1235wWMyOGsXg3hJUjTgcz1FUuGm9px+k/qbctM?=
 =?us-ascii?Q?4qfxeW+qYdtXJbeoe3YFecA+iQNdJjV63hVBDDAgFOo75u7pa9BOBUIKrZIu?=
 =?us-ascii?Q?xfoPLjp4cAz/T9qbnuQn+lAbEGw6or+QsmKvRORIRKx43+O79Y9fTyBti3UM?=
 =?us-ascii?Q?LIgAlY7BWhZtDKxdevC8Zd8xw8L90caCIo26h1ANkpiOpYd4vx1wbuOm99C2?=
 =?us-ascii?Q?jjBGAvSVDywh904DRCe7kJB0rNWYukV0/H4hDib/x76wvrM0voZCANKyyRry?=
 =?us-ascii?Q?Pzg5hvOgDvUbOWBQsRLEl517td7MOpuPYaP16lUGlezEb0DqI2r8pjxdEhpd?=
 =?us-ascii?Q?jYlgA6S7cUDlz13G2a1Whu8/saUUq3FFUB4vskjfU/TDDfb1lqiDGeyGGFBH?=
 =?us-ascii?Q?s6TtYmZ3Q1yoe0fJ9f73XWqutXa47GVvJ6paey8a/O3My6BxhgDPuvuQh4w7?=
 =?us-ascii?Q?yYwDGQ/Y0R3Jl2ETwRZiiqqVPSgicsX7q9lAJpHF4IZ0PaQxr0KhRV9sLkE/?=
 =?us-ascii?Q?x+xO5sahfqHXivoBjOIrG7nBbgY8/3o=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f94bfaa-c600-450f-608e-08de68c1dfd7
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:31:42.8033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiNl5gm8Qb/5cT8lj6szvJQGZidQyBDi90R4DsZUCZlxFdCHB+xZPdySo5N/ZcQIY3eqoNVfIJY29vjQCHpIqo75DANgGLqj6okl3pW/OEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF839CF08BF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 20:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230932

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/pypa/pip/com=
mit/8e227a9be4faa9594e05d02ca05a413a2a4e7735

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
 .../python/python3-pip_24.0.bb                |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.=
patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b=
/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 0000000000..8d34d2acb4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,55 @@
+From ed41e052ebe78fcf043c43ea05bf16f73dfbb581 Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Fri, 30 Jan 2026 16:27:57 -0500
+Subject: [PATCH] Merge pull request #13777 from sethmlarson/commonpath
+
+Use os.path.commonpath() instead of commonprefix()
+
+CVE: CVE-2026-1703
+
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4fa=
a9594e05d02ca05a413a2a4e7735]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ news/+1ee322a1.bugfix.rst            | 1 +
+ src/pip/_internal/utils/unpacking.py | 2 +-
+ tests/unit/test_utils_unpacking.py   | 2 ++
+ 3 files changed, 4 insertions(+), 1 deletion(-)
+ create mode 100644 news/+1ee322a1.bugfix.rst
+
+diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
+new file mode 100644
+index 000000000..edb1b320c
+--- /dev/null
++++ b/news/+1ee322a1.bugfix.rst
+@@ -0,0 +1 @@
++Use a path-segment prefix comparison, not char-by-char.
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/util=
s/unpacking.py
+index 78b5c13ce..0b26525fb 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str) -> =
bool:
+     abs_directory =3D os.path.abspath(directory)
+     abs_target =3D os.path.abspath(target)
+=20
+-    prefix =3D os.path.commonprefix([abs_directory, abs_target])
++    prefix =3D os.path.commonpath([abs_directory, abs_target])
+     return prefix =3D=3D abs_directory
+=20
+=20
+diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_un=
packing.py
+index 1f0b59dbd..724ca0be8 100644
+--- a/tests/unit/test_utils_unpacking.py
++++ b/tests/unit/test_utils_unpacking.py
+@@ -202,6 +202,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
+         (("parent/", "parent/sub"), True),
+         # Test target outside parent
+         (("parent/", "parent/../sub"), False),
++        # Test target sub-string of parent
++        (("parent/child", "parent/childfoo"), False),
+     ],
+ )
+ def test_is_within_directory(args: Tuple[str, str], expected: bool) -> No=
ne:
+--=20
+2.44.0
+
diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipe=
s-devtools/python/python3-pip_24.0.bb
index be4a29500a..35428260c3 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -31,7 +31,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf9=
5163b597008bb46db68030 \
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI +=3D "file://no_shebang_mangling.patch"
+SRC_URI +=3D "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \
+            "
=20
 SRC_URI[sha256sum] =3D "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b=
718fe6f593aba2"
=20
--=20
2.34.1


