Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25723C021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 12:22:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.128])
 by mx.groups.io with SMTP id smtpd.web11.14460.1739362915150285856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 04:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=D3saDj1x;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.128, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icHYGKEt1pepp9FJ9hDOLubyYhrqr+3T5i05Ue8uLRXuBcUJyG4c84ld0nPXXpN0ha5lVltSoWXbFX+8nlk8hMSVOgabf2w/gv/95YobS472D8Q0xplEy2036ff/SYCukSCIJp1QA/ZVSbEkxd101pIb2d4oY1fqMdN66vI/4rFvQPu9yUMU17yPvtp/1jdp3jrQPdBcLwfafb+iA/s/AZSnovQHKki+if5LjIru2uGt7B7U804hN9Gfum1669pVvAWliQbqg9vaNoZWvXA1PhzisVPP1hSFLdobYz609B6143umm1fx5SF02n/YnqdAEytjzH1Et1n04t2mdDUtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnc5MB56GcWFEJ1qMu9hkf99u0XcEFAyN72SOKb/W1M=;
 b=XOMoFZhsxdgOo1ip1V1/pvjgpFvg67t1N+JbAOvby5FVmCBq1WYiRJv9UgqyJK4j2Ll87cBQxIC/cKAeZqhPv/yPjAHtnBq00iRneZa7rmsZDcb4i15AjAdw3ZgVL0LCbAScOh5THGMiS/C3oMxnwMUqvQrfcn8TeZvYyuvA7zA4Yceqahd+7WUf7X1k1TBPC/fxG1MnxMNUri2fEXLApzU6xmrJXsznH6Ytc42N6Bdg9OR81T+3lvlZDvXReL30uLVz7IqUeW4xF+9Q6eu3t1PIvuhLXk8JL+RJ2kLCJlTWghZu8PTngvefELXdJ0JyO3CR4ptuXJgO7zo1P+yKEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnc5MB56GcWFEJ1qMu9hkf99u0XcEFAyN72SOKb/W1M=;
 b=D3saDj1xGDOtYlPVUF89bfUNu/PmQ4LLsY6paVWSXP/y1frQOU32wYeFs/EyPQmOs+1vNNDEQIyPloZY+Fn2yJhqna8lnLdVOxEg1Cupi+WXlW1bLBnQElwKent7q4+sJ3/LsLJi46nJSd7Y/vFZDoCARck5taB0+8rYO/jFSkK148wC8Nj9e/6Yr0OyExj2r6UW9XKd/AHmXjt0lfjU8StnQo+E8/0aP7Kbci1sLexegb8dWXgoZRHJUp2bZ/PgbjHQdrhZ021aORqA8YuBcv95dnPGfMnwrNpR8yt1s0SDYrroAs1R7N0jhF8WacPUsVIqJXfrv72sNouLHyA/Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by GV1PR08MB10522.eurprd08.prod.outlook.com (2603:10a6:150:16b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 12 Feb
 2025 12:21:53 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 12:21:53 +0000
Content-Type: multipart/alternative;
 boundary="------------AWXf0f1SiGTgga0BS0lPUuSF"
Message-ID: <0e188d91-b65e-4f14-bcfc-098d5475c2ce@weidmueller.com>
Date: Wed, 12 Feb 2025 13:21:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 05/30] lib: oe: add vendor module
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-6-stefan.herbrechtsmeier-oss@weidmueller.com>
 <0e8a6ac372068e4f9eb73b2170a50cef5e7d8232.camel@linuxfoundation.org>
 <db370fd9-a390-46c2-bf5b-250110bb0c96@weidmueller.com>
 <ea2233e4e8854e59bf2221ead2cb9bab33a6a969.camel@linuxfoundation.org>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <ea2233e4e8854e59bf2221ead2cb9bab33a6a969.camel@linuxfoundation.org>
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|GV1PR08MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3ff1e5-404b-4ba8-a49c-08dd4b5fd53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bU9IRnkvbi82T3V6WnI3YU1NQVJtM2lQdmVsSGc1cUt3bGpvUHozY2NYRDZU?=
 =?utf-8?B?SHRQM2tiT0V1cnI5eVRiWUlQOVM3Vys3RXJUVUZmY04rcVdPUHRPNGYzMEs3?=
 =?utf-8?B?QUplL2xDUlNiK1YwbFRsaG1vZm5FdE83WFFOLyszYWpjYXRpSEZ0VllFNnBP?=
 =?utf-8?B?dGRlWVRaQXF3amVoVzZ0V1FEWEQwbVZBcmpjeXlyaERGTTdqWFdNZnVrMTBU?=
 =?utf-8?B?TDVBSzFNOG0waDFTd3ExaklpN2ppaDVJbnhDSXdnaW9BbjhNYzc5OUcvTy9m?=
 =?utf-8?B?dEdBU1dKUVZNd1hNNFJ4c3pYSlRyVXpldzFEMXlKdjJHcGcyYUU5U1plbm9j?=
 =?utf-8?B?SzBjOERwUHI0bGhXMHk1ZmJRaTBSbmo4RFVGaFVBNzNsNjlsZ3FKRktORW1s?=
 =?utf-8?B?YzlnVTVnaW9qdWdKOUFUWUFpUnhzNC9mbzNpVUVwUWRjeVlESWJxc2hjdHp3?=
 =?utf-8?B?ellabysvVnhXbW84NHZOV2dpRVNXUHEwRFNuQnZSTkxhbERwOUVPV1FBT0tS?=
 =?utf-8?B?RGpsZkYzRnI1Z1pKZk1qd3JIa1lvbDY0RzRHZE8wV08weXZjQzVsa0VTTDZ6?=
 =?utf-8?B?T2VzdnpVNlpyU09OVzNwSzNuWXdxakhGNC9abGZrU1JsNWxlSUpTZzZpcDI2?=
 =?utf-8?B?NDV5KzZPS3ExazlUbkpCYlBVYVdkMWxCZ280VHdwNDkwNkZkcGVIWTIvRGM2?=
 =?utf-8?B?eE5sUmdtbGQ0bUJiVDN6b3NmMzIzSFdpdmd0K1YyeWtSdHhSR2NGRktzQVdM?=
 =?utf-8?B?amF5d0tUNmkzOXpsb0dIV1Q4U0NWTXU3RC9IRU9jVThscllsMjk1YzBZd1Zh?=
 =?utf-8?B?TXBZRzRMZjFhaTYzaDd0VFg3TFVuWXBKRXNHRnU3MktPWVhEbFJMRFYrZUNj?=
 =?utf-8?B?aTdQZm5CbVZsOHZXczNCRUJBcW14L0t4R05XaFk1WXpTMWFYNFpqdWFWdzhh?=
 =?utf-8?B?amQ3WlMzMFdvbHVXVy9KOEo2YnkzbkpTSjM1V1FMaG9QTnIzMXhMaGVzK0pR?=
 =?utf-8?B?NkdQckw2VW5TWjdxQ1FBcWVpRitCalRuZ3plSElhd2VDaTdLenYxWXJUa2ti?=
 =?utf-8?B?eUxsOHpkMW9maUw2RXJLeW9FeElMOHFZNElId2xCY0JOM2ZwMWk0ZXpPclFW?=
 =?utf-8?B?b2VRMUpmVXpZMlFLcm0rbHpaQU9PdWY1OFBoVURZZFZxak50bERRN0dsaGJs?=
 =?utf-8?B?aXpUUitKTW1kSWdZOGxya21CeVRxZlZqdnBqSXE3Y2YvbHZ3V1V5Q0NYNmpy?=
 =?utf-8?B?Q01oRTA5SGN2TXZvazdPdENmZXo2WnljU242YW80THF5OXlqaWtWKzJpZFNL?=
 =?utf-8?B?Q2V4VThiUkJ4dUgxNDZUTnZ1THY2OEFvcStEMzZ5NTRveFBWbHBEdTdsbGdJ?=
 =?utf-8?B?SXJQU3RSTFU0MVlxV3djN2doMnNvQ3dUSVBtaXJJMDl2UUtxbGoyZk4rR2k4?=
 =?utf-8?B?Yy9xY2FFQUhlZ0daL051bzBHaXFLTkJwamNnNnV0RUJjV0lFR3hJMVRJK084?=
 =?utf-8?B?ZUdHeU5SZ1hOTTZTcEdxRkJkbkVUVk9YTE5EdXJvb3BwaHNERWptcktPUlhy?=
 =?utf-8?B?YlEwRE9yaDBaZUE1aldDMmVvaHByNFFkM2k2QlU5bjM4aTA0WnNVVis4dDJ1?=
 =?utf-8?B?ZjFJY2NoTHh2WHgxbHJEdmwxcEVqL09ZTWl3Ni8yUllkNi9UNXg0c3RkcTZh?=
 =?utf-8?B?K080Z3JqRlc0K1FPNmFaU2htRXlEZHFmVU12VzdGdllrTndCNUFwS2QzL3du?=
 =?utf-8?B?aUwrczdBMHV5VU5zckRyWHllZW9pT3BybzNhUFdHV041ZlVuRnJSOXBWY2p3?=
 =?utf-8?B?Z1Z2Uld0YlFCS0o2Qm8xZFdhUEpDNyszU2xwcDAxS2h0ekJvVjFxWThnWHFF?=
 =?utf-8?Q?vB/60vS3Mjr10?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZjJHTWFRYTFyNGgzSFBxUEF2anpyNDlNOVY0dU9laXVPc2J1S2xCYTdDaDRC?=
 =?utf-8?B?VDlNK0k5b1Q2NCsvRHVaL29wUWxTc2NEQW52Z010ajErY284eHBwUE1IQ1Zy?=
 =?utf-8?B?R1VBNUd2dFZXNzF5NUZaY3RGcFYxVjlHK0Z5RjMvaXpHRFNmQ1A2ZiswWHJi?=
 =?utf-8?B?NksrSG1OQ2JqUS9GWnordTNEUWhrak5Db2lRckYwZHBUU0VmQzBBRFZzNjBv?=
 =?utf-8?B?eDZQYk1rNXR5ZGdOdEFUSFlUT0FiSXY2SDAwTi9KT3dNYjBpMEhuaCtPQ2F2?=
 =?utf-8?B?bzNkTDdlNnhXQWl5SC90Z3RNeXFxMElESkFrK3RKWnBhQ08wVVcwT2ZxOHpN?=
 =?utf-8?B?ckNNNllLdXM3Q2hVS2YyMXAzaWhYOWJYQm9oTnpDbisxT3RTOW1URWsxYlAy?=
 =?utf-8?B?UHhDb2tyeHNBQ2JHUnJaN1diUVFYenRxNDNOVThnNlU3dDZ3cUJlaXplczJ2?=
 =?utf-8?B?V3ZqT01LMmRLSlRpWlBCMjZvcEQ0NVl4c3RhZ25WS1NwL3BWNWc0S2F5eGN5?=
 =?utf-8?B?RUlWSXJzNklnVnlURUNRQ3plbHRBYnFJK2g3cWlYT0xzRUVTbjdQYUp1R1Nk?=
 =?utf-8?B?UEhHWWFXMDF1YnJSL0t5ck9PcmZ2R2J2WEF3cnBCTW80ckNvSmU2UEJUYnVP?=
 =?utf-8?B?c28xcU5LcnMxT1lZVGl3TlZxZnVXWU5iOENaazNMMnJqUmVYVGhrelFsTTdr?=
 =?utf-8?B?aGhudUJBNTVCSkR3Tkh6R1JqSytENXpYQjIvUEJyaDdsRlBBZVhNSlV3UjNt?=
 =?utf-8?B?WFkwb21FeVlVclNWWkExNWdsbWJwU3R3amNMNnRBM0ZCdGRBYjdGUzlZV1JU?=
 =?utf-8?B?d1FPckt4OEFPNU1nSXdYWlQwTFMzeE1nNkowYUEyR1RBVXVPdlR0V3pYaUdz?=
 =?utf-8?B?a2FGOGZ6UGcwZXB2aTRDZHdZbGd1RkJCUmQ3d2tOKzJFTzBQWUwwcjE0SlJr?=
 =?utf-8?B?K2Zzc0ZTT25UMTBBWWpwaTIvUjVHcnV1R2RCWVZYa1FVbXJJZmQzNFRTdkFZ?=
 =?utf-8?B?WGtQeDNpeDRIazlFdFEwaE5Ga1U1VnQrU1dEZlFPOVpnSVkxQnVieUFYR09V?=
 =?utf-8?B?cUQ0dDR0L0JIcjY0OWx5a2kzbFZTOHgybTRwQjQ1NzNaVSs1NUl4ZGNTM1ls?=
 =?utf-8?B?N2dIVlBWVVlvWkEwNUpVa09vdStNTkRuUFlmcGdtYUo1Wk0rZTRGRGY0Y3k1?=
 =?utf-8?B?QVl1N3Z3akdkelNmd0FBVnQ1NTBpYkU2M2RYVzlmV2xCcURaRjA0aXhvUjJL?=
 =?utf-8?B?TVI3dG8rUGk3MGwwN2pULzdzY1hNVXd1cTlTMFFmNlFibXZLNGE1dG1rYVBW?=
 =?utf-8?B?b3pqOWc2YWUxOEpTSzJTMWJvR1NNUkY2U2E2cWVQVTdxZ3pvOUJzVitjNUNP?=
 =?utf-8?B?aThweGhkb0hmNHpTc1Z6SVNZU2hnMUQ1WU9GN3NxWE1uTExPeHJUSVFpMFVI?=
 =?utf-8?B?bGNqbnhVTGFHRVJQRlV0ODQzYUZHYjl6cVRiTmcvazhxdWFqV0RSZnFyQis4?=
 =?utf-8?B?Zm9laGExUVZDOGRyUFhWd3hkWWtSamlIQklTNjZRVkpvMFQ4VjJKUVFMejJJ?=
 =?utf-8?B?ZDdDaXFmL3dKQ0lIdHFRcDNqVk5QY3VuREg3Z0ZIbUcxRjJkelF3MU45Vmdj?=
 =?utf-8?B?dzR0SnFLcm16ZTBTQVkyVmZ3TUhhUGRlYllTQnZSNzFkczYzQi9FbmsweWY1?=
 =?utf-8?B?SDhSY3VwQUNXcVgwMlR1aEFFcmQxN0srekhnT0JKck1nT0c3ZVNhcTc1Wncw?=
 =?utf-8?B?azRkcGxCYmJhMkRhdGFlbnNKNHlWbElGdGRNVWtteUZ3QjhReXl4QldwbkdR?=
 =?utf-8?B?SElVR284UGFiTWc2WkxBcnJlYTZHQnd0WVUvZkZFRGI1bXpZR0swUEozTWtX?=
 =?utf-8?B?SUd1d1J6VFBGNDBuMHBuNDJ5ckVOTmg2UjhyVXFYZG1NdmQ5ZE14TTdjVjcx?=
 =?utf-8?B?UTFHZnZOWVJZZ2IrQkNqTDVJTGsrMUR0djl2ajFSRnVMNDgzN1BqZ1BzMnZy?=
 =?utf-8?B?NGI0V3p1ZlNnZkhSRHNaOVdyUEVKbVl2YlFNbmVGaXhYZUcxWkQ5WUdIYVYy?=
 =?utf-8?B?a2FjTjZXSjJYSmpuY09jdmhqZEdtYkc0cG9WcUVuaGlnSU1YSG1XTys1Qk0v?=
 =?utf-8?B?RERxRk1DTW41Z2szRmZMbWJmWEVPMTFkWktiQ3pscEc1UEtwTi81TzVZVGVE?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3ff1e5-404b-4ba8-a49c-08dd4b5fd53f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 12:21:52.9640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7G/AjYNK4XPJFdPBAM7X1AIx3cgvovcV2GBtkcyM4lGr3krMhqxRWBnN4wNVMNjmIcfKsjcUedjhaDf1j85Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10522
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 12:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211229

