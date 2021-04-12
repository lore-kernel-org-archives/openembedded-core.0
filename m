Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.49])
 by mx.groups.io with SMTP id smtpd.web10.3420.1618260513858918427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 13:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=S0IbCLtJ;
 spf=pass (domain: windriver.com, ip: 40.107.68.49, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbjkVxuOClPgI0ygtiwez3kol41OvPOBCncbx3nEFTthXz9uTa8tRBgRZ27Pgbrzsg6z85x7gIT7LBYzFyImYOlE4AKTFPET4yg8WziMS+ESPpNSQLmohGGd+h1e336C68/D9ps6opyPdeWZ6pYH47DYKdfDkR2stopVKH6xnhufKc2p6UN3lDAAy1Vg2IZgB4JMCCkd222sINxNHLkVLoizcNg0Y9p2aEZwkSHHXkglucDSnIiDdv63BXb78QRmxyFpD6K6dFsv59LKRTONNC6bP/d8hYFeji3Pz+HXHZKb+YZpBV9JVzIA6sJm2U/q8C/Hg18DilJnjTPJTlKQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MfX4GI/kHjB3gqLhv8JzsgheFCkMEHX/Bw2vB7tpnE=;
 b=Hcmka9kgcy7NpmvLG+9LLy+3CZUuJkuIS9Lg982mcUYZ4vwh7y9W52T5KYI/2V2w7P26ndlnRWw7ZGDEKRv2XhJD1Hf7v/QK7/D/GpNT9ABRpdAokulJdBMGLDCjVoA/43AiicPO3e+jY/h5z4FrKcM5B3OiRZx4OaWMYzARgu2Gp3dAzlIC6+hmg7jv9l0oWl25bMtYkLFULfiX2R/0vICGhocRh7Os8HQ7XXjlrbqMdRSbm8FyUW1OqelZXGlV50N0qIdGVF7llUPCI3g414H1cDjOUE8eFr44whoUwcg2+m3SRm/+0IBf3RJOCfHj3njGbIlK7cnwgxD/HtyLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MfX4GI/kHjB3gqLhv8JzsgheFCkMEHX/Bw2vB7tpnE=;
 b=S0IbCLtJ9y1omenC/QHmNSnDZSAJsHFSVQ+g62fP4FqnzP04zjcDPITSjFwCs0uNBPnB51HDLe+GUKQtH3CTV05cZhzVprAKrga5SHTMR4tcyT3KRMxcT0ABwK7u5UhHV7lqICUCjdVBSB4EbRITIT7okFT09CADIsDErW3byrw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3359.namprd11.prod.outlook.com (2603:10b6:805:c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Mon, 12 Apr
 2021 20:48:31 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 20:48:31 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] valgrind: Fix ptest swapcontext.vgtest
Date: Mon, 12 Apr 2021 13:48:18 -0700
Message-Id: <20210412204818.26783-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BY3PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:a03:255::8) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BY3PR10CA0003.namprd10.prod.outlook.com (2603:10b6:a03:255::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Mon, 12 Apr 2021 20:48:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdb866d5-83a5-4439-c61c-08d8fdf454b6
X-MS-TrafficTypeDiagnostic: SN6PR11MB3359:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB335959A60EADC5617B2D393C80709@SN6PR11MB3359.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:27;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CO6glF7WEkx+6NsMrs5z5XeI0max1FnrljgPkxRsqudxhRC/QMQbgdvW2wBAr7//hhGgClgVg4HgvHRmmCN+6vF0xQVd6EiSdBJsP7R3RgbaVe/COyfmNaulSPujCYy6+nNqVTng0uTnwJxRCQ1zklnzNNbVvG7oo4M5asjGuQHnhhxlhiBzaexGAPrbG0iHbCKeKtGLflJqI/3Bsx3/8YdlStBSlbRYT0PEzqW5WWrUj21bihWZuz7q9pmLdCGQenx0uDOe/oK8Q7Vn1Biai587cAFDkkZnVU4U7DZJ7jHwbckWiKa1F7QUQjuuyUCRmEea3P1QYIjQOn8BGEnMiqymX7BFtC8wvSDKDNbYtooZI9cczPokreB24zfdBVsCRTHQ8LyGzZE2TY7Iha3yTjcF52QLLw1iL+lTlxq7ZAqvIvTN27J6uFqoKIyaS+mt/OowbtHZpwDGM6RWp+Az7MJnuh/s2QChl0z0BdO78piEE4QrscNEoRcJvZF8eaMfku411wFCfThPlny/jfFMYjooA3UcqTff+8SaJt+6Mo6dCNHhFXDFSFPEeYp3gNan2XZWwXZyNeYixS7zySXKnP0dcz6HqTo80svhFAy+rJ9Ak1AbYmVA+nWd2dmEpaNZwMv9tE2yESRGPUvEUOuCRAQqo6OppqjuHOGmOkY6myowcByl232td8sWgejSKWrd8Ey15b8dbX1qDkmyzjtm1tLcUtFVg2mSgSPdDoNHkwE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(376002)(136003)(366004)(478600001)(6506007)(6486002)(2906002)(8676002)(83380400001)(6666004)(6916009)(26005)(38100700002)(38350700002)(86362001)(1076003)(6512007)(66946007)(66556008)(36756003)(316002)(52116002)(66476007)(5660300002)(8936002)(186003)(2616005)(16526019)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?l2tpWwUA6WF564fTbGzFVOv3ImQdvA024p6nW/Hs8rL50Y1lma5OZ61vQgJ4?=
 =?us-ascii?Q?QlDfpbfgSR9KYYGCHLnmwcCg9tzX1hkltVIGB3aWZ/N1D8knTCeSAXRq8yqZ?=
 =?us-ascii?Q?3tTYJa2To4gKx9GtBmaK9SSfedTGrfb9gwYbMn9HrkOhgo6hVe/dmhSlPawF?=
 =?us-ascii?Q?8ReK94syDw/idyPHvyXJw2a26SsLYVw9i3J3D5aX77Ev4qhorr3T8MYkwx5Q?=
 =?us-ascii?Q?QVcF6/y9WEBPpfuLLgZN5eEEcuEB5A3hbyf07i1xUaaGF84oo+2StJL4Mw29?=
 =?us-ascii?Q?lmrDMFYoXz0Jktq78ej+q1q1cDkyqOBHUHF0FrENDAjDZJ9dnHL555p8xLR7?=
 =?us-ascii?Q?wRrPLwjIjAW7FpumQ1cObU/8kAZ767cgilY/vP2Ag/sTP+JnmFuQBCqhnVHU?=
 =?us-ascii?Q?ebnNBBSNEG5fYZ2HCOGftg0yd05mPzei3jF6X/Ij7i052DNhMudFl4LZg5G2?=
 =?us-ascii?Q?NqGONNX9dpakzd7QKG/yu1FmTT+uSSfbr49hZFzFR83hWMiTmseqqtI+qlAy?=
 =?us-ascii?Q?SjEgwIAgjv1TIgg68jcIc4X9NuGj/bnMnnXMtwX23uc9l/OznIh8y7WyhGjH?=
 =?us-ascii?Q?r0Qje8rKbFzszZI2jbIqJ/IVvIVGxVbOYq7cceeKT2WKLu8BklrqD+tUUj9G?=
 =?us-ascii?Q?4NLPQ4BJqbf5hgYZ0D/S65rq1xojtuFvXGjswqz1iQ3p7IXVBR70MyWDRMxN?=
 =?us-ascii?Q?JaUn0iPYPj6OW8l6n8nFxsT91Im6MbH3dAe996ILqN2XMZs9BCK1y23a3KDj?=
 =?us-ascii?Q?zKSsXYScDl6xaMR7yIFPW6o/m86CcADz16aIydSUYrq4PcknU0IvqQMgXVBp?=
 =?us-ascii?Q?RNybyA0zFD6jlGtzuvYvq/D8t1A/oER3yHvUfi9KpfFwKeLsurPCZb9qnDWl?=
 =?us-ascii?Q?bdaxIR9Epgvd+zpXVJJTIiJgWTkH/bwt8s9wzIx5zE3j6egM/yzToOgkKo3o?=
 =?us-ascii?Q?XWztKYiEEHTXwWEpQA7nqgBZ1FtnX0q66ykpW0w58hkHHo8187znnmpOEK7v?=
 =?us-ascii?Q?hxeNPUzsuGysUIoO8d2soTcYOk33Cj7be3RKDs+qh0ACL01JU5RHgs7XXodh?=
 =?us-ascii?Q?qRaIMP6U3YdT9he6kspgm090sNoxystZ5kKyqvSPHEa0xEEiZLyHFjdXtBSq?=
 =?us-ascii?Q?l2DO87sm8Ay9c/WZgSWNz9AdUQXaPeiausEozJEsSpl8T9lrlknkVr/uxt3c?=
 =?us-ascii?Q?EGfPg+7+gm3HLi6M5p/0Kx53yjbs8l7Pgb7ljXX72Ce6r7tSfv3X6sciKvy1?=
 =?us-ascii?Q?m0HnDEH1YWrMUKlo5noObRjuRA+kkHdM3KzdKwiS+kOusRgp1b4xNQPHX2EJ?=
 =?us-ascii?Q?TZUkyV6n9vYOLDcCp/lDIKp3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb866d5-83a5-4439-c61c-08d8fdf454b6
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 20:48:31.0267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnpwSCDDqlVPQ1jALOWD35XRc91VTWawCC3H7cdSocoPfeFNsChtp/uCOv2XKUq131iKaHb/5gg3ZxNTho8uiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3359
Content-Type: text/plain

Backport an upstream patch.
to limit the amount of stackstrace present.

Revert "valgrind: Disable ptest swapcontext.vgtest"
Effectively reverts commit 9dff5766f5795bb02677050045f24365f68bbc1a.

[YOCTO #14324]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...orarily-drd-tests-swapcontext.vgtest.patch | 29 ---------
 ...ntext-Add-SIGALRM-handler-to-avoid-s.patch | 65 +++++++++++++++++++
 .../valgrind/valgrind_3.17.0.bb               |  2 +-
 3 files changed, 66 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-tests-swapcontext-Add-SIGALRM-handler-to-avoid-s.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
deleted file mode 100644
index 10ec06ccaf..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0f1814a618eff4233e9e8379a8cb2dededdc5a8b Mon Sep 17 00:00:00 2001
-From: Yi Fan Yu <yifan.yu@windriver.com>
-Date: Tue, 23 Mar 2021 11:09:20 -0700
-Subject: [PATCH] Disable temporarily drd/tests/swapcontext.vgtest
-
-New test introduced in valgrind 3.17.0.
-Test fails on both qemuarm64 and qemux64.
-
-Upstream-Status: Pending [Needs more Investigation]
-[YOCTO #14324]
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- drd/tests/swapcontext.vgtest | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/drd/tests/swapcontext.vgtest b/drd/tests/swapcontext.vgtest
-index 98e3712c4..5492da31d 100644
---- a/drd/tests/swapcontext.vgtest
-+++ b/drd/tests/swapcontext.vgtest
-@@ -1,4 +1,4 @@
--prereq: test -e swapcontext && ./supported_libpthread
-+prereq: false
- vgopts: --read-var-info=yes --check-stack-var=yes --show-confl-seg=no --num-callers=2
- prog: swapcontext
- stderr_filter: filter_stderr
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-tests-swapcontext-Add-SIGALRM-handler-to-avoid-s.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-tests-swapcontext-Add-SIGALRM-handler-to-avoid-s.patch
new file mode 100644
index 0000000000..371c1701d0
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-drd-tests-swapcontext-Add-SIGALRM-handler-to-avoid-s.patch
@@ -0,0 +1,65 @@
+From 4c8c4a9c3a92300e3e6500e5a278ca37514a1fdb Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Thu, 1 Apr 2021 15:31:47 -0400
+Subject: [PATCH] drd/tests/swapcontext: Add SIGALRM handler to avoid
+ stacktrace
+
+During testing for oe-core build on QEMU,
+SIGALRM can trigger during nanosleep.
+This results a different stderr output than expected.
+
+```
+==277== Process terminating with default action of signal 14 (SIGALRM)
+==277==    at 0x36C74C3943: clock_nanosleep@@GLIBC_2.17 (clock_nanosleep.c:43)
+==277==    by 0x36C74C8726: nanosleep (nanosleep.c:25)
+```
+
+This stacktrace printing will not occur
+if we add a handler that simply exits.
+
+https://bugs.kde.org/show_bug.cgi?id=435160
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ drd/tests/swapcontext.c          | 5 +++++
+ drd/tests/swapcontext.stderr.exp | 4 ----
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/drd/tests/swapcontext.c b/drd/tests/swapcontext.c
+index 622c70bc5..2cb969a5e 100644
+--- a/drd/tests/swapcontext.c
++++ b/drd/tests/swapcontext.c
+@@ -25,6 +25,10 @@ typedef struct thread_local {
+   size_t nrsw;
+ } thread_local_t;
+ 
++static void sig_alrm_handler(int signo) {
++    _exit(1);
++}
++
+ static void f(void *data, int n)
+ {
+   enum { NR_SWITCHES = 200000 };
+@@ -76,6 +80,7 @@ int main(int argc, char *argv[])
+   pthread_attr_t attr;
+   int i, res;
+ 
++  signal(SIGALRM, sig_alrm_handler);
+   memset(tlocal, 0, sizeof(tlocal));
+ 
+   pthread_attr_init(&attr);
+diff --git a/drd/tests/swapcontext.stderr.exp b/drd/tests/swapcontext.stderr.exp
+index fcb5d5ed4..d18786f80 100644
+--- a/drd/tests/swapcontext.stderr.exp
++++ b/drd/tests/swapcontext.stderr.exp
+@@ -1,7 +1,3 @@
+ 
+ 
+-Process terminating with default action of signal 14 (SIGALRM)
+-   at 0x........: swapcontext (in /...libc...)
+-   by 0x........: f (swapcontext.c:?)
+-
+ ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index 7a6b766121..2eea84c229 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -43,7 +43,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-Add-missing-musl.supp.patch \
-           file://0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch \
+           file://0001-drd-tests-swapcontext-Add-SIGALRM-handler-to-avoid-s.patch \
            "
 SRC_URI[md5sum] = "afe11b5572c3121a781433b7c0ab741b"
 SRC_URI[sha256sum] = "ad3aec668e813e40f238995f60796d9590eee64a16dff88421430630e69285a2"
-- 
2.17.1

