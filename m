Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F36BC44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:48:55 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24706.1784645328093757881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=DP18W5Pu;
 spf=pass (domain: ericsson.com, ip: 52.101.83.56, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pghUOFnAwWl4bx8X95k2N0lj9WD2g005bK6B4XKbIQiTBgNDajgiWoiCmi7pj7/tCgYlw2Anlb9MHVCBMaUN+fqB0ScF9SuL21hwh4wLrCvzcx3xcxDNbUrDKs7LGH6Nf3g+wNJBDgRyWtzUwxBcBk1Xk/f38t1VItOP4u5FfG0UcUPuIwAhf5o9YjN3qFNEStjm2TpBXRILFSgAt3bj0A9MI0+SAqv5U3DMrzJJcHsq813PMChYX9t/HsJJ6v9w8xDI60rdPcf1qTHbGnY1QQIQHIgZmsCRZ3AaSPix7ylUE8H7dGdHFPt2Dcic+9k6VUsWkLDtEU7I9cqL8mAJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXZH0Fq1CCpMPHrWfwmRnU5Xrj2qlOTBWqwPcoCX9kg=;
 b=fGKloPVUCO4yEGxaU+Gw40Ta+vx8BV/nzjhvIe08CXMx+udLNPWrtHWXHw2BeIJhwdM0hpfxyf7lNhMq45AkU8NgVltx/iqLQ9xmwQx4oAlY2sNxYj00SVsxhQfYfxLVHhzOhbr/imd2GfFd8IouLqEjdnWpJ6Jm83Bt1hwWdJIigQvFaaUgXJYB5OGBQpQ5qAScnWWZBOHtM9SYjnDRMCZYMXYpKJxXuZdR5PGlOkwqyHe+1KVvxai40jet9XArEHGpmZ3/Ug4ijmUWKWUzmQQthhUDsbx+MU+msR4BQH5oHj75mMRUB8G+gkV7O+VbthqgkWEB9AOD50TJN4+efA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXZH0Fq1CCpMPHrWfwmRnU5Xrj2qlOTBWqwPcoCX9kg=;
 b=DP18W5PuwMS8wKrKEdr1s9Ig1i3j1D0h0Px+yNQPLHICtOIpUqnHiXg/mR9xihD7cvJQBdxBj6WR7M49DtNvlEzfzMWS6PLyXe53iKdwjxVgha5Iyt/qLrcsQZR1rkew4DqbMCnoDdFkejA87M5MoGVbQqU88uE5ykgZHCiKvLY6ciuYl1CsSrW6oVHQBzn+zNMqEHNbBBDz+Gcvwk1SzrmIxjd5BfNU1xsq09G00jBXpJGpOgEDNEOe5ruDJRSc8DaLwyskbNQv+/Obl5Jlqkabv0ScX2jwBmo+lEFeAbFhW00CMvCcYTt1BNetySRtK1/Kb/c2ktKwRm+NxnQ3rQ==
Received: from AM0P309CA0003.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::31)
 by AS8PR07MB7189.eurprd07.prod.outlook.com (2603:10a6:20b:25a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:48:43 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::8a) by AM0P309CA0003.outlook.office365.com
 (2603:10a6:20b:28f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.4 via Frontend Transport; Tue, 21
 Jul 2026 14:48:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 14:48:42 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Jul 2026 16:48:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 1C8C94020B46;
	Tue, 21 Jul 2026 16:48:35 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id E84AF700DBB0; Tue, 21 Jul 2026 16:48:34 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 4/4] xmlto: correct srcrev to point to released version
