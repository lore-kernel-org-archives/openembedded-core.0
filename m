Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.79])
 by mx.groups.io with SMTP id smtpd.web10.499.1611869784744274575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 13:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=p+brtr1r;
 spf=pass (domain: nxp.com, ip: 40.107.15.79, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJ9HRJClX16odJLQNhPa05CDlWLNcvHjyG8TXH7NRZw1WNrRwhJcWIbAQ1SZEk7A7kXTWl7JEr1HHmaNkgTYM5ZQ4Kn9Dlo74fh/aSpFOOwv8lJdMR4dtcDTtGUUHaOtq/O8R9Lt/Z1yDskyaUOz/pNGxrcDQ8sHmRrm4sDSWzdFmxH/jcRk9KKF3Ck/buTs3FQ3BYu8Z/xfGzAiabbV9ve29RXRY1QkkGAB8Vz1KfydmO/kc6+BoQrydSxbGvSxhPxjKF/t/osQikz7jFMQuGGbuDbm1nDAXXkaOwInHXcL9mIYAlgGm0wcXLp0j3k/1nRSi/bWz27WayxqFPScEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iZijbeFmDta7V0BWaBA2UiSPw4ZoDGJmWYB1T4G3Og=;
 b=EOkzdjR7AJVrHuTo39F4WJJMEth3kObIRmT+IJoAkWMgIbwIioDQlv5uiabpzUyEcatHnoIXqj6IkOCwgZHhPMhiuUsYK5GpiAdER1hMxBmbKv9EBOeXwioHD/c7fmq7x6CWtkeeUilrB/IPJo96FwRLUualORS1cDr7FJyEeUO1SGiEgnNAgWEPvD1zzy4a39J+jqb6RGBlZDp4jwnkSCGiOu5wUxC2mpXcuotWuJUH1G/8jVisat9/yyu4z6Qq7gahmX7CINQeQdtQ5bh3wrhHA2qJWrhkx00WNFKsCntNGpitxIvBEnNzA+h44/x4UIPpt2zwpfmnj8T0umH4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iZijbeFmDta7V0BWaBA2UiSPw4ZoDGJmWYB1T4G3Og=;
 b=p+brtr1rzC6VC3sN4sBiE9fX22JKr7GqlTTMAFAe9PslJULorAomjGJoNRgMvHAey8QmBQ3r3zX75WaDUsE4J2OsdeXeGmukCKaYdVi2ZNjulyA6cCo1iYL4QDALDkZ8g1ylm9Xd4UKVhZFXh9tb6g8Otr/AcETgC+07Y3S2Fgo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=nxp.com;
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DB8PR04MB7098.eurprd04.prod.outlook.com (2603:10a6:10:fd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Thu, 28 Jan
 2021 21:36:22 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::6d05:3fa3:ad9:abdb]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::6d05:3fa3:ad9:abdb%7]) with mapi id 15.20.3763.014; Thu, 28 Jan 2021
 21:36:22 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: otavio@ossystems.com.br,
	Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] [RFC] openssl: Enable cryptodev-linux by default
Date: Thu, 28 Jan 2021 15:35:04 -0600
Message-Id: <20210128213504.3821-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [192.88.158.246]
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To DBBPR04MB7753.eurprd04.prod.outlook.com
 (2603:10a6:10:1e1::5)
