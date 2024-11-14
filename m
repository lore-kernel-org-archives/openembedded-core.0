Return-Path: <m.otto@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E181D68B2C
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 14:39:09 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.98])
 by mx.groups.io with SMTP id smtpd.web10.38635.1731595141103311832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 06:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytecmesstechnikgmbh.onmicrosoft.com header.s=selector1-phytecmesstechnikgmbh-onmicrosoft-com header.b=sqBtcTCR;
 spf=pass (domain: phytec.de, ip: 40.107.104.98, mailfrom: m.otto@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKcn5xA67OVOL5DhhOM14Ej6C0c4EAJorbviGF4vMLg2fsIOH9EOep7zX/8SyKe+TXp0RDsSdZWkmFec8oELD3qkh11QHe+hdOR4TqHzWi6rIumEudnVqK/mFcnlB9yqnXexqCnWCi879evb+oJTfeHUqmZp5ah0zTabVDBqn/9Yvr7uzcmCOqINTJLtUvX+H4MpftCb9gtFmnXN3zIGEHvHrXpSjYrxPf/wzf6Y4tJ3Jz7WkmSseUOON++FKuLaHK55yKB1pFPqS0LR30PEm3V6e4YRcvbTS2VZtnl4TtX59pfw+A63qUYKnufny5DYl9wIiTLHGc3yVJuP+NenMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YviCTBWFqBt2tqoIJ5PruVh9K330ocoYJ5AMQlUMNA=;
 b=QJMVNwF2L1kSoMu6k9ed6I9/qh0cegiejpkRE7iYVcIWLxuP4C/ELvVKaTTK9/Ogx4UuNF00RSbhBOxUc/CJ6OcVOU63hADFEs7Uu4Zj8tXAN+Di3Dlr2/8+eJEH0zHETp35HNYhMh9lVclSWUYoIIGhVzDklvmjwA3u6UNWbxuNE7nQtLBJ9VkrJipcsHOFJVHcHDFnAahSUdDSZkic8vz8l87DXma2ZWaJ6t2iahA4b/4OiJT8F8YFqYPb9e/6YA0k5BM/TM1Q9H4O+eh2w6NnWE84AYb6YTfrAeYSumhtPSY0edM38B4rqsE+REAg4QW51ZD2nGDk4D8NFxH66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=none action=none header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YviCTBWFqBt2tqoIJ5PruVh9K330ocoYJ5AMQlUMNA=;
 b=sqBtcTCRLVvOXR65enrGbV5+sP90cZep0w1xZscXTOwQFK5zxg509lV4jcSxdLB3g5bRlPPalnVsud4nJ4nNl9iDqu3o+gdUir7n+d8lYio1sNfk5LkNP5Q7HR7Be8rv+gF7qkGLTP/2gv3K946IqwFu4AGw9ztu8LkvGMylr8M=
Received: from DB7PR03CA0106.eurprd03.prod.outlook.com (2603:10a6:10:72::47)
 by VI1P195MB0752.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:159::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 14:38:56 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:72:cafe::f0) by DB7PR03CA0106.outlook.office365.com
 (2603:10a6:10:72::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Thu, 14 Nov 2024 14:38:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 14:38:54 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 14 Nov
 2024 15:38:53 +0100
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 14 Nov
 2024 15:38:53 +0100
From: Maik Otto <m.otto@phytec.de>
To: <openembedded-core@lists.openembedded.org>, <upstream@lists.phytec.de>
Subject: [PATCH] u-boot: Set CVE_PRODUCT
Date: Thu, 14 Nov 2024 15:38:41 +0100
Message-ID: <20241114143841.2946187-1-m.otto@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|VI1P195MB0752:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2be495-b7ab-42d9-e901-08dd04ba1083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?R87ojhaUs5eMa7rJKdyH9Z1Le/nhhcrphcCTcWeVd3i2yisJggdtmDA1lt9l?=
 =?us-ascii?Q?Rwb1ChoSckQpThQuG3VzqcXB0IMbdVSkLei2U1aQNmPI4tv5IqS4aWWJRCLQ?=
 =?us-ascii?Q?blwDSlGxW0T4wKjpTpzeWInWhGilS/COGEzJvfhajc/5mdd65bisvBiYWSZk?=
 =?us-ascii?Q?b8rne/DdEoO9rxnJxZTPYdlu0MZub8TZCf0WEL4mpVBgI8YH2IAi0MnybcZK?=
 =?us-ascii?Q?Fmzkf6kMUuJ5/NaOZHcn9ZCophrsHrF20tqiKAvwUJ6pDijKBNcnLGozWEOv?=
 =?us-ascii?Q?bubmeZsVTcAgbFF50oEvOk2mCVD4YLHExHRV7QBHmXfdGpR2nWATL3HCzrlL?=
 =?us-ascii?Q?IANFw/WihFtFAssHjCauJuNKgzwx+sj0cXraIK3o/ASThlLXntb2xfOQcT3u?=
 =?us-ascii?Q?Bsa/D1WOV9DSudhOcZ/9wYPzu69vy5ZffyP/uJ5XSVR3WO9gSvIPYiA+pO98?=
 =?us-ascii?Q?YHV0DM08HhXheKCMwA/VhlnU/8Eklqh65TD0BcZW1lLJzBIURYiVQPsMMmHC?=
 =?us-ascii?Q?aS9kHJJ/rV/TgmBcaH68HxdaSvTAUR20INr4tP6ulhSScX9+4zM1BUemgcUm?=
 =?us-ascii?Q?gsBZ3TeuMw4PHZ4qBc9Qw8KSvTFSkyQaECpbU1LmafRLl7ku94e9RV3PEU1c?=
 =?us-ascii?Q?cvOZXqSlZc2EkZV4Ot/fyV8udbRwViSB+IXRE6YGruGX8Vx6cCBQPbmCncTY?=
 =?us-ascii?Q?+KYU38Jb1UeGzzpv857uNVvwifqBMJYwF0p8HfZcJj8TKcBbvaPQUv6vfoT0?=
 =?us-ascii?Q?9xd1i2yUS0NX1VTjZQa0o5mW2OdfiXYvHR6xnneNoeq9XQ2SoWD+r1bM9Cdt?=
 =?us-ascii?Q?/mYggMoXbvQ8pbLJ5WYnJQhVhu9+8P3EPhyG0TL1TWXtM8PTri3khcIAQ4kG?=
 =?us-ascii?Q?uz5MHExMMCzv/t6e/lUJMEySDFvr/Dw0udACxl4N30VdphCuGOx0O6gAWPjg?=
 =?us-ascii?Q?omuI0aavterQwPeRWY8/zlyYdvf5nUIZHzLLdGLtgtxJqpJ008fiA4cbZ1If?=
 =?us-ascii?Q?3Mk7hzeHi1QA3J+DzVlF20mU6k2LbgaD1DAH1xSgMtf8xjFF08N/xcvuD15F?=
 =?us-ascii?Q?S19iQUQZuXcHymSiuMuLyHaz/vD1h6WVSeDJNh3XeuldgSm/eRGnFcn4kJ81?=
 =?us-ascii?Q?nxqtFWi3SgfWVd0V63CVq2mqxGPvVMYEkR28olcOMivCiKZD+BjTyH/f+YmH?=
 =?us-ascii?Q?O2+l859BkNOL5YSIQjdT/uvhDslUGtFFKdIP74HKECO9+BVQdPDF/pZLiCGr?=
 =?us-ascii?Q?TFWPuk0/T834ia3/nLJspLeNfGBUZgAuZki/kOX9XkOvNyR5OFg1ezmJD9Wo?=
 =?us-ascii?Q?Yovbuj/26kgGzrz6IIygUybdOmPEJwKoOydp6yAhGgsUr3qqdP3g9iUaFYmy?=
 =?us-ascii?Q?ZASEsYasRAOeYcNSZBduAhsZWN8/8+vk2car7WCCbNzeflKbcA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 14:38:54.3361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2be495-b7ab-42d9-e901-08dd04ba1083
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0752
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 14:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207169

The CPE vendor is "denx" and the CPE product is "u-boot".
Set CVE_PRODUCT for properly matching in the NVD database.

Signed-off-by: Maik Otto <m.otto@phytec.de>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 9100964c73..3270c22e8d 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -20,6 +20,8 @@ PACKAGECONFIG ??=3D "openssl"
 # a host build dependency.
 PACKAGECONFIG[openssl] =3D ",,openssl-native"
=20
+CVE_PRODUCT =3D "denx:u-boot"
+
 # Allow setting an additional version string that will be picked up by the
 # u-boot build system and appended to the u-boot version.  If the .scmvers=
ion
 # file already exists it will not be overwritten.
--=20
2.25.1


