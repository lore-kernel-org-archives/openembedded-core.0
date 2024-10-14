Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DE8D16277
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 14:22:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.57])
 by mx.groups.io with SMTP id smtpd.web10.56359.1728915770778461777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 07:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Oww88ToX;
 spf=pass (domain: axis.com, ip: 40.107.21.57, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnQH4O4Z3Lpxv6//wbIIo0wyS98O7DtqmGDFn5+UgXXtwdhwiWRkhtw9IVsCs4EzwBDz3JgwVvOc8VOg2qQ7dUT5/XG2VT1SfPHQusCiOKbWCvtA/bnvG4VcBCCJV0oJ+g+AJ8DZ2hCFpT5lC/z0xxlGqUbRd5SuVbKUXnK+f4NwjO+dti9qxnvKKQ579rIkYSM95BEZVO4CdTAJheWXaIzHN8vzUQJyBSZoRYry0+FLZDoGQ2XZpVQuboKRLRHLXEsbmxW5LXxcLmCWRGRwQa8DLM0kbhP3/im499O+llJb/OqwV+YG2asPDm0zd2NJbiYtt0R0Xuw3kZcDkdj9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAABhMPEWWyyeynqTre5/g0V9t7ezLv7fbGkEhVJDNk=;
 b=IrGympEjlAyflZPXjzFS7iIfpDN/1F7LfU+u+oIPo36YU597VT2pA7GYqR7pmkTbcRN7PLRjUBCm5xupYV/QzJ7NTHpGXYFZoO9mgXAz/ZNrABlnhJ4eimBXiBfsaZx4FC4+/VCpOUaS7NCboDHOnR0e1iruCOTwgHs2GP2pYxnuxgsr577gU6YoJasOyR6n1zRYxPDH5tqCd2wH1EOV+Xu4K7M21/LvcNnUIYS+ffqFyDw9yiAcjD7xFj+BkqUSr2XD8M7WXDMieuUOh1T+72qUEPBjwtVEg218/SWqwzTiYsVHzVGGkDFrhQFgiBEIRczKkbRNWzIT/HXLKAf/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAABhMPEWWyyeynqTre5/g0V9t7ezLv7fbGkEhVJDNk=;
 b=Oww88ToXc3sIu+ewFIybXBHHyFbgCpr5qi4tutGsMVzEjQ85LqrNzm1kdXBXLUSL8kpGKqJhTk5zwiUeICpL5PA1QJRzx4k7RdpubcM1I49mSWpO3OVe+kVXbWmFiswb7YGC222SnPN2EFFq7Zq+gN6K6WCZMP3tcg/6ZedI4e4=
Received: from DU2PR04CA0078.eurprd04.prod.outlook.com (2603:10a6:10:232::23)
 by GVXPR02MB10883.eurprd02.prod.outlook.com (2603:10a6:150:15b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 14:22:44 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::b4) by DU2PR04CA0078.outlook.office365.com
 (2603:10a6:10:232::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26 via Frontend
 Transport; Mon, 14 Oct 2024 14:22:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Mon, 14 Oct 2024 14:22:42 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Oct
 2024 16:22:41 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Oct
 2024 16:22:41 +0200
Received: from pc58073-2410.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Oct 2024 16:22:41 +0200
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <olani@axis.com>
Subject: [PATCH] glibc: Fix missing randomness in __gen_tempname
Date: Mon, 14 Oct 2024 16:22:41 +0200
Message-ID: <20241014142241.2180338-1-olani@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|GVXPR02MB10883:EE_
X-MS-Office365-Filtering-Correlation-Id: f087b0f6-5630-45a2-f407-08dcec5baa63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?efBH2+SGV1qHvzqEO0BxNxcMQyHt/z56wF8sVCam7tPX0kQqUQuxQ5M7EMq4?=
 =?us-ascii?Q?pIk7PHINPLHzZb+mRhoOtVdta3v8BBL8SVeNPkpBBPql0uwBwcJA3rVy5CgK?=
 =?us-ascii?Q?2RlFUxQ/VONGLi7myvEh+YDB9ltSES7mcDJLCwrGwe01JuScORSFhDG7+FlC?=
 =?us-ascii?Q?hYGo+a7ptoPLg4y1f9taBrvCqi1lFXMja10t35Yrg6+8gVA6T0H4P5y4xQX/?=
 =?us-ascii?Q?c6hGZkg44SJK4C6iHnzhuiuc6BRmKoJ/fANnH2/3ogEjeSWEokIzLmDSOe53?=
 =?us-ascii?Q?YpQklE34WPfKLMKL66BytFC12F6N0ccQeMCUfKMCrO3fmy7Ss/TCi/YEQUVX?=
 =?us-ascii?Q?cJ3mw3UpZQnjuXj2v3TqXaeBjCIFsMKeQOhC8+yfp+2Yium8cmbE7GbFa30Q?=
 =?us-ascii?Q?Me31eXMyDNv6Q1qykq7eD4kadL7EIeYU0XC4BllbzcWNZDoH2ftVOccqy5Z+?=
 =?us-ascii?Q?IUUBdQRkLZnFIPVj6ph3SfWBqpVPSaDEf+jddftA8EbbH3l4A+zujzbzb6m+?=
 =?us-ascii?Q?Y8/REHm1DmtqvP3Tks5pGW6ZFf5XaivsqPROeR2K1u8rp8nkd1Oy0uNbetUc?=
 =?us-ascii?Q?m5/z6JY+ZYWC37ykSj0i1e8o1RZkBCmHSv6ub21E3w/+neRsGbRbbt2bVe69?=
 =?us-ascii?Q?mXuVRGeW/8CG8rIbL/Pn89bh1YZg051KzetmivVqxQMRd9DbjUyrVNBDiTwz?=
 =?us-ascii?Q?jL7o6pr9GKQFhNpS17tCNDc01VUTB6hemV9AxJPlI7K2wQ2iyq31f3DrScCh?=
 =?us-ascii?Q?dXfrQZqH+m+sfxPs9TdZJRGBQU70TJbGWS0hc7ZUlrFNXwgIE9jwpObQ5uI2?=
 =?us-ascii?Q?xujp2BXlCHCuZsBNMg3A52Lj3iuLjB/mQxH1TsfIcfrKeagMyUUqjnFwHLAr?=
 =?us-ascii?Q?o7HVsuBfjUdsT7fmU/3hkuI72tcBchplrEGnBY2ykhPjJxVJDbdtQEwCROtY?=
 =?us-ascii?Q?xapsodUn8UkQbQRV3IYkom3g7Or3pOp04Szm4sDbVjpRYxklUcm2d4yvyCuU?=
 =?us-ascii?Q?wKRDlwflvV0RwZEyvj0h/yEdukWq9wDPu/1//3EVNI9fgNtNvS9z22+4uZtT?=
 =?us-ascii?Q?IrWrf8R2/MlKNs64NnbKjS9EFYMKSjemsoh7ZsDGQhxQTwU2sHXGOXB3EGO+?=
 =?us-ascii?Q?AQk0PDmJTZRiw//WFUMciTAq+7gNdwZfweYXZnjz/D4kJ/9Gidc4uy87fc9d?=
 =?us-ascii?Q?tjIcIOF97BP1NKbidnJ2FS1njrI1NPhq9ZIIvnNuo6esqpvZZUbR8HCBtdcn?=
 =?us-ascii?Q?K/apQAzaeA7/+XTpJt85+cXM54Tu5l1VnWPFB0dwDd5Qw//vpqxg2Ufm+XgH?=
 =?us-ascii?Q?020ys38O/kMJiPKRiTDSYqMY?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 14:22:42.3999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f087b0f6-5630-45a2-f407-08dcec5baa63
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10883
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 14:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205781

From: Ola x Nilsson <olani@axis.com>

Backport the fix for glibc bug 32214.

The missing randomness in early boot may cause some systemd services
to fail when they occasionally try to create tempdirs like
/run/systemd/namespace-aaaaaa at the same time.
The error messages can contain things like
"Failed to set up mount namespacing".

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 ...ndomness-in-__gen_tempname-bug-32214.patch | 26 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.40.bb         |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-Fix-missing-randomne=
ss-in-__gen_tempname-bug-32214.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-_=
_gen_tempname-bug-32214.patch b/meta/recipes-core/glibc/glibc/0024-Fix-miss=
ing-randomness-in-__gen_tempname-bug-32214.patch
new file mode 100644
index 0000000000..9452994b3f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_te=
mpname-bug-32214.patch
@@ -0,0 +1,26 @@
+From 9d30d58c32fe9d5f8ec6cda79fb11159e6789bcf Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Wed, 25 Sep 2024 11:49:30 +0200
+Subject: [PATCH] Fix missing randomness in __gen_tempname (bug 32214)
+
+Make sure to update the random value also if getrandom fails.
+
+Fixes: 686d542025 ("posix: Sync tempname with gnulib")
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dc=
ommit;h=3D5f62cf88c4530c11904482775b7582bd7f6d80d2]
+---
+ sysdeps/posix/tempname.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sysdeps/posix/tempname.c b/sysdeps/posix/tempname.c
+index c00fe0c181..fc30958a0c 100644
+--- a/sysdeps/posix/tempname.c
++++ b/sysdeps/posix/tempname.c
+@@ -117,6 +117,8 @@ random_bits (random_value *r, random_value s)
+      succeed.  */
+ #if !_LIBC
+   *r =3D mix_random_values (v, clock ());
++#else
++  *r =3D v;
+ #endif
+   return false;
+ }
diff --git a/meta/recipes-core/glibc/glibc_2.40.bb b/meta/recipes-core/glib=
c/glibc_2.40.bb
index 71b89ac9ff..3e855b19d8 100644
--- a/meta/recipes-core/glibc/glibc_2.40.bb
+++ b/meta/recipes-core/glibc/glibc_2.40.bb
@@ -53,6 +53,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ=
-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bina=
r.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftes=
t.patch \
+           file://0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.=
patch \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.39.5


