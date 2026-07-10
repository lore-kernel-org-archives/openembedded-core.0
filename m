Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DDCC44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 08:31:54 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8403.1783672309022738974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 01:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fpQi0Jdk;
 spf=pass (domain: est.tech, ip: 52.101.69.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jej2u8EZe8toDLzfnpsrnKzPiNhEVp9p2xAK/enZ1eRGYOYWQwqMkcGL3i089VIQBava5bwn/lj05OJuIms+1hRSSwdaA4bvPDkezovapTveHqoaw0GiVws42+jw+Oq01AhrySvReKY5J9gTp0NXmWqUCxk3GkXXW9477wAa90IbD1bRcuXa20m5+SRKJetqeJ7JKHINBH8knxc6nT4tIHMMU/UEEg5eoGJtRA9qadYvcgYr5pZFSC0xr2qx75F21i/oeNvm+YVtE2bKmflPLAfjNh8fL0FIR+eftZ546fuHQrbBhdGezfqsrfQJCNLW14e5ZJ2DTvH93bOGvx088Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sd8IiJJIiHglgnrmcteYxWLColOtOQXfHmNvoNihKdQ=;
 b=YcQ4CesA3vzvvEPZWnddbkWi9u1isAjIUqeommnfk4u45gpDWfkCBuj/8FoF14Dihgqsxv+cmGHyY0c5kKVdrFF22nL8YduAzU5Hh+d6sBdbCY6loYkTRhTrJJh4qAxNLGf0l+Ax48E7gHjkVfZv6mAkxtnsNCgoLuWQc4bSrrRELrzQ451QGkqfJsKWnhltkyN8TckD1t4Rzy4WpP7OVdCwHbHjFya0B0oNFhgWq6X1IVK9ZcHMHohbQrnZSv3//dvuGIs2kXWsUu+iFhK2qFwFpA0S3vBo8awPec0DiWZfhIjVmaCdqaBSiwukcwfr4VsszRJ0UWPm0zOGRbgxig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sd8IiJJIiHglgnrmcteYxWLColOtOQXfHmNvoNihKdQ=;
 b=fpQi0JdkGBfUNutqtNFUpx4qC9lwM9zkqAwDpypC98gtrtXHzIDwK7lEMJpEK4aH1zDzLUbYzI4oZ0mGMZYWNxLvV101Sc6LMMO6/aHsW9hVVhs9UmRAmDzwVhN5Ol5d6l6GlFnPTvSPrSdtEdBclZ+40DU6xpRBgmfIsG9BjdGs1540XZe8fXOJB7iHqOU73AdtaeE77fuVAAXvuLIOOxIicDOadHmKdCVnJ5Tq/WYLhGbhpkkF5SJyUBeQ68ojwfF+J66x1C6ijFBAvZwU7HNxbUHS/IxiA+Qx143sdbu3eCxJv1Cn3CVOMfRhBU/dFFIqkboaMrrej6KyjAkJxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU7PPF2D2FDEF54.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::acc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Fri, 10 Jul
 2026 08:31:47 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0202.009; Fri, 10 Jul 2026
 08:31:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH] bzip2: Fix CVE-2026-42250
