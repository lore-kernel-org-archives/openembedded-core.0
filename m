Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2BED0E6DD
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 10:04:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.49])
 by mx.groups.io with SMTP id smtpd.web11.42549.1729505037548377436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 03:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=b+BaLjCk;
 spf=pass (domain: axis.com, ip: 40.107.20.49, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCjH4VkF8Z4+P1krYy17v7hKLu9DugsyZWBwU6WYeyA1gilSPwp7H+YADBJ5oiWt43Gy6cMNYoRLCcZOVi0YG/BGkc5IKFK7Uim/oDrBJFQO6mruCnGSLQrUv3M4kVVYbSTSo86x3uaZkfJs72fPrc9eIsAPorGGpxo4mljnkDT61/ohsWAUd594KFutk4ir5ppD29m1zDmtO+1tI8Pe0LJ1ztpUMwFI3QkZOoDVI748zg9aZvFn67sXqpadvpyrYzX1/Sfe+U94mEX76XgU86r7w5d315JTm1aPnl0Ilss3CLpKLn5x7x/I2YIM2I6hL7YxfIsaheu3WfI4F6Hufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4piJpmfxMpUJEudt4usHxJYXcHz/W4642F3Dbbf+5A=;
 b=modd3l1SquAu5U9NHrLC/YwuEKxrpDrh3wuCRr4M4FG3y90G+5MzAqp9beMAbYSpk4lK+KXy9LkpagBBOKzMhBu4tZMuuir10PCHjEDVzrYRCag5/v0DNIP9Rlnk4VBpkC5K2DiEM82lyjoqeGz9G+fCKZntO7Q307zbDGhJEi8QsEG4nRSMXRf4YbNtOfO6fTTtrz+TuyenHLW802oe8isYnMj+5mxbSugeYNVBFZhl00zwBvksOImrNYPU+yNLEuRZZYJWYVxmJT96LqHYsALVlyENNQteYXCG5TeyZEMEteo7tHmn3h81qs8qFe0gjbsXWiDGELEXz8xle1ZQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4piJpmfxMpUJEudt4usHxJYXcHz/W4642F3Dbbf+5A=;
 b=b+BaLjCk+wOZpZImw+NCAlKO5Vl62mcMtQX7LpHHEWCjQzQgtnai6PsWMkjmmu0ud5cpYsS2Ts5ArKl0HTDcPEyD45PqHYyHJ/O6ihUxzy2J3tRwNLWvipFyePZ56/Xy3IfBmYVIL4NpkIptLj3eMgyapiUfaefXzXKtZ9OSPTQ=
Received: from AM8P190CA0030.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::35)
 by AS8PR02MB9815.eurprd02.prod.outlook.com (2603:10a6:20b:61c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 10:03:53 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:219:cafe::3b) by AM8P190CA0030.outlook.office365.com
 (2603:10a6:20b:219::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 10:03:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 10:03:53 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 12:03:52 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 12:03:52 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Oct 2024 12:03:52 +0200
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 725011F0
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 12:03:52 +0200 (CEST)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] glibc: Fix missing randomness in __gen_tempname
Date: Mon, 21 Oct 2024 12:03:52 +0200
Message-ID: <20241021100352.56570-1-olani@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5E:EE_|AS8PR02MB9815:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9ce2f7-aa5c-4741-c5e3-08dcf1b7ab0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2WBV68dKSoocKN8l8tY810BKSQh1in/2azPa/l8gyTFqRXQ447CZ31h0+1YY?=
 =?us-ascii?Q?JxAJQCRsvV/8W3PZmJWVSNVO7BHHW9DyWVSn/2uZRvSmwaYUCFEnb8AD8wQS?=
 =?us-ascii?Q?je8COgekuAARw/6E5K/26OX1fIGDsQ+xcebOTvVzvhaGoJp0Ma+RDu9N7RjX?=
 =?us-ascii?Q?sgqq5UI9bD8kpPT53uiX67f3bbYTL5QntpDb29XNy4ngWn9SxL6Zr2hnwudj?=
 =?us-ascii?Q?PgzyK7UYamlMWNtrBZfmWSfT4CtWjYVvJJJ2xl/lwq2Cwg/R3rwltgYbmQKB?=
 =?us-ascii?Q?DMdCEQLbPFZ02JnrFl7NosNhtqcZkQhP/8mimj4QaZZrs723QJMe86MLTp9j?=
 =?us-ascii?Q?gwjxwtVKwg1TNyaiio+PK9MevA7d6UgbK6ko9D73xu6n7m29T3AIQdOt3JGA?=
 =?us-ascii?Q?0VSbbgoaCDVhpKz5h2jx3SZlWTT+8rlz1F/mbDFRSk0a1a4CdelmaIcBcDGr?=
 =?us-ascii?Q?d9MyAd6QyMQeOiyqTFWV+ZgiJpLk6G1WTTxvxB0ROirAhwwOGqUWGBXGqhA7?=
 =?us-ascii?Q?5bFC+ND2MUFZt1LA0+vigWKXcoQ1FmrYN9kwyYYYyU2dC+Ex6W8RLGzJUzsn?=
 =?us-ascii?Q?nZa4n6sHotHuFCJDd1taqjmkeYtqs6tGAilcFzEf0FI4OjKvajqVG5vR5iBS?=
 =?us-ascii?Q?UkpZDtXWyTLdQA2u/zy1UrsThQnj0qhVkYulJoiHbaDOhojD05J+wQVAX5hj?=
 =?us-ascii?Q?ovTJFarRgK91S62dB7ZWMAZbPzp8xjUhitk5k3PlJpoHxAK0YxvJmDxvNqCm?=
 =?us-ascii?Q?4Tf7uwnSc7Waf1y5bnU+xQu23M7q719aySxebAZWpo1NsD73t11AKrjGlsup?=
 =?us-ascii?Q?bSrd19gcln0em0gOfog3roicZJvnQBMGmjMUnW1lR6LiDKpUUNcF3a4D46eK?=
 =?us-ascii?Q?Q5rPi7uRwteyr2CITaIapXRzV6vYxn8Ez6rpBkdDzm3hSaOQ9IoQybzWD9Mn?=
 =?us-ascii?Q?LY3fFe8CYnIsa5Bl+OfAev3a9/YX73XTs9jTNU2NjIlWd7T4G7oivLpUwJsw?=
 =?us-ascii?Q?qixJGTx4jDUNPEvkMKtQC8Pls2bYxJ/E2sfS89yOlhP8EWxTTefh9l8tZUby?=
 =?us-ascii?Q?UYzRpWf9440kP+1K3h9g5xXaRn9bdkMS/tfpf/hG4TmrYALeDwc1MtYQVrs6?=
 =?us-ascii?Q?/OD1wIC32i8v7X44LnOGGje+YP0aJ0/UTVmzws7gMFvOhFd4cu+sddqzA2ke?=
 =?us-ascii?Q?EZ81Ns5pc8fMUlDTmnOVohlVtrfSu+EL7xX9EgYAhAFQEqmEjM2P1sLw8crC?=
 =?us-ascii?Q?mXa7VAia3IE+x5qlOnx1eB1oTk2Zoa44iDTIZi+3LQmtG95LLMht7+gtaOo+?=
 =?us-ascii?Q?92RTDXLvY6u+N4mA4R7DifZqhIVaxUhtf2i8mZQ+bOG9HWwDovbw0+lbuB7x?=
 =?us-ascii?Q?G6OiUZU=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 10:03:53.0283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9ce2f7-aa5c-4741-c5e3-08dcf1b7ab0b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9815
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206102

