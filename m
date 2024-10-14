Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC65D1627D
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 14:38:27 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.84])
 by mx.groups.io with SMTP id smtpd.web11.56544.1728916702863519577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 07:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=bDEzl3p3;
 spf=pass (domain: axis.com, ip: 40.107.249.84, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikJdtPepIv9BpGr7P4mi3PIMVLp+g3+Z7ruNbauGtF2CdfQTxYs6BVO5WvSXOOktdiH6JEB9FEri87ifibHhEanOEF+Qime+Y4JtE32nPYwT18M9b4u2QVcA0u2PMVC6OrSEKwCI0+vLrMuRrPSg/wJwIZvbMW8IFj3BEB6sEmOgOQqMppBUEZ93y/gIMogfUgLKEDDmrip43R4gTKCs2r53iBd7G49JGlMe7CQ70byiySHS1n6mzG1R9RhxdUYU1ZJgSQ8/WlSsSM2VbExhDU4NY8Gd1ucJJCeyEhMARr6NJFBe5mTIlRl+krqIyWes/VGOQonoOoamOHA2d2yXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tl5YrgqJdIzF8eQXMmO4f7HDTtG2h4k10uQ2S0XAZP0=;
 b=hVVjLAkX/xrFQlo6dA22bWc+N3dpNADLnjCIQcEtTGC/cRNCaUG40D49InxerlkrKuZ7zA/oectlnk9MZGjE0AFXDSYkHFJKJhHKTYDnmRqgwqombbNv+NhBhDAP6BCwtsXAf4ny2reDYfmljP2qn8AMTDojAkcbVIEefw+fWRD+2bs3gci2KpZWdB0ejf15Q5WD79NSCVs9gJgiGx0lmyMCOfAZZNWOeVaZSG9gPEOV76Ls9GtK1OzgNiuwOaEt3vk+zjJ5F+8xAF1C5QxS55HH5SQhdzpp8MjzEfqcxAzbBSrTepjxJkBSabtEaXqlo5Ba28GGjwu9sh6AN/CszA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tl5YrgqJdIzF8eQXMmO4f7HDTtG2h4k10uQ2S0XAZP0=;
 b=bDEzl3p3H344XrcgOtRkVtoPlNH1vy09a50dBLQn6EN4i+H2FabOfuLXPXF6a36dJd4R1bB+HsSs9yyreiiYWcXs13W59CVrIbTPxV1+gR6uAVD7B0rQHpxqYkHzC22+td5QSaOfaSDJas4NJBQ8YRzRNcS9tjdkbPjob9I7ynE=
Received: from DU7PR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::21) by AS8PR02MB8416.eurprd02.prod.outlook.com
 (2603:10a6:20b:52e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 14:38:19 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::e0) by DU7PR01CA0043.outlook.office365.com
 (2603:10a6:10:50e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26 via Frontend
 Transport; Mon, 14 Oct 2024 14:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Mon, 14 Oct 2024 14:38:18 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Oct
 2024 16:38:18 +0200
Received: from pc58073-2410.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Oct 2024 16:38:18 +0200
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <olani@axis.com>
Subject: [PATCH v2] glibc: Fix missing randomness in __gen_tempname
Date: Mon, 14 Oct 2024 16:38:18 +0200
Message-ID: <20241014143818.2182829-1-olani@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|AS8PR02MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: c9223250-9048-4704-2498-08dcec5dd895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U0Vx4DSxW0jyiYKfmECoEInyyL7Dk88i+HPPazqdQmS9WHnWx8E+zOjduMNt?=
 =?us-ascii?Q?s6Z1GzckBFpXUJ509OqRGLRXj95hVnVVZXRnInVzhANhe0bSk5ZckeOIek3u?=
 =?us-ascii?Q?S+4RXI/QIAaoSbXPHkr9QXM4q0x56seT3s7KjENnW1pPs50TJxftpYrNMqxz?=
 =?us-ascii?Q?gKx5Tf2ds1GmVPIJ0wfRRp9NW35ES2SDDMvZZrs0u7F6a2ta1UtKYuH2UNVE?=
 =?us-ascii?Q?+ya8iSpja/ZKqqlHc8+2VtBOklerV5KKeOaYghIhoPOxocieWltsdF2oeCPf?=
 =?us-ascii?Q?ysrRvoch1L17U/hutHFTwIflzujJ8WYSl5EFZHngx4rUCW4g4GEsgxUR2C3M?=
 =?us-ascii?Q?qs24A4lfO2re+5iO7BRwBJqDhlShNQfsuw0OYIBZC29iPtiXA4kfMHj9Vw9+?=
 =?us-ascii?Q?Ge5qSNfb68IT10m0dPOX5H8axo263puNdYpC8EBSKeIamhpe7rFLIsC5MwAT?=
 =?us-ascii?Q?9mXQ2HHtLly8K2Vv5AfTQiXIQ4qQnznHepmWNtyV/sjsZTZFPjIRAvnEa8fn?=
 =?us-ascii?Q?h2GlkStevQseba+pztPHCsCm9oS53MUTDS8bQUg7PfMu7GqteQ0agWi79j/C?=
 =?us-ascii?Q?3ddHZ9MaTv8A0gyZbflkYnZqeDgzwY8YMMyspzXalwrbDSDpvFQglU+TYW6r?=
 =?us-ascii?Q?7D6JFZTa4jrpLsyTIoVsZZj8C2pTxBqcdh6un1u6cVB63CNbYRA1tWUOJ6IW?=
 =?us-ascii?Q?qlgh1+KMdfJvBKhBkQaEVjbCxLqG/Vf0AHuH5FTE0t41SEFNVbyZa5YWKNsx?=
 =?us-ascii?Q?9PYoQ9Sp69tFASdHr0wJIZZOhB/vYBz5Uh7SDnaJYtDuM5lP/zNDa/JhZex/?=
 =?us-ascii?Q?Nl1FxiO4R0o4UXBswKxBXt+/XgJcMBSbWWEL/iShPv9Wj/h6VoWBVCDJmGgd?=
 =?us-ascii?Q?uc3ML456k4NZyaZNsLPo2ctAxNuuK8QUlGiC+pvqnPPiiNFSTFMXFAOUSwoV?=
 =?us-ascii?Q?VeNhYPfB/gs518p7/GkJUghqgMtSTEXPxE8CzrfTgakhX3vX2L9DJfPyuUIG?=
 =?us-ascii?Q?v1lraMEuPIXk4tn8Y9WJs8Da/UTNHN0/6uYUegoP6HI3VoAHwDtc/DnGwfSZ?=
 =?us-ascii?Q?8ejZqrH0Jt70UfIRt2kLv9e2fC5BbtbVUEDVxhJqcnyZwBfOS0ZtAlS9Il6V?=
 =?us-ascii?Q?9gQ/1O+niGmAHw9nu33Eq8xVAa+JemD6CmY2XdjJ82hTTRbJFHe0cb5Z2RQ1?=
 =?us-ascii?Q?ftulrttPet3hp/8GhwdLK46GnPEWPlnd5SOrnUDBIBj9Jkv5LNyTbL5nPj+a?=
 =?us-ascii?Q?5KmK5uFdPMHvUsJxKCUMABAwYQz49B/8dctDe5KO3Ctw28/7YUPwbrghqDT8?=
 =?us-ascii?Q?oGVE0EJjDs27ee2FOrL0dsiH?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 14:38:18.8753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9223250-9048-4704-2498-08dcec5dd895
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 14:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205783

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


