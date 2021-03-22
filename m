Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.43])
 by mx.groups.io with SMTP id smtpd.web09.12173.1616417574490193432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 05:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=fbTe2bLv;
 spf=pass (domain: kpit.com, ip: 40.107.139.43, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nItiEnSSGN4+3bP48hiKHEcNNdIFJe5ivu1s4ZmDMRiq0Aoe2VOQfhPWVnul7sWcU7/Gqi/VT9F0a4ZkY6C9H2KQwWtRCqYXu/LUeYIa8axYHnnMHrudroVTYmOCbMppdmFSUfQVrRfrQ3zu58nQ6y/vjflOCJSnNslc97nisu6p8Z4OnP/pOzQlK9/GZjiFFY6vIVVi+KKgDgMTPZ4NxubNFmSHpbWuMbTRG70LlqL3UruV/IZUTmfEmkiwmLuiDAurElk+giH4StmQ2wstfB9bhCLlSKPrUF85BKkF2Wbksr5bXqIjQLpBjzbluraMPhHoHYKZDFb4i1BdSOFsCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feTGeAUHNqntv6Xva0BdUnSoou8gkmJH9/A0BAxw2os=;
 b=lplFsYYDqS/pHtQz5YwxtMUhzkzOyr/oTYgfkNx0j1QyQwsL6YAGGtMzgbDYUPduSu9b6Dc9gOw+76s+8ls4LQhIIdjVXEQ+tMlSidShaTqeqihwzGxkg5CGDDGZp2qogMVon8+w40vkkrnIB8enKWZlHuFqRULMfEz86fN8jyIFvjfPTxW46YInpL925FRayUvwbx2QOoxqHHEMaL52LuE0Pq/XwdQ18CmkIMIMT2q8tHI44Vu0ynx0sW5Ysvky1w+Ttx3S5UL3WP2ql4zz37bH58x6+yzDvem+XR9wlDdGBNYFRplkv+XggSGEFBbqJy7dzId2LkEWYt1Wzfs5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feTGeAUHNqntv6Xva0BdUnSoou8gkmJH9/A0BAxw2os=;
 b=fbTe2bLvggJzsMoK3KoYyMZSVpn9T6H+hYQ85BrLn54FRd2jFtxRsKPX1Rlm3g1yyP186b9ECcQtqvofvXiGg82HbgyMD+H2tP5jypbZ51ADqQsQXOnpLCgreddEk0JZSF7SeB5eKCBez8WlryhXGGpQZUyr1YdUZt9Rw0pzZow=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:72::14)
 by MAXPR01MB3229.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:63::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 12:52:41 +0000
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d7a:e21b:b924:4765]) by MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d7a:e21b:b924:4765%3]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 12:52:41 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
Subject: [poky][dunfell][PATCH] glibc: Add and modify CVEs
Date: Mon, 22 Mar 2021 18:22:24 +0530
Message-Id: <20210322125224.17236-1-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2409:4043:2d97:c720:c922:d7a0:f0b:e019]
X-ClientProxiedBy: MA1PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:72::14)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2d97:c720:c922:d7a0:f0b:e019) by MA1PR01CA0119.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 12:52:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7c6ff136-e8b2-4b88-0b86-08d8ed31604b
X-MS-TrafficTypeDiagnostic: MAXPR01MB3229:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MAXPR01MB3229D2705CF9F4D358A3A5A587659@MAXPR01MB3229.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VablnIAIX1jFneGV1HACqQqe/kMzjobATZyKI+3HEEsdl5P2PwWQ7LAuUjXqGF/scxJJE77qKlvG/Tgjj1lP2eKY/X6yM4g2T57txQYApNX+pp9TZIWgBaW2iikgjGuJ7PD5hbjEuEOLyuliJ1uqMBJ/sIRs1j47gOwN6bD4DwP2PcJggDs5n6hT3RBoq5fLhXMiXHb5axwA165o/Y9M/HNbSTIfIc+R0duYNX6QfZe6U5rNfjDDipqlPXrrm3sqGn0eTM2v6PUbUG0SUsbV5rbSouZ3PGlWPm6bkP/Ptcq3z7yaiO/RxVAAJ1f3G3Ljzk9w/7TQ+jfKiZeNf4api9FWwlwIh6r8FpA7cO1k+gnCN/6RL2NbfDi22hWtkgTCZtkQb58gg3IlXlZbCR8lfw3aMoJd3uGN+/lOfQskIjFZCQl0wShmp7JYIjINQqa9rZXragYkzUiI9Xy6ftWy59Eq20tUl5YZ2az2tsdonTDpymA5Pp31enVY/IGI8E9yieCTIJKqllsKDG8eRQ8CtBnAiDZhF1aZbvm3nIhR7f48odRV6EJXVjajuiEYOQhjgRQonoOaN31sEmtKS89FJdUJo73se9044QZmTgbaBitRVfRCVMR40ylR7bjlfrtpaSYp6liK5+6wRq4jnLWpxergDX6ZopILP8ICLXE2UOpULr4+4Cn3gNOezYkxOgR1O81rNmJvlFG1+eb6LJqSkrUUxu3zVSklFHqFdmBZ3Tj8wOnzqX6rheJ/OtXXxdhlTDGlL0yECzOPrWQf9jDfqTdl5VPK52a5aA7QyBqX1ss=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39850400004)(396003)(136003)(86362001)(2906002)(36756003)(1076003)(6506007)(6486002)(83380400001)(66946007)(6512007)(52116002)(66476007)(66574015)(69590400012)(66556008)(107886003)(30864003)(478600001)(8676002)(316002)(186003)(16526019)(4326008)(8936002)(966005)(5660300002)(38100700001)(6666004)(2616005)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?N42Hw4FZsKPUdwCOchr9A/elQIU8tRPwaqw35CYlZ5ACKHkAQlDMyCUikjJZ?=
 =?us-ascii?Q?DG3xDbxPpRcF1guh1uDjTmyiGoRD6vvkyc8XgZAGbpFHK48qN5YIBliOQynn?=
 =?us-ascii?Q?Vfu20R3brSSzyiaq6Yjy9vAKPKEp90QTyWE7Tiqs9yL9ghepUHSOEbuUThD0?=
 =?us-ascii?Q?Q+i8UIRS449SeM6O97eBmHufjjxiVEQsvc/vnYDIzR/BZvowNJqsk3YCx4TJ?=
 =?us-ascii?Q?G04GNFxVR5a6RxV+mfPa27VjSU17nHDLQXrO2D7R36JHQqYKdrPDxE9txsee?=
 =?us-ascii?Q?40BF3B8c4TM/6SkgZq2Fci/pSoZ4OG+sqrCUhC4eGL0jDMy6Yem9P5CwCZ3F?=
 =?us-ascii?Q?LXEYunfnhK2/Gsb7GQ/DD0KBUGV1LsBpd1A8fVId63nFKmjWgva2YAIKb9gh?=
 =?us-ascii?Q?o31+bP6wFg4paazQkFiE8qFwVN6S1cWtlELB+8O1GXsUKQlNGcL5pNrR6cWQ?=
 =?us-ascii?Q?ULAypEp4FHLgPcx7mCZyj2LMrXZyli2Bg/1UQho5oyvrUTUnBbn6oImfb968?=
 =?us-ascii?Q?D9rNL4Dy9AsDa2dG9GDBwJtdfNGorHFlzZHbshz8zw2HdGMyLOkhuj7/wQy+?=
 =?us-ascii?Q?eSqaXlZ2vpYZS/uT8kX1pNUOTj/W+hecJcrrkcZoq9nkEmFlg0GfS/iUM6j7?=
 =?us-ascii?Q?4hOrjPEYcjO8kuP1KfQn27MKDJ5vx4KHMZEILofrsujf4NNuP/5KDuRPHRXV?=
 =?us-ascii?Q?P1SgPHg94e/PEzpopRiYHzj4C6kRKD9iLrgoq7wW7X7LwtOFwG6rvdjGQv77?=
 =?us-ascii?Q?KxUpVso3/9uYMg+cRNi0dsoPCdCoVJDT+eFsonAdbGniWWvIda086y2jcln8?=
 =?us-ascii?Q?0sGBiFJQpmgOA81+FUJOlhZMOTLZ4GQ3W4/lOVSjw59ap0yXBW0YE9cGDwMi?=
 =?us-ascii?Q?ddm9qQT1wzu+6iQhaWVHfsk1OsigopC98ndzoYk+rhk2Lv8FfqY/ncY05LrW?=
 =?us-ascii?Q?JflHXD73OETM5KxlL8/x4mJoPjCJFxAfwpUZ6hX48e/6txPK9THVVCUt7UiG?=
 =?us-ascii?Q?W/3KuKy+B/LKm+7qg2ejlbeXeohLtGRESJAwSDUI352AC4UR9ggHuEGdHhQF?=
 =?us-ascii?Q?yMrA/RbjPjFoTPof2720pMzmGRUwe0aAfEIe5YNheF+wUdvmH9A93nJMMnNz?=
 =?us-ascii?Q?HQ4/YCtX+k1uPnmZlibMnHk09QMExHV/F1fG+MoQbPYGddBGuZ+uyApyzEo6?=
 =?us-ascii?Q?q2hSlVVVSocxr3IikD12nQtdE7/6f0ZYKtAJi5mQJY071FK35DT2Cz0H9WIH?=
 =?us-ascii?Q?dZ0VVUdRtpAwBtPP2/diJirlsUzAURR3GpoHV1cQbZtgzNfoZlK10QMSiAkL?=
 =?us-ascii?Q?6uAOTIIpFA3zAEzLn8exNgtNSzhZafbXC0+XsGGLfq3UWKmydplOhCcD+d5S?=
 =?us-ascii?Q?ATV1zW2L7XbDLwjFGElT1vjN0cJj?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6ff136-e8b2-4b88-0b86-08d8ed31604b
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 12:52:40.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcyfnAbHwFYIr06zS5pgV95gpJDnO5MtscIQaQlb3BqPhi7Em+/guWla54sWDyp5Wfh7FMxOAlUk5shouPHGpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB3229
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Below patch is modified:
1. CVE-2019-25013
The previous patch was modified for dunfell
context and causing conflict for CVE-2021-3326.
Hence, the original patch is backported.
Link: https://security-tracker.debian.org/tracker/CVE-2020-27618
Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3D9a99c682144bd=
bd40792ebf822fe9264e0376fb5

