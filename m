Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93F6C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 14:46:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.99])
 by mx.groups.io with SMTP id smtpd.web11.7863.1644590764039984216
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 06:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=i1j6cAVl;
 spf=pass (domain: arri.de, ip: 40.107.21.99, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aa4FDRIjd4cFrzrEPG5PJNr9VeS+oooXHWKEaPTDQjqTskKBH1oAJ8+qlF0V0iLefWe9g/wXofgDedvyiZAwNSW1lP7SDGW6MxtX4mFYoixTQkU9HOpM4wdLNCGcjksu/hGArTCfVHZovHBaHt+qsA2LUAZMgz0LNx7M6OklgV9+jdg+1fY9QgQg12CkV91ZQ/Bd3pbgD9qaEdHdHkKZDc3Im1k7ZCKIk9HLZtg5xNdr+C/EuwmmcpDkuueFFVV3MWOkyJkrrc5D9+AeLzr6zmIMfAjvg9cUOm7vq3yX15eeIBlU2IjOLB/aGQ1uYVCgCE/gueYHBTnxPRlvFNN2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrFtnaTxWIVrxhZZBROsmkyPJqG3QadMu5EyE+FIieY=;
 b=ea9cYH3WjENS8vvvslYUufo6c2FH9n2peHw7EWUkI6OHqkxfqMQ6t1BwhpHOp9G789hgz70ZLVuTJHjKbGz3ITHcqKHad/065PbaOy+ZLgEMnSFt+rSEVbwj2YhdMYaCl1q8Ac3GW5dyM0FCqafXTrT9CBbKr+/6S2Zz5GrIekTwl/eJkl3WvA1r+yLIkHdE8aAPb6micNFnHKafzYrJtKO7xwEtmLEZ+A3eItO2mbhV8K4YVGBdYV5LcsEMIQ/FzU33xQsrgOu7UgksLOi3lYATDI3NHHGQLhFTev/GLPQy9kF3Bl+med4e+vbdGUDMqOsCf5OxNGOKiiHEDys8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 217.111.95.7) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrFtnaTxWIVrxhZZBROsmkyPJqG3QadMu5EyE+FIieY=;
 b=i1j6cAVlJrnVCWz7VWafVY+LgfihxEOOCWYIsjvHRh4hQ97+f3hctpspDh+Txv+Q/QJ5VUhsXCZKiu8G5zoM5FhChmHjilGdzsdRP5hetOG4CLnsMDIsA1eri6lS18uXJgPjBAGnKFGW8ZzJwOv8SKu6wr2sXXOXZBi8jcd/aM8=
Received: from AM6P194CA0060.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::37)
 by AM8PR07MB7444.eurprd07.prod.outlook.com (2603:10a6:20b:241::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.6; Fri, 11 Feb
 2022 14:46:00 +0000
Received: from AM5EUR02FT009.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::4c) by AM6P194CA0060.outlook.office365.com
 (2603:10a6:209:84::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15 via Frontend
 Transport; Fri, 11 Feb 2022 14:45:59 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 217.111.95.7) smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arri.de: DNS Timeout)
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT009.mail.protection.outlook.com (10.152.8.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 14:45:57 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 11 Feb
 2022 15:45:56 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Fri, 11 Feb 2022 15:45:56 +0100
Received: from localhost.de (192.168.55.18) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 11 Feb 2022 15:45:56
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Oleksiy Obitotskyy <oobitots@cisco.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Anuj Mittal <anuj.mittal@intel.com>
Subject: [hardknott][PATCH] package_manager: ipk: Fix host manifest generation
Date: Fri, 11 Feb 2022 15:45:48 +0100
Message-ID: <20220211144548.24661-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.55.18]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5877cf25-4cbb-4c44-837f-08d9ed6d36a2
X-MS-TrafficTypeDiagnostic: AM8PR07MB7444:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8PR07MB74449A809E1145A2A8803EFBBF309@AM8PR07MB7444.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fb9qSHiWqX5aOfVFjHERCP7KHP2K3BIU1yy6bZkc663kIHFXRHm5FwhYRTzfMm6ikLNO2u9mKrR9c4SNTWbdYTMspyDNY/cobkgtp1TfsAndq0U31XXYuQNVN8h+GWTt/aKFbgcCcb7Db0i9JNjPScmE5eO79kuG5AuK5pJ4yBnJFZdOuPDhnpWqqdomk0S4LWeOhGnjjs45UKqKDf9U0Wckj6VePep2BX83iiVgIlg7ozY9GhDXNz1m4YZQgLJ/KenZomwMwC2FXRMY1asqDCM6q1Kes9leg4Ttv0Hp697NoRCV9jjyqNOAVrc2uIyv22wOJL9EimVnGQRvnPG4xahlhAseQ76tOkXQKd/TDLRWobMTH2Xus6K+EJjdOIyZY17BrFGvzGSjQr6zxCHjMijhm7oeliAIUkLoQEefcIT/vmF1fnTwHMC8I9FJbGlTiuZV/4vYNKg0N6bAi0G7stjuZG/7efdrERtvmRnMlOTSCQGp55zCV+89F6JZ3VjVnXOEE6ktGbhKdGYyukZrLhCbixNd11nSUnr51gyqECODMHGuxpEPgunsBffDEn3jrUNni32FKGNRGJgdNJ6IA695olswcOwbsALJAU+bnXS0aRCphDK2KBQ47UALcJ3R8RL0MLJUGF4SlSujRJ1soryt96DuMLatwkU3rSqAw/wltPgJI486/wm+wF9FMDur+5i2M0Ie73UbA+QfYe/Zf80S4c2xqwaZtyNol6k/MpxJTDoU7yzUMH+PJXo2EDXDh1aZQDYQk80vZGhY6GG2WQ==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(5660300002)(81166007)(186003)(26005)(316002)(1076003)(16526019)(6916009)(54906003)(508600001)(82310400004)(356005)(4326008)(8676002)(8936002)(6666004)(86362001)(2906002)(40460700003)(70206006)(70586007)(2616005)(63350400001)(36860700001)(36756003)(426003)(47076005)(336012)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 14:45:57.3049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5877cf25-4cbb-4c44-837f-08d9ed6d36a2
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT009.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7444
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 14:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161653

From: Oleksiy Obitotskyy <oobitots@cisco.com>

Since honister host manifest stopped to generate, i.e.
manifest file is empty but all ipks/files into sdk is
ok.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 79a2392f5d2a4cb6509a83afb40bca01bac59914)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/sdk.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 37b59afd1a99..27347667e846 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -115,6 +115,10 @@ def sdk_list_installed_packages(d, target, rootfs_dir=
=3DNone):
=20
         rootfs_dir =3D [sdk_output, os.path.join(sdk_output, target_path)]=
[target is True]
=20
+    if target is False:
+        ipkgconf_sdk_target =3D d.getVar("IPKGCONF_SDK")
+        d.setVar("IPKGCONF_TARGET", ipkgconf_sdk_target)
+
     img_type =3D d.getVar('IMAGE_PKGTYPE')
     import importlib
     cls =3D importlib.import_module('oe.package_manager.' + img_type)
--=20
2.34.1


