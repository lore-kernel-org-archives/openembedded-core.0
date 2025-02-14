Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D725AC02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 07:53:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web10.16530.1739519636004380882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 23:53:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=RvLXpZBf;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.21.76, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmS7i5t7b/e+Wf8X8670Pyx2nS2pXUbyyT4vbIY6BQIRNGzns3m22YPJCDUBDbcuL/9LZwt9x6VqN6FHbOgrJ9L4qPgMkFbGr2XDwsALBkmFa6Vk7fUtERN1ZZsNBaOKoGnwMlHmhs8HjpsQMfITpEJf59f7f6elM2YWpg+UM2eMdJsbM/vxly1DPxqBQtS2+vbBDqrm2ZG9jdFzCMVBLcIy+gLb7bHtQVLEg4p+1NVkp+d33LTuz8hE49ufxuuL+yZ7pvcJ6XH8KpSF/6gFD6yptdalGQk01RZx7QqY1/JseJc2tMgih3xsTiszWZJKFC9zQLUOSxaMuE4tIGsgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBNbQ1GUVbkTFNCNjQesTboldDXWzv9TwD9+QnZJCEg=;
 b=CFEsOWLWzgq0xafAlAUvLpSuj7QO19qecTsl7vdfj3WUczYLvbT7vfun6s7StB3eFns0yQ/N8mtwTk+pBZeU7DNbdd5Uj1CiC2OCVjUj7wvPAbnapiqsdX6Cs8vCYAQ3ovPrpFkguZzZodHCaD8jM/BkfRhuIn6KLorlAhbWknlJD55FaIZsD7YHI527OlBX5fA0bXxTHPhz+fHMO/kpnG6teXw/CyVKLe6GJOs4dkEOn3QrDTss+e4xXGlORx6V7aSSpyCyg8NIrI8Lx+8TKs9cJsluwBNRkyX8Z5rlO99O+V3HxTbjTo24HlAD5kdEm8Ux4Y9+DFk7nXolCoVLrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBNbQ1GUVbkTFNCNjQesTboldDXWzv9TwD9+QnZJCEg=;
 b=RvLXpZBfFBI1pu2+0sdSAg7LPhs+rPuA9gvkMoLHA5pFRgkME4iXCJ22v5hH+Z5tOYgbLyKbh1Jb40YU+qyd/+hcYQ5B8IAncTRU3JNnc5mEPpymG/+CdCtYEESdoSn9s54B7iaWNcMHaGwH6xCGyQeTVuKOs7L+Q0eI8ski3x0=
