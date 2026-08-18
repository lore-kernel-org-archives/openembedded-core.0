Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30422C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 14:02:32 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9464.1787061741674341884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 07:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Hz+pp6lN;
 spf=pass (domain: est.tech, ip: 52.101.66.31, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuuq/T6Dr63ZZ2Wn/ZudBotzV8oydydtH87kzj105v/gmsjM09hs0/FBeNnEQzYGA7Od7O5/VrEDC/QXJo1cyGWExvvbZcxmzOsaR9B/OOVHsR4w0hKjThBng4G1ewGu5pWyRffF0q9fZZ6GucAO9+l3HeoXhKqL/AxLK0Nz0cl3K8t7VY61oTEMrcfThllBwLUnSAjWqybkS4xcI0meKy7U41QEtrXgupntWHbNc5SzEapUSAsKjmfobKpb2dFysqPeodfkxkCv68lNKCeIw7nB2bHeFpKH1OSSa10hrQzh2s+3z2LgVyVNxNslq/Vb1PBqbFeRJ55Ccs6TmPoxbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2piK/aM6GfJDY1df/LE5WX4oNz0ozfzng2jvC0J8HjE=;
 b=s7/ea4lfb4f0hncGnavy8yxw9NmlSE05hfvr8+g4zPfa4okXRfpYYaLSTiCgfC0MKrajerS506LXujREvpo689YdORZB8ugNpYCId7PRLEsgnsM5pOtD7k7CadxuNrL3pFqIma3Ws2h99EAPJ/yGVqZVBWw9EtR/a1TPLkGcO1929UGpY7lU7av3SWC+A5lDuDY+iCev74ymCJnmgTlzdliHM0hCLomLMsVvKomP6cR+8t7klmHIrNWgLDMXnC2MmqW4FUjSjlONK83z7I1Rkk8yyHYwSN/hL0yNi8eN4b4+sr00rGXOfEY+W69qdNHC28M8g3VIRD6XLxkDwU9Sxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2piK/aM6GfJDY1df/LE5WX4oNz0ozfzng2jvC0J8HjE=;
 b=Hz+pp6lNU/EQWAQ0Z2nEcgF66AvDZWv6MsCzIJN8YWHokTYXNpdFAOY0R+SB01KGLxPw4XYKP7hbTniHa0nUC+NayTX/1pf94CTzT45ohwhCSVdh9rSBUy99A49IKZ7F5Ga/+0wtCOL+qaA1N0VNTe9jnxsW62s3dWCyxYZ4boE0qq0z56vQbAhj5Fj+EhkAW9ghr2vro3HdziUbDIh5DY/LdvBL4sWFjzcLmJ7QXfkfLBOemIrz0zCyl314p2IsXydJnwV8LGYb9ANvlemIw5Aiu9MrtQHPDzaGfAIVGYoD4zVn+g1pC2WB64/UNcUU0BLcyYlmfrowLnBfZLD2cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB2001.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:37c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 14:02:17 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 14:02:17 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] elfutils: upgrade 0.195 -> 0.196