--------------AWXf0f1SiGTgga0BS0lPUuSF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 12.02.2025 um 10:38 schrieb Richard Purdie:
> On Wed, 2025-02-12 at 10:27 +0100, Stefan Herbrechtsmeier wrote:
>> Am 11.02.2025 um 22:31 schrieb Richard Purdie:
>>> On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.openembedded.org wrote:
>>>> From: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com>
>>>>
>>>> Add a vendor package as base for package manager specific
>>>> implementations to resolve dependencies and populate vendor directories.
>>>> Add common dump and load function for SRC_URI files.
>>>>
>>>> Signed-off-by: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com>
>>>> ---
>>>>
>>>>   meta/lib/oe/vendor/__init__.py | 28 ++++++++++++++++++++++++++++
>>>>   1 file changed, 28 insertions(+)
>>>>   create mode 100644 meta/lib/oe/vendor/__init__.py
>>>>   
>>>>
>>>   
>>>
>>> Initially I was going to ask there to be a "fetch" or "download" in the
>>> namespacing. That then made me wonder if in the interests of clarity
>>> and namepacing, these vendor classes should go into
>>> lib/bb/fetch2/vendor in bitbake?
>>>
>>>    
>> The package isn't limited to fetch / download. In some cases it
>> populate the vendor directory and could be used for the license
>> extraction in future.
> "populate" and "extraction" sound related to the fetcher.
>
>>   I think it is a bad idea to move code into bitbake which isn't used
>> by bitbake. It will complicate future development without any
>> benefit.
> You could argue that about the fetch module. It does encourage
> strong/stable APIs to the modules, which has been of benefit. I can see
> the arguments either way though.