Return-Path: tom.hochstein@nxp.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv07069.swis.us-cdc01.nxp.com (192.88.158.246) by SJ0PR13CA0205.namprd13.prod.outlook.com (2603:10b6:a03:2c3::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Thu, 28 Jan 2021 21:36:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce67941d-1306-46ba-8b66-08d8c3d4c1ab
X-MS-TrafficTypeDiagnostic: DB8PR04MB7098:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR04MB70988EC84EF3C62C66ABC910E2BA9@DB8PR04MB7098.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OjJo42p2HswPQxtg2q4jbK3ERHtDMZqxjS0JTHRIEglix09kwU1nliU7kOTs1R+k8NjrhRLKS0alsNAHOiaDiC0A5yMSMRRk2MbyrguOIRyIEGIZ5HB7EeVXsiL0yn71zV0cC3neOgxtdIP2C01lnNTgmx1bRH4A3S7LBXuencKdxzhPTxQstFdB5EBWqjN2idm+P94NlecMz7MnpfQUGzjXknXR8zPENxJvOyPlnnpQ27ZcnosGADAOWg9Rq9I3HAR2Ow8yeKWbUVkem37p+6U2M2B+flRI5vnJIty59+THYzebPkRkDwErs0tGM9S4ic8ZlCatsWv++TfxV7m95ru11DgnKU5qHg+kViLMr8jUAeJs6Wk6ADOh6kTtk2Baat9j9ahF7D5h72gBJzc71fvNYSfaQ2S/S+21ENCGtOSf5KTklen+OsLZmmxYSCDywRQFfsEtK2tb9fEwDahr414gKGE+A5eAsAH/jmdYdfCsblg1r35MnHKl+AYdibp+kNWR60z27DIq0m6taH26bg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(83380400001)(478600001)(6486002)(186003)(36756003)(2906002)(4326008)(316002)(8676002)(1076003)(86362001)(66946007)(26005)(16526019)(52116002)(7696005)(6916009)(4744005)(44832011)(5660300002)(956004)(66476007)(6666004)(8936002)(2616005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ExZzBmyX4k+76Las4lxoVF1TSpxo+irpsxY+vxj/v3s6le0mXxqxCBYEp5pG?=
 =?us-ascii?Q?fT0pa6axZ0ySUz15gJMwQ2NfINUr6sa3VuZWKC334nFG0PlrY6KWYvtUsm98?=
 =?us-ascii?Q?VDOL3rxf2+tBnkSea+stVcNddY/YuAxaEENZAEciR3IepoNMUOyn/khSCEsW?=
 =?us-ascii?Q?E3YEfsXEZi/vjoCfUlTc19aSH7vKoYZPQCPYsfPOUJTNDRYx96W4aip/NmzG?=
 =?us-ascii?Q?NjevbBwZz5HwAtIRk4QkDcfoj1L7eJ6wlMCOKSUI3bzu//FhBsnhRTbmfv35?=
 =?us-ascii?Q?QeCFY7E4VSP1+vDOyFL2KHaubbOSEVczOp+lBGzpoNQ2GiIo2UdviMx9EODX?=
 =?us-ascii?Q?smqppfC6uaOen8T/DT0gfS7QIhcdZjPrpuNP3IiezcbB2dZ/FCwsciC1rIEy?=
 =?us-ascii?Q?nHCko3Fhj0h9NBYhi6310EMZsnF0Vlz0UaWdRQPaTM3JTqOODXiWen1w733p?=
 =?us-ascii?Q?4HB7QFDRCTzqOJjY3WyX9T8H435E5Uxgtn7EpQgdrI6oXciqrKUOZ/wTKAQt?=
 =?us-ascii?Q?p6hG5MHSJfDOLHnL7156/ngB7+zxn0kM31Zz5t3l38bmZwlwve9MXLYZSN4/?=
 =?us-ascii?Q?dsGoYzwj7BBlfyLyVPtEI47Ity5Fiy3pq86ixcvg41Tb/nbmzAuUU/L/wcwb?=
 =?us-ascii?Q?XAcAluMVUtRsQJBeeLyFo6lwfiNe+ndsMhdk8ExhwEpCpW5bWaSph79TGuoE?=
 =?us-ascii?Q?dP5goYg15LNmrncurpb4A/H47AWCz4eBkmaV2y7KhvJdYsjsMjaa2ZWjp++K?=
 =?us-ascii?Q?lT6n2JC9KI8hEu+1P9JSogiWh4yR4ezEUx1xyX0D6D80S4C+APbkkpV41C69?=
 =?us-ascii?Q?y6OH9gF0412pYC/O8SdjZ7maUPg4Ot+GH3+zZzyWwhD3AzgXnhYHQ9H2VVxi?=
 =?us-ascii?Q?IZtZnKvRyQ+HMmByK+jExSs69i5IeRmttltSxblIGWKlChHw1r55LaePZlUs?=
 =?us-ascii?Q?tUfH/Vr475fA+N5HROlLie3efCUZGCSiSvjhMdNGq732vVgxmYEANzB1DZrN?=
 =?us-ascii?Q?8kGrUidirn9Tn5gFEwwZKPvlj/ucqlO7dAC3y50rYhQHqkI4dDF5HchkWUzb?=
 =?us-ascii?Q?p4TKjk6B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce67941d-1306-46ba-8b66-08d8c3d4c1ab
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 21:36:22.5550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6H+1bpot8p+fkz9AhUyCpBputxbpB6Al837mmH4pPJYDKDCkd80zlT1h+M8DaNXc+Set7A4ovFqk4DH3EVcGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7098
Content-Type: text/plain

This is a Request for Comment. Would it be a good idea to enable cryptodev-linux
by default, gaining hardware acceleration where supported? Are there any
unacceptable drawbacks? What happens on hardware without acceleration?

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index 5617f337e0..d4c19f1a52 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee0
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
 
-PACKAGECONFIG ?= ""
+PACKAGECONFIG ?= "cryptodev-linux"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
-- 
2.17.1

