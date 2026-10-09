Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434D9CA6012
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 09:05:46 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3573.1791536739902175165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 02:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=CVqrTHTv;
 spf=pass (domain: est.tech, ip: 52.101.70.38, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sS1mf0okbP9/xfADLFdd15fShqT22LGSAOR1jqClA/gJKlKxdwpgtFvJIfp0rKSCTfqH9WC/FJmvFqecn7s9n3+IPgvqDXauscnc8bV9OXUk53Jl3X0e6BkheCfQZs+Oe1MwKwdlRn8PpbQzRcQqOWuOH8ugYzHQR4d/pXBx6+1pcK0Qf+oTcGUlOfyyTJLAdeH1J7itC0bQ4rBwd9lsgIfUB3PXrCkIyXsEOAwPmOPsTQv5S30+Qn44MpnaSfNGCuwYdBVqzTKgUQaqtJ42pv4HOXTfq9adTItnjBNfiWFYQDHIdPOpoL8HhBAaWHaMviNLVZO1CEs9oy1AD7lQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brp5Fjw2K29Jc83ZwovaKrglFlTcEXR70Nu2CMANaVE=;
 b=hdM50lC5hptArj2uXSsYZyUK5ugjI1XQK1Xtkpwh8hRQfSXaIbCu994MS30aAL9ta27fI4y2q4PDbq/YBHahVXAAuXEVBy3vXT+E1SRXZiD3HSgPvszriE5pgPvhYpHCgEyj9bMPtqCgDqcLgDF44vX2lzSkZcXtRCqq1cMBZN/OVllBEbzCdWWcJzp0AOclecnNjDIfQ+4Itta5rbj4TiVNLpfMCXiVNuwYLNP3zR3QPuyEL8QlDjIbFzuFGDk+85vRlX7IcuSFLIqKf3C9hOhEbl9yu8hpnlolcpc3eKbBqAg9EiZ7KkLrmHmZDDrAsmMxg9GF/UKGntRMpscffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brp5Fjw2K29Jc83ZwovaKrglFlTcEXR70Nu2CMANaVE=;
 b=CVqrTHTvvFe6/OUjVYo+2t13FTB2nI+eq0pzGCP8/3OZ3wXYC0GtgHB5ACssSfD5jVZR9H3QIPR8PUHNA/Vo4KZ0LKs0xtPYFEinSy1Vg6gNF6SWb2Pi4p+sxAn6lWovqEfZoLrgmxKWynEV3zy50FRPd0t1A4qoUANVle+bKBCczxrSp9hAGDWJcNp5hQmP3V9dqam6OQG9/5v+wtmvOXLLkWO4SLVKlZ4NXgwShbsPkQ5Rfq5CsGHMN7APwi5tOwhvI598QvCt5jsF8+KGFyBhaMLWLh6LOLaGySQkAFZvTnCZw3af2t0bpXJrF1127PvPkfuLURenEEkaRwLM+A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AMBP189MB620134.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:818::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 09:05:36 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 09:05:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] subversion: upgrade 1.14.5 -> 1.15.0
