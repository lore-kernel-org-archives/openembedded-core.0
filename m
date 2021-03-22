Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.71])
 by mx.groups.io with SMTP id smtpd.web09.7326.1616378544726259985
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 19:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OT0IWmAh;
 spf=pass (domain: windriver.com, ip: 40.107.93.71, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJuztGrie6ZDpjXf+eR5IQEoLlk+3b5DPcGMEFlcKpZAEfzOyj4ckXd0LK0samr4vsC60KHQCkgIRtAu1TGA4Mal7zZQ6PVpGrR0y2HTA8cuvf8Uy/PGA7VN3s8ger+8rCCw00OxzCi42fnDnVxnHCRbBaPtDNDUeQEeS/5Y+Cb9BDrvX4NaK80E5IJdvofoki0dJPOCwxRkvpUKMZ8Lwb3wiEN10bND1Bzlbn3URVWTOpys394g45jhmKLu/uwOl0QpGux9tPDVpd4+FNHyVKwZiaLVDeAawjFOOR5l6Vs5xjrxcm1Gf0CCycW7K8EVWUMykso0vxADPcKQGcpb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8q8RPw/QOKXjenhGoY3FaEXarNUcnO7hFdH1eaIC8A=;
 b=csJ9K9ARSbW2OtexCJGcyZhHFQh7DQPMRopkeytbsKbPuCOI8KYuyR7aiqlKi9hMC80P1rEDOP+FwxF5bLlicIFqeZOJmLBte7J0lqejnvoAcNxpZRecWY7h+Bx57duguaGZk5pFrxFRQmcYE7uAQ2k5x3zDufnNxceuWpSpa7YU5xNBJgDX+BlIk8rmn0XNMd2ez7+aNdjxYEt5UR6u7pxcqvukuD7WZ9bsiv/Pi9tnWI3wxR/w4g3/NKO1LhWOyAytktAn7PjA6wgCOYcb27Fa6OgXhGB5mI0ahxafiqzyepjEunls14Tdlj09dyaxrZF4GpCXN+i3EyFduhAR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8q8RPw/QOKXjenhGoY3FaEXarNUcnO7hFdH1eaIC8A=;
 b=OT0IWmAhlF9lVo5cBuu9wpj81nLe1a3ttWGOW8GG990bQmeGsv7quqghd4tgKCUel/9RTktUlbsE9iLGINbJhrbJUZrWRdcqxTyd58Q+n6C0RNpTYxs5OYUS2uWsxL3MGpZFm105NhVtdWWFfNc982nJd/0pFu2aw9UjfTinjbY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB5132.namprd11.prod.outlook.com (2603:10b6:806:11a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 02:02:22 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 02:02:22 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] [WIP] valgrind: update to 3.17.0.RC2
Date: Sun, 21 Mar 2021 19:02:08 -0700
Message-Id: <20210322020208.18814-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 02:02:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74534e49-8455-4ced-389e-08d8ecd687cb
X-MS-TrafficTypeDiagnostic: SA2PR11MB5132:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5132124F3A2C5781069491E680659@SA2PR11MB5132.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cTWV4WLbCuVsMaclJVvGgL086IFzLWxsbv4BMAgnfl+LpD+JcOgeUqX0Cv63GNmf/EDSlyogvNVIXnVDn0CsEg9oNMLAXG13s+lZByXu0p9E5U1KolYZui3DI1ppJvj/H7xnG7Ze1q7YLMD02pdCnTYw1+Vxfa26D1dM6OKs0eNpB4tIuK24/j41YqiXhqAoRdwHqUKAe0nsXsTSCx+3uJ68roNmQAMxiOusmSvRUR9kCVngDzeaPBS2UO3xlj06/uZ/pwoi8Me6jXz/h9skuXqzSgWQG7SaiCvdVcjsm0vrBVfUpPOPIQz17He03RXcZSnI/jzd1DZuLAMu+VTISlcZm09nIUoQOWL27MnuzNsUV2B1gVxgwsDe42pWbxfQmEj6uyVm5In0A+/RhHaxToMMv1AiiozSqURnNXOoAJLkqJFkRb+eetTj4AoqWl07eE5ls7t+qcv+KuUiDt9/UUgI8CSLXG43ug0Pc2Lvc4xnRdljBlqWsDWBSrjp52FHH+JsMJN6zR83GY3FxDKuAtT+dIiPSKF6sI+g6fdEDYdJ3aon5VD68Nk3cw3a0byU+bBpwrmoHUxCHCbLxld3R6gm6FLFU5exv8zTujnd5/1+VVi+tvqD8+eb5Yb48lqW0CIXnzHgyauiCMG1S+lZrR53rDnJHkk3kQo4qsHaB290ajFDlj9kzyrsoAslJh5DlPP9d0N5hgUTZw3Ga57/sIUPfDcqgiBrr0liBTLslZo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39830400003)(26005)(6486002)(36756003)(86362001)(956004)(966005)(186003)(478600001)(8676002)(8936002)(38100700001)(19627235002)(15650500001)(83380400001)(6916009)(53546011)(6506007)(316002)(66946007)(66556008)(2616005)(2906002)(30864003)(52116002)(66476007)(6666004)(5660300002)(1076003)(16526019)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?fSelHGO9ZPI6HQQ84lCI1XB/L+A3/06wYTakZKJp2VVbtgNArth96Ywq6Yav?=
 =?us-ascii?Q?5WfzTsck/WJ36rIVo3mv42fgTV6Gu72xxXIC6LwYrIQQl81EdtFwfho/MYod?=
 =?us-ascii?Q?fCd1AyZA8lJSplRH1t2Qo/6K42pLIfH/fXeQkalhgMesb4yPIBVDv/u1OzPi?=
 =?us-ascii?Q?Kog4eOYiXifKZvKmFuyDRXV/Ky+d3AmSNc5H5fhApPMsOfPTMEvY4nB2320q?=
 =?us-ascii?Q?c/hlEvzwOFHLrxxnm2XMY22FUp6UCLIAuATwIAFg8aP/ov5uRhUZRrap1mmx?=
 =?us-ascii?Q?2v9p2yf+SBU6Hc9LQYOLQkwEmly3OEhX4y6Xq/kylu5tXDqsSFunH0DUwVO0?=
 =?us-ascii?Q?rw0zM2mGqLhfDoOT65xr5eFDsMdFtM64fTJh12yjUHyJjMIlBWWiOhgyjBmj?=
 =?us-ascii?Q?aFdbvvNQ/iEL4CHhisak1oNv+s/HNk2QBOwjDbJiuaBOCCmbFUsi+RkrmgX8?=
 =?us-ascii?Q?8Ps8kFNj0zsF8tdBGo4+4Ii7uq/USZJHPpn1VafpIX9C9U5pybvZgenVlY2A?=
 =?us-ascii?Q?pD7O6lKj3xtR5T2qqFZ6CGuzchGIMd9LawMLJmUIczOZUKj1z2OBWIrM3ip7?=
 =?us-ascii?Q?LAcOBXI99aO/7NRSWBUIyVY+0KDz9vlCFItl7X1mRZ+4R/IGe0bu2MYbpTYQ?=
 =?us-ascii?Q?tNjFGpYKCLmPCgp9HMi6cbmgRkTh/FR+JI2ZZOdUDTz8cIHffilErE+Ufb9h?=
 =?us-ascii?Q?QQvbBkkzbKZkSg+64D4Qn+a/tc3AhG0hQouyv0/eMOK5UlHKZSwMIkYkEmPv?=
 =?us-ascii?Q?VeKqj70qQK0UxkaZVCrb0905LxEbD0FklbGCUupYxnT1N0xe+b/GSgUmvm0S?=
 =?us-ascii?Q?lyR7KWA9I7f6iV1VbHEOOqMa50rhJH16Op6H4A8bXCifQnQZzkbxaofnUJup?=
 =?us-ascii?Q?nwYbBlKX64nuEmyURtijzWnCiaFBiG2CmPO7F4nDsUi1OWxICiPe2XgGE2Jy?=
 =?us-ascii?Q?Aa7S1HL3x8j5KbV1w6jTL7ZqsxQnd3Nw/erbE5A/WoZkelfyQpNoOID0KNRN?=
 =?us-ascii?Q?6GRc7xOnJ8BSj43oUsgqWpq7TqigrKHR6ggnbybfoY2vOUE0+ndY8L5RwmdB?=
 =?us-ascii?Q?Xgn/wKVTqWO3wNKAJPoqzo825dINh2fcfx83tQxSjw6ndE5ufogYeiSdULs0?=
 =?us-ascii?Q?2dR6rfnBx5eIp9J8TFMspvuD7sim5TgFOL78tvkKzve8CAE2JLy3Ut+YKjcd?=
 =?us-ascii?Q?IWSj011fN60zVWk2CrGerl/ZdoF8ChfK3+uK6298iRKMrvZIKTHZkUyELAqm?=
 =?us-ascii?Q?bxJ0YXNuL1bQtRYKep2sQ6MDI7CXTCG39XbWi0XNvgo7Qr49A1i8QM5WpGVc?=
 =?us-ascii?Q?V40WoDDc/lrkq8tu1afhicd8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74534e49-8455-4ced-389e-08d8ecd687cb
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 02:02:22.0126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hp2+D9LMq4utUPtkTTnnJ6vrOjHTU3SWp9lfySrIdUSeLNkkQfbcnCyDYf6vOKIbgHjkFw4yxjbVGGiFHO+W7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5132
Content-Type: text/plain

