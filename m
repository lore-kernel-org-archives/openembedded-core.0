Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BF1C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 10:57:44 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4371.1787137054919437714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 03:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TrRBfeg5;
 spf=pass (domain: est.tech, ip: 52.101.72.53, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sN9hiY7iXWzzu3VuG6533Qn1ef3mxvI4bf2+PdfsgEJZS4EbVojjKLrb+Eq1aKIHfqUjdK2F8Bn7OgYVQsHjtIt/2Irfc7SUpZzfFfGkg8EXF+BRoCY1Fiyy1/pWRRclptiTJEHxg6P6wnWVP0SrHJY+ySjHLnFVRP2yf5VeX3kH5ws/ZfgN+DSdUWSYqte8T3lUKi0f1u12eFqnUpfAM+dG98GwLmv2LtGRNa2sdYWr9ll7bxXqm+Q/eJJoqDP4jZFcjWskcxP6H7IFjxinzVY33a3OSsTYMeHfiM2iO1vaaQTrSGvBXzPFXQ8wfA9EXJ4eeF0SeGS3n0lz1zkzxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6Wrrlg9ZNXLnQSoOghzyCMMFZ9ro4N1ZbZXLLenOb8=;
 b=WCwSBNTDoGScMgUe5f9+k+IQLfa4OmE5In3k1VMWs+UvhzoG3ezH/t1un4giWxWtTAqAx4Lg8BDYyMZHTzfScAhYNMXpTI2KY/8Eh7rzMaT9WwpLnQa/DmJzmD31AzdOCpD37yAsMayFKsMVFPodFH2AnoOYEaOVdVCGigX7wSB2Y3g69tp8t0LDfzhwcMq5Agv2H3/tOomtZpNAW6WjahPVQ+YFg1glpgUIo5s3SWJ8mFFSYZLoAC541akEAmyxzg8btyCojPLMMgdW62i+N4qyNT3HdSeVNSmNbRM8zzHjwXA/Tw+D5W3g3y0MNUH1CQA7xRLF2Rpf5cyhcXzEzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6Wrrlg9ZNXLnQSoOghzyCMMFZ9ro4N1ZbZXLLenOb8=;
 b=TrRBfeg5T5P2kxQaQaIKquqH89kCCaq/JD21+7uvP6gjzQhlNfp/b3QaIau7npwtrL/bCjnIUdgJZvsmSfHayupPzR3veuqpaeEMZwS7GEn/TsF5XXJyjkWQLOYAQtq+VmEIjFDFEp1vIW15zHcWrO/yDc2B+Uki15sLU5p2FfJmJZ0YXQVJuRbFLxxvI8jDnqCHSLboiU7sMaB1fYaoUWEDJvcKMpNUQVULkYqdUV1gKggNmCuCJxfBXSCpONHLn/N9nDba4QnK5XYWLsfZoWEE4wwfGKHlaxrE4agXK5GWVwpe1979epXnQsvI//F8BIABfRbA6/2RYy4EpJFIUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI6PPF56464CAA7.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::199) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 10:57:29 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.000; Wed, 19 Aug 2026
 10:57:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2] elfutils: upgrade 0.195 -> 0.196
