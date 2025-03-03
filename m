Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E3CC282D1
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 16:43:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.70])
 by mx.groups.io with SMTP id smtpd.web11.58549.1741020221681327047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 08:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hkBGyr6l;
 spf=pass (domain: cherry.de, ip: 40.107.21.70, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtrYgBv02XEVwu0aholqP0VjrXwf1DK/EDWfZfY08ZJJIiFynMfHXj6lmowxt9+xVcMPGm0m76evJgiAcYH6bnpWidz2DSmMw+XT7mQLrPboziiN/z6KDs4soxd5y7drkSDHKfffWOqIv5PYLs8E//hVlhOi9+vMtjgLMOoLx4Ag9Tefh00HmuQ5RbsXqlzuL9LcdcZw3c+eobEH4UEPf1k4Z/ewWTDx4NjItmeInXoJW/H5ldPy4Qswqf4NHMK1WRYVHuIo//OH5SEgEz4naHXmR5YLPqV11OunKNjjVsv74kxB9ICZhvALu1wZy3oJI6mLr3FE8/cOFKCJXR7oiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EUAJ27uo7+3lnnheT2OzwFgikDKH2GFP7uv6uf0Oas=;
 b=QCzyoGyeHEmXZ06BghdG3chQaDB1E7bRMohSpU1h2iqo6QQFhwsluiGvGxHy76rNqe2u6L6L4xYfeBq8TN+6mtopgXadKCte0g9UWecYgylYjlskK5OGxQk3Ku8PdHVZhXnnYLkh80zGOH6A52Ml9B3td7+O5FNCWxHd5yE5fFfh7YF8wa3HfbCq+sX4m3Jx2Z6jcYEhRKX7u8uEcsYKETwFZjlDTiSrbVsqBiJkqfkqpctoqgeheGjGJV5Er44hcyyFpKBOMfoyxjzU9Q9tuMLuP7cUT7LbonhzpEM0EwBfH2NZEX/RuR/erdnoO6aYszZiV5dSq9D6DDLomNs25Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EUAJ27uo7+3lnnheT2OzwFgikDKH2GFP7uv6uf0Oas=;
 b=hkBGyr6lNzhmh/zjxy77Loimwu9AYIAN6pY2QS1NH8t/fAuV9XJjNseAVxZdJiUuX58GVUWBcm9PDRBxwHWo+v9RtCnII+3xczXwszqsvKcUXKD4hburkIIc0wUeoje+bO6yuIyJRdaCS7nefSLqumBJaBeH4qNbU5hQlceemK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10183.eurprd04.prod.outlook.com (2603:10a6:150:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:43:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:43:36 +0000
Message-ID: <e2801581-2648-42a7-9d69-11ebaab0a4d0@cherry.de>
Date: Mon, 3 Mar 2025 17:43:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] systemd: add libpcre2 as RRECOMMENDS
 if pcre2 is enabled
To: alexis.cellier@smile.fr
Cc: openembedded-core@lists.openembedded.org,
 Yoann Congal <yoann.congal@smile.fr>
References: <20250303134038.102355-1-alexis.cellier@smile.fr>
 <c33ab1f9-9235-4076-98bf-c8bd163c6464@cherry.de>
 <CAEs58j4staKXtJSoWkj8kauQVhz9NbUFZSR8YuV4tHFfqzBqNg@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAEs58j4staKXtJSoWkj8kauQVhz9NbUFZSR8YuV4tHFfqzBqNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0049.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::32) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10183:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5b7dd1-9f87-4bc2-ebcd-08dd5a728ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZXRndzVDVENzZmZFcmpXa3JkakZsT29xVWtPWVJZbTEzWkxveTZYVDE4NDdz?=
 =?utf-8?B?TmlNNUxWR2UyQ1hSejVBSXE4MjJzWW1uWGdlSkp1QTZYSzZnd3h6emh6ZUJC?=
 =?utf-8?B?a2F2eHc5OE0rWXBZcG82aVlSbUdHdVRsU3dFTE44K2xIRURpSDAwMkR3cGhT?=
 =?utf-8?B?QkZGaXRCVnlWd1hiSEZQMElYM2EvY0VuSG16eTdqZWFsNGc3MEx0emxCeTJp?=
 =?utf-8?B?K0xuOGdaeFVucjg1QWl6SnhNSGYvWEM5ZGRoT1ZralVEWHdHKzRNdkoxbHlV?=
 =?utf-8?B?eEJNeXVHTkJ3QmpHSVpKelYzSThRTnRBbm5qbm5KdkpreXh3Tk0xY05qK0th?=
 =?utf-8?B?K1RDam1iUHNBVFZhbHd0eldjaGVuTjFQMXhGaE1KM2htKy92aDhNcldIK084?=
 =?utf-8?B?Zk1zK3ZnRjFjbXFpemdLa1d6S2Z3YTRqM2dvd21tMlNmczduNGpSQzM0M2ht?=
 =?utf-8?B?cDIyZDYyZmNDTHlUTVh6OEpOU25Eb0RnWUN1WTZFMERkcnhoUGNIZGRsNXpw?=
 =?utf-8?B?OUlkYXdOZWdKZW1Ua2dNa0kvNmwrZ2xRMWVFYXBGYzJlczRzbGM1SitNWTNR?=
 =?utf-8?B?VzI2UmNzSTM3S0pwbmpvVXI4dzY4V0xaTUw3cVhlQWp2N0kwWEthdFNER29m?=
 =?utf-8?B?U1pjM1lLK1dnMXNJYmtpanBaM0RyOWkwSmpEbTBadE9ob0RlYzlyZTBBSGE1?=
 =?utf-8?B?TkxidHBabTlrQjFpbVNiT2ZGTFZSTDN1cDliN0RRU2FKcDhiQWR3a1hXaHd1?=
 =?utf-8?B?UXl4aVBSOGhGOExLNzFIOHdiTWJvK1ZBWDBFWnJ5TG9JWk1CcG52OGFYSGgy?=
 =?utf-8?B?NkZwK1ZYWUlzVlIrL3NvdUI1c3NmUm1hRHFpVXVLNHF5cFhPbnY3M3Vadmcr?=
 =?utf-8?B?eVpCNS9yUmR3UFk3YmorbUh0akFIZHlrZHJrcWdBUzhUUURMaEQzYkU0cmNl?=
 =?utf-8?B?bGZrRU1mOG1PNk1yaEtRTVo2bStFYWw4RVUyVnRjU00yOWtzQTNXTk00V2Qy?=
 =?utf-8?B?d3JvajdDbjkrTFZ4NitXbVJnUUthM3NXdWNqVTkzS2V1RzBwcnZQSEhicERI?=
 =?utf-8?B?U3crcm9NWTBRbWVTT0hqUGxBa2lpekxZaDhsK0RVenE3andPYWtmNklFZ21l?=
 =?utf-8?B?Z0o0eXZ6UlB2dnlLQjAraHI0azFOWjg3bjlzeE05T1l3Q0NWcjFaWmYwVito?=
 =?utf-8?B?UTIyQ0pUWWRyUXRMY0l6ZXhTZHBqQXE3TDZmY3ozOWYxaEpCUEJKTUdZeGR2?=
 =?utf-8?B?ZmxLTnBQT211akJTb3hLNFA3aE1nYTRyK05LbVZuSXhBK3VrVkVNckkrYjdv?=
 =?utf-8?B?VjBuQ2x5UjIwSUJZb2pKakhOS1BmL3hMNXI4VW9jMGhSK1hXOFZCZVowc3E4?=
 =?utf-8?B?SElaSy9OYWRKYkF1RzB3bDhUTERnWEVUWkFIR3BQUC9FWllRUlpUOTVMaDV0?=
 =?utf-8?B?TWZjYlNyRjlaSGFnRHlTK1Jlc0svbmwrTFBhREd0RWFPcFBJK2lKSnhkNjFH?=
 =?utf-8?B?YTA1RGs0blhEeklteDdpQ0hvU3lUTzZySVhyblU0cWZLT3VvNXVhK05BU3NL?=
 =?utf-8?B?S0hHWnAyM2YyZDhaaG9UckM5V0xxTEVEYVRYVG1kU0pEQXNYajFPUmp5YlU1?=
 =?utf-8?B?cFhRRGFXdjlBdUo4cFJ4enNteFpSZkNaZkZ6aUxhMUJQcHdVK1JMZllhZUxu?=
 =?utf-8?B?SXJIV2VtMXdCd2htT3gzVDBoNHZXL1JRTHl3aTVlbVhUSENhVE1GbCtFZThv?=
 =?utf-8?B?VGp1RGd6cEVOUDdwcVZSYkExeWZKVlNVU1krd3ZvWG1qaTNWNndkT3JhMVlL?=
 =?utf-8?B?RUpZZ0kxUU4rZXdjUFpJL2xzVlV4YVlLR0RyalAyeGdNZnpJazB0OE5wNkpz?=
 =?utf-8?Q?E5/Lb3V6FS9ox?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?djBLU2o5MlNhSEtCOTFRUWhYS1VEREJoSHBqcHlxQnczNmVpb0lTM3RseGtI?=
 =?utf-8?B?SjY4NHZBOHQzdDh0TzZZS0FLYnlkZld1bG1FVVlsZThRaHE3aXBqQ0RkQUFE?=
 =?utf-8?B?U09KeENhZUI0QmVhVWg5ZUpjYnR3NWVrdHRCOEZDWHN5aXhYdkFkcEY4VU5O?=
 =?utf-8?B?a210ZmVDVjM4T24vcXlSZ2dnZUlhU3BEREF1Ly83OXhQck9iMGJoSndoU2w4?=
 =?utf-8?B?VVpOemtGdzJkNWYxMFF2SmJHQWUxV3RDa2UzdlVEY2dQelJpdmxVQkp5RFly?=
 =?utf-8?B?bE1SamJ1K2NucE9uYTVma0lENjcxU2ExNGlMVlBXdERQdWRrRWszMFFNaklG?=
 =?utf-8?B?WlhXVkM4QkN6Ni9obGdOM3JkMXZuZ2FxamJGdkZyMW1sWGUyakljVk5SWHdk?=
 =?utf-8?B?OW1zWUhwdHJhbitrOFArK0tWdE1lanZDczNtNGhvZ2gyVjFsemQzTFp4U3U5?=
 =?utf-8?B?QysvYVRBWVZZZEg1d0FDUGNXakUzeFFmT3l2K2tIQVJlYUVYU3FoOXpFbEJK?=
 =?utf-8?B?dGZqOVNpandKUldMZVcyTzZmS0QxeHJVVTBBWGhLRGZtTGN2ZGh2VGEvUEtD?=
 =?utf-8?B?THdheGdjYjlDL2RoSklqY0FjQTJCTWxwMGRCaEloampzQ0MyWXVJVmtpK3ZU?=
 =?utf-8?B?Y2paUE9aZmdGd3lLM251aGRQUllyZTVjRndUbXdIRFlEOENiUjB4aXRIN1Fp?=
 =?utf-8?B?M3lPSHQwd0V1TU42NjBNVVlMbVEwTGovWGtoOThrM2ZFa3dpWU03WDl1dWE2?=
 =?utf-8?B?VmYxR3V4TTR6My9CekpnQTJYeHhLVHE1SEozeVplSTBoNWtEZU4wdkRQS3Vx?=
 =?utf-8?B?aVJKOWE2K01mRTA4dmlMa0dnNE1XZXdHdGVnRm5naDQyZU03ajZxU29XdTBw?=
 =?utf-8?B?WjFKQTBuUzRFQ1pXN0svckNYT0haRXpjYjZNblJCZHo1U0pzb0NqU0EyTzAv?=
 =?utf-8?B?UjkxMmxCN3R5eDE2SUtYN3dsTzJUMWJhM2NCdEpSWUgvdzE0RG50bzREdHlF?=
 =?utf-8?B?Sy90dGpQTDUyaS9BcVdic3RwK1hWTVRiWWcwMHhjNTlQalBERTZEN0ZMdlNx?=
 =?utf-8?B?NnUwa1EwOGJWNkhpRTJzOVJGVUdUYTM3Z1BBak9oeWtXajIvQlZzejJCcUR1?=
 =?utf-8?B?TW5HeHc1WXlXNkFYRDNjTGcvaGFEWEdlUTNxWE1UcEg5a1NKNCtHNVZxOFJs?=
 =?utf-8?B?OTNrdVVTWlB3UDIrNlFRMkw0cGVaV0dVTmlIc2w2eWhFeXFUR2V4b2kyaVBl?=
 =?utf-8?B?Skpjd3Zqc2RJNEtmNEZUakorWjhqd0pWN2lFamlkeE0zdE1mTUJRd1ZlQ2gz?=
 =?utf-8?B?UHd5N0FUZlBPNXZqV09tc3dCZDZzUXFsRmlqOW0vdk1FK3RSd3hvdm1mVHN1?=
 =?utf-8?B?c09RT2UvNUFXSWtNWGVJcHVtYTcvK3RVaS9NTHhWVWZmM3NoNWZCbUJuYjN5?=
 =?utf-8?B?cEZaa1ljUU5STXNGWHZEUytMQU95NzVMWXcwOFJqUytnWjFFN1VMWUN1NlRh?=
 =?utf-8?B?bFlVT05QWGlwS08zeWdGUkpCa2ljRUdVd2xxbzkvZ1dJMFk2aFNOckpjd0NY?=
 =?utf-8?B?WWp4NXFvL082ejllYzZ3RWZpS3JHeW50TzRETHZ1TjMyNEpSVlRSaFZPV1Ux?=
 =?utf-8?B?YjdtR1N3blZLemthMFZHdHlPTnVEOFVhdm9YenNuWXd4V1VUdE9DVEs4Uzli?=
 =?utf-8?B?WFFpVW4reS9WYjdncTN1Vmhic2szbFZ0MVdpc1N4SHI1eE5Za0d4WFgveGQv?=
 =?utf-8?B?dlZ4T3JCRGlJMVIrM1dKa09ERGxDRUFWNWhMaTQzbGt0YnVUZDVjcjAzMlo0?=
 =?utf-8?B?Q1E5VjFyWWZDZ0x2RDVadmFHQlNVazNydUlIbkZ1djdSeklwRFFFZWg1K09N?=
 =?utf-8?B?ZTkzU0JEdWRRNjU2RnNhK0o4Tk4zSmk5ZDc1L01uazRWYjE0dnhIUWV4VUlV?=
 =?utf-8?B?am1EeUpYdEZuSTNrNlRtdVdldGtqeVcwRHA2YW1sSDE0a1RNQnJiaUtiRUZS?=
 =?utf-8?B?MGdybnVGaWZUNUlDWHZ2TDU0RnExcnFsYkZiQXBLN3VETzBnMUpGOW1DdXNJ?=
 =?utf-8?B?bHRFemNCS3Q5U2N3OUg0eHdmZk82U0dONmJkaS95ckJxYjUwTE9oeE9Jc1Jv?=
 =?utf-8?B?QkpqVTdmNVRCRFgvRW9SUU9xcUkzbVVKV2lUWHdKTm1kQlp5WXdsd2NaM201?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5b7dd1-9f87-4bc2-ebcd-08dd5a728ade
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:43:36.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1LtnIiu6LEiqjxGUkkuAV1KgdLMkyKZHWkGTjvDUjOvM5uX3ts5fnW+wdlD9RT8owOu8RMsBhg/c11cci5TNmRtqmngcIUA4UuKCS/QdGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 16:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212222

Hi Alexis,

On 3/3/25 5:23 PM, Alexis Cellier via lists.openembedded.org wrote:
> Hi Quentin,
> 
>> On 3/3/25 2:40 PM, Alexis Cellier via lists.openembedded.org wrote:
>>> [You don't often get email from alexis.cellier=smile.fr@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> The libpcre2 is now dlopen'ed, so it is not automatically added to the
>>> DEPENDS anymore. Add it to the RRECOMMENDS list.
[...]
>> Also, why adding to RRECOMMENDS and not RDEPENDS?
> 
> Because systemd says libpcre2 is "suggest" (with its tool on master),
> and I've asked on IRC.
> 

OK, please mention that in the commit log.

Cheers,
Quentin

