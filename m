Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D97CC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 14:49:34 +0000 (UTC)
Received: from GVAP278CU002.outbound.protection.outlook.com (GVAP278CU002.outbound.protection.outlook.com [52.101.188.111])
 by mx.groups.io with SMTP id smtpd.web10.14678.1741186066965257078
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 06:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@duagon.com header.s=selector1 header.b=diUDvmRU;
 dkim=pass header.i=@duagon.com header.s=selector1 header.b=diUDvmRU;
 spf=pass (domain: duagon.com, ip: 52.101.188.111, mailfrom: jorge.sanjuangarcia@duagon.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uW3mWeN0buFQlLYxbLPOjT4V1S1rQtgkQMQ31Rrr/RkvYnqutAAuDduXrEhSg1SpbBglylGAfNvJ6IdPShB743o3nXd4q4tiALwlk++I6cNgKk8TULt1S66R9WzyWm8Q9WxEf3LabGVsfmiMwuQu/i2m1Kt5JVjxYsUxG0EADi1DcRcMS6znnJEo36tOmGgm133AaRGLlaaWS3KgaVKyH9yiVwbYFK1evzX20GVJUz8834QHNVk7DbFzHgEZwpcu6laVhM3oqEh1nPIdite9BRUZWsCqdbSR8jUqxuuKpUzVmX6Op76YbrXy552xA/9SnwVzPjX1UecwAeVKf1pmYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyCVbra3FKfnlspFkn0w61OEvob+TTGyWGikQhfErBA=;
 b=VpCxMe7HSN95bBUsyJXVsoc/FWloQsHnxsD07y3phVHCEXhGMBM72QK/CoaAaEdqXUVXg/1LoAXRUWYmWJSyekKoajqt1rCr8b0B0U1x+ob1qY9ag4dz0TijcRBHnPrrp1Rk5MRqOBflOjemnxNMOxFbkFvDo3hRR0soFMI+RznqGvfpX2ZMRtm3L6IIEIBzrduCYUhTAkV18oyLKKsJNNvF3Hb0J3aTsDO6iH0o2izR20jekr6aZg5gPnkTytJCM8JbwMUPurT3NXhUBQ6dqy6Wupr2pgJ6We3HWofnZMXy2vojBTylcF+VtNXetx/MzhMA0nHK+eYlN9vKlirlkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 194.38.86.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=pass (signature was verified) header.d=duagon.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=duagon.com] dmarc=[1,1,header.from=duagon.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyCVbra3FKfnlspFkn0w61OEvob+TTGyWGikQhfErBA=;
 b=diUDvmRUthGCbDo1LfDbSJazUcOTvy3qfKWhsKwCLwI6smjJC7J1mmcp8NLDjGaebwaH6zPtGECqpguSRVlkcfu9DftSqJGJXYyPPHjC0y1JayNPwyHwy1q0WdMxROrL5P8To3pGwbDh21rMin7jXZzZ+JxcIO67terEqGqE9sI=
Received: from PAYP264CA0012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11e::17)
 by ZR0P278MB0744.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 14:47:35 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:102:11e:cafe::31) by PAYP264CA0012.outlook.office365.com
 (2603:10a6:102:11e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Wed,
 5 Mar 2025 14:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.38.86.34)
 smtp.mailfrom=duagon.com; dkim=pass (signature was verified)
 header.d=duagon.com;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 194.38.86.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.38.86.34; helo=securemail.duagon.com; pr=C
Received: from securemail.duagon.com (194.38.86.34) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.4 via
 Frontend Transport; Wed, 5 Mar 2025 14:47:34 +0000
