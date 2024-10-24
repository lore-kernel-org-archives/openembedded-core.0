Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E08ECE8E63
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 11:20:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.51])
 by mx.groups.io with SMTP id smtpd.web11.12276.1729768854815473437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 04:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=adP7CrB5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=adP7CrB5;
 spf=pass (domain: arm.com, ip: 40.107.20.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DQMbrIFWnnq1kOpMrXk7rK8ZpV2PcoVh7vyjxe8dBkMegDiLLnU55ginOz6OHb3UF7V4nXvvTAiv5c+G6c86+irMXckUZYrJLioMl20y+ANcv6Q+b3ipuTZ9/WwrRvAQ4kfaYOz3HlnZUV28hSXxEli7PlztS4A9u34LUs58m75GgIAB+CN8BI+cQ5gwV/wdIlI0J8c6SA1P76epVN1RqXj5T9brwRaLX/WxvoeiS693kSI4T8gI+miA9OELMP3UrZXBkfmCDMxKw+SopWGoLayBBskEPgGIPhx1wt4ZG6aMow5B8XmJhLaMQB5HXiKlYyEP4l4xeZY7XAPG2vxJKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plUbAzoZN187W5m53Rp1b7WqfYRwHZtlISalJSEg3l4=;
 b=aGNQYC4bG4LiwFP7c7Csj4yjvKw3uHKKcHesOgJlGFlvdYlohgOocNxhkiRNoMlXJmiq3EawReWqTlIpchFxa8Hm14XGzGc8ahvE20SX+8FipAsYPl2iXH0Jj+UrnktrLTd0FQ+HmfedhoQ8bIdOtwFrsrS1nk747s22PYacdYYSrHiCEgTmwKZCb5UPMH0ktSzkF0G9oLlcponSLqP2YpNZthx1r4noliezGuVEFEA9APy3mndxztbscMWtS3InOqLcmXw7UzgjC4CtdlztKZvNZjOAqYoG6b8bvixN873YZhalqoPOHWGchLjyb2tZZhNMJ6etajo9xqvmAl1rgQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plUbAzoZN187W5m53Rp1b7WqfYRwHZtlISalJSEg3l4=;
 b=adP7CrB5D79ibtKRnabm2G5PT9XvhbEZUJ5rHDgkiguI4L+CLzJ8RfNGGuuHN5c+yo4WkDlPEax0JDj+AY7YxOnC1tUO54Y1LLrZLEp2ZMW6ntwljtcbXypu9kkgklEbI1+cysoiICf4+2ja/JW9R6krGNi1uRSMNk71QaEVEMw=
Received: from AS4PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::18)
 by DBAPR08MB5750.eurprd08.prod.outlook.com (2603:10a6:10:1a6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 11:20:49 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::e4) by AS4PR10CA0014.outlook.office365.com
 (2603:10a6:20b:5dc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Thu, 24 Oct 2024 11:20:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Thu, 24 Oct 2024 11:20:48 +0000
Received: ("Tessian outbound 4f9bb016c0c5:v490"); Thu, 24 Oct 2024 11:20:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1eba50b627d9aa22
X-TessianGatewayMetadata: f7sjm18ckR+G1uIR9wxWBjLdg1aZJGE2CBotjUyS4CVMwISrchvJdo4Zim3i/bSaSaM2d95kTlTlGnZNZQMmcWVCmF2itirsLe2PK5HPp8GgEMFeoReYGRHreGTtRwhMAUXT+yAxpkEULKvgrTjOw03Ua2d7EVU/vqR/COlrkl4=
X-CR-MTA-TID: 64aa7808
Received: from L2fa12f4b8ff3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DA3C407E-F9F9-40E0-89FD-9B3CFE49D90F.1;
	Thu, 24 Oct 2024 11:20:41 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L2fa12f4b8ff3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Oct 2024 11:20:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w14axG0AsSnhhKsCeMwQiJNzmZuGb4X44bThp9zQilyDGwF0wtJZqgavzqTyIeifVX4yTZ/9od4/HXDrpB92pvZLWEWUEH1eTu1cfjYd8qTstP0/ZTTGGaJQN3fKjx8zFC0ttraVHefHkLVvtU5BMVlb/KIPGbT+GLr0mtTogSWLwYEFiHlOH2kHME9o2dvtBfJAVHg+8ylCZmZQXwu9pTQ6XXsv0wRdh7Q+OjqXi6L8FJgjySLocH/2Ypt6KT9dtqmcuM2YPyw9e0+nz5R/RnYtAhM7jrDhFgn8eWXJksc725abQdPxidHB3FDSklFj6Rvi1mY3wd/U/6AT1zXRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plUbAzoZN187W5m53Rp1b7WqfYRwHZtlISalJSEg3l4=;
 b=RIK3EBzt9nxvd0nIiMB99y56CPk8YLiIQZzZYThoHlopbbAfg+PVCEtuPw+uZf+nCdPioOiCmhfWdeJhiU/Ey4cxL3TSi2a2t/W+njU1qLW5vm9yvEGshDqmtBl6cLOokn9YaHjPKtDv16AwEpGRb+wrcsiZ/7ZGHxlGmyKfD000TMOQZ6gR8dXunBjOBVraCXM07C3cE6b8/00XJq+9G0c7aq6v8nCFcTheqofeZZkLGbt7L0x0nMFHlM/OekUr13GIZQbvZLwZSyZYCi2wVk/JQLkih0mRgPO2wcYXqQAWFfmJJIgalSiAhK+iGqy6BGIowycKBbMHu0zzHu5QAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plUbAzoZN187W5m53Rp1b7WqfYRwHZtlISalJSEg3l4=;
 b=adP7CrB5D79ibtKRnabm2G5PT9XvhbEZUJ5rHDgkiguI4L+CLzJ8RfNGGuuHN5c+yo4WkDlPEax0JDj+AY7YxOnC1tUO54Y1LLrZLEp2ZMW6ntwljtcbXypu9kkgklEbI1+cysoiICf4+2ja/JW9R6krGNi1uRSMNk71QaEVEMw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7382.eurprd08.prod.outlook.com (2603:10a6:102:22d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 11:20:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:20:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "danismostlikely@gmail.com" <danismostlikely@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Dan McGregor
	<dan.mcgregor@usask.ca>
Subject: Re: [OE-core] [PATCH] ppp: make pam optional to avoid host
 contamination
Thread-Topic: [OE-core] [PATCH] ppp: make pam optional to avoid host
 contamination
Thread-Index: AQHbJXKEJr5bCCZEbEmTRcdnbOeeD7KVvPkAgAAD2oCAAAG+gA==
Date: Thu, 24 Oct 2024 11:20:39 +0000
Message-ID: <1E52B05F-F57A-410A-A9C4-60AAB18AB03B@arm.com>
References: <20241023173911.1411724-1-danismostlikely@gmail.com>
 <2E288CC5-EDBF-4AA6-9F48-9DC45C171188@arm.com>
 <CANNYZj9Bn-yZy1y8NjP=xushF3xa7LO4TScJAKub_6+WRPrOcg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9Bn-yZy1y8NjP=xushF3xa7LO4TScJAKub_6+WRPrOcg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7382:EE_|AMS0EPF0000019D:EE_|DBAPR08MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: c20adb3c-a2db-4cc8-dbd2-08dcf41de966
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?T2hQZm5xd0ZCcENsamlFTU9DR090eGdMNllaRUIyOGpEQkFoeURIMnRiM3JS?=
 =?utf-8?B?UXdrN1MzRnpCcVIrdXBseERnTVd0S1p0NWxiMUpicWcrTkdPdkdFRlhWbXJp?=
 =?utf-8?B?bGtJdVd6OTcyQ2ZxSUg0R3dnVVlpZjFWbThrcVNFc3cwY1VMbWRwcmVBZWlM?=
 =?utf-8?B?VWVCNEpRblA2VHVsRHpsbnZkNFRZR2NLY1BzV3RZSXE4R0ZpWWhOUE5LWWlG?=
 =?utf-8?B?YnpFYkxuRzhad3JrbURnUFBRa2Y1TkFsdjBUS2pIQ2U1UkpFYnZ3ZS9KNlBo?=
 =?utf-8?B?SDA1SGlvd2JCUWpUUG15SzFvS2lBN1c4NkRCQkVuTEVMYnE2Y1BZVWVKdVU5?=
 =?utf-8?B?L1lNWUdISmZPdW5ZL2xCODZNR2gzeW5CR1BuSThuU3ZjZ1Q0eWE4Skh1T0pI?=
 =?utf-8?B?SjFqa0hCMnU0cGVzdjVPWW1weWt6Qml2ZTRUdUhoSzVNZVpENFZXekRYdVpu?=
 =?utf-8?B?TVBuRmtERGgxNzJyODI5NkE1UENMNW00T3BCd0VXNVVSVFdkcnl6WjVaT0hx?=
 =?utf-8?B?ZDBDcVljNEhhWlZDUXJzRUtuYk1sMDF1ODZpUlFmV0ZSdERYVnVKaEZRaHFF?=
 =?utf-8?B?bmFiSWpwTmJ2TWxDZ3RPLzdXZlVrMFovNkRkWFZkOGVHUUJCVHp0MFB1ckJQ?=
 =?utf-8?B?Z2xRbTlaUGFwOEJsTUVGdm5oNTlvSElOT2Z6Q3hVQUM2MHI3ZXVJSkRheXZj?=
 =?utf-8?B?bGN0dm9ramZGdzBHU2RUM2wwemR3Slp6V2lWOGZ0L21NSXRmZDZFRk0wZ094?=
 =?utf-8?B?dDFKK3lLSHVqS1VWL2RwcE52dW1iTmlQd3dPU3FqN1EzRjhaUlpUcVZaZUFO?=
 =?utf-8?B?V2IreW1KSUtic0ZwMERpYytOMUEwd1ZmMGcwd0Rsb3hOM09VQ0czcW1hQUtG?=
 =?utf-8?B?VzgvMEVqVFdlZkgvRDFnb1Rhdnh4cUt5aHlxRExhakRmUDdVVk80b1BFckkv?=
 =?utf-8?B?S1o2T1ZJaXdUUlF0cVU0RXNwOHFWYy8ySi85NjZLZzhxT3k4ZWduRzMvZ2lq?=
 =?utf-8?B?ZDlkaWhzcGNhOUt1enBmdFhrZ3Y4NkQ3WTBEZitZRUcyVGNFbFJpaUgxVExT?=
 =?utf-8?B?bm1lWFp0MGRIUFI4UHduNXNzOURPa09ZS2MwQldBelZnblNlVUpnR29tTEcr?=
 =?utf-8?B?RC9tVkxEaHZqOVA1YWUzU29nWlQ1aitoUjNMZnV3R1JZVGZiNVY2OFV5R3ZD?=
 =?utf-8?B?OXg0NmlzN2U4Vm5waUdaR3Fxems4TW5iWnVsMmtpcXNQUjdUZEpTdVUwVGps?=
 =?utf-8?B?UlZUN3doajBaVG1WUXRxVStZb1hJZUhpN3FSajU5T1FBdVV1UVpjY0EvSXRt?=
 =?utf-8?B?WkdxbE1UR3EwYXE5MTc5WHQ0L3VFaitKOXBORHMvVk41czc0dEx6ekw0UU9U?=
 =?utf-8?B?dVhPQ29xVElRQmt5L1MzOEpBd1Q3ek02eUorazR3UlJLejYvUFYzWTFwcXNG?=
 =?utf-8?B?dW01K0NHRUZYZ01zWmxOeVgzcGdvSzdCOGNtRkRPc3VjQm9FNnpqbS9kODlC?=
 =?utf-8?B?M2wxcGVsb2JkSGQvaXBVV1M1ZGgvazRabHQ1SVVmd3QrVlRrc1IxcGxROGNF?=
 =?utf-8?B?eEZGQ1I2QXlZZm1wZkZoWGw3a2pZcmhMTWN2MWsrakhsVmhrVTd0TDlqYlhP?=
 =?utf-8?B?dzdrRUdYeFVjRzVxcGNCczkzdnJXN3dwMmtwZ0RBa0tRT0Zjd3lHY253Uk5n?=
 =?utf-8?B?QjFRQjBkTlU2c3F5ZzZ2dHg0YjNBMlFESEdVNWg3NHRnQWFLbW5BbjdBZERG?=
 =?utf-8?Q?I4q8RBZGc8XI3khpkgYLH9tP2ORXDYVEOB4fQ3c?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <410569FB15B8C94DA73F1CC3E7D8BEB8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7382
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	401cfe67-36f4-4d8f-2b4f-08dcf41de423
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|35042699022|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NEdHNDhMSit4TDUwVjVKbGlGVFQ5TkloK2pSa3FzZ2I2VHFXZmx3ZmM1WWE4?=
 =?utf-8?B?R05SbUh0R2kwK0lLL3l2OXdLaWdDTFJua3hPVzAwZE0zUk90a0hXQmp6aEFw?=
 =?utf-8?B?YzRXZEs3b0p4bmVmcmlUZDNlSUtzaEY1VVBvYW12VW01Zmt4OVdsczJJZGZK?=
 =?utf-8?B?WTBvUUMwNmc2MTczYWxJZmlYdnJCMzFwTGlOQmZJRGptZzZuOGVaZ0JIcHor?=
 =?utf-8?B?SGQzVm1CdGhRSWJyUm81bFFIazBUT3lWM0hib3FuU2pBcXB5NTUzMk9GYWFD?=
 =?utf-8?B?cGVvU1Zud2lYSk9CdkVoZG1mT1Y4RDlVMzFiUjF4YVgvNXNQTFFiT2hnLzh6?=
 =?utf-8?B?eEZXZW1ZUVVNNjhmOWFxbWtvSndEaHJDSFVRS3ByNVpJbDQzeHUyR0JWOWNs?=
 =?utf-8?B?RFRTaS9EbjI1N0dhbTVMQTRYL3lXWFBoa1lKdGl5NEc0Um5wdGFjMVFxVzR1?=
 =?utf-8?B?YWYwa1c0MEQ4dmFDUGoyV0RtOU5WUUpXWEU4OVA5ZFF1Tk1tekJ1b0NIQkNu?=
 =?utf-8?B?T3NOd3FBSVNTVmJLZ2NBMUJWMWVHbXVCeHFwQkloQjZpUE9rOHBXTjZMVzRV?=
 =?utf-8?B?SndnMFl2NWlQblh3dk5lMGhVbTA4bVpIZXFLdFc5R2NWWXhOZ0ZnWldYVnNZ?=
 =?utf-8?B?bllpZmlEajgwL0FrbzhZb3Vnb01mU0tYTURrT3R6anNXMHhKWGFoaGNXQ0NP?=
 =?utf-8?B?UU5VcTE2Y3FHdTJSREVLSzNTVHowYm8rZWtrTWRLS3g4ZzVHdEY2bDhQNWdY?=
 =?utf-8?B?YUwxVHpwVENJaENaNksyRFV4M0VDUUsyTVFkYSttd2UrUDYxSnY3enJCYjNO?=
 =?utf-8?B?a1o5SWJvUERKejRDcmdaOU92Qm9naS9TYXpQYVdpVmZaTXJqR2VnVTcvK2NV?=
 =?utf-8?B?Z3BNOEU2SEVzM3RXTUFOeUsybVFWSXRUZWpwL0FrbnViaW5oaG42dVhZNlFV?=
 =?utf-8?B?dlVXcnAyTVRqV00vSW1INzlSVnMyQ3AwQUYzc1NyZE1rUVFDZm5qUnJRWllQ?=
 =?utf-8?B?OWl2NUJ3QWt2alZqR2MwQkF5dTFRTkZ0dFJHcElrZ20zUzRTOFNwaWZvbnVj?=
 =?utf-8?B?VlNTNWhPdWRnM2I1akd1UktpeUMyazAyZkNkcnUrdzk2WUlXSENaQ0VzOS9C?=
 =?utf-8?B?NlFvZ3kwUVJ2MzQ1V3VleldodHpMdmdKYUcrTW5aU3ZRY2RLUXJYM0VBY2xM?=
 =?utf-8?B?aXlVU2JQS2ttYkVwVlNlMDhKNHVHKzJTRmVSWDcwOUpEbjZQMlFTdUtCNlZh?=
 =?utf-8?B?a3RwN0s1QnJ1Zy9vbWVlV28ybmhNQjVIQk0rQkVYTHI4SDZ2bnNLOFp2YnJR?=
 =?utf-8?B?YVAxQWsrV05LREtTVnFoUnhISGRRUlh5RFl2MVEwV210S3dsdEpURkRoMUFB?=
 =?utf-8?B?bDdURmh3c2RIelB5RUgvQ3ZYYnRYWTJzYldWejdGUE5sSVFadFRYWlVidHo1?=
 =?utf-8?B?U0haR2IwOUNZbGVMdVk4Ly94NlhIQW1NbnpVS2lSOHo1RCtRZjVDSkppWS95?=
 =?utf-8?B?ZGpKaXMyWUJJTXhpTDFuUUJUbGg1eEZ6aVJGenozTUxpeXZicGpVRHoxcDB1?=
 =?utf-8?B?K3lMOEgrcGlhQUVueUpzQytuemw3QXVURVQ2aUFRRFFsZ055bVNvNmU4Q3Vs?=
 =?utf-8?B?MHorR2hCbVJVS0J0SFVQNFZ0THhKbXVoUFkyczJkT1VTWDk1RWJ1YUZ4ZFNY?=
 =?utf-8?B?cnZsbVA5VlNkVVdVRm1zaTdVa2VsbkxuY2k0aHVHcldHT1QrcFZKakdGb29v?=
 =?utf-8?B?ZUJQQUhESFRaMnR3dVhYT2xnT0JQbndGZEtFU0xwZStJZkxRcVlsYVFOaUps?=
 =?utf-8?Q?JhK6ePbhFmuy7caYc9v4Qf7100ZRQ8E5pbktI=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:20:48.5266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c20adb3c-a2db-4cc8-dbd2-08dcf41de966
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5750
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 11:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206290

DQoNCj4gT24gMjQgT2N0IDIwMjQsIGF0IDEyOjE0LCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIDI0IE9jdCAyMDI0IGF0IDEz
OjAxLCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cm9zcy5idXJ0
b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+PiArUEFDS0FHRUNP
TkZJRyA/Pz0gIiINCj4+PiArUEFDS0FHRUNPTkZJR1twYW1dID0gIi0td2l0aC1wYW09eWVzLC0t
d2l0aC1wYW09bm8sbGlicGFt4oCdDQo+PiANCj4+IFdlIGhhdmUgYSDigJhwYW3igJkgRElTVFJP
X0ZFQVRVUkUsIHNob3VsZCB3ZSBqdXN0IHJlc3BlY3QgdGhhdCBhcyB0aGUgZGVmYXVsdCBQQUNL
QUdFQ09ORklHIHVzaW5nIGJiLnV0aWxzLmZpbHRlcj8NCj4gDQo+IE9ubHkgaWYgdGhlIGhvc3Qg
Y29udGFtaW5hdGlvbiBpcyB0cmFja2VkIGRvd24gYW5kIHNvbHZlZD8gT3RoZXJ3aXNlDQo+IHRo
aXMgc2hvdWxkIG5vdCBiZSBhbiBvcHRpb24sIGJ1dCByYXRoZXIgYSBoYXJkIGRpc2FibGUgd2l0
aCBhIGNvbW1lbnQNCj4gb24gaG93IHRvIHJlcHJvZHVjZS4NCg0KV2VsbCwgaWYgdGhlcmXigJlz
IG5vIHBhbSBpbiBkaXN0cm8gZmVhdHVyZXMgdGhlbiBpdCBpcyBleHBsaWNpdGx5IHR1cm5lZCBv
ZmYsIGFuZCBpZiB0aGVyZSBpcyBwYW0gaW4gZGlzdHJvIGZlYXR1cmVzIHRoZW4gd2UgaGF2ZSBh
IGxpYnBhbSBpbiBERVBFTkRTLg0KDQpUaGUgZmFpbHVyZSBwYXRoIGlzIGluIGh0dHBzOi8vZ2l0
aHViLmNvbS9wcHAtcHJvamVjdC9wcHAvYmxvYi9tYXN0ZXIvbTQvYXhfY2hlY2tfcGFtLm00LCB5
ZXQgYWdhaW4gYXV0b2NvbmYtYXJjaGl2ZSBoYXMgc29tZSBwcmV0dHkgdGVycmlibGUgbG9naWMu
ICBJdCBsb29rcyBsaWtlIGlmIGl0IGNhbiBmaW5kIGxpYnBhbSB3aXRoIHBrZy1jb25maWcgdGhl
biBpdCB3b27igJl0IHRyeSBhbmQgaHVudCBhcm91bmQgL3Vzciwgd2hpY2ggaXMgd2hlcmUgdGhl
IGNvbnRhbWluYXRpb24gY29tZXMgZnJvbS4NCg0KQXMgbG9uZyBhcyB3ZSBlaXRoZXIgZXhwbGlj
aXRseSBkaXNhYmxlIG9yIGVuYWJsZS13aXRoLURFUEVORFMsIHRoZXJlIGlzIG5vIGNvbnRhbWlu
YXRpb24uDQoNClJvc3M=

