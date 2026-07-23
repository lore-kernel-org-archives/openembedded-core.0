Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F799C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 12:32:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22413.1784809940739036326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 05:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=PUvjKjsj;
 spf=pass (domain: est.tech, ip: 52.101.66.66, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DN1P1gptbNL848RNrH3kRPHs0PQWzl29s8yMIAysxgJgmbfc8pn/75cLmDwGtZqrmbYnzGvWKYhVz31uUCCl4QWwcPq8fzR5o6XF3aXcA1XCExeCKzmEowAKNbNQYZja3Hu8LfUxx3SXHEK1mFohBhFL1GSdnIonIXTl21gf4IcF+/dFn8RNSTf77RG2PWm6MBat8UHlolNVICbsWCXETr95M8OknFfU/JcdXmY+attRq3OQtZHGBD2iqknojqAL3ZCT49aVW1EEiVXXNcf7OTEqs5h/Xyu4WPBXYvF0CrCukg9Rnfv8E+45OXDTq8M/eqqgHV73dkkLtua26uIQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOUJRUjtGRmQrYtPWrwrqHL5pf5cE4cwZVgJmvZ/36A=;
 b=BoP2Qwp3GhmIPULJ3mdJLKu0XrCowTyINl2fffUbfcfsqplv8geueqzolzq2fq++uJ9EE84vfP4FR90aqU4Guxc9RZ0nczrWnpV2PeVbeU3zUa1XFo7shOWzjK07Fb19pN4qUnv0PIJQt2LrWjblI/slDUzVI8PB9icXnl3wGy2ZNz+BWY8hy5Rlsq6yIyhkAAERN8rDCGiPwGOaqHKsc3M1B7bT+EMvqNsI324g7LaWK/5F9HEyEU19MEYuyqwePjegqYF9DYxMqUylb1jxdQooKhRTZHM2CyFGVQ+3zPzlArOvHwFA2qcOWQP65Sexfwt8cIlTGVZcGYV1PhYInw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOUJRUjtGRmQrYtPWrwrqHL5pf5cE4cwZVgJmvZ/36A=;
 b=PUvjKjsjzXg86e0rD4NxXY7aAx7EfN3AZoq43zQnNKZasrIBTo4fzSlA+BgZIevy2sXrH6RI0INUN+NOC/dfw1+z0AvFuE+Te/8mPSVpwdfIlKFpZyt1cwI5LayNIaq7Xq0N+hDgzvvWVpnz7wqeP9jb8qvPoxW7qTttYWd4cDln2Mr5nvJSFzVrM+y+FIUcFp4hx0y/BkvKZOso2DSGgDooyGEeAD+V/deDOTtGmKzS+s8lGuw2RTVE8kdN7lBHQoHgIgePiIvgF681xSnm9TFvPsthSa4u/4QziYZdRcMSWmwFfUmtg9xo9K4qykeod2Ca4QqF3iqPGdiGVMHW6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by PA1P189MB3603.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:500::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Thu, 23 Jul
 2026 12:32:18 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0270.004; Thu, 23 Jul 2026
 12:32:18 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Subject: [OE-core][wrynose][PATCH 1/2] libgcrypt: fix CVE-2026-41989
Date: Thu, 23 Jul 2026 14:31:54 +0200
Message-ID: <20260723123155.795532-2-leonid.iziumtsev@est.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723123155.795532-1-leonid.iziumtsev@est.tech>
References: <20260723123155.795532-1-leonid.iziumtsev@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::19) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|PA1P189MB3603:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3f7ad4-f328-41eb-ea4f-08dee8b66f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|13003099007|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	VilNt059Rh/rpGBTuoztBDoxilie6rlaGGGjN0+E9GQGQveUW8EfxUdUuPEeCO1fJ0rL/tKNnG/FRKN4IlUM70Dni/QJLDjCcNmlmoGLyjOA6QaImJRgE6Ose/rE5gETBb+W7xtU9xltyRjZYr+Q7yR1/6mzp2U94dm8v0LoymIUU7dSSWbT2eGrSkrdbIsVM4ORRvetxr1ep67ARTly4ZF9ynN+I9li0qsND5+MGYaKpRHGeMAznM4NDPh+N+otXpqgSrxptTUtCi1LhVou03AaS27263pypLu8TXPXWmMWTjwzsKGoRgPUEBVnEzOppcny56r+8o6hD1xeFmUnesMhK0szrcJoT2k/snJ22dqBod8Ov/lTtQgwykgiycKoQWJvUk6+BLDovVaCblknGKNGdOsk3xvofLIoDUbexXF/DYNoM4275HKiS5czOPneBW6fmLfm58oC57oBd4Q/ULPLSXEM1zQwmARWhczsOEKKD4DtYtfxCzNQ6yPlvOWKfHyHB09cHis+e+m0+6JHm0ODpBzZEdYI6XUcdyUO5o5C1SzMaI9IjHKqSUpFDfot0MMZSqe9OYGqCErCMkdBlCrqy8Y0u1kUQ4gODAFnoh04zc977DW0C8vHQoSFYYkn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(13003099007)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mIEJBClCE7tzpL7nHyV1FRI/HnLaZ2GvgMeJxZhbnSz6VML5wsajuiARUU9A?=
 =?us-ascii?Q?dTmfAwAGY9B3erqjfpPYubV4sspd3HT7laGIJmDRITbxPkJnwPFZlyCTsBBO?=
 =?us-ascii?Q?5VhVb0OF4rYGj9JiTacKQEhlXuhxfSxATSNalFTe+ouezkAThGzPt5Jb/PF3?=
 =?us-ascii?Q?KzH3CWWnlq7fejGL/xoe3BR4tDVo08jx02n63JLZFz1sDS9ZAE9RYj571obf?=
 =?us-ascii?Q?tEu3V344chS8pyV4fbyXM8paI/ovPTONmhTLRSk1y8eDvWHO6aeAjATe5KkM?=
 =?us-ascii?Q?o/yZ1ChoT7tsqHyBx7i0APaGMYfaYP4Q30LYEG1BI7B21fi962I7J/eYvTx0?=
 =?us-ascii?Q?ksethBBOChalYn1AZRv6smYPuvDRl7AQwzUXWtl9rLTwTXFs73Jn2d/mPAOf?=
 =?us-ascii?Q?1GcWiiRTxq3aL12GUD1rLTJ/a19fFN7lpxeeLqx4NhuYPQBETVMCoGRCCM8B?=
 =?us-ascii?Q?CrRDTuG2g2uSNmp43bgPx0G7udkPUq1nqTosomaL+/7Ppsv6/P6DrTbUt3VG?=
 =?us-ascii?Q?ae+IXgHblqrcObPsCXyCcwVIETuHa5fRqfbCegeSI5IA0bkopWiYwgpMVOo5?=
 =?us-ascii?Q?SLNEnSWYNFCSJOYTesbnixIwKYXj99xf+FQoZBj/JSdMh+hBysgfxwR8spdS?=
 =?us-ascii?Q?d7uDEnnXWobjByJRi+s4AFyJ93Gvzsi1d/sFWN+eaz+1ilIRoiTzQLkFczp7?=
 =?us-ascii?Q?Zr4a55wdP79qtulxtm7eZfjXmdfTkn0z0JHhoHGba2UwVnY2N+vA+QQLZPrX?=
 =?us-ascii?Q?UEdkUlAnC+a4Cuff/KgfrhjrNpHRaCGSTdPbR8o3uMrQh2ZfIS/WepUBURNx?=
 =?us-ascii?Q?hDCZp45fz2sP9BRaCTjQJHhY00jjRvLwiGlZE/HrMY2zyYn72eByTYyieyt0?=
 =?us-ascii?Q?/bb7M0/lXzBjNh8VFrpf84NBIj0ZupBQrYK132yTi3Dw5ZfDRcca/vGUJHC5?=
 =?us-ascii?Q?cKVZKytrGM9MP2nHVBp99TgBxUp9SfQfd1sxAGE0VfN46CEaHRHfzCX3lxjD?=
 =?us-ascii?Q?5Z9jEhnvEQG8Y4uIvPrywcMcqo97yK2aJo/39iCdtpuG/mLksovUreMYcPiC?=
 =?us-ascii?Q?L/bqPAvAS2JzxUT+jSx34heCednQqBWMUjtT3GP6nZGdhpfdh52RhA4O4CGl?=
 =?us-ascii?Q?gQdBJYj0UVu1yy6BI9N/CDijeQ86iMBh/aoh+bcwbs5gY2ZAXq4nckqiCEml?=
 =?us-ascii?Q?eaS1SstAX1Mnuxc+RJJMOtanhMrmLF3gaAG+G9C9VK2CxlLtovlW+83JVZz5?=
 =?us-ascii?Q?QeUmloE8peEpdmnUCzBejM//US7NzsYR7gSuVPKQcY/g5TIgSerjq2Tzbf3s?=
 =?us-ascii?Q?NeL+Jrp08cgZUsbMidndNI3Baxfs4biNSlL9hWBtjNUlFSJq4KMX/4ikIN4E?=
 =?us-ascii?Q?M89Ie7FbHgGJpUbGZvrnM3MtRHjnEv2A8zq9+JEnwD+go/Ul00He+7lVNRYl?=
 =?us-ascii?Q?c7jW19uneNnCyGZstDZ8NGsgGSJVsRkWZKdxwalyUUtRz+rFD/VImpZUGly6?=
 =?us-ascii?Q?8r8IPVCDvGCiFycWngfWRETPZXnK03CCIoncn/7eCqXkRm8n16Uyi493rWwo?=
 =?us-ascii?Q?8lUQCwI+bgjO16wjEdJIFpy44AC7v5hSh4w9IF2UyPCwmr8wBN2XBEFjsQYg?=
 =?us-ascii?Q?OSFcNVKxSEjJqLpWPs381xq+z8HOcFz4HklPXKpxmnGqp5UedOvwgcHMLMHZ?=
 =?us-ascii?Q?zxImM1+RIXi3RW17foBWX9ljKWbRyGjB8GpZGdAcybojxp6m7f98p+i8apAX?=
 =?us-ascii?Q?M1VF4qn7h6tszNgMo1B9cQqz5HJDAIY=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3f7ad4-f328-41eb-ea4f-08dee8b66f48
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:32:18.2757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtyunxdFA0TyVLrnbGgKnF6lCf3SmLVZ4d4zjKL/NTfVpCr2qml/XGXvQPnbSZ6P+y6TxuGwIuaChSS4HHV5R3XZEzIKaA8DP8nZ/5wFfaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3603
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 12:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241828

