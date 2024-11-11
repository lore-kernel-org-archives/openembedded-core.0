Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D1BE6781E
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 08:35:58 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.55])
 by mx.groups.io with SMTP id smtpd.web11.54967.1731314148143275923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 00:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=PlgwEVBN;
 spf=pass (domain: axis.com, ip: 40.107.241.55, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZIUWhwMEkzMeKpu8Oyavq5KStCLaoMdEv8LNp+lXMMeSboiOpfJO/IpG6j5MNbSUybynZtY8L8xXNZ/b8iwMqBpeUmffjkP4DCbOc7uXyoBMt4w30zO24L/CbBM5ItjVMwX2RXIJJJ9EGluowkGKPsNKYhOdAbkQl/0p433bds7DE8Q5NyU7NJe6dFQwnOgtsxyZ3kS/0QMhq65oc4k8D7Q5sGlucHVrz+wv7X+7xTxNPWlNI/BRz8iWmkSZ2wylx6UXnYswsbNyA0vubMbTIblP2Mt8IeylhTPrAr5CYnQdNmnULNaOXNNZAjq4n5mQxqiYlMGWGcnuCU9xmG5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yH1HqjvXuHVtsoJC+KyhPbnAzkaZfMYvQj2H8r1X6yo=;
 b=qTAQnj1DIkiobgEJfqmvAhwfYkYe/FkoxdyNJufx/Ss+JNVPjrRbVeaiZXccFFOZdHbnfNIa04Pu50Te0wxDYYO648TbWPnLSxEOEo4OXzPyiKecH6yfC87g9BeQrNe+O/VXiYw0VuVLOH2ebux1mWAd+dKP/94AmXQL6PkcDa3YW9Abwj9vLBGkt6Xp6sMsjsGtE0Vm8tc80Jqu0o8EHYyNitnTKjnTYo3xbfU2tgxgmVOWujPanS3/q6BLx7z4/qkV5IeQE2Hfx6b3E9rYi74bVmGfv8vtsD+wU4EI+LnuGrSLsypMAfsSlWaEH7ZS8XwWNX3TphQTer8PhW/hTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yH1HqjvXuHVtsoJC+KyhPbnAzkaZfMYvQj2H8r1X6yo=;
 b=PlgwEVBNPnx9hqYA5WXjIkNaeV4u6gFlmujB/9JLWaenj9Kmf72ZIzFJ165PEKuiOlJ7FAXSrZ7dSvaNqUbXpNcoDzuaE5hH5Uq3WRPrMaRiyHOB8nadA6b+lqFeeUt82VkB6HmKWsmrBz/D/4BFncEY4IxjeJBOMKlstCzARaI=
Received: from AM9P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::25)
 by PAWPR02MB9807.eurprd02.prod.outlook.com (2603:10a6:102:2f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 08:35:43 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:21c:cafe::16) by AM9P250CA0020.outlook.office365.com
 (2603:10a6:20b:21c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Mon, 11 Nov 2024 08:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 08:35:43 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 09:35:41 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 11 Nov 2024 09:35:41 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7FFED830
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 09:35:41 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [RFC PATCH 5/5] automake: Remove patch that changes path to test-driver
Date: Mon, 11 Nov 2024 09:35:41 +0100
Message-ID: <20241111083541.291594-6-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241111083541.291594-1-olani@axis.com>
References: <20241111083541.291594-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|PAWPR02MB9807:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a46d25-b9c2-4a12-ebec-08dd022bd4ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WKo0IDp75SR34HXq8IifP1SdHfNH2nGCacm5Za4BQOM/ibmFFCBWE8SW1sjR?=
 =?us-ascii?Q?uDx2oWzOWQUNZuxgVsE8p2TNSFts3ZewaiQepmYff3MsjpzOQL8HIbSNLzFB?=
 =?us-ascii?Q?XbYPoOy29RQVTQETtS0KouXOXqVrZhJygpHlCfHHYVVd40zQ4rGiHshvgulk?=
 =?us-ascii?Q?ouwsSRfnKsRWU5i8QRzZ/dBGnACUZPhQ0+l+zG1lWRlKpjP16EkOvxNs+xGW?=
 =?us-ascii?Q?akoKIlVwTR/BfhDHGyRcxbSJr2/UkMKzfcdFDUJfsl+7uNU7vfsGnAFS7hmd?=
 =?us-ascii?Q?0uKFC5Twrq0IB4GH+2o7GH5XwDp1DyXQrMaRa8lCfnSBTf+xvEUUTsj7wyBW?=
 =?us-ascii?Q?Pv5QQHNeBahcJ60KGWewIRcNtT7JJQ19ZNwvFg4sEz6RozMzK5+h51e54zMB?=
 =?us-ascii?Q?0Pbgs4H/IF9Q6VoY8hkvnvm7rD9DjofGr0c6JYUkeyVPtHNdBy/VxDQiVPOG?=
 =?us-ascii?Q?RTboUoDQNtfPbC1J1VvSix+A7K1ySoXnIwshvw6n4MTQnF9Q8LnZTi5pvuBt?=
 =?us-ascii?Q?jnxdnTK4UCWkxooUqFXEKbd8nhg8sH0URk4IdT6BgrH5LSXgrV/1z1EqlPZH?=
 =?us-ascii?Q?MspccTSfF8A+TaaaI//yvohDwA9K3CfwnPVyhQsWQFm2sUYix7rWra4a/c8h?=
 =?us-ascii?Q?gufHPC0wrmQaXVA5rZ31gg6jd1upCS4s0pMS1T2jbKKj4DKqbQZhUvvid0AH?=
 =?us-ascii?Q?knlXArPS84GWls6VrIfh0a3VvdQCknMsx4mGw5/40rt6CIx8hWvSamgT4qSM?=
 =?us-ascii?Q?PNN5jDgLPHSRFGzyIJf13RornD8eoRY6EPcObAs2Vjvt+ZXI6NptRZMJOpl/?=
 =?us-ascii?Q?Nn6gB1st1G7SrQf9RQGkxEzmJN5tXY62jVCV7WvYtqJMSl5AEW+t7j3rcv2g?=
 =?us-ascii?Q?hhnImt7i1yiP5nOaPpFoVA8o4M3XW9NnQVQlc5tawPD/qxM/xmvpt/6Cya73?=
 =?us-ascii?Q?3l8O8B88IPCg5oqvsA4B7dNxHq/2ft7KxiA+JrbyuthBW6nEYZli+ov3rzP/?=
 =?us-ascii?Q?WVK8XWhyN/TTzOGoqOsY0RcA3DhE9Kmp8h4DrDsBbVEOElfhwaXLKhi6GHnD?=
 =?us-ascii?Q?hbUk+a1v6Ir5fWKH7Lm+QlnLRkzzGtOVHQSSg2dEla0KidP/6wyOV2f0JA4L?=
 =?us-ascii?Q?nhixE55PVDPnhoSAOYlpDIy7FWjDVWKZAz1e8inw+ZolZcX0KviQ8GiTlG4C?=
 =?us-ascii?Q?rZ8JlC2MZW4g3kBotFwHoG9hEu2fEQFeCs0vsElEVF4uUcRczkj0Awrw1CQu?=
 =?us-ascii?Q?HhndqFBmatC04tLAyrC83Qq6lyJQasBU/MgdQ9BJZRi+cjXs7cSmGN9zpHZ2?=
 =?us-ascii?Q?jeglFOQUvdX9AskOM+ul5iH6CLz/2jPJhv260pvTVxj7+pE36wl2/eCB4fO4?=
 =?us-ascii?Q?Pc24Yoz3mbmicH5Pd+vYsSWM2WLasfSB5cLKAxyrmgNfstwRkA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 08:35:43.1248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a46d25-b9c2-4a12-ebec-08dd022bd4ae
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9807
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206935

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
--=20
2.39.5