Date: Fri, 10 Jul 2026 10:31:30 +0200
Message-ID: <20260710083131.58029-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260710083131.58029-1-jaipaul.cheernam@est.tech>
References: <20260710083131.58029-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0075.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::7) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU7PPF2D2FDEF54:EE_
X-MS-Office365-Filtering-Correlation-Id: de23745c-216d-459a-804e-08dede5daeac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|12006099003|11063799006|56012099006|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	GOC9yH9UQ2lu97B9Pdw4AM3QQCa63/vKOrGQSiId1MRzR+vXMVfB98Mm+ccXW/0SXE1Xvb1Kb5BlFaL5Lc75jFy59mQre8OL4OvfQqUQKnE5o4JkKyZT33EWGCEeVSGCzbWVfxAESynyhc/lvXbRSqqHJF2FrVHEM+KIT61odH7g9rmm+V492xMMJGuSS9rPs34DHsFBJ9gSV4wHpMs/84uYzOb/z8LE4KuGIku5BK1tRV6rDyOYoIdLgPw2zPJqCmAh+/oAkp71pWKCP6M3A45uaOgxkbLdtUDQfDZn2oYW5tJ/qyIO6fJbvXVNAmoE8ZEdLHDMMoZiHua59Z7uFrF8Hyfriu1sMtC0WPTDB6sApXceicOTbFjO/jhvJbw8fmCIRYQMOa5p6EaJr59B78VHP0NC4H5mBd+AWOkSqhjvSMbZatOKnpZ9jBjmdc/yY9ZrOxyzhFJPu/FL8H4kUYEVfyJIYezS9NuMuMzoyGV7esIf4dmJtrc88GAEgeA+gCsTtwpMm+gOpscbup+lh5n4gyDAtZXoHJY3BpC3xAnDcHukNJL+BSyumG+NbBlZDNRp9lWsMH6Le+NWqYJ33E/MTlWhq6k4uGczn/08rrA0s7PzUJcxwZi0cGpGufSo21FsKqC0GuAkR466yXNqumStkUt5y9NBnuEWPjm8eqo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(12006099003)(11063799006)(56012099006)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uVBvh3yBzVFHfNA5Ia8j1UgoBFg2qvv8y747DJqDvgyePjhtkqITy9dLlu/D?=
 =?us-ascii?Q?nx1AI6vz3xDTaKUewSQkk/742luTt9671LdFFUzmrorAuNDXA61WQgxylhJE?=
 =?us-ascii?Q?sZECRydVcjz+ZNlr6AxFCmEve412J1Czx0Fim+yuOtv6VJiTVft/SWma1CG0?=
 =?us-ascii?Q?wlA9U6Pgjjd1Y430GRXn+9U7ua1nbO8eCiwRiobSLh53CpSklmqbOLwakTVt?=
 =?us-ascii?Q?nzvXxkR+TKZq5jtRH7YQmseYbSaNq5p0iZk485yugr0mcY5+TIpWle8cgitC?=
 =?us-ascii?Q?m6uD5irTjyyCwxxro6blr9m8pm5xoC3cJWQZzH+DGSfRQ2n4sq0y3CbVY5yn?=
 =?us-ascii?Q?soasmn+ntKUFcMYjIsrPKzAMxrDhnYY0vQo11HA6RTJc3X+lUz/A3jr67tH6?=
 =?us-ascii?Q?wIIpJrve249Z9UIoGKHdS+Ch9Zv+f2rpFQURgNELPl14OhaqqlH2jXtansuq?=
 =?us-ascii?Q?b5Yy3mjc9vi5YArht7wfHIbgnnmZUnCq61OH/Vdj6NayMY0VzTAz9Pa32Ss4?=
 =?us-ascii?Q?Ct3WPs+PYg7b+OlQxYRUgfdCaZaZzx/SvhWbOL/zmBfEO/2OHbQ4QBjXpKRG?=
 =?us-ascii?Q?+iGdxgInS7bt3dODYwBWfrrCD6IuCh6QcpsdkBINRoUmINIlUQfXmiWe0VAq?=
 =?us-ascii?Q?FijwX0OgfiYxyBfBa13n8sNZwXhqOkcKU4b/+J2LScTCSoreZCvy3XMDxu2H?=
 =?us-ascii?Q?gWO3+T/kYBgMPJSxETHTzIh2W6kDOBPow6cvasBtN6hAvs0mRSFX5C3W59iG?=
 =?us-ascii?Q?ffGcnttT+qres57mR6KVorjVwY+pxBjTwU+42iNyghGWPG8ZJgm8W+nYipan?=
 =?us-ascii?Q?MWtVtUMy81OE9mXrqLsM5irNLdS90mxHMLP6xfp/aB15BijfnLDXUrYIeXs5?=
 =?us-ascii?Q?OnkQ4XGX1Ror1FsiDZJpr1mvXwAZOPqeAe6t24L3/VTs3cUFH6S/gmkt4z09?=
 =?us-ascii?Q?0unZxdPxfuGOj/NL/6nrwCFRVpOZmtrXeyOVEPwrEQP3vhjLlsVxJZ6DHfD2?=
 =?us-ascii?Q?cx/wB/2uOeflLFwTO9CoyqzqR336dPjmDj3jpOt0C4KUoaFb5K0Z1W88YRtH?=
 =?us-ascii?Q?h/S4gNubAyN6eb1tNDpQ2PIrnNUW64wRclup8G2PXRZNc2js9A6HKrVQs5X5?=
 =?us-ascii?Q?R55aFvbKjGDhtIo1bUMySYBL0nbh9rijINx+AoomMObJL0gM0+dF8QTEQQK/?=
 =?us-ascii?Q?nGt9sAxy0foj7tNth7vWhvx41Tc0MWX6zcUSKeFvy3CrFl5TqX9FkVQdJzDm?=
 =?us-ascii?Q?2x6jyXLpLq4fc6qicKPECiKigFCUYs6LmUolBieE3QsS38gvyRFBvdANJ82y?=
 =?us-ascii?Q?2YWCsBvAS45S7tCF7TplXtBWoiDs/MD4PBAhWKA1xrcmZWfBZQ25dCzQ/xa9?=
 =?us-ascii?Q?I3CVab1r490QdEm9dARRoU9aLjZgESZhYEPSmiTkeq+JBnSEenRe2N3hslth?=
 =?us-ascii?Q?ncz+yNBqPWltuWmA+9YHp89+zTOBrYv/Ihqa5KhwXtOOX7haqjHNGrSTaxYH?=
 =?us-ascii?Q?CRJmxPSoYE1LFrsNRbJqhdyX8VOjRqCvXyCcYqu8NNdjvGbooWcGAHEhMJex?=
 =?us-ascii?Q?osCgCORPyU87kKXLPqkWICTPvEMu2k8RuQMjw1VKyitMYBXXwNi/oa6LrJ6/?=
 =?us-ascii?Q?8+uN0TAQB6DxPk0/9iNvGlIMqWs3R6tsjHiwA4Ma7bjlxsqAxr9awzC/W6lc?=
 =?us-ascii?Q?eEMdNtAmaaU94HYOQovqPPCPnbHmy0e6ZLW6PRyEFu57g1/Tr6kiLSiYbd0A?=
 =?us-ascii?Q?y5EBmdV4JA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: de23745c-216d-459a-804e-08dede5daeac
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 08:31:47.8182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYO3WLmoV3xksLuUVHtw3D9jd3qkiB01o4dkIxs6VFZZhJyyPP9jpxC+qSy6CWMqMby+ruCAG5Ybrea7NXcIb2pBpZ+1rMngUfaBLOh3fdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF2D2FDEF54
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 08:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240619