Below patch is added:
1. CVE-2021-3326
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1932589
Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3Ddca565886b5e8=
bd7966e15f0ca42ee5cff686673

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../glibc/glibc/CVE-2019-25013.patch          |  52 +--
 .../glibc/glibc/CVE-2021-3326.patch           | 297 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |   3 +-
 3 files changed, 328 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-3326.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch b/meta/reci=
pes-core/glibc/glibc/CVE-2019-25013.patch
index 73df1da868..3e446f2818 100644
--- a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
@@ -8,12 +8,14 @@ area and is not allowed.  The from_euc_kr function used t=
o skip two bytes
 when told to skip over the unknown designation, potentially running over
 the buffer end.

-Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dp=
atch;h=3Dee7a3144c9922808181009b7b3e50e852fb4999b]
 CVE: CVE-2019-25013
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-[Refreshed for Dundell context; Makefile changes]
-Signed-off-by: Armin Kuster <akuster@mvista.com>
+Upstream Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dp=
atch;h=3Dee7a3144c9922808181009b7b3e50e852fb4999b]
+Comment: No change in any hunk

+The previous change was modified for dunfell context, causing conflict
+for CVE-2021-3326. Hence, the original patch is backported.
+
+Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
 ---
  iconvdata/Makefile      |  3 ++-
  iconvdata/bug-iconv13.c | 53 +++++++++++++++++++++++++++++++++++++++++