At the moment there is no common api between the different resolve 
functions. The different package manager need different details. But it 
is possible to unify the functions parameters.

Where would you place the code in bitbake?

>>> I appreciate the class in OE will use them and separation into bitbake
>>> can be a bit awkward but it would mean we don't confuse this with any
>>> other kind of vendoring
>> What do you mean by "any other kind of vendoring"?
> When someone customises their BSP, the original might be from "the
> vendor" so perhaps this code handles that? OSV as in software vendor is
> going to get confused with this. I'd imagine there will be other ways
> people could read it too. We have TARGET_VENDOR, HOST_VENDOR,
> SDK_VENDOR and so on in the triplets.
What name do you recommended?

> My point is that if someone sees a "vendor" module in isolation, they
> aren't going to know what it relates to. You're really close to this
> topic so it is obvious to you, it is not going to be obvious to others,
> or perhaps even you in a few years time.

I fear names like dependencies, package manager or resolver are 
misleading too.

--------------AWXf0f1SiGTgga0BS0lPUuSF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Am 12.02.2025 um 10:38 schrieb Richard
      Purdie:<br>
    </div>
    <blockquote type="cite" cite="mid:ea2233e4e8854e59bf2221ead2cb9bab33a6a969.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Wed, 2025-02-12 at 10:27 +0100, Stefan Herbrechtsmeier wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Am 11.02.2025 um 22:31 schrieb Richard Purdie:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.openembedded.org wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">From: Stefan Herbrechtsmeier <a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier@weidmueller.com">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>

