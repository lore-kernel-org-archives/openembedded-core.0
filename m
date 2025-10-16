Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA954CCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 20:47:14 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.98])
 by mx.groups.io with SMTP id smtpd.web10.3504.1760604620428088753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 01:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=G2UsPX0b;
 spf=pass (domain: phytec.de, ip: 40.107.159.98, mailfrom: b.hahn@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYP1mn4J9wmf4Ia1LeGBx2DmZJog1JIuTf7DHZfRUAIBV+CTNI95BaKLNszMlKNsF7VJU/fEbqUs68pmmJy1eU4iKOGXZe3+Lmz6eX/jdOcrrAlCvMcd2ZBX42JPJeI03/hKr211EV5Qn2SEvCs6H9/YE/I+9MHaJ+bgh1bhwV2s0uMMJiWUXUqDQ9QBx5ZgnksXG+RJQ8ewwt5NZ7yoWUq1t0FNgu0U2FEsMSQ4348cHB3PrCCvtpWNc2W683mJprRca8Le8p1eOwqI7OOKy9p/kHWqx7QGkUnehHN7lVoE7WxTBBPdIAUWy7qt0WjDT8Ke5cvWVvsNeyUuDs0ZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2XEIEPEm5rnR9FgiEallzxhzkklruHEY3FB8Ltgid0=;
 b=gCRyK0z7LYsa9DvvWNrPVPMPpacu43C3SFeWq7x/fS6AGFo2hOh1T4BrQ/PaXYzhK+TekHUN8SfBl4FqD6SmGiCz7Rn/2JeN3/hUIV+84MeEQeldgAAyyD2OSQ/ryB95amKylh/18kdPMila2UEU4BJZMx5zJ8VCwT68nIcq/TMKRLSJLxw4tz5XcKecvcQw83/Sb5htgq+xMr/VE6F4f3gf5fbYFrRHU3iUKk/gCK4eXKwvHfXb2Xdrk40nygJAoINekQK4o+iev/8Rc7gPv+XkqkG9NNVrSJtB9qVlQL6o36SjZ3hthzNevD0vOb/TJ6UriKfoaB74gpXWYnEUmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2XEIEPEm5rnR9FgiEallzxhzkklruHEY3FB8Ltgid0=;
 b=G2UsPX0bAG+AGUZlvJwP/U0fKcaCaU8h2rMaCFNngpJf4EgjpOvcm5R8IBqZ2u2vOgsG7OAjwdBvbgoDVPBNJjknVQDZ923u7dTCd3JMC/En8NQyxWwrZo800tBvKyZbPH5aOk3x+uH83N+45adL7Qx2p0dVvKRdBKQI5jIs4I7zODUKKscusJu51/oI/rMCBxBff1PbZnI1T33WEa40nt93Ollugrh73CNyTDMD/37U0DUns7opM7Af5Sjam75eUOyHCil3qkc8CtqVmO3LHjWEZZ8z8orongQ0ZbsK4f7lM/0NtGt9CQTe5werfyWJzs5svbdyCf68ZyKH2gcE7g==
Received: from DU2PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:10:234::12)
 by AS8P195MB2096.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:56d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 08:35:23 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::89) by DU2PR04CA0037.outlook.office365.com
 (2603:10a6:10:234::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.12 via Frontend Transport; Thu,
 16 Oct 2025 08:35:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Thu, 16 Oct 2025 08:35:23 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 16 Oct
 2025 10:35:22 +0200
From: Benjamin Hahn <B.Hahn@phytec.de>
To: <openembedded-core@lists.openembedded.org>
CC: <clopez@igalia.com>, <richard.purdie@linuxfoundation.org>,
	<alex.kanavin@gmail.com>
Subject: [PATCH BACKPORT scarthgap] icu: Backport patch to fix build issues with long paths (>512 chars)
Date: Thu, 16 Oct 2025 10:35:11 +0200
Message-ID: <20251016083511.3730141-1-B.Hahn@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|AS8P195MB2096:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d45382-e40a-4dfb-2c90-08de0c8ef2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QtYng2F3j/M6tif29G2Jwhy2QKDkPXsnbaC6aJ8vn+xUvxOaWNjYD47I6sGw?=
 =?us-ascii?Q?uhfRLtTDi2EqHR+8aSE5etYwQn8cXtA7FUlWbHITXtpwwrZ3CEnNb5eCK/XR?=
 =?us-ascii?Q?BwCZRqo6NEIVTDn/5MBl1joNzqSgyLiik3bWhav7crANReYGJcb84ZC2hTvE?=
 =?us-ascii?Q?edCG9t2brtswqDEL7wPYwiw5xetEGXPhK47X4DIZyASpaLStq8AA1P8Z/EkV?=
 =?us-ascii?Q?7TqMPtShj5f3Zw307KaugXW6KeccZQZZqIl/gz13wbwo7SdWDMcNEBC+IpzV?=
 =?us-ascii?Q?wQ2hjaVv8uzbXknvKyT+81D57BtBqRxJo/H87B+5xCpCMFOveJTQAxSCEtOq?=
 =?us-ascii?Q?8TPAW47xslwTLemVNSkNZuH3dGfat9kDm4pzOUTl7Ra2UhC2NnkFoTlo5Fd2?=
 =?us-ascii?Q?Fyed7iSc95s5RXSFNU/AVXFxhWdJIhc/m/R6ARlN+A/tpqzgexEuhAwXCOPL?=
 =?us-ascii?Q?zBJAhux9cRC8vcDRQolOH2yTW7fpaIVOUiIxXrEt125XycX665HAp6phRWfS?=
 =?us-ascii?Q?ParEarlo4c7ql00ywDN8G3Kh7ahkR5pLvXsVW/D2mLc1C/gC0HiphB4cejZR?=
 =?us-ascii?Q?aD6eNDQA2m7oBIqABa8nPqaZigAS0w9AYsUXBA0/sG/Kp+hP6NGQ/BXOslVI?=
 =?us-ascii?Q?llluZ6ecQng8OhfQvvf+eAKDG4BvlZaPTOC21qup/UvU9wQSLZHPA7nmRzPQ?=
 =?us-ascii?Q?uoMvgDv9RdGNfDlFjiXXqP/GltWzxcS4bxqwexVwLwmdznNytnIdYolbjhHh?=
 =?us-ascii?Q?hnSLmFCmifDSkvdwMEieu8sOUVpHsQB1b9ItwNVhIS0r1ndIyW7mAZc26G5v?=
 =?us-ascii?Q?23mRSxfwp6qpKf3BUdtB4nLP3m3QXun5G/ZuGhw71FDIVLAX5bxKNPmSK9HY?=
 =?us-ascii?Q?Rct4l/y/gnsMnE32cwLnmQ1ka6r5mPadR6CujdsxJGqj0UoxstShDLS1yxK+?=
 =?us-ascii?Q?nAXriBImAPi6RTkrC6iTp/0PHKvi7Giy8HvB7L/bNXp0ZKoC0qKfNJs5oDec?=
 =?us-ascii?Q?OEXHpPXk60SRDU12woWQJ8xU4q3XZaCDJWEcbKeeqLYTnOn+4rwNl2b8/F5g?=
 =?us-ascii?Q?0Oti1XPb0yk7VeQhBTjFDFmh28HgUxnrfKOmV0TT8G/S5TXSlt/zMSRtRdD+?=
 =?us-ascii?Q?JmxmvR0lLETxhgInvZsKC3cIC1h7VaLwqqK4Su6ZcuwzpNyEmLQQ72XIxwHC?=
 =?us-ascii?Q?TSy5yeGScp9aVNn4oLQk7/Fd4uW3gaUjrhxztLbQpR3QIrBp1FxlWoj+e/+T?=
 =?us-ascii?Q?kZ6hO/vdmfnaZDYeqUpc/yU1B5In6neAH1KSGe/RkS5VxAnpZXsbg7+oxjc9?=
 =?us-ascii?Q?9H47jF/8bOb4ZQCmJ6X7+cTV/Db8K3QLsfKLZHY3ZyQ7Vw5Mg2j2gaWtAJ9I?=
 =?us-ascii?Q?+Ai4Ue9+vhwR0sr6XHnvgif/XwE7TCIrFFjAfIpvjMBbNXIpOQpd6cZ+pMhl?=
 =?us-ascii?Q?6cycZZb520AEvv2L1Feq4C/b8cwlhJxb7VJa8MqDniSnsju9xpZ5Fyy4FsCb?=
 =?us-ascii?Q?gfAkfKgdzcxh/UEiBHxUOaKicRD8bgdD10qM?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 08:35:23.1955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d45382-e40a-4dfb-2c90-08de0c8ef2dd
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2096
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 20:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224984

From: Carlos Alberto Lopez Perez <clopez@igalia.com>

There is a bug libicu that causes libicu to be installed incorrectly when
the build system uses long paths (more than 512 chars).

This condition is not very difficult to trigger on a OE build system
due to the long paths an the deep of the directories that are usually
generated by default.
Also the bug is very subtle and won't be detected by the QA post-install
processes because what this bug causes is that a different version of
libicudata.so.X.Y (one without data) is installed instead of the one
containing the data, but there won't be any file missed on the installation
(just that it installed the wrong one).

See: https://unicode-org.atlassian.net/browse/ICU-22813

This patch backports the fix from upstream/main

(From OE-Core rev: 67d1352873957decacde30ff208fb7bb635b0c5d)

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 ...813_rise_buffer_sizes_pkgdata_PR3058.patch | 72 +++++++++++++++++++
 meta/recipes-support/icu/icu_74-2.bb          |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/ICU-22813_rise_buffer_size=
s_pkgdata_PR3058.patch

diff --git a/meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgda=
ta_PR3058.patch b/meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_=
pkgdata_PR3058.patch
new file mode 100644
index 0000000000..5b97350e6f
--- /dev/null
+++ b/meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR30=
58.patch
@@ -0,0 +1,72 @@
+From db70adaddcfa8050db6a69cdfef080a7f1423ad7 Mon Sep 17 00:00:00 2001
+From: Carlos Alberto Lopez Perez <clopez@igalia.com>
+Date: Mon, 1 Jul 2024 22:15:18 +0100
+Subject: [PATCH] ICU-22813 Rise the size of the buffers used for the comma=
nd
+ strings at pkgdata
+
+The tool pkgdata uses snprintf() to build the strings of the commands that
+will execute later during the install process. But the maximum size of thi=
s
+buffers is not enough when there is a long path.
+
+This has caused issues on some CI systems that use very long paths, causin=
g
+the install process to produce a wrong result.
+
+The maximum path on Linux is 4096 (defined as PATH_MAX at <linux/limits.h>=
)
+So the size of SMALL_BUFFER_MAX_SIZE should be 4096 to avoid errors relate=
d
+to truncated paths.
+
+Upstream-Status: Backport [https://github.com/unicode-org/icu/pull/3058]
+
+Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
+---
+ tools/pkgdata/pkgdata.cpp | 6 +++---
+ tools/toolutil/pkg_genc.h | 5 ++---
+ 2 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp
+index c2ac112..8d08c85 100644
+--- a/tools/pkgdata/pkgdata.cpp
++++ b/tools/pkgdata/pkgdata.cpp
+@@ -1134,7 +1134,7 @@ static int32_t pkg_createSymLinks(const char *target=
Dir, UBool specialHandling)
+=20
+ static int32_t pkg_installLibrary(const char *installDir, const char *tar=
getDir, UBool noVersion) {
+     int32_t result =3D 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE];
++    char cmd[LARGE_BUFFER_MAX_SIZE];
+=20
+     auto ret =3D snprintf(cmd,
+             sizeof(cmd),
+@@ -1205,7 +1205,7 @@ static int32_t pkg_installLibrary(const char *instal=
lDir, const char *targetDir,
+=20
+ static int32_t pkg_installCommonMode(const char *installDir, const char *=
fileName) {
+     int32_t result =3D 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE] =3D "";
++    char cmd[LARGE_BUFFER_MAX_SIZE] =3D "";
+=20
+     if (!T_FileStream_file_exists(installDir)) {
+         UErrorCode status =3D U_ZERO_ERROR;
+@@ -1237,7 +1237,7 @@ static int32_t pkg_installCommonMode(const char *ins=
tallDir, const char *fileNam
+ #endif
+ static int32_t pkg_installFileMode(const char *installDir, const char *sr=
cDir, const char *fileListName) {
+     int32_t result =3D 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE] =3D "";
++    char cmd[LARGE_BUFFER_MAX_SIZE] =3D "";
+=20
+     if (!T_FileStream_file_exists(installDir)) {
+         UErrorCode status =3D U_ZERO_ERROR;
+diff --git a/tools/toolutil/pkg_genc.h b/tools/toolutil/pkg_genc.h
+index 2dd1b45..f811fe5 100644
+--- a/tools/toolutil/pkg_genc.h
++++ b/tools/toolutil/pkg_genc.h
+@@ -59,9 +59,8 @@
+ #define PKGDATA_FILE_SEP_STRING U_FILE_SEP_STRING
+ #endif
+=20
+-#define LARGE_BUFFER_MAX_SIZE 2048
+-#define SMALL_BUFFER_MAX_SIZE 512
+-#define SMALL_BUFFER_FLAG_NAMES 32
++#define LARGE_BUFFER_MAX_SIZE 16384
++#define SMALL_BUFFER_MAX_SIZE 4096
+ #define BUFFER_PADDING_SIZE 20
+=20
+ /** End platform defines **/
diff --git a/meta/recipes-support/icu/icu_74-2.bb b/meta/recipes-support/ic=
u/icu_74-2.bb
index 83753a18e5..104acd37c2 100644
--- a/meta/recipes-support/icu/icu_74-2.bb
+++ b/meta/recipes-support/icu/icu_74-2.bb
@@ -122,6 +122,7 @@ SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
            file://fix-install-manx.patch \
            file://0001-icu-Added-armeb-support.patch \
            file://CVE-2025-5222.patch \
+           file://ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch \
            "
=20
 SRC_URI:append:class-target =3D "\
--=20
2.25.1


