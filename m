Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77602C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 12:42:46 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.97])
 by mx.groups.io with SMTP id smtpd.web10.14722.1739364162472966199
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 04:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=yNPrv0rm;
 spf=pass (domain: weidmueller.com, ip: 52.101.71.97, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLX017OgWdZnal5aUyNjQJ3P0DKuNeizMn3ysOS/oVkUMbMYVihIZiz3IlAy1glOyEIHXtTWDVLh3R2QA6gs/5c8aHryBhfZ2jpEicle0bDWdtG8kq+PS4w7tuNsmWBY/pXJFvVOCnK/JtQjGaXZhhbiJO8tV6ox8tfJoXJTF6eHskBWgekWxsFoUCdCYrwwzrnEEzuwB4BPgrYklTAho8ZR2DGmc+A6Ebwlh4rXPbkWK/VdzTCYtHMg48bU4JQog/btIT2Yo4izNDgOEXWoO75Ss8hdaizgq1xU8hgESNYKdwogA+xvI5KreKS208rVELmeb4qUcsDqED0WvdeIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TcBKWSXvdjm/jYSqsO8G2dOz43cmXzYuznBwtJk154=;
 b=DgZGEueVVV7BM9vKr1mzhFxrCdtjg2GjSya9gF5nr4Cxmy16I96okXCpBGykmxQfoIWdg/Aic2nWTH8BgboULsCgiJpJzrj7DGxutiuwGU7onll8xCykaJRqota4r/YYdpw5f05wUed/XK41kuLQjLiK/RrZXEYjugd7jhkPGY8td4AaJWC2G8ehojfuqrxkLTkCLnluy15N1Aqfnfzfbn6tBd+p6xWWz5I7L6sU3k3RFi3yFbz0uDj+Eh/EK0/MGSVqIoP4CVRLWOAIu1csy0YlovUoToy9VMKmERrz0VUvbG0xarG8XQ7yUxyV8p79xiIRzk8XXe5mNv0K2U3uDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TcBKWSXvdjm/jYSqsO8G2dOz43cmXzYuznBwtJk154=;
 b=yNPrv0rmIpHQpQ5DSHOiXta5s4ZnEIpr41VriLuMl5Smpt1y6q0ViZnBAxOtcD2K0tIploZEAuC3b1CIucTQUse9FegK41go9P4mtiz9mWm2Z88K8SQB7ZoWlvEwE/QbmF8myRPQDwxoW9TKu2n3u/DIujm21cav3vN5rbGPo40jzH62Gasl/RnHYPqbC6fKnou8TofxYmyyvwlMVvwVe9AwZvS8ngwoHl7hQ9rkSIQZ+iSrhcpRXh5fOcFRu5HuQ5CEONsvQha5FB39GCSU4BdV8ll9O7XtsQOT6T1eWKEa+PC08u6v2w9a2mnCJhK8A302uKX0gAPSHuyLX3QO+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by PA6PR08MB10623.eurprd08.prod.outlook.com (2603:10a6:102:3d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 12:42:38 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 12:42:37 +0000
Content-Type: multipart/alternative;
 boundary="------------Yaqh33niA3fXmZi3wYTnxtGY"
Message-ID: <1c055ff2-cf06-4e21-8c8a-a4f09d037d5f@weidmueller.com>
Date: Wed, 12 Feb 2025 13:42:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack and
 patch support
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-16-stefan.herbrechtsmeier-oss@weidmueller.com>
 <Z6vQDT6LkF9JMQ+S@gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <Z6vQDT6LkF9JMQ+S@gmail.com>
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|PA6PR08MB10623:EE_
X-MS-Office365-Filtering-Correlation-Id: aec307ca-27c0-451f-5f10-08dd4b62bb22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QVFLeUk0Y09lU05ZRytZYURXSlhkZEd6MzFBOWlsY2UwaUtqcDV0RGdjY1Y0?=
 =?utf-8?B?ejZ3Zk53VGxFMkpmS3dvb1YxVTJ6MGlCOTFqWjJFdjY0RWNSRDh0QnBFYkxD?=
 =?utf-8?B?bEJLdjc0YTFDd25Fek9JSTdtTGZpUnl6VFZiakVPVnR0T0RiQzFoYTJZU0hD?=
 =?utf-8?B?eHZhNmZSYUQzbFp4TzR0Zkt5bWVWbTZxVC84b29McHdHeHc0QkV3NVltS0E3?=
 =?utf-8?B?Rk0zWDZmVzZHTHVLRXpXT3NscFU1Y24vaW04TmE5UWhKYURuVFBOU08zaE1V?=
 =?utf-8?B?UTRodm5sVExyQnRhZmtnaFZuRnNGQWRYRm52NmsrZ1lTRk9EZzkxdFdndFMz?=
 =?utf-8?B?ZlpyT3hMSDNsUVRzc25nM0tEZkptYWxheWdxY25RaWMxQWdleWREVHZMZUtP?=
 =?utf-8?B?amRIcUJDZTBWRDRnS2lNL0dGNTFOR1hIeHlyLzlZRjVHQzhNSlZDTHRxRko2?=
 =?utf-8?B?TytlYnZQNWg3RXZCWkw5Ynora1Q2Nk15cks1MmZBajdJTnJVcE9hNHdaV1k4?=
 =?utf-8?B?aGN4aC9wUldldzlBS1ZCaEdpbkpMdEt0SHZHbzN1dEVPNmhZQWVjY2ViUmpB?=
 =?utf-8?B?NkEzWVRzYnJvc0lXVHhxMktEVGNXVkg2S1Qvc2JZUWtrQzNJTHJabllTMXZK?=
 =?utf-8?B?Umx3SlpvTStJd3VDS0RnelhGYnhkekFNWmVGRjNJM01aQXduckJTNkxRQUZa?=
 =?utf-8?B?Y3FpRTVEN000MHhuTzcvS2oxQWtlWmdNdDVkY3NMK0RKVWM0bTMxYkMrMTdo?=
 =?utf-8?B?RlFvSDBlenNLMlJ5UmVGUnd5UjA3M0VjRFJBWmNpRDN1WEcreFNRMjFaSjFR?=
 =?utf-8?B?WE9KUXl0Nk9qMERkdDNYbkd1My82TVc4UXV2SUZkSlZqb1VJYU9uVFFPMlB0?=
 =?utf-8?B?K0xwNnNtb3ltdndjT1pyYkc0UFJjNzBmYVVISEFIM2Y5Y3hhTVluSHo3bExK?=
 =?utf-8?B?K0NSYzdUM0pLbWMzbE9NSkFmb2RxRjg5TEpUamhzVnQ3MmE2b2FnUEs1bDJF?=
 =?utf-8?B?K1lWd3k3VnZDQnNCWUk4bnVJZ1BLcllrVTlFOGJ6K2dnSDVVdkVWenpWOUZI?=
 =?utf-8?B?Nm1mYzlNQ2NyTjFQdkV4aVVibFJ6TG15ZW1OTUZ3NWdNdVBnYUtBcVlkRGZW?=
 =?utf-8?B?Wm5PRDd4ZlBpcUp0ODJiZmw4eGZXQk14K0t6ZHBCR1ZJdlFiamNpNHhBa3Ev?=
 =?utf-8?B?RXV4Ums2cm1haUhwY1dmYy80eEdUYVRxK2YvR3BiVnRaSjJ3MC9Gb1J6UnNS?=
 =?utf-8?B?TCtsWVlFL2k4VDhaRkJKV25teTFYRHMzeHF4K2N3QXlaQTlMelJadXJIT3py?=
 =?utf-8?B?WXpoTjZWUXBxVVI3TnA0dXlnbHlHSTZBZnlOU1R1SThnSnBvNHFhRVhodE51?=
 =?utf-8?B?WXVwLzhPMHlXS0dwaCtiNFcxUkk3b0dYaFFxamRmNm5pSnlkTXA4TnFVYUJJ?=
 =?utf-8?B?WjB0cFh6NkVyK0hSVVc3NUg1S2txd2lBaDRjUHVsY0FYdmNnTTVGcHFITk5G?=
 =?utf-8?B?ZGlLSnBHM3FxTmE5eklJaDRPZzU5ZHpmTXFodTFZRVRKTFc2NGFFd1p6eEc4?=
 =?utf-8?B?bVEzNjM3RlQrRHRmM2tBYU9CdmZHdmpYYXdBdGpTYmVPK1AzRUE4cS83bHBq?=
 =?utf-8?B?TGNqY3BRbllUeThlRWMyS29BbExVT1NKZUtiM3dsUktqOU03aVZoaWZ2cWF6?=
 =?utf-8?B?KytoMmdzNjN6Z1lTdjEzU3FsVmgzU1FCWU5ZWXFTUzQwT05sOGVqMGRzSFRk?=
 =?utf-8?B?YnpldUQzd2NBVzJRY0MxRFVENE9qa1Z6R0pkUk9VcFNWUUU1VzVxSjQzMVA4?=
 =?utf-8?B?cHlsYjRIK3Q1cGJZYmgyWEp3VkR3eDU2NWhWTWtKYi9BcDlONEtkNXVtdVgz?=
 =?utf-8?Q?WVtNDqloPkKgR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHJkRUI3M1ZNSllOdzRHTHVTVlFPQ1NwL1lNMmQ4U3dxQlZQNldQcDlwNWJi?=
 =?utf-8?B?QWtSZ09YdUtlZFQwWDR5WXArZHorNDMwSFN3MVdkRjI1M0MvTUc0Z29vUTF2?=
 =?utf-8?B?eVltYmFLTVpORFR1WDJ2bHN0czNlVjdQYXI3UGRkYnduMlVLbVYvOTdDNVY4?=
 =?utf-8?B?NlZZU3NoT3FrMnhLdDRWSkJBTlJZbmVyem1oTjIzbDUrbUdGQ0lnY3p5UWFz?=
 =?utf-8?B?SGQwTHFlMnNzZTVuQ3VRVjV3OHJxSVJLampVSmxqY25WTzBhbFk0N0VaUGhu?=
 =?utf-8?B?RloxS2ZJT0lvTm1GOG91RjMvcjBzUDA0V1VjME45OWtKS3VOWmd6VUtrRFhL?=
 =?utf-8?B?eVl3NUh5RU1yRVR5Mi9mdHQwa2VocGo2YlZOTHltUXZGVjZBUHJkSm9kbTV0?=
 =?utf-8?B?UWlGRklNZEVhaG5SMjJTcTZ1V2oxcmVuQUpvajV5bXgzU0ZvUHhUNlhqQkdy?=
 =?utf-8?B?aDhIMFdlMDNUZkVsSElwTFJkOEZFRmxsT25CbVErdUhrS3g4Q1RzeTBYYmhE?=
 =?utf-8?B?aFpFbWYvcXZPSXVVQWRJYm85VjJJWFZ5NS9nREZZZHB4RGZIeVhweXZkTXVX?=
 =?utf-8?B?U0ZibzJ3VUh5MG9Ib0tqS0lvMHE0aCtvSjZyc0IwdGpyYXV6b1JIM09BSFZt?=
 =?utf-8?B?clB1eFJQZ2dEcW5CVXRuQ0VTYWh0SElUTVJnQXNXS0FrcWlrY1hZaTJGN1ND?=
 =?utf-8?B?amxKT0dIN09jZUhwNGwrUlByZGpkOEs4U2piWFRCTXAwVi9IMFhsS1VUdzll?=
 =?utf-8?B?aS95MURoa1VvbEo2RmZRSEpVaXpQaWJKcWNvcFo3OWsvQU9nLzBlR2lOYjhD?=
 =?utf-8?B?dzdtU0JIMmRJNjc0dldwSkNYU05lMTIydk9UU1ZQRkRJMm5YMzhzQ2MxUWI5?=
 =?utf-8?B?TWtrY3RWRU12VUhFbElSbzhuWTFhMHp2V3J3YmxqbEIwc20wZ3FDeDdyanFj?=
 =?utf-8?B?R3cxTDRPU3VqYVBzR1RIUzB0blh6MnBlZ1pqRmlLNFp5RVN1S0RLQzRCa1J6?=
 =?utf-8?B?NVppOXM1dEJrMUVtMjNmdW1QRmYyMzMzUmJ6b2p3d3ZXWG50cW56S0s4Z1lh?=
 =?utf-8?B?ZUFhMlQzMHNzUHYyZkoyMm1CVzRYL2pEU0pqTlpOdG1FMFJ4TnRsQ3Eva2NS?=
 =?utf-8?B?Rkt1b0l5WjQzazJqV1kvdVE3VHMyUmlYRHlYRzRHdlJTSFc4NWwyRFlVWHRY?=
 =?utf-8?B?cFJJODNMUG1PeGJrckNTZ0ZCNjVzazR0RGFKVGRnL0ZDTG1vYzhYQm9ocm5s?=
 =?utf-8?B?YVVsKyt2aVhxQVU5MU9aVTBoSGRCVUJ4YTNXTS9KNjN3OVJvZEZKSnpkLzYy?=
 =?utf-8?B?QzIxaStRWnlLY0VOR2RaV05PMVZmRUdCeEl5dlF4SVNpTUNVejNEUWxvN2FB?=
 =?utf-8?B?cHRTZDM5QkVlRUs2MGlIQm93QkpwNnpuRE1tRjZ2L3loVkxUVEVHcHFLRmVn?=
 =?utf-8?B?K0luQ2tZY0tLTWI0Qm1OZEFEK0lnWUVOMTNJRHNYYzRRSGEwcHlhaGRnUnJI?=
 =?utf-8?B?bE1TMmZwZEtadjRVUFNCL2lyV0ZQcXhvTVhKNjZ1ZUczMFhJc1J3clJNaGJD?=
 =?utf-8?B?anFuUVUxOGdBYjdLR0tzL3YvSExyT0hvNTBzZ0NIY2VRUEIvZjJnYlBKczgw?=
 =?utf-8?B?L0xTNDBsb3MxSld2dVE1bkZzN0lpU2tTU2FlRll5V1p1VUJCVy8xVHNnd05S?=
 =?utf-8?B?RTJmY3hZMVBWelVESFB5MDl5UjlxWGpTN1VIN0NaaXZLVXdIMWRBVUpSWE9h?=
 =?utf-8?B?REgwM3NsOXZaQnNZWUNjd1B2dUlZYTVCYnFDY2d5aEpDRE4ybWJSbVRIcEhO?=
 =?utf-8?B?ZHp0MXBRMUxZOGZQVzRlM0Z5T0ExUzFOdUpKR1Fpd055NUJKRVhTMnhKa2hl?=
 =?utf-8?B?OHJDcmE2eGlWVENZZTFEamRGM2NidzBkd0d1cTlHVmtINllsRXRpVlRYSXg4?=
 =?utf-8?B?amtGYmJMUWxnRFJPMDY4U3VncmFNOG0zMC9mWkdwMVpoNW1mYkUwMTVtSUc2?=
 =?utf-8?B?RzBqMlVRMnJYNG80TWlBRytFdlZGTm80SHRQVHNhZlZxMUZCb3Q0WTZQemR5?=
 =?utf-8?B?TGdnRkxkUDRyeEVVN2RkOWg3NkdUQlpCRFhzeGhDa1ZaQlEyMVVvTGtPREUr?=
 =?utf-8?B?ZHFqdkhNSERjbWlRalJDNExMUXpNR1RkN2JWVVRXdFJpai9UT2pHZGRPb3RZ?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec307ca-27c0-451f-5f10-08dd4b62bb22
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 12:42:37.7568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yFPxRnK0iYuUtmHdN8Gw4zP6uKnAGosT/zgfoR1l3ujItDaQgONSGAsuugC1BzmWY/VhFh8CuzbPpw6/JtgPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10623
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 12:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211230

--------------Yaqh33niA3fXmZi3wYTnxtGY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 11.02.2025 um 23:32 schrieb Bruce Ashfield via lists.openembedded.org:
> In message: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack and patch support
> on 11/02/2025 Stefan Herbrechtsmeier via lists.openembedded.org wrote:
>
>> From: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com>
>>
>> Add support for early fetch, unpack and patches task which run before
>> normal patch task. This feature is useful to fetch additional
>> dependencies based on a patched source before the normal unpack and
>> patch tasks. The patch are marked as early via an early=1 parameter. An
>> example use case is a patch for a package manager lock file (Cargo.lock,
>> go.sum, package-lock.json).
> I understand why you need to do the above, but there's now multiple
> fetch and patch tasks running throughout the pipeline of the
> build and that's just more complexity to maintain.

The tasks call the same functions and the difference is really low. The 
early task simple use a filtered list of the SRC_URI. At the moment the 
gitsm fetcher is doing the same but without a possibility to patch a 
dependency.

> This is what I was asking about in some of my first replies
> to the RFC series. When I've done this in the past, I'd just
> suggest something simpler like the recipe provide a complete
> "lock file" in the layer/recipe-space and have it overlayed
> in the source.

This was already supported by my first patch series. The disadvantage is 
a lot of noise during each update.

> Of course that means it is in the same fetch task as what
> will be fetching the vendor bits, but coordinating within
> the single task is simpler in my experience (and it can
> be checked on the SRC_URI). I haven't fully thought through
> how to manage it, but wanted to reply to this while it was
> fresh in my mind.

It is simpler because you manual fetch the lock file, remove the 
possibility to patch the file and skip the unpack. But you still need a 
manual fetch, unpack and maybe patch the source and copy the file into 
the meta layer.

It is also possibility to integrate the early and resolve task into 
fetch task but I'm unsure if this simplify the complexity.

--------------Yaqh33niA3fXmZi3wYTnxtGY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Am 11.02.2025 um 23:32 schrieb Bruce
      Ashfield via lists.openembedded.org:<br>
    </div>
    <blockquote type="cite" cite="mid:Z6vQDT6LkF9JMQ+S@gmail.com">
      <pre wrap="" class="moz-quote-pre">In message: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack and patch support
on 11/02/2025 Stefan Herbrechtsmeier via lists.openembedded.org wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Stefan Herbrechtsmeier <a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier@weidmueller.com">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>

Add support for early fetch, unpack and patches task which run before
normal patch task. This feature is useful to fetch additional
dependencies based on a patched source before the normal unpack and
patch tasks. The patch are marked as early via an early=1 parameter. An
example use case is a patch for a package manager lock file (Cargo.lock,
go.sum, package-lock.json).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I understand why you need to do the above, but there's now multiple
fetch and patch tasks running throughout the pipeline of the
build and that's just more complexity to maintain.
</pre>
    </blockquote>
    <p>The tasks call the same functions and the difference is really
      low. The early task simple use a filtered list of the SRC_URI. At
      the moment the gitsm fetcher is doing the same but without a
      possibility to patch a dependency.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:Z6vQDT6LkF9JMQ+S@gmail.com">
      <pre wrap="" class="moz-quote-pre">This is what I was asking about in some of my first replies
to the RFC series. When I've done this in the past, I'd just
suggest something simpler like the recipe provide a complete
&quot;lock file&quot; in the layer/recipe-space and have it overlayed
in the source.
</pre>
    </blockquote>
    <p>This was already supported by my first patch series. The
      disadvantage is a lot of noise during each update.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:Z6vQDT6LkF9JMQ+S@gmail.com">
      <pre wrap="" class="moz-quote-pre">Of course that means it is in the same fetch task as what
will be fetching the vendor bits, but coordinating within
the single task is simpler in my experience (and it can
be checked on the SRC_URI). I haven't fully thought through
how to manage it, but wanted to reply to this while it was
fresh in my mind.</pre>
    </blockquote>
    <p>It is simpler because you manual fetch the lock file, remove the
      possibility to patch the file and skip the unpack. But you still
      need a manual fetch, unpack and maybe patch the source and copy
      the file into the meta layer.<br>
      <br>
      It is also possibility to integrate the early and resolve task
      into fetch task but I'm unsure if this simplify the complexity.<br>
      <span style="white-space: pre-wrap">

</span><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------Yaqh33niA3fXmZi3wYTnxtGY--

