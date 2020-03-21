Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.87])
 by mx.groups.io with SMTP id smtpd.web11.3336.1584768436244436711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2020 22:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=dDLCB4TJ;
 spf=pass (domain: nxp.com, ip: 40.107.22.87, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZQy/WJGS7LuD6QGjAO7jpSqZentAfMO+lRLEIAtHB40DQ5bnBubcH5m5+xDZ+O7IQrHtf6td6RaPRUavwi1VktJsCwD2kz9607TdiJmkPJiAShZ7wFldhwYg5hcN+0pfbJ2vkVh3lkTdOXiyKElzaL8vkbGthq6DEtBfh1QuzgsO8+0619nj2Q3BGVs2xDFiQQYJY39MVualZe5h1cwD6ggJsc2galyqq+4X9RcF3UIsw1wZ50SgXV5Mdjn4aMnJ87VeN2zSHhkc5bWBFFtYuVb74T8E8f7UnToW3Fk7sThHJxOulaOmKXrbmdUj2ryJRv+cYP2/omFIWTgzgasTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxHMuIkUtOkYicP55H0Y623E2m6WMzb7re7QzBBnnC4=;
 b=Q3SvB5MPVmQz2TlNGuE4wLy1L19csBaVv3B1XBSvTsLL//NuYATJn+jBJpkgNhcHdV+eg1PRqPEfjBtaiH5UkdDEVa1NOnSc40ztL2z2CG4dK8+5gV72SEJT2b8rtmgAklgMTHJghDAgBFr7E9OI992ZSjkGFaRu/8dUI4aLvG0zEmfTax1b+OBT3MR14wKQ6/g3CCLr2nKA7PBktOK/EGENbV+KZ73P24gwDjrDMvWba72f9QS1EAgPR84huEZ6OzWK2iMzlWZtdY6Y4Ihsc9YRjnCMJEufiHThEoXG+2zpg2E6Aa4kn9IbcmK25BveVTCvTlKEst4JHpv4NC6PTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxHMuIkUtOkYicP55H0Y623E2m6WMzb7re7QzBBnnC4=;
 b=dDLCB4TJGXpFdW63Uzpi8NjbKVJ9DHt3VHxp/D0+7JG3s8iU6VPf0bQza0RZNRMzjo8uMxS6sP9emgHJdtcfnEnpbPOa6xuIOzF7s/FzGWa36BMeR2q5HINZZmfzALn94UZptG3jHEMOpqvy7M2EX/O3eBLNG/4GO5nCu9cSIY4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
 VE1PR04MB6510.eurprd04.prod.outlook.com (20.179.235.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Sat, 21 Mar 2020 05:27:13 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::71aa:4c20:47c4:759a]) by VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::71aa:4c20:47c4:759a%7]) with mapi id 15.20.2835.021; Sat, 21 Mar 2020
 05:27:13 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [OE-core][PATCH v2 1/2] bitbake.conf: Fix nativesdk-wayland missing from SDK
Date: Sat, 21 Mar 2020 00:26:49 -0500
Message-Id: <20200321052650.24220-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BYAPR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::37) To VE1PR04MB6621.eurprd04.prod.outlook.com
 (2603:10a6:803:124::21)
Return-Path: tom.hochstein@nxp.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tx30imx-01.am.freescale.net (64.157.242.222) by BYAPR02CA0024.namprd02.prod.outlook.com (2603:10b6:a02:ee::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.21 via Frontend Transport; Sat, 21 Mar 2020 05:27:12 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [64.157.242.222]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c55cb79-812e-433e-8674-08d7cd5882d7
X-MS-TrafficTypeDiagnostic: VE1PR04MB6510:|VE1PR04MB6510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR04MB6510D4303145944365A4F179E2F20@VE1PR04MB6510.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 034902F5BC
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(199004)(1076003)(478600001)(66476007)(66556008)(956004)(6512007)(6666004)(66946007)(2616005)(4326008)(6486002)(6916009)(4744005)(86362001)(81156014)(186003)(2906002)(81166006)(8676002)(16526019)(6506007)(26005)(5660300002)(52116002)(316002)(44832011)(36756003)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6510;H:VE1PR04MB6621.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w3jkgLk+eWTnCTl5dUG0qrjTlCwm4XAbDkpDOns7i8AC/drk5ShIl+Z0LMavQF+gLUi4EIF4P6tiW0fQSr8jf7ds8PEaCb5XzRZXfPWWxhpu+RLqu8NfoufxYoaGcS4NABdAsIEaI1BA9dIcEMHGztzgv+PYs3Zmgy3LkEqLyKYzAFHTW/Gq+vjwVavlIXWvXg5gZA8sXfg1CiW8j654ByVREv4bjjo/9jCgenkrI+L1XDWdO/hSMEBFtJ1KCijIO/8jSATXMP3Rly/y9baasKyZ4vm99knyCUGkSEghZfmFp8WlG+6TMm/QjKeJ0VqrRbgGh0hFPHZwG+XwcCT/8hC8ST5CdLdcXh1l7W96MxaANqEuVJgSpO7+X8+W4MnQprH7D8wv+mXoUiLeox/CsQt8AD+UHOMtHdsPVEEsYVqnSQ04UTJ9VlKsqmLzp8gQ
X-MS-Exchange-AntiSpam-MessageData: 
	Q+vwl0I8sG2sKPrtSJwiu39j4WHnMlknfwChquC5fJBJdJwQLoPhYeFPPsT8P3xS7LVasoy6wjUNeEjd3cVXl/Hjny7d9ZZ2Su7yMiK/F+asTEQVUjJ+yfcTXExmP+ulRX2kOqrKWGj4SmkK5KHorA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c55cb79-812e-433e-8674-08d7cd5882d7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2020 05:27:13.5541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c83RVjd3qhoRjj6uBhkHPTZy6VRAhgrRxcTkiOkvGWQkAwOmB1S74/oFnkcZDkDfon7bha3II/F/Rzft7e0NbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6510
Content-Type: text/plain

nativesdk-wayland was not being added to the SDK because it
relies on checking the distro feature. This fixes that by
filtering the wayland feature to the SDK build.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4b544a22cd..e44de34a00 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -830,7 +830,7 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
 DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation wayland"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.17.1

