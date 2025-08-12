Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517CCCA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 10:10:43 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.61])
 by mx.groups.io with SMTP id smtpd.web10.70928.1754993440710315960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 03:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=S1ft+0+F;
 spf=pass (domain: cherry.de, ip: 52.101.69.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvW2idVMF7IL8gi3masGkY54gSFv9qt+mopWZcfP3GJmOUcDQ//VCh40ZFHlL9RcIt58ROZ62X06e5Jtji6ulwpAArwIFFfHyI5u+wRWQm57NDFTF4qfW/wHOhJJCU95g+ZH4ufjLdARBGZfIlQWrw96bW0Qd9DKDB9Y5H1jv6z1Mlft/eC7pamnwW5l43bhihffqS3Zcs4h/vHDWU+2bQRQAlQXrrAnlkpQHNdUOEC5tQOVd4FIX86Nsz+uaVTEzTZN+B26M4AEZ10v5SswTD5Wr1NIzRiQ3/T82C1ePDJw/m11T4UyMzPAf7k3BpVXit9S2yOXnbpaw2eSZFb19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYivrujGyGb6VbQmgdCb4qqQMve0TPyrOdGbGD294YQ=;
 b=ssQKQen1bDie6CaHV1+P6mPGtCdOHKN9mDsqpeoY6Ftd2URpjdMpyWjJxQ4yFLRXLKYj2RU+xD0uEXmj5PJbqYadO9FJJMieJOMa2q3apk4Rp9mn6LBOFCcbCNkTcQ+o1C6qsZ4RC3qmvOmuu77qrrcUUE6Ii4XeQbVCfEktA8Rxgy0rGzRLkC9RW0P9hh/RedwGAbwlaFlwJv5xIeqXPG4Hn9oU/VKDREEyjb67c2/gSH07Bg35DHNkoSzdw0Ua66dEzDD2fi3RjeP7CINT8aRHxcA5WYuPCLXE6KcxPL6hZS6ae5yeHvY+yCwczh1RPeguYi7BVHSGuC0g2WNIow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYivrujGyGb6VbQmgdCb4qqQMve0TPyrOdGbGD294YQ=;
 b=S1ft+0+FOGnzii5IfDW1tZamaceHHyAB5BykYDtGuy8i4rMjpp9QAFFgL455723qNo1pPhVlqeoDs5k12V4BBSOZcWPYSSTKKgrd+GXei0JXVQ/Gw8m59yaKLLlhTptLuVwEbAzLpavux+qIFE4bZzZXqu0tERjHFD4WsE5zZOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA2PR04MB10424.eurprd04.prod.outlook.com (2603:10a6:102:419::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 10:10:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 10:10:36 +0000
Message-ID: <e2ff042d-a875-4c74-93a6-69b3c26ab6b2@cherry.de>
Date: Tue, 12 Aug 2025 12:10:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] arch-arm.inc: Only add -mcpu options if it
 exists
To: m.schwan@phytec.de, openembedded-core@lists.openembedded.org
References: <20250812-wip-arm64-crypto-v1-1-5c2cd9d8f1bb@phytec.de>
Content-Language: en-US
Cc: Yannic Moog <y.moog@phytec.de>
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250812-wip-arm64-crypto-v1-1-5c2cd9d8f1bb@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA2PR04MB10424:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc5c30b-f47a-44e0-7eee-08ddd9887b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VUlJMDlUYnY2M3kyalQ3cVFUeDB6Q3BmSjZyZW5IOTFuQmVvOWhlTVNaQkJM?=
 =?utf-8?B?OWloUUVyeHd1a1pkZlpDWUN4d20zNGhaVUttZndnOGQ0RnZBbGJkeVpjcmJn?=
 =?utf-8?B?NHNIbnN3UFVlU2FQcDk3L1c0MUR4bmZIS3QxK2tiWTloandSZm1HbUd3Ymdu?=
 =?utf-8?B?WG1sTGcxcmVDMHZvSFRkOTEzSE1iVmtSZ1VYODRFY1M3OXcyVTEvNWg1R1Iw?=
 =?utf-8?B?akhkRTR6YU9qRC9rY2NCWDJsTTI1MkxWS0FuUDE0S0hqekZBMVNpU0NOMnJh?=
 =?utf-8?B?TXFIbGVEUVc4eTl5d3FURTVLd2NjWlVDaWdDcUNKQ3pVYTkyeXF3T3AvdFNi?=
 =?utf-8?B?akVrcUdma25oU2VrR0hqT1ZoQnpWaTRmUXVqRDc3bXlkcTIwRWc4cThUUFF0?=
 =?utf-8?B?T0pkZ0lKTXZOU29tSjF0amF1ZXBiNSs5d3BFVUphQUw2N3ArTUNwWjhYSzhL?=
 =?utf-8?B?K1orR1JLNTVSM0xsQkM0aVRkTjdUdUsvY3FjZVkwQ0txMGttc2lDM1UxNEJZ?=
 =?utf-8?B?bXJaYUZqNVkxNWh1TEpXb3BJOVduMzU1aURuWHVyZy9ERGt6T05aY0ZuU05P?=
 =?utf-8?B?a0hHY0lpcm81Zm9DUHhYVU1acXFuemN4UENJU3dQbHo5QWdUL2d0akFzQ1dz?=
 =?utf-8?B?SjFLTVNIR3llKytoSjNQbXdDY3hKamRMMFN6N0FsYklVUEc2S2pabTQrOXVE?=
 =?utf-8?B?VTZpMDAyU0hrQUxYcEZaR2ZNY2xLU1RHb3pPdkRpeWxEazJ4QlM1QmtYTHpy?=
 =?utf-8?B?THI5R2cxd3RiWXFkSDZ3TUpMMU5zeThtMFh3bkhNcFplM3plM2tFUXJWY0hz?=
 =?utf-8?B?Sk9sMHh1U0VvM09kOFpSMzFIOHhFbi9GZ2tjZnp3UGRBVDlnSXMxMGE3Y25B?=
 =?utf-8?B?T28yZzh0eW5yS3kzbFVlR0NKWGcxTGEwbHo2THY0L0F0R0ZWVE4xdUVoV0g4?=
 =?utf-8?B?YkNMKzhCZ3hZQ0dMdkhMeFBrNWpXd2JyUDVUQzJjMkc0ZHBIYkUraWd4UHJj?=
 =?utf-8?B?Qy9LejNkVEtIb0pxd2JWRDAzT3Bqa2pKdmg2T21kYTAwV3FsOHc5emlQbnF1?=
 =?utf-8?B?RWQybldBOGdqNUxEQm5BaklsQjBOWmcvNlFvZlhoRDF2dGh4K3piTElNL3Vq?=
 =?utf-8?B?WFU3VnNWTVZNd1pYcWpMMVVYMHdNc1JsZzBLc1psMDNVT0xxNFlpREdwRHRl?=
 =?utf-8?B?RXhzYjVnWU5VajUwMWtRR1FTaGZsaWpua242ZnM0Z0VwVHNqNk4rdDZ2TnJx?=
 =?utf-8?B?SFZudSt4R2UweWYrYjNDaCtVbGdVWlZkUDJ3K3hqdVh1MFRRdC9Lbnd6eXZC?=
 =?utf-8?B?YUVkQzBDYmdMbkxwaFNpK05xUVo0Ry9GMGJOdmVneVUrVnh6dS9CdFJ1SERX?=
 =?utf-8?B?S1RWcitPT3VvbmJGN0F6UVEyWlRjbzE1eVJSRVNJbWNsV1RUK2RDOHpNOVpT?=
 =?utf-8?B?a1loS1BjWituSy9TQU5Md0pZYUVIS1VvanZTK24vZXpjTGZRTzZpNXltbEo1?=
 =?utf-8?B?RGFEa0VFQnY0eG81bFBDMk12MHBQLzUwV3YvZm1LN2QrMGJ2Mi9LNlpKS3lT?=
 =?utf-8?B?MDFERXBKWTVNQ2VLNVJWaVpDZ1pvUDYyZ0F0cytQQzBaZUkweEVDQmpaZGZa?=
 =?utf-8?B?d3RjVHRmUTlWT3o5Qk9LK0p0dmdqcDhmN3N3SkhVaUhUNlBkQzVON3lmc3Vz?=
 =?utf-8?B?OVVkcElOdExHNXd1eFlqQUpUTTVpRFBiOG1jckFMZFE0QVY2RkN1alBYRTJW?=
 =?utf-8?B?Q1ZsREJLSk9EcXlXN3ZhbWhCYkFhdlBCUE1SMDVHbGY4enNoSXBVVlFBYkda?=
 =?utf-8?Q?m8Kuu5isnbOrapV/nIn+bG6pTAqsHPl/Fl1IY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y1dsMXR6bk5jUnlCVWxuaW5MYjdKaGI2dGhZQ1BrYmVhazUzNXlXcVY1YnNP?=
 =?utf-8?B?d2hnWUkrTXZYWERUWEhrRGcrVWRtc3dqdmt0STlXL05UeHNSUnlOME1hVmR3?=
 =?utf-8?B?WU4vcUtNZk5rV201MGhGb2lKL3cyWlFKbnF6aFQ5dkFQK2xwbGtKbmRRYzY4?=
 =?utf-8?B?N29xdVFpaDd3eWRhb2txRDNPUmtKUmpjcXFHTkJBeFZTd2MwRTdsMGRkbUVO?=
 =?utf-8?B?ZmYxRXN6MkRyMzlLelNwODE3cU01b04vZWNaUnRLSDhsNEdEYmtwQTQrWnp0?=
 =?utf-8?B?anEwS3JhaDZXZTFUTDlLRnJvejF6L0dkQWwzaHBhQXh0dkU5OWdYK0syR1Rl?=
 =?utf-8?B?RGpnREovSjU1VGdaRStEbE80eVllZERoSzBwU2hLalFDQkVZOW4vUHdLVW45?=
 =?utf-8?B?UktGa3kvbndxalRZaTdnQk1HRzZwQ0Zkek5PTXJVYzI0RWNIR3lYL1Exc1ZY?=
 =?utf-8?B?R2tpQ3QvaTdTSk9aU2tpdEVEOWtyVDNSWGRqcjZMUy9pdDF2RHpzdVFCTjIv?=
 =?utf-8?B?T2FxVHVnQ1B3OUZORTRXdjNSRWlNaHFqRnFLY1hBQjJ4c2hRR3htZE9ZSDZp?=
 =?utf-8?B?ZnAyZlFRWHEzejhhRHhxWkdOWFJWdHNQUU00TVFSa1dJWE10VUdMeS9nT1Ev?=
 =?utf-8?B?R2JtSzNpUzNYSVBzVDVXOTR2QVFqVDFMKzBDRlNvTFFwQzlwNFYwNmNkNnJ2?=
 =?utf-8?B?TDNGWHlvKzhleVVLV2xIeGZvU0tuaWN4RStobWNPaFdRYW9vTElSY0dxVEI1?=
 =?utf-8?B?NjhMYWhBMGZsYVFwemZxK2VIRWozcTFKY3dDemlxZVVCRjA4VGhDNTJWRWND?=
 =?utf-8?B?TlpDelA5b0xXcmJia2hPRi8zRi9Lb0d3QzJHOFBnVTFVK1IrdUlKb3QzYW5S?=
 =?utf-8?B?TTVZVFVVWWZVVkJuUjFRd2lTNTIrTThvREcyYlhtQitsRkhQM2pZQkpaYzBw?=
 =?utf-8?B?YWRsWGEzallpdmF2c2crODdzd3YxYUpqa2xPS1UwUG55bjFpaWlveWxCRkxY?=
 =?utf-8?B?QWNVeWlzQXRHc1lBNkRFNXh1ZDNVQkJFYldWdjl4MDUyOEZFcE96U3FKUVVw?=
 =?utf-8?B?MXhZY1hMMGZMV1kwQXhSRkJmdERVekxvU0tKMjB2SDU2cTFrdC9sRHY3TjE4?=
 =?utf-8?B?cGZ6bXBBZjUyTUNYaGpFOXJUem5SZjAxSmRMajNjajVKdWxDc2QwcFNFM3Fw?=
 =?utf-8?B?RWdoTk1FbVF0SHhkTW1ZR2JMMXRSdzUvNERjczNDTlhjTFE3VTNVRlRJTlN4?=
 =?utf-8?B?eVpUcGZtR1dPekpSaUVHcjB4b1NBWEdLVWJjTUFBMGZoZW4vRVN1c3VxWmE3?=
 =?utf-8?B?SGRhZjVUVHoydGtZV0NJb3ZUUmZzS21EZlJ1V3JGM0lCU2hRK21Wd1pxWDIx?=
 =?utf-8?B?UXBlaC81MkpRL3ZTUDByRDBjaEpyRTN2dURwQUZSVTREWDVIQ0xrS3JpV3No?=
 =?utf-8?B?VmtJZGlnKzJMRDdBa2d2T1NjcVRoVnhRUjBnS3VtRkM5dmR5RUliS2EyUU4y?=
 =?utf-8?B?N20xWXhjdVpWR3JjcEpXSWE2SldiSFR3R0NsbkwxbzFHc2Yrc2Vtb2VFcUpM?=
 =?utf-8?B?UHpYNU5GUUREVFBndW9ENkVBc3JFdC92ZmFhMFJQKzc2V1JIQkhkYnlGdlNm?=
 =?utf-8?B?WktRbXQ2WE0zU0RNenhXM0ltWERSY01JMnlCRE1zYkN0bmJKVllQemlUbGVP?=
 =?utf-8?B?RVpNaGlEMEV2QzB2My80WXlla3ZWaGJXeFczazl6cXMvNDFkT0piY2VKYVJD?=
 =?utf-8?B?Y2JCMHViVG93TTJlRTNRMnE5SXpOVGd4aGdZSDdESG5sVmt2TXJnS3VsSWpL?=
 =?utf-8?B?VmYxdGVJT2NtNDdoVVQ2S1ByZ00zSlZ5VTJSY3l0ckQzOHNrOEZONENuWmZt?=
 =?utf-8?B?MUk1dDdrdGxzdDU2a3c5RS9vM3k3YkJEU1grRXJKcXhCVU96OU42bXRxaExx?=
 =?utf-8?B?SUluNXFJeExFZTJzTysyVEs5dlN2bkZXUk9ZWWpONXZybFpGYmxWQ3huWEoz?=
 =?utf-8?B?SGQyTTJoRG45LzFCc2xVUTQxZjJLSEQxd2gzOWxycVNLMHJqRUlpS1g4cGhV?=
 =?utf-8?B?cWcxbFFvZHd3QnpIcmVrSEt3Vi93NGNGOCtMMkpaWFgvSERQWE83QnJpQjJI?=
 =?utf-8?B?dThIZC8zV3pUQ0RUMCsvUFY5QTByYWRlSmxhd280MnBzNnQxTE1WK0xpcFpz?=
 =?utf-8?B?dDVUdzdDRndPM0RidnZVT0xIY01WQ241QW5PWGFsUnhoMlI3RXRETi9RTExD?=
 =?utf-8?B?R002QUFiaE5iMHFibXF3b2UvRXZBPT0=?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc5c30b-f47a-44e0-7eee-08ddd9887b32
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 10:10:36.3692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPhvzLJNjp7fFdOOfyMUIMAWuJBxmZOp8eGNE3S07bAZXx4+gSU44kf0xe22YrdyMejGDNkzsb2FKmjpSTdh/fg28V7yVOh5bbR+5DJnAhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10424
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 10:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221762

Hi Martin, Yannic,

Thanks for the patch and the test but...

On 8/12/25 11:51 AM, Martin Schwan via lists.openembedded.org wrote:
> [You don't often get email from m.schwan=phytec.de@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Only add feature modifiers to the -mcpu and/or -march option, if
> -mcpu/-march is actually specified. For some very basic tunes, like
> "aarch64" without any ARM version, the -mcpu option is omitted and thus
> no feature modifiers should be added.
> 
> Fixes: 754345d6063c ("feature-arm-crypto: Add +nocrypto to -mcpu when crypto not in features")
> 

...this has already been sent and rejected, see 
https://lore.kernel.org/openembedded-core/20250805171619.1357193-1-raj.khem@gmail.com/

Please see the v2 here instead: 
https://lore.kernel.org/openembedded-core/20250806050838.3311037-1-raj.khem@gmail.com/T/#u

Could you please test and review that patch instead? Thanks!

Cheers,
Quentin