Date: Fri,  9 Oct 2026 11:05:32 +0200
Message-ID: <20261009090532.38244-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008195917.22382-6-jaipaul.cheernam@est.tech>
References: <20261008195917.22382-6-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::22) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AMBP189MB620134:EE_
X-MS-Office365-Filtering-Correlation-Id: 832bd117-f17f-4f43-05c9-08df25e47b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|260925021911599003|56012099006|11063799006|260925021311599003|260925022911599003|18002099003|10067099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	ShgHV8d4tq9nCf9tK5ythRKbnZ37uLfRNH0BKFCi0rR1odrn1fSaDS+bMhrOyhNXshR/AnMDCbmu9gAgep5nApOLodLelBMlhqg1Sr62qZzGrXd45TMg0rGaSudfh2ZafROmadO12lbtR5XW5uHIN4supxEu5pnecO4lHqwXkgshhqIKUtZvuC1zcFLOfIygvdYkJ0Dy5Bdk8bxgDUOBBnCw02Ix7OYE9DwY3gYL9A/qLNNtMJbkHiYI5/VKF8SkgCt9qX9cgpBbkTHafX2bJnLJkpNUv7ijglAiQFGTBcft3+Ie4Rrw/aoU9Hwp5Gp5emmgDu8FLGGZyV6fA96u9o0cAGLHbAQINZ7E+KrQZXLtno8ib2VU2kKG+4Ty07DVLP+9Q6aLiVli5DVLLRjAsQFSRxgr2KAnWWtQZE2kI9Kti0hNUYw7mBe+/AiNF5CiJ5Ctmwzm3Yz4j/HbTpcoyOpDiVfPosoxNh/UR9uXyRqtKwQME8zG0sY9Bou4Hwmzrq6+uinvWn4h1rnggtiQPZlahKWbGdgR/ugzooJp9Eo81xUTTMeQccrVd8dZC2BmB3UrDx08wAwbSdEsDthqFuC3v2eaEG67jT2+sjd2UQA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(260925021911599003)(56012099006)(11063799006)(260925021311599003)(260925022911599003)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yzxRthUUfE9X50DGMncJU1coODHFJEDWheV/1oc7J4aqXEtKuyahOs5NuabL?=
 =?us-ascii?Q?tBfNIx7awvx0DL4Dj46In2dLzYc+jWTEwAeGqlHnpkyYMQy6F1bI8A+ANAR4?=
 =?us-ascii?Q?vwfjc7ObQODaD0qiuaqK+SR9R4pqnVS/4h/iphlNVqaTUy81+HRGem9VXmM3?=
 =?us-ascii?Q?zyF9q1GwF/rJkhjf9nTTNWgDEfemc8UJeAzDlN79qwE4EmIpf7ZxJlIAXUfw?=
 =?us-ascii?Q?X5Hgi6sa6AMTRThh17yyzKG7eQncTf79X7B71ELd27fXdUnhG8bzud+mZtT4?=
 =?us-ascii?Q?JVNW5sQs6EtxPwYMbbN4sqzXgRLh+moyc34/pWNMe016I2p3ESpoAxhBW0TZ?=
 =?us-ascii?Q?FY+Ry1xq0sRoUDuti0rT9BcuuaVvQQTXDiY2XHizaEMlkKLX1nBPiGpRq1p0?=
 =?us-ascii?Q?uzlkWVjMBeyFDqYuyteUsefwIeYIXyFpR7hdp9IjfomzxzFq5qCz73MPEiJP?=
 =?us-ascii?Q?uKpWH8F8w+UOt+XK363SwXkjPKDh+vUI6cIE8bjVzUeWxLsjk0rEZkVyOZJb?=
 =?us-ascii?Q?T6d41fP5lOao/xLCMU0rGXowFqW3tgAZX4dAGPubBo5iqi8UasJaoC0+OTiS?=
 =?us-ascii?Q?qgDcZA1YPBiEl/tyCVACJQPF2prdccNp1ipVj01IufkckbiHHL8qUoP6Skpe?=
 =?us-ascii?Q?tFIjCW77bzPrO3c5Rdz9/m11dBEK41xXweyjMot8dIw1CPhteBVZy9DNgIU7?=
 =?us-ascii?Q?6v0QkKa49mFFTzaMk2rhjhFzjALCeiyZhTltQVnJ02wV5S7A4GILLttqZA+8?=
 =?us-ascii?Q?vbic6Yv4+KRoRL9Abq0q8s1RRX+TkOKuCG8ayIH0ENbfLxo6cFNNUvgrYqub?=
 =?us-ascii?Q?vL538UCuYQnpTlMoOb1Bie1veC6VDoMu1TLkyHTD8Dp3PfXQrl4dSwFHAnCs?=
 =?us-ascii?Q?ZeC8zb5y944OiJHc9Ao5l3DsAh/Htw5L2CCjP8KG+RlyfCE0lRvwEOrXU0rE?=
 =?us-ascii?Q?pdPIjEE559wS72ijqF07a//RfaYP6AYtM+7KsPSh71nvB1Qw5bULlAlbp4ef?=
 =?us-ascii?Q?qE9ZNUEy3KwnOcLFZPbBppBMMvNscdE9GP2bWPBIhtqBrHHxh7K4A4RVPJrq?=
 =?us-ascii?Q?DY/fWhULJSrl8NRgin4XbcJCXDK1vGvnHXT5ScEnYuIKXW5go78synp5J0Xn?=
 =?us-ascii?Q?9u6sNbC8hONVylH6wlqefnwb4hPLEApq0kaOSIiKnZTkYk78QHqIx14nYFSk?=
 =?us-ascii?Q?9+myMRf4jVQ7gU3m3nQ9pwwthUZSfEyvTQQIJN1EPOm6fLZ48w9JAKA84v1k?=
 =?us-ascii?Q?leCaeCzRjscGXX/AV08IxcBuRQs5VtrHItUBdsugTMYseMEFM67rR5ksf/NY?=
 =?us-ascii?Q?1SzqVI6CB2W06aFDadw/ZSvBKD70eRLEp7Oe1QbBlTFftAKdBdW5sFPnCGuz?=
 =?us-ascii?Q?9qM4hEttPbCD+r6oHNrwIxaS0UCTzO4LNDS2E0w0yiWfd+EpgKzVajbi4/Jf?=
 =?us-ascii?Q?yzP1soChKY0xpkFwNwcuNpRD8A3TgRSp0khVyNqzQAmOb+xFfbPwxiWQhamW?=
 =?us-ascii?Q?lUckZ5yDBLSy/7iRqHVmgcBzcQEYIXUtYDIQ0fJb70CbapBV/bQk335GLGSk?=
 =?us-ascii?Q?f902Uikjh+ayPCpZ3BaeUcIl99V/DzYJrEJp+S8ENGlJCtx2kgBP8cRGkwN8?=
 =?us-ascii?Q?9D2O7mhWJ3qFnzY6+WVYp85l4cbBPCoOSFE+oJTB8K0WF9vxawICtHCgmar8?=
 =?us-ascii?Q?vuGhm4sHENE2miW7CuEpDl9nYh6XOA4jI/fevhBpb9BR2qBGyuUkP7hx1567?=
 =?us-ascii?Q?XitM3X34yg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 832bd117-f17f-4f43-05c9-08df25e47b05
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 09:05:35.8478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSk3wMDbxNeaVD5vVQ/f3+J686WiuaKjctP+sr//7QlfuYFn0h5eecVVj1pXQffLea+iPVZexcZYC2ui0M9l12Nf9Jrj3N9ny0idbKdJa9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB620134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 09:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247470

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
Changes since v1:
  - Remove License FIXME text from AUH

 ...-fix-svn-revision-host-contamination.patch |  9 +++------
 .../subversion/subversion/parallel.patch      | 19 +++++++++++++------
 .../subversion/subversion/serfmacro.patch     | 12 +++++++-----
 ...version_1.14.5.bb =3D> subversion_1.15.0.bb} |  4 ++--
 4 files changed, 25 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.14.5.bb =3D> subvers=
ion_1.15.0.bb} (95%)

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
similarity index 95%
rename from meta/recipes-devtools/subversion/subversion_1.14.5.bb
rename to meta/recipes-devtools/subversion/subversion_1.15.0.bb
index f6a5b9950f..ec053f6b61 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.15.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://subversion.apache.org"
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
@@ -14,7 +14,7 @@ SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2=
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

