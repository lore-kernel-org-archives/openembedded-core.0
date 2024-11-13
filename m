Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8027D462B8
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:46:01 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.80])
 by mx.groups.io with SMTP id smtpd.web11.13054.1731509153618312707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 06:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=HDnyW+tp;
 spf=pass (domain: axis.com, ip: 40.107.103.80, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byB+lclrfF/KqP5TJk1ysJr7JlSGPgB1upcSnCraRYKlGjqlJYHAy6EIlaKF0MsS0pOCbj4k92oUv7U0wUGBFclIhdRmcBXQ6LgsG1iXVSlbPg/m1jMP8fcs6hQMkuTC0apdxQj8nnW/gyHnPa+9S/aAifVu2XtiNlYUoO+r7d/wvV91D7Vo1SBhdvg7ag86Ha/r1soMGfFq/QbpqBiVJDzDv35WIyFDLVqhcgydn0lJxCsS0KOSKmKs/9+FGlpATCBsTgIyMXlHZCYD6D5RCzHMQQ2cMv343RYuCtugB/3lwQ7fgbTde4dJQLVhyJXt/GdlTZgOGRlCrH7E4dNsgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rd6/iotipbnf8nv6NAmGL4qQZsWSOK7sZvlEIUhpNI=;
 b=Y/JkciY9mgwCAFhHgtb3d6LkYvzm6UfNbhpL8hJHN70OC5/ynx+ncLZt4ao4XbjL3cZUdaY/GaM/lnB/mFVUq1Y3bjmvMgcB3inOhkcFZvhpkHRf4Le1vEg3zvpouMXrPG7r44Q4FqmiuNEo0Y618MIHI1XvBSLCLufEyhZl/7laKXZCttYi179dzyctDRM46bZxfvaqYVNuOGApCxZjVFTUDQ8NTGSZ1MDv+Ve34c4jzNqEShWHvRF9zi5QpTo48vVaUGJDaAQ45i83z39X4hdT02gpdZQdRaxH/d6PZDT45iUW91P+xXKxgLLxkUNLYLHrxFoIITLM8cI5Tu1L5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rd6/iotipbnf8nv6NAmGL4qQZsWSOK7sZvlEIUhpNI=;
 b=HDnyW+tpV8unN57wyKOo+Asy6OcSsBMY/9PvUmrWuua3DKhh6byc/TFW8THsQPWiPutZSl7CrcHWj5y4G/qN9P8j5PqqiiQobGdSKhQI+l+qhWxKsGbFHOHuUKFoQKmfBOrP/HoxQPfvHMFD16syaPqwZIbL8zb8Bpb6KAgRCLo=
Received: from DUZPR01CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::10) by DB4PR02MB8438.eurprd02.prod.outlook.com
 (2603:10a6:10:37a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 14:45:49 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::36) by DUZPR01CA0034.outlook.office365.com
 (2603:10a6:10:468::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Wed, 13 Nov 2024 14:45:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 14:45:49 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:45:48 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:45:47 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 15:45:47 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E2A8E641
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:45:47 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 6/6] automake: Remove patch that changes path to test-driver
Date: Wed, 13 Nov 2024 15:45:47 +0100
Message-ID: <20241113144547.3121036-7-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241113144547.3121036-1-olani@axis.com>
References: <20241113144547.3121036-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|DB4PR02MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 88cba72b-ae70-4e66-0574-08dd03f1dd8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Pps5mSy7NvErEq/jZywRNGY3OauBHO/i47aghIXrWjzfT7oc8ZH7LwvD0uTg?=
 =?us-ascii?Q?qNKTCI5WFWNBRjJlY7pGRatSRpvOdoxGITueuD6bo/3kaUe2WXW/rRQJpAU1?=
 =?us-ascii?Q?wubMbY4/HD82oWjr9yBkWFyU6fzTTXCLTH7fYlNR9jxzp5gngucaDY2iMV1K?=
 =?us-ascii?Q?xHHLvD9SwfHYCRRAq1rGF5+6b/dIQ4AMSa7Qwq9YpCghODdRDhWxr7C3y8yD?=
 =?us-ascii?Q?LCIwtZaTJvFvMw/DUhMULucMMTDgN7rTDimTWrUVcuQTO8naJJ1mR7hwVEGN?=
 =?us-ascii?Q?Q57FzFPjb5KLBWx7Kgj2vCLWkiO8M8eVhStA/JYXqZnGl6Y5aRpcTu57FZ5E?=
 =?us-ascii?Q?bHIIO44tYq4awd8JjZY+q7v3TMmH/1EJSg+3TCtC4MSRY7TQCAVdpjtJCb1N?=
 =?us-ascii?Q?CM6crDckcMS4p7LwkMlZqkl2b8TxktrXT2aj/hYh8N/eJBz5+xJE7gjLC/C9?=
 =?us-ascii?Q?YTiKvebxt34pOhe6HGPOgtvM/cIMgyIDOFa0mB5fDlanuwyAoxFp209lBkEu?=
 =?us-ascii?Q?eSsJVazsVF80+LMmTMKuz+pEPG5Dla8xQ8DqbcujlJeDquNcbcjKb6ShgNJK?=
 =?us-ascii?Q?AKkxEBOUjUrT2l+K4eZXg6Hq14/GJtovTUBOAZfB+/ypddlBO8OYnBNb6UgU?=
 =?us-ascii?Q?hIP3QLq3qb5w+yn/3hravh0yy+1U6C4r1muXgVr2X7SH6Tl+0HLu4uEkciKT?=
 =?us-ascii?Q?Y24/KmxaQRFL3lC8z6v92JyG4qoMAmxgWsfiO43N4OSBRtamqzrFgb2YrAs1?=
 =?us-ascii?Q?xo8SR2/XNCFiiBGEn+2CtAADLjDnz3rcQQCficNFKzjFUyDE/FkyKS1SkajJ?=
 =?us-ascii?Q?SkRdDr/+sg8UlRC/iYkCcYMA94HQ5sIVYmgeuvECYXSKQr8mMymRZAAunRN3?=
 =?us-ascii?Q?/QeebiixNc3YWvXwYroAViQ4hKh19vZZiK4zhZCpsCDgzXF6Bc1SUcqUH3/N?=
 =?us-ascii?Q?sYLU8vec4OpdW8NTeiheKtpnfSnxCLYcqj8gwj58qyjZQAFkUUc7825qDmSt?=
 =?us-ascii?Q?OD3r6Fld4kQs/AkEn0yBGZZxjmqlX8rDTarDj69+U60fNVIEe8tERhul57qP?=
 =?us-ascii?Q?rQ4ei17mwAxojMN4TUr636LodbuhH/BnIEit/XPEO5zNsVDsF/y/CvEUGCj4?=
 =?us-ascii?Q?159X6puUn8zxqjyq40zfEtieA7kqamn5f1AYVt37tjdIeahodbWvEKK0h93D?=
 =?us-ascii?Q?w6u9w+k4GqTDNShHTeljdRROUBthTtz4C8qajP+qkHi1rvAgQUZQGYeFyMva?=
 =?us-ascii?Q?euI5VEf8BN6D9AfF7DM0D0x8vFYtz1AdsrtOativV18OASPkRMzGFo+3+5rV?=
 =?us-ascii?Q?ZsNGZ5cDtjjUSNR/LSr7SLyp+rKQYL2h+3Wr9CfkL616Umb4iuUbHKSLH4VW?=
 =?us-ascii?Q?np642N0pJpKxhe5RzWUlmfuEIPXeG0GiaSJxE8PI3VefQEx+bg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:45:49.4796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cba72b-ae70-4e66-0574-08dd03f1dd8c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8438
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 14:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207110