Received: from securemail (localhost [127.0.0.1])
	by securemail.duagon.com (Postfix) with SMTP id 4Z7FlD4YKgzxpB;
	Wed,  5 Mar 2025 15:47:36 +0100 (CET)
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012053.outbound.protection.outlook.com [40.93.85.53])
	(using TLSv1.3 with cipher AEAD-AES256-GCM-SHA384 (256/256 bits)
	 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by securemail.duagon.com (Postfix) with ESMTPS;
	Wed,  5 Mar 2025 15:47:36 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4VdzfPrUaAdaJO7N3M85zTB6ZyCC5FCHXB37Wj3jdiVnNX5Ehd23EC3syLy7fdutAGTUsS9JW2AXbaPEo1tfKzgxTbRk+mPfwIUCh7PcJycimnqfUPS28nMo0kbH06Zluv2z5yd/OkDrMS2KMWMW/FyQIRPPimUuSAtpuizMLpgPo/32vb49HpabtOPfO73JgQAJUtJFFP4z7eF/mLjybbaZ6HiBxwBLh7nDIhszoFXPfpuVULdAtLZN6li6rZoT52WNaPSE8FQAccw1VyXgBS8gZ9bbn4zLfTKbE/7rDNImaNvjeZKi+LoPRZcfToGGQeh9z3Aly9nN/BfTN8C5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyCVbra3FKfnlspFkn0w61OEvob+TTGyWGikQhfErBA=;
 b=v1p2zrnG68PzmmWiLuhZ/7mXvjm4A4gluIelBGzihtjdjUXnPNYuMmAtTxkTyhDqDfNjphfqGUv3JNgK8lHuIQsKUR1Z5ZK1t1AZkMmHHHqNVP4TD5ZlqcQR+o5E2OBCRBifg/1sUSdPkkAhNVBO53NUckXBvrLNkw5ILDV3wto5V7O5E7+S+HvgRk+NxN54OMKUNlj/HGcbJALmF3lIZgCYSfOQD9lheTz84AI/M2X8np/kgYqq9BL5d4xFa6am6cCZily5MeTf6fQaV3iF9Qg5uDLqA8Od92l7geV72EcjoMzDS37/jKpqBAPuea9bGoViY01qHrMFoaG/PuYEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.222.204) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=duagon.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=duagon.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyCVbra3FKfnlspFkn0w61OEvob+TTGyWGikQhfErBA=;
 b=diUDvmRUthGCbDo1LfDbSJazUcOTvy3qfKWhsKwCLwI6smjJC7J1mmcp8NLDjGaebwaH6zPtGECqpguSRVlkcfu9DftSqJGJXYyPPHjC0y1JayNPwyHwy1q0WdMxROrL5P8To3pGwbDh21rMin7jXZzZ+JxcIO67terEqGqE9sI=
Received: from DU6P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::9) by
 ZR1P278MB1277.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:6b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.18; Wed, 5 Mar 2025 14:47:32 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::85) by DU6P191CA0030.outlook.office365.com
 (2603:10a6:10:53f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Wed,
 5 Mar 2025 14:47:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 14:47:31 +0000
Received: from ZR1P278CU001.outbound.protection.outlook.com (40.93.85.48) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 05 Mar 2025 14:47:30 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2e::11)
 by ZR0P278MB0792.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Wed, 5 Mar
 2025 14:47:28 +0000
