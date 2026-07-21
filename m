Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3E4C44536
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:48:55 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24646.1784645329682773311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=DZsWJzPZ;
 spf=pass (domain: ericsson.com, ip: 52.101.84.68, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNgf62MNw1lx4SCMVfQAf/VNNP3zDqPZb88hI7Yaa/aHlrjDgRN7suE9m6UD+8KTTjUJZKlKPANBf1+Kaxm2bN1cBVLsp22bvKxTqlxDRUjBsIdUgIm5HDDyfLQuDG4vVCWNuBTwu3/5kRDPwEeZX0TbnczqtK5rCwD1G1VCcH7wa3NO6B1BOXh/ekajcHa++Uun3uTP0biu3RxlTtpyqfFeliO17/bwOuP3uIINPg0fFsdFN7EVnNtU945SViSKXxodO7R2TrHXrsp07QQr/k6VZfbHxppti5dJfNL986cJu2EG7IvtpNekHS/eXC1wnEYpV6UMzFZcG7tXIC/GEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQu4q/bdSNwAz3171ONyU/WVdtP/c/YS8SA1OuKGINI=;
 b=FXL638m810cWVjAamIFor6CoqWZ1pEH4uX9EZ+OrtQjEDI5LFfYX0awCCw54bnFZd0W64RmM434kcxcdjueVLs31+xxiD/pmB7zSZMyoH1MfLzIdKJy6rVxyr2o6hm/WNhuHIdRbjlV0h5XKQtdEcqTsE4kM8NivdSwXridgChw1LVKnlTGuScGHDoPlu+kafVL61aNvboIud3kzF8bVRYES5fLXDqoqE16XnRQ6g/rtwtn7/xTts4G4UM3h5nRidfFP7Vei30isdvkKDZTsKMzF1grQnvQvcrw+9RhK0QHmqb9/c3UFacsll+2Kxbd8bA8xqvwCcUjDbErwLe3/wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQu4q/bdSNwAz3171ONyU/WVdtP/c/YS8SA1OuKGINI=;
 b=DZsWJzPZZVo7Vn3MQzXkVqEp8uGRaj3O548AV/LkH/QJ7bnuUMUhy9wDHhjtUKEpO/T3ACqc6w3DHQLA72aVYRhbjNSZ2S3irhXyispbz4MNzZkdX1x6TU9iVeSFT247/s80DnBcCPcKtejd/IgiUMDFSIlrhtVn0QliLihbK0Jtak2GPyjiam45zQg36GNgpEzJXjqLsGT/j9RWrwdw83RLbb21iB5u9EchMe8vb7SxMwaqJBPeyKXhFdgJLzh7e1YIGR0nyIK4kmGS6TX/gJmRqGfbjk1+Yec02vU0Z5YPz7LczL4vsyA2Cc3kGblst9eXbFJcHcjnmhrFWiQ8Pg==
Received: from DU2P251CA0022.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::20)
 by GVUPR07MB11993.eurprd07.prod.outlook.com (2603:10a6:150:35a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:48:44 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::5a) by DU2P251CA0022.outlook.office365.com
 (2603:10a6:10:230::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Tue,
 21 Jul 2026 14:48:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 14:48:43 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Jul 2026 16:48:43 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 506754021D8D;
	Tue, 21 Jul 2026 16:48:34 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 2344B700DBB0; Tue, 21 Jul 2026 16:48:34 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 3/4] cryptodev-linux: add +git to version