Date: Tue, 18 Aug 2026 16:02:12 +0200
Message-ID: <20260818140212.55083-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR06CA0012.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::17) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB2001:EE_
X-MS-Office365-Filtering-Correlation-Id: a499321f-bb11-4b1e-e10a-08defd314ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|13003099007|29003799003|6133799003|3023799007|12006099003|25016099003|56012099006|10067099003|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info: 
	nACDHTngTbZFc6pe3ufYmbRQlV1p+tlBF64j/iUbijZPU5DGk/g4u+HmkINQnUV7+7H485pSHLNKKEksC8UCPUKY8mxgHtIMpCuMul3yqYinUK5rGwSr0jkHNsRmeTYHtF2pyhrL5h5KIhBfcGYRBHPmogtzCNJV3d0G6HGh2mzIVS0A1l8Zp82FhGoEkeAyHGD9O1BH2MgmYNMcVgI/TYApJDZtZfkmLEBQSCLeX8LLzKx9RTQtpKIuyoEPCLe5M4eBPoTBqpyoPISXPP3ZwiGP2qkVNzikbGDA1WQbIxxScJKocQGL+xD7M9ZD0P2kMGRWuqLdR3+OzeG9FpxTxmnHM7sHBJ1Q7klmtHSM1ft7zQr3RLNc7WT/DKCDtOegHT+dXMuLUoZzenjJfJJ4+rqlaiQ7/e2N0KXIWFag8XIL4Up7EwW7jQH+e5NUWKRnM8DuP3xZPqVjrdzAB9go0RO5dgc+HBUMZiZiXgObRnYa2R9Hhh8azSKtPtuUTEg+OWG3zfPmVQblS0h315ydGG9YVWldlHrsqeKccPXhCAxf5C5l9fuo/UGe6CK4NdLTS11VpHU+5IAZ4wfvwYpPyq2jCnxFMmcB95r+l47eI4I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(13003099007)(29003799003)(6133799003)(3023799007)(12006099003)(25016099003)(56012099006)(10067099003)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RSbdacmO4kHNNcr9zQAgBKxKqsC34dVKa3VwsdRVtU+mvTY+s70oZsS/VGwS?=
 =?us-ascii?Q?kdQw/WKZjGc6fhMXps0qFAzs9cmY9eTBpZD1unitSChpwig9uPB7SmXhyAlR?=
 =?us-ascii?Q?JA4kBlL82Yejf+l6O7nKMXE03h10ppRTbXakZMwfQ6HQSQpjgzixeOYw4P13?=
 =?us-ascii?Q?FOMZgcg3ccfDtjbogLPXpabTthhaTauHbu3OOsO09py78lftGxInnLwCYodR?=
 =?us-ascii?Q?9wXAdVM/LrHX/GYAddV3O0br0DsGCaAfjZrUsXOlUvpL90q7TwOcYmFKt518?=
 =?us-ascii?Q?8poAGZJTBTG16l04GEe+nmbfdkFq6cByRM3UfCchbzj7zm2z4Shry31x2QJ3?=
 =?us-ascii?Q?RGBU+S7hcOkhTalmjKvEVbRyIHiD4bwaexcru/ao0Q4UJJZSGPgQiXtbuQXN?=
 =?us-ascii?Q?R4QwfDUc0TPN+FT/z/Mhe9iLR5bkzpf95oxP+x1A7qYEpO5Jdi4BTD9ZKfEB?=
 =?us-ascii?Q?u8GXhD3BnsjvStI7Uq2huEQ4iLy6CNE2nO5IXn9KJM5flEp3LmEm0glrDEej?=
 =?us-ascii?Q?J6RKm/OxbAKxWpeRNVDZse/d6Xt4wmoxxIEWbT9lgHHTnkOJC3Ms5bvBAma/?=
 =?us-ascii?Q?VCHin88zBBXmdWvt4tIBFRc8HdO706JRQpTOv3MGABKDHQdOGEOMcRGpch54?=
 =?us-ascii?Q?RZR7RKQd6STiKBKJjRQuVDY1Q2GBqtSKBaiaaxxAI4h67lfuJvKrvLT9EAlu?=
 =?us-ascii?Q?/76dmicUblTKOIRrvJmsPSCLfQRzMApgmttEOeRRl88zl+V3zppRSkXfYA2V?=
 =?us-ascii?Q?+iB6dXDD5DkgHHzQlfl6zwzoqt9BVwfl+1RmkPDkOWLJHG3U4fvDh3O8gGgR?=
 =?us-ascii?Q?2uWNyDa0u762XwSJa0+bG4+l3xI442QwoMYlmKEtQVo4xWNgAEFQoNVKwnSl?=
 =?us-ascii?Q?0ugeytxGmFfCnN2xVcHAil/gj+J8Vw05vktyRWU9peIy9aClXgO5HQ3BLBIs?=
 =?us-ascii?Q?vzXCQNKZQ8am28ObuN3w+vfuksYGWPeTvyHWNiXR5JiZ1GvN5MR0jgXufZT1?=
 =?us-ascii?Q?+b2YKA/MrW5JIAZeLdc9mi9DmktCOACJ0bN499AF3dgUD53virfWdojYguMJ?=
 =?us-ascii?Q?mObPe9dpJeBShpYdGVQPz9yenZx6sCv98gBCuH3ZICYTFktzdOvIg54KoUP8?=
 =?us-ascii?Q?5NqN3vyOnV2EosiVlXNZhJfFdjaUGPRiFysp5fVlZRR0Ab3pjkI1muRLM5Jq?=
 =?us-ascii?Q?1x++RwKN1zmccKPfdnPPCWdCUfrqsZxW+dum8/QQDfh5RRA/NGecLurQWCvr?=
 =?us-ascii?Q?XrCT1WMLYr3b6T5CSAunO1YXADnhQDTTpA+I7eYWfmnfDU+5WDol/skw5lEj?=
 =?us-ascii?Q?QsLw4FbRfi3Hf5vf9bJ/EPznZGBbHPKcuB9i5ZmKAFLRxatdZF6N66BYajlZ?=
 =?us-ascii?Q?y0EZ01lVCDHJdhq/p/tN+yBZmDnIapHGi+GxjwbNlMCuOLM6IFHvPvo+4GnO?=
 =?us-ascii?Q?PkZZVrwbnNDpZcx/8LLpcGLg+C23KZRX8m1RveOnv1f6uTSz9XHX3hM/cKp/?=
 =?us-ascii?Q?L9QXy2uQe5dcSOPTZkKl4U36BleuJ45VlGm2o9kI/lMfQOPNFJv84q209RY5?=
 =?us-ascii?Q?bPKXYBDdloxOF9wsNoGsTlwbgXTv0VkFDjo/zgTSe9wonwO9NUm6cP0cVBE0?=
 =?us-ascii?Q?qsiHmFApdTmpoqr/o4ZssDTCI2g2txGighoj5aumKrpfdred+4ebYjwb1GLe?=
 =?us-ascii?Q?339gobmWUeqgc3zCh6UmTJRlc5jKkph7llBsdaKNZTekNpRw3JaWLtjObJKh?=
 =?us-ascii?Q?RXRvBsjpSisOO+NId0EqC+HzWvvryZ8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a499321f-bb11-4b1e-e10a-08defd314ffa
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:02:17.1937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQHHcHfiJ4VIJ47pHopirmYgoi5ocBX8NUxfgajuVIX+z9+X+r4jS4gEy+7SOZiS1hWsg4GA6PIhHaTDlAYSlTWAL91p/jTGLeZieybB2do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 14:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243685

