Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209BBC36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 11:34:22 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.83])
 by mx.groups.io with SMTP id smtpd.web11.16560.1743507255828168940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 04:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=N9f/NOAC;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.67.83, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yb0oNyA+wGPM6B6QlhCzH8mCG6k6an/l2Dn0as3uVcruBbjHZnv9QEUu/vHRfgrxVq8j4kUo6MBrDpQ+2x4KPEojXwvFaWWotTwbarajE35a1CMeONmuLQxhRUvxK5qVuEzrKwx4wfsX73Lq6wxuS70o6OkbrHdOwJEOW9rkhdnsK92/ZHuheqwErjGBg8NYrhzIS/qFuVtCsHpBA+ND3j5UhujbRfRg+3X2xpnqI11pj/9BqATZ9EMhEpXqw+OZ3HNNhVAIpzliwkj4NDBiRDJ1PWAVWwepf9DB6llbl/PhXyZmTEZA4q4DO6kWq8yvda1VDkF2NmUCkdcA0NhRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UV5FznFxGBqDuuTIM0loC/lz7kcJjmj5tgxu3oRx/AY=;
 b=BXyiTy82VN60YveL2RWga8OM59Q64O4RGDFqhq4pH8biVl6ZePAOZz68qKWGZuVUaAE4aYqN6i7WJ5+bIN31gLLNNpVmu2w1gVG7Ie1eHcWjFc0I34lgbPfR5ZychqLS90x06jB0xKEPIrTzzm+l3BIjhcP6w6SQVfee01fjl2Kr7dMd63VAFgfW9thzKPLKVS5+/IFa2bEsS53IDwh+dNMlnOcmHG70NCppAGrD7uzOuMY0VgZYG2MHex8KIwdsf+WzGUHFp2dDQhN84R5tNJfpdxMlm85Z4mxUTpQsQ1672cCWHayxDSG+05ohGzpqk2A773C+PLC1LzStzyIWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UV5FznFxGBqDuuTIM0loC/lz7kcJjmj5tgxu3oRx/AY=;
 b=N9f/NOACGYUCBOve4AYDCC1cEppIc9DZuujcmfTNHUhu1CT+0FWO56P70i/WMAU8vWK5s6RDSb7Em5hjjRF3JaJpnDzouD/x5lPAbKnKi/arF+uGbEFuaZd28J3ZR3g3TOoEyPnNyOskIrhdLff72hERIM1o8DtlCwuJzNa7KTQrqd3yXpOQRd35yLyoFF56rfNg7fBScXAogiaG1gORj4ozj5UPQp68Lfavrb1CQr9WWZgNbpTqQ0f7jJpo/gqhKSePR4PGuXTsbQzfRlHuOGD4N7ZKbPRGF+r1X8k9Bp6Fi1KaR+l9lIgPNh9DmJqOILjcLMlMAm6cZPHBbVsZag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB8PR06MB6363.eurprd06.prod.outlook.com (2603:10a6:10:129::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 11:34:13 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 11:34:13 +0000
Message-ID: <86c6c103-d2b0-4254-93cb-e9eeac247e33@vaisala.com>
Date: Tue, 1 Apr 2025 14:34:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] recipes-connectivity: Support alternative runtime
 D-Bus
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250328150136.1855862-1-niko.mauno@vaisala.com>
 <20250328150136.1855862-6-niko.mauno@vaisala.com>
 <80F71DA3-7A19-446F-B16F-AC3619AB8566@arm.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <80F71DA3-7A19-446F-B16F-AC3619AB8566@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVZP280CA0043.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::10) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB8PR06MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e108e9-f3c5-41ad-4510-08dd71112067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SFY5dWpVVFU3ZVQxbHRWVGwyN013NDhvRXBjZ0dwRk93SXN6SlY5blZ1UWhR?=
 =?utf-8?B?Ulo0VFE1RHBQQW96ZkY2WXFBd2xwWmdldGsrbXFNMlRXRjIybGNpdHgrcG50?=
 =?utf-8?B?WlRWcmZFSnJtclluNHNiUSt6SEltTEVYdlRCcXpkaitPOWxGZnFrd2xvN0M3?=
 =?utf-8?B?dG0wUGlUS2dBeUcwd2s3aFkyOXlXc04xMTB3dHZFbGRXUXh5QjRGK0IzMzBE?=
 =?utf-8?B?eFlRSlJvZ0tLVE8zakg3T3FxQVQwcXY1NVc2Nmlqa3lGbEpFNndQa2h4Z1RV?=
 =?utf-8?B?dGpUWUNKT1I3ZVp6ZHFMR0Nqb3RGSWxUOUtSWjRuU25YVEZ6N1dJYmNMVjg0?=
 =?utf-8?B?NzhGbTdsR3J5S1IzNTl2am9CdE5tRjlGNUtQU3QzY0E2SDZlYVIxc29pamR3?=
 =?utf-8?B?dlhFaXVCUlNaNW1mUmFDNldUdVNQVVA4dzJuOHdYSVVyZkJ2REdCZVExbWRv?=
 =?utf-8?B?Y0hMZTNMMEhUVjh2UUY3RWdZSWpRWXZUaW9zUlhpeHhMZnB1SmdIKy9RTndF?=
 =?utf-8?B?QnlyK2llaUFpaURBc2Y5VlVWOWlJTFhYWURvMDdIek1OTk9NbzQ2NXVINEk1?=
 =?utf-8?B?Y1dSQmdzbkRRSGU4aWtKQ2VOcnhGeGRISFNxVUhjSUswOG1PNFRXd3VEdTJ0?=
 =?utf-8?B?OGlxSDZ5V1RsajMrcjl6VkJjSXpzMWpIMGZjWVhhSU4zdGg4cUpMZTkxdjN4?=
 =?utf-8?B?dmtpRDlnVTQ1U0c2QUdUaUlPaHo0eW53UW5wa0V4MEl3czZIR2FuWnFkQXl6?=
 =?utf-8?B?Wmk1a2x6ejRSd0oreDZRY25ld1lNcFVVQXhXQ0p6Y0cwQkZacnE0Q1dJOEts?=
 =?utf-8?B?aXR6dGhxV2VaYkZwRWRkVjVzcTdQaTdScTNFQXB5SnI3S2xFSGw5NTJSQmlh?=
 =?utf-8?B?ajVSNGlLNS82ZUIvd0pRUWszbzM2bTZDaklnazhySEJMQWJJdUtHOFVaUGpZ?=
 =?utf-8?B?ZzBvd2daaGZTa1NUaHZDMVg1cU5lektZL2hJaTFZaFFWNWlaeTh1NmtDUzdq?=
 =?utf-8?B?Ti92Qzk5UkR6VjhzSFh3SmRxTHEyTE83NktkanZSYlZWTW1lRDZodDBVTkFj?=
 =?utf-8?B?TnpLOGM3YkZ3STQxQmlyZlJBelF0TnFPSmNxUmdSd3hDKzlHcDM3Q0ZjMTVl?=
 =?utf-8?B?UzBkWnd5bndYaHJyWVkxM0JvZjQ0dGJQMmRBU2hiUUZLT2UwTGUzWldWcFpY?=
 =?utf-8?B?bEZJTnJSWHFkTW1Ncmc0MlpkR2wzTTB2d21LWUVtazZpN0dnOVVLRWo3T2FJ?=
 =?utf-8?B?Yk8vcFFwVjhZdFVWUEZ1QkJuMEJkaDVaUmV5UWticHpUYmx3WFllcHRzWDZh?=
 =?utf-8?B?OExEWWVXbVNqaVB0blhRaSs2SkdLL0NFc0Q4T2R1VUhFeEdxQnZaWElsVjB5?=
 =?utf-8?B?Z1pMQVZUWmUrUEtSS1JnQVJkWmtyS0ltbFBQV2dwSklsRVE4dHlNdGZ6VUVH?=
 =?utf-8?B?TXE2Yi9aK1ZOL2NLejlCMGkzTGcvaDNSUGZtNU13YmVUalRkNDBVOWtPNVpI?=
 =?utf-8?B?NkhRRW5NNTR3aGIrRWh5WG9XUkdPVUJtanhLQzRjdlBFSEVsK1JKTWRjSjNm?=
 =?utf-8?B?aTdHWDZJSVplTld6V05sOGJUMTdsLzRZL202dGp0OWppaUxjQWRjK3RDRUsz?=
 =?utf-8?B?cjhJdXorb2drNjNPRGVPRFQxb2JMbkRGZmp3QW84UmVrb2o4OXQzSm1KcUVr?=
 =?utf-8?B?a0VTbkd0OUZHczdLek80ZWpZUWJQV0Y2cjdNRk1sVG9McHRGNTBPbHlxYkkr?=
 =?utf-8?B?VzVsU0VjN1Bqakx0THgxMWUrUWpJbkl4YlVYa2tGNU9sZlBpbTlPelVXYmU3?=
 =?utf-8?B?VjZjRDJGaVlKTEp0eVFkTmNOTEtPak15R0lPVTBGMXdQNGhFVFZRb3lFZUh5?=
 =?utf-8?Q?WAs+yPLfACv+b?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFZSd0IvS1VBQVBHTmM3dFVHMHdCYkJsbm1xL3g4Tk11d1lRQm9VWEt0L3pI?=
 =?utf-8?B?NkcvMnFyMnZkOTFOeXB6am1hNUg2SFRtbW1TcHZBV20xTUNIWmN5U2hZNGIz?=
 =?utf-8?B?bjJNV2VvMFdGcVJkZUx0YUVuMlhON0JrMk5RcGhScE9hYkJkZmxJbTVQQ2ZI?=
 =?utf-8?B?UVJuSThYT1YwVHdpeTFBQWFPTE1wcHhLaFdMVGJpNC9PRDg5VXRKRDNGbHZ5?=
 =?utf-8?B?ZmhFLzlFNGVsZCtDeWR3V0FsZGdONVZlay8vQUN3R1FlV2NGejZDYnlqMHhU?=
 =?utf-8?B?TitRVW94c0dIZnM1QnBybTFocE5sRGp3NUZuN00zdmZ3YXNIR3lLV3dGVUpN?=
 =?utf-8?B?Q2F3eDIxU1pBc0RhRG9zQStCSTE1TE1IZWljeEtWQnNOcnRIKzAwbHZYTWd3?=
 =?utf-8?B?ZXZEV25SNGQ1cTVzdm8xRTV3eVpacUI5dmd2RkNPcmh1Y3Mra1FlZnlvc1JF?=
 =?utf-8?B?b3ZZQk1uZ29WUzU5dkUwUGhWYWZ1OENmWGxubUtsWVJndVQvbVpKakx6UFN0?=
 =?utf-8?B?TnJYN0JTcitwTU1pYkxmWmFNRFVZTWZDU2tYc2tURDZ5bTZqZDFnLzhCMmJG?=
 =?utf-8?B?TTM2SkRTVmNJd0dxZ1NYU0NPa1pzNFdRUHFhMWVmR3IxTm8xNnJWZmRIZnF2?=
 =?utf-8?B?SjE3L2JYQ3BUTDAzQ2pZbGxuVXNUM1dJNUZHT2ZkZlpnUnBJVWpGTys0bGxi?=
 =?utf-8?B?M3duUUkweGVycE12NDdIVVZOQUxmeHU2YWR6YzVBYkdIenIzKzlNS29pckVH?=
 =?utf-8?B?MWhyWkhhcGpUTVNXVlZZK3lRWW1YcXk5Ymk5SFloeDZrRjlFZGErK01FYWZ3?=
 =?utf-8?B?amYwaXBMZFZKaFdrVzNzVEdMUWsrQmNNMlM0eVBiSDRyOTRTQ2tNRlgwUjd0?=
 =?utf-8?B?eXJZR0JPUVpPRHFseUlFWnRDd1cvaWV1NFFNRmlkdUovUVdzT0d6dWhvSW1T?=
 =?utf-8?B?M0hKMUN3bGhzdFpZclZWL0RIa2xwNFVVL2dROXEzRmZyWmoxN0dLUHZEam0x?=
 =?utf-8?B?ZTR6UUs4aVZqR2kvWU1oN0ZmOUxZY0g4ZlFUSDkrVnZoMktuaVdTUEpJdXRS?=
 =?utf-8?B?Q2VZM0lPRmczamZidUh1R0REWnBld2lSSWc2aHdtY0VSaDJYQ2syYmFvMXQ4?=
 =?utf-8?B?OXFRbG1Uek94NUhhUnh6VU84S1F6RWZ5em9pOWFLblMxb0d4MFVNUVZlS1kz?=
 =?utf-8?B?Z3dibWpGY2Vud3hDSElKdjQ5YXMvU2todHF6SjZIUWFuTDM3TXowT0lGYXZj?=
 =?utf-8?B?NE1wYVhhS1l0a3lhb0FDRitUV21iS0hDUVJBbTBtblo5ZDYvTnpYWGE4YSti?=
 =?utf-8?B?dVZXSTFJSi9oc3NMQy80cXVPeW50a2RxQXNyNzVzOUNiQTJYSU03cDBhTDAx?=
 =?utf-8?B?RG9NYVdSbUswRTI5Qy9zWVpyeEpuSE9XM0YxcEZkYXd2RkxFeEZWTmI2dXJi?=
 =?utf-8?B?VFJlWTYwTE1LeTFlTlhJV3I1ODRLS0lnRWRJUjVxc1M3Y0JDeWpqai9NMHhy?=
 =?utf-8?B?M1hiam9PNFErMENEVU1ISFJ0VjVuRjF6UXEybmlmSUpySU1wQ2pUUGExVVFa?=
 =?utf-8?B?bFg3bXJOeDlta25MalRFR1pYYUliT0lWTSt6clFaMlZ6aDg2ZEtSc3MrMDBO?=
 =?utf-8?B?TFZpQWNGL2k5U2xITDd6eW1zVlFjaE81WHJUVDVtZXFWdGMvTWljT1Riek0v?=
 =?utf-8?B?UGhvcWtJSjJFazJCSWUxanJqMnNwekdOYi9PV1NLRlh2WHUrVUxFektUQzFM?=
 =?utf-8?B?bXJlbWtER1BVeWxCMnN2SmJaSjVGaUhubnM4OVFGSHpPQllHVzFBRXFmZWRG?=
 =?utf-8?B?ajlTLzkrd2J3RU9JbzhETWx0OC9uOGVRdmdtN3V6eXI2aW9Ec3VnOHl3SVZF?=
 =?utf-8?B?SHpsVmRrTE41elZieXZqOFB2ZGJ3cnluUnY3emNsa3hEc0RKTW14OEdJaDNi?=
 =?utf-8?B?THEwZ3pZVngvZjdWUHFMQkNuTjdFTklGN1UxZGxrZDF0Qmhsa2FQQk8rV21p?=
 =?utf-8?B?RjRGUUI0KzZBYk9IejhXQXJJQjBDSTc5cWJPb3pRbkF4Nys2SGRkZEJzQVRN?=
 =?utf-8?B?Y0R4Z21wTXAycWsyYk1jckt6VkJvRmZnbkY1REVlSExEMnJpN0hVWVRuY2dr?=
 =?utf-8?B?VjVNUFdKSm4wZURmSWY5UElmVXp1bUNFVWV5ZGg2NlFLbEpBU0xVbWpiQ1NQ?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e108e9-f3c5-41ad-4510-08dd71112067
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 11:34:13.0329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV8jydeCidKUcIAReCMW64K135bBrrbcmkYe+Ou1cC0yzWOq3SrYHc6palu6w8xnX2NrD+Idebt1XYosmD4/BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6363
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 11:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214022



On 31.3.2025 19.21, Ross Burton wrote:
> On 28 Mar 2025, at 15:01, Niko Mauno <niko.mauno@vaisala.com> wrote:
>> -RDEPENDS:${PN} += "dbus"
>> +RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_dbus}"
> 
> I suspect you can actually drop these lines in this patch instead of changing it to use the variable, as the binaries use libdbus then they will pull in the bus via that dependency anyway.
> 
> Ross

Thanks Ross, submitted v3 in which the RDEPENDS:${PN} lines are dropped altogether in the topmost commit.
-Niko

