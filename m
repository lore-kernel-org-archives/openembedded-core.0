Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7740C61DE4
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 10:45:25 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17018.1771665860005193659
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 01:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=w0gtFJgR;
 spf=pass (domain: est.tech, ip: 52.101.84.69, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2WYrcX01prmD8A4KpveGix2jn/pChfDFpzxCUnGAj3txpKo4KFyorHpoj6MZWW1d4gNd+0O0qyujdq7n0QywLjFhbZlqk/C+Hts/4h2FKJZ5ytagtTnkAkNgJ/x5lFHix2EVI0loE4OKBNpefu45iHayWb309PxH1CBtI94NIcYp6b3hU41+ooRT5Wxy4oj0AkQsZ7bEU5irJdlezwFFpvvdE47oKhLjxxGFQwNzjZN8sU65630IZJf3gxd7e6QmjBiMX6IgkPXACWA7kpC729FKlgkuEFXA0Iw51Za97dcNl9ZPQnzgYybekOVYeT3O6NYSFG+uhlPinXlwvRoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeXRr8p5VSMHP28OlebEzueDBGCw28bgx+MCavnShzM=;
 b=FLSKgQM93uCumWjdrN77Ykdge9XIbGSdkiYONZkXeH3bK93QvahM7j92Q5UWowc1l5+Rdklx3JR7l49S/QlZicU5uERESm93SaAd6IMZxMyaD3Iyg240dKUkPjoHACEh17pmVDXBLrmMOnF9Uyk+Z1a7rFgDg0EWxcTZIikJ9BbiQ2+Mjp4kiFsUMCwigO5NZ0czjjvutnzNsJBOQdGLe8HldNXbWWAKBsr16DKn1WHKZJ4MGUnUmQ6vK8XwUqfc/LVG+Ld1NKIsxXnCuT1RGLDEc8immLOao/I+kjYicvn6DGojnap+iqu2AG0hAruDFUsidrFmQLzpqwGaymCGJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeXRr8p5VSMHP28OlebEzueDBGCw28bgx+MCavnShzM=;
 b=w0gtFJgR+QinEjbaaK023lCvDsNdGWjvtamUrDkAyrU+ccfZZN/V3rP1rdpaD43eWllYpAR/f5/0C3/772qHojcsV0lI6HmtK2IxlAk0WDKZwNJyBq5HAHz60ZL3+1+b8ikMMR0TP6l5nyLB4fflyT2Zz+qva6F8FCPCjY7+YIzdBBv/PYDllQzoPg+OpSxAXRmH30UiLYJC0JgCNwyoLeOmRKa/UrKib41lEcQH84xLggI/gEzAerBq21GF7BFbt+SkZPg88w1uWu4VsQhAQ4pRAsfXhgzD6A1RAG1Hys23qIVbSkv00NhTSTzGFCSowtQLnURO7au07BvUUVByCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:305::16)
 by DB9P189MB3525.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Sat, 21 Feb
 2026 09:24:16 +0000
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92]) by AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92%4]) with mapi id 15.20.9632.015; Sat, 21 Feb 2026
 09:24:16 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][whinlatter][PATCH v3] python3-pip: Backport fix CVE-2026-1703