This patch applies the upstream fix as referenced in [1], using the commit =
shown in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-42250
[2] https://sourceware.org/cgit/bzip2/commit/?id=3D35d122a3df8b0cc4082a4d89=
fdc6ee99f375fe67

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../bzip2/bzip2/CVE-2026-42250.patch          | 35 +++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch b/meta/=
recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
new file mode 100644
index 0000000000..1679e74447
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
@@ -0,0 +1,35 @@
+From 71bf61d2e664c754ae5b1eb04018c8eaf5f99ae3 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 28 May 2026 16:15:45 +0200
+Subject: [PATCH] bzip2recover: Make sure to not process more than
+ BZ_MAX_HANDLED_BLOCKS
+
+There is an off-by-one in the check before calling tooManyBlocks. This
+causes the scanning loop to run one more time and cause a possible
+read or write one past the global bStart, bEnd, rbStart and rbEnd
+buffers. There are no known exploits of this issue and you will need
+to compile with something like gcc -fsanitize=3Daddress (ASAN
+AddressSanitizer) to observe the faulty read/write.
+
+This has been assigned CVE-2026-42250.
+
+CVE: CVE-2026-42250
+Upstream-Status: Backport [https://sourceware.org/cgit/bzip2/commit/?id=3D=
35d122a3df8b0cc4082a4d89fdc6ee99f375fe67]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bzip2recover.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bzip2recover.c b/bzip2recover.c
+index a8131e0..4b1c219 100644
+--- a/bzip2recover.c
++++ b/bzip2recover.c
+@@ -402,7 +402,7 @@ Int32 main ( Int32 argc, Char** argv )
+             rbEnd[rbCtr] =3D bEnd[currBlock];
+             rbCtr++;
+          }
+-         if (currBlock >=3D BZ_MAX_HANDLED_BLOCKS)
++         if (currBlock >=3D BZ_MAX_HANDLED_BLOCKS - 1)
+             tooManyBlocks(BZ_MAX_HANDLED_BLOCKS);
+          currBlock++;
+=20
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-exte=
nded/bzip2/bzip2_1.0.8.bb
index f922490868..b661bc9546 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -26,6 +26,7 @@ SRC_URI =3D "https://sourceware.org/pub/${BPN}/${BPN}-${P=
V}.tar.gz \
            file://configure.ac;subdir=3D${BP} \
            file://Makefile.am;subdir=3D${BP} \
            file://run-ptest \
+           file://CVE-2026-42250.patch;subdir=3D${BP} \
            "
 SRC_URI[md5sum] =3D "67e051268d0c475ea773822f7500d0e5"
 SRC_URI[sha256sum] =3D "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248=
e682cd0c4a2269"

