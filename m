Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.81])
 by mx.groups.io with SMTP id smtpd.web09.1191.1611872627295407106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 14:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bEKRS2OW;
 spf=pass (domain: windriver.com, ip: 40.107.93.81, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VU5vHCc84sjHvlRlEmL5RTtuQUhUGrBpVik5QqC7C533NDbYt6DbH6jgULQqyJEmE+O+Iz0eq1DEunqTYsRc2HNGD6gFcO+xMOdzc4P6oatgaJJTCY/2ZtA9chxa+efjUtcYcd3rJN/06PGVa6v2LuQKVVYsIDtGUasiTf+ApwWV40T7cXI49q63VD5eVGYo34m9a93qzXAqEjxTo+Q3FQS0PiQs2WDVMj/enyzXzJUqDF2xxo+v5zC682j46bk63yzIKAkQBsKF8YC5ztJEf7iJ6FUdFjRxuCtWG8IXiz3yMFm88shLjF0NzEoXlZDnEmUyQW0PrQGKjSwsETwBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHCXwuNou19hPJk1r9QqIamX8ptWk7q+1xeX8ejrm/Q=;
 b=oThMrtkZuxou9vxsapo1u5Prkc4o5D/grJnqRRva5/xQHrI5Mz7lMqUBY7jeMtTHbphqgY5deyXyOKquCutXExEcJflK0/D60OrlXqypR+PPksQOXEiTqjOX8Sy91XwCgzl37+iQkOI5Hs91oJJaQx5GDE2BWwRPRO2Lk+5h3Uh0nRQKfWRdDdOnsT8OFwRpeMOU9qyyLhOcDSabMJxXkpcOH6JJ1yxaYroJDVC2VwspRcbIn5DzsZgTkss+BVQwDv4x70SGZFz2+4waO9ZEsn3AnPV5EIuLZkHl61XpxiE7RYf86AQR4lyRrU4hJMHnPJvX7fTtg6bkOa7H8wzetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHCXwuNou19hPJk1r9QqIamX8ptWk7q+1xeX8ejrm/Q=;
 b=bEKRS2OWoiRx94BrgvppPp2BFgJdfPLwWYhQzr9zLQv571Hns86cdMCPSHqGsytwXv2xUwdqfPmbmVdPbHQMtpog94nkNGSYytu6K2IpOuEljRFZzMRNAuXSB5IYumr5knzvLcsjzl4JTW0//CU10jgycbFEDVHEtwNaCBXAetY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3503.namprd11.prod.outlook.com (2603:10b6:805:ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 28 Jan
 2021 22:23:45 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%7]) with mapi id 15.20.3805.019; Thu, 28 Jan 2021
 22:23:45 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] glibc: fix CVE-2020-27618