Source: NEWS

Version 0.196 "Split Personality"

debuginfod: The $DEBUGINFOD_TIMEOUT environment variable is now enforced
            when establishing a connection to a server.

libdw: New functions dwarf_begin_type, dwarf_begin_elf_type and
       dwarf_get_type plus new enum Dwarf_Type.  Used to select between
       plain DWARF, split DWARF (.dwo/.dwp) and GNU LTO when opening a
       file.

       Added support for DWARF5 supplementary files (.debug_sup) and
       associated DW_FORM_ref_sup4/8 and DW_FORM_strp_sup forms.

       Added support for split DWARF debug data when contained in the
       same file as the skeleton.

libdwelf: New functions dwelf_dwarf_debug_sup and dwelf_dwarf_debug_dwp
          for querying .debug_sup and .debug_dwp section data.

libdwfl: Now correctly handles Linux kernel module sections that are
         not present in sysfs.

libdwfl_stacktrace: New functions dwflst_arch_from_uname,
                    dwflst_arch_expected_frame_nregs,
                    dwflst_arch_sp_dwarf_reg and dwflst_arch_sp_perf_reg
                    providing per-architecture constants.  The
                    libdwfl_stacktrace interface is experimental and may
                    be subject to API/ABI changes.

stackprof: New profiling tool for collecting systemwide stacktrace
           profiles.  Replaces the eu-stacktrace tool.  Requires
           a C++20 capable compiler.

stacktrace: This experimental tool has been removed and replaced with
            eu-stackprof.

srcfiles: Now handles CU names and files from split DWARF.

strip: Fixed bug where a section's sh_link or sh_info reference could
       be missing from the debug file.

version.h: New macro _ELFUTILS_THREAD_SAFE added to <elfutils/version.h>.
           Defined to 1 when the elfutils libraries are built with thread
           safety support enabled.  Otherwise it is left undefined.
           Thread safety support is experimental and is not yet officially
           supported.

Dropped patches:
0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch
  Backported in b4bd2a2bf6 for 0.192 from upstream commit [1].
  A later upstream commit [2] replaced the $(AR) t approach with a
  libeu.manifest file. Both [1] and [2] landed in upstream 0.193,
  making the backport redundant since 0.193. Verified libelf.a
  contains eu-search.o after build without the patch.

[1] https://sourceware.org/git/?p=3Delfutils.git;a=3Dcommit;h=3Df5d6e088f84=
dd05278c4698a21cbf1ff4569978d
[2] https://sourceware.org/git/?p=3Delfutils.git;a=3Dcommit;h=3D4eff110a60c=
b9c7b77884c61f5925fe844c52acb

Refreshed patches:
0003-musl-utils.patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{elfutils_0.195.bb =3D> elfutils_0.196.bb}  |  3 +-
 ...001-config-eu.am-do-not-force-Werror.patch |  4 +--
 ...u-objects-to-libelf.a-static-archive.patch | 35 -------------------
 ...-check-data_list.data.d.d_buf-before.patch |  2 +-
 ...-skip-the-test-when-gcc-not-deployed.patch |  2 +-
 ...m-compile-test_nlist-with-standard-C.patch |  6 ++--
 ...cvt_gunhash-if-dest-and-src-are-same.patch |  2 +-
 .../elfutils/files/0003-fixheadercheck.patch  |  2 +-
 .../elfutils/files/0003-musl-utils.patch      | 12 +++----
 .../elfutils/files/ptest.patch                |  8 ++---
 10 files changed, 20 insertions(+), 56 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.195.bb =3D> elfutils_0.1=
