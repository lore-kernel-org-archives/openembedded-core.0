Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D27D2E025
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 08:38:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web11.4004.1729672697683532748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 01:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=RDP+kdSy;
 spf=pass (domain: axis.com, ip: 40.107.22.41, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yq+Eft0JGlMD3CV7XocpDVpQpexAKisXT9l8AjSQWoKtt0L8ha6+TkSBenDQQj1bGqL0WgRT04y9pjF8CwiXGaQnfJtwX79LML1k7euJrImhkNnC2lT425tYQWwaUnyPWn3J4se3KqAvbo4AixTpYigQKuLOZFEnvEG3NNOxPGziu9ZtqVUNnm/ll9HehvwAI17nAbhRmwK+F8IwZd7ID4jsK6Sv6gVKI8qrDvCwARTCaSBy6F1bpTEjSLj45bIXFTkAQ3LuFcG9lYcTMfBZ299kjo95z/L3E3nNA0CD5XO6AvRBZ1LTIh1zMpQTRXpbv9IWIj3C5DID1ATwIx+1Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHvKYxPharjeTb8GpeOUILRSQbMtA0rpxwkeWj/vCo8=;
 b=J3mz0pUGG3ex3LjOMqrtvDkyAReVO0Mag2lxTzmWwduDXc4mSXK/SlperP8GuBfS6LDfuGtsRy3BxWDFyfb2NPNJNk0si6o+H+iL3fN2xzhlK2rE/YNxeOr5q+Z63SNVQHUgflFucqU5oz+zZs0JHYGX96aXeeLJv7FpV0Gu30db4tzIjImNqMeQ57fpcwjDV1lHP0myiKB85cVZfc0dFti7pmqDKF/7vetXCM0z07NjvbKqNSY9ms+vFr5CRBJjqv9pM0ATO7flnf9kBouwPa/a7orRj+5BAZEgyJLcnyaNQao9NqU+5JXiDB1vijhtDQgpR6ZhYaAT8DoyYd3zWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHvKYxPharjeTb8GpeOUILRSQbMtA0rpxwkeWj/vCo8=;
 b=RDP+kdSynFQsHGUzjD5NhASjUnq2L3M9nFgV2GKK8v9L2R4n2xW7QG82Hnb9ARZolcFv3TeXDq/tdgvlrc4HD5Mylk0Yur21XfvJVAR7MIPMq7bf6fvzWkea86guyREE6GEfopaedGkHXBRdYlnVl20g0DOR+tPD5WmVQq4Nml8=
Received: from AS4PR09CA0023.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::13)
 by VI1PR02MB6030.eurprd02.prod.outlook.com (2603:10a6:800:18a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 08:38:11 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::2) by AS4PR09CA0023.outlook.office365.com
 (2603:10a6:20b:5d4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Wed, 23 Oct 2024 08:38:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 08:38:10 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 10:38:10 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Oct 2024 10:38:10 +0200
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1F2895D9;
	Wed, 23 Oct 2024 10:38:10 +0200 (CEST)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <olani@axis.com>
Subject: [styhead][PATCH] glibc: Fix missing randomness in __gen_tempname
Date: Wed, 23 Oct 2024 10:38:10 +0200
Message-ID: <20241023083810.3252722-1-olani@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|VI1PR02MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 791ece2a-0d68-4e97-ec48-08dcf33e06d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AXz3nTl7qtQv+eV2GWL2tpQ6XPfhUZqOGGyHVPuaK9frtwiAKxIFP4vd3FwE?=
 =?us-ascii?Q?AIblwRTwzkSfniKkDHQzyWdwioCwUElOePy58lZxMaee9A5IOBMz60t6HniG?=
 =?us-ascii?Q?O6EAZDqTGFUUj+RVXCSzS/7CFQ46LwrNx4jIzDm21iusIWYH1kAwCRObnScl?=
 =?us-ascii?Q?QK24S2oCYcQ7U5NMDtRC1RxHH+B88GsNHebfdgQZkUF3krWcu2R05RpCkL9U?=
 =?us-ascii?Q?7N+WVrVBQeiCF5TZePUFnpbHFxtkviSvthq+wtjWs/CcsbV3S94xXX+KC+E5?=
 =?us-ascii?Q?CwcmI1FyCakSpHVvb6GR8gqeuTNBEqpFdAq1E4eTxwgHSZH6PLYXmlztTr5t?=
 =?us-ascii?Q?txAgEhcnOIer4xm/I0JPHv5POh1Aoj/+RZWjoIPITTmMef0ku0l6uZuMonM9?=
 =?us-ascii?Q?azIes3z95L3QAtX5MtRhFuOGll2QG27GEGSqVMG49rYWVZ6pv1405WbiMufq?=
 =?us-ascii?Q?3jT5KRiUQHJ9goe9aFshMQ4EEhpg25yGOqCsd6WMx317oIEeElKtpUiFGuL7?=
 =?us-ascii?Q?OPCQ1zH+e6Or/H0N9ZB+io0vfZYLbIxTHRFXkpoR8KlhkIvn1pRpBKV0p6Bu?=
 =?us-ascii?Q?cXgr1PACEFTP0XZshJiBlb1dSDy91SXqKuJ1W0hZxFaE5iPNHkel6HDf258T?=
 =?us-ascii?Q?okTBvVK81YGPPTWxDvIdZMUh5H16xulZcRvTTW7nxpwWSnxBa6WXc2V0m8Zi?=
 =?us-ascii?Q?riy/8/hS6CegmhoVCZSIdbX+CWjmlOk7Txe3cJ1ouJQQYG47CaeVCEggclat?=
 =?us-ascii?Q?pND6vsvZnbYGjEnC53iAKDZteuaVMsTGs5gOmmvVVdtNVkRKCYq2Kxr1MQdK?=
 =?us-ascii?Q?g8RfE86HDI0Er3+I7XohnzkJKpUJ/S/93vOTGPbEOQZJKnFAxGI//N5SKSaY?=
 =?us-ascii?Q?61BBejj2lwWJztnsJXG5Suz2fl/WaEwXhrwdoGQafk89vM+4OYC+6gbIXtTa?=
 =?us-ascii?Q?saU8VZWIJkPgqdkqt6lwAVbc/+hg7dSUBIas/OGUyb99KXnj9suFW3rJLWhw?=
 =?us-ascii?Q?FeHMbOHhwVb/k68q3m3m1QsPEj+a3oBUr+2RAQvNO4+OhxGrl9QT1UgFWAYH?=
 =?us-ascii?Q?K0SmgN33EqLFI0rtNsKVGAxt3ts0SEhs41aMezQpKXuxzUVABdmelLv1Esr+?=
 =?us-ascii?Q?24OpLEDh7MrfJsVHTXYtzXmVCsLANRWBCznHhOmEnncIEq9Q7Af9pBFwIEuX?=
 =?us-ascii?Q?XaAAvUACUkxYHak33G98TqHV3Kqry8zMA77lzEqjfv4aI9ZpYbusLtS+upmi?=
 =?us-ascii?Q?sNwtlnRp4b9FfueaxkyC/h8QpHcRGQBxgpq7B9MaNAWxOnSG99qVBdHmCzyG?=
 =?us-ascii?Q?sT733Q+yGtcokRL/zs2cZVkqO4C1NXbT1PYTrYq07BVWqoc1+RAgh3bcteYP?=
 =?us-ascii?Q?ByZDOak=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 08:38:10.7609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 791ece2a-0d68-4e97-ec48-08dcf33e06d9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 08:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206184

From: Ola x Nilsson <olani@axis.com>

Backport the fix for glibc bug 32214.

The missing randomness in early boot may cause some systemd services
to fail when they occasionally try to create tempdirs like
/run/systemd/namespace-aaaaaa at the same time.
The error messages can contain things like
"Failed to set up mount namespacing".

(From OE-Core rev: 0bb6aa06db5bf2e89d1c499e84a0a8cedbd8f0a7)

Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


