Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5CED2E027
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 08:49:19 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web11.4373.1729673353759857923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 01:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Z2iXnCC6;
 spf=pass (domain: axis.com, ip: 40.107.20.68, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCezgslf/Pzljwma+jY7bxnZlywlStr43TjLUPgsuFT5MrWcmP2dRs3z7cI05Yg+wWLrWa89F5+LUSNt+TbbQBr/1JtdRMBdt98ee7dW+6ppyBnB3kbbdoXMgt3zG9hD30m3F5G90nHgcb6JOH5uNO7C6I2CX/NleJ2vW1ImDXc+rRy5N32UStBBgvnsmKXrSWlluPKJ3gWdaIuJwJoYsRyWTNJsSpc6jbvQvN+J8/8WNdVUAtxnYcxA4PW3zB0JQAuqxvBfAHl9TCeu3kzyhQUGpyHXNzifAJbWMTiHCY8IywAYZEW6fxfMfneX21o3DimB6BKCWYnrIqi7LZAlYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tl5YrgqJdIzF8eQXMmO4f7HDTtG2h4k10uQ2S0XAZP0=;
 b=gfRS6OyE6mzPLnN0kuddsNrah2QnXcmWCRFJozucB+1GvA1bKQRs7DNHz6hCDv6soefMd56jZ6GwUB41dLj4cRl0WvHq6oi04lIIPPE0qMs9/QKUGgKcnVW4E3icveTdwp40P5fXiG6/B6q2qhumX12jdoMuStr35Vd5g5E7fv2wUgwxF0xLi/hdqedrjN/JO5nvMlnlD3Z92ku+qh+R6WSP9U5hASJ/hUP0xUXBV/lqSnGhJz4nA79Nc3OuXTBh1bBPcLNfiF5UFDud+rcvoCaP0T0yGJv4d6Tc+j3T5qoBdN0t0JNEYRtp3Q5p9ZkxKduhjI2qQIWo4ZAYV69FQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tl5YrgqJdIzF8eQXMmO4f7HDTtG2h4k10uQ2S0XAZP0=;
 b=Z2iXnCC6jJucZ5ooCniQaJnqgPe+EdIgZ4KWkAS27pCjHllcsT0MbUA8qLBMqtbHKsC0hS+/7vzVBO0rwUB61ZBD4sUUep2WgACvO3ateLq7CuvhhdpogwMH+bled2wKZTfaEGqGLeAdOlrNaDbLj1WVoxg+3irMwbB2h0ISk9E=
Received: from DU2PR04CA0354.eurprd04.prod.outlook.com (2603:10a6:10:2b4::7)
 by DB4PR02MB9406.eurprd02.prod.outlook.com (2603:10a6:10:3fa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 08:49:06 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::65) by DU2PR04CA0354.outlook.office365.com
 (2603:10a6:10:2b4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Wed, 23 Oct 2024 08:49:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 08:49:05 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 10:49:05 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 10:49:04 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Oct 2024 10:49:04 +0200
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id C6C815FE
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 10:49:04 +0200 (CEST)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [styhead][PATCH v2] glibc: Fix missing randomness in __gen_tempname
Date: Wed, 23 Oct 2024 10:49:04 +0200
Message-ID: <20241023084904.3254594-1-olani@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61F:EE_|DB4PR02MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b833ff5-18b9-4bb1-0018-08dcf33f8d1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?74TmcpxalrnZmE3Xc0jD5WcE16w26sU+iN7Idim+cVqKpY/8ST0bzInYuEjz?=
 =?us-ascii?Q?l+4J9GaKRTlAk2s+8suHfh4AoXkHPuHGbcRBd1UQ08DJSTSD3jJyhGDwk9Ob?=
 =?us-ascii?Q?mLeZaK08yWAFUu/da2SXNstqFvKmbJndTNGX5qkTqU2YmwId96qQ8QC3chkT?=
 =?us-ascii?Q?SMSMg7P0KAoE3WAM+xtcxq5HZ13Y39ifzxGzXEJQf8MnxeYZzfvucAgtUUz6?=
 =?us-ascii?Q?RFnWO51pzk8+OzyVkqrjfSwLw+lVOe08BLZGFwvaZNm1e5Lx7G9KTUZ9FYgW?=
 =?us-ascii?Q?SSiN2BFDJLnbccSy0IM5GMx5mzBUxeI2gjveesSbJ3EcgwEqB37Lx94Sx1Ok?=
 =?us-ascii?Q?npzlkm3PinXGw/R9O1TiHkzY1GE5isHW4l57LRLyJFIh9K6d1b6EkLJngR1T?=
 =?us-ascii?Q?SgDS46aDjyTkGU6UtomaCMYX1BJyoHxnCnxIeBe8cn5FdMsc+VSxyxGeWTbM?=
 =?us-ascii?Q?UEUyHr62TbqXUSA3YsPnQ/xXR5aouDsy8KVO5vHcOAxmjkG1qU4bnXLczTYh?=
 =?us-ascii?Q?v6Te+hJJKd5XvshSi84/PmBWTQvx8hOJzvkZXjLrBtQo4ObLe3hCBCaMn1rf?=
 =?us-ascii?Q?4lRCbMscuufUHvYeT3nhQvtGYRNAk1VID3dldmVfyLfHEsp0L9mZDg0kHecM?=
 =?us-ascii?Q?hIRqFEY3AcuUOKFdnDiIvM50OuLWlcXheGNfiXFoehIObr4Tye4jVBYXqyCp?=
 =?us-ascii?Q?/8BxQ9TY+e03x+7b5vzfXMkojJwl7i/PMpmxQllmjuO62tPcP1UeT37xy1Oo?=
 =?us-ascii?Q?MciaP0RQATRs1N05VmLHr3w6z1twaK65llkgim1afGwgblWcpYLs8UCESMmy?=
 =?us-ascii?Q?3Zuf5/bfkim/5QGROfBb+ObJytd9X1JWiF47Q+t7kdQKWRhY7U8hpWWSAT+J?=
 =?us-ascii?Q?vxdR7zaFokWG4gq1Z4axY56W2sNSX/oAP+PGAtaYYa4pOBMg/80h0LY6TPX1?=
 =?us-ascii?Q?f7YVKnANgo1HsuOGGqb4yyQNYEUad3pmxcAPtTkSayvz4Zr3G/7LuphLH61r?=
 =?us-ascii?Q?7gv4yMjYKL6cf9UvVjx4ImXn6koCJQOW7v0iIw4QpKR9AYLLwRRsSuaFSZPA?=
 =?us-ascii?Q?KzmmP/KJAL3XBOlFHs44MPs+fWJfsGvJ4dnOs/VQ8Gzrs0Kfp5VlK6bOXCnK?=
 =?us-ascii?Q?VD2hqM0ETCaAqnHyd1LH7ENwAKLyF4vRz/BzrqMwLV3JdxvE3lvvr0h/OrKC?=
 =?us-ascii?Q?To3yyZFAQflN3eJSynxWwal+U61TokCGj97UYq6gU7f9MAXYCmwhykrOp8pX?=
 =?us-ascii?Q?x0MKgKs/zxEJx/oNS6XCpcZMy9zPb3d4hIDVudKSS9uQT29yB2yO/3VZ7e0d?=
 =?us-ascii?Q?FPwwcdiuWSHEy9csF5rY3Buz5cikcdQjiB7FbidphKIMNjZN+TzPJiR/kcbN?=
 =?us-ascii?Q?LGWNvoA=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 08:49:05.5094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b833ff5-18b9-4bb1-0018-08dcf33f8d1f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9406
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 08:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206186

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
 meta/recipes-core/glibc/glibc_2.40.bb         |  1 +
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


