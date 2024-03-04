Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80F8C5478C
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:57:50 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web10.102785.1709567860803909069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=iyW8isPL;
 spf=pass (domain: axis.com, ip: 40.107.20.74, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ph5D4EPnsImBBbHDt0upcvG+AXkUpBZgB9/fi2GmUGm646l/3ALjFBYRiuJ3Eur/Cio3GBnV4PrdawFTL7Mzlq2pB8mQ5yP1S21uPfxcCPBbklqo2VpLGfQz1vCc/VRMQS2R4TDzZzczlR6SecZiXpX0GMd1KFu2s49FqNkZNMsEoVuAF3hdMaaDgTKjj0+98vIOYAUMDskvtr8RaoJWyyCXbn6JR12OsjrczzKjkN1CH3n7q1xsdABB7bcaHVV97EOkn22woAonnHbwB0IaatY03MYQgkFwqKVKM6lKBo5zpdn3eRYsL8eAQldyaARGDvDbQVoNI4QCJeMllUi5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O84f0sHXDnEfLjBp2RUKRnOvxWf5aywaGzQQ7fy0PGs=;
 b=iCb7a3g7i9pXTS+Dod6m14RBPO6CVccIo0bx2mw3iQ/q8ooOG3xxtIhrP5hkWBY8/DOqy/0WPwpeyGbhQqHM4vb6JXbocnJD8T8sYfXUizRQLUSRFmmy0cL53r0Jor7CQZ/8XRSwFRiYEVz1+FLgJTiEQMn8tEUS1BoNf1wiGciQTLaKjogSwDEDSIiNhL018SEdMS4rRYoWjZf4qL0TMo2XeiJrJHVdshWGO+volDhyjlg5yJ2NFPDY0gVaUf1m72mY9X10INqH0Rj6t6/UKpdZL9BDl67RdyATMSWg6vBxtyKdEPTZRUo2X0ZyvjFI7g9pPo/2VfqMa16o1vzrtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O84f0sHXDnEfLjBp2RUKRnOvxWf5aywaGzQQ7fy0PGs=;
 b=iyW8isPLm3r/zkBWngBBU9PrxB89ceGk0NqzUw4RKLZvEig4bdqExyYTTDI3R+VtxjYkkYYZUtoa+Ppwp529uRVJxKpTYuNIRwBW6sp1BtOKoT6av2vP5ifAPjaEW+dwECDjeMOWdNR8juB5LDih5GG5N32XvbecTmTIKJ1Y00g=
Received: from AS8PR04CA0087.eurprd04.prod.outlook.com (2603:10a6:20b:313::32)
 by AM9PR02MB6497.eurprd02.prod.outlook.com (2603:10a6:20b:2c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 15:57:38 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:313:cafe::7b) by AS8PR04CA0087.outlook.office365.com
 (2603:10a6:20b:313::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Mon, 4 Mar 2024 15:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 15:57:38 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 4 Mar
 2024 16:57:37 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 4 Mar 2024 16:57:37 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 43007159E7
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Mar 2024 16:57:37 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 424Fvb7j2270055
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Mar 2024 16:57:37 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 424FvbYe2270050
	for openembedded-core@lists.openembedded.org; Mon, 4 Mar 2024 16:57:37 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] kernel-module-split.bbclass: Inherit kernel-module-dirs
Date: Mon, 4 Mar 2024 16:57:32 +0100
Message-ID: <20240304155732.2267310-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240304155732.2267310-1-pkj@axis.com>
References: <20240304155732.2267310-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|AM9PR02MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: ce448285-d9a5-49f0-62dc-08dc3c63d0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MpNQE5sAO2DyxV6StcgE7jeYpdhOc/gVGyfyWMi0nknXTFQ6TnxVAWcybGdCFDrL4wQhKlaVKBFX8JLHfR1GzeA0cElOHn0IscUTwQ0r+B4S52JhVD2hDIZVEtxMXtRIXIdoGzmzJRf4vm+0jnuPMg6QqvUDjVld2gqtT/b/ZFsMVLNqrdba/h6JrPADtiDIFsH412sucKBJ1exd3L7r7I9qy2+6sRHTpIFZewh3Uzl3sjNB+nY7ByzRoActBXuVAtl9lIJ9+3FzxxQg09KKR8+ocVVimungf8xL0S2r/vTK53qXBj/vzXkp3zCp5Y8+/gnZQ32wWzgXTX37aBzru15dqNjPUvJgTq/3MKJ54lJ+R9UGa5SWkpT+/DkqJowi1CRzTvKyw1mqsNWCyhVT32PsOYB7YpS4E9wsH+ykBUFOVNHtrdcJvOplfl8MI2jfhLnM84CPm5BbmatfaRpZPW6Z3t3dgK60ijTo2+vsyIRuDfcwK/OgPMnKchJZt7M3hTMv0KI6EYWxNmuaxHPVtkaAj1tIPb2PHhcLucdpEA4PKaE3ZBFJ4rgGrPQvfmBcjZEN8dLS/XRSu5s0uOxTnyAvwTlPC4oGENo93FqfbQGlGK/C39GuZqj88TYRfKKzeMZB9LcbJTGsRZ23WjPkANQ8GFGo+MuJF7pq4JvPZF/41URo70wK6pj8iSAIj10ySt/gv3w/WXbNlmfvnKx2/WR+AaWea2+ttM3xv5FHv/MHzlqLmrqjusfsilykVdar
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 15:57:38.2857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce448285-d9a5-49f0-62dc-08dc3c63d0da
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6497
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196610

The two variables modulesloaddir and modprobedir have been moved to
their own bbclass, kernel-module-dirs.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/kernel-module-split.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes=
-recipe/kernel-module-split.bbclass
index c1208d55e0..ce8e5e1c09 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
=20
+inherit kernel-module-dirs
+
 pkg_postinst:modules () {
 if [ -z "$D" ]; then
 	depmod -a ${KERNEL_VERSION}
@@ -30,9 +32,6 @@ fi
=20
 PACKAGE_WRITE_DEPS +=3D "kmod-native depmodwrapper-cross"
=20
-modulesloaddir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
${nonarch_libdir}', '${sysconfdir}', d)}/modules-load.d"
-modprobedir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${n=
onarch_base_libdir}', '${sysconfdir}', d)}/modprobe.d"
-
 KERNEL_SPLIT_MODULES ?=3D "1"
 PACKAGESPLITFUNCS =3D+ "split_kernel_module_packages"
=20

