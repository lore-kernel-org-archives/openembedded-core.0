Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B007C0218D
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 17:25:52 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.68])
 by mx.groups.io with SMTP id smtpd.web10.16414.1737653142624517985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 09:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=MAxvQI2z;
 spf=pass (domain: cherry.de, ip: 40.107.241.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmewsXqG4TzeYpIzI8GuDkUAZNpY+snqFJq1GBN62joZkHu/83g6RklF+CsdcMRV25SkooEO6xHl39onViPuPsnq/TsLtnYn9iugb4unRwN/mWRNCjdoIApzVrn/fIr319zslbfMuuJrE6a2JbJUp/6yjV6s7rNgk/0n675oXV3AYlaThC/83quxIcMK7zo2GTo07nVAO3W1d9ktURYVeJkpG7ntQxFVGR0PcgvI5ReNDbKwNZ8KiuxDi4wcGzcIrePBKoFXdwTAvcgOwe3Oq8nuqWHUtj/UD1WKdFcDwB/ksjDndXxEfvA2M672qXBZNh4m4JZm0MQ8z9Riu98SKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vjcd0OfHyaNusdQ3i9N4i66yVI7FQ3K+IG9YUHGg3dw=;
 b=J0XYbJQxrVPXbEIc8oC8xkzRvM5euIXkNFSm/w4Mp2DA2vHmjWBq85qI+oxKybuqsFXEmAl8zlaeuZsjDeRi/QvwC0s9yrjfhH/hOZTkj5QlNFK78ZXmfEy1T4q/RAMHhlG4kmMPC8rNTXKbe29VdlpbL75wleLNRgftSEhnII57UQ1sHPJHpxxQuYAPO5OCBYu6UBxaddpgK4HEe9V0ThXBkIsirPGAPOfEzTIJaHocW3NP3ucPzHx2tyjh+l0KrWwdMiDsvLN0OPKvnROIoBHLMeIuSdZ9xyGBxCvOypWOwOU/Tb8DNagB32jsptyYG52TuLxS1GhChzE/vlHAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vjcd0OfHyaNusdQ3i9N4i66yVI7FQ3K+IG9YUHGg3dw=;
 b=MAxvQI2zcGqyEYzwNL+ajmrHhBhPmYWAoU4yoZJCdmC8PGnp3q2gl058OO+adR9iKOEIHXfQGmRlEJKTLqiYn2VDl/AVSF0sRsTnIr9+vf0tRYPP7L1xekzHvZGY6fCWPt92OsAkT4ppSBMgmZC/8DqL0p7szAU+Yu4xfWeK7Pg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8636.eurprd04.prod.outlook.com (2603:10a6:20b:43f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 17:25:38 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 17:25:38 +0000
Message-ID: <c75e5c2a-f97f-4f39-85c5-ff09499d5fbb@cherry.de>
Date: Thu, 23 Jan 2025 18:25:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC kirkstone scarthgap styhead 0/2]
 uboot-extlinux-config.bbclass: add support for DTBOs
To: Quentin Schulz <foss+yocto@0leil.net>,
 openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250117-extlinux-overlays-backport-v1-0-dad9fdb81777@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250117-extlinux-overlays-backport-v1-0-dad9fdb81777@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 5629e4d4-2a52-4970-daff-08dd3bd2f356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UXVzSXpJNlRGWUlvdzRFdzFlajVpcmVQdnJwbng2K3d4Mm1OcE5heWtPbUxP?=
 =?utf-8?B?SlhmSnR0K3E3S0hiNDdtUWJLY0tYUTIyS3ZVWnBqR1dlRjdDTXRGUTVMRFM3?=
 =?utf-8?B?TVNNb0FwcGlhTlQ5QVQrK3lXMHd6N1VoYWQrZVlhdk1FdjNOaFJMZHU5RG5l?=
 =?utf-8?B?R0VjWjFzWTQrb0VTYzlIL0xrMGh4RmlwVjdwS2I2MUQwRFYxYjRVM2V0dWQw?=
 =?utf-8?B?UmVtdGtHLzZ3OUJhRmZMbFEzalljWjg5VGg3QTlQK0kwMzZGUURTRmQzZ01h?=
 =?utf-8?B?NzR2M2hPR2NKa2J2QTVMMy9OTlo2NmRySGxVOWZyOVptaEVkbzBmZFdUd1F3?=
 =?utf-8?B?VVhxWm9aaS9WUlhYZXUycGg5aFdjR0hud2RzN2JmMkxVZ2JjRWNaMHlabWFV?=
 =?utf-8?B?SGprM1FySWpFSVBjWkd5bExYRnhzZDFHTDNGbUI0Uk1nS250WDJEY1NvbmFx?=
 =?utf-8?B?aG9CU2xLSVAwT1hJN0RoMU8vSTdPNFkrVUg0ckNZL1R4emxWbHRnNTBWd3NX?=
 =?utf-8?B?Qk5IZmJaYTNQamEvMkErc25SVzBBZ3R1STU3K1VzQXFVRU5peFNZZnltak1P?=
 =?utf-8?B?N3YwUjd3dnp6cnVyLzRVUDR0SnJnRXFONTB2UmFwVlRBWTZCUnJBclJvaTYz?=
 =?utf-8?B?T1ZqYzg2b1VPczNRMWNMbjNCdUZDclhMNGZ6YmZKbkpRcWt0WURjQUtoUTFN?=
 =?utf-8?B?VTJaVjFMVnlMU1UzNDAybTR1N3lpMk9JUHFEeXZOa2J1TnJkV2dZSis2L3BC?=
 =?utf-8?B?UGUwYmN2aUVqSFcrQlhXMXhaeWFtVDlUQm1ZSXZ3SjV1bFFZbVVQVmFTZlRp?=
 =?utf-8?B?Y1ltTDRLL01Ya05tRWxSL0RWWWRqc1NmMjdmMVE5TSsrUnBKTWR0aWd2b3Y3?=
 =?utf-8?B?K3BPcGhzWVV1VmJubEhHVEM3cUdkZGhLRnkwcjVwV29kblpDdmdtbHRydUJO?=
 =?utf-8?B?N1p5cDFMcE9wMmZ5VW13TE1uRW5mNitMdTFJNzBzTkFHeThBTkltWnBuM2Iz?=
 =?utf-8?B?Z2pRWGM1YytuVnlTN2J1K1hGa2VzNGx5V2JNTkRla3BqRWlra1lLNWUwSmlh?=
 =?utf-8?B?Y29VaWVNUGdOdzg4QkVSYVZXdHdkY1dPS25HbDJTeTVYejlpUnRjVnFMcDJQ?=
 =?utf-8?B?OXU5d3JZYldpSjFCbnpnRWN3c212K21RRk9qZ3NkSW9BR01VZS9jVU5zait6?=
 =?utf-8?B?TUxIWjBGU1A4Q1N0bG5rZEh6Ulp3aDBZL0JGYUtCZ25wZHY1OHpjc2YraWM1?=
 =?utf-8?B?NW80aUNXNlNpVlFCc1ZxWlM5K0JmVFFtV1BqeDZ5OUFYWHVEYzdWdWVBMUNO?=
 =?utf-8?B?OTFYYWVVSm02eVp5Q291NVpUOTdyd1ZzakxSSmd5Tk1GaUVFMk9QYmJLWTRX?=
 =?utf-8?B?VERwTDVsdHdVQnJoV0xYMG5nS1lpQ2R2bkcxcUxyNmJJQ1ZkdjVGQ28zZmhD?=
 =?utf-8?B?Sldha2ExQ01vM0F6OUlFdmY5T1NBWkYzZ0ZyUTZsUENtTkIyWkdpVWlwZzF4?=
 =?utf-8?B?U0pEQ2ExeVdUVWRmc29jZWVsZUJIckp5NVRTNXVrMGozZU5SVDlnUDZDSmJl?=
 =?utf-8?B?YmJENW9iWm1mdVVRZFAxU1JONDl0V3pMeE5lUGcwekRmbTI0alFybng2andJ?=
 =?utf-8?B?RitJdXVZNzBlS2RXSjVmOHVRZGpDUkJHdlZiNmNxOHp4ZENBOU1yaUNqN2wv?=
 =?utf-8?B?ZTlYakU3QSt5OU9FQVlvR2ZFZW9xZlltazFQUWN3RVFpdnNlMXpHdkNxUTBs?=
 =?utf-8?B?UzBiYnQzYmx1ZTg1SXA0YjJXbUNoSHpyUTB0YVJpMmc0NzFVUjZoaEJQZ2dR?=
 =?utf-8?B?bkd0ZEpCTGNaLzFVZ1gwUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SThsU3ZGTWhpaDdQY1lHd2srMFZzWXNveG0wYm1xd1Voajd0ZnJvQi9OWm1Z?=
 =?utf-8?B?TDJOZ1YyQVlPMWpjLzdjMnVYbXNUZTcrUXphdjBBUER4VWJseWVTUkI1ekRs?=
 =?utf-8?B?MStCVG5LZ0x5dVRVV2w0cUFMVXZrOGFlSDBPcDIzSXRKQ3BseTB0QkhmckJl?=
 =?utf-8?B?anZpZ1kwTldXK3RFMktLazc5Ny9tL3VVa2VxVUpHbGhsbDNTckxpdUtYaTE0?=
 =?utf-8?B?SVdDUEJ4L1YvNDFVcS9YdVZQWUZ3MzRMK0NJM0tDcnlEeHJVRVJscXZMQ0tH?=
 =?utf-8?B?ZkhKaUx2WmlialIzUzVWUU96TzlvdnNEQmVLV05lNFZoS0FlY010TTF1UE9Q?=
 =?utf-8?B?VTNVQldBQXR1V0h4WEtkVXRudUoyR011bG9ZQ2ppeEFRZ0lwOWVUQjUxRnZM?=
 =?utf-8?B?SkZ4OWpGN2VIREJwWVRUMkhyK0RXeFJNd2pDRDVnb0hxYXN0cEdtdjJSejBE?=
 =?utf-8?B?Ynp5U0NUT2FZK2JGL1dSd3lQMVN4V0RvcXIrblNYTXVxbjlCSXB2RWhFbStt?=
 =?utf-8?B?WUV0OUZFQU9yaVkrd0FnQWlGd3I0YkRZZzFzKzVvMjVCeUZCQXIvN3J0TGhU?=
 =?utf-8?B?YXFqWGRVSEs0dmRrV3ltdkdBY2ZuRThoK1JjR1Nyc3QrK3BRZDBiUisvaVRW?=
 =?utf-8?B?UnJ0ZSthL2F2aUNZQlVmNHZYSXNhWFlmcUkyaEE0aDd4bjA4Ty9WQ2xFWnlL?=
 =?utf-8?B?K0Q4YTdBbEJReFVuQWtVbG1ZQUwwZ3hYN1pHSHZFcVl4Y0JtdHN0S1puRHNx?=
 =?utf-8?B?NTQ5S3pma21rcW53YjRJV1c5WG9uMXVSdGZvK1NvY0RrQVBFZmUrakEzRDlV?=
 =?utf-8?B?Sm15UUtya2NodlNEOVNkbE9XcHQyR0s0SUM1aFlCeWVsdU5saENlMGM4ZXdG?=
 =?utf-8?B?enFkZHBUNWV6Qy9GR2ZLL1RzR3kzY3RnSy9qMXNxRGhMM3NUTVV5Ujd5akJa?=
 =?utf-8?B?emh2SXVVb2xsdlRJdWxkbjlWcVBnRWNXTkovVFEvWXN5cElEdzNMVHlNd05l?=
 =?utf-8?B?TFFIR2F5ZUVEV3BRM0M3VDRvbThUc2ZvUENIeGkrNTZtN0c0Tk9vTmttMkc0?=
 =?utf-8?B?bzNSSnFzQ1pqd0xzOVlWOFlBVFh0K1djT3Z4MVZwUmNwamd3TUo3SmpqL2xp?=
 =?utf-8?B?M0ZWRzZHRVpNKytrTWYyL1RzREpTL09makNMdXlFVi91RHRFMVN4RGhvL2Vv?=
 =?utf-8?B?Y2pvTDQxVWJYTnlrWkt3LzNhVUFrZWJ0OWlXNDgzZzFwNlFUUWYwM2xWQkda?=
 =?utf-8?B?WWhHRm5PT1FHVEFwTm9renRKVGtkbXBYYzNiVW5ITlRURFo0MVBKTk9XOGsy?=
 =?utf-8?B?blNPMzBLZ3ZsTGRTTGs5UUtpdUVoRzg5RVdxOWY0UWxIZkl0VFNNWTB1Y29m?=
 =?utf-8?B?a3hPeGRLMUxQMVdWYW9ZVWVPSWlGUHcxclVhbm5IZEJKOTMzeWdVb29mR0V3?=
 =?utf-8?B?R1JqcVlsOVozanB3RTlDR0Q0NllOR2ZZUlRXc1dWZGtjUWt2d1FuUUZvZUlq?=
 =?utf-8?B?UnFuS21oQ093SHUvckJwUGFnREh6QUtTMWtoRldZcXdQS3NrUlZUbThvdFJH?=
 =?utf-8?B?cGY5QXNMbjVXNTF3UVlkakFGemRvNjh6WG1BQ09KREUvUWlMcVc3M0x6YStv?=
 =?utf-8?B?YStleUxKU0NmYllFNUNuVkNtVWs0Q0t0NzRVSm5ZZDlCMG05d0FhOEJlUytF?=
 =?utf-8?B?czhnbzhnbUQ0TjlGOVRzS3pZOVdMZS9US3JMTnlkMTZqSjNFaVkxL1JwRUY3?=
 =?utf-8?B?RC9FOTNxWFVKOHlLa01hSVJSZGhudnpPbmlVSVE5c0p0MFpkZ1VyY1lHZmYz?=
 =?utf-8?B?N3NxNFpFSWcweVhlMVpsMjh2VmFiNTNHTVM0OCs3T2JBS0lETUY0SUZRMmpT?=
 =?utf-8?B?VHFiVEZ2VTlMeWlpK3VyRE1XQU9PSjZoZk8reWk5S2ZLbzB1c0YvUmt5M2dv?=
 =?utf-8?B?SVpsbE4zekZlMzI3NllmblZFUk9xaDBvL1FzWE1USW1BZ1FHYXlLRlVhQjla?=
 =?utf-8?B?UDZhZ1I0cnZtV2VIaDRrVnByMDdGTlRRK1dJR1BGNTRRNHB4c2hsWHdzMmNC?=
 =?utf-8?B?YkxzNTRkWGVCREpaYkZqNXdYVUYzUzh5WTNTKzFFeGpZYUhlZHN4Z1Y3Uk1Z?=
 =?utf-8?B?bEt0QUFyUnZQTmxiNHR2OFhaOWpGSnJ1aEw3U25PaUp6a1UzWnR6cllHekds?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5629e4d4-2a52-4970-daff-08dd3bd2f356
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 17:25:38.2911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzIRBMvaLIr17KcAuldM1/yOASzO+x/9w4aWQmSNih+jP699vqrWqqG901DKIofdJgrHZRiLOgHRKnp/7j/elie3Nlk2DQAQBnayf/oo11s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8636
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 17:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210202

Hi all,

On 1/17/25 5:40 PM, Quentin Schulz wrote:
> I am not sure this is actually a desirable backport as it's not a
> bugfix, hence the RFC.
> 
> Applies cleanly on top of all listed branch, nothing more done on my
> side than that.
> 
> It's just that I'll need to support extlinux config with overlays in a
> few weeks for my BSP layer based on scarthgap and modifying the behavior
> from my own layer is not a lot of fun I'm expecting.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Quentin Schulz (2):
>        uboot-extlinux-config.bbclass: simplify FDT/FDTDIR logic
>        uboot-extlinux-config.bbclass: add support for DTBOs
> 

Just to let you know that we would need to backport 
https://git.openembedded.org/openembedded-core/commit/?id=a41fd633786a2404b5eee399ed0602e229c4be77 
as well if we agree to backporting those two.

Cheers,
Quentin