Date: Thu, 28 Jan 2021 17:23:31 -0500
Message-ID: <20210128222331.15959-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 22:23:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14ce1b51-ce83-4482-a35d-08d8c3db5ff5
X-MS-TrafficTypeDiagnostic: SN6PR11MB3503:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3503D1478F57DC0A4C44978280BA9@SN6PR11MB3503.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bHFdZg9DBNzXCRtyGooyLMC1U8uE8ECmrp+zaXIcW3Mo2upxp8FZJ6M1d+w2Zm017n0ZqJ4T6Y9Whlp7miqND34UcIWxli20deBP9eJ0ps4jjhqyp02CIcXy4rlQ7SthiB9Rbzy0L0TUoEOpQtBGs7iPdcSpmZpObQ2huppxrNaAuwev+BL0VpFqkcDLSlbjyE086+Ta8QGPhWrOdvg2KgRx+uQVgeL8PPAkrRBYmfJpIpzFoJ6Xqx62128J7ZE4rTDnGCb3lo0ILUagge441mDfZlam+uDvQhlYh8ZyLJdDfUkntc27pWOFR7B18eXeurIkmP88sDHpEqjzDJfjh0g8UXjgl1P89UFcmWomqOWRNponDlGO13BaWHIYV5f7UDBSdpYCr6WNgmvPoXvz44L3uOU/GJokhnIiOJ5HQKlowDSmWi7HeRreYhtMTe7wax7VZBQSSl5DzjoYtRodT9DnmBbN2/W2yXjZgtclq2Fsp9P8o6HsvWg/DI+AmYernQcMKGziD62CzSU+ul9cZUh+IfCCebVpxAhXw5LPZG9f+igrdUNrgTCylk3sycYllgptqzyknvmg2rRkLAIqbggI4teKVp//fPEu5V+dIaA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39850400004)(376002)(186003)(2616005)(6666004)(83380400001)(966005)(5660300002)(316002)(2906002)(6486002)(6916009)(16526019)(1076003)(478600001)(86362001)(6512007)(26005)(956004)(8676002)(66476007)(36756003)(66556008)(66946007)(8936002)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?XBN0yTof4ffcimDQMfiutfdlOOuXVhlVegjw7KQkM2UO5Gz+eMMeMNDsd2yB?=
 =?us-ascii?Q?5EzmkAHeuJTmpCQFvzBKY4noqPf7jizl8DO3Nd5Xsn1lJGN7jDgC8LXv8Oag?=
 =?us-ascii?Q?dEzcWX/pFtbdnqsLvAgP5PyLYrFyacLblPgKs9+pljWNbuqVgr83pNlUWrx1?=
 =?us-ascii?Q?v1cIgiFQbGwnqQDbTwYr71NEodBACNbjqz/kCxWHnjrQyyBBuoLF3idMjaow?=
 =?us-ascii?Q?sPhDvzhiaX3xOtckaZT8q0/3pQciAamRTFIpmic0+hOJFxzJ0ieF5eCRUxmE?=
 =?us-ascii?Q?02DQs1mAA+qPaYlnqWR5xQ+ma640LsZVQr33u1ErDEwoxwfsMOdRclsDiV2x?=
 =?us-ascii?Q?W/V5a4DyoNKsa9fOkA01yvbwAPDHrTZqD4LF14SuPA+daeCHe1sVn4dp1LYr?=
 =?us-ascii?Q?qlExAlBAzFkb3sQvExu41nMYUaxn0LwFYOB2kFmrjG/MActFugLkMtvwhZ0r?=
 =?us-ascii?Q?1p5xXpXUYBc9GFdZLReWVy39Bri+BSIqiF3gt7FxF0QgFbLMqZVvJlwMW7Av?=
 =?us-ascii?Q?XfSZAm/yyerBASZeooMHx+mpZsQwSCIdfbRg0+mjoYpNfpEigqOiAyrRl9ZZ?=
 =?us-ascii?Q?ZE+eim9h87OR5o9qb1xNpSmBb90hEI4Kyh63p+tJe5kl+6QlnELK115QpeVV?=
 =?us-ascii?Q?jZLNO30kFh7oPpLUAr22wwsePIg43sM6ZNL4Hh/kvGuicTh29C9K2folTkBm?=
 =?us-ascii?Q?LWziyfkIb0dw7ZfjKsLQOIAWtZFM3aPBWx+uOF9xf+Gk8aigFfuWLTM/1C/B?=
 =?us-ascii?Q?8CY3YOy0mO8AqJoKcmHVWcpoFshC3sVsUAAVbVSLKlmImKdlCJCX8UMTjyOH?=
 =?us-ascii?Q?MVdxFbHzh67FLNoRHmET2Sbp9xmXY9ramSzmxJyb1OQPAAys4nVVqNXFsAB4?=
 =?us-ascii?Q?shp6pIXIb9HT06oGlx/hDuLtkgVdswnl2ignEDtXuRhvTxqvifOQNyD+ekcL?=
 =?us-ascii?Q?p/hJ0r3yiFl7Cs9INuP46rGU6Eq0gwRKb9c5KwV3yXpG6/iaYV2BWJk/Ll6d?=
 =?us-ascii?Q?44MmYKhs59eBZWeXXwd8hXlY+7VhJeONwou2Gz9hyHpFoNODSrjPQUOpx09u?=
 =?us-ascii?Q?U3S1CSoJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ce1b51-ce83-4482-a35d-08d8c3db5ff5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 22:23:44.9556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9J2pvwoaBcqFqA7A6VQAOHiklJPfVhBkJ+0eUDdOjArHHQvO+3vdnLe2+Ckz625maaWnLVMnUXoeOGjhU+h4gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3503
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

iconv: Accept redundant shift sequences in IBM1364

