Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBBDCCFA1B
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 11:47:56 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.44])
 by mx.groups.io with SMTP id smtpd.web10.40499.1727351272378386376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 04:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gFBYvItG;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gFBYvItG;
 spf=pass (domain: arm.com, ip: 40.107.247.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cpAYOXfAVfJID8mD2f7w1SLjr7BPd2g8HD7oEElwROyjxUVd/8o5qz63gjQPHreeg0Kc+NhkwBZEYbXycPORisp0Eu2JLD/cy7Aszdt0HWn7v/yxUTrlw5BFrQRca9aTf6MyIWofxX6QlYBugCeykqR1SYY0yMppYfIA6yJtAeP3B8IHZoZrkO2YSn8XSZbZiRCc/dZf/CdcXCNs0fFsH3pHKffuEpmI0KVQORoFSwwcKvCGM90ngTII20jQJDXHdxdt38SJNqwwv84OAENTdcvkaeVuilk0e2WAkiV57pn06y3RKzvqTbOtsmGTnyy0t0/fQ1v0zy0RUHUBqR9Y8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNvbJd3VWF2Iu8pWXaL4OZk5KWkeYzTP+LEtJwd7zjE=;
 b=pXhJ1Uygb853dF+Ok8giJ9cWhbsYoBgYk1zE0SXJVPpgwo2mJO3Pi5LCwVuX5C1AQ9ts4bf39MjqT2Oq31oBnzKYP/dzmrGVId36Ehdslk/Frrb2NBo32pvxhNbNQ3VPGBrR6YCrqjn+hrDhE7GJ//k1vAh0bORMvTcQ9GQOW6435ZOywoSVJhm/sAtEw2rTuGGNeoDQDFTIn7z+iJJgBzqYzFPEc5SpxEL+jymHmIqOWjGJ8u2OszQB6cmyDW68TFfBKaUgDY2gsA1k3o93CNp1a04b5ErdwxdLx0MZzKtVQzAt8f61FFsOy0d3KADN+qHf6tsHoT7BCAF949wNOg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=pass (signature was
 verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNvbJd3VWF2Iu8pWXaL4OZk5KWkeYzTP+LEtJwd7zjE=;
 b=gFBYvItG0GSZyecaoiDSLiFDp1nJkqBZzdIdloeIMvXfKqupMiWHCj9G9MHa10YAXbxvrrYn9soeDQH18EWznYjEKSlrAMAQAi1Q0axJdolKMntNEOce2ELlUMltOJi+zbqfLU6cBjs1XDaPL3l9J25pc7RX52471mSH8H7vckc=
Received: from DUZPR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::12) by DBBPR08MB6298.eurprd08.prod.outlook.com
 (2603:10a6:10:1f7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Thu, 26 Sep
 2024 11:47:44 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::6) by DUZPR01CA0089.outlook.office365.com
 (2603:10a6:10:46a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Thu, 26 Sep 2024 11:47:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Thu, 26 Sep 2024 11:47:43 +0000
Received: ("Tessian outbound ff7cc14e3a8a:v465"); Thu, 26 Sep 2024 11:47:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3933cacbbb60322e
X-TessianGatewayMetadata: BCR1JXX5dtyrnQ9CTtc+kQ3i7BLD8qVgS7wmqopTnMRLzEuEAtfsPhkURFJ1rYUz/ON7lsu0SsVWL3P9D5wIa2r+hSkeyS/9jDllkeuhYjErBbOw2Czdzz2C3Wkvu2uR+uvYW0rz96Jpocgs31zdWc+OTBoo8IGldkAOnKkbsFA=
X-CR-MTA-TID: 64aa7808
Received: from Lc0e40f6f1c68.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 42DA6273-3D88-4655-A4DC-4F266CC256C1.1;
	Thu, 26 Sep 2024 11:47:37 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lc0e40f6f1c68.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 26 Sep 2024 11:47:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRYXCSmAl6ku5GmlWJ5qOi0zKzluqMZEPZanGkvQsX6K5ETXjbugdEX94K5G5JFQ4DujGK6KBH5AVNIPeN0pr2qZk7p9RvkHDz+XtfXgk0UPe4KfJTpmdx1SmWX64a57ifzOmKwY+pU/cVUaYrw1kQOhyEQr/GsBUbwL1wKcCG9LzncceXnMsd6oo4OHfppYDTc51gCpky9x4zOodxbwpzPVazuIuj1T7fAMCD8oW54gc5y5Qqarz0LBj5AECzgmTXE943uEFO4sShXNyRKWYQK3nISwk+fOqMAQKN+akIfwvt4vvRxRjhcYIkFB0O/oNH7Uu9PCP+bMduhl2nXj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNvbJd3VWF2Iu8pWXaL4OZk5KWkeYzTP+LEtJwd7zjE=;
 b=n1TkXqkR1n/GszPfGndOAcybMj/wwaIgi4ZLpLIV5Fw0ntYBy6KFUrn9vZEJMTkDn7PQ2gCs5MCFHjdRJ9lp1PHxBR7GlvdOMRXii50uBE+2t4Xce4W4UanEJV8KtoSRQ3vZt/YLRw96Z9bRlUqTyCsdBjMBLwVhoxNNvQmnV0KSnM0dsoW0cWRSM/S9o8Dkw2ZUbg2jcoCuBcpGBM6nT6Y6tyOt/irr51sfHLfxUN0jqr18KYerVtUpA3jNRp4NprWqGG8ngWzVv6A9miiePqsppwYgmOxznuQfKI7G1jLfiiK183x6v3H5Dt//Uzfc1iCMNDPkyO+nCr5CgrfZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNvbJd3VWF2Iu8pWXaL4OZk5KWkeYzTP+LEtJwd7zjE=;
 b=gFBYvItG0GSZyecaoiDSLiFDp1nJkqBZzdIdloeIMvXfKqupMiWHCj9G9MHa10YAXbxvrrYn9soeDQH18EWznYjEKSlrAMAQAi1Q0axJdolKMntNEOce2ELlUMltOJi+zbqfLU6cBjs1XDaPL3l9J25pc7RX52471mSH8H7vckc=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AS8PR08MB6055.eurprd08.prod.outlook.com (2603:10a6:20b:293::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Thu, 26 Sep
 2024 11:47:31 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%2]) with mapi id 15.20.8005.010; Thu, 26 Sep 2024
 11:47:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] vte: Upgrade to 0.78.0