Date: Sat, 21 Feb 2026 10:23:59 +0100
Message-ID: <20260221092411.802178-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DUZPR01CA0128.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::21) To AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:305::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1666:EE_|DB9P189MB3525:EE_
X-MS-Office365-Filtering-Correlation-Id: 095f2939-fe71-4416-7159-08de712afbb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TwFQUCo8IBSFJGwPoSEHmQ6zM2ToIwKP8d7bIQadcLWt+Y4IA4iAUY4pYzxS?=
 =?us-ascii?Q?cpsfK+JRmZcXsFY9+fCU0AOhOpcOnGwtwz1MPh1c+KCTXvHxTFvdHQZOGbeJ?=
 =?us-ascii?Q?50OshkoxLWv30uEPoEbEpfpzEJM0CFpCPW6FRebk6JCh6bCeGJUX19Zezpdy?=
 =?us-ascii?Q?GQVuim0Gj2ypGxHt2/dhfs+2OQIHfkYg4QLmBncfpVBy8z3eExcBH9HLEwzz?=
 =?us-ascii?Q?AObpeh7zKh6dSikX7xUoIuzlMdqP8bDVBiSxmDgQZOjSRTV5v2sCEEuRnm6q?=
 =?us-ascii?Q?RKOVua/TPSOLUx3nZ4B4FIZAxCCYMq/EEtaCYytJG6ZrS0aUxpfpaFj/fOQ3?=
 =?us-ascii?Q?PcnvTo4EF34x1KS6BUMdBxj5oYFBM1zuqtSj1gHNhRuDeebLeXROBvVFVjVn?=
 =?us-ascii?Q?7imtQLxIRhytN64d7gD8gCgYmu/keZ+iMowx85StL54cH/u6EXSNJ8pzzZ6B?=
 =?us-ascii?Q?f6n1SOJUJSzmpuk9MP+WnXPr5Yr/oT31CHL78LyWQDFkokPXfrI/KTjvxxBY?=
 =?us-ascii?Q?kJO3CB0o27XUdfF3DYiBicYarvpszdEnWgBaeoALHfFzReODVNQH3+Zi56A8?=
 =?us-ascii?Q?a18iJG3RYYz1oTDmBSA2kbUJ+hFDb8wVWL5x6HBhn4S+50VW2UofIwx9bmgr?=
 =?us-ascii?Q?N0jmXkSq0JavHUDzw8A7oFxtxV2r8ndPjGI3r05ycoCNLBpXHK2x9cKOAiyJ?=
 =?us-ascii?Q?6AvTUnPvseDIKg4d16bfYeHuLGES3RadTcYjXkTwEmq5kmSgwx0C+uy9TYYP?=
 =?us-ascii?Q?Nte+mLXrVhWCEhFYOe2J0PBDsBGiA/rYpMtn91sxNR9iPaqdpPql77blTTw6?=
 =?us-ascii?Q?6YIlPu0I8AkxtExdRER2xGkdDv8b/yrESFDlzUakuXA67NozT+XdJEJTVIG7?=
 =?us-ascii?Q?IHyg1Ibyb+e21Ilj/e12q/+vKe7eZxx2Gzcn/H5X4YAwtkehvQ3kFAXBUOin?=
 =?us-ascii?Q?TnlwrMfQkGvNdaFVXwVtilDPBE5mMiPlTwg+f4EUxiQfWB7FotB7MeVWJVmx?=
 =?us-ascii?Q?kBZDEHPS7U/702H5I8JvgJhSF6/tkFDIuB7v55Z2riIyjRnZAxDYdA6M2DHF?=
 =?us-ascii?Q?uXhXDrQu0kaz8ZOz4ZLpI21WF5Rq0nJEuDTvxfSBE36h17sxOhM9+cHJZZFs?=
 =?us-ascii?Q?8+SKlMML3SjtN6SJHnIW5ZT+2j41IkP/sVV3vB0Vd8OrK2r9dHPD7Ewt14Cv?=
 =?us-ascii?Q?RBEGRu0AFXXCn0Xp3losvoz5dDP4EFkj57lBqM+FERGWH7QN1rpTADrT45sZ?=
 =?us-ascii?Q?DG1zAD3oP6mV6rN/sFXmEScqBVXVgjbV8RjOnC4+wRAsf+CAdH66gk3F8PYt?=
 =?us-ascii?Q?NTOTRhvoog+iNJR4sM5afbHsdFrakggk8bJLFTtdkWiN5zqTzHi7WjDO8q1t?=
 =?us-ascii?Q?rsf+panyThg5eee8KVGoJd6sH6bRgTJSoUo2TuxM13mOTtNbeyad3zroPSvG?=
 =?us-ascii?Q?laCUFzjM0IJ8Epnny534GkdohzhqKVO+BUgPoRPWjRcut58ChLuR2rajECXC?=
 =?us-ascii?Q?ZTnXBc7Ng26F/QDxarRSNeL6qccg/Shp/04oJenNRSd8qC/vdJ+RGKLvQCJJ?=
 =?us-ascii?Q?Qcq9Hh7tXzCmx5lfE1s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1666.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x7krliAs0yU33LwULaCLs7Shk7QwtE6O4Q5czXXrqZkGbkSDZ65HvvEIMn3l?=
 =?us-ascii?Q?E7Hi2+lj8zp0ckIdwE1EeAlaRZe/Ezy6gCVDGUd5aQtw05wAvY7HTS3Uo0Iz?=
 =?us-ascii?Q?RcA+IsirmwbRTpjWXRJGQlIc8MCs4frcJeWnO/4L934qy18P7Toq4weslu9v?=
 =?us-ascii?Q?WwOgqEtFW7rP4zrTGQ6Kx1zqRKFsXgo8gB/y1MLfSiaC94ehXuEfi+xGjDJt?=
 =?us-ascii?Q?xhQGLuyrENIuKxhdO9GDULaOfb9PXAsH9aEYQnkTmEjroNYdElO8UgAI/XCX?=
 =?us-ascii?Q?G/FtjMh7EO0XGHK6Vwx2QTkGFx8mTvVItAht/AFhZZH/I62hmEoBSRT6bgNr?=
 =?us-ascii?Q?Xv0PWwz8uhT3c2lhEN2CYJ5UqouMQgPbpKtdUGb7VlOBca/roQm/xo+cnGwm?=
 =?us-ascii?Q?/P20/g140fhYasJpAvp49+dSF0VA7t7QTvSzzCcUUOxYci0G4C4bdNYYcw0Q?=
 =?us-ascii?Q?pJfXi6N6E+ghaLH7K0ZpE8h9G8oWUU8etsCxPRiutxxJ51kVbH3F/w7mzFXN?=
 =?us-ascii?Q?3f4Ce2KJdIvJ7I9Zhu1zcaOyEqWGbu+12Pr5E3Fp81t39jC8m1/RHNSyyEc2?=
 =?us-ascii?Q?mRHvwXkLI83kDuroSGaY6C0+vHTKQtrLNbref+g6319XoOLtJ7hUyireYCSG?=
 =?us-ascii?Q?IwXzpEo7nQBfkgyFi/gLAXYr0wJLQZRgro6cAcrPFoGez+Ts864uJhvf6vhh?=
 =?us-ascii?Q?vGQc7Fw49FkufNTGj7di69mnq+fTzCemIME6HZt0yl9hYyfVlxUPMI6RV+HY?=
 =?us-ascii?Q?UKoYxh4uTvddyU7w84qdCa9PSbeH24UJBPBUCGx9Ae62z7MD9lJ/bRVZvMk/?=
 =?us-ascii?Q?ay5HY3llYgwKoIMR6naygDPWylmT7oBvXgY6fA7A51jMc7puzn1i9Vr03eiS?=
 =?us-ascii?Q?/75eGhwAP0WplE6ZDVYMURnG4P0TLJmMI6HuQaSNNE91KzHM8VQE+UM+PvpT?=
 =?us-ascii?Q?/U9A6TpJp9vrvBfUqpddF8ySxs2uLuNcf5bAodPljOkuamGSACeGXa1Lgt0+?=
 =?us-ascii?Q?rwgWZQqNbclHDGwR4d+3r/tuftlIuw87YhqkZFhZxFqOsNAekCNMM4FJ8ugp?=
 =?us-ascii?Q?4jjT0eRxcNLe8rgMTdA1wBZjRoETRjAyrbEiGwG/TYTFN7y74OP8ynpdYiaS?=
 =?us-ascii?Q?WAfeSrsfmsN9vxdDwUpranD/owsRpuqd45vvi+wpZAQUt10y+sUlDq9U5hAu?=
 =?us-ascii?Q?cu8N9NOdwI2zKb9BeVVoen3CZ3HdKCdTTnYbCf95jnkVTwP/Cxo4HcDd0tl/?=
 =?us-ascii?Q?f/Z1mXR46NIZ3F0H5rwUe+MRoNvoKCHHGOQxX4qKZSFxsjVDy0Nmmioth3vD?=
 =?us-ascii?Q?yzz4jPwsoptwejED3vaxaRAzj0CPclshu0opyW0j6h/BGEILZGqB+yAoMZCh?=
 =?us-ascii?Q?yOoTJ60rV1sLBb2TE0lLXfZnCuAETPPlH36u+v+TnSwfKn9Rq3BgdwO5eWk1?=
 =?us-ascii?Q?ot/b0JXf3W8EJPP6CZ32MI8qI0CxuIx+KQX4Tfx7hUA9EewjiWXA6JjT3emS?=
 =?us-ascii?Q?9HkMUxhvhvWpwv4HO0j3nR9bKkidX+lkQ7B3qMVAwQ6d4dGHx4yzXiyWKEY9?=
 =?us-ascii?Q?srNvGScqO6Ch7r669OPbhC49RJydlkKlTB4KgxaVXnXePFnNdMsTwg1GiYKd?=
 =?us-ascii?Q?8Jza6IsXDYjM6/Q/1/1kSV7raKqvUBtLdOElfqtF+i6A0BJCsW0noGrikFpA?=
 =?us-ascii?Q?UO1zZ8ZCJ0i/uHsfoc2MH/0GxKihgK5T/j4RXi1JtcUhsiJZTVKYBsW5nSjv?=
 =?us-ascii?Q?Bt5VOwd2Qi+t+wA7ZeX6PEAqUSyzNhboZ/R55CummYJrIagnG+YS?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 095f2939-fe71-4416-7159-08de712afbb9
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 09:24:16.1453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHH4e8cLsHil3SWfxmMuw0xc9Z+R5EZStmAKGH8GgLf0UpuExxEc4KTFCdMka23wCTDJESYnHWD28IsmtepNbyGnGneJTTQLUR3fbWp/ljc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3525
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 10:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231614

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/pypa/pip/com=
mit/8e227a9be4faa9594e05d02ca05a413a2a4e7735

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
 .../python/python3-pip_25.2.bb                |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.=
patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b=
/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 0000000000..68220f8294
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,55 @@
+From 34bdfa654f2d3f9d036fb2abb28c175182a3da5c Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Fri, 30 Jan 2026 16:27:57 -0500
+Subject: [PATCH v3] Merge pull request #13777 from sethmlarson/commonpath
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
+index 0ad3129ac..7cb3de3c4 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -83,7 +83,7 @@ def is_within_directory(directory: str, target: str) -> =
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
+index 6f373b1ac..a3abcfeb0 100644
+--- a/tests/unit/test_utils_unpacking.py
++++ b/tests/unit/test_utils_unpacking.py
+@@ -269,6 +269,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
+         (("parent/", "parent/sub"), True),
+         # Test target outside parent
+         (("parent/", "parent/../sub"), False),
++        # Test target sub-string of parent
++        (("parent/child", "parent/childfoo"), False),
+     ],
+ )
+ def test_is_within_directory(args: tuple[str, str], expected: bool) -> No=
ne:
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_25.2.bb b/meta/recipe=
s-devtools/python/python3-pip_25.2.bb
index 350092d9ad..496eff1f15 100644
--- a/meta/recipes-devtools/python/python3-pip_25.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.2.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf9=
5163b597008bb46db68030 \
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI +=3D "file://no_shebang_mangling.patch"
+SRC_URI +=3D "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \
+            "
=20
 SRC_URI[sha256sum] =3D "578283f006390f85bb6282dffb876454593d637f5d1be494b5=
202ce4877e71f2"
=20
--=20
2.34.1


