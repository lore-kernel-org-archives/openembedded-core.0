Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD6ED4415B
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 09:19:53 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9082.1765531189298111620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 01:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=YIud/Msy;
 spf=pass (domain: phytec.de, ip: 52.101.83.131, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKjaSemPRrrgJCQN2N1FrJiEN7S5f+TdDQ5UJ4zvwAKaorPsDBuRhpr2u3g3C0EsEqaF4+aJhZJvjhM8bmCCAlRJ3BgKj3ibB6RJW2BDdpHUgWFpfMX3lVOdPq8mtMGS1pyF37g17Omw0CYAPwr+sCarF1K+XuKzHU0Y/wNijCYrOzQ/8+n56wBx/wIDOWSptKrV0M6holbG8hYQ2IuTKMIr+24dU81DqOJRh031eAEK5mX6epDQB/3i/iv8kZV1ZDZk2BihWTyMZo5p22cjBeRcRAXQJKxUsMD/YSzPWUFPMwHtSiOwu3HWY3HtCYLESiko/BcKAXsfbvesWQcRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uV69G6dJaBIN5tSYCjC9GtnjIEgW0cHMrUfIG5v2fw=;
 b=kVkKQKBZXgTV8Hv/XtvWexVniSdwGJgtQ1bj/d6gmiMva+vE68+s2BhJ8Scd2SxCncT708t4qGOofJi8IRsm+h+L0/42ocAwCyILJ74gtuSsXvhoFUi9ig+5PbRgT6anOqbx/ZCulPtApDU1XF7vM/a8wDZXDLFqUbGmzUZDth1YQd2sjQclUr3Jt29u/7QJHpsnnlO+WCb3ycJcZjbJseyHYohzKJnXF4bBtdQMYdGdDTdti2lUk2LCGeUHQU4GNtJoOSPRWGAiFXw+v9ElQFRyLLYAQlV9DXvOACAqkmEG1GWyxuanRPKU704gdH9fU36+apjkxkAyi6cabPfipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uV69G6dJaBIN5tSYCjC9GtnjIEgW0cHMrUfIG5v2fw=;
 b=YIud/MsyDSLigoKQXPiMzpb7J0X5JkQKRwFrR63HK9L2P3xAaxBzki4sClknTKbO5R24NvfY0Y+FwAcYh/S+ZWQJ/totS/mUARCqZTVOpppmvbkQcRDIZVOxlCDaRzT1txDQFH+C9Gn0nzovbXxM9C2o7SDAXLp+YVhsUqa5PJ0CXzpnL6sh2ljQk0u0E4NGvS30kx6k9DvfaVsH82GiKEtvX7fLtxmR7efB79MXvy5n1xY1DgiK/1VNGRtV/+By52Aetzhu4ROh5wozem5oEallPm1kan6x7CbeCxZhKsWDtgu9mZWdOrdcnvlRgzmxgFeyr6neoRC19an++1sQsA==
Received: from AM6P194CA0011.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::24)
 by DB4P195MB1895.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:378::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:19:43 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:209:90:cafe::a) by AM6P194CA0011.outlook.office365.com
 (2603:10a6:209:90::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 09:19:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 09:19:43 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 12 Dec
 2025 10:19:41 +0100
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 5/5] cargo-update-recipe-crates: Do not import os
Date: Fri, 12 Dec 2025 10:19:26 +0100
Message-ID: <20251212091927.3741063-5-m.schwan@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212091927.3741063-1-m.schwan@phytec.de>
References: <20251212091927.3741063-1-m.schwan@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|DB4P195MB1895:EE_
X-MS-Office365-Filtering-Correlation-Id: c648a636-92b9-44a0-e4a3-08de395f95f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?e//3NOoOJZY1KGhtiCqP0nDa3qU3s8K7VNRz78if1z4ubAfkl8bZELgtMICJ?=
 =?us-ascii?Q?6s/8U8q63OkZFgFXNZTq7A/cZFsDXBhU8JWd4s12hI5U5cbsYy7r2MnxOJUk?=
 =?us-ascii?Q?hA9+0r7HtaUyMyQDuuHQ/dmZuTrj5RnXoaw3J3lQ/z8Z0G3JxPlK6tAtAGUB?=
 =?us-ascii?Q?ZfKKnLBD67ivKkyk+4QCUekhLrDSfBSBfUo4cW9fL5bX0G4oM31m8XGV/vdK?=
 =?us-ascii?Q?51BUe/OcemixFuxgOa9RnKEHKhMj3Ur2sVp3Fz9Wew6Te4I5100VbVi1oTa8?=
 =?us-ascii?Q?mQc4mWT5OmEgf6SnIHalMNkU38rMyr4tak1T4n7qgsy20lncssG+NzLtJuUl?=
 =?us-ascii?Q?WANtxpDvDr9einDO/PVWmc+cGXvBfXq3GFfq5T6X0sDsztCmViCrJtZ1IkWb?=
 =?us-ascii?Q?MQLgIW6UZ/75oiyro9aHHc3MixHLH31ax3IWxQWbGNibCMW2/CgD9TLUa0lc?=
 =?us-ascii?Q?z1FlWkBYKHJ5TgocGwZ05fl5ReMf/LfDh4i3kyyzJaxn3emhQ2PGhb16NVKW?=
 =?us-ascii?Q?IFzr4l1z3vX58Mr9T+ocmREBBcGefUmZ0JfUkfd7rPY0tlfXn8CzpskbtQjB?=
 =?us-ascii?Q?gXHGDOG3YHXKpCUAjVD4fj+CJzJlhChPqgtDNWrGx0GWMo6IiLBgMW+zsK7z?=
 =?us-ascii?Q?ca3bkLSio0mK6Idyfey1GgzQPA+y1BQJZ6fILCUdIqm31rBNwR0rOJyVPTpi?=
 =?us-ascii?Q?MdzfxK+b2O3gacG2fypvgW7pZCGa4IJHufbKywKZVX8NgWA9fOM61Q1lrhuX?=
 =?us-ascii?Q?y0g4Dm93UWxTibQOnrGl1IpdQHsrbJdRRz9JO7w+dX241347bK0Hhp+LtuPC?=
 =?us-ascii?Q?UY0888bI8eYH1OH9kxRW0scMOfLrwXRhugynEoeE5/BBkY/5oX14WOSwa0Ai?=
 =?us-ascii?Q?g/s6vAtpmYLIwXJ8U+Z0Gn4fAxv0w1L4QpbfSXyrTIgsqM2onl8qU0qkJByl?=
 =?us-ascii?Q?zTh/9CXzsquGLsWKVJkMBubUJw4bFGMUr/vgpMw/4wdu5/Ay+0BoUySclY1I?=
 =?us-ascii?Q?OMmEePtTz8+orALY+RMQgpUAghDEch1lHctKoaf0jifhXqDPIrkwg+cEPLZf?=
 =?us-ascii?Q?MtsjrOc35Ta7h9CTw6O7YZZZB3LoKL75H+ZqXksPneOHRdM+Om1JlJVfp9YS?=
 =?us-ascii?Q?+kDL99nfVcIjbowK7pOlUeB43iJeh6vCZ1GGrW/KOGZvpxq+S78OUlaumvew?=
 =?us-ascii?Q?/Ps08MGKHjvMb5odTB7ji36gVnKUfDVDVgS1mvZnnhNRsPFFSTkfTuxll4t0?=
 =?us-ascii?Q?vIPlsGKu6ed3nQjQ/+/swFCdJ9mPc62lu2C3Bxx44+IAryvK2kq8H9BtvLsL?=
 =?us-ascii?Q?cfU6/CniR8xZOzGiE2hMagRjMIJq2uIPbmPL43nLcQG6xT8XGkqHLC8sdfOn?=
 =?us-ascii?Q?Rue7v2a2W1IgfkWCCAcgjJ/E3o+62NEYNZ9RjGvM1np0L8licEZNf0eGdjC2?=
 =?us-ascii?Q?7rCEepSj1I/jhOv54fqNlW7L9QFcdmvVBgdPdlNcw17gSAKAS820EmrPTB6v?=
 =?us-ascii?Q?fhz5zhKGqz+0HepAK+ONeGzxN1uCH1443ln+exB2TWb0JZD9LHkg9bGWH41T?=
 =?us-ascii?Q?m1kAGVTRHs3Nxwlcebg=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:19:43.3171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c648a636-92b9-44a0-e4a3-08de395f95f2
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P195MB1895
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 09:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227576

There is no need to import os in do_update_crates(), as this is already
done before.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
Changes in v2:
  - Split changes into multiple patches, for improved readability
---
 meta/classes-recipe/cargo-update-recipe-crates.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/=
classes-recipe/cargo-update-recipe-crates.bbclass
index 6e933d3afc..be41579552 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -55,7 +55,6 @@ python do_update_crates() {
         c_list +=3D '\n'
         return c_list
=20
-    import os
     crates =3D d.expand('# Autogenerated with \'bitbake -c update_crates $=
{PN}\'\n\n')
     found =3D False
     for root, dirs, files in os.walk(cargo_lock_src_dir):
--=20
2.43.0