Received: from GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ae7a:9620:b675:152e]) by GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ae7a:9620:b675:152e%2]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 14:47:28 +0000
Date: Wed, 5 Mar 2025 15:47:26 +0100
From: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Reply-To: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2] python3: Remove DEBUG_PREFIX_MAP completely from sysconfigdata
Message-ID: <c29e6b35-9b3c-009b-3ff5-25d57725da8b@duagon.com>
X-ClientProxiedBy: PR0P264CA0123.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::15) To GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:2e::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	GV0P278MB0516:EE_|ZR0P278MB0792:EE_|DB1PEPF000509F6:EE_|ZR1P278MB1277:EE_|AM4PEPF00025F96:EE_|ZR0P278MB0744:EE_
X-MS-Office365-Filtering-Correlation-Id: c0bdc091-c7c3-44c0-8df5-08dd5bf4aab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?/R6zOXblmWwm6COa+GtArgFSZ7/+owmMWyIh18BHpnZ4iLzk1zBELeVpVI/D?=
 =?us-ascii?Q?5pDayiYj82D470M2IlV+9W1ksaf9iSFLA/dbkwz/hMRw1N8mNST5+3VPycfN?=
 =?us-ascii?Q?0+OsdKFIwwHeD31gmua9bne/SFrCFaViTtnEQZVjSmTZ4rxUFm/3KjrRQW0k?=
 =?us-ascii?Q?jTRytQ5MLUwp2rTBoO1E0xaP87GPXSf1l2TyADkbRhZkUBhYnTtd1vARNdEU?=
 =?us-ascii?Q?fEfTAErO2t9/SztRG/Re4gLmHvI+uXYa/CfYS6MPR4zUj5YSvevt2JAgRf0L?=
 =?us-ascii?Q?E1gr8MrhyKeajNglvpUuQ6bdDBvsTlFUQwvTVtCgU5qUr0M4EewUCA3mjVFv?=
 =?us-ascii?Q?1zPWWxqWb0Q1ohNjOk7prB2q4gUOYfbd63o+PLn0+RdCzX8GMfj+IrK9/j67?=
 =?us-ascii?Q?pSydgrI2j7xuH5mtJm5CwkW1inryOSHzud3M1QDKnaqbMns0ugioZ+SnJhKg?=
 =?us-ascii?Q?SI/66dqjJKmZePivsY4ZHPbsO/TFPeUei6wlknWtdjyNEPjfEtswxMnum43v?=
 =?us-ascii?Q?bI3ixWXV8Cs4eKFHbNfeqts+k8jAOIroPgfCn/457nlSOuff9FT0xjpURA3W?=
 =?us-ascii?Q?5ijrzOse1vHJqiMklrynMu3ze0KF8k+l7X0Mvr/Ek0yn5G1scE2hKDfUvp6K?=
 =?us-ascii?Q?KUX6ayNqJSgf3cAoj2t9q1sGI5Q+ahtsc5//LrLH4C3Ju321USkFb8zxFF61?=
 =?us-ascii?Q?51InPRUifKwdq16iKlhjolPsnnwB2/TO3TJ80jMdegLbD3sJvbgQKm/YlkH7?=
 =?us-ascii?Q?awAfF6NTB3jUvolVqj5rIAOxsaoJC0kQimttdrMUjrzdN130rb5JP6qU9eNj?=
 =?us-ascii?Q?adRX5j6PdR6moKubPO7FnmsgDMIKN9pI1lThwRPWaF+yXkcI8zCKgSE/W7kt?=
 =?us-ascii?Q?h5fMOggZXKF31BZ9U5Zk5yhhV99Ph6iFdS0R6Afb1hsB/nkzUuFtwwVkeDQc?=
 =?us-ascii?Q?egqcLwcJDbXzbc/Mz62C1Q+NJplz6uupId/lUlUSh7z4kSbeCNCiD/I2AHBG?=
 =?us-ascii?Q?k0NGP77McjbVVrHZI4qaV6Uro9dtYYQcfT/GMB62b+MMl6VmT2YIjYCTrPg6?=
 =?us-ascii?Q?smjzC0SBuj81CEh1hxS+OnbiznPbEOVtB9yXdKkbJteBwdHKJDEHiR/mgjbH?=
 =?us-ascii?Q?Hko5JstaVWA0vEom+Q9fJR43CobcsnOOcn92Jbwk5wB3bwmBRZfUNFjCxp5O?=
 =?us-ascii?Q?qlbVRPdUDhx5qhw8NxioHs89RVK92lEJDtSUuzAyqxaHnYtEQJfobJDMjMdI?=
 =?us-ascii?Q?2/hdJW0p9X+WffTijOvYRsfLFNdCAw4XaV3iBnL3qexXxGyxf+kguEI3hiT4?=
 =?us-ascii?Q?1KuvwWvOOC3mDX7VlSoX11FGiTPIivKMveYTPEwf2rAwwgyKbXeZV46Y2S7q?=
 =?us-ascii?Q?Hn1bZNm1xFTXQAQANmkpeyoc578n?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0792
