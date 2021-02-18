Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.74])
 by mx.groups.io with SMTP id smtpd.web08.9652.1613665768007452099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:29:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kORBYlZz;
 spf=pass (domain: windriver.com, ip: 40.107.220.74, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IV2F2GZ6SDKpmZ00+RpPlv2mKC2aW1R0Qwajbl9WrsN4+7dZndVSYDhlXY5P2E9T6aDPH+Knmq7pjPj8MESRSfWnENrUmAiDBM/vYr9Rgrwu482hQLahYdG4kgJPBGOrcwD1oMyLxYQTEc06BxembsYQdA57dd9ACoR4L7FAo82ojgvr2PZWT6xzOZDLeojqLIyPw/udyAdJJpcIE5lk87ESU5gdRBn3fI1CquZHdJO7Qsa2CJ35eLifEVxtp1PsDYPKVez3L1/dey9eYRkLXKn113ohGycPdGtrF9eSp7t/Ov2fJia/g+zo2yF41509/8OZekvWMBwOLAejLG764w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gUTSrggPtNEmxBJM2K7NLq6Qg94HnC5tPAvKIS8eoI=;
 b=NBqXqBR4n7lPrHEFwCwif81M2x939CObZkmiezXraePrPUkpDsbtwuo2B23xCLu0AfNhnsetuGdjXp7ujyMEsbmOTCp8k9YKSV6iaVIxE4mAd/Ax3EBRGWe2KPhFHjsluYFpXDaz2Yr8OwpCyOYSLXAkZmFlkp0XIb4gDPVZiccvjQJI1h+8aGX5EeQBQk0nfSqxbPQz186G5Bm52YZjqCVaM1ay7++s1htOqWiIVxTQZ1drn2ZI8C9Lc7EAvjRAbbF4xw5l+Lo/EFk591Rlxt3w1hvcqBA4dlClOPXQemjQ2e0ldNl4MHui9fkCFUEWOTiABirCstMTevmgN0DbAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gUTSrggPtNEmxBJM2K7NLq6Qg94HnC5tPAvKIS8eoI=;
 b=kORBYlZzF7PJ3hUIRvK8MN10QjIQbYTGkpRl2wV5mOL3dj9kfU0QHI2eKEuYf1gsOVFcwwf3bw5MsmDsM9xiuEC1yMASGGItfUE/9SmBuZO11CG0/jO9PzlxL30sID/BBmpeULnParLVe2wt02Wt/di79SngMs9VX28fGXg08pc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2558.namprd11.prod.outlook.com (2603:10b6:805:5d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.42; Thu, 18 Feb
 2021 16:29:26 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%8]) with mapi id 15.20.3846.042; Thu, 18 Feb 2021
 16:29:26 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] valgrind: Disable ptest nlcontrolc for x86-64