Reference:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1893708

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 .../glibc/glibc/CVE-2020-27618.patch          | 91 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.32.bb         |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-27618.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-27618.patch b/meta/reci=
pes-core/glibc/glibc/CVE-2020-27618.patch
new file mode 100644
index 0000000000..bf32238357
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-27618.patch
@@ -0,0 +1,91 @@
+From 20e6c868c29f5a6121cbb88f3387bb9b884a4206 Mon Sep 17 00:00:00 2001
+From: Arjun Shankar <arjun@redhat.com>
+Date: Wed, 4 Nov 2020 12:19:38 +0100
+Subject: [PATCH] iconv: Accept redundant shift sequences in IBM1364 [BZ
+ #26224]
+
+The IBM1364, IBM1371, IBM1388, IBM1390 and IBM1399 character sets
+share converter logic (iconvdata/ibm1364.c) which would reject
+redundant shift sequences when processing input in these character
+sets.  This led to a hang in the iconv program (CVE-2020-27618).
+
+This commit adjusts the converter to ignore redundant shift sequences
+and adds test cases for iconv_prog hangs that would be triggered upon
+their rejection.  This brings the implementation in line with other
+converters that also ignore redundant shift sequences (e.g. IBM930
+etc., fixed in commit 692de4b3960d).
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;
+h=3D9a99c682144bdbd40792ebf822fe9264e0376fb5]
+
+CVE: CVE-2020-27618
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ iconv/tst-iconv_prog.sh | 16 ++++++++++------
+ iconvdata/ibm1364.c     | 14 ++------------
+ 2 files changed, 12 insertions(+), 18 deletions(-)
+
+diff --git a/iconv/tst-iconv_prog.sh b/iconv/tst-iconv_prog.sh
+index 8298136b7f..d8db7b335c 100644
+--- a/iconv/tst-iconv_prog.sh
++++ b/iconv/tst-iconv_prog.sh
+@@ -102,12 +102,16 @@ hangarray=3D(
+ "\x00\x80;-c;IBM1161;UTF-8//TRANSLIT//IGNORE"
+ "\x00\xdb;-c;IBM1162;UTF-8//TRANSLIT//IGNORE"
+ "\x00\x70;-c;IBM12712;UTF-8//TRANSLIT//IGNORE"
+-# These are known hangs that are yet to be fixed:
+-# "\x00\x0f;-c;IBM1364;UTF-8"
+-# "\x00\x0f;-c;IBM1371;UTF-8"
+-# "\x00\x0f;-c;IBM1388;UTF-8"
+-# "\x00\x0f;-c;IBM1390;UTF-8"
+-# "\x00\x0f;-c;IBM1399;UTF-8"
++"\x00\x0f;-c;IBM1364;UTF-8"
++"\x0e\x0e;-c;IBM1364;UTF-8"
++"\x00\x0f;-c;IBM1371;UTF-8"
++"\x0e\x0e;-c;IBM1371;UTF-8"
++"\x00\x0f;-c;IBM1388;UTF-8"
++"\x0e\x0e;-c;IBM1388;UTF-8"
++"\x00\x0f;-c;IBM1390;UTF-8"
++"\x0e\x0e;-c;IBM1390;UTF-8"
++"\x00\x0f;-c;IBM1399;UTF-8"
++"\x0e\x0e;-c;IBM1399;UTF-8"
+ "\x00\x53;-c;IBM16804;UTF-8//TRANSLIT//IGNORE"
+ "\x00\x41;-c;IBM274;UTF-8//TRANSLIT//IGNORE"
+ "\x00\x41;-c;IBM275;UTF-8//TRANSLIT//IGNORE"
+diff --git a/iconvdata/ibm1364.c b/iconvdata/ibm1364.c
+index 49e7267ab4..521f0825b7 100644
+--- a/iconvdata/ibm1364.c
++++ b/iconvdata/ibm1364.c
+@@ -158,24 +158,14 @@ enum
+ 									      \
+     if (__builtin_expect (ch, 0) =3D=3D SO)					      \
+       {									      \
+-	/* Shift OUT, change to DBCS converter.  */			      \
+-	if (curcs =3D=3D db)						      \
+-	  {								      \
+-	    result =3D __GCONV_ILLEGAL_INPUT;				      \
+-	    break;							      \
+-	  }								      \
++	/* Shift OUT, change to DBCS converter (redundant escape okay).  */   \
+ 	curcs =3D db;							      \
+ 	++inptr;							      \
+ 	continue;							      \
+       }									      \
+     if (__builtin_expect (ch, 0) =3D=3D SI)					      \
+       {									      \
+-	/* Shift IN, change to SBCS converter.  */			      \
+-	if (curcs =3D=3D sb)						      \
+-	  {								      \
+-	    result =3D __GCONV_ILLEGAL_INPUT;				      \
+-	    break;							      \
+-	  }								      \
++	/* Shift IN, change to SBCS converter (redundant escape okay).  */    \
+ 	curcs =3D sb;							      \
+ 	++inptr;							      \
+ 	continue;							      \
+--=20
+2.29.2
+
diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glib=
c/glibc_2.32.bb
index d43c8c56cb..edf196c428 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -47,6 +47,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://CVE-2020-29562.patch \
            file://CVE-2020-29573.patch \
            file://CVE-2019-25013.patch \
+           file://CVE-2020-27618.patch \
            "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.29.2

