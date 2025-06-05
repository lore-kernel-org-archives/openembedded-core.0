Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1891CC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 10:00:29 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.48])
 by mx.groups.io with SMTP id smtpd.web10.3595.1749117621124821167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 03:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZVcwO4UF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZVcwO4UF;
 spf=pass (domain: arm.com, ip: 40.107.130.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Fr4gNWYu7eqpSdJ7YY9YtPvXxYUYXTNQZiNVQrMO5ZOte+yv3/qB3Lha+XzlzrwxuckyBwNj3EeIRs81EmWvlGJ3mnPwjInn80Cii/V1GqblP53gOxJ6pgBFKsPvaBJWO/WL0rhIuridUTccYdjRoqYK8q969FhM9BIalZwYz1BO8c9BhSbtXI0EwsVTfuBpR7Muu5qxN4Z0gXAx7Y8RF2ULl5P7Lrl87eKmQDgmwTKBSq/tHec1jSRdFwLeCsk+fZC952STQLHhcbojVvrkVLdzOcxkUbnc84GJjTE+1pdt6VZbO6E/H06M6aNKclessGiz7fFgbQO4SekyyjOSZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHtAeFALxyClbcbcSLoob6i7eG9IN8Vn/yGXNyUisUY=;
 b=ceIsZW2/zcEcQT98GAW0NhRyDfjFzF1dLB0Fuewqy0kfEfxSJ6osX4NKIzsxNSXUY/m1MTEaG/eZTz2m5D16MNas+wgH2kPlMiiXed1BHG3pVSVIiiKZjl/iRCiKeMQwpYyyzmsskR7BAtgLzHIU+Ac9UF5Qi9HlnmBut6+VmflTcNKMbGsDHh3HJ72gB1p5wJc+HR2AIA1K2B1symJCmeRAu7BBB2ndHrW5CC060z7Y9ueGcjndOZA1sG6yGTy34P7lPIKpwhnhsOnQ/80qq+KQttt+KEp85qdZbZYukHhS+L95JfoTrzZ3HpwUFf6KLk8vkq8ZDhePQ4pNtWLlGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHtAeFALxyClbcbcSLoob6i7eG9IN8Vn/yGXNyUisUY=;
 b=ZVcwO4UFS4ok5hgJOhb54+ngWFE+0NE7TYp+otFpYXiDJIte9MhrROMk5RhODss/GDs2/0i2TfeSpBq0YNqsYwP/GuNDbdDqdJ9nReZSgOS3N+E6Ifv5dn2hIsvKz2H1wxXw7eZnGln555YOommaccZMU/9LG1syy8Ur/tMU1uA=
Received: from DUZPR01CA0103.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::15) by AS8PR08MB9217.eurprd08.prod.outlook.com
 (2603:10a6:20b:5a0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Thu, 5 Jun
 2025 10:00:16 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::fb) by DUZPR01CA0103.outlook.office365.com
 (2603:10a6:10:4bb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 5 Jun 2025 10:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via
 Frontend Transport; Thu, 5 Jun 2025 10:00:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBOaZw2I7ggupO75owpsnduPYJaov4AiGjCOO/aX+/AIlMr9CO6fHskDcrSv/BKL1iT/Z1EGyXR6jZQ8MXXWLrDplv6fRIjRsJPYWt6w2cViAPko8/jcHa4xahwofl5R+spv4idqytDCQWcpK9XYvITmjcVe0uXSXm1LsgBBZD0ZfSwxUofhKMzD53Hzo0nxrSbhzVPpfwJMR3bWmUNufK424bpB3xmWcx4qdW26Wia4uXRoHf9qccaD94Pex/TqknlL+PzuY5o7mRgP2/UZbM0SZPDRvFUaytWuN80aYmvLTWDIlUuV523nY5atgsjnPcHIwehsz8ov7kDkSito0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHtAeFALxyClbcbcSLoob6i7eG9IN8Vn/yGXNyUisUY=;
 b=FdIYLDE+HBv34gTQlIdGxghDMmpiNS/ryXzx4mKuuHoUh/zck+TSGT71JUdlHtKIrqInZUQCHmT9Bs0vSlDs31kuR0skTL086N/AN/hAl+xYY6zky2/nZ0+7H+2sffiEzJkiQX4IuBbd4YDnwSYMGh2tfFbCd13hddhOzjZ/hIBEx7N6AM4T1mpVnHvnbHjpXTLc1C9pCJWLeDsKiMI4IPgrlCXh1bcvOtxpBG1OwcRXiBdMDhYgdRMvAhRYejVXTDUwOKPzlIUg2a1OjGyp8jdABI9wOcQZp9BdI1NQ00I6EX3z+5TD/wdJ3Rv9KdCNQGXEBlBIjpsYYJIeH31Bzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHtAeFALxyClbcbcSLoob6i7eG9IN8Vn/yGXNyUisUY=;
 b=ZVcwO4UFS4ok5hgJOhb54+ngWFE+0NE7TYp+otFpYXiDJIte9MhrROMk5RhODss/GDs2/0i2TfeSpBq0YNqsYwP/GuNDbdDqdJ9nReZSgOS3N+E6Ifv5dn2hIsvKz2H1wxXw7eZnGln555YOommaccZMU/9LG1syy8Ur/tMU1uA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9759.eurprd08.prod.outlook.com (2603:10a6:102:2ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 09:59:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 09:59:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] musl-locale: Recommend musl-locale in every
 locale-base package
Thread-Topic: [OE-core] [PATCH] musl-locale: Recommend musl-locale in every
 locale-base package
Thread-Index: AQHb1P3V61mmWrybnUCBAYuGqSZ1drP0VxUA
Date: Thu, 5 Jun 2025 09:59:42 +0000
Message-ID: <C04F83BE-2553-4782-92B7-2AF326101572@arm.com>
References: <20250604030723.1509609-1-raj.khem@gmail.com>
In-Reply-To: <20250604030723.1509609-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9759:EE_|DU6PEPF0000A7E0:EE_|AS8PR08MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d2c340-8357-4479-ea60-08dda417c56d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Y2pVcHZrZXMzMmtMdXcwdG4rbXlnWWFiQnplVTh1ZzZEM2UyU0xBWkZpQXcv?=
 =?utf-8?B?WDdyZlhQbEtQamJ1Y3FSK2NIeUNKZTRrTVNiZEZTRGptd1VzdVJWT2N6NFkw?=
 =?utf-8?B?cTJyWFYveVd2eTR6V2k4SjdWZ2Rkblc0eHVCeFh6UGNXck1jSTArcnlMTHdu?=
 =?utf-8?B?Z203dS9uOXR1eU1iNWxVTEdTb2FIYkMzRE14MVdNT3g5bHpNVXNJOENIaENC?=
 =?utf-8?B?aEwrc3ZmRWh2UmhYSGovUmlCMEEvYUFXMEhyUmdKYjhhWTR4LzFwbEI5SG8w?=
 =?utf-8?B?WUorOEUzakFjWnQrK2IxUy9HWjFuQnJyYk5NS0lPNEtmMWhxOVFXYi9sMndp?=
 =?utf-8?B?dW04aHc3OVZWTUxZUnRYVXVUZXpwdmdpWUdJZ0JBSDduU1VNNnFBK1kxcTVG?=
 =?utf-8?B?b2I0cXFoSFFIRGk4SklIOEcyTzVtRW4vTnBraTlyT1huWXp3ZjFIZThwbERW?=
 =?utf-8?B?MEhtRkxLYXlIODNlWm5YRmx0U2xML3hGT2syVHlYZDI1QXU0U3dnZGdBWXpR?=
 =?utf-8?B?czI3dGZvWXZ3OHY5UU1aUFZYY0VYc1R4bW9oZzRqaTR5YVhnMUE1ZGlmdlpD?=
 =?utf-8?B?NmJrc0t1WnNYWHA4Q2hMUlRQYTk0V1E5bXFCa2ZLR3lBdTBXbFJ4dGorSHZN?=
 =?utf-8?B?bFRzMVRZZDFKRm1kZUk1M3FIdUZzd0xPb2UyUFpIQ1dsSjlIOUd6anBleTRE?=
 =?utf-8?B?RnFDbGdNTFlqQUFZTzEwdkdaMzVuNnZuWDNNUjM5TGFOSEVNTkxZVktLblkz?=
 =?utf-8?B?bmxaNjJhSU9CZ1Z6ZUpjSmRJZzdnM2IwY1NJdVlZVVgxL2xKSDUySFZYL091?=
 =?utf-8?B?V29ZSElWSnVOYUhVdlEzWUp3blhqZHRyZkc5NGwyV0J1V3lRaCt5ZDRFRmVh?=
 =?utf-8?B?MzdRWDlrMDN5aEFzK2tsb2Q0UU1QNnF0V0FQV1k3QnRVampmZEloQWk4aVZx?=
 =?utf-8?B?cEdpUEo1d3FYbW85aUozaUpBZlI2ajY1WllLRXFmWUNZOGZVOVk5WVlZckpH?=
 =?utf-8?B?aTA4VUg5SUVSWUhIRkpwTWdMNEY3bVUrUUFVQUVoVXVKWEtFdXBKdUVWc0pW?=
 =?utf-8?B?Y0tIQUJwR3RUb3F0cGN6em9FTmx2UzdOVUJTblM1VkhLbXdHbFNTVitDVENT?=
 =?utf-8?B?SXpjVzZXK1BLWjByVUR1VjFYd3lNZzZOcXZqa3JLL2ljWmhqSmNGVmJJQVc3?=
 =?utf-8?B?amxVeFRpRGZjVVIzSWp5bUkvVjBxZmh6b3FXMTVrcHpXdmNVeSt5aUptSmM0?=
 =?utf-8?B?U0NZbUtwMXoxYWNkUVJHNmRwREFtVy9zcVBhSWxEVGpIbGtwU3VsazZZU2hr?=
 =?utf-8?B?ZDFUWk9sMDJYenpzTEVzZmhFTVlSRmVWamJ5WWJzdFBuRVY2S0hRUTNoNXpI?=
 =?utf-8?B?dlJlWVAyWWRGYlQvYkNlcDVoZjRYZklZWGUyQkt5Q2g1dzY1Y01GS2paVnE1?=
 =?utf-8?B?SDFOWS91Z0Y5Z21pNWFrSkpBZGMwRHJIWDBTNjJPMFZUR3NaYzNqczZTVyt5?=
 =?utf-8?B?SlNNdUd2UUJnM0lZOXo2V1hxalU0SmIyMTdrVHJvbERZYTl4WDhmSFpJK0tp?=
 =?utf-8?B?enNNdTQ3T3I3QnA0dXFHakN0TnNSK0Y0YlFuMHg1STZxVGJMdHA5aXlHM1g4?=
 =?utf-8?B?STB0TjhydjF1NjZHOGlLMGJlMEVmZlVxRjQ5ZWxXQ3Nna2ZjUWIyTmw4QXAw?=
 =?utf-8?B?ZHZyTjNWZXBGSDR0TWUya0VpSlowU0FpVVlrVmNKZWtnNElpU00vNXBtekVa?=
 =?utf-8?B?ZzErUWFIdGRIWEpnWXVDUHhZSWVKdm91N3BiVVJER3BJN3ArOEFKVGRTcThK?=
 =?utf-8?B?emhUR3dIeVdVbXlJM0k1Qk1SSDF1VEFjc1RpcDFGSUZSSURsRXZEWVYrYWNy?=
 =?utf-8?B?QmxwYUVobGlIY3FSQ2FNL3g3ZTFGUUV3Umlaam1Mc0wzUUs2OEdPejJVcDc5?=
 =?utf-8?B?RlVBVTRCUVovcTNualNrZHYxWVFPQ0t4TlRSOUxhYk9FdnRPNjd2SG9XYzhm?=
 =?utf-8?B?YUtFdUdOSWZBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <686FAA2E7B70FD4F9F3E7B284FE4EBB5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9759
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b72c33d8-4117-43a9-ccff-08dda417b1b1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|36860700013|1800799024|376014|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RnE1eUNyMGk4aXJPYWJqd1Nad1FOTGtiZEJ4ZnpTaml2c3dpeDFWZkp1Q3RZ?=
 =?utf-8?B?MkgzTjM3R2g1RlVreS9tbUU2aW41TVQyZHRXeTRTaGJxL1ZNdEF5UUs0WHll?=
 =?utf-8?B?YjVVSklkU3R6TkZFWm9ualBKMHV2ODhzRFFTWXYrdHJ4Mk12MG9tQlNYU3p6?=
 =?utf-8?B?N0dDZjRZZVpUczdZMnQ3WEhvWjI2MFBqdmhOK21QdGx1ZTkyUFhOQVZUUGhN?=
 =?utf-8?B?K3FDR2dGRDczMUY4SEtpemIrTStHdllIM2x6NDRwbkxuTGJSWmxob0JsQlhB?=
 =?utf-8?B?N3ZaTWFTTjE1U0lYY3RRS2ZmK2xoV3pVNzZpc0lpS0pabkFmMzBUVGlSYzZa?=
 =?utf-8?B?Y0ZRZzJHckk4RUhzM21ONjFac3ZaSkdjSFkwN0Jud0ZDYTVyTjhMU3hiWHJJ?=
 =?utf-8?B?SWFYRm5zV0czd09OZE5oeml3T1FiU3JhMVRHR0dVWHR0ZXd1cTEyZ1dTV0Zq?=
 =?utf-8?B?R3VlR3lHVklTMEVLZWR6WlVLUGRGRi9kcTcxL2NDTkpYS0pHZ2xxVE14QzI2?=
 =?utf-8?B?UDNhN3RZcHVYeDF5aTBwd2xockV4ank3Z1FmYjdSNUNFNHVmNFVvWlZZUnlF?=
 =?utf-8?B?YjA2K3g5bytURWNyNkhXTVFhL1dBVjV3YlVvcE5mOGtBM2dKcGhOc1BWK0V1?=
 =?utf-8?B?WXV4bmh4cnNwVDkvdkhFOWcxUVNPWDZvRXRha3FCSkROUzZudjQ2S3hTeTk3?=
 =?utf-8?B?bERZVmE4WmlXMUZkTWtnSkJVdVM2SHphVTh1YWpWbFhTN2JMbklYcy9kei9r?=
 =?utf-8?B?THkrN1RYQ1ZvQlVyV1Fza2lLNytmc3lKbEc2UkxhU1IrakR4R0ZxbTBNV1BN?=
 =?utf-8?B?K1BMajRVK1pBQkNCemxGVkFxRlJhdW5nN2xXalE1aTB5RTAvTkpQYmt6VDNZ?=
 =?utf-8?B?ZEwxQzQwejA0alpjRjIzR1Vuc1g2VmVzcE9xUmpRV0owbFpRREVpVmc5SFNj?=
 =?utf-8?B?eE1uV3lOS1FuSTR4dk5qTm5WMTlYck8xSWNQb0ZkMGJaOVd3YXBuWm4zTkpz?=
 =?utf-8?B?RVViZHhxbGhkcjJybmNJT1QzS3hRY3pUVnlRTHhsNjB5eHhneDg2RzFlTitB?=
 =?utf-8?B?T2NTNjVrTzhiSW9oa2Vaek9oZ1BaaUczSDZvVldCamltZG1lUFNXSUJFNVE5?=
 =?utf-8?B?dDZCOVpGV1prcTRvRTNhUXFPSnRXb1M2YlJpTVRob05la0RGbnM4RGlSZmZ1?=
 =?utf-8?B?dXJ5TUZDSFYzYUgwZ0FhelA0OWpHMGtRVkljOW9KbzY3VVcrNG1XUXdvUzc5?=
 =?utf-8?B?TFhFMFI3ZDFLWGtMZzlNSXVDVDBtOUZZTjU0eTJ4WjlEZW5oV3ZDcC8vRU1F?=
 =?utf-8?B?Tk5aWnlvY2dvMW9jWkZEYi9lekl5eWEzNGJqWVBKVlN3TUVFY0ZoNXZ1cEZ2?=
 =?utf-8?B?OFBBWi9odmlwWWZWZmp5ZFFPWWdNRnNHeGtNbU02dkRrN1didlBzRXYvNkdV?=
 =?utf-8?B?cDIzSXBGenVuamh0aEJoOFNQdHllcSs5REE2K3FIV29Hblh2dDNaOXRDK1Nm?=
 =?utf-8?B?UXZmby95UHBPY0ZlUS9DSGZrSUF5Y3htRE13cjdXb2s0bW1pM2ovb0pINGRz?=
 =?utf-8?B?NU92dHZiV0hQa0tuY0lyb2FGOEpmVllGSTA4aTJRamNWbG81YzNYYVBJL0ph?=
 =?utf-8?B?cWI2YTBtek15WWF2ZjBGaWxLSFA3RktiQzE3aERSTnZLUmZCdDBvd2tUNDdG?=
 =?utf-8?B?aVhrdFdSSzlqbThxWDZBaFhwdDdKcUR4Y2FjRzRqaFY4Z2dyRlAvd2hnM2c3?=
 =?utf-8?B?NW91YmcvN1dpY2tQRkltMTE2dStlaUdGQ1NKRG5qait4L3FCV1I0OHRkNCs3?=
 =?utf-8?B?RkFQVFB3dUhaeWp2bFNuUm8vSlJxSW96OHg2T1VsL24wTVV6QSsya0RDVHVn?=
 =?utf-8?B?akJvRVNid3JldkJ5SlY3eGRGNUQzd2R3bFBFREVhaFE3NE4yZDlhcnl4SXVC?=
 =?utf-8?B?MHZPcGZWS2tQcEJZV25xVkFUMDh5UFVVcGU2YlVvR3IxNW8rY1MzRUlVR2xy?=
 =?utf-8?B?QmdMVTRBYnBEQXo3b1pzZldWdnA5MGlvN2JxUUhzSUhEMHJ3eGlqNEZjNzZ0?=
 =?utf-8?Q?B2EKy8?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700013)(1800799024)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 10:00:15.9531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d2c340-8357-4479-ea60-08dda417c56d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9217
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 10:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217998

T24gNCBKdW4gMjAyNSwgYXQgMDQ6MDcsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IG11c2wtbG9jYWxlIGluc3RhbGxzIGEgcHJvZmlsZSBmcmFnbWVudCBpbiAvZXRjL3Byb2ZpbGUu
ZC8NCj4gd2hpY2ggc2V0cyBNVVNMX0xPQ1BBVEggaW4gZW52aXJvbm1lbnQuIFRoaXMgaXMgcmVx
dWlyZWQgZm9yIGxvY2FsZQ0KPiB0byB3b3JrIGNvcnJlY3RseS4gZS5nLg0KDQpJcyB0aGVyZSBh
IGdvb2QgcmVhc29uIHdoeSBtdXNsIGNhbuKAmXQgYmUgdG9sZCBhdCBidWlsZCB0aW1lIHdoYXQg
dGhlIGxvY2FsZSBwYXRoIGlzPw0KDQpSb3Nz