From: Ola x Nilsson <olani@axis.com>

Backport the fix for glibc bug 32214.

The missing randomness in early boot may cause some systemd services
to fail when they occasionally try to create tempdirs like
/run/systemd/namespace-aaaaaa at the same time.
The error messages can contain things like
"Failed to set up mount namespacing".

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 ...ndomness-in-__gen_tempname-bug-32214.patch | 29 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-Fix-missing-randomne=
ss-in-__gen_tempname-bug-32214.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-_=
_gen_tempname-bug-32214.patch b/meta/recipes-core/glibc/glibc/0024-Fix-miss=
ing-randomness-in-__gen_tempname-bug-32214.patch
new file mode 100644
index 0000000000..c9f3e32f58
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_te=
mpname-bug-32214.patch
@@ -0,0 +1,29 @@
+From 9d30d58c32fe9d5f8ec6cda79fb11159e6789bcf Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Wed, 25 Sep 2024 11:49:30 +0200
+Subject: [PATCH] Fix missing randomness in __gen_tempname (bug 32214)
+
+Make sure to update the random value also if getrandom fails.
+
+Fixes: 686d542025 ("posix: Sync tempname with gnulib")
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dc=
ommit;h=3D5f62cf88c4530c11904482775b7582bd7f6d80d2]
+
+Signed-off-by: Ola x Nilsson <olani@axis.com>
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
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glib=
c/glibc_2.39.bb
index 2484ae1cd9..2db18251e3 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -53,6 +53,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ=
-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bina=
r.patch \
            file://0023-qemu-stale-process.patch \
+           file://0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.=
patch \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.39.5


