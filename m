Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B676C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 18:10:47 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.76])
 by mx.groups.io with SMTP id smtpd.web11.1215.1707415842983994135
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 10:10:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=hcLH04YX;
 spf=pass (domain: ni.com, ip: 40.107.220.76, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMjOcv//GZKX9PSW51BhIHZwimDsQByHzuCraQSa1Xu01atFDRX402tkM+/DOWnDILNsXikMDrI6u3/G1ZHoavY+wnbfcXVGZIusYZF7oJqY41urFRxurefswJKU3EtF4yu7jyO4h48lPTiZSTzspgNJaYYHLwY62ZtENft99PcumJk5hhwLLWmqIzXIsO1zr966r0yi5IsSoctSXBv0HjmJjaI5BjFfBaDqU2HcXgTwKspG9oPb+2/v2J1TIAEkf3GjhNDvU3epiLan5cDKuxWrzPQDRncZBOJZ2SN78q+76QDsLcG92vL/fsb6Jvg60v9Hj4fBGdbfw3Fr8kdAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chlUUdoZpudk7RZWQXXJZ2N2HKoiUHmmQr32DZpXXCE=;
 b=OaFlSoj7b5llaPay37/0mN4HHnBlVoO8iG2FHkpWPfTIoL8d1G7gWhqToY3Oz2hTbyu1bgYxJtlMsY+WhNQ6hsKw4EUoMsB4oWiRHusHWJlNvMOCRq3RNEHUr746sRMDk0P66FKX9NOCvS0sdjAlGYdlQMSnLl3SKaVeL8dB5TgexteByD1I5Nq6kvBwlgstOpNwQ5lr7LeSAYe/+sV7npIpgp/pLUUA55gYIT1dQsa/6ZYIPbQC9z9lcZ478NsDWW/QNRRIYDM8wpp/epyBhBoh+9BR8RL5SmB4YpwHqW5ilqEwauiP6ZPNg3b45a4FmwtxgVzfvsiK1eIGsOs71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chlUUdoZpudk7RZWQXXJZ2N2HKoiUHmmQr32DZpXXCE=;
 b=hcLH04YXAz6au2RAOsWYS+lqTTq3TuP9t9xOO9s4806kx4hAoiLsZ4q4O+tVHEftZJubCsSdFy/PrfXAKHrMgBRQnSQJI28zFjK/tT8i5cihEoBbbumbrgL/DamE/D6unMviRu8JGZ58YKRzFzHBOmSaSpTIvS8liBPR/JdvEF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by BL3PR04MB8203.namprd04.prod.outlook.com (2603:10b6:208:34a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Thu, 8 Feb
 2024 18:10:40 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 18:10:40 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core][PATCH v2 3/3] opkg-arch-config: update recipe HOMEPAGE
Date: Thu,  8 Feb 2024 13:10:09 -0500
Message-ID: <20240208181012.1019913-3-alex.stewart@ni.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208181012.1019913-1-alex.stewart@ni.com>
References: <20240208181012.1019913-1-alex.stewart@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0074.namprd12.prod.outlook.com
 (2603:10b6:802:20::45) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|BL3PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 563bf0d0-9a72-4b64-5e23-08dc28d1426f
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wxb9Gx9ukdlqQUTGWqoJuiVr90GhU0Y9hLYbLBweHC7oNS2gKJjXuLgbls3NLhQCyXmsU+LV9xKImdJISW5ACmi99g4x7klMtHXmpfeCVBnG8bqSlG7vqLeiGAvfJohFlimTqoO/pEvUOuLmwQDoa6m+3sVpYvQHehyX/dax4f9Unm4aJSkldOF0ay/f3LHp9q6Q7EZgJaevKiPve2OXZjBx8t7okOsMqsZXmDWPqcEFnzTqo4InwmtVO7+9aBMX06RAOYx4Ot3MInhesQEzgLVHG957OJ6UHC0SI8QW3HCZB0UnYEZUdpW19cGen6z0gq1eMk1dY3oMJFixjV/bWHEF4Y2Dg5mWVJDDFKo7qq6sVNlpK9IAp7A7zMTDOW45WfBcIohrGGauSzQKlylzguHLkc0hon+Uqm14Iky3K1GOzqGJtFFATSe3HWrxVPCQR6iSHNVfOQqVID+ngXrVeDbTushjoOkVCC9Z4FkuY2/yXV4bPEJCXQ1zD6txADNGJA8o5/azoG9gElelxBvhNRZNKVizyP7C/TuGEEmyl3k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(36756003)(6512007)(316002)(6666004)(4326008)(66476007)(66946007)(2906002)(44832011)(6506007)(6486002)(478600001)(5660300002)(4744005)(66556008)(86362001)(38100700002)(6916009)(26005)(2616005)(8936002)(8676002)(41300700001)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m3KfPMexqR2GsPEs9EyETIv8Fm8SkVA7EpQR0eeHTwBYlx5yy5kN6UBTKs3a?=
 =?us-ascii?Q?NcZ5iqlm+BwXd0MuX1bDANMUKREmvj8L+GBzeW2paq6ZiR38hpCM2cjq9gmn?=
 =?us-ascii?Q?UIt3E0dB7qaQY/e3LZ9jDKplqEbF0ID9HRA+FSACt/hCVHxkX/rwjNDcX7Ar?=
 =?us-ascii?Q?CW4fBLGy2kCJ0hbT8omYslpb3yzE5c2WgzGj7Y3DeLLQMTP6w0Lt3P1v3/v+?=
 =?us-ascii?Q?Ra4W0zAvdscUcvWdllRsokxDJOklPmQhaDPqlgWGC7ztETooHPE5goNIOG5t?=
 =?us-ascii?Q?nBP6M5z5zXt4pVN/5qau0HmE5XX9kGzry0Ms4+VwKEpxo+wHCOc+ixNJ+1B6?=
 =?us-ascii?Q?tOCnjHUUc1P9D46FriR53Rml4kzbQVdANYz3+ivhdvl/nhYWaCGcjXGmNCpg?=
 =?us-ascii?Q?z26J9grJJZ+JkS5KJbveOhDD2JeRD1Ed2RgsPiNdiJvzx+bG1ddgwF8I8jXY?=
 =?us-ascii?Q?4pC8OOusNpIvYNTtUWA7SzVdcDPb/wIKT2ECxWAWFDwrEMYrZDBB+c//B5Gg?=
 =?us-ascii?Q?Y7FY+G0rqX8t+a1vR0bmPFTdalH9kaVn2RBOrXVKm6L1afWcFr2GKHcP/Dxk?=
 =?us-ascii?Q?zPTUi1TlG7NGug8KMvxqJapzU4pSA/j8/f9RRz+g8FNq9O+To150KtpBRHTa?=
 =?us-ascii?Q?VOlqAU8A8ezNO4GvhY8LoM92mYPIuU3I8b6wicVH3c3XgsMKJar1j6u5aSAj?=
 =?us-ascii?Q?hnPOlHHviXFbAxt2Lv5RRImycc8yevjg6G6mOSv9CT+MlWsZ5n14AZ/TOhgC?=
 =?us-ascii?Q?LUk5qV3n/ppfNTrctvtR1TEWsI3ovxJKUt3R0bkFO2aMG9t/t7LgAwyB/rYh?=
 =?us-ascii?Q?YK8BjV1f0BnkIaHtkqHpUU9FvcBWTcJvZ0K74JvHnFeys4vIYui8IubLiHt7?=
 =?us-ascii?Q?QrwsYOhYhmq02a08cS7kdeXrTBUOG21hZVHeJC86/3uZ/vEU1OvJrXvaUFfu?=
 =?us-ascii?Q?pPsoyd/wtYqzDCSjrRe1jwDJv45P39EKTnfQaS83j4B5HzpliS1zMsyCqeIm?=
 =?us-ascii?Q?Vqw6IhGJGxrKUD2CbKwrOyvMxZ8j42N2dcOePMK9v7hQQltCA+YSRL0dzoqG?=
 =?us-ascii?Q?TazbXGXjOOhTMpAxCcc/Yyg5iMoiAEkzbsqfQQNphBWJa50L3oVbAd+h/I2y?=
 =?us-ascii?Q?UnM2TW7Bw8Tv9I1ki9I/P07v0xwsc6EVScj8Gf9R/Lq0EhPXDi9mJP7f8eDa?=
 =?us-ascii?Q?DG6vtGSqqXyHUTc93XN2J6uJZGyaneJ7MJC8sbrXjBIovh+PHH4RbGVTI4FL?=
 =?us-ascii?Q?PNBCLWLgx+kT9J4FEz5yxhCS7fJKqoiv37jGLmSEeISdVD82Pmp0Cth4f2Wo?=
 =?us-ascii?Q?2jq2pNqzOeKhciBCwgtC9o3P9owsG7TEmfXIPn6DP0hLtc2ov72y1gAxGAee?=
 =?us-ascii?Q?ZdDinxzydBY7WWm/GmyKra4ZARtazPz5fR//RGPQNCXzYvxGejdTxsKWHPo8?=
 =?us-ascii?Q?NE5pPqU+1/9DrtArP7fbyQex1Z02t+vyAfJ2QptWXShDjsP7K9bUtLf5aVkr?=
 =?us-ascii?Q?PoQinhmlVUXN10V6aKbn+7qQGcGqbKnMd6btmwwF4K4l7kzyPsBfHAsJqauf?=
 =?us-ascii?Q?NZ9JwELHpXZTOPeo7oA62zEBaJB2c5jGyQF5bVNR?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563bf0d0-9a72-4b64-5e23-08dc28d1426f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 18:10:40.8738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8HibBFmWxg06qY9PwBAZEFDiN6pdYqgtP3PlBCIKXganScDGfF7bIBH64oyhipS2fZbUr4ohiei1Uh3RbWRYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR04MB8203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 18:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195170

The opkg-utils HOMEPAGE value should follow the yocto opkg fork - which
has been moved off of Google Code and is now centralized on yocto git
infrastructure.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb b/meta/reci=
pes-devtools/opkg/opkg-arch-config_1.0.bb
index dfd66a1168..726a259a8c 100644
--- a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Architecture-dependent configuration for opkg"
-HOMEPAGE =3D "http://code.google.com/p/opkg/"
+HOMEPAGE =3D "https://git.yoctoproject.org/opkg/"
 LICENSE =3D "MIT"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
--=20
2.43.0


