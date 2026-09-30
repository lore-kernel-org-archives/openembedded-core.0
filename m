Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B77CA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 07:17:31 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7803.1790752643376205193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 00:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0QuyBC64;
 spf=pass (domain: est.tech, ip: 52.101.70.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yoo8m+fPxGjXddeNs8jJQpr+IoGklO2pnJ5QmkxhKTzsFiBcVVmlY8OtFcRYoAEjJflOYFx+X1x96FqJWN3rh/vc7/4uwI9BS9hKINi6nju6SJzffZqAnyRzh1nJqErHWsyd3yTniGDuLwARd0JGrvgyEgN0jHAiWUVVTkOpz77u5ifUKlV5DSOI4iwQ7OKEzo9yYZ5+sJeE2y7b6rESBtw/DtNP4MQG83KyxUoeFun2q/QCssxpzTV3+SMc9R1bXeaOE4dAHRWnmiFJcQjrQZBEmfiWuq0LrAtUMV3ZZhA007Gk2ICqtAPnnFrXl2ZHmYsSYmTImQEDbOnfp8iwVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHA/DY07guSG/C6HlxLT5z2vXgCk0v/IoO+4ocXVnDk=;
 b=fG84Vd9bJohJs1HgV3JWsGtZxmdRMYGZk3ISyzeqNekL+04zUimoI/raWUXYxKf8LY6hTaeKPX+BisKe9p9CSNO3KDxLUZMPk+6OJOW68mr61XmNq9vMIGLYOg+AgRM+Rvq+8Ict8UZiI6lp0RUXNPJbYXMi4uYthTO44GmCxED90Yc3BpHODL+ZsWt3txt06fRiBhztr4pxqi+WUrLWn6LA1O7HO+cmi8p6RzflJnir8na/DIbEQqxMKfz0TF4rzYa2E5nykqaDSaLY3z4pW6v4ns7LMvibFEDUxiuQ7PthdvySR7zqA63AViz4NPx1zCQ879FM1tQg+DOVoa1KdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHA/DY07guSG/C6HlxLT5z2vXgCk0v/IoO+4ocXVnDk=;
 b=0QuyBC648s9bnbw6yI2EUUKhD3SVDmJOQk1Vz0MTe+Ogn1kHy63s8lRH4sAmnPp3IrA5OpKN03L122vVgWcz4IYH+ECf9OguO6xCjXZ3xO3Tt9EMG5WZUXIf9fKOdGTBLP5QC7bVhgINGFWe/oyAqu9yALlscFREAggKvIOZDKK2bQBc4BEQtKuXvU3CaVfb4N9XIMowpF23dC6gHtGXh5R9ozXzUYX+f+yz2k3A6CpH5D9lb2n67gmKtV24vu4LRynDUd4Q9y03XBF2OfBSPzXo1S53Ltp+IVumdcvrPBMmkF9+FNH50BGJ9S6ECA1mABlGyXxOVeV5RNhYRURK0Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0600.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:117::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 07:17:18 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 07:17:18 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gdb: Upgrade 17.2 -> 18.1
Date: Wed, 30 Sep 2026 09:17:16 +0200
Message-ID: <20260930071716.95312-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260929093506.88396-1-jaipaul.cheernam@est.tech>
References: <20260929093506.88396-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::29) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0600:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a32976-0f69-4d25-e16c-08df1ec2dc82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qD4pP+95uxoybX+DLedF0YmjMPq8fATdAuzeptMpuk/py7oZt/wPesvgO+k+pXCtvWw6gqcCRddXjUrSUXXbeJFfZIDXoEuXCdq7dzK2017za2+livZirf4wCH6zXIVT0XYfaZsYdij1h6dfXJCrUrSfnoNGChA/kWt4DyXhssvwltz0ow0M3I3rUcN0YsoTrrBoU7+83dVyr5iTwfCw3xvHLDG/9/H30WmZKbYFokjv9c/VW13M+KvtnKlaaOj46uc9KdCmTK9fnGW9UsglfD131Ge70msWvYDdprgxNAhpecwwgK+GO2tZAdo9p5rweLK2/hVXTf6zK9yj8dnpP3T+gFZyzs5DNXWM8gjQ+yPDsQv4ueHXUq1aHb1Fg12yUQg7ahO73SvzLm054/OoOsnOtoaHmL+A044Sc2lvgCXjTZNovqR7pRdcTx3FklmMkNx068/F9Koh6jlo8MIVp4LmI3quUCLRyU13tYFmMDWgixle3KynavCr57Ybu0WXYswxI45IOsqmwEt8KMp2q8caB1YN0pNlRyr8rAGZc5A/hRiP1oRZkrlTCLqNdxjEfaxJa6lnEiI96FBkKyALvnONgnetO+5H7APkOuGnzJSLwVaLt/Rzmhcwg8YKWLUW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kxcvWfRI8FQD7VTvfzU1iGc8sbum8OP94jHga1XYIcjcbcXaEmItnumCQ9+8?=
 =?us-ascii?Q?H9adJ2A2dJJ58EOewx862YnvGxSHhEPRYliJKCtr5wd47ly0NOrw9CyuzufF?=
 =?us-ascii?Q?5Q1uY+0mq/EMtdz7GK7WFf84FmJ8iH3vSHBwYYpdJ4Wr1tC86nTyLrefFrg+?=
 =?us-ascii?Q?bd3zGdexqhhWLpGv3QAcgMPrrVGBSel2Cqh+2WJrd16HfZFG0ZHvF825pxcL?=
 =?us-ascii?Q?HuyK+Z3aqQtGtl3cQ8i+W81bQo+1ycYne9VRWf9XjUIpA3YpncnPf/C+8bki?=
 =?us-ascii?Q?HSiDsKY+SCsT6zVJ6GtiDjjNRHpr4sz7za4W3fyz2TpoG/IvNbPX1kVhzpC9?=
 =?us-ascii?Q?DklWZuoJubGYTBfzNbXqIdNL1ZPWjEnxhodBnFWAJnMsvHF2qZWPRC9oFHYf?=
 =?us-ascii?Q?us5PfKTXqNLybIvjhrj0P10jmDk6S4VErRYnpITWjAYEt0Tw61JvAaX6DsEV?=
 =?us-ascii?Q?I0r907qvEaiyQcM+VL+dWmGWfjP3RVcO55OPy0USj46sUoW7F+2Neo0Nkd7Z?=
 =?us-ascii?Q?C9APlxe1LnocuVpvodcyZ4yv11+wNIlI12OOnCZpLAMPLDwubBLiQDSJQPkw?=
 =?us-ascii?Q?Y5Dzzc0OSAxEbN02xuByn3kjPvT0+DAua2YEgr9R5qs7kI3j99PktvDxjeH6?=
 =?us-ascii?Q?weBo/VG4pKVsnuPwCNjn7AanHlEv89HhxmZY5eotEW0Hb7TjwKCJGp9D3GYQ?=
 =?us-ascii?Q?E7zyY7nAjYX45HhWieIwEAmzLwblpm67Gyr7a6Hc/DXUdeSJSuvndgGsYgyF?=
 =?us-ascii?Q?cm6IbcioOiDe8Gx0EAppm06KgWsVKR164EYOyZmsYRpeUEnTWSabzjvV8ie+?=
 =?us-ascii?Q?IVxPAPApHT/Dnwl1KyLHSsFCp3fiqIcCa9G1De4qQ5AHOqhUHJu8F/e/YV2L?=
 =?us-ascii?Q?7ZYiScGyGA/4yav2Kor0Ru2UQBJkKjQtyhaHJp32TpavsHEobmjatA2PFI8J?=
 =?us-ascii?Q?Z/IyyQV7xzeAuQoYjRGuJNysYT8AHo8445+ZzryYEFbhTh6hiBtKRqA6vjrc?=
 =?us-ascii?Q?gAU5RAQ6VQ/BASN5vCpklEF/s5KExArtd9GQTkpVHU5OQcTS/+cnE4UhWdZt?=
 =?us-ascii?Q?RxosVVePUZYM4jVdISN1cQ0vdV2bJ7ozPxL9j9s+DDvXKVIL5Qvjvnz6ZEf0?=
 =?us-ascii?Q?SFTdhEmQXgcO39jSyoP6aPzetIznqIxvORxPX+Mahs78X6ZwYiWRqZYgB9jO?=
 =?us-ascii?Q?MLAU2PTFQ4ypm62olzO3aOF1KU+0UTvPDCvvIZmvDoEOsdcTGn4mRaKU5Rim?=
 =?us-ascii?Q?f7xBWo4qDyzsxxBQ1olCfqMJXLXs5A31dXe+Pv430onP7D8ta5tSGsKDY2Ep?=
 =?us-ascii?Q?UrGkgUmIy3kL7+wKRU61EqLs2xNYvtsbscW5L9Sw2kcTe7FDSon7YBbMwX7q?=
 =?us-ascii?Q?KFk1+nCB00g+0VMT4Dwm+0B4mDRYAeJCDWa05zUWixOsZLEP/jJVUqdluL1z?=
 =?us-ascii?Q?VpOK+cabAkIrEXCbNak2d5cGHzDXP84SsIW8X2rG+eUONHCCyKKN/fb7qu2z?=
 =?us-ascii?Q?RJqRjh1UIH2xDO02Eu3vJwzfOCiW7tAeFZzNyvZt6rEZYsPjORRkqOl8P1gZ?=
 =?us-ascii?Q?zHjmWUxrKdfu6ce8PgWduNh1i4VF/CHMS/ItJLRFTRxuXe0BsX9P68a+Ilv1?=
 =?us-ascii?Q?gQ3LIxpkLNFSD77HMA4eslSqrwJLiDKvWRhkgyXjHB37AsUPTDZA0Z6K6oNb?=
 =?us-ascii?Q?0ZKDJCdflCUQ01D0hAl40dYR4Cw78/dPnY87pU7N+FiveHtFBR4Far5yEvcs?=
 =?us-ascii?Q?2PIaFF9Fgg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a32976-0f69-4d25-e16c-08df1ec2dc82
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:17:18.3268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAHy0MB2CIPiBz/yA3Z/U1YWV7UcfryKbJkve+s9BIMXP8QdqB8uFgzopA/MjYwyW6SBOXd6dt39xDYtk8JAC+PkNwXlZESLhtn8exZ7nhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0600
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 07:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246921

