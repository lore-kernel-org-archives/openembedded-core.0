Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E41CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 10:30:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.51173.1697797804226432906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 03:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=865775a26a=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39K8lbwO026496
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 10:30:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tuevt8dtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 10:30:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzHd/FPsqAm6SVtrRb6uyjWTbqdrTIfBQYTqX5Rbx/+kuZUmJj1B5IUoz+WarxBgEA75nfLuy71/oSrb/QbFtOJw8e4CIFHUcj/V6ziYm4GD9qvC5h+iq/fzzX8LQfnJHBxMHxEf6U9JpFfg4OQm0U/ZiDDs56v2mGOlr2WM5lLEEXBVX/522QXVEfYiShB3D9yKcqNPCRDEvcVmFtnFA8uUb1ekyIRWfKWOQkb4HgezzYCYlMb0CbB70FiYz3Fbt9qBGO8rY0ZiGc5U+msY0vjq2HqH6iDrNETS+Bw95XZHN3BrygSDwcmgnTuSCc8jv9hv8L5t6nk12QiMZmcr6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o696KRNh+FEEhrDdmCNyjys2m2F+fLm8KYXLSyb7Xto=;
 b=Eo34Phpw8AGAOgP0pgOIdz/Y1v2aOSMOqKzGEp65GFzgpROCEBeq22jn3T0xzKw6iZ4i60E65IpK3mvOHuo754tOZ+u1HNBLTz2S5s9JmIlH9fE+PS55K4IqlKCStGg3Nr7CtXmpWVf4zAbdSEuCEKkckz2B/WlEmlrHccmHWnaLujTMXeyKlQ9CFEeo75cE9KDowwvE+8RBg/IbQu63qhiyHGGFS72QeAk5+opCPqH6er55k2F/95HNv3aI5yLYu+OhclCBqNWYnyfmm12HSS02yy+PrvysXAQRIG8QJKRymJZXmLE74CWIENWk1o4mZjOdXX+x2V49y6NIb5i3kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ2PR11MB7670.namprd11.prod.outlook.com (2603:10b6:a03:4c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Fri, 20 Oct
 2023 10:29:57 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::4e4:7eee:356e:cfb7]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::4e4:7eee:356e:cfb7%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 10:29:56 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] shadow: update 4.13 -> 4.14.1
