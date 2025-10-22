Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549B6CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 15:22:26 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.30])
 by mx.groups.io with SMTP id smtpd.web11.12347.1761146536015386147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 08:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ExP/2oZw;
 spf=pass (domain: cherry.de, ip: 52.101.66.30, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwvqUeXaMclErpNjnjr/qONyzyMISchLEGDHm0CC3en7lkuwQ6xikqxvm2VaBb2Ci/IzguucGoBl+f3Lr5haKEaAbDrypu7oolyADgGLKvQjUu9UVGfVlNUehERcrsXFcLYMnn3gpYtANVBIYdWjk2zHPVcDfJCgydz7QB3RzpYSWB1cG/H7LeocZcGoz0ZLBJLXnGk7H5+ay44Po6jP7GuU8m++t7e5gQt7/XIhxsxzg3n0r+KdDmLjO7QRVyQ+WcRvFW4jr5EeEtx8K75blQ57DRMX168gurq14vt90yQODp4cPn9ogyBodTHPgS47ABQBpAFxeRE7P+rEax1/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccsXlw107jpU30DRMwfPyka7VnolSftM/5ZIUyYp9WE=;
 b=nnLbIJWBmSPoPWo05dbAAyeRqsO9lsk8uAtlxONaGyyPu2ZK+4FLYQqbgLc00PaLzraD8e0aa8P1lftMZ5P90zbHGTtvBSDZ0foZQc46yrAfKzhxRZsUqmoZB7q3EaMdB+e7MV7q0IWCqUCo/ip2OG6WoUIs9nvGhWwx7lFGTMUsX7lprRS87sNzDIRWOfn7kWUdfUafW45pyHjS31JzfFlGGyv8Chd68JPV9RszC4156Lf0N6xNbpv0CTg2OqMddmB8kHJy/AKBerK/AQ5/TYVRwjkrhoWx2DGAKBuIqkmd8OEOobFWoZp9TOFGCLzkESXmhDCbXtZbpjG4VxWEng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccsXlw107jpU30DRMwfPyka7VnolSftM/5ZIUyYp9WE=;
 b=ExP/2oZwkGEl8NdswY4xxyL4YRFE82JE5pBWsvE+fZQ0JqLQ9Ja10Cs8quKEy6+GdYsKyY1zA4ikTHRed2VCzPQX7VHWjrLLynY1X3Hj0YEsoVCphZnpdwyfvCOcCJ+l9D7ve/rcFn6XAPCwS26cWyd9iXDtzrMJJFW5p1fy/e8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9253.eurprd04.prod.outlook.com (2603:10a6:102:2bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 15:22:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 15:22:12 +0000
Message-ID: <98fb3807-f779-438b-87fa-04bf706c28cf@cherry.de>
Date: Wed, 22 Oct 2025 17:22:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] layer.conf: add a bb_min_version statement
 to perform an early bitbake version check
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>
References: <20251022113212.3220395-1-alex.kanavin@gmail.com>
 <a39c0819-945f-43a7-8b25-8fc5d00d8230@cherry.de>
 <CANNYZj9-37415LXhP7jnNSqOynuxZVtoEo5rdQOEg-_0rirQpg@mail.gmail.com>
 <a082d3c9-ca41-4195-9020-aa722fd9bb17@cherry.de>
 <CANNYZj9syemH4k8NVko4uBnEuH56D9KQntjoinNYRuLRph6uog@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj9syemH4k8NVko4uBnEuH56D9KQntjoinNYRuLRph6uog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9253:EE_
X-MS-Office365-Filtering-Correlation-Id: 844d55df-891a-4707-aebf-08de117ec60c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VUZiYi8zK1h2THAyU1hpZzQ1VnF2WDc3ZjlsY2pRc2lCNG5qUXVVRlJLL0V6?=
 =?utf-8?B?RUllT0NQYjFnU2YrYUN4T1FDWFVlNkU1emZ4bmMzalF2YU9GbGlHcFQ2UWxw?=
 =?utf-8?B?MVVrMC9qN09Ud2pzeXMrYlhzYXZqb0ozSTNZMXNnRDBGZlV1MVFhbFhEZFFS?=
 =?utf-8?B?SEZnbDhPcnVhbG05RlpLWXZ2Y2I3Nnl1RkZzeGM1WmVsNzdTY0xYUUlZMElw?=
 =?utf-8?B?dFdwYUhUNkpOMHJjRnZFYmFxemtXYXlHRDV3b1N1c0hXOXdidGNoRG03a3Rl?=
 =?utf-8?B?dzd0R01GYk9kT294SEJDeXY0dVY5UlpyYU9JcDZxTG9ZUTdPd08wR2g3NlhR?=
 =?utf-8?B?VHFrSXY0VjlzQlRyRDBUTlZIcExmSkFSaytINm1vUnBjaXEveUtFZHUzN1By?=
 =?utf-8?B?blUyOVlUeHV5UnZiSmVOR2RraDZSRkpUamhOM2dSTmFuMXpZSFZIbVErQnM2?=
 =?utf-8?B?d0RiVHdGVFV5QWNqNW5xWlIyZEtpZ29iZUNoWlh5cXZ0MldFUVBNM09zbk5R?=
 =?utf-8?B?NlR1Y2t1YWptSUtCYVVKb21hcytZU0hjcmNVOHRRdk4xc29yY2pyZXJCcXhH?=
 =?utf-8?B?QktvSHI4VWJzMlJtellaWURVaFkrZ3ZXMjFZTWpiQnFPdEVrem9rY2hkTE5L?=
 =?utf-8?B?clFRdGQwcHZqcmcxaTQ2MHVjT2Q3Vkc0Y3VqTUVWL2RUUTZ0d1U3dFo0enBa?=
 =?utf-8?B?bElrNDVJTFgxclJPWHFDRVBVOFhseGEzRVZBd3B1cUhNWnlVQjBmNzFoRUlw?=
 =?utf-8?B?ek91NzlUNnpDc01HZ3lPS2R6ZmZjZCs4UHZaWkg3NW5zT3l3ZlhlbmE5Qzhs?=
 =?utf-8?B?ckNMcnZVcUtyN1hKNGs0SjBHblpoNzJ4UjU1aEdhNXRJMWgrOE5uQk5VLzB2?=
 =?utf-8?B?MlpzbURpTnJMbEt5QzVYcnZQZzlWWWd6bE9MM1lScE5XaFpQQUFGcEM5MmU5?=
 =?utf-8?B?aFNwTzdGVjJhZnVUMTZBQkVLZVNKTW52c2Z1N3h4UkZ5SWUzR2hqRTk3SnBi?=
 =?utf-8?B?YjdKbFBKaWVFeWt2K0xVWUZkVDB4UVM2dTVTUG0zMW1YckRrbUZLRGdpQ2d6?=
 =?utf-8?B?dVJENEVSc25hWC9JMWpVUkZ4QXhwMWFXeGZKb2FVOVhtM2orOVpydzNWbkV0?=
 =?utf-8?B?RVFlMjBoazk5NmlZQnluYU5hdzBuVktYM3NWQitaZE5TS2sxOTJOY0YvcXBa?=
 =?utf-8?B?eTc4RzdBbFd6aFZaOUFhQWswU0Z6TG56bWJ2MzRwc1hUUkFiYnlkSlJPTW5R?=
 =?utf-8?B?TUNJYW8ycTEzUCtBdTJZbUNTc3BJTVhvZEpnWXVGVTJCNTRRRDJHbXBHdkwx?=
 =?utf-8?B?QnAwd1ZkM3hML3U1bjBYOENxRlZPUVFQb3Y3OUkvdkFqV2F0dWxWOE5GejhK?=
 =?utf-8?B?b2s1Q1htbGw1LzlEWTRJTDZZM09EM1lteWVTN0QzbXJZTnR2dkFtTUxiMWxH?=
 =?utf-8?B?akJhdUtpUVBkRXkzcVQvWVM0cmQ4NVM5YnhMZEEvZWFGYkFEMHpLZ0NHWncw?=
 =?utf-8?B?WHdJT3R5U21MamhYL3BjMGdBNkhDelBhNVIyK0hvcEluTlZ1M2h6MmkwMDd6?=
 =?utf-8?B?bzc3aDc0RTE1dnI1Z0VPemx6WitpR1U1ZXpZaWlNN2RvbGx4cjh6dkkvdUIv?=
 =?utf-8?B?eVFRV0N3UWppeFF1ZWJiMmpIZUtqOFk1UENYT3M3cUk3eFZ4MkcxS2g1V1B6?=
 =?utf-8?B?UlRXZWYyN01QNWhSLyt3aEtocTM5U1FEalp6eUV4clkrWWNvOE1RdHdDWVF3?=
 =?utf-8?B?dE5OTGVVQ2s1a1pmZTFxcm9aaTRydmo0OEwzOTc2WFQwcGpZR0RmdXFaaGRJ?=
 =?utf-8?B?azBkWnRCSmZLV3loS0RHcXpuN1d0d1lucFpjZUJPSzRidllSamZEVXZGZ2l0?=
 =?utf-8?B?RTcwam9FRXRyZnB0QXZaNWFqVmErN3BIWERkOHpvWHpqbG55M2p3aGhVWnFY?=
 =?utf-8?Q?vxl7o53nyLQmrl9e0yEiQfg/sm7z77n0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmdSUGx1bFVDUHNQQ1NucC95aG4wYTNYR1JaNFZCL3ovemM3aGY3NHIrMmFt?=
 =?utf-8?B?azlXbm9iZEIzZ1dCQzdBeTl6b3hsVkxrSWdlTXcrZmJDcVlIWlJYdm5WclZU?=
 =?utf-8?B?LzlnR2I0eFN6RnJGdkQ0cVRQQmM2VktVVnMyZGFKZUd0TnpEUW5CeWxuYmtq?=
 =?utf-8?B?OWlzVjEzQU5uSVV6WEkxbk9HSGpzMWx1T1lwczhxSlY1ZzZKbFBpYW4wUmJl?=
 =?utf-8?B?Z0ZNK05aQkVKaHdnSkZXbEx5SEY0Qk16S3J0N1Ztb2NWUGVOYXJBTUxLVkpo?=
 =?utf-8?B?QWdHMVFNVUo2QzdRaTdxR1Y1aTZyd2tFRTZCKzRJVEluUFQ1UkpvRHVvMEpT?=
 =?utf-8?B?MERLMDRqT1NnRmJMTXhuUmM3ajJwbzI4OW9hcXFIdjIrQkVIeXRZSWM4RFdI?=
 =?utf-8?B?akwwekdEcGdaanphQkxoVmxlSXNCdzNHU0ZTWVNoeGY1d2NTMkdtN3FjOUJi?=
 =?utf-8?B?d3ZhWGZsc3dYeWs1NUNCTHJKR1VnZE54UEdGcHRLZUY3Y0Fhb1VuNlk1ZW85?=
 =?utf-8?B?NnA3TWZyM2NKTG1VWXIrcEkyZWRSb2NKMDhsdmRTd0tKZlFmdUJ2aTVZU3Rq?=
 =?utf-8?B?MWpnT2ZxTFZLMldleEpEOE5uWEQ1OGNEclpnd2tRUzk4eHVrMS9OeVVlaHhq?=
 =?utf-8?B?WURBZ1hyMFYzenMzdjFIQng2U0MyYk9veUR4ZWlPL20wTlg4dTA2eVBheTBC?=
 =?utf-8?B?TC92d0kvNEdLRXdzRW9HbHA1d0I0cXlERFpTY3VaR1ZSMnJIVG5tS1hmVmRR?=
 =?utf-8?B?emw2WXJSMklGR0NUQkw5M0hKcFdiZi8zNFhncDVqdFQ3ME1ieVRGb0YrRVpK?=
 =?utf-8?B?T3ZkRkZoSlJFMkgwUVQ3YTZyT2xnVFR2YnlCMTdwbmxMWWxjUjd5YzNwM1dI?=
 =?utf-8?B?MkRhQ0JHTWJpQWY5OXp1cFBqRTFKYUdIZ2hzUm04Vk1kUW95TFp6NlRCUmJL?=
 =?utf-8?B?eER6T25Od0k0T1YxY2ltMzBEQ1k4TnQ3UGk2TjY0WEhEZXk3SFBjOXEzcjQx?=
 =?utf-8?B?dW5GL2FoWVF1ckFwbGhvNDlUVVhJZWQ5clVQbkdJUENpS0ZsSWZkemZmZXl5?=
 =?utf-8?B?UVlSZU9wM1VMS3FMZUp0L0NXeDVyRFltQ2EvZlJIVWVPMXkxenEzNWdrT3dz?=
 =?utf-8?B?MEFDSUFkdGkwREc3NnI1alNEanFkUHhqRy9jaUhGcmEyTWhySVZBck9uT2hF?=
 =?utf-8?B?cGxMTkRiaWRyZDY0eDVEanUzTytEdHppSFpUM1ZDcWhaSTFUQTdxY2xZQVp3?=
 =?utf-8?B?eHF4a0lwaFNZVXVkK0xITXJCdzBMamIwQW03Z3pLQThHVkdUMjNheUlnMmF2?=
 =?utf-8?B?NlBDejR2d3ZJZE5mTGRTY2lYTVlaQlFCYkhCa1M0MVFaK0VHc3hpa2J1dERi?=
 =?utf-8?B?UWY5K1h5NU5XdWFvV3d2Z0lCa0RGbVBMc0ZnVE9uMURabkczVnlERndycG96?=
 =?utf-8?B?d1k3bDJWM2tOYVF4T1JQQ0JrL0poamFQRzZDT1FaaEZIS1pVZlZrT0ZIQWs4?=
 =?utf-8?B?QkNzd1M0ZWR4cFdxYUxzZzhXc2R5UTZWdEt6RXBacHlNcW5La2hSL1F1L2Jn?=
 =?utf-8?B?WXdKWkorODA1Ym5hUlJtM3N6ZTQzRitjWUljTldLMjE5RThrRUpHZjdoZy9n?=
 =?utf-8?B?WUFNZzliUGtlUGczSStBeVhYL3ljbFFwSWVpSHROUUFUSnBkTkRoUjM2ck5x?=
 =?utf-8?B?dVMwZGJRTzV4aFFjelZvVnIvdXZ1QnlSMGVSejFiS0hEa2o4cHpXNmJXcGtE?=
 =?utf-8?B?USt0UGlsQ3ZBc09QcU96UG5UVHUwbUVVeElSanZhcEdyek94ei9WVmtTVXpq?=
 =?utf-8?B?ZnhzYnlzWVNsUFVwWnpFZTAyZG1abkNveFBjaU84Z0I2bDZPQXNHRTcyNUd0?=
 =?utf-8?B?U01XK1F0WTlQNisxR1A3UTYzT3RKTHNCOW4ydDNJc2NxTEczYVd1VjdzZlNQ?=
 =?utf-8?B?UzZ0Y0JYUlNBVWlpQWcwMms5YTMya2VXQnNUZGt2dmdjUWxhVXEvTlJZWE1o?=
 =?utf-8?B?QjFIVmE0UjZnc01sZk0rTXlCSklBZHdlWlViMUE1N3FSM1UxMmIvNGkrZ0pE?=
 =?utf-8?B?RDBCNXVSUTdtcXE3NE9OOUJPcFBoTW9DaE9Id1FaTGc4eTBRVzdKbTVxN3VS?=
 =?utf-8?B?NzhDbXpnamtYM0lyM1I4NUQxb1dtSzNwRWRXTFppOTBrQXRtL3RHSnlkOStE?=
 =?utf-8?B?NkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 844d55df-891a-4707-aebf-08de117ec60c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 15:22:12.0817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTgSyIQEeKI62IZpLdmSp6SYwENDbivCgBYhyUVcjixtBimqZPjg5n0a/RTnlUi9fZ5CPBl9AHv1bcmuuDeoVFIHajfYWccszuJZf9EB/vU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9253
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 15:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225201

On 10/22/25 5:06 PM, Alexander Kanavin wrote:
> On Wed, 22 Oct 2025 at 16:55, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>> $ bitbake -e mesa-native
>> ERROR: Unable to parse
>> /home/qschulz/work/upstream/yocto/bitbake/lib/bb/parse/parse_py/ConfHandler.py
>> Traceback (most recent call last):
>>     File
>> "/home/qschulz/work/upstream/yocto/bitbake/lib/bb/parse/parse_py/ConfHandler.py",
>> line 108, in check_bb_version
>>       raise ParseError('Bitbake version %s is required and version %s is
>> used\n' % (min_version, bb.__version__), fn, lineno)
>> bb.parse.ParseError: ParseError at
>> /home/qschulz/work/upstream/yocto/openembedded-core/meta/conf/layer.conf:2:
>> Bitbake version $BB_MIN_VERSION is required and version 2.15.2 is used
>>
>> But this was to be expected since in the BB patch it's simply a regexp
>> where we extract whatever's after "bitbake_min_version " with re.match()
>> which means only a string.
> 
> You need to declare it thusly:
> BB_MIN_VERSION = "2.15.2"
> bb_min_version ${BB_MIN_VERSION}
> 
> and then run the regexp match (which should be '${BB_MIN_VERSION}')
> through data.expand() inside eval() in ast.py. It's supposed to work,
> but for me it did not.
> 

I confirm, same here. (Spent the last few hours reviewing shell code so 
forgot how to use variables properly in BitBake, thanks for the reminder!)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 54fa04e213..d6dbad040c 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -1,3 +1,6 @@
+BB_MIN_VERSION = "2.15.2"
+bitbake_min_version ${BB_MIN_VERSION}
+
  # We have a conf and classes directory, add to BBPATH
  BBPATH .= ":${LAYERDIR}"
  # We have recipes-* directories, add to BBFILES


Looking into the BB RFC patch, I'm wondering if we don't need to 
explicitly expand the string passed to bb_min_version? I see that the 
IncludeNode class does it during its eval() method.

I have no clue if this is proper but

diff --git a/lib/bb/parse/ast.py b/lib/bb/parse/ast.py
index 20c6f51a8..9f6874b06 100644
--- a/lib/bb/parse/ast.py
+++ b/lib/bb/parse/ast.py
@@ -418,6 +418,7 @@ class BbMinVersionNode(AstNode):
          self.bb_min_version = bb_min_version

      def eval(self, data):
+        self.bb_min_version = data.expand(self.bb_min_version)
          bb.parse.ConfHandler.check_bb_version(self.filename, 
self.lineno, self.bb_min_version)

  def handleInclude(statements, filename, lineno, m, force):

Made it work (both with ${BB_MIN_VERSION} and the 2.15.2 string).

Quentin

