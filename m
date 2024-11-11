Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C85D3ABEE
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:49:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web10.67178.1731350959345445780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:49:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RHpasyGg;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RHpasyGg;
 spf=pass (domain: arm.com, ip: 40.107.21.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I4ydeU8e6LZ4MzpWrQJbf7/sVtjIGmqoTz0pLbjxpHX5vJFNL0xG0N3dj99e+rR2tIIj8qsuXF0+xrn8lwKFPkRlGzez/+HADq4Ep2FduT2quyQQRDFAHFbYkKOh6rS93lc63eDPRU/XJyDSCBxZZgMKQRaDWROGQZwTnXQamG92OPuyUXPiNkjd2it1tiLxLjzwx676WDIoMgvt5MEBwlVdHnZJYlQR4//efjxUW9IGiMSFtY6rJwnPE0Yzzcgq5aiygWrcRu5V3OHVs7AG9zcAB7LJgvgUkldf8OoFQHexsOfkWF2MbXDYI13szcxu8I66e2iiV+I4+86IyvUFwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TsP3nTMPuiYFCI+MMc+La/+bt2usx8r33vesom6uBQ=;
 b=Sze3etGUxXNREmLf6dsaUehD1WU60MI+SeueymTmtCl0ITf/Heh/ne6dEfj0Xpohm9rs1PQ7NMoQ+lB55Pit0WEPuokhmerhjuScFnyycqsa7jaM2TYvozvXXvCgIglxUNgWMz+kFDCj9E5pAkOCF2T+iieCoDA9YwTBmH6CvkehlAo4DiAg2v8Xn2UI+aswV8Ua/Fb8faxejgMosfVHbBUDT1GCA+9pLbPOWCC/VbVrJGVfWBLOSvvi357X9slbTNjYxmbxfEhXlM1T6EzWJfKRY5DfbNX42FxkkbET3q/SeBVpBAd3MIQ4orGZdN0LXChd/7KU5lVfikJKMbvxow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TsP3nTMPuiYFCI+MMc+La/+bt2usx8r33vesom6uBQ=;
 b=RHpasyGgtYjSondYJ/M4FgjnsWEr6BqAM0kMsn7n69UL6Z/3myVzOJyxUqFHGk9b0dV+hZaSMNRNZedUEhO7L094sGka8iC+vYie0LJ4rcXZ6x4xsxOVM5rWwX25iHkrVlbQz355yK+y2abBjXERfb0EChu7pQQhyxLh+RSfF/w=
Received: from DU6P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::12)
 by AM9PR08MB5875.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 18:49:15 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::a9) by DU6P191CA0012.outlook.office365.com
 (2603:10a6:10:540::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Mon, 11 Nov 2024 18:49:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 11 Nov 2024 18:49:15 +0000
Received: ("Tessian outbound aeb378f8fa33:v490"); Mon, 11 Nov 2024 18:49:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c46fc39519703d44
X-TessianGatewayMetadata: PMwzG1elmT20HZSNR2lTn2u21PN01Lm+OURWCIZOoD4Ocoy3yc03xhT029UxcWJ0w4lk+TTGnMNjTOhYwEsnu64X2ZGsO4tVFd1XO7fjX9sjjuiEUQDH4j5vEG4AUgkg0lL96n62hao2cfmg5PSh1/bFHTa7fmg6mT4GQl6NyfY=
X-CR-MTA-TID: 64aa7808
Received: from Ld80a64e765af.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AD5FDFAF-0DD9-4B91-9EE9-5C1BCFE7B8B0.1;
	Mon, 11 Nov 2024 18:49:08 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld80a64e765af.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 11 Nov 2024 18:49:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9H5HStT3Anf8jb3Zua0bgwxcTy0ncSW2QXKIC9Uh4Dl8DGdSRXhOQj9yKiFfw9/kikzmhNmp88DPyAIB7wQofGc5xW2uJRWQkMKr1Gx4OlM/zZBz/vkDDj32ThOxtPhPBnK401zqf7yqR/HBaBst9Bok8B0R6bLl++N2Yos5vs8k2IDcqApal3zK5QMfD2LyhBtPpogsOF9c5n1dRnWAngnM0ivhJIk/8N3Kj8o2418Wkpz1h+JtwuqpgceEpUmrcfP15qWxyXs5MXI6VYHf9oCo983C+P+MfxW6GVyr8pxnUfWzCVgzh+2B3OOhiFzQFZGJCU3Stl8g2DES1XEtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TsP3nTMPuiYFCI+MMc+La/+bt2usx8r33vesom6uBQ=;
 b=QrhE9xQfzbyJYDtPMmeSHV7N5fTsyJ1gTXtb1xtyB5BN455cAaF0tmzagbKly4c2mE82xLUp6P90ddvp6PIfP9fdWGvjbsSkO0uA8urbt0gbARlbTsnZK6S7/KR11QEaWjnQI+1S20BFbo+bbtt6j7rPLC0MyGoLEGXaYxkJt/AQlmmoWKGFNLje7JilQyJ+tYwSg/6TZKO6PFU4X7Ka6c905NmRz99UAF485owBkWP7sovlMMijURXB2rS2B46ZbFGZiriQwcM8mNFMz64ZBIpRz58Pvmwt6YH0JXsNIWdIBNMrcA5+PLatRe/RXQua0TOawKn28dNpGtFkIJ08wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TsP3nTMPuiYFCI+MMc+La/+bt2usx8r33vesom6uBQ=;
 b=RHpasyGgtYjSondYJ/M4FgjnsWEr6BqAM0kMsn7n69UL6Z/3myVzOJyxUqFHGk9b0dV+hZaSMNRNZedUEhO7L094sGka8iC+vYie0LJ4rcXZ6x4xsxOVM5rWwX25iHkrVlbQz355yK+y2abBjXERfb0EChu7pQQhyxLh+RSfF/w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB11184.eurprd08.prod.outlook.com (2603:10a6:150:1fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Mon, 11 Nov
 2024 18:49:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 18:49:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 9/9] systemd: don't use deprecated meson option
 values
Thread-Topic: [OE-core] [PATCH 9/9] systemd: don't use deprecated meson option
 values
Thread-Index: AQHbNGWnV13PQvEld0WcaYyN8MCo/bKyZqgAgAAFRQA=
Date: Mon, 11 Nov 2024 18:49:06 +0000
Message-ID: <85CF8ADF-EABC-4618-9BCB-09A7B1D75DF6@arm.com>
References: <20241111181341.3296523-1-ross.burton@arm.com>
 <20241111181341.3296523-9-ross.burton@arm.com> <ZzJNLFKLeUVGKDoQ@nuoska>
In-Reply-To: <ZzJNLFKLeUVGKDoQ@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB11184:EE_|DB3PEPF0000885B:EE_|AM9PR08MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c12d6b3-d0e6-4105-06b4-08dd02818a8e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Sm5KNExxc3ZPMmRLWGtabnBZb0JOTGQrdlA3VEFhajlwR3VNRStBUGNsTDJ6?=
 =?utf-8?B?V2JHWkhHYXlGTVljQ2ZFNVNJaXJWa0owaEcrYTBMREdVdk5EREVBWDhJc0pZ?=
 =?utf-8?B?b0xhQlRYZkVCMlUyTFlQdGJqd3RTZGljRG8zOWxuaUJsaHJybjlXNFdvbEtQ?=
 =?utf-8?B?Y3RRSXArTGlRVFRuelFRWVUvNDg0OEFJQnZYejVyRWlaeHNtdDhoZEdjVWRL?=
 =?utf-8?B?WHF4NFFxSUxaRHg1ZUNRQkhDVWpPTE5ZeFZwTDJxQkxEK2VkQThVTXVkaE04?=
 =?utf-8?B?QjdyUDZaYU16S2FscnI3MHlJQ1gvb0RFekJpdmp3T05IbDBMU21rMERvek1z?=
 =?utf-8?B?WVM0SnBjN0NadnBITVZLQkRjdkg3T244cVZuM3pxY1dwei90N1FyUWM3bmk3?=
 =?utf-8?B?N2MyVjNyZ2RYcm03TzI4RGx2MnVLMExkNDRSMjN2b0VtTHdkSTVESW5CRFhM?=
 =?utf-8?B?ZDBmNk1tblR4RjRpaDl2NVFpc2NwZGU2eDY3VTd0MVBlZ0orVmxhMGtuWDkz?=
 =?utf-8?B?TjFyY3I0aXBTRlVGTWxmNnFYcUgxdmt4Wjc3WWZDUk0xVmd3MkN4bUV6eHVS?=
 =?utf-8?B?QTZENWZ1SVV2Y3R1a3B1dVBEdDJoQTkvV2dmZHFnRlh1c3lOd2JqbGFMQTdO?=
 =?utf-8?B?ZDBHV3BPR0dqNHJwc29aS0wvandXRXFSOXBMRG44MUhROVhMZnZoRTZUL1Jj?=
 =?utf-8?B?bTNKVUpFSzFyREYwQ29GbGh6RVZ1bTNXUFkvcFVrRzhldW53aUdlbVVmSndw?=
 =?utf-8?B?YUd4NXhaYUgyYzBDSlQvZEgrZGlQREtTWDFZNHgrOVpvUysrc3pzbEtpTVpq?=
 =?utf-8?B?a0NlTUZTVFArdlNFcWw2Wi92c1V3bHdycnBhelZ2SzBMeVI4WkJIcjVBWHA0?=
 =?utf-8?B?YlRlNlNVck5xZzBpRm56NjBIcnVveWpSMUxPWWFsd2JUZDdhOWNMdVdCWmE4?=
 =?utf-8?B?bU9tMjJBRUNYaUpvbHArZ1UzRW9RUFhMdzdTVGRPV0VwNHJHa3UvU05lc0M5?=
 =?utf-8?B?S09OenFpeVQ2M2RjNlJWQkUwWXplbkRmbUl4QnFJcDFWVzNYYzBndU5JeU5T?=
 =?utf-8?B?dDd1S3RGTVNBayttSFFWL01tL3dtQkQydnZmVksxamZ4RTQyaFgzZUxyanFk?=
 =?utf-8?B?MzJWcUFZVHNvcGgvN2tZVU1mSG5Hd3BiS2UyNVhZUlJ4dmNLT2hTNTlSbVls?=
 =?utf-8?B?OTlhWlBoTTU4OU5ycldYOTFnQzY5RmVSNEIzREt0UEtlZHdjOWs2TDAyUmZO?=
 =?utf-8?B?WHZwVEk5ajYvdEZFcVRGeFEzdk1ESXcxOXJ1aXJHSDQ4Y09ZdE9tbWJrbG5t?=
 =?utf-8?B?VUdBNkNPaktCdXJ3ZDNwcFFTN0NEejJoVTUxSllZZFFiOThPMFNCVk1LdDdy?=
 =?utf-8?B?RzlYYUpmOUE1dnk2Qm5VcVpQaWxMdURhWWt6MExUQzBmeXpuTVFtWTEzNk5F?=
 =?utf-8?B?c1dLTE1EbnI4ME1ITWU3STA5cFFYbWIwRC9PNHFVY0lWVWlydHpWdExFYkpH?=
 =?utf-8?B?M05acEcvQlBrOEZXdnNwU3IzU2lFdHc5UERlVjZrdm0wYzQ3NE03N3ZqblRs?=
 =?utf-8?B?cUswUDB5eWhpMHdSUUxzRlpYMjFyZlNLV0hXUC9yY0VKWTh0enVQeEh0K0NB?=
 =?utf-8?B?TnZ0eXY1aC9QYkc4U0Rjb0NTK1FKQkRLSklEcUFobjdQRU53UWQyT1lHREFZ?=
 =?utf-8?B?ZlZyR3J4T3M2V2hhYUlZRzIxMWlrM3I5Y1lOZy8wclRZVXV6eGZjR2pMSDZw?=
 =?utf-8?B?WklVUFF6ODVNMDVodUdJSWhWQWlsNkhveks0Z2tLSmJBTnNXaitsZm9HU1Qv?=
 =?utf-8?Q?Wts2XWlwYUB0rg71ueLFxnCcNJApRczsjsqcA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <407235EBDC8D36438B60B802E413F7BF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11184
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c022c079-89f5-448a-6c6a-08dd02818543
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|376014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dWo3KytzRGtPYjlzYytKQ0NVU0pzUnpGYmdDYUtLTGFLVHRWQjMwRXN6eFNs?=
 =?utf-8?B?dzA2azlaQTY0N2FZSkhITFZVNW1jcVBFZEpXSld6OG9vV1cvQ0JSbWd2ZlEy?=
 =?utf-8?B?N2t1WUExR0VkYm4wZ1d0dkMxTXp0Nk9LTjN2TXh2SGVabUtqTnpOYnQ5OURt?=
 =?utf-8?B?aytjTlZHb0RxbGhXNThib0wvRW4xbGhUN3IxK2JSUWY1WFg3eWRxbVRiSzc1?=
 =?utf-8?B?TnlJVUxMUUF2WDc1V0lvTDY2aE12aXJQblFyU2M3TDJnYnFDRHhkbURUejZX?=
 =?utf-8?B?R1JRMDZxVTZaeEFVNG9KZ2VaSmYrVFhRYnp3QVRKNEYxUy9sbzdzU1ArdGRs?=
 =?utf-8?B?dE9MekRrOU5YZ3ZCVlZERVhIZkNHV0Q1MkZhMEUrMkp6eFZXT2ZsY2xmYStR?=
 =?utf-8?B?Yk1XcGRWNDBDSnNIM2RJNVJwbXhBa0VPcWhjU0FRdWwvcWdOU1JkUFFDeVd1?=
 =?utf-8?B?aDQ4MWNkL1pFdm5YYVRUL0RORENOaWdFWXpHelE4NnJrK0I0NWNZUTNhMmM1?=
 =?utf-8?B?akxVMjgzZWFoOEd0Vzc1ejkyTjhiY29nQzMyYmpPM3hXSXp4TGRLNjh6Y05n?=
 =?utf-8?B?T0xvYmZ3dzNPOHdGWVhwRWVOdnUvLzFOQysvYmcxMndoWHc3dkZ3RmNNbzM2?=
 =?utf-8?B?RWh5am1PMVhOaWl5TjRjeDZFMDlHeE8yQndFczY2ejd5M3ZKUEE3MjFDMC9Y?=
 =?utf-8?B?TW9UdVA3T1FjOW1UQzlOSE5vbkZMSWQxYXc5MmZNbmhHK2t3b2U5VWEybUcv?=
 =?utf-8?B?NUoxSjZpUHhXZ0gvc2pMOGR6NHlyY1pWdldPb2xQb016b3dPR25WUDd1WXR1?=
 =?utf-8?B?TVFsRThuVWh4emVCQTY3OS9yZERLWHU2MS9KUFg3blFQVkV4QnNvNElOWmhi?=
 =?utf-8?B?WWpMTE9aaWlkbzE3ZFJKQkhIZWl6djN1dGUyNXNWYVdhUjNrTFdxWDV1b2xC?=
 =?utf-8?B?VCtFbDAzUkhyZmhkc2Z5OUF4ekRORDRmTjBYUmZ5MEZkdnpjaTlXNFhhdGhX?=
 =?utf-8?B?bmRUQ09CVHpkN2JjbVQ4NTZYMitYTHBsUVlNK0hJNUpUUzVMTDE2T1Y1dCtC?=
 =?utf-8?B?MDhQMFh1SHpZMkJnVTJlcEw4OU9tUzNKRHhRRzU5KzF1U25zbWVGTFhvOVd2?=
 =?utf-8?B?aUtrZVF6MnFKdldwUHFPUzUxc08zaTduOVdSSzFSZ1c3Q0pSYjhBVmt1N3Vq?=
 =?utf-8?B?NGZPNUl3UUNGVTN4YW91MWJLT2pPaWJTd0tudElqQzgyK0NnOEtJeXJwbVB6?=
 =?utf-8?B?bzBoWTBzYVBFdERzVm1hT2hEZFhNa2wxaVprbFVWTUxEWkp6OGsvTDdzWGpQ?=
 =?utf-8?B?cTA0eDZiZEllMzJadzFzVzRkeXpRYzQ5MnRXMnN2TGQyeW1ncGQwR1VUdmFC?=
 =?utf-8?B?Si90MnlnTGdaajk2Mkw0TGF5NGdoQ1VaZ2RJZHdGRU9jcXVlVkVpZWF5UWhy?=
 =?utf-8?B?dE45VVliV3lvNnRhNUtoU3NtbTlhTEYrNFdXeUZDb0tPRURFbDNrSVg0SDVJ?=
 =?utf-8?B?M2FBdDNHQjRDQmdtNnpRR240YmZjb0RGa2pSU1NQSjByMHdlelVsVjU1bm5i?=
 =?utf-8?B?MHEweHBpeEF3OGRiZmlmdjB4RHF1NExqbU0xQ2YxdTcxVWttSlNjclBmKzhL?=
 =?utf-8?B?MWF4Nkl3c200UENvaUU1QWpLZXpJWi9WSVFtWXNwUFZmT1REd1Y3RTVxWW5O?=
 =?utf-8?B?RjU0UFZ0R3lxclo1K0p1US9yU29CNDlVMEdvWDhuM3JKZ1RXUGN1bVJiM3hI?=
 =?utf-8?B?M21tOG9SR0thQ1gwV3FCbEpFZ2YwN1Z1MHhpbTRJdXNMbjRGV0VDRmJaaDNU?=
 =?utf-8?B?dWVRb3FjZnRYZkNmY01SY3lKRWdUNlRIQ09RY09aNmlaaFZSWUpFWG92Vy8z?=
 =?utf-8?B?TksyTTZPQzZnT3J6dXlPN1NLVno3ZktGVjIzNkE0c0xOMUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(376014)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 18:49:15.5078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c12d6b3-d0e6-4105-06b4-08dd02818a8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5875
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 18:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206979

T24gMTEgTm92IDIwMjQsIGF0IDE4OjMwLCBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5h
cm8ub3JnPiB3cm90ZToNCj4gSSBzYXcgdGhlc2Ugc3lzdGVtZCB3YXJuaW5ncyBpbiB0aGUgcGFz
dCBidXQgdGhleSBjaGFuZ2VkDQo+IGZyb20gb25lIHZlcnNpb24gdG8gYW5vdGhlciBhbmQgdGhl
eSBhcmUgbm90IHN5c3RlbWF0aWNhbGx5IGFuZCBjb3JyZWN0bHkNCj4gdXNlZCBpbiB1cHN0cmVh
bSBzeXN0ZW1kIHNvIEkgZGVjaWRlZCBub3QgdG8gYm90aGVyIHdpdGggdGhpcyBjaGFuZ2UuDQo+
IA0KPiBJdCB3b3VsZCB0YWtlIGEgbG90IG9mIHdvcmsgdG8gdGVzdCBhbGwgY29tYmluYXRpb25z
IHNvIHRoYXQgbm90aGluZyBicmVha3MuDQoNCk5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYnkgYWxs
IGNvbWJpbmF0aW9uIC0gYWxsIG9mIHRoZXNlIG9wdGlvbnMgYXJlIHBhc3NlZCBpbiBvbmUgd2F5
IG9yIGFub3RoZXIgKGVpdGhlciBlbmFibGVkIG9yIGRpc2FibGVkKSwgc28gdGhlIHZhbHVlcyBh
cmUgdGVzdGVkLg0KDQpJbiBjYXNlIGl04oCZcyBub3Qgb2J2aW91cywgdGhpcyBzZXJpZXMgaXMg
dGhlIOKAmG9idmlvdXNseSBjb3JyZWN04oCZIHBpZWNlIG9mIGEgb2UtY29yZSBidWlsZCB3aXRo
IG1lc29u4oCZcyBhdXRvIG9wdGlvbnMgZm9yY2libHkgZW5hYmxlZC4gIE1vcmUgcGF0Y2hlcyBp
bmNvbWluZy4NCg0KUm9zcw==

