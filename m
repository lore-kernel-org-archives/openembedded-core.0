Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934C8C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 15:30:10 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.51])
 by mx.groups.io with SMTP id smtpd.web10.55530.1742225405160061316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 08:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bfqQ9JVb;
 spf=pass (domain: cherry.de, ip: 52.101.66.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQhKvwI7F54DCJNCRukhrhrVpzDKu/X2242tBMgTkHCpqMddSpqeooiXIUAkO6dzxi6vB2z4Bz5zjfS84hqWjjIt+t+AO1169f9OdmxAFtFYbqDwz4iZUxiyEGetJibT08siLtCCaonDEcswnmsjlpsT8j7IzS77vc+MD2rMJajV9ua0I+xQiSgR7DIRgsIHQ9D5GwKgFUB/KXUAbrSxQwfNdgd4WkXHA/nCytut/B+HvNz27qPVsiOTpkb4JkizyBXyFO2htr8qfLAhVJGjl7qHnNwrEUk0WI4EbVcRWLCT0apT1HqkSHAZECYhhY2C/gSWzN+uPi8hrqKTH+qaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42OAxqlwCc2r+e7KvBoUBQQeSEww31W5YBjG4tMkbms=;
 b=lTJaFIpIUAALiHPT8zemrDbGSgfG0tLJeudOfqC9RjBWrRoXin/NY/H5S8dhECVT38c/7/jmDP7ww6KZXdYMRMLaTzN5thrMJhYBAzI373dViDKlQLdafR+Blf7wbSQECxHXZV4t1qiUoA7jVtmCcaVuBueay7AW04OjZC75AwyzQwiJDDskVNRNBuI0TPqeeAyHTmszmXARcsd0GDVCFSz8ivid/Bar5Z5A/1I0kkKj+lvIO1ehgm3sN+yK5dObWwxUJgVOWv8opi/NvTh4k+Y9ivrQGuOwZ5Z8VS8ySiqnoofVkAP607ye8Bq8IGuGp5lYskQXPUVjvwVharugOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42OAxqlwCc2r+e7KvBoUBQQeSEww31W5YBjG4tMkbms=;
 b=bfqQ9JVbCH6eaVdVamNIkEoK66iH9oj3aKssozq8JXFdLlWRFGY2xRK91cyeDvwLKLdCTXjOZ1NzLXhb1gxPY16eImCS6CJCQHyVam+Bl/pcQjNN0X7df2TB9zw8WMiwYyw6zx4B/ZbQLl+8K82iPPnxoQ1Xq+8Aa51TL9AO/1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7785.eurprd04.prod.outlook.com (2603:10a6:10:1e7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 15:30:02 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 15:29:59 +0000
Message-ID: <326ed6ab-4d06-4fab-b3b2-23891eb9a77b@cherry.de>
Date: Mon, 17 Mar 2025 16:29:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] libcap: recipe cleanup
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20250317151216.3484052-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250317151216.3484052-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: cd41bd9c-f6f2-477e-e6f9-08dd6568943b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SmZ5S1h4M2lXT0xnNHBidGVCQzE5ZzBxUEVxdHQwYTRPN21GajBjMTZqRVR1?=
 =?utf-8?B?Uk5nRE0vdmw4L2M2c3pjVmVKQzV0OG04Z0xWRGcyczdtcmhySStxa2NrSWRX?=
 =?utf-8?B?UVpqa25LUEVhZnRzc3FZZmt4VWFJcGVyL25RWVdCMStaQkxtWDl1T1ZNdFFY?=
 =?utf-8?B?QkhJa2ZzOFI2ai9QN3hpeE1XSkU1YllnTklGMG5yZVJObFNYb0RnL0FOVWFY?=
 =?utf-8?B?djFZU1lYWUlaNHV5QndldmFxeTV6eERtbnJNaU5OckxtVlBFZjhuZ0x3d1lV?=
 =?utf-8?B?NEM5SWFrR3Vid1l0NkFZYzZYSXJUZjRYcXNjc1JIUWpOTUdqODdhdThzbVJ3?=
 =?utf-8?B?dlhBNmNsVVF4Q1BjWFhVOGRYTE1YbXhwNFZCK2lnMGRNZjZuVmd2MXRyWXdX?=
 =?utf-8?B?MEl1THBDaUhLWGoxNG05bnRYSmQ3MnZ6T1dUT0VTRnJkZnNlZFhBc1gvalo3?=
 =?utf-8?B?dXJTZEdkY0IrVTVIME9jRVN4SVJML1BPeUE0cHNUQ08wRFRUR0YyOVpQUkZl?=
 =?utf-8?B?NUhkaFovcXVvSjB3THRCK2RBek1VVnpBQlpuTWNzZUdWL2xXc0FzS2FGS0Fz?=
 =?utf-8?B?U2JFK2QrL1RqMXFOZVJ6ZWZmc0lGdVU4UDBQcTJoOEFXNGcrY05QRXVTbXVp?=
 =?utf-8?B?ampCcEh0b3NuRGRRZmtiU3NON2lZQmRUdm1yak5uQTYwRlNEZElxMlpYSkdv?=
 =?utf-8?B?Slo2ZDJiTWR6VURuMFRRYVEraEtiTjNXbEFpbHJ0dTZPL2pLRjBiWlBYOHNl?=
 =?utf-8?B?emxWK3hiWDlCSlg0Ny9xclI5OGwxN3N5Ykl0R09NOE0vZTBEY0ZqaHpKOHFp?=
 =?utf-8?B?UW5ORDh0MXRGOEl2RGRuZ0g2MlkxeVQ3RXk1Tkt0c1MrWFp5djV4WEhBRHFX?=
 =?utf-8?B?TWlEQmlLaWx3UGx3dmNiRlBlWEE4SnBWa0V0MGRsb0ZWNmQ0aHNKekJvQndI?=
 =?utf-8?B?dlUwYjFZNjZnSVlMSnlOcU92RFlaeDBxOEhVMjVYSkpic2VXakdMWld3bllr?=
 =?utf-8?B?YVRUZDNFaE5jci9jSjUrZnE0NVdVbFVpSzJ0a1IvUWNPR1NVbzNEaXEvTGJ0?=
 =?utf-8?B?blBIbUhiZjRUN3JTRjF0N2pJOTBDcmtnUTF6Q0s4Y0l4VG5aRTVDWWhvbHRD?=
 =?utf-8?B?dmFQZXplK0VYZHd4Z3RBOGtYWE92RytXTEhBeXg4MkF0bFM3a3hYbXYzOVhx?=
 =?utf-8?B?OW5kNXg1TTVDeW9zSWdFNTU4Z3p1bXJOMzdwUzFmOGRuRVM1S2E0ZHZhMmpo?=
 =?utf-8?B?MzcxdjV2c04yeFZlZzZhQzd0cmdWeG9oUWhXRDB3Z1g4TEdhSnJab3I2M01p?=
 =?utf-8?B?TkVVeWQrVUYzR0c1UVI5SjhrMHFyamdSaHY1WXhiQ3FkNU8rOC8zUjJTalVE?=
 =?utf-8?B?anh6SnV3NUI4c1YrWHVZaHMrWmNBK05NRnA5NTRjM2dSbDFncWJBQVk3LytC?=
 =?utf-8?B?WFlsWW5FRHFDRXdkSDV0QnBXdFVsK1FHa3dSa0lVdVg3VUZ5S1ZEaWtNTkNj?=
 =?utf-8?B?bWpvRXRNZUJ4OVU0ZEFNc1N5VWJkWjBUNTJoQlpMLy85ck1VWWtrWFpMcHVF?=
 =?utf-8?B?ZFM2bmJpVnRRUkRVaGUyalllVGg4ZWd5R2pCZWlLZ3RxMjZySG1sdDY1YTFy?=
 =?utf-8?B?WTdsODJMcEZjNEhPeUhMVlphbGFLSTBiUnBHV0xIQjZwUFNYbjR4cXdLb0Y2?=
 =?utf-8?B?MitrTDYraTJ0dUVyQS9KTmhWcUZKOFpubHRvT0hCRndZaWpDSVZUQ002a3hn?=
 =?utf-8?B?SFo4a3JXU3lhdDFPazM2cDRRRTUvYkFrbm9mYXFlejRaMU1adnNIYStJSzBI?=
 =?utf-8?B?ZTlhVlpVam5odmVWN2ZwM3IvZVRRQ0ZHK3lGRWlxZXRMTXdBRXZ4ZTBDTWdl?=
 =?utf-8?Q?e9lJGw9N3Vr/k?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2ZMVGptQVJlWk1CL2dwVm5LYVcxZHFhbVhwMmxwOEs3QVRDbTZJWDlleTNG?=
 =?utf-8?B?WCtINUUrRXJHTDFHRnI4Y2FnOVFGVDZOdjBLdGxoa1Rvb2poRFI3N01UMkZO?=
 =?utf-8?B?MHRwV24xdndVcnMyamNBYVBpdHRvRDZPZDlIV3dNU1Nmb1BkR2k4R3l5WmVt?=
 =?utf-8?B?Z3NwY1BoTk03Q0wyaUdxelRkNzUyUUVqVllqblZOYmdhcWQ5RkoxOUlBTGtM?=
 =?utf-8?B?Tmhzb2dzNHZvbFNtbXNyQzFSM2Z6RlJKS0d4TzhPaWQ3OFp4R3pLa2R5ZDhD?=
 =?utf-8?B?MEpZYkk0d2VwanhQU1pVVXFjSUJWUHdZMFBmSlZyZU44V0lvV3ZQRCtack9v?=
 =?utf-8?B?Y2RzOTRnSWczQnl4ZlR1dFA3WU5JYVpVcWxRdWIyUTV0azk4Q2txa0hMUnFo?=
 =?utf-8?B?TWV2QzNKVndzTkpsR1h3czZtTTh3SWRraWlTd0xFaFRGUmRoR0VRcFloTzNn?=
 =?utf-8?B?amxoeGpjVDFKd2FteWlYZldJdkJPUUEzRXV1S1BYbThSRmZiNlROL3Ixa1pH?=
 =?utf-8?B?NEtkcFc3TWVYclkzZUp5RWhuYzNvekREcy9NeEx6V3ZQbmIwcTF2aXl4andG?=
 =?utf-8?B?QUtES1Q1bXBxUWJoU1gyYjVaL0tRWW42SGJsdnptelBDZ0tXWFpoemlSTlBB?=
 =?utf-8?B?YWxJL3lNTVNzZUFsZWtvTXVpT3p6ODhVbU1OMG83bmZTdVB1TVpqbmx6eUNv?=
 =?utf-8?B?RGxQNUhSZjFGb0VFc2ZORjducnNDbThZZ2ZCd0tjbnRRN3VEdDJzM1k4RHdr?=
 =?utf-8?B?NnVPcTlubnZhdytZY3ZXMU05bm5IVWtuSXVubGhEZlVaYmRkZXlJbDNoUW4r?=
 =?utf-8?B?bWNZcFBKbUlNODNpR28xaVJSQzFDdzZLcG5scDlRSzlwTndFamVXRlNEdDMw?=
 =?utf-8?B?MThWaDdYY0VYOVB6QzlwYmxZR3dkT2tLZml6TXB6aWc4TUU3L1BIaE56am85?=
 =?utf-8?B?dlVQSG1KbkQyZFE4WlZsVEJrQ3piMkdZcE9ra3AxMmw0YVlidGZodFUxREY0?=
 =?utf-8?B?anQwY0hwSURGd2hsUWNIMW1GWHU2dE5rTU5mVFd4emk4Tm1zS1VpZEthcXBH?=
 =?utf-8?B?eWJBUkNRUTJmTllHblFFLzR4TmRnSnFSWERJN2dKa2pzREZya0tYSEw4SHFU?=
 =?utf-8?B?ZG5mdHVncUUrQkNoR0Z6bU1LQ3FoeXhDTnd6Tzk0eDBIRDRyeHdyZzcxWjlS?=
 =?utf-8?B?dVZid3oxQ0dRcXhRR0QwdW1GMGhtT0RHMVA2cy9hRkNFdmZKQVFwdEhiZ3JV?=
 =?utf-8?B?TUxoY3FDczhkN1dnNS84SUFEN0pQclFySFJOUURpYkZadUxDMUhyYTVuc2l2?=
 =?utf-8?B?WGhhTEtGVDh3QnFlR2xsSnRSTmExcVNHRDJNRDh2TmpBVDZvMnA2d1pvN0ox?=
 =?utf-8?B?Wm1tbjhWOTRjdzFTSkJoZnhrdHZjRDJRRHgvMk9JODYxQ1RXWUNKcmdDRndB?=
 =?utf-8?B?WGV2MVl5YnI4MU9GZDZEWjZ3cGx3TlBtOUZiUUxGYytYOUtsZ1JUN2xkdGRY?=
 =?utf-8?B?ZEhuWGxEOTB6UEZqdUM4U0tHVWhna2hqYzJGWXBpVitFc0hTNkhwUlFlMmli?=
 =?utf-8?B?UXMxRDRPR3FmTW82SWlOMVplVnNlZGNXSE9INzMvM1BWdVo1cmhZR3pXTjFh?=
 =?utf-8?B?RFBkdE5UZm56eTE5OFlMRU9vTTlWaEFCTTNzRmNlMW5TaWxLdzR2dStjZmFp?=
 =?utf-8?B?eWJkcXpHdDh2MmJaUHNGRVBXRE5aY1p0cjdKMy81Si82QTJTU0NhemNIYUpl?=
 =?utf-8?B?d0VvZVN2dGo4amdIbUpBMHFmR3BOTTBHU0MzS2RGTFpJQXlVbEVQSGl2MzNl?=
 =?utf-8?B?WXdCMVFvR1dTWmljLzFjMmNpS0drUDBpTmZla2F1YzFVK3FjUVZMbVRpT2Fk?=
 =?utf-8?B?QVF1MlJvUGlJdHVhYlA1eFZXa1dUL21xRW9UMm04WjlXZ1pjamJsVmhBblBn?=
 =?utf-8?B?Z0sydDRNeDZidGlKWCtCTVNpem5WSzNQN0UxSDRKSWZKZkxzR0RoODJZaE1K?=
 =?utf-8?B?OTMrZXVYTVlHRjFjUGFFMk1ROUd3c0t2a1IvY0NVbWlIZDhSWWFBamNlWkxQ?=
 =?utf-8?B?QnZVTXRGdTREUjlTMkpDdzhGM1RNZU9MTVJwelY4N2FXN0g1a3JPRkJsYmkv?=
 =?utf-8?B?dG1oQ2c3QzZUYmUvbnFSVXdsVitYRGFOTUZrM1k2VDNlSlEzRkV0MU9aWC9t?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cd41bd9c-f6f2-477e-e6f9-08dd6568943b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 15:29:59.6412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5A1ZoGXsy0HsOOBY/SSv2MSNaymiIa7fy7sYg2S916XB1ncvB8svMRTpcR4ysBYPdNYL434fQDcQ9Tw7p+TZtPWlVcKZjKp00HKftrG48o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 15:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213109

Hi Ross,

On 3/17/25 4:12 PM, Ross Burton via lists.openembedded.org wrote:
> Drop 0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch,
> fixed upstream in "libcap: Fix for older kernels"[1].
> 
> Drop 0002-tests-do-not-run-target-executables.patch, doesn't appear to
> be needed anymore and most likely resolved by "Don't build the
> tests/binaries until we want to run them"[2].
> 

Could be its own patch.

> There's no need to set PACKAGECONFIG:class-native as we disable PAM in
> the native DISTRO_FEATURES.
> 

Could be its own patch.

> The recipe LICENSE needs to reflect the _source_ license, so it can't
> be controlled by PACKAGECONFIG. Also update the license to reflect the
> actual licensing.
> 

Could be its own patch.

Also, would probably be better to have a package license too, to 
properly report the license based on the presence of the pam module or 
not, e.g.

LICENSE:${PN} = "(BSD-3-Clause | 
GPL-2.0-only)${@bb.utils.contains('PACKAGECONFIG', 'pam', ' & 
(BSD-3-Clause | LGPL-2.0-or-later)', '', d)}"

or something like that? (Not tested)

> No need to set COPTS, since "Canonicalize build system"[3] the exported
> CFLAGS/CPPFLAGS/LDFLAGS are respected.
> 

Could be its own patch.

> Merge multiple make arguments into EXTRA_OEMAKE to remove duplication.
> 

Could be its own patch.

> SYSTEM_HEADERS is not used upstream, remove.
> 

Could be its own patch.

> Remove redundant FILES:PN-dev, this is part of the default.
> 

Could be its own patch.

Missing License-Update: trailer like patchtest bot said.

Cheers,
Quentin

