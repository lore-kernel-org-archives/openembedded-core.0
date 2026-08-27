Return-Path: <adarsh.jagadish.kamini@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A940DC61DC6
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 11:45:14 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34540.1787831106737018184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 04:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=yg3AB16U;
 spf=pass (domain: est.tech, ip: 40.107.162.57, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxS7I9nP/GIhv5lvPfflkPRsb5ruj4KS2yIaNVSycmwKo+btbuWgfS0XnslfkPoWtVsDjPPu3DKN4KuGxiraX6cxgp5lnpHkaOTQrgk6BfC9ZLjb16d2wPOaFV1HXlw4/RpcJLAmpws0hB8fkIjBeJzIafKzlcrpDYX8NMAP4uBcZGrlgJjAg9KZLPRqbMKXIfPdENSUcDdxuCTC12+XZvP8nt0BwKYsV82eFGkcIS0ONr4qPW43G9qcAGkrVawOYzgFysir4B8nvXHmaZx92CnpMlh+Y+9XYzmHssZAFdEAMpWDiHtsvYIGMpHgy9Io0mTteBBxED03lcKVr6KJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tL1qWOT7Q35OyXtrB4joCVUUZbwNr3TivVmx+iMg9ts=;
 b=vXOPovOcAqueYxvx8APhMfIHf38QhPGsQPBns1vb7stZKvj8e+r0BeHISjer+BYl9NRWIgMVxbdUC3s5Hx7EwrX82GDgSh05TBvyERtCzg4Vt3PVM14JanGRnRollXn9DMLyU/3IpUUDodmk28n48WD6FgEIdO8ptCVF1kesqcPF7OmjysDmHSfNfA1sTviK5ET9Zy6m57DfJhCPY2Q/Kqn5cSE5TQ+QBZMRvsgoe6XIPsloJrFxw3v7UP/d5WrhN8EzFqMi+O1C31NsW1rz+/Jz9Z2hrd+g3sFz1V0xf5M99zXwcwzn2M+aqRbOs9NBKxklAx3Z22zAH4LLSlJjCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tL1qWOT7Q35OyXtrB4joCVUUZbwNr3TivVmx+iMg9ts=;
 b=yg3AB16UoRlkq/7L4IndynD1asAc+GXpkss68lYlehEee3U7Cpp3CS/j1uGHw+QGMhMlm6Ca7f6w8OzDPXR/jEMgm8/VUFmHLkT7Nr813IefYgLP2bEvSz3w5yfwg2J6x04+gkbBdn7N68Lzc8dIL40r+XOdcxjRlAaanraPAwZKEtedrYjrr237Ax0G3vHu9+Q+vkzpmv1aaFeAI6DxltSPv3nf3ToAz+hlM82K8OBloAPqTd8R11FOT0Z2oT8r+2l4gPz369EprMLTxkd0wD1lflyLx6HNDOg1VV23pew5HOL+UPVP8+1KUUu5iFynKR9yT3PmMaKMIw9P2zCVVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB8P189MB1046.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:166::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 11:45:02 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 11:45:02 +0000
Message-ID: <9815edb7-f89d-4a01-a5b0-d33486c95e1b@est.tech>
Date: Thu, 27 Aug 2026 13:45:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH 1/3] expat: fix CVE-2026-50219
To: jakub.szczudlo@nokia.com, openembedded-core@lists.openembedded.org
References: <20260824152023.19501-1-jakub.szczudlo@nokia.com>
 <042a154cf3f65594e4d46156f4df835195b68f90.camel@pbarker.dev>
 <2789044.1787732076156082495@lists.openembedded.org>
 <a801b816ecbff66fc39732801eec691af21ce3ac.camel@pbarker.dev>
 <b8b848b9-81ec-4a9e-bb4c-d1e196eeb479@est.tech>
 <2326647.1787828731489290062@lists.openembedded.org>