X-CodeTwo-MessageID: c7802c4c-afe8-43db-aafd-6e44bffaa244.20250305144730@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
 84e81562-e873-42d9-320c-08dd5bf4a664
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|82310400026|376014|14060799003|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?f1cIWP4I+Dfh00d/5qEwl1SPqIz+ExMBE//MT/nMp+aZnH+lKDzENCuCg53S?=
 =?us-ascii?Q?HQMfEx86LJ7P2OOgggi8pSyLawsraRI7ZqkMR7ycINANXlJ1sI09Se2jMZ9b?=
 =?us-ascii?Q?qy2R7sF7kH7uQXai7Fnp9Hgl8HsKgHxDHOEbPpdNjvqos3+Hxs3+JNiaG02q?=
 =?us-ascii?Q?5maObCnfjv9E2uRhDf6SOyeltPpu0dCwbr7wSOHvTlfvT747hTF5u0wX4ZN1?=
 =?us-ascii?Q?t7pZ0Q/0oI+KuK1C/km3wubZru8zWLWiDKKj+QLO3pqp5O2d0qL5Q5g7j45E?=
 =?us-ascii?Q?6LDePEjBbmC6kwjrQNc3bWdJ1E/TWOGesU7GLbxH/uEm9qjZp1YZcI0xFAXL?=
 =?us-ascii?Q?N9G0Lu2ZS9PZxJayAW6AchOSEaG3oKBfZlBuV5RHD6y8THN7kdW2b76znoH6?=
 =?us-ascii?Q?dgaWjR13cvllcok+GnF6WeHoZXh1shSw+0H8VDYEc8i66e5GdTMARmSo1Urc?=
 =?us-ascii?Q?bLgeRZ6OHQTMFwJniPuNfVp2D21UovkxxVYgABXBpRBXHIQC2aGwt3Snu9TQ?=
 =?us-ascii?Q?xw7VRIR5Zo6uvhthJlySRpPzhALIHOnEBoQG9B5ePSkEJruLfxz36fF72dp6?=
 =?us-ascii?Q?hh4JMTlaL6ryvHIi6hD0XFPu5cdbiEli5BCs4WZJ/MG8NNk5dTojH4yBiY/V?=
 =?us-ascii?Q?Vww+T7Z3R7Pfiq36Yp+qkhkd4ejeTV1wjy9IuGD+kVPyj0euCffIwVJDCvIa?=
 =?us-ascii?Q?RD+JRha2v6fywxYsY5sKGFCqyHfr3q5fO6qIFXTtBGrhkLlwCluKDHiNY3/n?=
 =?us-ascii?Q?DjhzAM1fDxjQzoZeSVkfoVBogE4MCu4vDS6RaVIH7iiUWvjjIloP5SKA3CV9?=
 =?us-ascii?Q?UQqrLGoFPBuSBGmnS/+v3OI0GkSIvRJglSJIvjTjrF3ent5RSQqDh3tg1uGP?=
 =?us-ascii?Q?tjFCg1CsRdKn7egnezd/2G4deZmwnikXw4HiTIEUEkWa7WfPtwR7UnUZmNYx?=
 =?us-ascii?Q?KYp1KZCBKpJqpncBI6V7deURkFygkOBiMa7PD8+7JSAef4CcmKOqipKIVTYd?=
 =?us-ascii?Q?fKbnic1b7GtRT7tedAEcrY/peidP+DfUVRbhp8I9LD0tyxjBjr63EWDk01zQ?=
 =?us-ascii?Q?BmGNWyrn0LjAtJ1ZzD++o3u11WQY183tX35XgnM6XMStc3dqL58Xc+tApOex?=
 =?us-ascii?Q?4WZ0KQIGeriu5odyj5xlr5rr8BwRigdsUNE+4BzbeZFLNyiMxuu51Djpm0dK?=
 =?us-ascii?Q?xnWqSWdhXkGhqBiJZSjMNjMH89vgLfS/sLaRPIRrBEjRrCmKFT3uMvacIw1l?=
 =?us-ascii?Q?CBV/1aHVSqRbMmzh2V2QMrr2ZZRr15tleIzZ/BcoLrWu1okGiiD9+KFTn5h0?=
 =?us-ascii?Q?NKmtSfw3toiMbTiwAuiSr6+uWV5myUL33X5APoE5tYcafmY0eF1lMhLkWb4t?=
 =?us-ascii?Q?+Wr8y9nipHsHzx21FQ+MtH/Fa+wJw6vbMATxWMiuAVbJlr8ef9kmqPa3lTll?=
 =?us-ascii?Q?aVg//NOKsm2NEnwTVAMvmSUlt/bTiiBYUl22eBjgKItljfYjkY3OIzavmRId?=
 =?us-ascii?Q?mdCoIjvivFfpviw=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1277
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a820d45b-d840-4d07-feef-08dd5bf4a877
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GgZM6CCa7ZUnOkTFYdGlHhvJcvD0+KerERQ4TMXx/vTtYfhuqZLsh3jbsglM?=
 =?us-ascii?Q?6NUJHBB6BKt7t61bEl/o43Mm9OI1zis7fyrrxE19zQAghamNsI6u7o2tGAw9?=
 =?us-ascii?Q?rlhMtYEKeo7U0zIdhHFoZeSUVta4WmZJXEbQdxHflwBbAwRE0dHUeFdRUpEH?=
 =?us-ascii?Q?kfGZQ+iKXcIrmIUQnM/GxIyj9hBRQQjNBXciHzxPegoOyPh85NiNXqjR6w/e?=
 =?us-ascii?Q?a4HduXa1RwPphC/C9fDdS6TXCaE1646MvfF84smAbX43n+Ir8e+1Numc0QNe?=
 =?us-ascii?Q?gN+wuW/EjnYJMk6x6yWpN2Tg7OUT6OT8GMc1UZBo2A2ygC7QFaE7LzAmMDGb?=
 =?us-ascii?Q?aCYyXN2vl1DI1Gpkl1ZwXkrNsoYF2Dl9FEPT/e26VH7j1bF0+G8lg7S7MMhM?=
 =?us-ascii?Q?LpL/TurMdSajC1EPyIAFoKvLj2LVUehnnNUVe3aftZxSnFGla9xZxYMjzVj7?=
 =?us-ascii?Q?wuRAQfzHajuB+zNGIeMI+chORlTCyDIcvsYk+epovN39R+pOOElWIPT7e+yR?=
 =?us-ascii?Q?O/ss0pn46lNR5AfdKqXgBrnqXKMXRotxW7YeLtp8wtEql5p2JanNIhh6wZFP?=
 =?us-ascii?Q?eBBx4rJluoox9P4Wa5cp4gv+0rQgftKAMKu28L2e/QRLTewJqvWl3aSkLulw?=
 =?us-ascii?Q?MwZgTIqhP+LXQYa9IuLUC0hMmKp+usDWQ5nclZY0UmznZjqmpC0ED5CRTniz?=
 =?us-ascii?Q?R0iPAUbYCzH3NdndIqIW292SwSZgbQmYydXgI1xm2vJnyanS9/DrovHW7+Zv?=
 =?us-ascii?Q?HI6I/VwAy10xIpO2dabystEvVk98jYwi54K8dS+hzf1EM1q0ZIbPOHhWMB8I?=
 =?us-ascii?Q?Hjlyn6+wlb58SjKf4o3OqcaYhpVL3siPLDoX8Ra1g9x5hapGEtvboEfCjzXS?=
 =?us-ascii?Q?K5NDJXDmysl1NJ3qCgPfj1QBeMPF2iFGEoDUbYqvaHAxGHdR/fqOBqdAVFEF?=
 =?us-ascii?Q?Vu03mCbLaM7ZRUYMD9uFcPlnlhRUqRP4XPgTQbT36HksTDZA6EIUZmXz2xTc?=
 =?us-ascii?Q?SbO6xTDx4/7Eey6D/3OsXjW+vk44H/ET+kfLNvoPn0nsGZwIaSJsxipwpPZE?=
 =?us-ascii?Q?5PyTtpkW2itBSaio5RQPxCtIRZPFUnqkF1Ckpk3+CA+hn/JogXjpKnIY0ccy?=
 =?us-ascii?Q?6j9Yt9xnsoWizd5pKYfDx0hgE5wl1kQki+PQNd6Ml3U6DeFIWiy96V/rYA6N?=
 =?us-ascii?Q?4x7/7hlBa87IcF8HIIRGkW3mJgE9Hh+uJC+xloKEHqTbxXcYubJly0yaClW7?=
 =?us-ascii?Q?rcbClocwzHBo54mqsuXkDHO6RULURu7jRBjDpUdjb8ahMbNPvbv6Sf+IJvMg?=
 =?us-ascii?Q?2bnkwBW42F14twk+ENNtdNYnj7AdpORIKd6GKu+7a8Z4Pg4AuEvkzVGoEnum?=
 =?us-ascii?Q?sL0fYvrRnG2oX30Opc2GjDYxsRcxf6FJ51CkTBAmbGc9SLJz5NaNzG94fJ9L?=
 =?us-ascii?Q?U/Kv6WlEBsyzPPyFH7d2oXFroTcSKu+cuYbMPtzWjZ73jdh/PxZ0jpkscr/M?=
 =?us-ascii?Q?nVbcsYbtpwXI0kQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:194.38.86.34;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:securemail.duagon.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 14:47:34.7354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bdc091-c7c3-44c0-8df5-08dd5bf4aab0
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[194.38.86.34];Helo=[securemail.duagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0744
Content-Type: text/plain; format=flowed; charset="US-ASCII"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212319

Paths in DEBUG_PREFIX_MAP are not being removed from sysconfigdata correctly.

The contents of DEBUG_PREFIX_MAP is typically a set of flags defined as
space separeted values. However, the sysconfigdata build artifact contains
those as line separated values.

Eg of DEBUG_PREFIX_MAP:
```
DEBUG_PREFIX_MAP="
         -fcanon-prefix-map  \
         -fmacro-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/Python-3.13.2=/usr/src/debug/python3/3.13.2 \
         -fdebug-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/Python-3.13.2=/usr/src/debug/python3/3.13.2  \
         -fmacro-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/build=/usr/src/debug/python3/3.13.2 \
         ... \
"
```

From sysconfigdata artifact:
```
'CFLAGS': '-fno-strict-overflow '
           '-Wsign-compare '
           '-DNDEBUG '
           '-g '
           '-O3 '
           '-Wall '
           '-O2 '
           '-g '
           '-fcanon-prefix-map  '
           '-fmacro-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/Python-3.13.2=/usr/src/debug/python3/3.13.2  '
           '-fdebug-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/Python-3.13.2=/usr/src/debug/python3/3.13.2  '
           '-fmacro-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/build=/usr/src/debug/python3/3.13.2  '
           '-fdebug-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/build=/usr/src/debug/python3/3.13.2  '
           '-fdebug-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/recipe-sysroot=  '
           '-fmacro-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/recipe-sysroot=  '
           '-fdebug-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/recipe-sysroot-native=  '
           '-fmacro-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/recipe-sysroot-native=  '
           '-pipe  '
           ...
```

Create regular expresion for sed that would replace every entry from
DEBUG_PREFIX_MAP to remove build paths.

Also, avoid having previous sed expressions that may partially replace
values from DEBUG_PREFIX_MAP with `/build/path/unavailable/`, which will
make the removal of all DEBUG_PREFIX_MAP entries fail.

Before applying this patch:
```
'CFLAGS': '-fno-strict-overflow '
            '-Wsign-compare '
            '-DNDEBUG '
            '-g '
            '-O3 '
            '-Wall '
            '-O2 '
            '-g '
            '-fcanon-prefix-map  '
            '-fmacro-prefix-map=/python3/3.13.2/Python-3.13.2=/usr/src/debug/python3/3.13.2  '
            '-fdebug-prefix-map=/python3/3.13.2/Python-3.13.2=/usr/src/debug/python3/3.13.2  '
            '-fmacro-prefix-map=/build/path/unavailable/=/usr/src/debug/python3/3.13.2  '
            '-fdebug-prefix-map=/build/path/unavailable/=/usr/src/debug/python3/3.13.2  '
            '-fdebug-prefix-map==  '
            '-fmacro-prefix-map==  '
            '-fdebug-prefix-map==  '
            '-fmacro-prefix-map==  '
            '-pipe  '
            ...
```

After applying this patch:
```
'CFLAGS': '-fno-strict-overflow '
           '-Wsign-compare '
           '-DNDEBUG '
           '-g '
           '-O3 '
           '-Wall '
           '-O2 '
           '-g                   '
           '-pipe '
           ...
```

Signed-off-by: Jorge Sanjuan Garcia <jorge.sanjuangarcia@duagon.com>
---
  meta/recipes-devtools/python/python3_3.13.2.bb | 10 ++++------
  1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
index 52fac76c00..e6922f74fa 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -206,10 +206,6 @@ do_install:append:class-native() {
          # tarballs and sysroot creation.
          find ${D} -name *.pyc -delete

-        # Nothing should be looking into ${B} for python3-native
-        sed -i -e 's:${B}:/build/path/unavailable/:g' \
-                ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile
-
          # disable the lookup in user's site-packages globally
          sed -i 's#ENABLE_USER_SITE = None#ENABLE_USER_SITE = False#' ${D}${libdir}/python${PYTHON_MAJMIN}/site.py

@@ -217,6 +213,7 @@ do_install:append:class-native() {
          mv ${D}/${bindir}/${PN}/python*config ${D}/${bindir}/
  }

+
  do_install:append() {
          for c in ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
              python3 ${UNPACKDIR}/reformat_sysconfig.py $c
@@ -231,7 +228,6 @@ do_install:append() {
                  -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
                  -e "s,^ 'INCLUDEPY'.*, 'INCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
                  -e "s,^ 'CONFINCLUDEPY'.*, 'CONFINCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
-                -e "s,${B},/build/path/unavailable/,g" \
                  $sysconfigfile
          cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py

@@ -290,11 +286,13 @@ SSTATE_HASHEQUIV_FILEMAP = " \
      populate_sysroot:*/lib*/python-sysconfigdata/_sysconfigdata.py:${COREBASE} \
      "
  PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
+DEBUG_PREFIX_MAP_REGEX = "${@'\\|'.join(d.getVar('DEBUG_PREFIX_MAP').split())}"

  py_package_preprocess () {
          # Remove references to buildmachine paths in target Makefile and _sysconfigdata
          sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
-                -e 's|${DEBUG_PREFIX_MAP}||g' \
+                -e 's,${DEBUG_PREFIX_MAP_REGEX},,g' \
+                -e 's,${B},/build/path/unavailable/,g' \
                  -e 's:${HOSTTOOLS_DIR}/::g' \
                  -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                  -e 's:${RECIPE_SYSROOT}::g' \
-- 
2.43.0


