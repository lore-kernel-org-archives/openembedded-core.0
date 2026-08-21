Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163B6C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 10:52:39 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4873.1787309550919454792
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 03:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lVhOESVG;
 spf=pass (domain: cherry.de, ip: 52.101.66.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dE6hQiOeUoAXbGpilsa8FZfw+A3TuJMmprOpWBSkCRArAIe0/RtELzPtEdOcNi3tx91DCvVQ1IkmW5bRV1MNBG8rtByQkhFtJqbG5fknAxIVT7WEh3S2YVr1JfUkW2IDttplTosCwjfUXpaNqsbwxVbak7VB6UnpvnoOjeqGPjENEw1BTjROrzL31co4U2A9IOrOGozmQQjDCpHsoDOB6deV+Sns9LkmPUDgVxHLvT7cVXQ5uIIKMjbRUs0xeO8Cbj2DaAt36OJe/ROkj7MAiOZ91+/526eIenRY/kh5qdjtbnjgNjntS8zeQSvZfVDCmw5j4Eyt6C8Wz89beQs9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqo4hkChIapXfLqcNUPLJhY0KqQNd7gae4BO+lCgeO0=;
 b=P1WCy5PyJ0A0Ql4R3JFJbKa4y43JXmqkIWc+7pRMyrOWOvq14AdHZEQdwNjakvdGARq+ZDVgqoXRwh8Q71R8Ej+kmXsNrvF0C8t/4LNpK2tZKgOwFhSRwWuZ+/TFy/GZ+OUhqwzJQV1DaKGXCMUWTTPTzhe7ybuyyE332SQSp59S+3TitQYof+0YGJaz/8FwKf2d30X7GFtljhIe0egIQdyiS2zl8HP476mmghMnwunWwLZdrAJGfyEcP5S6qSNqEZHrkknsLO/PqFIj7wwEbwm8NwFFl2punf7ZPljzOhN5C1275ez3+jC/lWWNazz369Vg5ZwaGHVPes1tRVsT+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqo4hkChIapXfLqcNUPLJhY0KqQNd7gae4BO+lCgeO0=;
 b=lVhOESVGF6O1369nnFSstE/lZcJR4gckap0muM6rDHWPOysDl+Vzz09bOxVxNmDX/WzEhYv7pmz46pvsHzDCRAhyAF8epcblqt8DXmO2i8Vpiz7vXJ6aovjImndb883nBmXYIb5B+EQpixAoPxQ+dX/yvuCehc/obJ8QBkpJgY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AS8PR04MB8468.eurprd04.prod.outlook.com (2603:10a6:20b:34b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 10:52:27 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:52:26 +0000
Message-ID: <b7072aaa-877b-4648-90a3-29bc85f187bf@cherry.de>
Date: Fri, 21 Aug 2026 12:52:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC v2 5/6] u-boot: fix build with OpenSSL 4.0
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260820181022.44434-1-jaipaul.cheernam@est.tech>
 <20260820181022.44434-6-jaipaul.cheernam@est.tech>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260820181022.44434-6-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0134.eurprd07.prod.outlook.com
 (2603:10a6:802:16::21) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AS8PR04MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: d677428a-d492-43a3-72b9-08deff7249db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10070799003|10067099003|4143699003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	PMGFpSqxx6FyUuQ+UFQ6elKh7/vK6E0IxEbp9ZBDzhgiiFV77THhSXxggabZGD6yvkoUa4uOlbixa6mv5Lz9h9kKuYXuUsA7YO/5KoznSHKE+6qglfvEOaLWgQmZr2fTD0GL+/4QMxbNYRocvltblpHOQzA1Fxm3Y3BxjlavJ21qqfD8MqlW7elVj8IPpJaslknUP3gSuYX4KxLWROYfE2x6atvemJbY4Xoaporrmt+pg9cCx1UvOflHcwERZ3K4dLL7sqZ7PkSj48M9vO7mdouoVTIA82RQX9KCGxx0ogsBv04UhiyIGUm/28qQmZQ2QE7cOSmW1HQPa13xIe+GebLzquO8yQ2NlduYME54z3qrSgFEqbGm6cTptL9Kxg0jHuqp7aqtxR73eEW34YdDOHhBaSrnXlYCOIRIpjIICiO3MhEIJcVg/cDfvO8DGzToF5bqi8gOwZSlgebL+JLlWcdbCFXZe9kF7yEneAv+IfSjOJFj6pQE3EPJFuOKujh+uQnynyhCizmp7E6oK1j0UWrZc09sxoW0kPfocoEA3Rc6PW+nrpoIPIhjZDIoyV5q3K9zfJUEWwcytBmWv4OS3fiVOvsWMQ9iYaoriumC4nHEWgphfKc0sI8111swki09mkDKzuQvoie21kML7F6WVMTHcvdS3tU6wHCcOebxyz8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10070799003)(10067099003)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UGNPRFFUVkxFVFd3dytILzdGSTBPUXhBaTE2bm1kbzhBb1lORkxBS1lCUjYy?=
 =?utf-8?B?amhFdEp0RkpBK3BxYlNwc0cveG1qcjhWazRyVWJLVjVmRkcyYnl6WmlySUVB?=
 =?utf-8?B?TEtNc3NJNWpmaXJMT0txVlM2ZXkvVVZPa25rWDFRN1N0RUt5VDhOQ3d6aDJY?=
 =?utf-8?B?cHpYbUh3QVZrOHk1L1dSZjRWUFhRcGFwMkk0NkNZMXF6QVdXTHU5WklSaFk5?=
 =?utf-8?B?WXo3eWxDcnpKbUZ2eW9SVFRpZ2VQSTJaKzJvS2tUN2ljRjMxOFljaHRINkx4?=
 =?utf-8?B?MkdMdVcwMGh6Q1pCQU5KR0hZeS9nbkQrR2txbG10cnJLNEJuOWhnZlRUV1RZ?=
 =?utf-8?B?ZGJ4V2J1U1BIaUZObkpWR29ZNTVibC9RMmp6ZVdyVE5QSm1TVVliVTlGYWNK?=
 =?utf-8?B?eFBrUDNqVW5ibkxaSnM4SkprdTYrdE9OTGpCeW1GeFZUd3BmcFl0RkN5bVg4?=
 =?utf-8?B?cGU1M05lbnNMUkc5Mng2S0ZVRDE2bFpUcWFWOGZGOVl0MVRxcGc5MFFiTmpF?=
 =?utf-8?B?QStXL3BFdy9iOGZIUjQxK2Y0anVhUEhVUkFpeEoyNmw0b2RaNllJU2VLaUpF?=
 =?utf-8?B?YVpjc1Z2NUpwTWgwVTc1U3BIcDhCcTRVRUlPeG5hSnVFZlNRUVFzbnM1U29K?=
 =?utf-8?B?OFRmNkJZdTZaYU5NVTd0QTdpK1F6WmhnQnphREhIZHJpNHpKNkR3ZVhJaE9U?=
 =?utf-8?B?TDF4dWlYd05HWEhCTjFWMUJDWWFBM1NVeW5GMFE3VEl3bkwrUHBzM2dvRWVq?=
 =?utf-8?B?eHJvUk1vVmZQWldvd3paTVIzOW13VE5ndXFGQy9XU0h4akszd21VTllWNER6?=
 =?utf-8?B?WFFIOXdRYVh4NFdWNjA3bGYzK3ZwQ09ocVd6Mk1aMkVTa2NZOTJxVjhiNlJF?=
 =?utf-8?B?bWtwdUgzcWhnSERYei9RQ2RSMWhiMlUzMWVjZC9UQVp4SlNQTUt2TXRsU294?=
 =?utf-8?B?ck9Kb0hsbG1IbGdFait1YmpMV2YyYTVoSHI4bDlDbHA2TGM2V3FXTGVzTzRS?=
 =?utf-8?B?dmpsVmRZS21GYUdjRWU2UlBjdktaZUhwOU12dW9MeDY2UWxINEd6MjBTTUx4?=
 =?utf-8?B?eXZTNHRra3RIeXpwdkVrVmtwNWhEMi8zV2tHOW1mYVZzT3dSRGV3OWowWjVp?=
 =?utf-8?B?Q3ozUSswSnBJMGJMTUlPUVhubENQdTY3eEpYSGlRTVZnY3kwWnBNM1RMSW5z?=
 =?utf-8?B?MVlUZHliYmZCNDZZQnVTUnFBMllxQnYwN0xlb0FCNitJTmRWOHVnTFkwQ0hF?=
 =?utf-8?B?NFE5ZkZlK05YTXVON0Z6enpVU2lFeU9xcVp2cENNK3B0ajBjVVBISWdDNnFu?=
 =?utf-8?B?ajQ3VS84dHpQWStqenNXRFBMaC93Q1FlcVJQUU1PZjJRYzB4S2dFQzhCbHFm?=
 =?utf-8?B?ZTV1N3hLWTBkL1ZPcWhFUG54YVRZdGMybWdtWnZjd1c4NEpmZkZ4NzFuNVJu?=
 =?utf-8?B?ZDJCaS80bFh6V3JOdFRoMk5LVUpNUldIU1ZNNDFPS0xmZmdPNVdieDVQUldR?=
 =?utf-8?B?N2xld2RmT28zemd2bmU1bjk0eHlqc256eXJpNFVBRTdtV0dTSDNmN1QwQnpI?=
 =?utf-8?B?bjlSNjVhZzQ2ODZjcmNpMFlqYXZRWmFOUjl1MEYwbmkxSUNqc213bTBxSm5E?=
 =?utf-8?B?QXZqOHlHU1NHY2tOeHBuZUlIR1ZSdytOUFhGWmhZblRLcVlZaE0yQzVQOWtL?=
 =?utf-8?B?K1JPWHZaVEhBR2hUQnVNQnBQcm5nWHNnWFZ3UjZVUm10TmJTRDRzTmV6ZDZE?=
 =?utf-8?B?VkJZRTRONGljTWFLVTF5K0FwaXRPZU5ybnhCNkFhQzd1KzFpcktCakdkOFlI?=
 =?utf-8?B?THd2Zk12bjllei9GVTNIa0RDNFhUeXptTG5iYjlXcXYvYjFLMlJjSWJ5em92?=
 =?utf-8?B?MFJVSmFxVzVYaDh6QWcyTXh6NFFuREUrZk9NNk5sa3BpRmc0eXlzRGJxY2Nt?=
 =?utf-8?B?dUFsTjVaVWlDc2JyVkVJQklCMm5kMEdmNGswYW5yd0NhNGpSSkRPb3prYnJo?=
 =?utf-8?B?UE5QdEtTSXFKWmxvWEIyOFA0K1JnaHBESVJKR1E0N3dWelFuQnRaWWgvVitR?=
 =?utf-8?B?ZHZ5a0kwemF1TnNOYlAxdXNKZ2NxRjg0YnY5eDBzTkd3b1BWTjlXWE0wNU9h?=
 =?utf-8?B?SVg0SVl2aG11d2hnMUVQYTl2eTBZSE8vYVVvTlhscmY3S2x1YUZ2YTlwblF1?=
 =?utf-8?B?dDVNK1dmTmhNRW4yRE92UjdJZUFrMjR2em50Nk5NV01ZUEpKQ05aR1NQUlN0?=
 =?utf-8?B?Rk5raVg2QTF6Rm1PcGJvbHRrSjBSSCtvVlFuaFNtSnpLTzJwTmxBQjlLekRn?=
 =?utf-8?B?eFJlTDVDL3doOXA4LzhxZ0h5dExlM0REbHFZRkJBTFdrVjNpUXF1U1ZMbzMv?=
 =?utf-8?Q?5eqMutd3RyQmWVJJp+PK7+dPwaw2HndfVNKU9OOJ1z5go?=
