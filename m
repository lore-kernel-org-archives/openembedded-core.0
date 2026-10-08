Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2862CA6016
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 19:59:37 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3384.1791489566310501056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 12:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=BZlw4ET8;
 spf=pass (domain: est.tech, ip: 40.107.159.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGbEaA9JcP0CdnabTNSK3P72+W/ve/eJQjjlUTw6hbM1xUa+IjWbSVlIO9ZipWhcrNnkvTWdI+/RFbEmEe4LhPmDTxBDsqyYSbA1h1UeP5W//OrN2b8WBlSPXq+mA9W52hlaRs4sot47tZincWY4Mrg3E1WJTR/8XMj/vVRHl2rblxSvXoehBdnczqor64hGVq0OcD8EINX8/ctCdHHrw6UVW596GZSP1CsjfFKmy1jbN9boun4g1VS9fFtM/Wxn1wBjPbKtUnddQrjsJXAFhjORdw6J1OMYvJQRLYkClhX2ihNLh5pxeH32o9X3hAvFPXysdw9hi7aLfQANNi9+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1io7WnCOfRG32XHnLRUXJvZMbtkp5zASdS6G5sw6F0k=;
 b=qwjscKPsY8ojdqiXD7NJkjwWWxmRA9MZneQMJl9e15/MEnkljpYXGEmAbDSRaBUMUWXnYvEtlhXDMdemPthGdOsMqeHaz55bcGKn7OPTHOuP6Fvu2nGDkvgU0/BnAVCztwJiNPA/g7BYtYavltbNjxv5nxqV+FVy2drN63UaXkGr/7jdI+/Qt1wcCzdUsZub1JfOgARZQur5SDHu/Uekr6ELIIvGtO5tXn7lyBg4JtOdrUVcZfi3AifOgUmhCD8h/vEzGN843MZtX3nkhT8YdCH4Sg3qRK5Qd4YMNam5UR2hnH8qe8Kvk9sf5v6wJg36WLYu8dIVk7nRNpzszfHNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1io7WnCOfRG32XHnLRUXJvZMbtkp5zASdS6G5sw6F0k=;
 b=BZlw4ET8sdfDQ/AUGi5Ev16jJHskmshvhtt5T3fh35ncrWcO7KXfg/jRlbifAFyRGOQlWwIQW7IO1nf1I7kKqz/CGAGLnhzWCogXx2A2NzzXdu5T2nkGZNZxs3r0tezAOIpiGvRn2EkwzS/dMh3W1D01lcE3O1sQbPxQ39yUYXskUtWt3SiUqevfx2jdEsey5g8ZIpyY1sUXa5opX76KW4BrKYV0QknaLKoN5zGqREoR6h3cGCYKO37l8cvFrKw1lzdmAcRj0Vs/zYGAFoeCYk+QMglA9RZQt11qgiPwIqpF4EXgc8/uLyBFO3UO25ZRitomjtN0WRKk4MV5Zd1YXQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB4P189MB3118.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:59:27 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 19:59:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] subversion: upgrade 1.14.5 -> 1.15.0