Date: Tue, 21 Jul 2026 16:48:08 +0200
Message-ID: <20260721144811.323786-5-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260721144811.323786-1-daniel.turull@ericsson.com>
References: <20260721144811.323786-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000003F:EE_|AS8PR07MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa082eb-cd28-47f0-1977-08dee7372893
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|56012099006|11063799006|10067099003|6133799003|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	0Qh39PAqS648KrgUOod9xxkQcZFkzTneLbmFa6q6sGcNa2JAP1KZCBsBlpvlqMQmIsxfIVV7ygJHCO4vTmjBohqEVDGp0UUg3uU/m5I1CSA8nr9VyoeVQdHXef0Uh7MtSTE01viW1gz06eed1TVdGu58dfH0vufKF/e63wllxIv1CVDKb/6t48hEfveW7HryfYj48wI4C1h9DYPKMto22bXPPQSkmkLhqs3cCM+qFpMBpdqXi5mcgfyHpw3MrUiBZw4kHRP76k9XfOpmWqWPi3Efbn8ZaD6+WyAE6LOIoDbOQJgM1XPhsdRtV/FL7UC41DPNVlyIdO7sep52Bu16bfHSRxbGGPxTziwAGbEyCUgIxC6cysNNlkZELB9M+lGuLMqT9B3J8sBlsBOZcX0Y2I11N6hJMNeC5ULy+R3KCTMgrGIfpMFjAVF6HQ2PlBvSmBbnwEv5j0HLq1QaNvONhDexD8cDSJas0pZz9h2TiYgqH1NvfB7Q1/2ezni7nwpKBs7Ma+rUjREfZi4q/10rEnnnPGEG0ttjwq2LuETq16NLicYNZjSS04lnIEKVP3IYhcfMZih/V46eBdkFOWnsHAY6svGRMwiDbvs7jiQpWrSyrfSKyZApKDLi9UNCHK4/q418wYAC6GWica+BReUt2A==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XU8C/xpUT9fyvV4ORNeHbaRfQejLTH7Q9l+z/7sSCgKw3H1nmcW+9XsQsOilSOfauMWJDs30G717DimC5d72x+CQ7OsQdCUZjC4ZmjoQl2nre80MfH503Z1fxwgKl/5UD/rZqu6O1/38o6BQT926KhJ9VwTdKifzUo6TJ34R4sYz1uA5TdhGtKlBpvOSiY88Tp26jul3xFOWoOFWOZ4fM8eKdQOBt6wxqZ+f9nRoPT3c3ruRRw3zx/lQsmDFZtYtElnCTZOzp5NtbNp5Xt5AdNx0lSVk9IlOkTc2z+CzRsTZ+0EnRMIIfmgqiMSOwGyOGjb/sWOTFiynSxT2svGg1P1stOD+x04i0up2dec1AF7XGQBcu2GBnOD7wah1nyHGrlcqOZc0NecdycfrVJcRvzEG1onLuC0NNV+WQoSjwIAyRA6GBd4mBxlrwbMMB1N9
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:48:42.2513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa082eb-cd28-47f0-1977-08dee7372893
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241544

From: Daniel Turull <daniel.turull@ericsson.com>

0.0.29 released has done Jun 11, 2024, 635dcd5bc8
https://codeberg.org/xmlto/xmlto/tags

current srcrev was 1 commit ahead
https://codeberg.org/xmlto/xmlto/commit/74862a684907ada3d4ed2ce0f8111adf626=
e1456

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.29.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb b/meta/recipes-dev=
tools/xmlto/xmlto_0.0.29.bb
index c26cd21dd0..29652bd7d6 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
@@ -6,8 +6,8 @@ LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f655=
2"
=20
-SRCREV =3D "74862a684907ada3d4ed2ce0f8111adf626e1456"
-SRC_URI =3D "git://codeberg.org/xmlto/xmlto.git;protocol=3Dhttps;branch=3D=
master"
+SRCREV =3D "635dcd5bc84a7b67a3a2050a179d96e1d3050b15"
+SRC_URI =3D "git://codeberg.org/xmlto/xmlto.git;protocol=3Dhttps;branch=3D=
master;tag=3D${PV}"
=20
 inherit autotools
=20
--=20
2.34.1