@@ -22,23 +24,25 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  4 files changed, 59 insertions(+), 9 deletions(-)
  create mode 100644 iconvdata/bug-iconv13.c

-Index: git/iconvdata/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/iconvdata/Makefile
-+++ git/iconvdata/Makefile
-@@ -73,7 +73,7 @@ modules.so :=3D $(addsuffix .so, $(modules
+diff --git a/iconvdata/Makefile b/iconvdata/Makefile
+index 4ec2741cdc..85009f3390 100644
+--- a/iconvdata/Makefile
++++ b/iconvdata/Makefile
+@@ -73,7 +73,8 @@
  ifeq (yes,$(build-shared))
  tests =3D bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-icon=
v4 \
        tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
 -      bug-iconv10 bug-iconv11 bug-iconv12
-+      bug-iconv10 bug-iconv11 bug-iconv12 bug-iconv13
++      bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
++       bug-iconv13
  ifeq ($(have-thread-library),yes)
  tests +=3D bug-iconv3
  endif
-Index: git/iconvdata/bug-iconv13.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+diff --git a/iconvdata/bug-iconv13.c b/iconvdata/bug-iconv13.c
+new file mode 100644
+index 0000000000..87aaff398e
 --- /dev/null
-+++ git/iconvdata/bug-iconv13.c
++++ b/iconvdata/bug-iconv13.c
 @@ -0,0 +1,53 @@
 +/* bug 24973: Test EUC-KR module
 +   Copyright (C) 2020 Free Software Foundation, Inc.
@@ -93,11 +97,11 @@ Index: git/iconvdata/bug-iconv13.c
 +}
 +
 +#include <support/test-driver.c>
-Index: git/iconvdata/euc-kr.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/iconvdata/euc-kr.c
-+++ git/iconvdata/euc-kr.c
-@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned c
+diff --git a/iconvdata/euc-kr.c b/iconvdata/euc-kr.c
+index b0d56cf3ee..1045bae926 100644
+--- a/iconvdata/euc-kr.c
++++ b/iconvdata/euc-kr.c
+@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned char *cp)
                                                                           =
   \
      if (ch <=3D 0x9f)                                                    =
     \
        ++inptr;                                                           =
           \
@@ -110,11 +114,11 @@ Index: git/iconvdata/euc-kr.c
        {                                                                  =
           \
        /* This is illegal.  */                                            =
   \
        STANDARD_FROM_LOOP_ERR_HANDLER (1);                                =
   \
-Index: git/iconvdata/ksc5601.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/iconvdata/ksc5601.h
-+++ git/iconvdata/ksc5601.h
-@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s
+diff --git a/iconvdata/ksc5601.h b/iconvdata/ksc5601.h
+index d3eb3a4ff8..f5cdc72797 100644
+--- a/iconvdata/ksc5601.h
++++ b/iconvdata/ksc5601.h
+@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s, size_t avail=
, unsigned char offset)
    unsigned char ch2;
    int idx;

@@ -133,3 +137,5 @@ Index: git/iconvdata/ksc5601.h
    ch2 =3D (*s)[1];
    if (ch2 < offset || (ch2 - offset) <=3D 0x20 || (ch2 - offset) >=3D 0x7=
f)
      return __UNKNOWN_10646_CHAR;
+--
+2.27.0
diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-3326.patch b/meta/recip=
es-core/glibc/glibc/CVE-2021-3326.patch
new file mode 100644
index 0000000000..5f4270a6c8
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-3326.patch
@@ -0,0 +1,297 @@
+From 7d88c6142c6efc160c0ee5e4f85cde382c072888 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Wed, 27 Jan 2021 13:36:12 +0100
+Subject: [PATCH] gconv: Fix assertion failure in ISO-2022-JP-3 module (bug
+ 27256)
+
+The conversion loop to the internal encoding does not follow
+the interface contract that __GCONV_FULL_OUTPUT is only returned
+after the internal wchar_t buffer has been filled completely.  This
+is enforced by the first of the two asserts in iconv/skeleton.c:
+
+             /* We must run out of output buffer space in this
+                rerun.  */
+             assert (outbuf =3D=3D outerr);
+             assert (nstatus =3D=3D __GCONV_FULL_OUTPUT);
+
+This commit solves this issue by queuing a second wide character
+which cannot be written immediately in the state variable, like
+other converters already do (e.g., BIG5-HKSCS or TSCII).
+
+Reported-by: Tavis Ormandy <taviso@gmail.com>
+
+CVE: CVE-2021-3326
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dp=
atch;h=3D7d88c6142c6efc160c0ee5e4f85cde382c072888]
+Comment: Refreshed only one hunk in Makefile
+
+Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
+---
+ iconvdata/Makefile        |   4 +-
+ iconvdata/bug-iconv14.c   | 127 ++++++++++++++++++++++++++++++++++++++
+ iconvdata/iso-2022-jp-3.c |  67 ++++++++++++++------
+ 3 files changed, 178 insertions(+), 20 deletions(-)
+ create mode 100644 iconvdata/bug-iconv14.c
+
+diff --git a/iconvdata/Makefile b/iconvdata/Makefile
+index c8c532a3e4..55c527a5f7 100644
+--- a/iconvdata/Makefile
++++ b/iconvdata/Makefile
+@@ -74,7 +74,7 @@
+ tests =3D bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-icon=
v4 \
+       tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
+       bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
+-       bug-iconv13
++       bug-iconv13 bug-iconv14
+ ifeq ($(have-thread-library),yes)
+ tests +=3D bug-iconv3
+ endif
+@ -322,6 +322,8 @@ $(objpfx)bug-iconv10.out: $(objpfx)gconv-modules \
+                         $(addprefix $(objpfx),$(modules.so))
+ $(objpfx)bug-iconv12.out: $(objpfx)gconv-modules \
+                         $(addprefix $(objpfx),$(modules.so))
++$(objpfx)bug-iconv14.out: $(objpfx)gconv-modules \
++                        $(addprefix $(objpfx),$(modules.so))
+
+ $(objpfx)iconv-test.out: run-iconv-test.sh $(objpfx)gconv-modules \
+                        $(addprefix $(objpfx),$(modules.so)) \
+diff --git a/iconvdata/bug-iconv14.c b/iconvdata/bug-iconv14.c
+new file mode 100644
+index 0000000000..902f140fa9
+--- /dev/null
++++ b/iconvdata/bug-iconv14.c
+@@ -0,0 +1,127 @@
++/* Assertion in ISO-2022-JP-3 due to two-character sequence (bug 27256).
++   Copyright (C) 2021 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <iconv.h>
++#include <string.h>
++#include <errno.h>
++#include <support/check.h>
++
++/* Use an escape sequence to return to the initial state.  */
++static void
++with_escape_sequence (void)
++{
++  iconv_t c =3D iconv_open ("UTF-8", "ISO-2022-JP-3");
++  TEST_VERIFY_EXIT (c !=3D (iconv_t) -1);
++
++  char in[] =3D "\e$(O+D\e(B";
++  char *inbuf =3D in;
++  size_t inleft =3D strlen (in);
++  char out[3];                  /* Space for one output character.  */
++  char *outbuf;
++  size_t outleft;
++
++  outbuf =3D out;
++  outleft =3D sizeof (out);
++  TEST_COMPARE (iconv (c, &inbuf, &inleft, &outbuf, &outleft), (size_t) -=
1);
++  TEST_COMPARE (errno, E2BIG);
++  TEST_COMPARE (inleft, 3);
++  TEST_COMPARE (inbuf - in, strlen (in) - 3);
++  TEST_COMPARE (outleft, sizeof (out) - 2);
++  TEST_COMPARE (outbuf - out, 2);
++  TEST_COMPARE (out[0] & 0xff, 0xc3);
++  TEST_COMPARE (out[1] & 0xff, 0xa6);
++
++  /* Return to the initial shift state, producing the pending
++     character.  */
++  outbuf =3D out;
++  outleft =3D sizeof (out);
++  TEST_COMPARE (iconv (c, &inbuf, &inleft, &outbuf, &outleft), 0);
++  TEST_COMPARE (inleft, 0);
++  TEST_COMPARE (inbuf - in, strlen (in));
++  TEST_COMPARE (outleft, sizeof (out) - 2);
++  TEST_COMPARE (outbuf - out, 2);
++  TEST_COMPARE (out[0] & 0xff, 0xcc);
++  TEST_COMPARE (out[1] & 0xff, 0x80);
++
++  /* Nothing should be flushed the second time.  */
++  outbuf =3D out;
++  outleft =3D sizeof (out);
++  TEST_COMPARE (iconv (c, NULL, 0, &outbuf, &outleft), 0);
++  TEST_COMPARE (outleft, sizeof (out));
++  TEST_COMPARE (outbuf - out, 0);
++  TEST_COMPARE (out[0] & 0xff, 0xcc);
++  TEST_COMPARE (out[1] & 0xff, 0x80);
++
++  TEST_COMPARE (iconv_close (c), 0);
++}
++
++/* Use an explicit flush to return to the initial state.  */
++static void
++with_flush (void)
++{
++  iconv_t c =3D iconv_open ("UTF-8", "ISO-2022-JP-3");
++  TEST_VERIFY_EXIT (c !=3D (iconv_t) -1);
++
++  char in[] =3D "\e$(O+D";
++  char *inbuf =3D in;
++  size_t inleft =3D strlen (in);
++  char out[3];                  /* Space for one output character.  */
++  char *outbuf;
++  size_t outleft;
++
++  outbuf =3D out;
++  outleft =3D sizeof (out);
++  TEST_COMPARE (iconv (c, &inbuf, &inleft, &outbuf, &outleft), (size_t) -=
1);
++  TEST_COMPARE (errno, E2BIG);
++  TEST_COMPARE (inleft, 0);
++  TEST_COMPARE (inbuf - in, strlen (in));
++  TEST_COMPARE (outleft, sizeof (out) - 2);
++  TEST_COMPARE (outbuf - out, 2);
++  TEST_COMPARE (out[0] & 0xff, 0xc3);
++  TEST_COMPARE (out[1] & 0xff, 0xa6);
++
++  /* Flush the pending character.  */
++  outbuf =3D out;
++  outleft =3D sizeof (out);
++  TEST_COMPARE (iconv (c, NULL, 0, &outbuf, &outleft), 0);
++  TEST_COMPARE (outleft, sizeof (out) - 2);
++  TEST_COMPARE (outbuf - out, 2);
++  TEST_COMPARE (out[0] & 0xff, 0xcc);
++  TEST_COMPARE (out[1] & 0xff, 0x80);
++
++  /* Nothing should be flushed the second time.  */
++  outbuf =3D out;
++  outleft =3D sizeof (out);
++  TEST_COMPARE (iconv (c, NULL, 0, &outbuf, &outleft), 0);
++  TEST_COMPARE (outleft, sizeof (out));
++  TEST_COMPARE (outbuf - out, 0);
++  TEST_COMPARE (out[0] & 0xff, 0xcc);
++  TEST_COMPARE (out[1] & 0xff, 0x80);
++
++  TEST_COMPARE (iconv_close (c), 0);
++}
++
++static int
++do_test (void)
++{
++  with_escape_sequence ();
++  with_flush ();
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/iconvdata/iso-2022-jp-3.c b/iconvdata/iso-2022-jp-3.c
+index 3eaa847ad9..c8ba88cdc9 100644
+--- a/iconvdata/iso-2022-jp-3.c
++++ b/iconvdata/iso-2022-jp-3.c
+@@ -67,23 +67,34 @@ enum
+   CURRENT_SEL_MASK =3D 7 << 3
+ };
+
+-/* During UCS-4 to ISO-2022-JP-3 conversion, the COUNT element of the sta=
te
+-   also contains the last two bytes to be output, shifted by 6 bits, and =
a
+-   one-bit indicator whether they must be preceded by the shift sequence,
+-   in bit 22.  */
++/* During UCS-4 to ISO-2022-JP-3 conversion, the COUNT element of the
++   state also contains the last two bytes to be output, shifted by 6
++   bits, and a one-bit indicator whether they must be preceded by the
++   shift sequence, in bit 22.  During ISO-2022-JP-3 to UCS-4
++   conversion, COUNT may also contain a non-zero pending wide
++   character, shifted by six bits.  This happens for certain inputs in
++   JISX0213_1_2004_set and JISX0213_2_set if the second wide character
++   in a combining sequence cannot be written because the buffer is
++   full.  */
+
+ /* Since this is a stateful encoding we have to provide code which resets
+    the output state to the initial state.  This has to be done during the
+    flushing.  */
+ #define EMIT_SHIFT_TO_INIT \
+-  if ((data->__statep->__count & ~7) !=3D ASCII_set)                     =
     \