Date: Thu,  8 Oct 2026 21:59:17 +0200
Message-ID: <20261008195917.22382-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008195917.22382-1-jaipaul.cheernam@est.tech>
References: <20261008195917.22382-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB4P189MB3118:EE_
X-MS-Office365-Filtering-Correlation-Id: b5bf7d6a-98db-4d12-2a33-08df2576a88f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|260925022911599003|56012099006|11063799006|260925021911599003|260925021311599003|10067099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	cPZXPaZMr5f6JNjiQWoYAGOI+a2RBpZq0QOWMyhoIb+bgZ2jJVSwvTPrOOcxTq4OPE8auGBQhuCQ4Y90k4Irzu3THbPM2Af3Gr1vs0KuAecaTBEaf6Iz+ForrM1ERVCMfnyVpbH1JPOkwGmlk+hJ/p004VAp1YznkCCTSlnvvPlVA9rSBM4SqYxTQTRJSYvS6XG1ZD0qu+h/tFQYHDoAEVgA3ACSpqIfFZC7OII3jUyTwuZdeBRPPbUipY7Udc6R/JxufC1syad5wv6hjANfYtBZlNtgfBLJc4lHL2ehQbEd94yenyYN+GifVfB1l0JbWU8MqGIlfHQO+EM2OMwrscq1Kj0dfCQDd23Ljj9CXxIgX5tLC3oSDOi2FP7CF2BPlxmFpKtYtxYEX/dJGNwYGCwD0VGyEcSL2Qm/8cZ487xNR5OWax1VM9kpgFtHsgFgParkGscHLu1MXZQAZVGDBBaCC9uH/6xNgNHYt0LWXLprxF0i3kI5xJMTAy5Og/BjCc47moAR9jvuMus2UYkzQALC6hcZutiw5xsT6HcppcXyD4NBfmfYMd2D1f4OqPu/MXXvc6joa0hXZ6oE53tcVXia6K/PxRClq6lebq1s5Rc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(260925022911599003)(56012099006)(11063799006)(260925021911599003)(260925021311599003)(10067099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yXA70Gvh510bGgDqQxXzc9jiDcyCjt8SaGutm9hP/5X3Ej9jhDAYxW55V/KU?=
 =?us-ascii?Q?GT5y5Pvu3TjRnEh7PpxEUZHCfM/4bumSuSNlsJx5K/ixF8U0sBMhUyjXdEL/?=
 =?us-ascii?Q?OItAiblpkjkbCgUNXaHMzgVSuXnBQmhhKmc+VZiSLY9+GNkrcHamUCg06zul?=
 =?us-ascii?Q?91LHKKowz4zyspRFzRFzcpArvKxCY0f/p3AYYofKtlhjjNs4C4FXYR9W5XH+?=
 =?us-ascii?Q?zSmfPNSU0bA89BQgHr+Ejdgk4Mc9MbmwWZWMA7m6P2ErV+3HYGtYL6CQENVe?=
 =?us-ascii?Q?2Dzzu9eWpj2HEzgEd2xDo0bLukoUCwyKgiXockrkRYUXBqp4nOK43xTz2+13?=
 =?us-ascii?Q?0SlP1iYK6YROvms4wSrJrAC7/nwwx7sxFpN0G1kr4L/pTpKiioZxUedYQ10e?=
 =?us-ascii?Q?9qmLsxhv9n4QrQW6CFpSflYfl3PkFc0ypXqROgeEL0h8lbgVd++1kbgk5t+r?=
 =?us-ascii?Q?pTCCFhzF+bm5CtCwfGzROKP+wJFZlQgFNJbOsT/IFYsxXjEFnDelPR6+KSUK?=
 =?us-ascii?Q?VFtYN8rQO24vIxB2yWP3AnSNn5Zdj2lt+yDs62qe+7JdHwe9PZ5fRwK5S64g?=
 =?us-ascii?Q?/Xjp3OHFqyYDORTA45J/3z7s6QNV5/dhR7QTcHZfHEYZBaK7JYDxuC+o4fxt?=
 =?us-ascii?Q?o/Dw6mm+sv7zCkwaKcrxZ2f4zM4ICxtxPtIhceC3lFLJLYwHC8DPa8vGQQsX?=
 =?us-ascii?Q?4qtMQKaxjOHJ43Zw1ailper6vXfJGXPj4hihyG+Sv1m+1y22kmpc5d2Wx3hm?=
 =?us-ascii?Q?yJMs5yKj98ZUC0PhoYuBYNIJG82BwJSikPL7Bk4cDNb9BkqgMSTy3FAKzty8?=
 =?us-ascii?Q?2OJM+y1+z6GK6d5Z++qpIV2DG5XY4Imo3NCgzeImcbE+fH6E+Cu9RI6vnyXA?=
 =?us-ascii?Q?8+h1KlL248OENcs7SMge37C0tJxIgJ4GvvS6G6fgr71zgbYAdP0PC/c0qLWn?=
 =?us-ascii?Q?yHucu9zJUV40Ub+hL1jlS+2xv3fxTIcw6AFlbxCrBTNHEVYjQBzeNlOOFov5?=
 =?us-ascii?Q?u1i1gXbLmX6YpbApXQ4PIk/FlNxdHTXTriVJ3YOT4rOZ8b0TL85nMjml/erU?=
 =?us-ascii?Q?cEm445CBF98saNi61sw+gFpL36FYNmBFPC83xgNgJWUPQO1oTzQMSoviIxxU?=
 =?us-ascii?Q?oLhhaZBm44JH1kdcLzNWnvfVCNLs84mKjIxFErd5psYG3qT5w2WfHN/wo+Lj?=
 =?us-ascii?Q?Xs2WRy3pY3VsHgdAuafrob3jGfARNd3QE/K+1C2Rehtb4gjYK28TPSp1FZAC?=
 =?us-ascii?Q?3dcUwrTRhatqkH/R5lRjbxvWLY+LfuQG5dhhne5JXxuKIkeo2Lrwv+uAExMa?=
 =?us-ascii?Q?KPck4YZ5opK2sbQaAsLkfBLnmQUx2stW4jeAEkH8sEwm815nUuF3xKjlNRzU?=
 =?us-ascii?Q?W+Tyro7urQaa8qllQhnzqNanZuxnuWiYEPJqz9+S8FL6kBHgBWCQBT6l7rEI?=
 =?us-ascii?Q?SJ07RjxsujS7BzZp2gWGUjIrkuh+kqGH8BwMmkrxjjOyrXeBSPPDIZgRU43T?=
 =?us-ascii?Q?uQpf5Ng3lExFtkXpauwzCiahRphWuq8ADXUAl+Ys4TealBFQ0grSC9WHVip4?=
 =?us-ascii?Q?42CwcoeFxYQM2BOj/tP20yCV/YooiOpL/ptOEbSbJgMXHJoqRjb9iMkdUkLl?=
 =?us-ascii?Q?9YfXU93B5B4Yj2gd+i/Mp0zsfemsksoQXPWFtfqSM7AD984ZCDm/BGxQgraU?=
 =?us-ascii?Q?VXVPmdzRgFhCqUQWJQ7TDXTiFfdJVC8efgAjbz6zEFQZf7lHDlyenpFxIOl6?=
 =?us-ascii?Q?I3mYrCsQ2cqcgTq0Fdbu3szpDyAUnrY=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bf7d6a-98db-4d12-2a33-08df2576a88f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:59:27.5646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kop8mlvm/cGQnHMTSokH/od+D1tV2nOxP1eRXGMT7LPh9CV6Q3KxCNl7wFMhgcw1QGS2L0qzcK+8szymnXUe7AdWXEia6hHKZ2PRtIaRgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB3118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 19:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247447

Version 1.15.0
(21 Sep 2026, from /branches/1.15.x)
https://svn.apache.org/repos/asf/subversion/tags/1.15.0

See the 1.15 release notes for a more verbose overview of the changes since
the 1.14 release:  https://subversion.apache.org/docs/release-notes/1.15.ht=
ml

License-Update: Update content due to Remove experimental move-tracking dev=
elopment. [1]

[1] https://github.com/apache/subversion/commit/d3c038eb5da2c56040193df8de1=
28bb896d7b642

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-fix-svn-revision-host-contamination.patch |  9 ++--
 .../subversion/subversion/parallel.patch      | 19 ++++---
 .../subversion/subversion/serfmacro.patch     | 12 +++--
 ...version_1.14.5.bb =3D> subversion_1.15.0.bb} | 53 ++++++++++++++++++-
 4 files changed, 74 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.14.5.bb =3D> subvers=
