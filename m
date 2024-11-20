Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2406D711B1
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:20:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.80])
 by mx.groups.io with SMTP id smtpd.web10.16095.1732116008862144190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 07:20:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KTgrs6xy;
 spf=pass (domain: cherry.de, ip: 40.107.20.80, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdOC69Vc640axHokRMnxwmGzyTd3npuk/DX2o1aTbjLo1S5EvawUbgSycSut5jJj4ddIGi6+umvQAua4QIkCC94R9GhqZ0M3KNmFFdLeUWdhsVslbQV33yCdb3anfLCqK73i0X0T8dmA9crs5O5HeYbeRQHm58M/wecjC3hDpXdg/WJRbUjpuEkGDQ5IraC6M/sHPAqFRku6CGYeh5U7y88Jc+JER3S3CJ7kBleV5WANQrrFgD5V5SbPUGBs91nbpduB2Zd87cRjP4TNgba2d6P6iLNIiLNTe/03ruTjlK5YSp2hRN5eiPlDKZuNP2/5dLd/qDcKT4Cv58TBbDHr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNpJkEY2FawuEWpPo6gUpz0izxMN8sxMlD8GWjVt/9M=;
 b=rmJaugGU6fLf7awc3TvON672mcgiHuXZF54IrYEfSRR+MUCg6FKUKltdr9hEOIxHa5SiINQWr9ZopdV5H15c6z8xA+94cEqVZ2Cq5sQmHNBbKtR9/zJMiHjkIFGWCVyvaW23ApeiQU4PAdNu1ZNqXPJ4yOwqAucCp1Xe1YTW48s7ReJD2dJHG+UkG54BrcuZ+hrobtlaQxkBnw/1ROAqUxB/dygkTdRKnBEW6yVv8zdIiHj3KZH5BrrII8Dt9xOf21HPSIXTQs+CWaIJN+0M2faXZpkVXBt7evL+3jxhJ9grO7Ok/Xb6jOZR0PRFfVMdKc1xPlmCUQnP4yq8stGong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNpJkEY2FawuEWpPo6gUpz0izxMN8sxMlD8GWjVt/9M=;
 b=KTgrs6xyiZylxJ6gNU6s7k0FWFohZZTOFiAxI2626KPXmSomdRB+Voc1VC694NkyGzJJ0VH07kwUAnaE81WT3ubUiMNTDWxIq/BO2Xu4CjOiXQDZMvmRpgUGNedNc7sHwRK4XceWjZWf9fxCjgrruhSM4QNUrtpjZlahpcR9Abo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7938.eurprd04.prod.outlook.com (2603:10a6:20b:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 15:20:05 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 15:20:04 +0000
Message-ID: <2bffb899-bbeb-4459-8110-7b6fedcffbe7@cherry.de>
Date: Wed, 20 Nov 2024 16:20:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] package_rpm: use zstd's default compression
 level
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20241120150346.2279992-1-alex.kanavin@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241120150346.2279992-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4313d5-759e-4399-ddc8-08dd0976cf57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QVZ0bHFuMkd5M2Nla0hSOWFTS3h1V01PZ2ZNMUFTSG8wWWtvajhQL01yOXZK?=
 =?utf-8?B?cjVmQTN2Vnk1d3RjdzNEcUkrdUw3RTN1Q2NyU3BPUHVjZkNuaEZjTlgyazNU?=
 =?utf-8?B?Y08rWFdhaGFhdTMvR3ZKeG5YUmtLM2gvVzNvaWQ3UzNFeHAzOWJFZWhMWmJ3?=
 =?utf-8?B?bUFQZzlGTS83cDlJQlhpN3dQTHdFbmxGL3o1dUxGcGhXeFZhdHdXMFNLT1Z1?=
 =?utf-8?B?ZDVKejBRSHpXN3Q0b05pTW04bHNXeDRsKys5UHFSU2p4eU9Fd3VxT3ZmNnhG?=
 =?utf-8?B?SDZBSUYxbGRXNGh6TFF6QWZkNllYZExzWjBHWVY1eHAzd2xsNytjaHNPczQ2?=
 =?utf-8?B?anJid2licXh1amFiUjhwMVIzeVVwUWJXM2RmMVBUeXNWTXdZREtrTlBsVUlj?=
 =?utf-8?B?UC82Q0VOcDlQa0N5ZitwYTg3VUNzVFZ2c0V5RGFFdE1YeFpRaGxNY0tnQTFl?=
 =?utf-8?B?TmpxS1h0YU9icjk0alhyNlAyODBjOW1aK3ZLQk0vcVNPa25Zbzg4b1dudjY1?=
 =?utf-8?B?dkxwbEJVd0lpTmdOeHFsVllDTWdWL3pjaVdPMlZ1UFppY0NKMG96dWkwK3E2?=
 =?utf-8?B?VnR6RHpxN09WQU5WcDhlRzZXMDltMEJDUzlkaUFuNjBUOWdBei9SWXhjNFh6?=
 =?utf-8?B?QThDZGtLb2twa0hlZ0FOenpLMlN2WmRwcDB5MmFLMFpIei9JOWZKYmt2Z2ln?=
 =?utf-8?B?SE5SZkRQTlB1ZWdpTTdSeWpSV0N1aXdjNWlWclJSVnI1QkdhVzhaUEw2TkpE?=
 =?utf-8?B?L2Z5M1hnSjA5SkRKMXFueHFlN21HcC8rZ21wY3oyUTloN0pIOTlDWkRwTXpy?=
 =?utf-8?B?WmNsall6L0lvZVZHWG5EQzRIU1pJTWMxUXA0enhWdEs5Y3VFS3ZsKzRXMWxm?=
 =?utf-8?B?Z1dyT3hOeHV5ZnVQK1gvN3NWTFhOelF1U0JqVW1jNmd5c3grczc0c0xwQnJz?=
 =?utf-8?B?Yy9LVU9tSXFQZEE1dll0TVN6SzJBOGI5eTB6d2ZCUmhra3h4RmRXZkRObUFv?=
 =?utf-8?B?RDMwdU1BZENPMmFuc1lXRHBSVkErMlFJOTZKWDJ4SWZOZTUyTWlRMnZOTEFp?=
 =?utf-8?B?eHZOZUxreGRHdGNPL1NIZnNISzhtaExEaEFqaFBXd1kyM2ZKU245Rlp1aXdV?=
 =?utf-8?B?QThPNjNTVXBWSHdVVWxrOVAwamo2enpVcFZVd1Z6c2wwOGVBNElpL3QzektI?=
 =?utf-8?B?WmQxQmVYbkExZmZnUjM4M1ZCY3NmOEpRUytOMWg0VDByZkpyODdkRVJCenpp?=
 =?utf-8?B?bk9MVlNMMWlCNDlVbHNLV016UzYzd1hQY0JwZ0xBUlpCSHBvSDZNbjVITlZq?=
 =?utf-8?B?ai9zcmNGWVRsVThUb0Jzb1dkOGQyNnZ3RTZMOStQNVVzaTVGRW9iWjVJckVE?=
 =?utf-8?B?eXk0ZjhaWUJmbTUvSjJicmJTR3dtRmZyeDREMkVLcEVES0VmNGRYcVMxMVlv?=
 =?utf-8?B?L21rUW1Hem5wTUQxL2Q2M0hDUTYyVVhLc0VJKzM5Z0VWQlF5N0RiQzgyRzNh?=
 =?utf-8?B?RzA1TUg4dndSOGI4WlJiNWx0TmNVKzY5dW84SWtWMWtPaXc3VjhXaWN0NCsy?=
 =?utf-8?B?MDNkK2RTOERHS0FxQjc3aXA0YlFyWDB6OEhPNTZKalhIWWdxbnhOL2pLN1NV?=
 =?utf-8?B?RVVLNGI0c0dFVzFnNSs2ZXZxZGFjN2RJaXJuNmVDaXVFSUpaazNxWDY2b1p4?=
 =?utf-8?Q?HGeJfllzEes4dQq/7Ffp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UERsSmtPdk1lNlBFbjFYN0hZMUtCcy9iNEp2S3hmUFAvNVhLUy9XSGdmZ0RE?=
 =?utf-8?B?Tit5akpWSkRvRkJFWWZSYndpbFFuL3VnVmtJQzZlMWY1a1BUYlRuK2hiOWxN?=
 =?utf-8?B?Z3RvSEdPVktiVEZtakVYVDBzdzVGeGlqRkM4K21RVXd0c1oydm04TTV2d1Qx?=
 =?utf-8?B?NGtUZWNmY3lKK3FPa3JkaVlZVURSTDU3NzNJL3RTUENQWDRnNlp2VjBLaS9Z?=
 =?utf-8?B?SE10MjdFbUs1bXhaVHBmRURxek1Qd2NkMVZEUlM5Y3Z6MU9SUU9RWmswRmFL?=
 =?utf-8?B?TEgvMFU2ais0WDd3cVZFanN5RjVFenNZU1BjcFhFNlMvYzY1NFlScldDZkVH?=
 =?utf-8?B?dnBTK2hJSUYyNlJ5WnVZVmdSRncvc2ZDcFZoOTZrS0UxM3NaVCtFMEpOZUxr?=
 =?utf-8?B?M3BFVEZhaWYrNVh2eWViOENxMHYvOEFaK1hCVVViVURXc2dCQVVUMGJJWVVG?=
 =?utf-8?B?Um0waEYyMEZzdVBUeE55eVFVMklqOWM3UmJ5dVN3NGNTRHA3VVhqeTBucTBP?=
 =?utf-8?B?cGtzKzNTUHpLcWhOYTJCWEg3dGdwQUZCeFR5TndVOHhKemt6QnN5K1JsY0J3?=
 =?utf-8?B?allKNnY5NGlSN3NIb0E5c1lWcTVUNVdTNmNEZk1nSmVYSkxDaXlSRU8wN1Rj?=
 =?utf-8?B?N0tlTEEzMTY5OGcvVElSVE1nQktJa1NIeUV6ZlhHZzd5WDB3TlBRZFZ0dDM5?=
 =?utf-8?B?K29NNHI4K2sweUE0ZS9sMmxFMFp5Q2FMMzV1KzlndlZEa1I1ejJMVWJOYnBt?=
 =?utf-8?B?VDJPUlh4V2ZianBUdy9qOWtkb3lLYW9hMmx2cmVSbHVYYW50REMxTFFQbll3?=
 =?utf-8?B?OWlYYjNQUzNQRTdjUU5ycVpUbmtiSlpCOEh6WDdLUHB5YkNlKy92R3psaG5l?=
 =?utf-8?B?U2x6TkpudzJ3NmJCU3VKMUc4RHRBUGx5eXBQMjhERUFJKzZSVm9LZHFPUVcr?=
 =?utf-8?B?MnhmNUtMQWJueDZCQjAvb0NGK3hqVDB2LzdpQ1ZoeVJkeDArZmdjbERTWHpH?=
 =?utf-8?B?ZnhrRjJJRy9MamZKczVJcy81OUtpckF4Z2FIZXJkRFFOTEw2Wml5SENCRVkx?=
 =?utf-8?B?OGhyRGd2R3hjMkZhN3NnMEwySEFzYUd0akdCWHdCNzlqVVhQZHFsNTl0NjVF?=
 =?utf-8?B?RTdXcEZNYkxlU3BNVDZRcmIvN0ZpQVZmdDc2U0tpYzM2RW5welNKZEdVOUov?=
 =?utf-8?B?dDJuaXZRKzdWUisyRGJwcE5ROGluQ0hTcjJHY21TNXhKQ1dVbWh1YnBFbExM?=
 =?utf-8?B?cVVpcE1nbm5reCtzSFZBbEFSUFN4eGgxWFhEY0xwT0E4MWc0ZlpiMDQ2dE9Q?=
 =?utf-8?B?eFBtNktlanFwbWdPdWtZQlV3cXZPZmlId2h1YkFQQzJ4Z01FVWZ0RXk3V3pp?=
 =?utf-8?B?bWUzbDBqV2dPa1JRcVNRYnl2MnEwWmYweWFiSmZWblA5MnZBdnh6eDUremM1?=
 =?utf-8?B?OEJqZmxRVjRSMEFtVjhpZjQ2SmplQXlMaUZXODJrRVZjc2F1UWZ2YTErbU9p?=
 =?utf-8?B?d2NTZjRRN2Ura3VYRXhGazhyakdUWkk5VjFvYWRMSlh4YkswbVBoT2hOOStM?=
 =?utf-8?B?SUpWdHp6RHJ5VDN3QjNDTjZLZ280TnlZeVBUQk80blpjUVdrTHFxTGNkdlFl?=
 =?utf-8?B?S0NndmxIOXdxMWFFMm00bzM1Z2tiZExLK3BJV3Bic2JsaU01dEgvOHk4alVT?=
 =?utf-8?B?YkNpNGRNZEo0QU5ici9abEtIQW8yUjd1VmZTcmw3ZDVvS3l3SWV4enBqeUxn?=
 =?utf-8?B?VXViejdHOStTUTVob3llbzdaanZjODdSRDVmQXRVM21FdnlXM2tDWFh1MjU4?=
 =?utf-8?B?N0lTeHhXZmFaU29FbUZ3aHhqR1hNYUp1ejRya0J2WFRhRkNQVFgrWk9yMGJ1?=
 =?utf-8?B?ejIyQlZML0VWM0NIYmZTS29lTWw0WXJPUTlxYkNHTmZvSFAxR0dXQjZQcHgy?=
 =?utf-8?B?ZC9LUVJIVkQ5YmR3N0QxOVZ1MmxtVnRVRHV0SG1WcTZpa3VTbzhXNHJiMW1B?=
 =?utf-8?B?TTJwSEhXaVBzNmlUeHhuMUlSaVJZbC9OK1pqZzNPcldWNkhoODd2Z0ZvY29s?=
 =?utf-8?B?dzZtNUpSM0ExeDNEWi9iZXB4TE0rRFk4V2hlNDduMVFSRXRjeVpoWkxYYnpu?=
 =?utf-8?B?dzdsM1I3MVBwTGZaK01DV2Z3Y3paajNDU29tVWdLQjhGdzZDZUtsZmFmeTIw?=
 =?utf-8?Q?gY8AIGGgZidZZ46lsu2dHqY=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4313d5-759e-4399-ddc8-08dd0976cf57
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 15:20:04.8391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tM3NQWeIrIuTtA0JK2hrDqrJHY8U1YVNtFBl02eWKypnugKtr+z8x54RO8WbsAtwdPSZVG365PICKI2aeh8vH4ghkyRQ+WjZVSYgPOcKVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7938
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 15:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207459

Hi Alex,

On 11/20/24 4:03 PM, Alexander Kanavin via lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
> 
> zstd uses 3 by default, while 19 is the highest and slowest.
> It's not clear why 19 was picked to begin with, possibly
> I copy-pasted it from rpm's examples without thinking:
> https://git.yoctoproject.org/poky/commit/?h=master-next&id=4a4d5f78a6962dda5f63e9891825c80a8a87bf66
> 
> This brings significant speedups in rpm's compression step:
> for example compressing webkitgtk takes 11s instead of 36s.
> 
> The rpm size increases from 175648k to 234860k. I think it's
> a worthy default tradeoff.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/classes-global/package_rpm.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
> index ddc4bf3a6a5..b2b7fafa177 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -10,7 +10,7 @@ IMAGE_PKGTYPE ?= "rpm"
>   
>   RPM = "rpm"
>   RPMBUILD = "rpmbuild"
> -RPMBUILD_COMPMODE ?= "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
> +RPMBUILD_COMPMODE ?= "${@'w3T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
>   

Since we have a variable containing the compression level for ZSTD 
(ZSTD_COMPRESSION_LEVEL), should we use it? The downside is that it's 
prefixed with a dash, which would need to remove before using it (or 
update the variable to not contain it and add it where the variable is 
currently used.

Cheers,
Quentin