++  if (data->__statep->__count !=3D ASCII_set)                         \
+     {                                                                    =
   \
+       if (FROM_DIRECTION)                                                =
   \
+       {                                                                  =
   \
+-        /* It's easy, we don't have to emit anything, we just reset the  =
   \
+-           state for the input.  */                                      =
   \
+-        data->__statep->__count &=3D 7;                                  =
     \
+-        data->__statep->__count |=3D ASCII_set;                          =
     \
++        if (__glibc_likely (outbuf + 4 <=3D outend))                     =
     \
++          {                                                              =
   \
++            /* Write out the last character.  */                         =
   \
++            *((uint32_t *) outbuf) =3D data->__statep->__count >> 6;     =
     \
++            outbuf +=3D sizeof (uint32_t);                               =
     \
++            data->__statep->__count =3D ASCII_set;                      \
++          }                                                              =
   \
++        else                                                             =
   \
++          /* We don't have enough room in the output buffer.  */         =
   \
++          status =3D __GCONV_FULL_OUTPUT;                                =
     \
+       }                                                                  =
   \
+       else                                                               =
   \
+       {                                                                  =
   \
+@@ -151,7 +162,21 @@ enum
+ #define LOOPFCT                       FROM_LOOP
+ #define BODY \
+   {                                                                      =
   \
+-    uint32_t ch =3D *inptr;                                              =
     \
++    uint32_t ch;                                                         =
   \
++                                                                         =
   \
++    /* Output any pending character.  */                                 =
   \
++    ch =3D set >> 6;                                                     =
     \
++    if (__glibc_unlikely (ch !=3D 0))                                    =
     \
++      {                                                                  =
           \
++      put32 (outptr, ch);                                                =
   \
++      outptr +=3D 4;                                                     =
     \
++      /* Remove the pending character, but preserve state bits.  */      =
   \
++      set &=3D (1 << 6) - 1;                                             =
     \
++      continue;                                                          =
   \
++      }                                                                  =
           \
++                                                                         =
   \
++    /* Otherwise read the next input byte.  */                           =
           \
++    ch =3D *inptr;                                                       =
     \
+                                                                          =
   \
+     /* Recognize escape sequences.  */                                   =
           \
+     if (__glibc_unlikely (ch =3D=3D ESC))                                =
       \
+@@ -297,21 +322,25 @@ enum
+           uint32_t u1 =3D __jisx0213_to_ucs_combining[ch - 1][0];        =
     \
+           uint32_t u2 =3D __jisx0213_to_ucs_combining[ch - 1][1];        =
     \
+                                                                          =
   \
++          inptr +=3D 2;                                                  =
     \
++                                                                         =
   \
++          put32 (outptr, u1);                                            =
   \
++          outptr +=3D 4;                                                 =
     \
++                                                                         =
   \
+           /* See whether we have room for two characters.  */            =
   \
+-          if (outptr + 8 <=3D outend)                                    =
     \
++          if (outptr + 4 <=3D outend)                                    =
     \
+             {                                                            =
   \
+-              inptr +=3D 2;                                              =
     \
+-              put32 (outptr, u1);                                        =
   \
+-              outptr +=3D 4;                                             =
     \
+               put32 (outptr, u2);                                        =
   \
+               outptr +=3D 4;                                             =
     \
+               continue;                                                  =
   \
+             }                                                            =
   \
+-          else                                                           =
   \
+-            {                                                            =
   \
+-              result =3D __GCONV_FULL_OUTPUT;                            =
     \
+-              break;                                                     =
   \
+-            }                                                            =
   \
++                                                                         =
   \
++          /* Otherwise store only the first character now, and           =
   \
++             put the second one into the queue.  */                      =
   \
++          set |=3D u2 << 6;                                              =
     \
++          /* Tell the caller why we terminate the loop.  */              =
   \
++          result =3D __GCONV_FULL_OUTPUT;                                =
     \
++          break;                                                         =
   \
+         }                                                                =
   \
+                                                                          =
   \
+       inptr +=3D 2;                                                      =
     \
+--
+2.27.0
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glib=
c/glibc_2.31.bb
index b75bbb4196..77eb5b481b 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -41,9 +41,10 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};nam=
e=3Dglibc \
            file://0027-intl-Emit-no-lines-in-bison-generated-files.patch \
            file://0028-inject-file-assembly-directives.patch \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-B=
Z.patch \
+           file://CVE-2019-25013.patch \
            file://CVE-2020-29562.patch \
            file://CVE-2020-29573.patch \
-           file://CVE-2019-25013.patch \
+           file://CVE-2021-3326.patch \
            "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