ion_1.15.0.bb} (61%)

diff --git a/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revis=
ion-host-contamination.patch b/meta/recipes-devtools/subversion/subversion/=
0001-fix-svn-revision-host-contamination.patch
index 9741a6499c..cfcf090ce3 100644
--- a/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-hos=
t-contamination.patch
+++ b/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-hos=
t-contamination.patch
@@ -1,4 +1,4 @@
-From 54b2cf44445820ea7c3250a25ed957a389aafbd6 Mon Sep 17 00:00:00 2001
+From d8f18b85e017f7fcfffaeb46cfbf6cc07ce1376c Mon Sep 17 00:00:00 2001
 From: Haixiao Yan <haixiao.yan.cn@windriver.com>
 Date: Thu, 28 May 2026 09:20:59 +0800
 Subject: [PATCH] build: do not run svnversion during install
@@ -23,10 +23,10 @@ Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.co=
m>
  1 file changed, 1 insertion(+), 4 deletions(-)
=20
 diff --git a/Makefile.in b/Makefile.in
-index 7f0a37dd9a9b..914c1c37790c 100644
+index bea3a35..92ca3a0 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -499,10 +499,7 @@ local-install: @INSTALL_RULES@
+@@ -500,10 +500,7 @@ local-install: @INSTALL_RULES@
  revision-install:
  	test -d $(DESTDIR)$(includedir)/subversion-1 || \
  	  $(MKDIR) $(DESTDIR)$(includedir)/subversion-1