Date: Wed, 19 Aug 2026 12:57:24 +0200
Message-ID: <20260819105724.61332-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0126.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::23) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI6PPF56464CAA7:EE_
X-MS-Office365-Filtering-Correlation-Id: c1da152b-a0c6-4a6d-4d32-08defde0a941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|13003099007|6133799003|10067099003|5023799004|11063799006|56012099006|12006099003|25016099003|29003799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	NPzx3qmQkCpUqfgi9PJeIU+pizVuIOjzzT7By9FO0vcTB4Q5/IyDCrZjZs7fHGT+mCr2f/TcTK5Zj5AnIsvGRZ/oQsMYD2GqBHytmk8UZ2xmj8ahDpHZSr9JZW78gSP72PPqxYkTD9Fle3bldUEj0kcgH2FIf/gPsCRno3fUfFCDWki+XldzeSkNzNIOf8nFWrcUnU3xxHJ5HVZ8+lYhqAXkENYt+7/J0aaGnPM0KuaZXqyx7rcXZs5Wo/J+an8MyYArtZhKae1C+/DKYNEMoz0196xnRBsnW5Z5ECl0FnVlIfhlTWVNdq8L5Z3Yg5dlLUG7t4UzcOoCRuMDDWMgb6oZx8vxmpES2m5Jxd+0uhNwBbMNPn0RKUEdiQ5Xd1TZVQciEFCYH/qF1ow4fWbYFNPTTM1P9SRV+yO5AXhVl/jfqSd6OfQ4y4F0HxgAiAK6KLuoXPVbaHf6hxjBx0v33trJ6Gz5BzYwg8jWw1eNMNrRETpFjd3D0o5oWemNLd8At6PYJFQlauTibxdX1GXnbpdkSOQrjT4NyuXE73KYMkygS+3Z7z7bD803S4DWWkcg2rxgXUdbXtc2qq3X5zmRj9xxOTvjKFqV8MBg66rB3J0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(13003099007)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006)(12006099003)(25016099003)(29003799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T87vhLFp8kT39jBJNqsxYrneW4/54aoTigno3pxG7QoqQqVHFlUamvO/Tn8j?=
 =?us-ascii?Q?APc3Ra7aBkr/SaW9Wmkd9sDzLx0Ii1Po1cB2ldbNp2nRrGV2brXq6ANhxozO?=
 =?us-ascii?Q?vELcMKgpVUsZeq1pOI+Tk+5j2XIFqpWMxDgsU0OwUUrzTi7/ziLKBF8DGy6R?=
 =?us-ascii?Q?Y/285ucvQTegt22NOOD05DLqa2kvrZvfM2V9w3b3nbNvxliGQMWfCLnt2/oB?=
 =?us-ascii?Q?1m47V7vV09n2LAkM9LwIGqYzz7Tidp+OeJLSTaykk8T4l5jf01nDTLk3q2pB?=
 =?us-ascii?Q?fMHMJgJ/XWtaiBwrWIYa5UoEF4Z0n1jsh6xUJNSwd17DUUTZF4FEOGDXF/h+?=
 =?us-ascii?Q?UYKa6UFanTe7jwZ3Hjob92CiQ5/WmWiJTgEaGTDrGV5LNNeW+kivZyLHyCwj?=
 =?us-ascii?Q?J85MmI3lW00ircaUMKvm4pIMrHn/L7pn//S2sPFsK/hbTQcvdAJJNws28qUj?=
 =?us-ascii?Q?tO+u/xYGWrpv1z3CcFz9uC3ZAOGy52jOD2NBftjZOsNqORdzGwxkjtaemsSC?=
 =?us-ascii?Q?xJcMP9jXafpVR3rhRH7VXh+W3ycv3S1B0E7+L0K7XuTLqRTqD1YcS0RCR3JH?=
 =?us-ascii?Q?8VmJP4Zi4AJ6G4nZPLdfMb+Qyb5Af/pU1HMvTooI8NT1hnp+On6FQn2w89N+?=
 =?us-ascii?Q?2F4skvblUiE2v/evJIqLTuHBOrxjYWir0OcavMM9uVbay6HL8z3O0bnKwZfo?=
 =?us-ascii?Q?oVPnAaWnkcjRsJUERqeR6J92fFZnj2KBypXkdaOatSP9AcxB5BscHerTchnm?=
 =?us-ascii?Q?izKhq9ti3xPlP/5V7KFELypy+e0AyOdhpyckClS8MzYe34OiRAQMWIrdHQVU?=
 =?us-ascii?Q?pGCs8NGMLKUPzpW01uj66cgxdRbCF/ZOkMMkx5rddbxaeIg8tMk8Z3FWB3B5?=
 =?us-ascii?Q?EzQSclSfFe9dsLZXG/RioeMEVxEeFgO7rFIW1DsjiZVX/QqhMjmuJL8omO+7?=
 =?us-ascii?Q?/YtM9irQWM6MHHUKswiZUIWD7Hvo09j4cUgZKTRjfOvOFP2aYAf719/geoxo?=
 =?us-ascii?Q?OisTfMnm9RNIccGxvO4GnnI3n34/CdHrpUNdZsJGTfiu6fSxNlSMdYoHllWf?=
 =?us-ascii?Q?COx0TyXDLGxTDnOF5eRNcLbRpqCw5x7m396htDFORxo0H4VEORyF44NqAyi6?=
 =?us-ascii?Q?HtvxJRxN8Pzj6Nt+5ZUEWAZyZKd1wr9hVC3MS7REMWO86mBnMerXUF+Zrhwc?=
 =?us-ascii?Q?OCaihQfbd0TgnRSiM45XwYnYZGRRirXd2pxDAaDFKV3N3ZswJSs0qUzQmYvM?=
 =?us-ascii?Q?svR1jZF5gbfjT2yeA2Fu3DT6LpbPeZ+hAUuUW8+/3xPqBt/M/x1fH5UKvNcz?=
 =?us-ascii?Q?LxnQqWlT61V/Y+5fcwBkwfAcIoIhV/cN1O5B3o0h2NvzqA16H+gqgboPXYUj?=
 =?us-ascii?Q?VzlENcC2hiL0BQk1kP4dua60cykCE7A7emNcugPLxHqBYbzLUJC5P3HF2C1P?=
 =?us-ascii?Q?XM24wI0zdRhklCR+DFO+SB9QmCCMmwlrSAp7so6ZqucAkieNyXGOmmdc3iFt?=
 =?us-ascii?Q?c+/0bWwsLT7Pp6FFurNT6vjr5LJ1nyEHJvwKU/RhZm3evIO4rOFLpHiC7hnR?=
 =?us-ascii?Q?PVG2vXx5U+PFJ0SryqsfJ2PYuYvHJBB8y1yxDLiAu+moDe6c2o6cqEU654eb?=
 =?us-ascii?Q?vK7VB1KFSuJYGZAq8tzRoiYAAxkxQzYc5BiVc9NcgDH9Zb0KwOpMJ/a0oKqY?=
 =?us-ascii?Q?JLhh1vRMmDUKW/7t0wT7dkhx884j+4F8PqRr+x2BgN41zEUbxrcgP0tps6T/?=
 =?us-ascii?Q?lObJgxdHtP6/PHq4fgFWA/oClE7mFz4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c1da152b-a0c6-4a6d-4d32-08defde0a941
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 10:57:28.8750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHQeUFtUD7UdM8cAKf8f5MyCmygfSvjrv6Dv3qPSv3h86nSr0n998qiDx4b9hTUhNtCTe1/483KdfyzO7dAbrZwbc6D+6PoMvU6JjxEGZz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF56464CAA7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 10:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243723

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

Refreshed patches:
0003-musl-utils.patch (resolved conflict in src/elfcompress.c)

- install libdw.a into ptest, needed by the new elf-from-memory test
- Add stackprof to install

- Add run-stackprof-system.sh and run-stackprof-system-gprof.sh to
PTEST_XFAILS for qemuall. These tests need userspace CPU activity to collec=
t samples,
which minimal qemu images lack.Reported to upsteam [3]

[1] https://sourceware.org/git/?p=3Delfutils.git;a=3Dcommit;h=3Df5d6e088f84=
dd05278c4698a21cbf1ff4569978d
[2] https://sourceware.org/git/?p=3Delfutils.git;a=3Dcommit;h=3D4eff110a60c=
b9c7b77884c61f5925fe844c52acb
[3] https://sourceware.org/bugzilla/show_bug.cgi?id=3D34544

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes in v2:
- Install libdw.a for ptest (new elf-from-memory test needs it)
- Add stackprof to ptest (new tool in 0.196)
- XFAIL stackprof systemwide tests on qemu (no userspace activity)
---
 .../{elfutils_0.195.bb =3D> elfutils_0.196.bb}  |  9 +++--
 ...001-config-eu.am-do-not-force-Werror.patch |  4 +--
 ...u-objects-to-libelf.a-static-archive.patch | 35 -------------------
 ...-check-data_list.data.d.d_buf-before.patch |  2 +-
 ...-skip-the-test-when-gcc-not-deployed.patch |  2 +-
 ...m-compile-test_nlist-with-standard-C.patch |  6 ++--
 ...cvt_gunhash-if-dest-and-src-are-same.patch |  2 +-
 .../elfutils/files/0003-fixheadercheck.patch  |  2 +-
 .../elfutils/files/0003-musl-utils.patch      | 12 +++----
 .../elfutils/files/ptest.patch                |  8 ++---
 10 files changed, 25 insertions(+), 57 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.195.bb =3D> elfutils_0.1=
96.bb} (95%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libelf-Add-li=
beu-objects-to-libelf.a-static-archive.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.195.bb b/meta/recipe=
s-devtools/elfutils/elfutils_0.196.bb
similarity index 95%
rename from meta/recipes-devtools/elfutils/elfutils_0.195.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.196.bb
index 2093e1e924..e0b188ce8e 100644
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
@@ -65,10 +64,12 @@ PTEST_XFAILS ?=3D ""
 # See - https://sourceware.org/bugzilla/show_bug.cgi?id=3D32232
 PTEST_XFAILS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-ll=
d', ' run-strip-strmerge.sh run-elflint-self.sh run-backtrace-data.sh run-r=
everse-sections-self.sh', '', d)}"
 PTEST_XFAILS:append:libc-musl =3D " run-large-elf-file.sh run-backtrace-da=
ta.sh run-backtrace-native.sh run-stack-d-test.sh run-stack-i-test.sh run-s=
tack-demangled-test.sh run-deleted.sh run-compress-test.sh"
+# systemwide stackprof tests need userspace CPU activity, which minimal qe=
mu images lack
+PTEST_XFAILS:append:qemuall =3D " run-stackprof-system.sh run-stackprof-sy=
stem-gprof.sh"
=20
 do_install_ptest() {
 	# copy the files which needed by the cases
-	TEST_FILES=3D"strip strip.o addr2line elfcmp objdump readelf size.o nm.o =
nm elflint elfcompress elfclassify stack unstrip srcfiles"
+	TEST_FILES=3D"strip strip.o addr2line elfcmp objdump readelf size.o nm.o =
nm elflint elfcompress elfclassify stack unstrip srcfiles stackprof"
 	install -d -m 755                       ${D}${PTEST_PATH}/src
 	install -d -m 755                       ${D}${PTEST_PATH}/config
 	install -d -m 755                       ${D}${PTEST_PATH}/lib
@@ -90,6 +91,7 @@ do_install_ptest() {
 	cp ${B}/libcpu/libcpu.a ${D}${PTEST_PATH}/libcpu/
 	cp ${B}/libebl/libebl.a ${D}${PTEST_PATH}/libebl/
 	cp ${B}/lib/libeu.a ${D}${PTEST_PATH}/lib/
+	cp ${B}/libdw/libdw.a ${D}${PTEST_PATH}/libdw/
 	cp ${S}/libelf/*.h             ${D}${PTEST_PATH}/libelf/
 	cp ${S}/libdw/*.h              ${D}${PTEST_PATH}/libdw/
 	cp ${S}/libdwfl/*.h            ${D}${PTEST_PATH}/libdwfl/
@@ -169,6 +171,7 @@ INHIBIT_PACKAGE_STRIP_FILES =3D "\
     ${PKGD}${PTEST_PATH}/src/stack \
     ${PKGD}${PTEST_PATH}/src/unstrip \
     ${PKGD}${PTEST_PATH}/src/srcfiles \
+    ${PKGD}${PTEST_PATH}/src/stackprof \
     ${PKGD}${PTEST_PATH}/libelf/libelf.so \
     ${PKGD}${PTEST_PATH}/libdw/libdw.so \
     ${PKGD}${PTEST_PATH}/libasm/libasm.so \
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

