Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE07CFC535
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:15:45 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.53])
 by mx.groups.io with SMTP id smtpd.web10.51694.1728900944013368745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 03:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=jLGIMAla;
 spf=pass (domain: cherry.de, ip: 40.107.103.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceebyKPGdx0qTTm3FavvW6awQhye4R9hVbWe7pRxiOOGFN3zSSZOSk3y5/77BiSSV0tKYWIzNvQTAZGan3z1FbTiTnxqatO7dKyGQSpXw7V21qLpjo0a9RNG3EiXDJ5jpeMo3kClNSyopjgUPEm5TC5+AS7o4JynWqim5LtsFbbmj6YQQjMAyiratL6Q07GHCsrL+Ff9WZIeU7/6ApUZR+qP+UBCa6Zp1LE6nRpnx1A6HiehadcsmcQsfW5GTN83ecaW99uBwFbNz+wObZ/s0FceFmZD31xk5YyDDtKp/G+A6YMkFVZ+DGEfr/oxfhdVQFTVoG/3lBOJksgDuTsykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7U+cDGO05Lp0rppO1Md+bLjooDbTC6PVcLjUCZoo7I=;
 b=VmQLjgYClL+/nh5cQHYp/hQ6fQaE+UpsbVeu5DKTLthnRCJC1h4J2NTjoy8DFRA1OvYxGnMgh24oZnp3N87ZO3kt5nQ85cfUyXDv5+eFzzO7PAuGPQrK2ErJjJ06VFiPtU1OOvvr4iM9Bc/WiVNn6q6uaIZG3uyUHUQbKkJV1VqwzWckXjjMNf4AoC160NvxCCaxoobcvHh/CSwWdXwZTBuYkdh+SDg1mKJ2jK6yrPtObLBgtb9A8zB35AbDQvFdOxMOrg4gVspuDDrXM+0WkKDNXW/utEyY6WmZJeEhVH9fkcWl/BIDF8WKHqSd96D1rqYTITspvJt1UT5HCV0S6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7U+cDGO05Lp0rppO1Md+bLjooDbTC6PVcLjUCZoo7I=;
 b=jLGIMAlafeP6FsV1YSacGq3C3yT9u3uFlGeT2LdjfQzGo3J+3ip6KhWQeu4kcXHtpwUikoYOj7nwj2yrf/kyPTGsd2NjO7d3NBf1at+ZyuQkYmhpNRA2D8hi8krD4oD6uhmy3qt5jnKD/5QOzVG77NqgPMW/YLrFPNdZx5dWs+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB9103.eurprd04.prod.outlook.com (2603:10a6:150:22::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Mon, 14 Oct
 2024 10:15:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 10:15:37 +0000
Message-ID: <2151c54d-69bc-42a8-b856-a9628731eb25@cherry.de>
Date: Mon, 14 Oct 2024 12:15:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Need support: Turbostat is not compiling in 6.8 custom
 kernel!
To: kamalgmbh32@gmail.com, openembedded-core@lists.openembedded.org
References: <CA+u1R=SqP1PT2qpiznboU-fpLqGVOxJy8ST0mv7G0Aadx6+8EA@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CA+u1R=SqP1PT2qpiznboU-fpLqGVOxJy8ST0mv7G0Aadx6+8EA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f61879-b251-4761-bad8-08dcec392575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NU43K3RILzI4NFhhd0xoeEhXcVl3UzdPaW9ZMGlBSEMrMlp5RWgwemE0ZDRh?=
 =?utf-8?B?LzVWOUZDRzhmYWI4cWpNdmZqVndia0pMNXNHdHdPQUJKZStzY3RRaWFYOTJC?=
 =?utf-8?B?Mzd3TWw3NC9STWJWc05KQzUrNVdqakFRT215bTJQdCtabGFORDNIdU5GM1U0?=
 =?utf-8?B?amRrcE5MM0MzbE1vN1ZsUi9JdkdqNlB2aEpmOEtLOGtXT05xa24vYXpqZXA3?=
 =?utf-8?B?UGlqTy9BRUwwTTc3ZVh5c2E5Wmd6Z3orMmdvcGZaQjlnZGJMU2MrQ0U1bEZ3?=
 =?utf-8?B?NHZxT1ZPQXg4b2V6VnZ0Y1NPRFdPaTVBOHA3ZS9PSitnLzhheTViYWp5YkR0?=
 =?utf-8?B?azB3YWZBMC9PVXpYc0dWQ05tRG9ncG0wV2wwT3hCNGJVUDhsYTlsRmZiNGRO?=
 =?utf-8?B?MVRTSVU4eVRoZFowcFE0QlR0QWJLc0hUVklVQ2diVmw2ZEw4V1RxeW56MWsw?=
 =?utf-8?B?Y2U3bHgxeFd3TUpRU0tWY1AxY2czQlJ6dTloTlRoelV2N1R5eHB3YnpNYXNG?=
 =?utf-8?B?ODdUcU9SVUcwb0l4eUFUZ08vblNENmRXWHJkNzVaNjdob0FFSlVSMjVzQzVs?=
 =?utf-8?B?ak45aEV3aURoMG9RZWUwNFFjbVVlUHRkemtlRzB6UEtGQXlwVWhWMUZDT29B?=
 =?utf-8?B?ejBWb0xTOWE4Yjk1UDBPOE4xM3hLYWxrMldSTEhmVTlHeGtjVyszK0ZOU0lt?=
 =?utf-8?B?ZFFWSXJnV3hLUlRFVWtTZy8wU293ejJMOHVZdlV6UnZlUjRocVNaWUtPRldG?=
 =?utf-8?B?Z2x5d2R1ckpUWlY1Q3JGRFhCQzB2Y0NYdHhBWnZDU0oxKzVKN2Y4Yng3OXNa?=
 =?utf-8?B?VTZ5cEdVQWRWZzFpTTV2UUlDYmttNG9GL1dUb0lQZzRuQnI1TTRpOWM5d0xP?=
 =?utf-8?B?VSsrTFF3YkFhZzVPeW1YSldocmpFOG56K1JhUFBoWVlKOGd1ekVmam5kVUNa?=
 =?utf-8?B?bVJINXA1VzFGT2FTNEdvbithMjJydDgzWWpicEgwRTNKaDlSVEtiOEJTQW5M?=
 =?utf-8?B?M2VRRElnSVV5ZzQzMFRUdHNsZHBRM2swRGxVTTRsK29zdVVBNVlrcFNQeUVO?=
 =?utf-8?B?aTlRVzJ0SnhITnM1RTFpUkxaMkZ1ODZPM3UrR1h3OHk5T2hFeWxTekMxeXBv?=
 =?utf-8?B?c28xNmRHM3p2WWFvVlFYYkd4WDRqVE4xM3NHNzB6YXFTK2svOW1GNWpJaTRF?=
 =?utf-8?B?ZlFlVzZRQzZFaFR3R2RmT25rT29NVUlmK3RjZUtEU0ZhTjAwOGQwVFA0R1dp?=
 =?utf-8?B?NnhRdHpmL1kwN2gyR1hxTllRSkNTS1pWQmora1VqWnFMTGtVOUhuVEVsNnFI?=
 =?utf-8?B?T1hPWGNqWFdHTDBaMkR6c1RzTnVZRW5ZSGJSeDI1SUpFbnZ2bzFUejBxK3Qv?=
 =?utf-8?B?THllUXMzaHNOV0I4MzhRTlZxbzRHdmFLYmdqMEpjTkd5c2RQek5GMUtzbWw4?=
 =?utf-8?B?eEhYZmtYT2htOWZzTllVaXk1YXJQdFVnY3JtdFlyMndUMEFiSmZXWUp4a29y?=
 =?utf-8?B?K1hlQ1hiNEZiQ2FMT3l6RnZML0t3T1VFM0QrOU1CTnJiMmhiS203QzFOK0NV?=
 =?utf-8?B?QTFpajQwNW1yNGdDSTl0ckl5YUNmdUQ2VGRBanp6aysvdFRRczBMdXA2enUy?=
 =?utf-8?Q?zJdPXXK/MRLwo+GS7SBgoPs63SwaVnu1n006y/oAmHGo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YmRzcDJ5TW0yTDFmOGN0Z0FvR1FFZ3lRTllBZ1RGZDNrdGNQZGJjWGo2YzhZ?=
 =?utf-8?B?WWpHcWJVNm81eVlYWGtGVHBielo0Nm02eUtKV3l0dXAxaktJNzJxbEFQeThX?=
 =?utf-8?B?RlZQU0h4RFN1MDNkeDV5eEdIZnFLdjlLQWo5bDlIUzZxMlE2RmVDVkUreThL?=
 =?utf-8?B?cDFLVW1Jb1B4THowVnZXUU9qUm9Fdk0rcDZIMUkwYjNGdnhDT0hmQm1iN3Zj?=
 =?utf-8?B?amxtUC8wMk1pWmtwUFh3M2FHdXY2Mll6RVBjVUlvS09CUzhpZGx0dkJJQkNS?=
 =?utf-8?B?eGM3WitoZkIzNWVZekplc1lYVU1wazZGOU44UTZPSlFCTldxV2ZYMW53YlFl?=
 =?utf-8?B?VnN2dWNoV1dGWTA0V0Z6aVJQV2lUZzFmNGFhdWlXcTRDbkNIOTdBNTllY3R4?=
 =?utf-8?B?aHV6aEZUK25jR04raktpaitQZlNxZEtTWkEwWEYzanExRXhSWGZTM0FvYmFz?=
 =?utf-8?B?UWlZY1dIczlaTjhLWEJDaXJaZ0hxTXdPV0o4bzhRdTFHVnhaZGt6UklIZmxN?=
 =?utf-8?B?NXZIRW1SVWNrSjFjdmY0Y3k3ck1zK1NaWFRaRjFNakhpS3lvRGRxVU5DZ0VN?=
 =?utf-8?B?YUMwTzBpVUpQNDF0aXh5T2FDd05rZ2RaTnEvQllvbFRjSVRrdUoxcmNJMnJU?=
 =?utf-8?B?cTFpdzhPVHdxTEQrWjZnRWc3T1QwTXY3TnFPZ3AyWmN3aHdBL0ROUk50MEZZ?=
 =?utf-8?B?dEZGUVdwaUZSK2Z0MmE5c0dQdTh3T2NzWDdMRzhJQ2FUK0dQQUY3RXFvbVJE?=
 =?utf-8?B?NGhQNjhnSWNnekwrYXdhSmlGY0YzRTljc21TRUFqdURBSDFITXJCWW5rbnht?=
 =?utf-8?B?YVQ3VXhHbDh5ckR4Z2NocnA1RXhHSzJ1UDVBVXZhNEhrTTdMdlBPOHpReHpC?=
 =?utf-8?B?U253MitTVjc1WU5LNG8rMEIrK3ZpWUFRNFJ5KzJTb3ZGOHlzc2RKQ1lRaDlo?=
 =?utf-8?B?SG9LeENmUVdxVHR0YnpDZUM5VVc1UXVYckdNRjcwaUZIQmRhQmxwUHg1aFFq?=
 =?utf-8?B?bWNtUFNkZC94d3FjTCtaeDhsbUNQenFCUzkyMUtCandZVmwyeHFvckZQQlYz?=
 =?utf-8?B?VnNBTmRSdjczTkZUcTRhcHRRcm02VTZsZzZVbm9UZThUMkgyaDhFOFA2Z3pT?=
 =?utf-8?B?dlFwNUp2NlBEdlFLMU9GTVpkT0N0QlV5SmQzalZVRmZVY0FJaE9jck01OFRK?=
 =?utf-8?B?M3JsRnJud21XUmU5WHlYNk5HdmszY3g2SEw1czFRWmtSNFFUN2MyYlJhcWpG?=
 =?utf-8?B?aU90UXh5UmhqQjlmNEU2NE1ZQ3FhZ0tWUFArS3NqejdaY1dwRnBMZjZtYTVj?=
 =?utf-8?B?cmliN0IrRmJTNXpLOGJFNldLYjBvVUtMSHVKQ3ErOFFMYWRBQnpFV0V2cURm?=
 =?utf-8?B?VWc3OHJJc3U0VmNMRzExbExRRGgwSG8ySDNJdW5HYmdkZGNYZjVXL1RSNmJK?=
 =?utf-8?B?MGF1Mko0TDFLOUx3Z3AzNzR1dytETDJwZWlETWtLcEhFT0N5WTNNRkdjNFo4?=
 =?utf-8?B?ZGpIZER5bnlJUWhqZTV4NHRTOTlnSW9CTG1yd2VheTlDWlNVaTBGclJCTm1j?=
 =?utf-8?B?bUtkT2NxOHEveDRUaTFORDhzTHdTT0RtdTlnZTR3WDJhSzdwdXdtbGFaeGY4?=
 =?utf-8?B?N00xUE91SHo0ME51VlpMd2N5dmZsR2FyQzNsOUwrYjE5TTN5ZXlrRHpsV3pn?=
 =?utf-8?B?bzE0aUNZQ2VuaTFsNSsrRkVtcjl4RytnamgrMVRURXlMK1IrUjZxcU01YWsr?=
 =?utf-8?B?ZnoyaGxHY2N4dVlSZzdxVnc0WTgvb0t1NWxSWmd5bHI0SG9qc09EK2NpL2hv?=
 =?utf-8?B?RUl5R2NQQk51TXJhYkdRcGVMUGhQWXc0TnZIWHl5RjdkMFExRHpaUGV4S1Jq?=
 =?utf-8?B?MHN5K05LQlArMGZ3dVpjeHlHZUx3ZGNaQjg3eU12dVRxRWRQemRNZk1sdXJJ?=
 =?utf-8?B?cWFxY2loMUhoRXpBR3JUSFJsai8yY1Y4M09SaUIxeHBLY0lnSnlRNVdiQXlS?=
 =?utf-8?B?aStkelZUQlVFYlN3cm1aZFZya3IzVTZqTDU1MnltYktSQW5hQWlJS3F6YXND?=
 =?utf-8?B?dU1aTDVTRDhMR1RZeVRCVDcxUVE3OUhhUmY2eUZMUlpTVTljL28rUlRwL0kw?=
 =?utf-8?Q?L8dsP1nnotKOtPXJEf5Ph7Ajd?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f61879-b251-4761-bad8-08dcec392575
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 10:15:37.0336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOf4JQpG1q5OwJN4yvA/ji6PPjMEM5wfe+7SZLthVyUodqbzLx70OqyNp1+Woqz+xzFPAA2SnkPBpCK3jWXM8g5F8Z1SqNk4cqSQgxlF7qA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205737

Hi Kamal,

On 10/4/24 4:19 PM, Kamal GMBH via lists.openembedded.org wrote:
> You don't often get email from kamalgmbh32=gmail.com@lists.openembedded.org. Learn why this is important<https://aka.ms/LearnAboutSenderIdentification>
>   I am using 6.8 custom kernel and yocto scarthgap and i am using x86 machine.
> 
> i wants to enable turbostat part of my image.
> 
> i am adding below lines to enable turbostat tool in the local.conf file
> 
> IMAGE_INSTALL:append = " turbostat"
> 
> 
> I am getting below error;
> 
> IMAGE_INSTALL:append = " perf cpupower turbostat"
> 
> 
> [image.png]
> 
> 
> map=/media/nvme1/umesha/kamal/poky-amd-scarthgap/build-weston-v2000a-scarthgap/tmp-glibc/work/v2000a-oe-linux/turbostat/3.4/recipe-sysroot-native=  -lcap -lrt
> 
> | turbostat.c: In function 'set_temperature_target':
> 
> | turbostat.c:5277:52: warning: implicit declaration of function 'GENMASK' [-Wimplicit-function-declaration]
> 
> |  5277 |                         tcc_offset = (msr >> 24) & GENMASK(bits - 1, 0);
> 
> |       |                                                    ^~~~~~~
> 
> | /media/nvme1/umesha/kamal/poky-amd-scarthgap/build-weston-v2000a-scarthgap/tmp-glibc/work/v2000a-oe-linux/turbostat/3.4/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/13.2.0/ld: /tmp/ccUpGoz5.o: in function `set_temperature_target':
> 
> | turbostat.c:(.text+0x514b): undefined reference to `GENMASK'
> 
> | collect2: error: ld returned 1 exit status
> 
> | make: *** [Makefile:20: turbostat] Error 1
> 
> | ERROR: oe_runmake failed
> 
> | WARNING: exit code 1 from a shell command.
> 
> ERROR: Task (/media/nvme1/umesha/kamal/poky-amd-scarthgap/build-weston-v2000a-scarthgap/../meta-openembedded/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb:do_compile) failed with exit code '1'
> 
> NOTE: Tasks Summary: Attempted 9722 tasks of which 9581 didn't need to be rerun and 1 failed.
> 
> >
> Summary: 1 task failed:
> 
> 
> NOTE:
> 
> IMAGE_INSTALL:append = "  turbostat"  line is working when i will build 6.6 custom kernel.
> 

You probably need this:

https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb?id=1dc3523ef21b4764d32e2244660c2b3176877c57

Cheers,
Quentin