@@ -38,6 +38,3 @@ index 7f0a37dd9a9b..914c1c37790c 100644
 =20
  install-static: @INSTALL_STATIC_RULES@
 =20
---=20
-2.53.0
-
diff --git a/meta/recipes-devtools/subversion/subversion/parallel.patch b/m=
eta/recipes-devtools/subversion/subversion/parallel.patch
index 1fee1523ee..ad0babe034 100644
--- a/meta/recipes-devtools/subversion/subversion/parallel.patch
+++ b/meta/recipes-devtools/subversion/subversion/parallel.patch
@@ -1,4 +1,8 @@
-Ensure that directories are created before files are compiled into them.
+From a0aad59e068b6ed852db38cf26c5d862ce0ec2ab Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 5 Mar 2026 11:51:30 +0000
+Subject: [PATCH] Ensure that directories are created before files are comp=
iled
+ into them.
=20
 This is a hacky workaround, upstream have been informed and a better
 solution proposed:
@@ -7,12 +11,15 @@ https://lists.apache.org/thread/nr0w8hcpr9my2gkys09kj89r=
lxgd84of
=20
 Upstream-Status: Inappropriate [discussion upstream]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Makefile.in | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
=20
-diff --git i/Makefile.in w/Makefile.in
-index 0fb9e39602..8bae2cc3d2 100644
---- i/Makefile.in
-+++ w/Makefile.in
-@@ -424,7 +424,9 @@ ECHO_N =3D @ECHO_N@
+diff --git a/Makefile.in b/Makefile.in
+index 983f3d1..bea3a35 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -419,7 +419,9 @@ ECHO_N =3D @ECHO_N@
 =20
  TESTS =3D $(TEST_PROGRAMS) @BDB_TEST_PROGRAMS@
 =20
diff --git a/meta/recipes-devtools/subversion/subversion/serfmacro.patch b/=
meta/recipes-devtools/subversion/subversion/serfmacro.patch
index 507de0f08b..b16a0c866f 100644
--- a/meta/recipes-devtools/subversion/subversion/serfmacro.patch
+++ b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
@@ -1,3 +1,8 @@
+From d8f21366d2b9bd72faf078099d4ba8146396ac59 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 7 Dec 2016 13:54:18 +0000
+Subject: [PATCH] subversion: Fix issues in LDFLAGS sed manipulation
+
 The existing sed expression can match expressions like
 --sysroot=3D/some/path/xxx-linux/ which clearly isn't intended and injects
 incorrect paths into LDFLAGS.
