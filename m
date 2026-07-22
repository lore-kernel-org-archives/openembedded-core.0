Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324B1C4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:52:03 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43524.1784710318734087523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=IuDnh+dH;
 spf=pass (domain: ericsson.com, ip: 52.101.83.31, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfM8RB7AJkeauubaFqK8iXXAmL/GlYZwxY0F9jvbXJ7nScj8sruI/eyfUdP4O7/GxEdBVEyiCMHfxTCTtIKihMxRneCjaoKo8EA7Ybcy6or65/fDQ0B6OYaScdbshZ2SKSm5Ocgp5PeL+j+qMbipuA7Ew396dqADnyfjaEYHUcOpFb2z9FgQ9QG4zOGRyNh2ExhwovW1LwuXG3UBzlMLi0wONOnECznApOQeANOksD/waYEOcROQPUc5ANX9alQ+vEDN99F19oyr8Vpd6r2+HCVulS/wYr5pB1ziPJVn0Dc6N0CkYZH6TihNS1msijgizzzeZIFuC0uLivrS3d9DwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vY67sooR97zYW5d9JD3Qo1UjcjBbNMwvSx+vpIbxXAg=;
 b=HQ7Rh2LSVQiO6FWNZfS8JcpV4ARUmMUXn78iZi2e9qohqDjvuqlTLTjVxqqr96q/R4GEcZsndT+H/10oi65oPwwwUhQzLVvOYSzP/Kf4+fmkQrWytwBWYDhXEcjlcys28sFYLCU2v4ZdMwmbIgcWPXSGw6eRoqxT1OuB5dBgpp/We1X975qtx/viW1RxkvumxR5xgXTFbq7MVaDxJVWWiGPnmmXRn6uEnL/qiCGixjDJ+V0r2TClhrYk3ZOxdgFsh6Rbw6f+pr72Bmq0NB7WpO8aygzydh7El5fjoImFYj/M1WiqEGpN13HXuA5G++1J7yefa26YHdB7aIdbN6qgdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vY67sooR97zYW5d9JD3Qo1UjcjBbNMwvSx+vpIbxXAg=;
 b=IuDnh+dHw0LqLiiUDVcBhgQF4Zqe7miFaMWph93HBNrUdTFL0nBJdrXs5S2vd6fSoIl3QwrC89NZIJyZUPc1rjPbOMD8MFA3S+yldcULoE3xlls20S74rpQEwpD/l+7FkUzeMlS7OvbocEIER55WvBN5XjFCEIwgyBaf+HEhiREOcv1TOZUcU8js9y62stJvT60Mb/XmwEGrC7QZF00b7Cpy/KeGNOoe45B26GBzFTTej8X6oTxj0cc5UI39FNLGWhgSby3KGFfHu/P8klfauIqp/97wrrfsI2OrHYSaw2jJ7KTriQevxK4oCJZl/Cp2SGiQXY5vJlN4x8kPmC3RAw==
Received: from DU6P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::8) by
 FRRPR07MB12228.eurprd07.prod.outlook.com (2603:10a6:d10:1cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:51:53 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::3c) by DU6P191CA0006.outlook.office365.com
 (2603:10a6:10:540::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 08:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 08:51:52 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Jul 2026 10:51:52 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id DE16595800;
	Wed, 22 Jul 2026 10:51:51 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id A44C5700DBB0; Wed, 22 Jul 2026 10:51:51 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 3/4] cryptodev-linux: add +git to version
Date: Wed, 22 Jul 2026 10:51:37 +0200
Message-ID: <20260722085140.2355003-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722085140.2355003-1-daniel.turull@ericsson.com>
References: <20260722085140.2355003-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|FRRPR07MB12228:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e7d136-f8ca-4ae2-3c60-08dee7ce79e9
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|13003099007|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	QXT6WMWr48et1cTkawSA3aty8kGfdNfXqPPn2lBeepy9ji/TvTMc0UWHHiYxXbxzH7oVTS3QjMiw03kW8YcWSzfgfrkQ/lYaoby3BxlQZmp97NPOuse4nIWPqv0cENnIXaydDp0s3FAl25Vj4K+osVydcaF2dxVt1mmYre3X1YJpha8R4Alshv+ioHxHeBRHsC4Cayv8EjSZ9EWMjgZYlBYd++3H2NyzcuZS/5GrUAQEniS9VrpDetwChK0wSvn0EZ98xnkSEutZxZpPQ6XR4r6NEPGeXmdXESHTmeHTqZdACl3srnpxDVTk3uJPxNjmYJEx/3hx6JumebHue2TA0/8MofDG4n0SaF+TQAnjfNaheNhdGRb7FBaps/lmg/HtV63zaFyfOjlJStR+jrrINDM6KwcRcJOkLrfPQ0gerbToIOlg3zle//SzP0TQf8cLF7T1960mAEJEeaCSlZYrdLEyraVz569dzVUpuS733PfdxuVTN4ZH7Z1xG03UbqztAJiWN8/UxkW/kW9dK8M7qb0dkFmfXbggm/d9sIubGDbE7h13EjYG5oeeHIaqYcn+i/prDYH9ftmPCRntmTtdixDwt/hfZjKyAVpurtRYabmaiD+egnM3bfLfe3JATY733F00DENniDFb3rDEWcE+hVGhxMoOSod3YkWneTdcGOcS3VwflVxu9fc6ff1FZUjM//Wynko0n+bHtV74q3AbQQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8sy7Pe1MahZlA5wi3oBv7sPwsPUHHbaq5BoMpyQdITEOw9NdmXGOyZq47VPDpHOwZsYbXT2ICW8zlFq5pfAJC7Npsi43HDoFOtTC2CKX+MP/SQHqUkHw7krq0NJEa744EQKE9uBYRi74EkJSTiYEds7BEp0g+rBIaSA5YWaDbBXxlAcZPKMZaeHnGiCS1VVTaLWSWcclh5W/uHCSvllDsfAVdcsieoK3Ww/A+RDSry62k84EGJk7Wkw6vY+LtHZfa9p4oxeX3+5IQVcu+f+SzzGk7NX4tUWWAlyv+dTz5Jni+1uieHgNLqSmpFe3KG8eGqaDcFLvax55LiOdr5K9fNehPqv6LzsEHkZJDVUDuUo0bRurl3JG4kuTvXsi7UzeDflY04ojNrnnVdDPAd4PrZ/VpTZ39nqw3p7s3JoMek3TvJ/mTitO8QF0/L7K76SK
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:51:52.6938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e7d136-f8ca-4ae2-3c60-08dee7ce79e9
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR07MB12228
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241631

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

