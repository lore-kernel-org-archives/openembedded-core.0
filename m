Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EDCC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 12:07:01 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5683.1787227613258275668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 05:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HV7zPQyb;
 spf=pass (domain: est.tech, ip: 52.101.69.34, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wL2urlkuDIC+NwibPjPn7hO2yBPZLEN4F5PRkDvRwGtdW6C+wSoRGjclsHOiiPz6qUilq+HhJ+UEtR17Gmt9DOUYYgqgU6TWe0einLbw5b66i18ZQbBV5TN7Gnjdl+zsNU1qTtrNzrWYoEdjmJ3oj2YQGJ6MvkzKoHztzLsK1Tr9huK4J8gDU4tfNMxWi9X8GrlxBHaSuXIm7KeWRBsiWka7Bd7CyCEAWBsZPNTRPWRYGSf0SrJjavy5p8mDD4JBd2+WkkW1wRPXRG+xkUb55o+d2vULj1LNZuQozgpZn2CQQ9Nd9w7tKQmliTomvMuE80N5tUP2mCumt7LrS/LyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uatC2pvCLL1YdSYRIXURMDk1Rws1ZD79SaThLORBhM4=;
 b=axBOrqLt2HmyaDUWtr1ccBzuYLlO2I0zpAiN35++i6yyrdgeSlVEYFh+UOdoA+c7KdBv3/aFuWzlOLcUtxmmFGyyNOlAa/p4D/Q7TllIj5kSp2zc+jQz/DiriEQq7hJ1ButYRNTzbRxFTCzBwEjr+q+pvFayRe7WE0fV10vdCTTui+EmNPm46M6V917BtOZjR4AJMmC9iM5BA9SaeJ/Xsv0pmxcSl7/gBTuuF3p2EVJ+/hSSmNNuHESjiVkWMt144dN2mpRITq09f271RdKxaNSZTuQU07inaMwRSAehaujRBpdTm8jCZp9mU0CEDc2h4rpGgColJQwbsnb49ziCyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uatC2pvCLL1YdSYRIXURMDk1Rws1ZD79SaThLORBhM4=;
 b=HV7zPQybSjeAwJXdLfs9iWHZv0mpEP9TE3PDTtSjEVCcDgSeBxYCUbYPhT6s9H3RY8XjQgZqvPQx8TvrPV/9/Vh2hsBAdS89dLfSk6uAOqtT5rqiQEeP205x/sHXwBFWKf/t/ZGRHsLUqGHZLvVBGI3ONkhUPqHQOtWb79PMmdOsKk5AlFZinrB+u6jn34U6KTU39HVJWDjIh/K5yt00xupuRnmV/U+YT4lxOVHRdfYY2YxD+QfowejPZwOfzgoQ0Vys4eDk0xjWTdLozk7btM3zXtWh/8oLabb+aCp9vbeyHVk1VMY+KZZeiyshjiaG29ZqcQZTu6+qSnSfSILsNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB5P189MB2520.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:489::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.0; Thu, 20 Aug
 2026 12:06:48 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.000; Thu, 20 Aug 2026
 12:06:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libtracefs: use meson to build
Date: Thu, 20 Aug 2026 14:06:46 +0200
Message-ID: <20260820120646.21045-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P191CA0009.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB5P189MB2520:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f395504-372a-4661-5f61-08defeb382f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	vbEZmurzKUTeKeG3OeuUS/kchK32irIi3mzKv16TMEdh0DTwHhvpwKsSzJDaP01f3raGeiK41RCLtOykdYD9JWOExd4ZqyJ3/wZRl8ssoIVjbvQzFJfIQhMhIcT5DHeJrU5cWetU+jkZl2KcJjHIdsaTVhENiVbUgPmwXElBw8UUJ7psjcKvhoAqMefokyopoSYjQS3Y8N2gLOBjuNpgPCiEnMukcNuMAZMxzIYQzvEwHVcPZb0PDaz/b2InOlGp2xZ+sQFAnrC3NZW1Q4rm0cbcVdY7Gg2QF/CyXQqqBRZl9WDH2gAvlocDUoGwzU4H2xLP7yn1NtKwefLz5CDmkwyPN1qzL9s1OnH4yQAR+rhEj5O7MG4JonAdVCJ0Plg/Il17nBWEscF9R5zTsBFf1pjuZr3FfD7qOo1L7G6YRvvl0A7wsaAvkHgOLsoIwKXkYMr0exIGllKZmyYFQ3n3zdGg4Y771UuzjNSp8Itk3h2j8lbu1qPEMtKIKIr0WfM0cxY2pBfViIUJhlzxa0TowN2F0pKEF1Jm+hz9dNf+Nennvxy/1R+H/+ub1gzWscq2wRFxpYYqxuoDRwLBYmrlTGSHt1t84ba9fE41rVmlMoHpICL2D80IIQQolQEGHE9nAahR3/VEF7X9Ujjp3bjv5SdqXsllxFEqmSF2dbYxi/I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P5eFPv2uUlcqDIyXaFo2txaqRvo/eIg9roYATTdTqEPTWGC9mBTJSu8Vr8h3?=
 =?us-ascii?Q?4s4xUaRiLv2mCe9uYbj/XBDZPSli4lFnfrLK/IWdKMF53QUmNI36HTSC/m0s?=
 =?us-ascii?Q?4hRDLr70/B2RU627IoD7b/a3yvTFN5dP61A+sdeZe7noIj9JaTcK9wLns72L?=
 =?us-ascii?Q?DKL7p4RVSjxCPfvEEFYmSCQXNraQ1zUr4zSxrHgCwPTqnmZPH7vg36jhaj7s?=
 =?us-ascii?Q?2NzHQODGULB9P+1h0k7lWTiiImXvdIkmEyQljWNAWZAfov2dLFpD2LqWZoA+?=
 =?us-ascii?Q?fqFRXKtk5oQEb7Wcr70M91SAHS+R1UsLwKTmnynPsjtkMVV6+WMmrL5XBR66?=
 =?us-ascii?Q?s1mYV1Qv9AkBG+XaW1jRRqAVLU+rcUT/5+HuX0BANTUOH7eXsINqTTnetmfK?=
 =?us-ascii?Q?NSz6sAapIWGIjAUtifEURl0GGG9sOdsCogZ4bsFnP8JXif2y3CU1Rlcsjg1Z?=
 =?us-ascii?Q?UwkZqrdta7RPTM+rHLGeaeRJIWJsTJPWAMjufgCZ97zRBsYB2wb3T3JoVM1Z?=
 =?us-ascii?Q?RQ83ef10WxZ6kRDVuPsCTWWUraTxQZgfI+TGygJSTOW8r07XhtW5GTH56kC7?=
 =?us-ascii?Q?VEf9w5B9FAh1Vs5Y0OLxixjA9WLg/VsONgpNSK4ZLjzbiX3wcnGV7MAdqUwl?=
 =?us-ascii?Q?bOt5MTNP9SLXLMAeC3fA9RAQWaI/XIlwHTqDqa7yu/mVuECQGB/4e9poHZBI?=
 =?us-ascii?Q?JunDMbevt+Jf6G+b7+VbyGgMqedaDmzku6xNoCI8q6ghNCM3042xk1sP5Ige?=
 =?us-ascii?Q?7YjJewMIg9PReb6dfJPXiioQZnY5/ENFziH41YsvNbzbz10xcOEyWKs531Y5?=
 =?us-ascii?Q?DiuuKG9vu9MFsWIhYjyfHYqPbG/qkrA0csMyBuNksn6yVq0pFotLtTJYzmR4?=
 =?us-ascii?Q?s+wid1a63Rui6vP43sSN3CGPTr9XFMr2oH+wNDyb6IOrVw79K7q0eDOyzUi0?=
 =?us-ascii?Q?DId3PCc15oqqwEyjbSgYTJb21oKEU179VEbCiCo2xaEn3k+TWxfegOeVRuW2?=
 =?us-ascii?Q?Psl+8HzuK5TdBa1MHwaoKLuTxeskDBWsjWGpSEHhR6cK5mbPRZZPhhQ6Shbo?=
 =?us-ascii?Q?2S9dk2QxRw07vtyDJoG+g9K3kob5hMEaTaONlzp2u0oaHwlEZFZlk9f/0I0U?=
 =?us-ascii?Q?L7/TCNc0MHNhHfE/Ht7bo5lLMgpMz200x8G0EcbWLnUgV5s+m2MDs4XXJ+Qx?=
 =?us-ascii?Q?qqvgCN3ryf7PnoFTvAtAKZyrGNm8Y8yprgbVCvCnFAC5idJliwMO1+lJRDDV?=
 =?us-ascii?Q?E0CoSgGD/KSNGpbMzQzzvaspREhYiMPULDItPFxwtHi0ZBIv7pFvO9QXUrZg?=
 =?us-ascii?Q?KM+DVostKBGQ9Le5mSZkjcP3Q7XtWlnWfViPP9SPMI3QUsb5XvYvokyx2efV?=
 =?us-ascii?Q?wGD0xc8rAu1hggG/KdyyuZxPIs1KoVEA8mdcK8Hp4XTnavSOJsB8vYDuBwnB?=
 =?us-ascii?Q?6YaQyMJwoZ35mDZiR8Mmnk0ZbK5NTYH4jMMWwh5IcyWIqxWBpVqCTbmuJ67+?=
 =?us-ascii?Q?k1MoGmkFyfiWs7D5ik9ijf4rjCIc/5B7c33kBxeM3hO0n5nBjotEzFdlL1ei?=
 =?us-ascii?Q?SA8+7XnkvLhw0Lj9w+4or2lLXh5bbTt/MDU3TMdfT9gRbxM9aOlfJm+wriSI?=
 =?us-ascii?Q?Zfj+CpV+9f2mAT9Lq+QTd9ZlgDgtKVkL3QArEDFFsmrUm3ZXMq3/wl92Z8Mh?=
 =?us-ascii?Q?jO468HqzhqRL06fh884k/9VAEQOkvZ3at2h1wL1tODLjvhKzGIankPvrEBsw?=
 =?us-ascii?Q?Tl5whlLLk6pwsiulVCNZQvyIrg48hXQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f395504-372a-4661-5f61-08defeb382f3
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 12:06:48.4295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TV5VUNwav4WejiiS9ePOY5eoKupRjyWVIUk6xPkil77dtN7NHrhKZbPapA72MTCBjdsAJVeaj9ihO2sjJLQ2FWsFkAB27Tk7Y2BUPR1wcVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P189MB2520
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 12:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243855

Since 1.8.3 libtracefs supports meson

- cleanup copyright and stale license comment from recipe
- drop the makefile patch for preserving ownership in cp
- remove do_compile:prepend for sqlhist.tab.c and custom do_installs
  as the meson class handles
- Add PACKAGECONFIG entries for doc, samples and utest.
  Meson defaults these to true,  disable them to match the previous make-ba=
sed build

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...not-preserve-ownership-in-cp-command.patch | 28 -------------------
 .../libtracefs/libtracefs_1.8.3.bb            | 21 ++++++--------
 2 files changed, 8 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-kernel/libtracefs/libtracefs/0001-makefile=
-Do-not-preserve-ownership-in-cp-command.patch

diff --git a/meta/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not=
-preserve-ownership-in-cp-command.patch b/meta/recipes-kernel/libtracefs/li=
btracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
deleted file mode 100644
index 7eaf29e4c4..0000000000
--- a/meta/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preser=
ve-ownership-in-cp-command.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ab6f78bfd6811c648ee71663cfc4dc8be151a519 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 21 Dec 2022 22:50:56 -0800
-Subject: [PATCH] makefile: Do not preserve ownership in cp command
-
-Fixes
-ERROR: libtracefs-1.6.3-r0 do_package_qa: QA Issue: libtracefs: /usr/lib/l=
ibtracefs.so is owned by uid 1000, which is the same as the user running bi=
tbake. This may be due to host contamination [host-user-contaminated]
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 7f4f5c3..1ba7b9d 100644
---- a/Makefile
-+++ b/Makefile
-@@ -296,7 +296,7 @@ endif # DESTDIR =3D ""
-=20
- install_libs: libs install_pkgconfig
- 	$(Q)$(call do_install,$(LIBTRACEFS_SHARED),$(libdir_SQ)); \
--		cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
-+		cp --no-preserve=3Downership --recursive $(LIB_INSTALL) $(DESTDIR)$(lib=
dir_SQ)
- 	$(Q)$(call do_install,$(src)/include/tracefs.h,$(includedir_SQ),644)
- 	$(Q)$(call install_ld_config)
-=20
diff --git a/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb b/meta/reci=
pes-kernel/libtracefs/libtracefs_1.8.3.bb
index c010555b1f..0f3d0ebe2c 100644
--- a/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
+++ b/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
@@ -1,6 +1,3 @@
-# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
 SUMMARY =3D "Library to access the kernel tracefs directory"
 HOMEPAGE =3D "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/=
"
 LICENSE =3D "GPL-2.0-or-later AND LGPL-2.1-or-later"
@@ -10,16 +7,14 @@ SECTION =3D "libs"
 DEPENDS =3D "libtraceevent bison-native flex-native"
=20
 SRCREV =3D "6fad6a14ba0d4c4b437d9e4eed7098d4bb07b4fc"
-SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;bra=
nch=3D${BPN};protocol=3Dhttps \
-           file://0001-makefile-Do-not-preserve-ownership-in-cp-command.pa=
tch \
-           "
+SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;bra=
nch=3D${BPN};protocol=3Dhttps"
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[doc] =3D ",-Ddoc=3Dfalse,asciidoc-native xmlto-native"
+PACKAGECONFIG[samples] =3D ",-Dsamples=3Dfalse"
+PACKAGECONFIG[utest] =3D ",-Dutest=3Dfalse,cunit"
=20
-inherit pkgconfig bash-completion
+EXTRA_OEMESON =3D "--bindir=3D${sbindir}"
=20
-do_compile:prepend() {
-    touch ${S}/src/sqlhist.tab.c
-}
+inherit meson pkgconfig bash-completion
=20
-do_install() {
-    oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgconfig
-}