@@ -14,10 +19,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/build/ac-macros/serf.m4 b/build/ac-macros/serf.m4
-index 0a549b3..3a069ac 100644
+index 4637430..126eb74 100644
 --- a/build/ac-macros/serf.m4
 +++ b/build/ac-macros/serf.m4
-@@ -171,7 +171,7 @@ AC_DEFUN(SVN_SERF_PKG_CONFIG,
+@@ -185,7 +185,7 @@ AC_DEFUN(SVN_SERF_PKG_CONFIG,
            SVN_SERF_INCLUDES=3D[`$PKG_CONFIG $serf_pc_arg --cflags-only-I`=
]
            SVN_SERF_LIBS=3D[`$PKG_CONFIG $serf_pc_arg --libs-only-l`]
            dnl don't use --libs-only-L because then we might miss some opt=
ions
@@ -26,6 +31,3 @@ index 0a549b3..3a069ac 100644
            break
          else
            AC_MSG_RESULT([no])
---=20
-2.7.4
-
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta/r=
ecipes-devtools/subversion/subversion_1.15.0.bb
similarity index 61%
rename from meta/recipes-devtools/subversion/subversion_1.14.5.bb
rename to meta/recipes-devtools/subversion/subversion_1.15.0.bb
index f6a5b9950f..a70e1f813d 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.15.0.bb
@@ -1,9 +1,58 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade=
'.
+# The following is the difference between the old and the new license text=
.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -367,35 +367,6 @@
+#   *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+#   *  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# =20
+# -For the (modified) 'linenoise' library in tools/dev/svnmover/linenoise
+# -
+# -  Copyright (c) 2010-2014, Salvatore Sanfilippo <antirez at gmail dot c=
om>
+# -  Copyright (c) 2010-2013, Pieter Noordhuis <pcnoordhuis at gmail dot c=
om>
+# -
+# -  All rights reserved.
+# -
+# -  Redistribution and use in source and binary forms, with or without
+# -  modification, are permitted provided that the following conditions ar=
e met:
+# -
+# -  * Redistributions of source code must retain the above copyright noti=
ce,
+# -    this list of conditions and the following disclaimer.
+# -
+# -  * Redistributions in binary form must reproduce the above copyright n=
otice,
+# -    this list of conditions and the following disclaimer in the documen=
tation
+# -    and/or other materials provided with the distribution.
+# -
+# -  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# -  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+# -  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+# -  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRI=
GHT
+# -  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+# -  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMI=
TED
+# -  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, O=
R
+# -  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY O=
F
+# -  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+# -  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+# -  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# -
+#  For the (modified) LZ4 library files in subversion/libsvn_subr/lz4
+# =20
+#    LZ4 Library
+#=20
+#
+
 SUMMARY =3D "Subversion (svn) version control system client"
 HOMEPAGE =3D "http://subversion.apache.org"
 DESCRIPTION =3D "Subversion is an open source version control system."
 SECTION =3D "console/network"
 LICENSE =3D "Apache-2.0 AND MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6487ae7094d359fa90fb9c4096e52e2=
b"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd9c5b0e279cdb238d735af75554a390=
2"
=20
 DEPENDS =3D "apr-util serf sqlite3 file lz4 expat"
 DEPENDS:append:class-native =3D " file-replacement-native"
@@ -14,7 +63,7 @@ SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2=
 \
            file://0001-fix-svn-revision-host-contamination.patch \
            "
=20
-SRC_URI[sha256sum] =3D "e78a29e7766b8b7b354497d08f71a55641abc53675ce187558=
4781aae35644a1"
+SRC_URI[sha256sum] =3D "dfb7b1e5270c7def971ccbd5938b0c03b1b5bd60b6674a2d8a=
74a9560839fb8c"
=20
 inherit autotools pkgconfig gettext python3native
=20