NEWS: https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob_p=
lain;f=3Dgdb/NEWS;hb=3Dgdb-18.1-release

- Refresh existing patches
- link gdb-cross with --as-needed

18.1 fails to build gdb-cross on the autobuilder:

  ./conftest: error while loading shared libraries: libatomic.so.1:
  cannot open shared object file: No such file or directory
  configure: error: cannot compute sizeof (long long)

18.1 added an AC_CHECK_LIB(atomic, main) in configure [1] that 17.2
didn't have. It links -latomic just because the toolchain has it, but on
x86-64 nothing calls into libatomic, so we get a DT_NEEDED on
libatomic.so.1 that isn't used.

Under buildtools the loader can't find that library at runtime (RUNPATH
only covers recipe-sysroot-native, there's no libatomic-native, uninative
only patches the interpreter). The link still succeeds because buildtools
ships nativesdk-libatomic, then configure runs a test binary for the
sizeof check and it fails to load. Hosts with libatomic1 installed don't
hit it.

frr-native had the same problem, fix it the same way.

[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Ddf1df8a=
4715cf516c2c4512c4af57b2022689cf7
[2] https://git.openembedded.org/meta-openembedded/commit/?id=3D1c1e7a0bc79=
77f2cd7c3d8e95a8dc1ffda20b365

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes Since V1:
 - Add patch for gdb-cross failure observed in autobuilder

 ...-cross-canadian_17.2.bb =3D> gdb-cross-canadian_18.1.bb} | 0
 meta/recipes-devtools/gdb/gdb-cross.inc                   | 6 ++++++
 .../gdb/{gdb-cross_17.2.bb =3D> gdb-cross_18.1.bb}          | 0
 meta/recipes-devtools/gdb/gdb.inc                         | 2 +-
 ...001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch | 4 ++--
 ...ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 6 +++---
 ...-disable-libreadline.a-when-using-disable-static.patch | 8 ++++----
 .../recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch | 4 ++--
 .../gdb/gdb/0005-Change-order-of-CFLAGS.patch             | 6 +++---
 .../gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch       | 4 ++--
 ...ne-alignof-using-_Alignof-when-using-C11-or-newe.patch | 4 ++--
 ...fix-for-packages-that-are-not-compatible-with-C2.patch | 4 ++--
 meta/recipes-devtools/gdb/{gdb_17.2.bb =3D> gdb_18.1.bb}    | 0
 13 files changed, 27 insertions(+), 21 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_17.2.bb =3D> gdb-cros=