Date: Fri, 20 Oct 2023 18:29:42 +0800
Message-Id: <20231020102942.1378654-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0226.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::13) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ2PR11MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 6815391c-9141-46f0-2449-08dbd157814e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	330Bl4dwa/8pO2CP868zfUyESJZhBDdI/9uq5bMkrgsuUhpcHcUOQLU5MQP9zhJL/zD2G7yvLZq0MhXlUlaZQMU9d6JkIy6ft6AdSOIZ/n95IhJynHp53WQiMbhMK28NHWOq8YOOaGv34JLOdrTCUds0i2O9aTiq81DC3rBTMeka8RFvT8JxYDJ0Ic0D3ZcI5fxgHPvoC2xO75eSPWjT1ZqrG7o26tKgsfM6ZSa4IBqOijD5oRnBP+cvm6H+U1IHh8/jP7jXkfFTWQA4Z0Vl3VT+mHvm8SEkudhCaoFiho0OOex89lwC5jAPKryJqRpQCkYhSm3REPynqGzKYu/+0sj3jP5s+rGfSAFsct7/a7/P/ipLW8cqLxsoLbD7/Sif7G1DswMDqu6WwRA+7OBH42gN8b9QfKe+Cs2mrxt8PYDTEFJYm53UCBm6cA+/w083l2lRd5pO3WXgJFOaxObUF+F7pMK+8V9zZnA3YjmCPp+ZjrP7ccf6gkRTDnxEhQFl/8Y1mR4AKtLpHm14nH1eWjVCCvLyNfui3Uc7/kOeQhiUwK7zOCnFx4Dfz/rjflVtGlgL5MkJk6kigycJFV7WfbTIOCgG1nfB5SJAwvM5wJTqRHCmHqIROS7WMYwkwa6QNrlBNVyqvvvyICyX3DcMR6ZP5Pj4AlbBmySDD55L50M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(39850400004)(366004)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(5660300002)(6916009)(66946007)(66556008)(316002)(66476007)(8936002)(478600001)(8676002)(6486002)(38100700002)(83170400001)(83380400001)(6512007)(66574015)(15650500001)(30864003)(2616005)(1076003)(26005)(41300700001)(38350700005)(6506007)(6666004)(2906002)(44832011)(52116002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EjnuzLotd+2CALPcmE11H8r3BjJSXrADAm3Lt1LZobWY0WXSSlwvZJV2q+Zm?=
 =?us-ascii?Q?oj4ICEQj2+ecTObcSlE8TRTALWT8upWpJaHjT3EsFle/xoV0RlDKqMfviuik?=
 =?us-ascii?Q?BMjj2R+XL0y37MEvBYsXKHkFLkCOOTED4xnOt0kqCMWC25nU+bQ46gNJsJYt?=
 =?us-ascii?Q?T8anzU4t18c2P+mJ7+PTIWjZoSgjzYKQn9Ek1nz/6Gw2DNWsnCWDJIoKhcLc?=
 =?us-ascii?Q?iEWbtufo1HNJMMPUE23BZAp2L0bLR4CI/7sKRfIqd+RRkhnMlWoL2O3b2+UA?=
 =?us-ascii?Q?4Gg1oMVDn7Phk/ylUyOuf5DnKMnMHXkEulHmRZgcSgQWX8L69VRBpJHyThas?=
 =?us-ascii?Q?StKJUh9PgTzD+IcojapBHiloidAaCYI/4irNONUljt8v5pmqOQwzyTYTqNf9?=
 =?us-ascii?Q?OnSfaI/YSNExI7YrLeHv3qPomQLVOAv+8bbh//Tud4cz/CMla3OrpliZ9ctw?=
 =?us-ascii?Q?jq9mJUlkvQgIta5L5mNByuwjE0hH4m899v8CWvz17c1w0YKeqWvEIE2TQr9Y?=
 =?us-ascii?Q?C+BZBISTtdH1vMcqRL1SkRGd0fkvKRKkobAIFWbiqk9resx5Q5ue/jALuHh1?=
 =?us-ascii?Q?L8rRTeIvWrAN8RWGc6QCBnoo6kVo5dhw6TyXjqkAW0KMWWe1BlkzqKgUxXq0?=
 =?us-ascii?Q?iwNLWJm0eucF06EtQ8RAg+t/eWf0TztG3hQLeQEYleK1hcjUDhZWIyGjnkHW?=
 =?us-ascii?Q?TwHKzvdsxYI4XdhBCF4OxdEt9OLb/oklyld5F0RnDbTTlvqUA2lLaj5hPcLX?=
 =?us-ascii?Q?yfco5p+9DREsgWwX4S92zO0Ht6sWyFsI4tD//3lKtkXvYnV1KlAzY86ZFIs5?=
 =?us-ascii?Q?qz6b9dr/90D05IZlHmv5sh8DtT05Vp+/q8KO+0zkXEzm4nb4TT97nPc9Mf6a?=
 =?us-ascii?Q?/JHFSN4kqJrrdwdWqEThXYyPXUxHj6N5DoZILWW3IkZu+cRb0sopxraxlC3l?=
 =?us-ascii?Q?2+FyuqJAZ8fYOnVC1XO9wKB0MphHfT1G7uMRmWf+tHOa0sk1wU/b28igffyP?=
 =?us-ascii?Q?goTT5fQQExp0ZVpuTAl+WHsFVXkJBuG0jtSIBtrAL2cqqh8jt2VhrrksXgHm?=
 =?us-ascii?Q?ZQUQCudZ52SSVFXVyePPbMxT7E0mFdwjqHeyCSxKZN2IFGsQR85FM0OKRZnN?=
 =?us-ascii?Q?6NRYTY1nRxTm+lwSelGhCT+RoHWhkkw9jwN5RptWdc4NU1r9z9f2vINhd85Y?=
 =?us-ascii?Q?eIDj6iOhHH1+hCz4WBK2lhhtg4gXnLMgYRzGHrQSvCRjr8FrS9hRpCcg2q5P?=
 =?us-ascii?Q?UfWcCjuXAE4JaBzofjhrJgeY7RK7h/ItdOJYslSWfPXKUKjhXqyhDX48oN1w?=
 =?us-ascii?Q?w5HulYjen2eNkY9XJnG0+QDOGXEdPyZUjtlejtPEfv9Cms3TTEhCN7raIGAn?=
 =?us-ascii?Q?EN4W2m4RiJr7InQg9kg4DkJ1zezHrqWmxwdI+zsAZ7SFO7odtPxd4nw0/Xuj?=
 =?us-ascii?Q?AAgZhfCvUXXRXDR+Hlz8npmHvjxBtnwoGhEdjaMTE2AIqqWFrRW9TM1oxVuS?=
 =?us-ascii?Q?0B4x3A05lxANokvLAWmkjWfTgFg81GSAJaj2fg8g3s3c2W+/uOdPZd9596Br?=
 =?us-ascii?Q?f/3ZDgKtPfbX8JP4vzDal5TorvWT8D02YxgNNxjdvDikqWR6tLZhT2iJn9qZ?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6815391c-9141-46f0-2449-08dbd157814e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 10:29:56.6291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMOVMKZdKenN6kBWeuKDizFzwSekAtuS47GD52abkSAxc6rsxOfo+X+57Ll1EqPJEzVEbzM9BQC6pDEtDvyH5MR+LxxgU3cre6ccW/1oMVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7670
X-Proofpoint-ORIG-GUID: FW2RymvMLO2gxn1XGGQZDY6sUfnALbbZ
X-Proofpoint-GUID: FW2RymvMLO2gxn1XGGQZDY6sUfnALbbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_08,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2310170000
 definitions=main-2310200086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 10:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189515

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Based on Alex's 4.13->4.14.0 patch (oe-core maillist #187776)

Refresh patch: commonio.c-fix-unexpected-open-failure-in-chroot-env.patch

Drop patches:
0001-Disable-use-of-syslog-for-sysroot.patch
0001-Fix-can-not-print-full-login.patch
0001-Overhaul-valid_field.patch
CVE-2023-29383.patch

License-Update: formatting, spdx conversion

Depends update: libbsd

A similar fix is added to musl in order to define non-standard __BEGIN_DECLS/__END_DECLS.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...01-Disable-use-of-syslog-for-sysroot.patch | 52 ---------------
 .../0001-Fix-can-not-print-full-login.patch   | 41 ------------
 .../files/0001-Overhaul-valid_field.patch     | 65 -------------------
 .../shadow/files/CVE-2023-29383.patch         | 53 ---------------
 ...nexpected-open-failure-in-chroot-env.patch | 22 ++++---
 meta/recipes-extended/shadow/shadow.inc       | 18 ++---
 .../{shadow_4.13.bb => shadow_4.14.1.bb}      |  0
 7 files changed, 19 insertions(+), 232 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
 delete mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.patch
 rename meta/recipes-extended/shadow/{shadow_4.13.bb => shadow_4.14.1.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
deleted file mode 100644
index fa1532c831..0000000000
--- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 85d0444229ee3d14fefcf10d093f49c862826f82 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 14 Apr 2022 23:11:53 +0000
-Subject: [PATCH] Disable use of syslog for shadow-native tools
-
-Disable use of syslog to prevent sysroot user and group additions from
-writing entries to the host's syslog. This patch should only be used
-with the shadow-native recipe.
-
-Upstream-Status: Inappropriate [OE specific configuration]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-
----
- configure.ac      | 2 +-
- src/login_nopam.c | 3 ++-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 924254a..603af81 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -191,7 +191,7 @@ AC_DEFINE_UNQUOTED(PASSWD_PROGRAM, "$shadow_cv_passwd_dir/passwd",
- 	[Path to passwd program.])
- 
- dnl XXX - quick hack, should disappear before anyone notices :).
--AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
-+#AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
- if test "$ac_cv_func_ruserok" = "yes"; then
- 	AC_DEFINE(RLOGIN, 1, [Define if login should support the -r flag for rlogind.])
- 	AC_DEFINE(RUSEROK, 0, [Define to the ruserok() "success" return value (0 or 1).])
-diff --git a/src/login_nopam.c b/src/login_nopam.c
-index df6ba88..fc24e13 100644
---- a/src/login_nopam.c
-+++ b/src/login_nopam.c
-@@ -29,7 +29,6 @@
- #ifndef USE_PAM
- #ident "$Id$"
- 
--#include "prototypes.h"
-     /*
-      * This module implements a simple but effective form of login access
-      * control based on login names and on host (or domain) names, internet
-@@ -57,6 +56,8 @@
- #include <netinet/in.h>
- #include <arpa/inet.h>		/* for inet_ntoa() */
- 
-+#include "prototypes.h"
-+
- #if !defined(MAXHOSTNAMELEN) || (MAXHOSTNAMELEN < 64)
- #undef MAXHOSTNAMELEN
- #define MAXHOSTNAMELEN 256
diff --git a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch b/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
deleted file mode 100644
index 89f9c05c8d..0000000000
--- a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-commit 670cae834827a8f794e6f7464fa57790d911b63c
-Author: SoumyaWind <121475834+SoumyaWind@users.noreply.github.com>
-Date:   Tue Dec 27 17:40:17 2022 +0530
-
-    shadow: Fix can not print full login timeout message
-    
-    Login timed out message prints only first few bytes when write is immediately followed by exit.
-    Calling exit from new handler provides enough time to display full message.
-
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f7464fa57790d911b63c]
-
-diff --git a/src/login.c b/src/login.c
-index 116e2cb3..c55f4de0 100644
---- a/src/login.c
-+++ b/src/login.c
-@@ -120,6 +120,7 @@ static void get_pam_user (char **ptr_pam_user);
- 
- static void init_env (void);
- static void alarm_handler (int);
-+static void exit_handler (int);
- 
- /*
-  * usage - print login command usage and exit
-@@ -391,11 +392,16 @@ static void init_env (void)
- #endif				/* !USE_PAM */
- }
- 
-+static void exit_handler (unused int sig)
-+{
-+	_exit (0);
-+}
- 
- static void alarm_handler (unused int sig)
- {
- 	write (STDERR_FILENO, tmsg, strlen (tmsg));
--	_exit (0);
-+	signal(SIGALRM, exit_handler);
-+	alarm(2);
- }
- 
- #ifdef USE_PAM
diff --git a/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch b/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
deleted file mode 100644
index ac08be515b..0000000000
--- a/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 2eaea70111f65b16d55998386e4ceb4273c19eb4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
-Date: Fri, 31 Mar 2023 14:46:50 +0200
-Subject: [PATCH] Overhaul valid_field()
-
-e5905c4b ("Added control character check") introduced checking for
-control characters but had the logic inverted, so it rejects all
-characters that are not control ones.
-
-Cast the character to `unsigned char` before passing to the character
-checking functions to avoid UB.
-
-Use strpbrk(3) for the illegal character test and return early.
-
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/2eaea70111f65b16d55998386e4ceb4273c19eb4]
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- lib/fields.c | 24 ++++++++++--------------
- 1 file changed, 10 insertions(+), 14 deletions(-)
-
-diff --git a/lib/fields.c b/lib/fields.c
-index fb51b582..53929248 100644
---- a/lib/fields.c
-+++ b/lib/fields.c
-@@ -37,26 +37,22 @@ int valid_field (const char *field, const char *illegal)
- 
- 	/* For each character of field, search if it appears in the list
- 	 * of illegal characters. */
-+	if (illegal && NULL != strpbrk (field, illegal)) {
-+		return -1;
-+	}
-+
-+	/* Search if there are non-printable or control characters */
- 	for (cp = field; '\0' != *cp; cp++) {
--		if (strchr (illegal, *cp) != NULL) {
-+		unsigned char c = *cp;
-+		if (!isprint (c)) {
-+			err = 1;
-+		}
-+		if (iscntrl (c)) {
- 			err = -1;
- 			break;
- 		}
- 	}
- 
--	if (0 == err) {
--		/* Search if there are non-printable or control characters */
--		for (cp = field; '\0' != *cp; cp++) {
--			if (!isprint (*cp)) {
--				err = 1;
--			}
--			if (!iscntrl (*cp)) {
--				err = -1;
--				break;
--			}
--		}
--	}
--
- 	return err;
- }
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
deleted file mode 100644
index f53341d3fc..0000000000
--- a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From e5905c4b84d4fb90aefcd96ee618411ebfac663d Mon Sep 17 00:00:00 2001
-From: tomspiderlabs <128755403+tomspiderlabs@users.noreply.github.com>
-Date: Thu, 23 Mar 2023 23:39:38 +0000
-Subject: [PATCH] Added control character check
-
-Added control character check, returning -1 (to "err") if control characters are present.
-
-CVE: CVE-2023-29383
-Upstream-Status: Backport
-
-Reference to upstream:
-https://github.com/shadow-maint/shadow/commit/e5905c4b84d4fb90aefcd96ee618411ebfac663d
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- lib/fields.c | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/lib/fields.c b/lib/fields.c
-index 640be931..fb51b582 100644
---- a/lib/fields.c
-+++ b/lib/fields.c
-@@ -21,9 +21,9 @@
-  *
-  * The supplied field is scanned for non-printable and other illegal
-  * characters.
-- *  + -1 is returned if an illegal character is present.
-- *  +  1 is returned if no illegal characters are present, but the field
-- *       contains a non-printable character.
-+ *  + -1 is returned if an illegal or control character is present.
-+ *  +  1 is returned if no illegal or control characters are present,
-+ *       but the field contains a non-printable character.
-  *  +  0 is returned otherwise.
-  */
- int valid_field (const char *field, const char *illegal)
-@@ -45,10 +45,13 @@ int valid_field (const char *field, const char *illegal)
- 	}
- 
- 	if (0 == err) {
--		/* Search if there are some non-printable characters */
-+		/* Search if there are non-printable or control characters */
- 		for (cp = field; '\0' != *cp; cp++) {
- 			if (!isprint (*cp)) {
- 				err = 1;
-+			}
-+			if (!iscntrl (*cp)) {
-+				err = -1;
- 				break;
- 			}
- 		}
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 85d9175105..bbe096d124 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,6 +1,6 @@
-From 21583da072aa66901d859ac00ce209bac87ddecc Mon Sep 17 00:00:00 2001
+From 9c376d2acffe2e7ed663e3329472a9932ecd2bb7 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 17 Jul 2014 15:53:34 +0800
+Date: Fri, 20 Oct 2023 09:58:05 +0000
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
 
 Upstream-Status: Inappropriate [OE specific]
@@ -15,35 +15,37 @@ Note that this patch doesn't change the logic in the code, it just expands
 the codes.
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
 ---
  lib/commonio.c | 16 ++++++++++++----
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 9a02ce1..61384ec 100644
+index 73fdb3a..6273d52 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -616,10 +616,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -606,10 +606,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
 -	fd = open (db->filename,
 -	             (db->readonly ? O_RDONLY : O_RDWR)
--	           | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
+-	           | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
 -	saved_errno = errno;
 +	if (db->readonly) {
 +		fd = open (db->filename,
-+			   (true ? O_RDONLY : O_RDWR)
-+			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
++		             (true ? O_RDONLY : O_RDWR)
++	        	   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
 +		saved_errno = errno;
 +	} else {
 +		fd = open (db->filename,
-+			   (false ? O_RDONLY : O_RDWR)
-+			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
++		             (false ? O_RDONLY : O_RDWR)
++	        	   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
 +		saved_errno = errno;
 +	}
 +
  	db->fp = NULL;
  	if (fd >= 0) {
  #ifdef WITH_TCB
+-- 
+2.35.5
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 83e1a84769..f711d78801 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -5,7 +5,7 @@ BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a450b7be84eac23e6353efecb60b5b \
-                    file://src/passwd.c;beginline=2;endline=30;md5=758c26751513b6795395275969dd3be1 \
+                    file://src/passwd.c;beginline=2;endline=7;md5=67bcf314687820b2f010d4863fce3fc5 \
                     "
 
 DEPENDS = "virtual/crypt"
@@ -14,9 +14,6 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
-	   file://0001-Fix-can-not-print-full-login.patch \
-           file://CVE-2023-29383.patch \
-           file://0001-Overhaul-valid_field.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -25,13 +22,9 @@ SRC_URI:append:class-target = " \
            "
 
 SRC_URI:append:class-native = " \
-           file://0001-Disable-use-of-syslog-for-sysroot.patch \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI:append:class-nativesdk = " \
-           file://0001-Disable-use-of-syslog-for-sysroot.patch \
-           "
-SRC_URI[sha256sum] = "813057047499c7fe81108adcf0cffa3ad4ec75e19a80151f9cbaa458ff2e86cd"
+SRC_URI[sha256sum] = "76a2de27837c96f94f7c3c0dce2d94dbd4b9b752025135d4ee74aeafa4ca88e5"
 
 
 # Additional Policy files for PAM
@@ -43,7 +36,7 @@ PAM_SRC_URI = "file://pam.d/chfn \
                file://pam.d/passwd \
                file://pam.d/su"
 
-inherit autotools gettext github-releases
+inherit autotools gettext github-releases pkgconfig
 
 export CONFIG_SHELL="/bin/sh"
 
@@ -53,6 +46,8 @@ EXTRA_OECONF += "--without-libcrack \
                  --without-sssd \
                  ${NSCDOPT}"
 
+CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
+
 NSCDOPT = ""
 NSCDOPT:class-native = "--without-nscd"
 NSCDOPT:class-nativesdk = "--without-nscd"
@@ -72,13 +67,14 @@ PAM_PLUGINS = "libpam-runtime \
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
-PACKAGECONFIG:class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
+PACKAGECONFIG:class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} libbsd"
 PACKAGECONFIG:class-nativesdk = ""
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
 PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux libsemanage"
+PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
 
 RDEPENDS:${PN} = "shadow-securetty \
                   base-passwd \
diff --git a/meta/recipes-extended/shadow/shadow_4.13.bb b/meta/recipes-extended/shadow/shadow_4.14.1.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.13.bb
rename to meta/recipes-extended/shadow/shadow_4.14.1.bb
-- 
2.34.1