Content-Language: en-US
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
In-Reply-To: <2326647.1787828731489290062@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::19) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB8P189MB1046:EE_
X-MS-Office365-Filtering-Correlation-Id: e23ffdec-66f6-4920-68f6-08df0430a127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|23010399003|366016|376014|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Z4kuJSATPX35YwrPEK9Wy6OEsOWYOSPbghRJtsJzxH8bWCA6XMrhhcS6SLq7vd0rv0nGESiHZnmWuxk7uJ3GVR8yHNAfs+xogm78uYrzLA/ronerbMS0u0KV6PPrbXXU+o2Qr5ooygy/A6F7ABFB0lOTwHokvEZr3kshQ7j0vcS2cAll/olSr9Kl0fScZbZtWGxHQEq92sr/6otNucMNeVe6IgvkynF3Z/FeaB+SQUoSEDJpS7k1fungRWTfXzo3m6P08ZW1X727PvlLNm+P/NXGhnvZWgSdmK/ipIDe/xB00C5++6ZpzKtFDBzSXDBm5FsKXX4t+Q78Odn1eArbWhJNs2He8Z0Uxe5v+57FjfYEZCSJI6RgZuyFZS14+nw4qhCMmaPxM+v0zywLkgpgiZ3iamZaVP92HaAuyXlmxGDtamjDAqu3ben1ARMF6amyOC+RnFiQ0macJzRMlu/8MGyhdEqwYtMWu5I1J/QAPy9AbrUsCRQhxNu1ATDGIui7pSQCKQrEIDFVZHCIgbowGxQpxl92gUAHjTHv6r9FC2Qm8tqhdG5HLPSwZ9l31gLmwZrWcUW/hrjcegaRMYb5TIjeLnh/FzfYOGFck7eYG90=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(23010399003)(366016)(376014)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eU1ZWTJ5aHRrNEFzYVYyMjRsdjhWaHlzenpCRlg2UzVmRWs1YWFwaGM2d0Fr?=
 =?utf-8?B?ZEJjZVc0ZU9hQnhZVVhwSFdxS2lxb2R5OCtvSnZUSERYQjl1SzRIMUxqY1A0?=
 =?utf-8?B?NnZIeFhaSHE4bEVMSXF3YkRYRkQzTlFDaHg5S0RvS2NxUHVEWW5Zd2g4ZWZP?=
 =?utf-8?B?QUNWWHJvOFFjYkFpbXZFMWRPMXhBS1pnSVZRVlNiaExBdjhsaExoREo4cEF2?=
 =?utf-8?B?WnZ4a1ovSkkyeGZ4QW9uTHZJcGFZYklQc2k0aE1HRHlranFIUjZweVZZd3Iw?=
 =?utf-8?B?WE5VS1ZoRGROcUpHeWplN0I0TVBTNDJmRUlzQ20vTEwwbU5Od3pOTi9RME45?=
 =?utf-8?B?WlVJMURrSkdQeW9yZDVuU1NQZUEvcXVZOFRMY1hYUmZ0NnhlbXZMMTNya3lk?=
 =?utf-8?B?N1Ayck44MktPN2VrRUJvY0M3V3BBa3BLS2xPSy84d05Sd1Z6MnM5cDJOaDVZ?=
 =?utf-8?B?bjFZczFyNGVlOVkrWE5kTEZFWTRoOW00NDcrMnRmWVRlcmJUS1lOUVhialdu?=
 =?utf-8?B?N1NNejFXaEVwNUlRd2xNYmkySDhjMU1oTVpDK09Fak5lSzNOV2hjcGxRaEdm?=
 =?utf-8?B?UkY1eEVlYnFOZ1U5SFE0Mng1dUVpdTk5MTlYZ1VEVmN0dERrOWRCZ3dDRHlB?=
 =?utf-8?B?dWR0NGhJM0luWWJJTzduV3NrWXV6WFhJay93ckdnbmZ2S0Y3aHdoejVrRlox?=
 =?utf-8?B?eFFsSmVIaEFtdkttdUlibVNyaGU3M1hFME9VYnp4NllIOG9QYU5Qd3BBbGdR?=
 =?utf-8?B?MnlXaXVUWldSYUt3dUZnR2dJSHpUcndhVEtFRldYY3NTSEs4eUdsS0loU21v?=
 =?utf-8?B?eVF5NVFUTFRUbkh0eC9aUitKbmFjakk1dUdqcEJWbjJKYzNmQTVrRC9iUk1Y?=
 =?utf-8?B?SHl2Sm9wTzdvcnllSDJJdndIZzhhc2pNVlkyK243cmMvcitYYlMwVCtxT3Q5?=
 =?utf-8?B?RU5zd2xVZXVUYkdYL0NPdG9Bd1gxaUtCQnhkbTB0dldRL2p2SFlzeTV3WGJ6?=
 =?utf-8?B?bmEwRm1kamZ4UkE3c1pveDhxcW5MVjdZSU16NW1ZTU00UkhFdUU2eXp4eUo4?=
 =?utf-8?B?Nit6OUg5d3V0MXE4K1NxZ1BhR1l6b3gvMnl4OVZmZmJhb0RzVEx6V1RsOWYr?=
 =?utf-8?B?cG84Tlp2SkVWR21memxJb3dKUHdvTUV1T1F6OGYvd3NjYXFuU2pHcFVOMnZG?=
 =?utf-8?B?U1BWbGRyN3lhZzhkSldaQWJGbUJsRzdKZ2tsVmQwK0luZ3hoSGFBNUFpbk96?=
 =?utf-8?B?NVdDWjcxb0I3YzZRQ085M2RkcUFiaThidUMrZDlGNXFpNXZmM1JDbWhLcU9F?=
 =?utf-8?B?NCtiVWhoUmM3ekhVVmNrampmaVVyZm1JRzZQVndJaTlGUnNnZDNQM0RuY1Ir?=
 =?utf-8?B?STQzM1NMWFNsMXV5NHl1bk95dXFSb1laSHZCRG80b3hUbFJkTEQ2Q2xySmZL?=
 =?utf-8?B?UzFKajNHR2ZvNlFRcDhJKzZKdlRiQ0xhUHE4NXZ5T0lsV3crYmlWYW5Ud3hZ?=
 =?utf-8?B?eWtxbEc3ZTJnRjM1ODVIZGZFOGtCalJ2TEJiUURKQUxJSVhvVmt5SEpZdnRz?=
 =?utf-8?B?WHVYTFJQcjNsck9RQ1hUbzZEZVpLSE9sb1pQeW9veFY5dmFtZ2RzdlNSZmJk?=
 =?utf-8?B?UW5iMXg4eHk3YUJJdDNjVWFib2tFSzdBKzEvY05tWFVGZUJsZWluOXc4d1NF?=
 =?utf-8?B?RzF1dEw0MThMY2hTbWwyeHdiVWp5NnJYaitDV3pNd2JtOVhrMjB2UThFSkZK?=
 =?utf-8?B?QWtOK3NGZmVpRmU5V3BBS29UeUsyWWlPQjhjM3JGOEYyYlY2dFVQemV2WDBk?=
 =?utf-8?B?U2FkVUE4UVJLU3I1a0pJUnpPRUpQUE9jZjk4VURZUVM3TGdMR0l1V0xBS0V5?=
 =?utf-8?B?K0RYTzhva3JZTDd3VWozSGlNWkRObGpqRGVJWWZjT2V5Nk5TNnVZUis3OHRT?=
 =?utf-8?B?UTRISCt1bXBWVzVwZjI4UnNUdTFFY0wwc3dZS3dRRFdKTVVINEdKM045T012?=
 =?utf-8?B?WlNHSFpoRDM2NURMYmtaMERDQjhuaGk3WTFiRWNYaW5XL1l3RHptRXpPSVFM?=
 =?utf-8?B?U0xVbDRXZ1lkWE9iOTZnWXpiWkY3QTNodHhsdWgzVVM0a1pVT1pGTnFhb1Rl?=
 =?utf-8?B?RGMwc0dLc2Z1MHp5RDVEUys3djRXcWhKZ3BpUDdrWDh3OVZTT1pFTjJuSTF1?=
 =?utf-8?B?L2dUcmpNUldPSlBaMi8xdm9zQ0NzRThIekNkN0sxUTRYdHBIY2RVeVpybmhK?=
 =?utf-8?B?elN4TDJaL05wSUhnSDlIYTBnR3dVZnlDY3ZJRkRUZ3owdnFyZ2tza0VzdUt1?=
 =?utf-8?B?aERrUnlhelJxeGRBei9MQW1naEpJY1dRa2g4UFZEM2d6Y0FyZVJwbUp4TytM?=
 =?utf-8?Q?o/ki4lFAdRuz8U24=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e23ffdec-66f6-4920-68f6-08df0430a127
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 11:45:01.9404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHv8PFLgwKVvoNRmGpHYWaSiV2aba8yBZLkallQepuYXVNg3LfdRSE3lJYx0eRqnScJRQDhwfmlGbronx62nR1dKWbynZfuY64S9cZjb2qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 11:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244478

On 8/27/26 13:05, Jakub Szczudlo (Nokia) via lists.openembedded.org wrote:
> Hi,
> 
> some words also from me:
> There is no deleting of functions in expat version from 2.6.4 to 2.8.3
> Backwards compatibility should be intact.
> There is a deprecation of one of hash function XML_SetHashSalt but it is 
> still possible to be used
> The biggest change that could potentially break some unsafe code is the 
> fix for CVE-2026-50219 it makes parser rejecting free/reset/re-entry 
> when it is already in used, so it is defending against possible memory 
> corruption. As it is a fix for security vulnerability I think we can 
> take that risk.
> 
> I have also tested it using ptest from packages that use expat it in 
> runtime like python-xml or libxml-parser-perl and all tests passed.
> 
> Best regards,
> Jakub Szczudlo
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#244476): https://lists.openembedded.org/g/openembedded-core/message/244476
> Mute This Topic: https://lists.openembedded.org/mt/120905189/10182374
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [adarsh.jagadish.kamini@est.tech]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
Hi Jakub,
Thanks for this, since you already did some analysis for scartgap, is it 
possible for you to work on the scarthgap branch, and I can work on 
wrynose (So, we don't accidentally push the same patch)?

Thanks!