96.bb} (98%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libelf-Add-li=
beu-objects-to-libelf.a-static-archive.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.195.bb b/meta/recipe=
s-devtools/elfutils/elfutils_0.196.bb
similarity index 98%
rename from meta/recipes-devtools/elfutils/elfutils_0.195.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.196.bb
index 2093e1e924..e50fec3bcb 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.195.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.196.bb
@@ -19,12 +19,11 @@ SRC_URI =3D "https://sourceware.org/elfutils/ftp/${PV}/=
${BP}.tar.bz2 \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-=
C.patch \
            file://0001-config-eu.am-do-not-force-Werror.patch \
-           file://0001-libelf-Add-libeu-objects-to-libelf.a-static-archive=
.patch \
            "
 SRC_URI:append:libc-musl =3D " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] =3D "37629fdf7f1f3dc2818e138fca2b8094177d6c2d0f701d3bb6=
50a561218dc026"
+SRC_URI[sha256sum] =3D "fd5cc6b77ad6773cac93cb3f415f9318ac3b3455eecf801f6b=
4a742c4f6c7209"
=20
 inherit autotools gettext ptest pkgconfig
=20
diff --git a/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-=
force-Werror.patch b/meta/recipes-devtools/elfutils/files/0001-config-eu.am=
-do-not-force-Werror.patch
index 0149c64602..d460f2e58b 100644
--- a/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-W=
error.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-W=
error.patch
@@ -1,4 +1,4 @@
-From 5a82f181583e02e19ed739a195801032532474bf Mon Sep 17 00:00:00 2001
+From 975357f7585076a072f61684db20180ef8dd31b7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 12:50:48 +0100
 Subject: [PATCH] config/eu.am: do not force -Werror
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 deletions(-)
=20
 diff --git a/config/eu.am b/config/eu.am
-index 321591f..a1748a8 100644
+index 4ea7251..2b688b3 100644
 --- a/config/eu.am
 +++ b/config/eu.am
 @@ -135,7 +135,6 @@ AM_CFLAGS =3D -Wall -Wshadow -Wformat=3D2 \
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-obj=
ects-to-libelf.a-static-archive.patch b/meta/recipes-devtools/elfutils/file=
s/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch
deleted file mode 100644
index c2571c27f9..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to=
-libelf.a-static-archive.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ad94a59ebcc32f71853716aff650997076d112df Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Tue, 22 Oct 2024 15:03:42 +0200
-Subject: [PATCH] libelf: Add libeu objects to libelf.a static archive
-
-libelf might use some symbols from libeu.a, specifically the eu-search
-wrappers. But we don't ship libeu.a separately. So include the libeu
-objects in the libelf.a archive to facilitate static linking.
-
-	* libelf/Makefile.am (libeu_objects): New variable.
-	(libelf_a_LIBADD): New, add libeu_objects.
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=3D32293
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Backport [https://sourceware.org/git/?p=3Delfutils.git;a=
=3Dcommit;h=3Df5d6e088f84dd05278c4698a21cbf1ff4569978d]
----
- libelf/Makefile.am | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/libelf/Makefile.am b/libelf/Makefile.am
-index cc539c8..156a486 100644
---- a/libelf/Makefile.am
-+++ b/libelf/Makefile.am
-@@ -126,6 +126,9 @@ libelf.so: $(srcdir)/libelf.map $(libelf_so_LIBS) $(li=
belf_so_DEPS)
- libeu_objects =3D $(shell cat ../lib/libeu.manifest)
- libelf_a_LIBADD =3D $(addprefix ../lib/,$(libeu_objects))
-=20
-+libeu_objects =3D $(shell $(AR) t ../lib/libeu.a)
-+libelf_a_LIBADD =3D $(addprefix ../lib/,$(libeu_objects))
-+
- install: install-am libelf.so
- 	$(mkinstalldirs) $(DESTDIR)$(libdir)
- 	$(INSTALL_PROGRAM) libelf.so $(DESTDIR)$(libdir)/libelf-$(PACKAGE_VERSIO=
N).so
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-che=
ck-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/fil=
es/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
index 297cf19ccb..621be1b37d 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data=
_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data=
_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From 6b339ad9f9084b653b0d0c3823c871a7a9774b63 Mon Sep 17 00:00:00 2001
+From bf22ef3c1a559dc0b265a9c7c2fcda4a20519e63 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 16 Aug 2018 09:58:26 +0800
 Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before fre=
e it
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-g=
cc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-=
test-when-gcc-not-deployed.patch
index 7a9e1fbcdd..093d03c736 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-=
deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-=
deployed.patch
@@ -1,4 +1,4 @@
-From 168f8b6e37a762a6263c279d95fee9346e1f44ca Mon Sep 17 00:00:00 2001
+From db59c8a80a285f9cba3f789b6c2c240481b97db8 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Tue, 21 May 2019 15:20:34 +0800
 Subject: [PATCH] skip the test when gcc not deployed
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-co=
mpile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/fil=
es/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index 455704b065..eb2d48e3bb 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-t=
est_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-t=
est_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From 7355ed2e9d0e1f38ab87f115011ab498388b4a41 Mon Sep 17 00:00:00 2001
+From aba735bf19c60ff85731b3bfe79a6c83e17f3436 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 23 Jun 2020 07:49:35 +0000
 Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAG=
S
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 946c7d2e..32590f6 100644
+index 055fea7..ba25e61 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -118,7 +118,7 @@ endif
+@@ -122,7 +122,7 @@ endif
  test-nlist$(EXEEXT): test-nlist.c
  	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
  	  $(AM_CPPFLAGS) $(CPPFLAGS) \
diff --git a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-=
if-dest-and-src-are-same.patch b/meta/recipes-devtools/elfutils/files/0002-=
Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index b02f8e4c08..cc4c5ab75b 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest=
-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest=
-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From ad1bf27f823db8a48e1e64ecce2e6998e990dc41 Mon Sep 17 00:00:00 2001
+From 0533b0d67ed99fd2a034e497f0c07ff608ca52e7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:13:59 +0800
 Subject: [PATCH] Fix elf_cvt_gunhash if dest and src are same.
diff --git a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch=
 b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index fd0efe595d..41e4c738f3 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From 7b48ae456de3e2f2a94f91c800b238788d5fd277 Mon Sep 17 00:00:00 2001
+From 78415c6fc1f464e45222ba588a6cdc0292b4230a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:17:20 +0800
 Subject: [PATCH] fixheadercheck
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/m=
eta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 21073716a0..a5d913b2b7 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From efa2836719b669c3200a615898627f6b6a4dd570 Mon Sep 17 00:00:00 2001
+From 0064679018642a9e0e2c9d36eeeedc3a8278356e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -38,12 +38,12 @@ index d4a4221..f6336d9 100644
  /* State of -D/-U flags.  */
  extern bool arlib_deterministic_output;
 diff --git a/src/elfcompress.c b/src/elfcompress.c
-index f771b92..263de62 100644
+index 7818cce..ed3654b 100644
 --- a/src/elfcompress.c
 +++ b/src/elfcompress.c
-@@ -37,6 +37,13 @@
- #include "libeu.h"
- #include "printversion.h"
+@@ -41,6 +41,13 @@
+ /* Really should come from libgen.h, but we poisoned basename in system.h=
.  */
+ extern char *dirname(char *path);
 =20
 +#if !defined(ALLPERMS)
 +# define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO) /* 07=
777 */
@@ -56,7 +56,7 @@ index f771b92..263de62 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF =3D print_version;
 =20
 diff --git a/src/strip.c b/src/strip.c
-index 20cc8a2..2ce52e8 100644
+index a8ecc80..bf88051 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -45,6 +45,13 @@
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipe=
s-devtools/elfutils/files/ptest.patch
index ebf1d3f4c2..b6a9e5bb73 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,4 @@
-From eeafa586990429f440eb2dbd9b4231edff6ae904 Mon Sep 17 00:00:00 2001
+From abe164f6242825e827b6b13141883591d059d6fe Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 16:37:48 +0100
 Subject: [PATCH] Changes to allow ptest to run standalone on target:
@@ -21,7 +21,7 @@ Upstream-Status: Inappropriate [oe specific]
  3 files changed, 3 insertions(+), 7 deletions(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 80c7fd8..3e31485 100644
+index b0d1b48..acc29f0 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -43,7 +43,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2026 The elfutils devel=
opers.])
@@ -34,10 +34,10 @@ index 80c7fd8..3e31485 100644
 =20
  AM_SILENT_RULES([yes])
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 9a00541..946c7d2e 100644
+index 137e961..055fea7 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -943,3 +943,5 @@ check: check-am coverage
+@@ -981,3 +981,5 @@ check: check-am coverage
  coverage:
  	-$(srcdir)/coverage.sh
  endif