Received: from AS8P189CA0038.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::13)
 by PA4PR06MB7293.eurprd06.prod.outlook.com (2603:10a6:102:fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 14 Feb
 2025 07:53:50 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:458:cafe::8e) by AS8P189CA0038.outlook.office365.com
 (2603:10a6:20b:458::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Fri,
 14 Feb 2025 07:53:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Fri, 14 Feb 2025 07:53:50 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 14 Feb 2025 08:53:50 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	bsp-development.geo@leica-geosystems.com,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [OE-core][scarthgap][PATCH v1] ppp: Revert lock path to /var/lock
Date: Fri, 14 Feb 2025 08:53:48 +0100
Message-ID: <20250214075348.3834651-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 14 Feb 2025 07:53:50.0117 (UTC) FILETIME=[9592D550:01DB7EB5]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9B:EE_|PA4PR06MB7293:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eba51ad3-4301-4d1c-2550-08dd4cccb82e
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?k0nwq2k5WpvZ5DQfzzQZKCKRplOy5q+Ppd3XsT83fLkDzy+P43LXpUXWR6hn?=
 =?us-ascii?Q?352aQyIkd5qUfhyUzk/yKFExru1zYA9CZFhXW94wuGXMcPMOE5oq6anX5R+4?=
 =?us-ascii?Q?Arbotl/pkq30Y9XiK05Sj3+stMhIbJN7JerheOEn6b0ypKu5bIXRROWAC3A/?=
 =?us-ascii?Q?lT2tJfV/YV4+jDZhFjE52t2Co3F+6GN7SOw2780p2/9sXt7NXsxRo+TvFgvj?=
 =?us-ascii?Q?cJ0+/JiU3jJM7DcGK9AQKuOUfwdfo8w0TldI0AQvNlIJ3LiApeuGOGJTBtyU?=
 =?us-ascii?Q?Tmb8dFJLjZMMtc1sZCnfenMm2AZ7XsvOYxYtqNuw47pJ0VQn4wCzce9ir0bL?=
 =?us-ascii?Q?0JTg1Sq7NH7UnJXhUGr79SO6O4OtXVizavVk64kEHj6PNEvfYuHqnXVnWJpR?=
 =?us-ascii?Q?Cn5WkK31FRIF3Zud9rPBCl1ghe0AHZWx187OfqPmTv3kQkZoi/pA7ctaCIc4?=
 =?us-ascii?Q?hLSJifV4URpIWJ7XH7FM2FE1y7vW6d/XjOgEKGUoAcrtGXynL1RG6tmFw1Jr?=
 =?us-ascii?Q?RJ6Wz0ifIyxo3AqmOPL5Wk5g8kSkzfMFi9B9jog2uUboAHPWwO2JbJ/vPbwX?=
 =?us-ascii?Q?ag/ZRgkp++qnpTHk1PKYTTZFRfWE7hSjSitONPo3Kxh14Wx3hMrLhxn1A2qk?=
 =?us-ascii?Q?R/7ojavec3l1IOAaE475MnMu0hsroUsa7R32bFHGR4efnwLoOL+X/4x1e6sL?=
 =?us-ascii?Q?pBaqieGCOhq1bMpM6si6ggM/YISzNY8ZsMo9Of9WaTd6qCnIWW21H+SX85dB?=
 =?us-ascii?Q?SKRBd1Nfhpr2R64TvX8eh+FLYUj0salqfFMqXV1Z7WupUSVOvW5nOXJYUvAV?=
 =?us-ascii?Q?x74swOde+W9dKN4J8eeaATc4BKCyVjc+NU3T21t9exx94TvFhJteha/KYRV/?=
 =?us-ascii?Q?3rDkx5cAbIUCdV3p6/k+HQAkM4PZBZ+BKQUAk3eP+Rrk+valuBFbXi5+ha7Q?=
 =?us-ascii?Q?TjkeopkKcVFHl0GL6obF98P4p8cfY8q+V2z+inymJ9Z1+c4YBCdO8Ez1S3Mc?=
 =?us-ascii?Q?wh3GKEtymo6ZxLYPVcgh9HPbH11aE1oM2btHQTTJUSS4qvvWfcfJCJ0sT/Do?=
 =?us-ascii?Q?tqgZGVEN+8RaAMTZ5itaiWAapAqv+6h6Jai4IWhTNtMbvzb+5B31B9ZncNN3?=
 =?us-ascii?Q?+aJOMXdp3hR1X9ZCcyNuoEMnctkyCmZ8f6mINurnSVi05afEmzZYXDzSoHwH?=
 =?us-ascii?Q?hoHoeHuM++SU4n4P9FMgrsYDo3Ebrfkq7BEpeo4doIjGwp+YC3RYJovdFRml?=
 =?us-ascii?Q?aZmg+z9EL4cJ1TWbwP+GH6EqWCNBVPGN4jZqX176wHaR08dHRJxlVIhgJQ0/?=
 =?us-ascii?Q?tWNyh4STnpk1BzsJgWye/4rVgZNMY7d6OB4jpep9nwLXx7rgrs4Dsd59Uaaw?=
 =?us-ascii?Q?izRI+BEp/Jwa7GmsAVVrARqhitVlTOXjYcJuQ0V29EsaNWNkq+eE0aEy8Ois?=
 =?us-ascii?Q?eDZG2Xq+7cqXL2WK6mwRvxnPPuYBtXnM?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:53:50.3237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eba51ad3-4301-4d1c-2550-08dd4cccb82e
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB7293
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 07:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211376

ppp version 2.5.0 fails to run properly if an expected /run/pppd/lock
directory does not exist, which is not usually created in a yocto
built OS.

Backport the patch from upstream version 2.5.1 that fixes the issue by
reverting back to /var/lock.

The related github issue upstream was:
"lock directory moved in ppp-2.5.0 #419" [1]

Link: https://github.com/ppp-project/ppp/issues/419
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 ...001-Revert-lock-path-to-var-lock-435.patch | 63 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.5.0.bb    |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path=
-to-var-lock-435.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path-to-var=
-lock-435.patch b/meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path-t=
o-var-lock-435.patch
new file mode 100644
index 0000000000..573eb413b0
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path-to-var-lock-4=
35.patch
@@ -0,0 +1,63 @@
+From 99cbf5e269994482edaf64624be8b1c806f9587c Mon Sep 17 00:00:00 2001
+From: Dominique Martinet <asmadeus@codewreck.org>
+Date: Tue, 10 Oct 2023 10:05:50 +0900
+Subject: [PATCH] Revert lock path to /var/lock (#435)
+
+lock dir changed on linux from /var/lock to /run/pppd/lock with
+pppd-2.5.0, which makes pppd fail to start if the distribution does not
+pre-create the directory.
+
+This reverts it back to /var/lock.
+
+The paths for other OS should be identical as LOCALSTATEDIR should be
+/var, but also revert them back as well just in case.
+Since the variable is no longer used remove it from makefiles.
+
+Fixes: 66a8c74c3f73 ("Let ./configure control the paths for pppd")
+Fixes: #419
+
+Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Co-authored-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+
+Upstream-Status: Backport [https://github.com/ppp-project/ppp/commit/99cbf=
5e269994482edaf64624be8b1c806f9587c]
+---
+ pppd/Makefile.am | 2 +-
+ pppd/pathnames.h | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/pppd/Makefile.am b/pppd/Makefile.am
+index e5bedf2..7cb3005 100644
+--- a/pppd/Makefile.am
++++ b/pppd/Makefile.am
+@@ -83,7 +83,7 @@ pppd_SOURCES =3D \
+     upap.c \
+     utils.c
+=20
+-pppd_CPPFLAGS =3D -DSYSCONFDIR=3D\"${sysconfdir}\" -DLOCALSTATEDIR=3D\"${=
localstatedir}\" -DPPPD_RUNTIME_DIR=3D'"@PPPD_RUNTIME_DIR@"' -DPPPD_LOGFILE=
_DIR=3D'"@PPPD_LOGFILE_DIR@"'
++pppd_CPPFLAGS =3D -DSYSCONFDIR=3D\"${sysconfdir}\" -DPPPD_RUNTIME_DIR=3D'=
"@PPPD_RUNTIME_DIR@"' -DPPPD_LOGFILE_DIR=3D'"@PPPD_LOGFILE_DIR@"'
+ pppd_LDFLAGS =3D
+ pppd_LIBS =3D
+=20
+diff --git a/pppd/pathnames.h b/pppd/pathnames.h
+index de2fb68..12609a9 100644
+--- a/pppd/pathnames.h
++++ b/pppd/pathnames.h
+@@ -120,12 +120,12 @@
+ #define PPP_PATH_PPPDB          PPP_PATH_VARRUN  "/pppd2.tdb"
+=20
+ #ifdef __linux__
+-#define PPP_PATH_LOCKDIR        PPP_PATH_VARRUN  "/lock"
++#define PPP_PATH_LOCKDIR        "/var/lock"
+ #else
+ #ifdef SVR4
+-#define PPP_PATH_LOCKDIR        LOCALSTATEDIR "/spool/locks"
++#define PPP_PATH_LOCKDIR        "/var/spool/locks"
+ #else
+-#define PPP_PATH_LOCKDIR        LOCALSTATEDIR "/spool/lock"
++#define PPP_PATH_LOCKDIR        "/var/spool/lock"
+ #endif
+ #endif
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb b/meta/recipes-conn=
ectivity/ppp/ppp_2.5.0.bb
index 5f0c75de83..badf22db97 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/${BP}.=
tar.gz \
            file://ppp_on_boot \
            file://provider \
            file://ppp@.service \
+           file://0001-Revert-lock-path-to-var-lock-435.patch \
            "
=20
 SRC_URI[sha256sum] =3D "5cae0e8075f8a1755f16ca290eb44e6b3545d3f292af4da65e=
cffe897de636ff"
--=20
2.34.1


