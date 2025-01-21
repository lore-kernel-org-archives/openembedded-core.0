Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749FEC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 05:18:30 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.57])
 by mx.groups.io with SMTP id smtpd.web10.9725.1737436707439874252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 21:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=fsynrELO;
 spf=pass (domain: axis.com, ip: 40.107.104.57, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTsdGIAqyjtd6oRRxz32CB25vtLjMHC/ndPw1hsqbfa0nSoSqdu84WFHc/X4GPDlXkozb871VvnNrzJDYv4ur8rBHEo7XmBxyujdoAv1S//g+SjGnKuDF9S+Zw+xOKl1lP6SHkW4R6+6geAHtHyrD04WfF9W85D+Qs1JHzeeBryVcuvSfxgqcHH8ppqEzcw6So40nzXnXKLAL2XpTrt/aUYBxa2FbUM7S+KtWbfEyNoU+BlH7J22H1NWYHA+gLfk099Zwhb8Yyx7JFNlhm5Syw8Im+wv6hGOos+PhtkZ5/IS7bWridafNQY9/1tFpiA6UCbt9MOac0OgEMTbBsZkgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKcc8v0UpQXXwcVgFmH6ORUjUgby1LgTLTLhSmVBeSE=;
 b=bRfgyYcscikh+PG+X/NQX4kT2nZPvNaUJ0J3uFHAcE7+whohNPh70f25Y/Ue8C7dNWmVNrpozrNlHZSGbKz7fvOsSMT0vDgDO01zr6ORD0PMj/u6+mMDQEkodqRAArndJdg44jbDAoYtw/d9B+FmlpUDoLvcW4PeRfp2P8cAXCtv1ScCE20AwL6cUrVreTu767GteRlxCX+2YjOTjCLpPDsYpIp/enb01LvloJ5/69aWu+jHOxbmPp4HInOcIm5wl5B+jbdJv5/P9OVGaNutlNkVOfk/DXnOMTCt5+IEWkYBwTglaSlrtlbcU6YP9Ks84fjxHNFbQKt9q5sXDsz7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKcc8v0UpQXXwcVgFmH6ORUjUgby1LgTLTLhSmVBeSE=;
 b=fsynrELOuyXh1kqygcVI+RMV6vilX7FH5nOoHEDvQ+Naj7BUYtbyewrRo3DESWwKlJqXJqQk1lzKvKWy8kztwOl0U8Ebdqr8eYBJUf3h/rwd/C7kyyRyvqN/P/jbM2gLi5eRtlIm/VRkO0cVVsE+dvFmErUnAcIiPXImjToXYPs=
Received: from DUZPR01CA0191.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::20) by PA4PR02MB6559.eurprd02.prod.outlook.com
 (2603:10a6:102:f5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 05:18:23 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::9f) by DUZPR01CA0191.outlook.office365.com
 (2603:10a6:10:4b6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 21 Jan 2025 05:18:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 05:18:22 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 21 Jan
 2025 06:18:22 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 21 Jan
 2025 06:18:22 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 21 Jan 2025 06:18:22 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 4DF11248
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 06:18:22 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 50L5IMTs2403193
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 06:18:22 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 50L5ILqX2403190
	for openembedded-core@lists.openembedded.org; Tue, 21 Jan 2025 06:18:21 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd: Remove /var/log/README using a patch
Date: Tue, 21 Jan 2025 06:18:12 +0100
Message-ID: <20250121051812.2403150-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009526:EE_|PA4PR02MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 37106f17-9102-4b67-33c5-08dd39db06b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eNhiCfwOfagiBVzbLLBRQvWE48MXJRRfzfwdaWphXr2NYj7UL/29zfGgbFJH?=
 =?us-ascii?Q?+hildDIkH5PBjgLpzJwT9s7kY+83Ejf169yJjmRooHfwPobIg5nyB9Xmk8mI?=
 =?us-ascii?Q?tC4PA7dY+cYUgO2ZEyvUUUEux78wiOHaLxDacn53Mw2jnIcGhDoVZCJqnx1e?=
 =?us-ascii?Q?pZmtTpeqnssVNEqFdFPByewpznzXFWk+sRViEiJFPhPBucvU0A5bMJx1A3a9?=
 =?us-ascii?Q?QCKVQGi3aHcd3jY5izd8nKFmL0U9R9uoiH3oBuFbvj1nf4HVWY3DEPKyOoiM?=
 =?us-ascii?Q?tDxPp5UwnoGKvmlhjAcU1Ay2NVwsjskj705k1jIiCOyMvKYb3k4IRk8t3ZNJ?=
 =?us-ascii?Q?DkgswqoiT9TlpWceQ02zRT1pngxjJiEPXmMrBCCCXqmfLobh39RePaG7FnoG?=
 =?us-ascii?Q?Ig100uhuS8WZYVWjN0j9bsOdFMQQZm5/f3KHOHG/GqBJl54UgYa5Dj4KGeci?=
 =?us-ascii?Q?UY3PAC+Ty58Lq3KV6aX1UqR0/VAqfA4J/eTS/71bmS2ibpciZz5YriNMv7N8?=
 =?us-ascii?Q?Pp4U3dW9xhccMIRbVc8MUwqSbJUGBhm7Ak2GAkrDjc5d8bBAcS3RB7JQoAIV?=
 =?us-ascii?Q?/rIUdp485+Mdni12QmGojtSsdWGxwFug0NagrSKCkVXLA09lk4GN9pMIcSLN?=
 =?us-ascii?Q?HjkrbUf04YDYlmZzlT63c1IW1EDcCIU4ZZNK8jYzsF4l41KoSAuxiCPBlk2+?=
 =?us-ascii?Q?SPwblKIakYK4z316vzUXJoIGB9PMibunfDQZWeVVjYjtEOV30YMgMGKX8Stx?=
 =?us-ascii?Q?9NWjRZOEDY/Phrc8K9KgA1rnv1s8sIZ+Lx1IfPwy9oBT/dzc/bedEZ2bMHcV?=
 =?us-ascii?Q?LhWONuqHMjQyF80zCn73/+ea6a2gO2YMpP6BrH9Zy+vRVPjQ3y95z36M5kfn?=
 =?us-ascii?Q?VIdtbwzxZDUMcM32kJVT0WVoCuyqEHlSu+SnD/8bE/tWxWHZ3Xm0x6lp1seh?=
 =?us-ascii?Q?vqih7GU7+usFFcfAnmbGWmajtMsfpPmUZi4PejfwJ04UrzAavUTMx8zF9jYw?=
 =?us-ascii?Q?XdxZBTxJ6S62QJlwEYC6m8ae1ruaWHr5FEoOtaf9TejmMIQt3RSCjZK2/Vyk?=
 =?us-ascii?Q?/dba9lzaYSeXqj0/vdrfIl9juqEs0p1JIiWG0Lom2MBW/ahwTZ6zrViEcKWZ?=
 =?us-ascii?Q?Nqfdq04IuaRSzyRvJx7CtvrZmoQshhmVQKmp+N31Cdv9ZB9+FrHkJG9fka/r?=
 =?us-ascii?Q?DfOMxC/gOhK/So+WxAfhb/zTrK7LQl5+SN46RfkMcqbHYGQLWd6aEv2tWpl3?=
 =?us-ascii?Q?M2LYdabm5zyb1zvQC68iuaIzdDECIR/K1NP1WSwcve90xlQb9+FgLYa5ROIl?=
 =?us-ascii?Q?tw+zrtytWnwAbzY2n/wsu283OROyka++2j3pHHP1kGB3D28AHjQ7ntLAV6ZL?=
 =?us-ascii?Q?uDK6QYxGTgHTchr8kb8f1lQmjEk1dxKYsN8uLb79GB6/aevJ8Uz1Q6xDFXXD?=
 =?us-ascii?Q?UlZfG+tLTSrm3IpHnlIF8Y4Xrihj+71c+BEwXDdsipzIbFBDrV0GMZdBb1ZE?=
 =?us-ascii?Q?e2woC4WSho2S8fA=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 05:18:22.9144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37106f17-9102-4b67-33c5-08dd39db06b7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 05:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210069

Commit f82d9c997ba (systemd: enable create-log-dirs) removed the
creation of the /var/log/README symbolic link by using sed. However, the
update to 257 changed the target line and the sed expression no longer
matches. Rather than correcting the sed expression, use a patch to
remove /var/log/README so that any future changes do not go unnoticed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../0001-Do-not-create-var-log-README.patch   | 30 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_257.1.bb    |  5 +---
 2 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Do-not-create-va=
r-log-README.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Do-not-create-var-log-R=
EADME.patch b/meta/recipes-core/systemd/systemd/0001-Do-not-create-var-log-=
README.patch
new file mode 100644
index 0000000000..850e356b2f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Do-not-create-var-log-README.p=
atch
@@ -0,0 +1,30 @@
+From 425ad51e727058b48dd4580fd6afe7e51e96a28a Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Tue, 21 Jan 2025 05:02:00 +0100
+Subject: [PATCH] Do not create /var/log/README
+
+/var/log/README is a link to /usr/share/doc/systemd/README.logs. The
+latter is packaged in systemd-doc and likely not installed, which leaves
+/var/log/README as a dead link. Since /var/log/README is not very
+useful, just remove it.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ tmpfiles.d/legacy.conf.in | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
+index b475500e58..650c91a8da 100644
+--- a/tmpfiles.d/legacy.conf.in
++++ b/tmpfiles.d/legacy.conf.in
+@@ -13,9 +13,6 @@
+=20
+ d /run/lock 0755 root root -
+ L /var/lock - - - - ../run/lock
+-{% if CREATE_LOG_DIRS %}
+-L$ /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
+-{% endif %}
+=20
+ {% if HAVE_SYSV_COMPAT %}
+ # /run/lock/subsys is used for serializing SysV service execution, and
diff --git a/meta/recipes-core/systemd/systemd_257.1.bb b/meta/recipes-core=
/systemd/systemd_257.1.bb
index e7dae83957..cdf72a5015 100644
--- a/meta/recipes-core/systemd/systemd_257.1.bb
+++ b/meta/recipes-core/systemd/systemd_257.1.bb
@@ -28,6 +28,7 @@ SRC_URI +=3D " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
+           file://0001-Do-not-create-var-log-README.patch \
            "
=20
 # patches needed by musl
@@ -405,10 +406,6 @@ do_install() {
 		# Actively disable Predictable Network Interface Names
 		sed -i 's/^NamePolicy=3D.*/NamePolicy=3D/;s/^AlternativeNamesPolicy=3D.*=
/AlternativeNamesPolicy=3D/' ${D}${nonarch_libdir}/systemd/network/99-defau=
lt.link
 	fi
-
-	if [ -e ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf ];then
-		sed -i -e '/^L \/var\/log\/README/d' ${D}${nonarch_libdir}/tmpfiles.d/le=
gacy.conf
-	fi
 }
=20
 python populate_packages:prepend (){