X-MS-Exchange-AntiSpam-MessageData-1: NelA3JD9JHBmnsKiyonrBkduKa9N7kPKqi8=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d677428a-d492-43a3-72b9-08deff7249db
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:52:26.5353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NA2wAmxKl0QfhGpYz68atUR2C7yrdRM751O7vKO12oH/unDpUKKgYQELwSwJs3/jpZ2zFTB1QtFfCJ3vf6GfI4mta8wLAByki2WgOHlPPtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8468
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 10:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243921



On 8/20/26 8:10 PM, Jaipaul Cheernam via lists.openembedded.org wrote:
> OpenSSL 4.0 removed the ENGINE API entirely. u-boot uses
> ENGINE_get_id, ENGINE_load_public_key, ENGINE_finish, ENGINE_free
> in lib/rsa/rsa-sign.c which causes link failures on all platforms
> that build u-boot (including riscv64).
> 
> Backport the Provider API support patch from upstream u-boot which
> adds OpenSSL Provider support while maintaining backward compatibility
> with older OpenSSL versions that still have ENGINE.
> 
> Add the patch to u-boot-common.inc so it applies to both u-boot
> and u-boot-tools recipes.
> 
> Upstream-Status: Submitted [https://github.com/u-boot/u-boot/pull/918]

https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/ 
is the proper link (please update the one in the patch as well).

 From vague recollection, the backward-compatibility shortcomings of the 
patch should not impact OE-Core as we know for sure it's OpenSSL 4.0 
that will be used (which we don't in U-Boot). I think it's still hit by 
the inablity to use pkcs11 (or other providers) due to trying to find 
the URI in the local filesystem first.

Fedora 45 will also ship OpenSSL 4.0 as far as I know (hence why we've 
got a patch from someone at Red Hat).

Feel free to comment on the thread there that this is becoming an issue 
for OE-Core as well, so that it adds pressure on us fixing it. I was 
planning on restarting efforts on OpenSSL providers (3.x+) next week 
though I'm unsure whether I'll manage to send something to the ML in 
time before I'm out of office the two weeks after.

Cheers,
Quentin