Thread-Topic: [OE-core] [PATCH v2] vte: Upgrade to 0.78.0
Thread-Index: AQHbDsoCRfppul2poEO/DBVjO0fJRbJp9hyA
Date: Thu, 26 Sep 2024 11:47:31 +0000
Message-ID: <4CAAE559-B445-4FDD-AA72-3C0B73B12B8E@arm.com>
References: <20240924213720.2885798-1-raj.khem@gmail.com>
 <20240924213720.2885798-2-raj.khem@gmail.com>
In-Reply-To: <20240924213720.2885798-2-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AS8PR08MB6055:EE_|DU2PEPF00028CFF:EE_|DBBPR08MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: bd551829-247b-438b-a06c-08dcde2108a1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?Xc2ZbdmHTKskVXe0yazXpEO9x/STv1XNvnifY4EKmpZPDP79slkbpHBYSFKF?=
 =?us-ascii?Q?gRWOU2IFA6MlmFTpxTXyBKEmxmP+atPqtr2rbN1aFmurM1bwHoiPxcffwols?=
 =?us-ascii?Q?TuQ1mdKkFxN0aLXVPeRDrA/Ji/Sy05c/SxvJx+AL6IIUGXAn6HfmNhs/0u3u?=
 =?us-ascii?Q?EcR9+oH/07mveC/tpB9i1BXqKrva1nH4KJJAsW85cfFPa86OA3UVuuKnMqag?=
 =?us-ascii?Q?D7sZg3fAld+GkXCfGmTO/R/LzpOdZ79bhzkLslJ8LVPonlWuXcioY6daC8BJ?=
 =?us-ascii?Q?LAdxIBjLYVOWtqCUPfHHEbil4j9HPSmjs3d8pfBIqAIqrzCvaGQnsMYBxzVB?=
 =?us-ascii?Q?prhpgXrvH+7LgXsRwRYt/3cPL5soPoOogm7/FPA0M1TJduFMMJJejh9qpjCw?=
 =?us-ascii?Q?tp/DHRwpVK/L5UpWGjgcAyVrsfk/7Jqvjgaq/pK09CWFp8UXQjMH3lsLP4Yt?=
 =?us-ascii?Q?LWrmWwOPxYSXvMhQmK+iMJ0ftmUvTSEhx5saqxiLaUOe/KYC1T50fPOw2jL7?=
 =?us-ascii?Q?QBj6SsnUzf5pU2XtmxQ+Vb4DK4Mpw624xqvQ39id7vGx9lnDPArYxn6Lu1AS?=
 =?us-ascii?Q?fhhr53PyrwYUzamqVjinitsXyT5ymIsZlr5NQn0JwdBEatIyOwsyZwL1h3ZA?=
 =?us-ascii?Q?V1lkw9DHJmMuZ6KegdKNJ/X7I0sA9vMm8GbYVDMTQuJcSciCSbJAHMHoVvsQ?=
 =?us-ascii?Q?Tn4KI4f5lnmuF3moy/Y7PKDZGaxvwliom2TY+5PhyfzI29OYtpIQbrN51sJ7?=
 =?us-ascii?Q?HE1jTfxBakSPZk4pqXfh3Lhh6u9i1wL1fYBnCbGjNOzph8CUMLq977rpglfF?=
 =?us-ascii?Q?KexlWceUr3wxklwG2QcS36xBlTHalEgj97QOECBqwiBmkfePHd9E5uZ+9vBM?=
 =?us-ascii?Q?UHUDfRi7vqfUQHR4Lodkdxd9wFjOtc5NG2opV9NZ+x1AtXE71Bw51ew9Lkq9?=
 =?us-ascii?Q?cj4guOfKlcP9r26zDfgqyM6wA0onVevpWfWTPGcCWFc2X4753I2vydbgFsnj?=
 =?us-ascii?Q?XlKCBBoy/ggFK/seS5kanzfEDjD/REa8ze1sZlqHRjsLsdQxRiHSXs4aTVqi?=
 =?us-ascii?Q?kykuSBxYEmoKhsS6XwM0A7Q+t58gcT+2o5rW7MgtE8TNJ3mQBYqakURnRN+z?=
 =?us-ascii?Q?m8V2pVo0cPcimMZWnGCOm1pE2vzB5D+A9OnzWOIRGi0ovsAGRm5fm+ZkTvy0?=
 =?us-ascii?Q?+n1egQCqcmroalna4YBQ3amsY4YSKN4l5WRJa8zlQmpJb0ZMNafNqX4WAMZt?=
 =?us-ascii?Q?aPCWlOXDB91wyiqyPhTBwcEAtUVdvuRaGsAETKSRaX2PnrIwe4F0apiYSfmn?=
 =?us-ascii?Q?f92e3AtT1l1zre9nH+akUnf04e9+h8NNVpkNjKS3omHmFXgyKWBdwGmsyLqy?=
 =?us-ascii?Q?BcC/Q5FiGbm5qqWNlUgEJCLj3im/mleXs2/l1eroJVwFflv5nQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F3B8FB033AA702489221D329821093E7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6055
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	31a388d0-f456-4218-41a5-08dcde210125
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DkJ/uXIlhJr1JHBwlREDhGZxVQ7NjaBmDOed308hfLnfYu58G0CYk/khESL5?=
 =?us-ascii?Q?IaCI8nFN1L9lMXMn47tL4QHRjxMFRGEXX9a+SYDYzjKtVnoQ1zNdSlpIfiQy?=
 =?us-ascii?Q?VG7hK980e66xvBuBISvSS8wACcM6EAEKRAog9lELhl6axOeZrbLuCfF91NZ0?=
 =?us-ascii?Q?wvoOU4lEBmmp2iOudI8Lxj/3wr87w3zamYHNZcj6yLzkWmIjkEmpGCjqtqBd?=
 =?us-ascii?Q?5JA0X57InSPNOb42jCezXAv5w7ZR4hIF2Mr49vwEwALRQvlCzGDbFxpDLiWN?=
 =?us-ascii?Q?Dv6ynMfLOfqyzR5poDi7XshA3ZamOvecZDvmKMrZOI8yhjky2A9dWvpz2i2N?=
 =?us-ascii?Q?bB7CnEGNigVpy1rEyQuURq6dFXgsp2q4KeUMXidfGr0UEqxMmRQQA0AwxHJj?=
 =?us-ascii?Q?o3zA/Ked9iqTmTKGiciPs+a5IFv4UbGtBo366os6y3bntATohQkGqDZFWhLa?=
 =?us-ascii?Q?7sGFT699pUMPlwBQwkPWXSJF0Ovyqho9V6CRylu3EmZCH5YLNojsGOCHjPZr?=
 =?us-ascii?Q?PWW0v9YYE+YP5uICFcOU8O5Ev9tFQN7DOtuu0UUqMs9q1dphOfjsmcTsiQj8?=
 =?us-ascii?Q?MVffMSlo4gkWJrt6KO7NUEb6OltIe7og9uTzuTo0H/uPRTiEoZ+HFTKEInRq?=
 =?us-ascii?Q?h3krtLjRMA2sEk9HWMUspOgpltfV7UGN9GLLkkbMucdE7ZM3v46nAlfe7PBG?=
 =?us-ascii?Q?hWbcUFW4LryALKDLMvc2JgA+vj0ODx2nl2hmA/hQynLt9zVmdfKShFpPbg8h?=
 =?us-ascii?Q?OBiSeKmf9qsY7E6Ti/RUEOwcw7Q6ZFvnzc4aZksilQ56EfKxWY1okLGK8C1j?=
 =?us-ascii?Q?X9PijObQrsHaD/isK9+OVsDJz05oKBQZX0z1Vs7atGeL+qbEU7sIneUWC/3U?=
 =?us-ascii?Q?/KtEyp8lX+GUYeWKG+XGsJ4lG/q8m2eEarL0228NOQn9rMee9Hu/y1n71XVi?=
 =?us-ascii?Q?n7YV56rQgBvBCNsUQOWthfjvz+hzKZ/DeuQi2Z7sQT7EbU/6k7E8ONG7dYKa?=
 =?us-ascii?Q?MbNP/v3VkLWe/ngeWjC9AigSSIvelU1QcK3ZDOyKBEgRj1addVFzR13h3eXd?=
 =?us-ascii?Q?KYB055bldP9bOvr6hhqhdeMnBLXRnoHRk76+35ZJ1fh+WA4VH+FBXarhiQI6?=
 =?us-ascii?Q?7RL1T5KK/fY8HL01D/0Ky7IPsxxZoXHgm5fhyoMEm4qnzC9Fv1bcUshqvEoO?=
 =?us-ascii?Q?2CykCSNIk+7Tj8yFd0zLFzGWevHEbKwuSuPnZJbZ0VnZ/U3uVuA20wK59M1/?=
 =?us-ascii?Q?QHMJT8fB99ueGTdkSJaZAWY4gkXaZe2I+wsHFz/YttQyXsUHkYI2AbtmqKND?=
 =?us-ascii?Q?Blo97QlrImBFIVA19O2k/uJw7sEsmt5pSbgXWz/wSfGjGMMj3Bkh4Uf2WqhY?=
 =?us-ascii?Q?nVxC3yERM2J77gHOkZJ811tKXXILmeuA6UKKpEVVvrmGezb9S6lGNctX+5ff?=
 =?us-ascii?Q?LZBnkQozq6PM3xgzY3ziDF2TRcLQmcAu?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 11:47:43.9552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd551829-247b-438b-a06c-08dcde2108a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6298
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 11:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204977

On 24 Sep 2024, at 22:37, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
>=20
> - Needed for Gnome-47 components e.g. gnome-console
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Drop the arm gi data disabling

On clang builds I get buildpath warnings:

vte-0.78.0-r0 do_package_qa: QA Issue: File /usr/bin/vte-2.91 in package vt=
e contains reference to TMPDIR [buildpaths]

Ross=