From: Ola x Nilsson <olani@axis.com>

The patch "Set relative to top_builddir path in Makefile to access"
sets the default path of `test-driver` to
`$(top_builddir)/$(config_aux_dir)` instead of the normal
`$(top_srcdir)/$(config_aux_dir)`.

This breaks `check test` for Automake projects in generated images,
and probably other places like SDKs.

A typical error would be

/bin/sh: ./build-aux/test-driver: No such file or directory

Removing the patch makes such checks complete successfully.

Fixes [YOCTO #15635]

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 ...top_builddir-path-in-Makefile-to-acc.patch | 50 -------------------
 .../automake/automake_1.17.bb                 |  1 -
 2 files changed, 51 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/0005-Set-relati=
ve-to-top_builddir-path-in-Makefile-to-acc.patch

diff --git a/meta/recipes-devtools/automake/automake/0005-Set-relative-to-t=
op_builddir-path-in-Makefile-to-acc.patch b/meta/recipes-devtools/automake/=
automake/0005-Set-relative-to-top_builddir-path-in-Makefile-to-acc.patch
deleted file mode 100644
index a5bad068a45..00000000000
--- a/meta/recipes-devtools/automake/automake/0005-Set-relative-to-top_buil=
ddir-path-in-Makefile-to-acc.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 4f576c10613b43cbbfcdf5a451d893faecd6fea9 Mon Sep 17 00:00:00 2001
-From: Adrian Calianu <adrian.calianu@enea.com>
-Date: Thu, 25 Feb 2016 16:08:04 +0100
-Subject: [PATCH 5/6] Set relative to top_builddir path in Makefile to acce=
ss
- test-driver
-
-Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
-Upstream-Status: Inappropriate [specific to oe-core target ptest installat=
ion]
-Bug-Report: http://debbugs.gnu.org/cgi/bugreport.cgi?bug=3D19042
----
- bin/automake.in | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/bin/automake.in b/bin/automake.in
-index 18626de..3aa8706 100644
---- a/bin/automake.in
-+++ b/bin/automake.in
-@@ -325,6 +325,9 @@ my $config_aux_dir_set_in_configure_ac =3D 0;
- # $AM_CONFIG_AUX_DIR is prefixed with $(top_srcdir), so it can be used
- # in Makefiles.
- my $am_config_aux_dir =3D '';
-+# Directory used at runtime like running test-driver that should not
-+# depend on $(top_srcdir)
-+my $am_config_rt_aux_dir =3D '';
-=20
- # Directory to search for AC_LIBSOURCE files, as set by AC_CONFIG_LIBOBJ_=
DIR
- # in configure.ac.
-@@ -4917,7 +4920,7 @@ sub handle_per_suffix_test
-     {
-       require_conf_file ("parallel-tests", FOREIGN, 'test-driver');
-       define_variable ("${pfx}LOG_DRIVER",
--                       "\$(SHELL) $am_config_aux_dir/test-driver",
-+                       "\$(SHELL) $am_config_rt_aux_dir/test-driver",
-                        INTERNAL);
-     }
-   my $driver =3D '$(' . $pfx . 'LOG_DRIVER)';
-@@ -7554,6 +7557,10 @@ sub locate_aux_dir ()
-   $am_config_aux_dir =3D
-     '$(top_srcdir)' . ($config_aux_dir eq '.' ? "" : "/$config_aux_dir");
-   $am_config_aux_dir =3D~ s,/*$,,;
-+
-+  $am_config_rt_aux_dir =3D
-+    '$(top_builddir)' . ($config_aux_dir eq '.' ? "" : "/$config_aux_dir"=
);
-+  $am_config_rt_aux_dir =3D~ s,/*$,,;
- }
-=20
-=20
---=20
-2.39.2
-
diff --git a/meta/recipes-devtools/automake/automake_1.17.bb b/meta/recipes=
-devtools/automake/automake_1.17.bb
index 27d8dfe1827..e22e51498bf 100644
--- a/meta/recipes-devtools/automake/automake_1.17.bb
+++ b/meta/recipes-devtools/automake/automake_1.17.bb
@@ -23,7 +23,6 @@ SRC_URI +=3D "\
            file://0002-automake-Update-for-python.m4-to-respect-libdir.pat=
ch \
            file://0003-build-fix-race-in-parallel-builds.patch \
            file://0004-Add-a-new-distro-feature-ptest.patch \
-           file://0005-Set-relative-to-top_builddir-path-in-Makefile-to-ac=
c.patch \
            file://0006-automake-Remove-delays-in-configure-scripts-using-a=
u.patch \
            "
=20

