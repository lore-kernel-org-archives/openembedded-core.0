Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.44])
 by mx.groups.io with SMTP id smtpd.web09.10680.1616408890794966174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 03:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=cu9X484A;
 spf=pass (domain: kpit.com, ip: 40.107.139.44, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiQ3pWEI5Ueccq8UO10tdoQVKzfsbMuFhmrEC3vv7/o4BqJH4rW6kh4NgisHKYIzbkICE4Kv8ZUV/Xrde1G7aG+3hWTp+vMThny0v2sZQmgig4VW0Uqn0YURnsPG/3O6LHv4v432j0B+IDjtAnjK7FFftCyS8db54qJDUz3Z1kJGhXq47LWeFHHe6/JQz9hqVfg31/k1NAMu0yArDjnOzVbRPhszExm3k+rYotx5h3cxOQ7nEv2e/q0HkAcz2bvwXm3P2ZwKGkBsMocqitpt0yH7uMPcMgTh++6nWjawdVbnO5G/9IIJYmaGbPhvUwtXLHalMyYWuzAzoZ5mpLpi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feTGeAUHNqntv6Xva0BdUnSoou8gkmJH9/A0BAxw2os=;
 b=Rsk8hG+nR62MhoT7UGHLmQPKJuoPvwL0wvxhvs4evAMfmwpN5aJzaAJ91PG+xkBRk5qOIHm4IXGqoogS8knLodk6I8reoM7d0IdW5p5NJvrlBYufL3es9a5IoIpykdBsRrHwrKVPyroatyNiB3FtJtBECY4xffer6z9tKM8hzv5ZcC4tUB5wbSZuUtHNC7YWRWu0kvDdJOWNNcjO9d90+latH1sBkvDx2RDvTpMz3Y31UI5oHrlLe24J+q/Sel3XTYg2x2XifN9oH7iJ9tqCRi9qHr8vHyzD87Tr3HzRhQof3LcdJqjUDGRuHaCRq100bXOfRogtGc8xnkBP1F3S+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feTGeAUHNqntv6Xva0BdUnSoou8gkmJH9/A0BAxw2os=;
 b=cu9X484AnH9rnifNORQVIeP9fINrPpfbjHrnQrZmehD8QNPf7chIRuxLL7BTsnBeq4ZqJcu9zzm+WuMnYIyZ/9bJKsxdIXb/ZqPKuk6v5hd8yYtDJaTs/ABv5tNr3eWPWzHnOwTqiSqHKnRiR4VE0ewcCa5T1uhAb4zv/4GiumA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:72::14)
 by MAXPR01MB2205.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:50::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 10:28:00 +0000
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d7a:e21b:b924:4765]) by MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d7a:e21b:b924:4765%3]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 10:28:00 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
Subject: [poky][dunfell][PATCH] glibc: Add and modify CVEs
Date: Mon, 22 Mar 2021 15:57:45 +0530
Message-Id: <20210322102745.19513-1-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2409:4043:2d97:c720:c922:d7a0:f0b:e019]
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:72::14)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2d97:c720:c922:d7a0:f0b:e019) by MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 10:27:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ba578e7d-b672-4752-985a-08d8ed1d2a7a
X-MS-TrafficTypeDiagnostic: MAXPR01MB2205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MAXPR01MB22053FA96FEBFE89AAF6A46687659@MAXPR01MB2205.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	39VamizT1idtqTBmvVO+Pbh5UkqDIsng3+h+WoSe96xkcgPhGnrcfbuHseBKvqL4fvuyKNGswwgeVOyYjM4CFk5fUaqC2fI8hl2QOUzPaS2LV6Uu5+oi04oiI2LKF17gkGj7oLKOMVRwNlsQZJKjY2YFdwZw1quzWKM0S848yNWQ9mjnY4DF5a7o3EkyAamgVQ0S3rKFxwcoxUftJdIxC3a4boT/3EGnWYGf9iLXq2Rhe4UlcL7yXATkei8HsZZSNWm5RnGuzbeLKO+tQyN0WqsOqqJIS/cuP+krK/1WueG1JsNJGl47tgiMWYiW5f7rn3iYBDaOiigwGM48r3Frzp8fyK+5NxeINyxSfWUe6VTnrvY1A/A30+Ijg1z9SjP5Da0rW5dXWaE9IgueVdLybRtu4Hvc+Ry3Sc2NkjhkMsWrOk9iyY2VUEFKxqyCYzlTJ0sCyC9pQtqDH0vBaIKMKTfFys/zzUMFm4rlrUrMASfUnmFTsGsut5JDupVMSOGsWCiybIUGVxnq++7aRZOQUE0ION0H6Osq7ql2YcSMxb3UtzrPbJrq13fhn+35d+nqFFzIKcpsPG6RqNfv3xvSgxDTokPtZyAnGdtCHx9xerchzUd+RO9bm7DGtAjOhhDD8xDqSWwxxssdHkVaJvVYwmgzmxEwFOzpJXQB2I+eZ2J/1CQ5F2XPCO9zpeszvhgx+SvG/qMd7qboQjtlifSMnAfEHv8VFG3aAsRkV8u29rDVpsoqweZHDhTH6nCpkIbULO5amN46Ee6fzELn1PeiS96WRTNP1GSCNACSbtijFEU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(366004)(346002)(376002)(136003)(396003)(8676002)(2616005)(8936002)(6666004)(316002)(6506007)(966005)(4326008)(107886003)(6486002)(16526019)(186003)(52116002)(1076003)(30864003)(2906002)(478600001)(36756003)(66946007)(66476007)(66556008)(69590400012)(83380400001)(86362001)(6512007)(66574015)(5660300002)(38100700001)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?dqbcjnL0Z4nPmbBQ8TUzSPTKQ5dhn1YuAYEUHFDfzUDtUo1cqyoS0Cvx965i?=
 =?us-ascii?Q?ciXZd5g31j37WVQ8HCUK1IYH4LAmk9O79bx4D5huPzbSegGIknhgReB8W/9T?=
 =?us-ascii?Q?T3vGamVtOpUKKMTbZcx9fee6WulRNrS6/ME8mEU4Drjh2ZT6CnhGryvX3bHh?=
 =?us-ascii?Q?W0E0p7LeL+QinpmK6J4E41Wu1dy7jiol6CWc+jJIdijSc2VlGP+1aWPgfkfP?=
 =?us-ascii?Q?4AqCd7x6fu9N56bN9G+2H6Bhr7LNAYiuuUYZhb43Ql4hjCM++ZRC3DDrR+Lb?=
 =?us-ascii?Q?S5tEiinYvoCr1d46a5B+tPp8lE+8j3v98YVpggdApLvU6ua/7FTOBTfLZ5zP?=
 =?us-ascii?Q?79Kdki2M+oLB/WXjxXtfx4f+S46opfPV+tzc3sTXpeidrc8JdhhFTD732kej?=
 =?us-ascii?Q?IBNxOPxDEJFatsJk9x9wBDBAeg5bd4A0NmlLJW8XX0rzjbvkFYjiF8Dq4cci?=
 =?us-ascii?Q?RJisQqDFmgXkiEDl06rdhTCyjFyX0XsGeH7mh5aKiPuY8f0l3sFoEddrHfwL?=
 =?us-ascii?Q?9RVsAI9hjC1WgKYtEdlWpE/IhXmqsa6nhyjlT1hYA4nJ2LGcfdafek3k9wWP?=
 =?us-ascii?Q?qC+BaAjmvhnbIOBOf3NoAQ5jl2clvJG4F/B4+fDlT5s3nokv2A9RcE0nPmw0?=
 =?us-ascii?Q?LpDkSjictqn/6SBYCH+gsxsGpVlZff/E8tCVQL65f36X4Rio3vxdB+aHQ/aI?=
 =?us-ascii?Q?Inkd3ydyu0ZlGT0XjhRa3mA9X7vDdP+/eW8J+e3b3pI9+q3xkKROlTqPZD4+?=
 =?us-ascii?Q?pFDLnsPVWOivs8OI/jScIJCiTryRBrI8TrxSzrYPzsgV0I9Yffao81PJze/O?=
 =?us-ascii?Q?4lmBYNxYOC7Oh1zSGoUTKXvLZxEHct9/7g9KDrYs3NUirsON36S/+8DfK2OP?=
 =?us-ascii?Q?t/5zH1Tx9ZFwuDo4abX1n0ALzIlxjfHZkZ4u6o4Ovf1MugYRfQ9eTseVlXbJ?=
 =?us-ascii?Q?4Ysf6tgHfdLj0P91NFTVMckSxxmaUmCC557dl1CKMAhB+qCuiGdVsNc/Fad6?=
 =?us-ascii?Q?lOMAgmWxWa1cx9ju2neLeYT5C11ZnPszUerGOXMxlDMQxs4keF1xzdsKxOya?=
 =?us-ascii?Q?vcxJXhHUwvOY5X8CD0P4w2xFVuUdgf5NXkcXS2IuSeOYyal/9nG1P/+Wnvir?=
 =?us-ascii?Q?5X0XcnuqQ4NPozAuSZLwyhUXeHFi8k7DJkZF9HJCO6TFHZK959bOxsZWAAQI?=
 =?us-ascii?Q?WUaUXnhLHJH04536zMR8M0W8epycWVijwaQuWWBcyZ4hYybkLC9XI9n0vTEb?=
 =?us-ascii?Q?EiWpJzhgpjyj1yWL9fXfKPaeWGes1vtFCc9iCkW6bIvjpRZ/RBIzaq0K8sCD?=
 =?us-ascii?Q?6wHJY1dJeWDFVR9J3y2ccUVRf5+Bxlk4eyljH/EAWTlAPyANst/N6U79lEli?=
 =?us-ascii?Q?+DNjY2MJXUzzs6V0E4nCw/x3yXYd?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba578e7d-b672-4752-985a-08d8ed1d2a7a
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 10:28:00.0903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqNn8HJ45NysjGk38nhB9me9olFMQsx9PVPurDsRt0YwjkRVRguuCOJQldMdXzydj6a1+f+vQiGMEyZ+ewvwpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB2205
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