3.17.0.rc2 will be very close to the 3.17.0 release
still need to refresh
drd-musl-fix.patch

TESTING RESULTS:
qemu x86-64:
FAIL: drd/tests/swapcontext
FAIL: gdbserver_tests/hgtls

=== Test Summary ===
TOTAL: 736
PASSED: 693
FAILED: 2
SKIPPED: 41

swap-context.vgtest has been disabled
a workaround for gdbserver_tests/hgtls has been implemented

+    install ${S}/none/tests/tls.c  ${D}${PTEST_PATH}/gdbserver_tests/tls.c

OTHER CHANGES:

libdir is now libexecdir

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...Disable-drd-tests-swapcontext.vgtest.patch |  49 +++++
 ...gtest-hanging-on-newer-glibc-and-or-.patch | 200 ------------------
 .../valgrind/0001-drd-Port-to-Fedora-33.patch |  48 -----
 .../valgrind/valgrind/0001-drd-musl-fix.patch |  12 +-
 ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch |   2 +-
 ...ch-drd_pthread_intercepts.c-for-musl.patch |  39 ++++
 .../valgrind/valgrind/fixed-perl-path.patch   |  20 +-
 .../valgrind/valgrind/musl.supp               |  46 ++++
 .../valgrind/valgrind/run-ptest               |   3 +-
 .../valgrind/valgrind/s390x_vec_op_t.patch    |  24 ++-
 ...{valgrind_3.16.1.bb => valgrind_3.17.0.bb} |  23 +-
 11 files changed, 185 insertions(+), 281 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Disable-drd-tests-swapcontext.vgtest.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-patch-drd_pthread_intercepts.c-for-musl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/musl.supp
 rename meta/recipes-devtools/valgrind/{valgrind_3.16.1.bb => valgrind_3.17.0.bb} (93%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Disable-drd-tests-swapcontext.vgtest.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-drd-tests-swapcontext.vgtest.patch
new file mode 100644
index 0000000000..9e78a9cb61
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-drd-tests-swapcontext.vgtest.patch
@@ -0,0 +1,49 @@
+From e3b587b1cfa7dde1484c88b2af67c49a1c6166e1 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Fri, 19 Mar 2021 16:35:26 -0400
+Subject: [PATCH] Disable drd/tests/swapcontext.vgtest
+
+Test fails on both x86-64 and arm64.
+
+Unbuidable on musl with switchcontext.
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ drd/tests/Makefile.am | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/drd/tests/Makefile.am b/drd/tests/Makefile.am
+index 79e076246..5df76150e 100644
+--- a/drd/tests/Makefile.am
++++ b/drd/tests/Makefile.am
+@@ -267,8 +267,6 @@ EXTRA_DIST =                                        \
+ 	sem_open_traced.vgtest                      \
+ 	sem_wait.stderr.exp                         \
+ 	sem_wait.vgtest                             \
+-	swapcontext.stderr.exp                      \
+-	swapcontext.vgtest                          \
+ 	sigalrm.stderr.exp                          \
+ 	sigalrm.vgtest                              \
+ 	sigaltstack.stderr.exp                      \
+@@ -408,7 +406,6 @@ check_PROGRAMS =      \
+   sem_as_mutex        \
+   sem_open            \
+   sigalrm             \
+-  swapcontext         \
+   threaded-fork       \
+   trylock             \
+   unit_bitmap         \
+@@ -588,10 +585,3 @@ std_thread2_LDFLAGS          = -Wl,--no-as-needed
+ endif
+ 
+ sem_wait_SOURCES            = sem_wait.cpp
+-
+-swapcontext_SOURCES         = swapcontext.c
+-swapcontext_CFLAGS          = $(AM_CFLAGS) -g
+-if VGCONF_OS_IS_SOLARIS
+-swapcontext_CFLAGS          += -D__EXTENSIONS__
+-endif
+-
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch
deleted file mode 100644
index 98cbcd132c..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-From 83c24e31df6932a6d4fced179050c6d8d8c6f3b5 Mon Sep 17 00:00:00 2001
-From: Philippe Waroquiers <philippe.waroquiers@skynet.be>
-Date: Sun, 7 Mar 2021 22:29:27 +0100
-Subject: [PATCH] Fix nlcontrolc.vgtest hanging on newer glibc and/or arm64
-
-This test verifies that GDB can interrupt a process with all threads
-blocked in a long select syscall.
-The test used to terminate by having GDB modifying the select argument.
-However, modifying the select argument works only for specific arch
-and/or specific versions of glibc.
-The test then blocks on other architectures/glibc versions.
-
-The previous version of the test was:
-  * first launching sleepers so as to have all threads blocked in long select
-  * interrupting these threads
-  * changing the select time arg so that the threads burn cpu
-  * and then change variables to have the program exit.
-
-The new version does:
-  * first launches sleepers so that all threads are burning cpu.
-  * interrupting these threads
-  * change the local variables of sleepers so that the threads will
-    block in a long select syscall
-  * interrupt these threads
-  * kill the program.
-
-With this new version, we still check the behaviour of gdb+vgdbserver
-for both burning and sleep threads, but without having the termination
-depending on modifying select syscall argument.
-
-Tested on debian amd64 and on ubuntu arm64 (to check the test does not hang
-on an arm64 platform).
-
-Upstream-Status: Backport
-
-From commit on master:
-c79180a3afcf65902e578646c3b716cc749db406
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- gdbserver_tests/nlcontrolc.stderr.exp  |  4 +-
- gdbserver_tests/nlcontrolc.stdinB.gdb  | 57 +++++++++++++++-----------
- gdbserver_tests/nlcontrolc.stdoutB.exp | 25 ++++++-----
- gdbserver_tests/nlcontrolc.vgtest      | 12 +++---
- 4 files changed, 56 insertions(+), 42 deletions(-)
-
-diff --git a/gdbserver_tests/nlcontrolc.stderr.exp b/gdbserver_tests/nlcontrolc.stderr.exp
-index ac75bb3da..b63a9a988 100644
---- a/gdbserver_tests/nlcontrolc.stderr.exp
-+++ b/gdbserver_tests/nlcontrolc.stderr.exp
-@@ -3,9 +3,9 @@ Nulgrind, the minimal Valgrind tool
- (action at startup) vgdb me ... 
- 
- 
--loops/sleep_ms/burn/threads_spec/affinity:  1000000000 1000000000 1000000000 BSBSBSBS 1
-+loops/sleep_ms/burn/threads_spec/affinity:  1000000000 0 100000 BSBSBSBS 1
- Brussels ready to sleep and/or burn
- London ready to sleep and/or burn
- Petaouchnok ready to sleep and/or burn
- main ready to sleep and/or burn
--
-+Gdb request to kill this process
-diff --git a/gdbserver_tests/nlcontrolc.stdinB.gdb b/gdbserver_tests/nlcontrolc.stdinB.gdb
-index 667ece18d..ea4fcd530 100644
---- a/gdbserver_tests/nlcontrolc.stdinB.gdb
-+++ b/gdbserver_tests/nlcontrolc.stdinB.gdb
-@@ -9,32 +9,43 @@ shell ./simulate_control_c --vgdb-prefix=./vgdb-prefix-nlcontrolc 1 grep main nl
- #
- continue
- #
--# Here, all tasks should be blocked in a loooonnnng select, all in WaitSys
--info threads
--# We will unblock them by changing their timeout argument
--# To avoid going into the frame where the timeval arg is,
--# it has been defined as global variables, as the nr
--# of calls on the stack differs between 32bits and 64bits,
--# and/or between OS.
--# ensure select finishes in a few milliseconds max:
--p t[0].tv_sec = 0
--p t[1].tv_sec = 0
--p t[2].tv_sec = 0
--p t[3].tv_sec = 0
--#
--# We will change the burning parameters in a few  seconds
-+# Threads are burning cpu now
-+# We would like to fully test info threads here, but which thread are Runnable
-+# or Yielding is unpredictable. With a recent enough gdb, check the nr of
-+# threads by state using pipe commands and grep/wc.
-+init-if-undefined $_gdb_major = 0
-+init-if-undefined $_gdb_minor = 0
-+if $_gdb_major >= 9
-+  | info threads | grep VgTs_Runnable | wc -l
-+  | info threads | grep VgTs_Yielding | wc -l
-+else
-+  echo 1\n
-+  echo 3\n
-+end
-+# We change the variables so that all the threads are blocked in a syscall
-+p burn = 0
-+p sleepms = 1000000
-+#
-+#
- shell ./simulate_control_c --vgdb-prefix=./vgdb-prefix-nlcontrolc 1 grep changed nlcontrolc.stdoutB.out
- #
--echo changed burning parameters\n
-+echo changed burning parameters to sleeping parameters\n
- continue
-+# Here, all tasks should be blocked in a loooonnnng select, all in WaitSys
-+info threads
-+# We reset the sleepms to 0. The threads should still be blocked in the syscall
-+p sleepms = 0
-+shell ./simulate_control_c --vgdb-prefix=./vgdb-prefix-nlcontrolc 1 grep reset nlcontrolc.stdoutB.out
- #
--# Threads are burning cpu now
--# We would like to test info threads here, but which thread are Runnable or Yielding
--# is unpredictable.
--# info threads
--p burn = 0
--p loops = 0
--p report_finished = 0
-+echo reset to sleeping parameters\n
- continue
--# and the process should stop very quickly now
-+# threads should still be blocked in a loooonnnng select, all in WaitSys
-+info threads
-+if $_gdb_major >= 9
-+  | info threads | grep VgTs_WaitSys | wc -l
-+else
-+  echo 4\n
-+end
-+# Make the process die.
-+kill
- quit
-diff --git a/gdbserver_tests/nlcontrolc.stdoutB.exp b/gdbserver_tests/nlcontrolc.stdoutB.exp
-index e8a5ff8ba..2e8dc8498 100644
---- a/gdbserver_tests/nlcontrolc.stdoutB.exp
-+++ b/gdbserver_tests/nlcontrolc.stdoutB.exp
-@@ -1,18 +1,21 @@
- Continuing.
- Program received signal SIGTRAP, Trace/breakpoint trap.
-+do_burn () at sleepers.c:41
-+41	   for (i = 0; i < burn; i++) loopnr++;
-+ > > > > > >1
-+3
-+$1 = 0
-+$2 = 1000000
-+changed burning parameters to sleeping parameters
-+Continuing.
-+Program received signal SIGTRAP, Trace/breakpoint trap.
- 0x........ in syscall ...
- * 1 Thread .... (tid 1 VgTs_WaitSys)  0x........ in syscall ...
--$1 = 0
--$2 = 0
- $3 = 0
--$4 = 0
--changed burning parameters
-+reset to sleeping parameters
- Continuing.
- Program received signal SIGTRAP, Trace/breakpoint trap.
--do_burn () at sleepers.c:41
--41	   for (i = 0; i < burn; i++) loopnr++;
--$5 = 0
--$6 = 0
--$7 = 0
--Continuing.
--Program exited normally.
-+0x........ in syscall ...
-+* 1 Thread .... (tid 1 VgTs_WaitSys)  0x........ in syscall ...
-+ > > > >4
-+Kill the program being debugged? (y or n) [answered Y; input not from terminal]
-diff --git a/gdbserver_tests/nlcontrolc.vgtest b/gdbserver_tests/nlcontrolc.vgtest
-index bb5308403..09edfcaba 100644
---- a/gdbserver_tests/nlcontrolc.vgtest
-+++ b/gdbserver_tests/nlcontrolc.vgtest
-@@ -4,16 +4,16 @@
- #          and modify some variables
- #   the user can control-c an process with all threads in Running/Yielding
- #          and modify some variables
--# sleepers is started with argument so that it will compute during ages.
--# The variable modifications means it will exit in a reasonable time.
--# This test is disabled on Solaris because modifying select/poll/ppoll timeout
--# has no effect if a thread is already blocked in that syscall.
-+# sleepers is started so that it burns CPU.
-+# We then interrupt the process.
-+# We modify variables so that instead of burning cpu, sleepers blocks
-+# all threads in a select syscall.
- prog: sleepers
--args: 1000000000 1000000000 1000000000 BSBSBSBS 1
-+args: 1000000000 0 100000 BSBSBSBS 1
- vgopts: --tool=none --vgdb=yes --vgdb-error=0 --vgdb-prefix=./vgdb-prefix-nlcontrolc
- stderr_filter: filter_stderr
- # Bug 338633 nlcontrol hangs on arm64 currently.
--prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/arch_test arm64 && ! ../tests/os_test solaris
-+prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/os_test solaris
- progB: gdb
- argsB: --quiet -l 60 --nx ./sleepers
- stdinB: nlcontrolc.stdinB.gdb
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
deleted file mode 100644
index 37f6ea667d..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 15330adf7c2471fbaa6a0818db07078d81dbff97 Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Sat, 19 Sep 2020 08:08:59 -0700
-Subject: [PATCH] drd: Port to Fedora 33
-
-Apparently on Fedora 33 the POSIX thread functions exist in both libc and
-libpthread. Hence this patch that intercepts the pthread functions in
-libc. See also https://bugs.kde.org/show_bug.cgi?id=426144 .
-
-Signed-off-by: Bart Van Assche <bvanassche@acm.org>
-
-This patch was imported from the valgrind sourceware server
-(https://sourceware.org/git/?p=valgrind.git;a=commit;h=15330adf7c2471fbaa6a0818db07078d81dbff97)
-It was modified to remove the changes to the valgrind NEWS file,
-as these are difficult to maintain and don't impact the valgrind 
-code itself.
-
-Upstream-Status: Backport
-
-Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
----
- drd/drd_pthread_intercepts.c | 9 +++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c
-index 58c45aaec..c2882e5ab 100644
---- a/drd/drd_pthread_intercepts.c
-+++ b/drd/drd_pthread_intercepts.c
-@@ -174,7 +174,16 @@ static int never_true;
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
-    { return implf argl; }
- #else
-+/*
-+ * On Linux, intercept both the libc and the libpthread functions. At
-+ * least glibc 2.32.9000 (Fedora 34) has an implementation of all pthread
-+ * functions in both libc and libpthread. Older glibc versions only have an
-+ * implementation of the pthread functions in libpthread.
-+ */
- #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
-+   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           \
-+   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
-+   { return implf argl; }                                               \
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
-    { return implf argl; }
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch
index e96bf3c611..a3268714b8 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch
@@ -1,13 +1,5 @@
-The changes in 0001-drd-Port-to-Fedora-33.patch break builds on musl. These
-need a __GLIBC__ guard to ensure musl builds continue to work.
-
-Upstream-Status: Pending
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: valgrind-3.16.1/drd/drd_pthread_intercepts.c
-===================================================================
---- valgrind-3.16.1.orig/drd/drd_pthread_intercepts.c
-+++ valgrind-3.16.1/drd/drd_pthread_intercepts.c
+--- a/drd/drd_pthread_intercepts.c
++++ b/drd/drd_pthread_intercepts.c
 @@ -180,6 +180,7 @@ static int never_true;
   * functions in both libc and libpthread. Older glibc versions only have an
   * implementation of the pthread functions in libpthread.
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
index d641998d72..e421ac6c80 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
@@ -19,7 +19,7 @@ index 6e5a797b9..0ede1ab18 100644
 @@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
  
  
- FILE DESCRIPTORS: 6 open at exit.
+ FILE DESCRIPTORS: 6 open (3 std) at exit.
 -Open file descriptor ...: /tmp/data2
 +Open file descriptor ...: ...
     ...
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-patch-drd_pthread_intercepts.c-for-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-patch-drd_pthread_intercepts.c-for-musl.patch
new file mode 100644
index 0000000000..8af1be8ead
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-patch-drd_pthread_intercepts.c-for-musl.patch
@@ -0,0 +1,39 @@
+From db26c19477894c9473959a2e292c77fd5b5edeb4 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Fri, 19 Mar 2021 14:11:02 -0700
+Subject: [PATCH] patch drd_pthread_intercepts.c for musl
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ drd/drd_pthread_intercepts.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c
+index 28c0de78b..82c612a7e 100644
+--- a/drd/drd_pthread_intercepts.c
++++ b/drd/drd_pthread_intercepts.c
+@@ -169,6 +169,7 @@ static int never_true;
+       return pth_func_result;						\
+    }
+ #elif defined(VG_WRAP_THREAD_FUNCTION_LIBC_ONLY)
++#ifdef __GLIBC__
+ #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
+    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           \
+    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
+@@ -182,6 +183,13 @@ static int never_true;
+    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
+    { return implf argl; }
+ #else
++#define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
++   { return implf argl; }
++#endif
++#define 
++#else
+ #  error "Unknown platform/thread wrapping"
+ #endif
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index b431d3356e..db6867f625 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From 67e7a690107efb16d6d5aebfe420b64a552accdf Mon Sep 17 00:00:00 2001
+From d85cc45e0ddeda68adf594dead715964cb32d0e7 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 31 Aug 2010 22:51:58 +0800
 Subject: [PATCH] valgrind: fix perl scripts
@@ -22,10 +22,11 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  cachegrind/cg_diff.in     | 2 +-
  massif/ms_print.in        | 2 +-
  perf/vg_perf.in           | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
+ tests/vg_regtest.in       | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/cachegrind/cg_annotate.in b/cachegrind/cg_annotate.in
-index 69365e8..978265d 100644
+index fea114b..5e814fd 100644
 --- a/cachegrind/cg_annotate.in
 +++ b/cachegrind/cg_annotate.in
 @@ -1,4 +1,4 @@
@@ -35,7 +36,7 @@ index 69365e8..978265d 100644
  ##--------------------------------------------------------------------##
  ##--- Cachegrind's annotator.                       cg_annotate.in ---##
 diff --git a/cachegrind/cg_diff.in b/cachegrind/cg_diff.in
-index 395460b..05873cc 100755
+index 9d9258e..d0f0ec7 100755
 --- a/cachegrind/cg_diff.in
 +++ b/cachegrind/cg_diff.in
 @@ -1,4 +1,4 @@
@@ -45,7 +46,7 @@ index 395460b..05873cc 100755
  ##--------------------------------------------------------------------##
  ##--- Cachegrind's differencer.                         cg_diff.in ---##
 diff --git a/massif/ms_print.in b/massif/ms_print.in
-index e6fae89..3b85b40 100755
+index a206ce4..df1bc31 100755
 --- a/massif/ms_print.in
 +++ b/massif/ms_print.in
 @@ -1,4 +1,4 @@
@@ -55,7 +56,7 @@ index e6fae89..3b85b40 100755
  ##--------------------------------------------------------------------##
  ##--- Massif's results printer                         ms_print.in ---##
 diff --git a/perf/vg_perf.in b/perf/vg_perf.in
-index 7a80cb0..28f6156 100644
+index 90ee1d2..c585096 100644
 --- a/perf/vg_perf.in
 +++ b/perf/vg_perf.in
 @@ -1,4 +1,4 @@
@@ -65,7 +66,7 @@ index 7a80cb0..28f6156 100644
  ##--- Valgrind performance testing script                  vg_perf ---##
  ##--------------------------------------------------------------------##
 diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index cb05b52..032e947 100755
+index 0fe6341..1b45eb7 100755
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
 @@ -1,4 +1,4 @@
@@ -74,5 +75,6 @@ index cb05b52..032e947 100755
  ##--------------------------------------------------------------------##
  ##--- Valgrind regression testing script                vg_regtest ---##
  ##--------------------------------------------------------------------##
----
-2.4.0
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/musl.supp b/meta/recipes-devtools/valgrind/valgrind/musl.supp
new file mode 100644
index 0000000000..864172a242
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/musl.supp
@@ -0,0 +1,46 @@
+# Suppressions for musl libc
+# See: https://www.openwall.com/lists/musl/2017/06/15/4
+
+{
+   musl-dynlink-false-positive1
+   Memcheck:Leak
+   fun:calloc
+   fun:load_direct_deps
+   fun:load_deps
+   fun:load_deps
+   fun:__dls3
+   fun:__dls2b
+   fun:__dls2
+}
+
+{
+   musl-dynlink-false-positive2
+   Memcheck:Leak
+   fun:calloc
+   fun:load_direct_deps
+   fun:load_deps
+   fun:load_deps
+   fun:__dls3
+   fun:__dls2
+}
+
+{
+   musl-dynlink-false-positive3
+   Memcheck:Leak
+   fun:calloc
+   fun:load_library
+   fun:load_preload
+   fun:__dls3
+   fun:__dls2b
+   fun:__dls2
+}
+
+{
+   musl-dynlink-false-positive4
+   Memcheck:Leak
+   fun:calloc
+   fun:load_library
+   fun:load_preload
+   fun:__dls3
+   fun:__dls2
+}
diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index e8a1a668fc..3e0205fe6e 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -7,6 +7,7 @@
 # Randy MacLeod <Randy.MacLeod@windriver.com>
 ###############################################################
 VALGRIND_LIB=@libdir@/valgrind
+VALGRIND_LIBEXECDIR=@libexecdir@/valgrind
 VALGRIND_BIN=@bindir@/valgrind
 
 LOG="${VALGRIND_LIB}/ptest/valgrind_ptest_$(date +%Y%m%d-%H%M%S).log"
@@ -33,7 +34,7 @@ fi
 
 cd ${VALGRIND_LIB}/ptest && ./tests/vg_regtest \
     --valgrind=${VALGRIND_BIN} \
-    --valgrind-lib=${VALGRIND_LIB} \
+    --valgrind-lib=${VALGRIND_LIBEXECDIR} \
     --yocto-ptest \
     gdbserver_tests ${TOOLS} ${EXP_TOOLS} \
     2>&1|tee ${LOG}  
diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
index eea671da0a..bde1241dc7 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -1,3 +1,8 @@
+From 8154d38bac5cdb3675cfdaf562ab9da01988b263 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Wed, 17 Mar 2021 12:16:31 -0400
+Subject: [PATCH 19/20] remove s390x_vec_op_t
+
 s390x_vec_op_t is not needed anywhere, only elements of enum are accessed
 removing it ensures that valgrind can be built with -fno-common option
 
@@ -6,14 +11,25 @@ ld: ../../VEX/libvex-amd64-linux.a(libvex_amd64_linux_a-guest_s390_helpers.o):/u
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ VEX/priv/guest_s390_defs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/VEX/priv/guest_s390_defs.h b/VEX/priv/guest_s390_defs.h
+index 9054290..dab8002 100644
 --- a/VEX/priv/guest_s390_defs.h
 +++ b/VEX/priv/guest_s390_defs.h
-@@ -286,7 +286,7 @@ enum {
-    S390_VEC_OP_VFCHE = 18,
-    S390_VEC_OP_VFTCI = 19,
-    S390_VEC_OP_LAST = 20 // supposed to be the last element in enum
+@@ -284,7 +284,7 @@ typedef enum {
+    S390_VEC_OP_VBPERM,
+    S390_VEC_OP_VMSL,
+    S390_VEC_OP_LAST             // supposed to be the last element in enum
 -} s390x_vec_op_t;
 +};
  
  /* Arguments of s390x_dirtyhelper_vec_op(...) which are packed into one
     ULong variable.
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
similarity index 93%
rename from meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index 9dbd9f74c4..1c1ca74262 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} \
         "
 
-SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
+SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.RC2.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://run-ptest \
@@ -42,13 +42,15 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://s390x_vec_op_t.patch \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
-           file://0001-drd-Port-to-Fedora-33.patch \
-           file://0001-drd-musl-fix.patch \
-           file://0001-helgrind-Intercept-libc-functions.patch \
-           file://0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch \
+           file://musl.supp;subdir=${S} \
+           file://0001-Disable-drd-tests-swapcontext.vgtest.patch \
            "
-SRC_URI[md5sum] = "d1b153f1ab17cf1f311705e7a83ef589"
-SRC_URI[sha256sum] = "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba918cc6720a33ca"
+
+S = "${WORKDIR}/valgrind-${PV}.RC2"
+
+SRC_URI[sha256sum] = "3f27d2176ef9f316bca2ef89abb7cf9da2d99c69bcc4cd0fc86b9debbf55ede5"
+SRC_URI[md5] = "5dcf7c42635e19b074714c53f3a57580"
+
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
@@ -100,6 +102,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 # to -O2 but uses -O0 for some specific test apps etc. Passing our own flags
 # (via CFLAGS) means we interfere with that. Only pass DEBUG_FLAGS to it
 # which fixes build path issue in DWARF.
+# this might be key to our issue
 SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
 
 do_configure_prepend () {
@@ -134,7 +137,7 @@ RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 
 RDEPENDS_${PN}-ptest += " bash coreutils file \
    gdb libgomp \
-   perl \
+   perl perl-modules \
    perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
    perl-module-overloading \
    procps sed ${PN}-dbg ${PN}-src"
@@ -223,6 +226,7 @@ do_install_ptest() {
 
     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
+    sed -i s:@libexecdir@:${libexecdir}:g ${D}${PTEST_PATH}/run-ptest
     sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
 
     # This test fails on the host as well, using both 3.15 and git master (as of Jan 24 2020)
@@ -233,6 +237,9 @@ do_install_ptest() {
     # via dwarfsrcfiles either, so it needs to be installed manually.
     mkdir -p ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
     install ${S}/none/tests/tls.c ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
+
+    # workaround to pass gdbserver_tests/hgtls (make gdb find tls.c)
+    install ${S}/none/tests/tls.c  ${D}${PTEST_PATH}/gdbserver_tests/tls.c
 }
 
 # avoid stripping some generated binaries otherwise some of the tests will fail
-- 
2.17.1