s-canadian_18.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_17.2.bb =3D> gdb-cross_18.1.bb=
} (100%)
 rename meta/recipes-devtools/gdb/{gdb_17.2.bb =3D> gdb_18.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb b/meta/re=
cipes-devtools/gdb/gdb-cross-canadian_18.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_18.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtool=
s/gdb/gdb-cross.inc
index 110a536db72..ba8b3a91f33 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -2,6 +2,12 @@ require gdb-common.inc
=20
 DEPENDS =3D "expat-native gmp-native mpfr-native ncurses-native flex-nativ=
e bison-native"
=20
+# configure links -latomic when the toolchain has it (AC_CHECK_LIB) even t=
hough
+# nothing references it, leaving an unresolvable DT_NEEDED on libatomic.so=
.1
+# (no libatomic-native, uninative only rewrites the interpreter). Drop the
+# unused dependency so the build doesn't depend on a host libatomic.
+LDFLAGS:append:class-cross =3D " -Wl,--as-needed"
+
 inherit python3native pkgconfig
=20
 PACKAGECONFIG[python] =3D "--with-python=3D${PYTHON},--without-python,pyth=
on3-native"
diff --git a/meta/recipes-devtools/gdb/gdb-cross_17.2.bb b/meta/recipes-dev=
tools/gdb/gdb-cross_18.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_17.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross_18.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/=
gdb.inc
index 52c6fc531e5..194ee16197a 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -14,4 +14,4 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-new=
e.patch \
            file://0008-Add-fix-for-packages-that-are-not-compatible-with-C=
2.patch \
            "
-SRC_URI[sha256sum] =3D "1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2ea793=
c12a9f19a3228c"
+SRC_URI[sha256sum] =3D "cd9fc3fe2b47743840e42c1592d3d87f8302eb18639c0b8b4b=
a0898002e2348f"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO=
32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat=
-Define-_ABIO32-if-not-defined.patch
index 7a3064a14bb..fc1c5b0cc07 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-n=
ot-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-n=
ot-defined.patch
@@ -1,4 +1,4 @@
-From 8448967d9cfb09eb11fd3573a72a35ae94a89ba1 Mon Sep 17 00:00:00 2001
+From bb8d6121f63d29184816d8e685c1a7f683a26eda Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
 Subject: [PATCH] mips-linux-nat: Define _ABIO32 if not defined
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
=20
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 3d072ea935c..ca38caeacc2 100644
+index 9356431c..209c4d2b 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -40,6 +40,10 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-u=
api_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0002-ppc-pt=
race-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 56cbacf3848..0c2692f66ee 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_=
regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_=
regs-on-GLIBC-syst.patch
@@ -1,4 +1,4 @@
-From ec49e6283bc6a4a99596410db9509bee6cd941ce Mon Sep 17 00:00:00 2001
+From a552e69a180bc3d821f469280e03deda0dc8861b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
 Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
=20
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index 3efc1b9a9bf..635d07486de 100644
+index 26b9af4e..6db93904 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -30,7 +30,7 @@ index 3efc1b9a9bf..635d07486de 100644
 =20
  /* This sometimes isn't defined.  */
 diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
-index 3ce978f4c7c..38534297cdf 100644
+index 6a2c4136..23cb1831 100644
 --- a/gdbserver/linux-ppc-low.cc
 +++ b/gdbserver/linux-ppc-low.cc
 @@ -22,7 +22,13 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-=
when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0003-Dont-d=
isable-libreadline.a-when-using-disable-static.patch
index 024cf34427c..3ebf5d34bce 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-us=
ing-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-us=
ing-disable-static.patch
@@ -1,4 +1,4 @@
-From 2fa91dec5f0ec5663861ca53bde8951e48557bb3 Mon Sep 17 00:00:00 2001
+From 16653ccd5f43b12ed29d573ba7e659021958ed82 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
 Subject: [PATCH] Dont disable libreadline.a when using --disable-static
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/Makefile.def b/Makefile.def
-index 4896c5c692c..17e3256be7d 100644
+index e7f33345..fb182ef3 100644
 --- a/Makefile.def
 +++ b/Makefile.def
 @@ -134,7 +134,8 @@ host_modules=3D { module=3D libiconv;
@@ -33,10 +33,10 @@ index 4896c5c692c..17e3256be7d 100644
  host_modules=3D { module=3D sim; };
  host_modules=3D { module=3D texinfo; no_install=3D true; };
 diff --git a/Makefile.in b/Makefile.in
-index f12c251f9c8..17ea24e8012 100644
+index 0b04b71d..08c829a2 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -31593,7 +31593,7 @@ configure-readline:
+@@ -31618,7 +31618,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=3D$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=3D${build_alias} --host=3D${host_alias} \
diff --git a/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch b/m=
eta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
index 556f371fee0..ffd19d12c43 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
@@ -1,4 +1,4 @@
-From 6d37100388d45185a6e88ea7099a698c2c76b084 Mon Sep 17 00:00:00 2001
+From ed199bfc463ef489eba85c577710a6083abeea0b Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
 Subject: [PATCH] use <asm/sgidefs.h>
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index ca38caeacc2..2f044ca508a 100644
+index 209c4d2b..7849b6fd 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -30,7 +30,7 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patc=
h b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
index 809cd232aaa..9620291bf3c 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
@@ -1,4 +1,4 @@
-From e7cab417080f3454ea984e19384d9f1bf9e48fba Mon Sep 17 00:00:00 2001
+From 31b6a49ee3b6dc394899224b960be84bb9f18064 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
 Subject: [PATCH] Change order of CFLAGS
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
-index 365dcf23650..fc16218334f 100644
+index e45c89dc..0fb61097 100644
 --- a/gdbserver/Makefile.in
 +++ b/gdbserver/Makefile.in
-@@ -174,6 +174,7 @@ INTERNAL_CFLAGS =3D \
+@@ -170,6 +170,7 @@ INTERNAL_CFLAGS =3D \
  	$(PTHREAD_CFLAGS) \
  	$(WARN_CFLAGS) \
  	$(WERROR_CFLAGS) \
diff --git a/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-cal=
l.patch b/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.p=
atch
index 7c9129b9f57..72f82f5174f 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
@@ -1,4 +1,4 @@
-From 13e61d515b74389e61fa52ca43656f9d1c294683 Mon Sep 17 00:00:00 2001
+From 7a405e07c213b25800eb79fa401c5bb9eccb91be Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <yszhou4tech@gmail.com>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
 Subject: [PATCH] Fix invalid sigprocmask call
@@ -32,7 +32,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gdbsupport/signals-state-save-restore.cc b/gdbsupport/signals=
-state-save-restore.cc
-index 60724f95c87..8b493271aa6 100644
+index f3b7541a..c1534254 100644
 --- a/gdbsupport/signals-state-save-restore.cc
 +++ b/gdbsupport/signals-state-save-restore.cc
 @@ -37,7 +37,7 @@ save_original_signals_state (bool quiet)
diff --git a/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Align=
of-when-using-C11-or-newe.patch b/meta/recipes-devtools/gdb/gdb/0007-Define=
-alignof-using-_Alignof-when-using-C11-or-newe.patch
index d8816e3bef2..c0f710f7270 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when=
-using-C11-or-newe.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when=
-using-C11-or-newe.patch
@@ -1,4 +1,4 @@
-From 3d3d91ac1db8ee7f624d225734cb5b57b752e00b Mon Sep 17 00:00:00 2001
+From 4076be9abb5f500471f86ecff6f69a5dc888977b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Jan 2023 00:16:25 -0800
 Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+)
=20
 diff --git a/libiberty/sha1.c b/libiberty/sha1.c
-index 49e8e0b6c2b..72de5cc8ad6 100644
+index 464919d2..90557b90 100644
 --- a/libiberty/sha1.c
 +++ b/libiberty/sha1.c
 @@ -234,7 +234,17 @@ sha1_process_bytes (const void *buffer, size_t len, s=
truct sha1_ctx *ctx)
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Add-fix-for-packages-that-a=
re-not-compatible-with-C2.patch b/meta/recipes-devtools/gdb/gdb/0008-Add-fi=
x-for-packages-that-are-not-compatible-with-C2.patch
index 661eb261c2e..567b7732563 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-Add-fix-for-packages-that-are-not-=
compatible-with-C2.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Add-fix-for-packages-that-are-not-=
compatible-with-C2.patch
@@ -1,4 +1,4 @@
-From f71cfa9db1a196f0fadb2090ac04ce3164e171d3 Mon Sep 17 00:00:00 2001
+From 3782818f994e6fdb99b4a5083e178a47d6629fb0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 16 Mar 2025 12:48:46 -0700
 Subject: [PATCH] Add fix for packages that are not compatible with C23
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/readline/readline/rlstdc.h b/readline/readline/rlstdc.h
-index 2aaa30babfb..a7a0ef30428 100644
+index 2aaa30ba..a7a0ef30 100644
 --- a/readline/readline/rlstdc.h
 +++ b/readline/readline/rlstdc.h
 @@ -44,7 +44,7 @@
diff --git a/meta/recipes-devtools/gdb/gdb_17.2.bb b/meta/recipes-devtools/=
gdb/gdb_18.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_17.2.bb
rename to meta/recipes-devtools/gdb/gdb_18.1.bb

