Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0E8CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:54:18 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1036.1777481655723356400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 09:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZZZKufTv;
 spf=pass (domain: cherry.de, ip: 52.101.70.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/1OwwFNiGFwnvrNEc4Nsm0V4GChffg9vYwBk9VlqktYgKmcWGsoC/KvSRAsxHn0BzQny0xWNEXkD8xAU6cIy6YP3CuSuFBvlm7YqgWDaJ17x6959mkdd0nK+M7tyRw5L1OZguFTR/jFkavadvrVcid9gBuao6hgKKX8+66a9wvTkrgmWWSzMGy3MXiSmqSBojOBFpqgslLOV+q+LPfF8UIIzw1zZFjRkijl/bAV3LfC0DFEqt3pAijI99NAC5GDmIn15N35Po4YGhg00SzKU3Rdkf5gGpbwuAVl0Szo8UC+LQgVnQQ2ngqFY9iztujHs1nXNXias6a4BrV8JL/Qpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS7ft8NQppxXYvvYQS7+8vOlq3J1RslGQHvSIVG/Nmk=;
 b=duBTGcjgsBYIkvt1hC5+tRND4V2miufIZjBA02zV5JNHbRLvf29JunzYLulPN89Di5Zf6XoLN/OYzk4hMZ/YOfNCJHFne5aTyB6yU6bCxtGTiMtohTp3v8fBikhtS/bLGc5zw+vvvgV8DvC73RxQFbMX9NpDvyikhmhnaAAdum6Mi77/aNlR3SKOwmZy1kv45QbR+2+6tDRSmwPv8de6HqLM1F2hUkWq8Cz6DCNgUnD65BCppHRs/Q67cjNE22TBJeqk0Ff0EtYvTl11aqp9pyUxJ8sdso6jvXzwAq/rY9yta/sfSQO3+DTWBBgezOKcSZUEGom6A4pnW4fHQhZyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS7ft8NQppxXYvvYQS7+8vOlq3J1RslGQHvSIVG/Nmk=;
 b=ZZZKufTv2Bn7YzNaENCbfjhIpT7pSiZWbStOJvq96Z35FzQJQV64te+SGCMGC2HZ/hoCa+5BZISi1NHvaBiIJ8hE2wq+2gtO1tg45FsxVappM1nj1qFR9XBQiHasKswNZp1ITIF2xqWxvYpHL3QHAm/pbnb3U1zRXhQi+ws0lpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by VI2PR04MB10643.eurprd04.prod.outlook.com (2603:10a6:800:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Wed, 29 Apr
 2026 16:54:09 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 16:54:09 +0000
Message-ID: <4a76c695-7857-4c09-a10b-60c6c5dc5c0f@cherry.de>
Date: Wed, 29 Apr 2026 18:54:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 01/10] bitbake add firmwaredir
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20260429164821.3425757-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260429164821.3425757-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|VI2PR04MB10643:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e903c2-d064-4449-31ce-08dea60feeee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YrHJLABeBNPN3puc8BC6G69uxxnGe3gDOAqzHdSDbrbVfywIRXk6hL6nuTGJVAsQ9twMzupzxfJgizTvUrO6V7P0tjw47Hz8DkB40fGVgg+u/1BPNMuioUq9XBXUWHTlw5XRhhMzfuT6y5PqYzoE4w2rNfL+FW9HaDuhKknVdwripGNq8Y/B4l6qY98vB8Iqq64w3iH95BJfRDQP3M94WlfgeERvmx2jP9tMuwQfaYuIkZ8oQOTfUivmj0rwxQPF2Qe4Ic6YO0ljyfIz78s47/iqiOcPNNLN/7BYHuKiZojSoI0K9xQU5XwJj0OyLLdT44AJe1Aorn6SF0rq3dDkJ9Yd2QaE8vGlRs+oTkkhKkX9kCty70+pnTYVNM/gUzMELefEELwh1HOHPxC8LER097zvsC/lPn+KxxIvco/jZ+ftHxDI+EHvd1jBvIbZvfsrrVjNHSQBAM0ylEvNwTXjJHqKFg2fGPSEV+/3q9dpZHtqYbF6ixHe+oVUpyFqTFsMEr/lUldbumwb2qio3BbHZ5AMADS7yaGhszcpJr0HsqZ+nB829nWav0MkQ2jLZPPnmZDtntJKX+na+b7ARQXdmvOSzpXxA3InIlP2Dhp5tnN/bLcjPYOf7K+gEttntY9xrqSMmGBxfjNWF45MgKplC1p6o/Zim5SIFR2bKrVV7YV2Scut98xX3RVyOIUj90P7oub1NZpeH+PrTWZ91qKJjqx9oqh+HQo05uOR9YhsmQw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K3hVbnRtYjNENjRUejhUS0YvSll1cTJ4NVhMYnN1aDA0SmNta2FvVnFoRFI1?=
 =?utf-8?B?cisyMDNoSlBrOWRWZGpDWFFzV1pkTXVXUTUraUJCRDVSMFZ3cVNHU1B3SHJv?=
 =?utf-8?B?WWlvdDlLT0pnbW1Fd2JYQ1RoYlljSmhhQkpnOXdMaE1BNzdZQ01uVmJiejhx?=
 =?utf-8?B?N1FTTzhHVDlzekdTS1dTYUV2MnZ5a0dBbHRnY3BJYWI4QUJaaS9Kd0hhK3k5?=
 =?utf-8?B?UnJaRE0yRXNjUjRnRUpwM3hlVnRyMEVNV1BVUys5OEhoVm5tazRwUkRrVER2?=
 =?utf-8?B?Z2hFbFJEK0UvdHdPL000RjUwbkVYTHhxbnpoejg5SlRKdEI1ZDg5MFU4aGtP?=
 =?utf-8?B?ZGdBV243UE91eHk3bSs5dkhIMWsya21kUk5QTDBOTFdjL1c4Yk9SRmJHSlNU?=
 =?utf-8?B?a0wyZHpTSExKQmphaUx2WGcxSGZlV1lnSXc0MkduUS84c2NOaEIvdWk0TlFt?=
 =?utf-8?B?R1Q1ZzFzUkFGTEhsMlVqdWtRVzZLV1BuREhBMjRna2ErQWl2K1pUMExvUVlm?=
 =?utf-8?B?VHJjbThxbFB3WDV4RzRjWGYvYjlNMy8ra3c1bDBjZWZRcTBvazRJVUpvOWJa?=
 =?utf-8?B?OTE1a1IrMVViT0NpcFZoaG50LzZZYWxiM1JuVnVOaGFUMGxMditYelR0VjVv?=
 =?utf-8?B?dHAxaERWR0xOelp3ek5BSVRGVXN2TzJrWENmOWhvUnNCbDRXQ2lDbjVWM1VW?=
 =?utf-8?B?cWM4Z2pTMG96V25qVkRRckx1WDBIZjFzWFE3ZnlvMG1veVRjSHZVOGxSaXNZ?=
 =?utf-8?B?U0xVdGxtMGt4cklkRHFrSVRoaGg4RHVLaGY0VVpFQmpZVHlEa3pWdHc5N2hl?=
 =?utf-8?B?dnl4NzdDSkNQcGxwbUUzYlY1UWREa0wyL3l2Sllpd00zSFBnU1o5RzU4djM4?=
 =?utf-8?B?NGREVlMzRVo3ZU5VeHJmdGJMcGtNM2VEQWRsMEpRdVJFTmxWWFJZK3ZxdVNw?=
 =?utf-8?B?cVJQMVZ5bFpDOURGQVc1QTVqZDlSczFVYmRvSEFZV0tGWEJ2dGZaMFJ0S3VO?=
 =?utf-8?B?a1BIeEdvdCtGWVdaNHJYVWZRcEROWXFrUWpBQ2lBOTZqdURZTW5WWTU3OVpW?=
 =?utf-8?B?V0JYNVZNeVo4ZWtNMlVNT1JtT25FbkI3Y0hBMmtoVXViTklXY05XdC9leWdm?=
 =?utf-8?B?RUxmRFkzK0hLaDNSNUJLcFVQak9KNXBkaWVsZkJHaU50NVpnNGtxbXZnY2lK?=
 =?utf-8?B?M0RHSUZvRy9YaEgyNzNCZlFrRzR5Z1lGZ1kzZFp5dmdFRjZQMU10Q3I2aFIy?=
 =?utf-8?B?Vld1ZlljZXpXdEtBNUMxbEs5aUtTOGxORlFlSHk3SnZRSWRwZDg5QlJtcVZp?=
 =?utf-8?B?TmpJb0YwN1NjbGVyVG1OeDFvWWJvRVJkQnFpc1dBOGE0emU0azY2c2tpL1A4?=
 =?utf-8?B?aGVTcTQ1RlJYN2hpajFyQ1BhODdIeENtQmhmanB1UDlxSVdDcXB2T2FGUFF5?=
 =?utf-8?B?ZXZiM0ZId09OREdUM0VvTGRScGtlb2FvNFRxMUh3SWZjbU4venZJY0daWis0?=
 =?utf-8?B?bjlSQ2tTbXNGOWd3RGN0QXBLWWdTaWQ4eldzQ2RpeWhML1gxTGlZYm1XcUxJ?=
 =?utf-8?B?Z2w2WkJYdW5TbEgwZ3pzTnNmTUpDV2JlUjREc0o2K1lveER0Yk41OTg1TjY5?=
 =?utf-8?B?RmxvY0REbFVHS2lWZFJERGVTTVN4VVl6dzEwcEhBMThFZmg0MW1DVWpla25n?=
 =?utf-8?B?QklaMUZ4Ylp4RHR6U1R5SWVINWNTVjd2VTRXWFN6OVVVWDRBVWFIWXVnS2g0?=
 =?utf-8?B?Q3d5YUNjMzVnM1VNUmFoU2NTS3V0TkhlVUdUa2EwUE5vYVhPL3l3NjZlSkdw?=
 =?utf-8?B?WG9QYXdQWk53dnV2dS9rYno5MzRadTd6ekVGMkFsTVdUVVJRL0FmUHFERUd2?=
 =?utf-8?B?RHZPSmRuUWNzeE5OOXNXa0pBaE9aMlptSElsOFRuTlBYcHhvamVFUzAvRXZE?=
 =?utf-8?B?TjF3eU5oVzZUQStDYVFtNjFLeEV2cGFjWnkyQ3pCS2pSZGZYTWpxZUxOTDZD?=
 =?utf-8?B?VllFYXloNDNNdFE5SFNBdnU4OTkyTFgwR2RyLzUrNUYyRzZsOW1uNGI2b0Uz?=
 =?utf-8?B?WXJqTWZ1RDU1NnlMQ0JlUnZRdmZlUEdpajYvUXc2V3h1OHpsSHdJalhyK0hp?=
 =?utf-8?B?NU1uYVBPRWhYa2pKNnBlVnVvU3BkY3p3Rkw5YjVBdTVuUkRwNTd1Y1JhQ0lH?=
 =?utf-8?B?dThZUlBzYm9xN0FneHFwemN0SjRRTTZodHNVVTU2ZjlyblJmSklnRVFxNDQ3?=
 =?utf-8?B?N0xZL21PbkdwQ1c1U2NoN0NFYmdCZGRXZzkvOUZXZlZiWVY0aDBxam9PeGtm?=
 =?utf-8?B?S3YzOUtlTlpoYnN6K1o4UkUwZmNVUkRIRlpyd1ZWU2dNaHVLTFZoU09qbkxm?=
 =?utf-8?Q?auuDofsBRUBixcHvpTL+BVOJjtm03FiE4EQK+?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e903c2-d064-4449-31ce-08dea60feeee
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:54:09.7789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHvEOz4Y13OxKP2VYEMK+D5qqw0fVnuM2ikCiwAn98WcMrBqFcVPAeh4BkyjTEXnb3aC93k/251NJEShLKD+S/MUf6ilajMbmbAloFzRWK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10643
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 16:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236123

Hi Ross,

On 4/29/26 6:48 PM, Ross Burton via lists.openembedded.org wrote:

SoB missing (I'm sure patchtest will soon complain :) ) and a sentence 
or two as motivation for this patch would be nice :)

Also why not export like the other ones?

Cheers,
Quentin