Date: Thu, 18 Feb 2021 11:29:13 -0500
Message-ID: <20210218162913.37946-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.36 via Frontend Transport; Thu, 18 Feb 2021 16:29:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b64c3b3c-883a-47f0-d1c7-08d8d42a5b39
X-MS-TrafficTypeDiagnostic: SN6PR11MB2558:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB25582E91DCD09F1ABE6E1F7E80859@SN6PR11MB2558.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+pv6icjD1+HCRIhbjP6tP86aXPMDMzAKAPG3uTR/uU+gl1a7ePu1ZvdU+OVB1u/cKYQHDpu3EDmLwboW3MXaypqkMdj+RiYce9ttCFdU1we35rr466/zYKC2yGBYGb4ouqvljk85XKF8cRxPdrnkjCoSAnloZd6qEUR52qmtQq2mcvBX4lUsuZ7mb/EKRx4eFSvHljDykDqbtFq9RG82Z2hptZZx/nPpTkrnO3fsBZiZV1DG4bFs6uv7bmFlHPX+exCbNtbmAlJ9ouUGPInHh/vZt9L5eDD1D/Z3ehO5+fCpgiM8OsCHfdDHqfa13jftAPaGsv8COsy7xm0hTok/NjR8HfQqOi+p4smPV50+jGBL0kAQYjRLuEN0vfX/2UoOtzzh6Icf0GFheuBOSelRMesdssSI+yGzf/VVOZsTSU5BAIiiVgSHmSHIUo6PmSmOk7mRVmooJv5RZM/eGrdxxdbxxsm7//6z1KKGFdQl4P9z5eIEjlmsgEt9iu84Zseah+Dr4OXu5euVjVV5P2TqTAQPGJK/y+6LBsH62Q6RhWAzrLNwzj63DYCKn+UbPOld5/Brmi2d/Ab3wGG1kvrUlVA6up25sxU3BUWoGjF6b10=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(366004)(136003)(396003)(2906002)(5660300002)(6666004)(83380400001)(16526019)(66946007)(36756003)(26005)(6916009)(6512007)(966005)(2616005)(316002)(6506007)(8936002)(956004)(52116002)(478600001)(1076003)(6486002)(66476007)(86362001)(8676002)(186003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Ad3MlTS7+tADVZPlVFcYaC4/iTm10TVw1k2Q6ntapyTNqOhDYCYGZzRck4aH?=
 =?us-ascii?Q?vufoE6AjMLdgLIUcaNq4ek61nBXiYBhCrneYJYfLmgZOE2tQ8/rxW/w84Icg?=
 =?us-ascii?Q?MVTmaqOVEdynHszaJu5ijy4NP+sRd5Qf84S0cG9AsNSbcVV3NO5Ve+wQre/L?=
 =?us-ascii?Q?E1ME4gOhLQqGE0kdwMja7pLuaW9/pptfsIZ9omP0BsB4rqt2QdaeSN4oEjzw?=
 =?us-ascii?Q?zcStdD+g4FsYVCMnwThPDNaxsYqWQrYCep8LYOfHds7cD2v3wd/AFxoTH20E?=
 =?us-ascii?Q?gSUVhKcYoVH1rqgefbWWdwPkJHS/+YYaWc6az6cc7awmCT5OCsx5XpSxzyjN?=
 =?us-ascii?Q?fNI/XoEPJ6dISdXuZn3amiJ2UMZDFb3BIH9IDjJVP883xljrrehjruB7SCAs?=
 =?us-ascii?Q?FImhklDrOOEDhSNv8210JviNmPlOja2IS64TiXz4sssgne7RdB83h6DpN7Ji?=
 =?us-ascii?Q?Kmr212savbr1q+jyJecy3FT/kBuO/f78sHsnPsgCTk9YEGgL9npVNPo6vitP?=
 =?us-ascii?Q?j8f8NOlCC6HFQP8x/SZPI9Her8Ic4h42H2pl+veWKuZrSHmSEbdnZt2zzJjL?=
 =?us-ascii?Q?kz2VCm4FRYa3I9moExer191zoejFYtH1ocOdVUsLZ3DVL56VtXcYm6ojMPir?=
 =?us-ascii?Q?wT4dRc7Oy+NGmnK+CbiKnOJa25tpfq4MwYBriA1iontwYy7jNGRF8lPzs0Dw?=
 =?us-ascii?Q?S4LetAIj9uRq8dEiNfdc1XvDCoNTlub/rW0TfDBHAFWrHJP4wQ0WEep0/fn6?=
 =?us-ascii?Q?+beqWiimcV1uub3fomxhLymN0Cx3UdH/QhAcUNhDLSj6jr1moWfgnTIABDAX?=
 =?us-ascii?Q?hjtv2R1PlCVlUSczNbBUSORRkIZt8xKdFbFpNHs/BExDSV4hEOfKXrG9v0Tx?=
 =?us-ascii?Q?M0nWKvGAKrwKbc0bJvLry6hOXIPeDBc82nmrl7epWJOAScU0kzH+4+p9sg7z?=
 =?us-ascii?Q?bS4dLCzyIdIQJEa4RkyFA/f2asTH1usqXjLHPgmnFQbdrbmxutkPwFFMytYw?=
 =?us-ascii?Q?RwVc3V6Rhg/wgma/llDLSNJmLNMFlDKopBGqkFxI1Tx/Ueq9RHP6X/a6U73z?=
 =?us-ascii?Q?2LNCkiS3CKYjmo4MY/CSPW9oVLFEhmkEK2UvZ4y6NXw5nncqI+mjWpCmDrlJ?=
 =?us-ascii?Q?cc7r+b8xqHWKnjCP383TfhTELA1amQiq6EdLU4ZRmihB0bWvyyNi4/H30/Yr?=
 =?us-ascii?Q?lKI+RWbWanzPtOX82tf8ePi5kMdyfHoFl0iAUy8uc39pMFOlfh9nMS5xZnS9?=
 =?us-ascii?Q?jxpsoV9l3fz1MeepUruBclSUhVtL2Oj8J5UPjWgiTOBt+YQIMnJdtHyj15nC?=
 =?us-ascii?Q?jcfq4NyvKDSZRNM0lqw4wIsy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b64c3b3c-883a-47f0-d1c7-08d8d42a5b39
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 16:29:25.9236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxC/1FZkD5s0slX/HoidqTA8cJr4GbBNb/vvN5aO3nj/mrGLBCg9b0PN5RiK5SL3d28q/A6jrz2ZtiQeO8pHTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2558
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Test hangs after glibc 2.33 uprev.