Backport patch to fix CVE-2026-41989.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-41989
  https://osv.dev/list?q=3DCVE-2026-41989

Upstream fix:
  https://github.com/gpg/libgcrypt/commit/2d3d732c9bf87cc10729f69678dd9e686=
2f99fa3

Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
---
 .../libgcrypt/files/CVE-2026-41989.patch      | 42 +++++++++++++++++++
 .../libgcrypt/libgcrypt_1.12.1.bb             |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41989.pat=
ch

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch b/me=
ta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
new file mode 100644
index 0000000000..aba3ca318b
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
@@ -0,0 +1,42 @@
+From d8874dd38f78454dd3a760617ebe8d9aa9270649 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 10 Apr 2026 16:58:57 +0900
+Subject: [PATCH] cipher:ecc: Fix decoding a point on Montgomery curve.
+
+* cipher/ecc-misc.c (_gcry_ecc_mont_decodepoint): Fix the padding
+mistake and add updating RAWMPILEN.
+
+--
+
+Reported by Calif.io in collaboration with Claude and Anthropic
+Research.
+
+GnuPG-bug-id: 8211
+Fixes-commit: bbe15758c893dbf546416c1a6bccdad1ab000ad7
+Suggested-by: Bronson Yen <bronson@calif.io>
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+CVE: CVE-2026-41989
+Upstream-Status: Backport [https://github.com/gpg/libgcrypt/commit/2d3d732=
c9bf87cc10729f69678dd9e6862f99fa3]
+
+Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
+---
+ cipher/ecc-misc.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/cipher/ecc-misc.c b/cipher/ecc-misc.c
+index 615b0df2..ab3799dc 100644
+--- a/cipher/ecc-misc.c
++++ b/cipher/ecc-misc.c
+@@ -438,7 +438,10 @@ _gcry_ecc_mont_decodepoint (gcry_mpi_t pk, mpi_ec_t e=
c, mpi_point_t result)
+         *--p =3D *buf++;
+=20
+       if (rawmpilen < nbytes)
+-        memset (rawmpi + nbytes - rawmpilen, 0, nbytes - rawmpilen);
++        {
++          memset (rawmpi + rawmpilen, 0, nbytes - rawmpilen);
++          rawmpilen =3D nbytes;
++        }
+     }
+   else
+     {
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/reci=
pes-support/libgcrypt/libgcrypt_1.12.1.bb
index b3c0d050b7..55872a5c23 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.ta=
r.bz2 \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
+           file://CVE-2026-41989.patch \
            "
 SRC_URI[sha256sum] =3D "7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d0=
3a91a79832aa3c"
=20
--=20
2.53.0