Date: Tue, 21 Jul 2026 16:48:07 +0200
Message-ID: <20260721144811.323786-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260721144811.323786-1-daniel.turull@ericsson.com>
References: <20260721144811.323786-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|GVUPR07MB11993:EE_
X-MS-Office365-Filtering-Correlation-Id: 184d21eb-dd53-4c97-f60e-08dee737298b
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|3023799007|10067099003|11063799006|56012099006|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	FpGYrK4iUkS2NniYy86W7bDoWVt4fZ8zzErsPI5+I7yknhpzxM8zQFgKVM6b1RTNbQx4eJT/tdjJ/bgTsR/H+h1+IHGhDYV/YreRmnXPVzIwY2up3FAgkbePmzKiXDryNKkUv0GbpOMVp5ovMGwetrtgcIRMAoCE+vPAUORDy1VpdJCU/vs7fsnabGH0zBvrfFXot2QbNIe4ey+91BT8qf4isRsrkZJcVoknAbDJBwIuX/+HKiS8G6ZdzXdXfrmH4qD80dk/d/fPD7Ae7O7FALLYz4RudBRXeUXPA4twM23BQu6y7szZTGAhovASWHZ7bqgnanBu7fpFNFRKK3emMsskctjq4MoU2CFzWFWWgf1tsSW8S0mMzNOrWLZEc+N2RbGJtn2DYEnppQI2NskhxUzDBs1rM12+em+ZybG+kkejlQgtpnEY6ocIWYnTQl+QcagSaHVv019Qtrni+REU4RvIkeq3Kx6N6W/I5dz0tLFnrcGQLzO+2ugj3Dek9cVmbmYFjlKGtk/LUVRqKqhk5qvGrFd8hsXlW/a8j6B3wzwhJhhoXaIwRk7LsFUat2/mw+ObDvJWee8/+aIUaJpRqOODZnc2xz7N45DlxL2s+CkmNhWj6RKFjUuVe+IbtcLUouA2m/cOsWwq4FOEVCMj9N5h0LNImdCfA9ZwPqPTCoNbT/zq1xWTz8VBB9VHdKBkBZ6euEsFjk4TNsmLNoUjYw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(3023799007)(10067099003)(11063799006)(56012099006)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TrDoDhSwGjAxshe2CzpDsurEmS1oTY9N5jaqvohzrZxBvTLwbkBJieoNkdAWHjU1o7SPEgftmdF4bIUhhQx+V+YBEpwddvX24cowyh69Lcodcjh6ObhZDwo1vmnwht+auuWGMkJI537eP7+UZOzbLeQ259vlacRCRAoUBXrMZ50skkGltEvcPTk1a4UdmaX2jZ7+HzmFi/t6rzU/SV3durfFcCeCTpxD8PrE2W2Ys+fPFIIvGRBFDdS0LkI29lkjFc+kTmiAFrXkzyns1AF3bbkhcno7IiEUunKaAQmPmJ+zyU4JVKw3dy9B8h38JpDrZVREZ5FAVaoY8XKRSecF32oQK8AfpQhNclT1bSKtRqZAFqnqt76s2v4aETSXzo+USG8013Hmux35iYXakMyJF+coTQLxpni42SY6YHqrf/ct+w5OOSpwELnfLi0NMIHQ
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:48:43.8579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 184d21eb-dd53-4c97-f60e-08dee737298b
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR07MB11993
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241547

From: Daniel Turull <daniel.turull@ericsson.com>

1.14 version doesn't match the SRCREV in the recipe

1.14 released on Jul 19, 2024  135cbff
https://github.com/cryptodev-linux/cryptodev-linux/releases/tag/cryptodev-l=
inux-1.14

current srcrev Nov 3, 2025
https://github.com/cryptodev-linux/cryptodev-linux/commit/08644db02d43478f8=
02755903212f5ee506af73b

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-ker=
nel/cryptodev/cryptodev.inc
index dcd5ec140c..8b209e92ba 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
 SRC_URI =3D "git://github.com/cryptodev-linux/cryptodev-linux;branch=3Dmas=
ter;protocol=3Dhttps \
            "
 SRCREV =3D "08644db02d43478f802755903212f5ee506af73b"
-PV =3D "1.14"
+PV =3D "1.14+git"
=20
 CLEANBROKEN =3D "1"
--=20
2.34.1