Using gdb `p t[0]` to modify the timeout
argument no longer affects how long `select` wait.

https://bugs.kde.org/show_bug.cgi?id=3D432870
[YOCTO #14223]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...Disable-nlcontrolc.vgtest-for-x86-64.patch | 36 +++++++++++++++++++
 .../valgrind/valgrind_3.16.1.bb               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-gdbserver_=
tests-Disable-nlcontrolc.vgtest-for-x86-64.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-gdbserver_tests-D=
isable-nlcontrolc.vgtest-for-x86-64.patch b/meta/recipes-devtools/valgrind/=
valgrind/0001-gdbserver_tests-Disable-nlcontrolc.vgtest-for-x86-64.patch
new file mode 100644
index 0000000000..0bd8273cd8
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-gdbserver_tests-Disable-=
nlcontrolc.vgtest-for-x86-64.patch
@@ -0,0 +1,36 @@
+From d8c19e0bb9ca2fd48f223e1fdeffcafeb0aa1745 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Wed, 17 Feb 2021 14:53:44 -0500
+Subject: [PATCH] gdbserver_tests: Disable nlcontrolc.vgtest for x86-64
+
+Test hangs after glibc 2.33 uprev
+
+Using gdb to modify the timeout argument no longer
+affects how long `select` wait.
+
+https://bugs.kde.org/show_bug.cgi?id=3D432870
+Upstream-Status: Pending
+Waiting for upstream to take action.
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ gdbserver_tests/nlcontrolc.vgtest | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gdbserver_tests/nlcontrolc.vgtest b/gdbserver_tests/nlcontrol=
c.vgtest
+index bb5308403..96d2b52bb 100644
+--- a/gdbserver_tests/nlcontrolc.vgtest
++++ b/gdbserver_tests/nlcontrolc.vgtest
+@@ -13,7 +13,8 @@ args: 1000000000 1000000000 1000000000 BSBSBSBS 1
+ vgopts: --tool=3Dnone --vgdb=3Dyes --vgdb-error=3D0 --vgdb-prefix=3D./vgd=
b-prefix-nlcontrolc
+ stderr_filter: filter_stderr
+ # Bug 338633 nlcontrol hangs on arm64 currently.
+-prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/arch_test arm64 && !=
 ../tests/os_test solaris
++# Bug 432870 nlcontrolc hangs on x86-64 starting with glibc 2.33
++prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/arch_test arm64 && !=
 ../tests/os_test solaris && ! ../tests/arch_test amd64
+ progB: gdb
+ argsB: --quiet -l 60 --nx ./sleepers
+ stdinB: nlcontrolc.stdinB.gdb
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recip=
es-devtools/valgrind/valgrind_3.16.1.bb
index 25fa58249c..fc070dec78 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -44,6 +44,7 @@ SRC_URI =3D "https://sourceware.org/pub/valgrind/valgrind=
-${PV}.tar.bz2 \
            file://0001-drd-Port-to-Fedora-33.patch \
            file://0001-drd-musl-fix.patch \
            file://0001-helgrind-Intercept-libc-functions.patch \
+           file://0001-gdbserver_tests-Disable-nlcontrolc.vgtest-for-x86-6=
4.patch \
            "
 SRC_URI[md5sum] =3D "d1b153f1ab17cf1f311705e7a83ef589"
 SRC_URI[sha256sum] =3D "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba=
918cc6720a33ca"
--=20
2.29.2