Add a vendor package as base for package manager specific
implementations to resolve dependencies and populate vendor directories.
Add common dump and load function for SRC_URI files.

Signed-off-by: Stefan Herbrechtsmeier <a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier@weidmueller.com">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>
---

&nbsp;meta/lib/oe/vendor/__init__.py | 28 ++++++++++++++++++++++++++++
&nbsp;1 file changed, 28 insertions(+)
&nbsp;create mode 100644 meta/lib/oe/vendor/__init__.py
&nbsp;

</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">&nbsp;

Initially I was going to ask there to be a &quot;fetch&quot; or &quot;download&quot; in the
namespacing. That then made me wonder if in the interests of clarity
and namepacing, these vendor classes should go into
lib/bb/fetch2/vendor in bitbake?

&nbsp;&nbsp;
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">The package isn't limited to fetch / download. In some cases it
populate the vendor directory and could be used for the license
extraction in future.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
&quot;populate&quot; and &quot;extraction&quot; sound related to the fetcher.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">&nbsp;I think it is a bad idea to move code into bitbake which isn't used
by bitbake. It will complicate future development without any
benefit.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You could argue that about the fetch module. It does encourage
strong/stable APIs to the modules, which has been of benefit. I can see
the arguments either way though.</pre>
    </blockquote>
    <p>At the moment there is no common api between the different
      resolve functions. The different package manager need different
      details. But it is possible to unify the functions parameters.<br>
      <br>
      Where would you place the code in bitbake?<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:ea2233e4e8854e59bf2221ead2cb9bab33a6a969.camel@linuxfoundation.org">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">I appreciate the class in OE will use them and separation into bitbake
can be a bit awkward but it would mean we don't confuse this with any
other kind of vendoring
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
What do you mean by &quot;any other kind of vendoring&quot;?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
When someone customises their BSP, the original might be from &quot;the
vendor&quot; so perhaps this code handles that? OSV as in software vendor is
going to get confused with this. I'd imagine there will be other ways
people could read it too. We have TARGET_VENDOR, HOST_VENDOR,
SDK_VENDOR and so on in the triplets.
</pre>
    </blockquote>
    What name do you recommended?<br>
    <br>
    <blockquote type="cite" cite="mid:ea2233e4e8854e59bf2221ead2cb9bab33a6a969.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">My point is that if someone sees a &quot;vendor&quot; module in isolation, they
aren't going to know what it relates to. You're really close to this
topic so it is obvious to you, it is not going to be obvious to others,
or perhaps even you in a few years time.
</pre>
    </blockquote>
    <p>I fear names like dependencies, package manager or resolver are
      misleading too.<span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <span style="white-space: pre-wrap">






</span>
  </body>
</html>

--------------AWXf0f1SiGTgga0BS0lPUuSF--

