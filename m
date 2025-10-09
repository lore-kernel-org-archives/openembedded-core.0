Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69625CCD187
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 09:31:16 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.99])
 by mx.groups.io with SMTP id smtpd.web11.7979.1760002269900789890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 02:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=50LUHMi4;
 spf=pass (domain: weidmueller.com, ip: 52.101.70.99, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RddUTTxKZ45rhg84tdfrP4tb2FohAM5AgvX0YA5TJ8bkTaXX+3LKN5OxjLbAbjLtUCuKfr8thI3/9YbYbLm/tz4mOjE8vbuhd4OP3TmGGJdmzp94Cmo7gytTN9GkQqXXzuc5KtU6mSlFKx9xph1PaVrxvPiQdwabw132HjoK3rUM0IH+a+kzhqYOZVJbyvNRre8jrUWXpxfXbZFRqqL8YHSdEvTSaXv8aM4HnMntJgR+wTbkxk8AToFD2eum9WswvpFkUItKumVTaPprHpXqfMgTuUtL1AmRoF+BVdQFtQVcm/XuNa4AvaSI1hX5X4qkMLMddM7SZSeZCvTUwxmdzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tgjzqi1UKdkZ0tUKKyWpyC0d3lq6mg0K6TkadAl/4uk=;
 b=cbSAXSTe1XCvui0wZ4g7G3u2tcmdd3ECqqqFxg57duYBwnjHQc5v6eKxJImzyGLoyDizUNHHKlAz8/hLDjfcZAozF/yYsQX8repnqSzA/MnSaptTIaUIKObv8EONuXErWXuUTNbS8Akg3pBlSIWVHB7v3lATG4Jr6FXfyA3HFwGa6FS4Jog+zBszxbZDtqpyaOwTZodRsbiUAte6aX8Yopzjzm4Dln9bdY4kIPr74IzS1IGCgOaB37uIIQjaz5ohTAI8WFx1XdjPkap+8wma8XziENBuKMxsGmBfLWcMNS9nH0KTpBmMaoZW2l4WIlHCnjdQhONTdxMNSDsx8XbYAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tgjzqi1UKdkZ0tUKKyWpyC0d3lq6mg0K6TkadAl/4uk=;
 b=50LUHMi4TeJ9/VHSs0efGmNiFpKzmp4Xm8F6B4IMGwV9WEJwpW5BLumwPaNIeeFub0XxcqET/yQRTEmIG0zjMKlTE2HOAtmJF3JBADrjVHyOi4fE5/srqk4NKz54u1rq0mpIU03AUGcqetTY9351HTNZmlWHWXj65fxi9u8J3qFaaEaHPov/plW5r1MWZI3lK0A8vvOUdNTgQUJ4pHBByeisAxxEoTr+XyLjAfrKwqCaGk/yMdAVjtcAmymtqIEKKFWkdn5jLwsz0Z0avCXNsXwSpODyREA27vqICGJ2EypKlE0MsBN7QxeKNCaD520gXItHaDszsJv3gs5O7lGFaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by PR3PR08MB5563.eurprd08.prod.outlook.com (2603:10a6:102:89::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 09:31:05 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%5]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 09:31:05 +0000
Content-Type: multipart/alternative;
 boundary="------------a7ULjiBH6owrCB0kuoQJTVAe"
Message-ID: <54596a81-b725-4d78-9c35-ff851e4b1113@weidmueller.com>
Date: Thu, 9 Oct 2025 11:31:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] cargo_common.bbclass: use source
 replacement instead of dependency patching
To: Gyorgy Sarvari <skandigraun@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
References: <20251003213000.2256939-1-skandigraun@gmail.com>
 <211549e4-c4c2-464d-9b63-88c27d5bdf18@weidmueller.com>
 <049f87a6-2e45-43b2-b04a-7b96e6cdb096@gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <049f87a6-2e45-43b2-b04a-7b96e6cdb096@gmail.com>
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|PR3PR08MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: 221648e6-f4cc-4f93-8deb-08de0716918b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OHlQR1E4Tm82MU9NMW1vRjlsWmJJMWdzcGRkRExJVDhyRzRBdDJmWlF1SExT?=
 =?utf-8?B?WlJxdXZqWUROUEw3TXhUN1VUQjlmMXFiY2Q0M2tjSkVnN01GY04yNnhGV0VR?=
 =?utf-8?B?SVluM3dPclRvSm5NVE9BbEI4OUlXb3REc1ZGZWovbXFEK2pVS001MGhqekZS?=
 =?utf-8?B?bVhkbjFaczQvSGdScnpUQStXd1lSNSt6RWUvclB5WGdES2huZDZKeDBLcUE4?=
 =?utf-8?B?ZzBGdGFEMk5vb1BHb1F3MjZoU0x4NEFXc0VwVkNicFlzc3BIbVVOd1g0a2kw?=
 =?utf-8?B?R000L2p1WFp1YndQbURXZDM0bXhPUHpIclFCbTJnRXl4ZE1MUTdzYzVCQm8w?=
 =?utf-8?B?c3B2UEp6Zlp0WFphaHpPN09lbVc2SFUwaS84Rkl4ZmxTNE4xU3JoK1RCY3Vu?=
 =?utf-8?B?eVZWTDRqK3ZUVE9OTm5LME0vdGg2ZG8wbHVsdnl1NGE0RUt4cU1BdnRuWmVT?=
 =?utf-8?B?SGRGc1VKaE1kL0ZucFlvdlhNdlpHUmtMWDJGdWZIM0t0TUlDQmNrbGw5VktZ?=
 =?utf-8?B?UE13Vk9Vb21UVE9MRjVjQnFiTXREZ1dKSjdKRGdoMHFuU0wxUkdYYkpjMm5q?=
 =?utf-8?B?U0NlVTIrM3FTeVdrZHpMeEhWUTArZVV4eWZMM1A3UnUwdEFONVkvN213ejlj?=
 =?utf-8?B?RTYrQjlWazFrZUlVMjczQUhDWENjZUoyT0ZROVR1QlBEU21XVjhncWxHNTJv?=
 =?utf-8?B?MmptRkJLMXZVM3BLVzJ0a1d1WXJGcTFKb0hVbnN6NUN0YmJvZWh3WS9wNDNr?=
 =?utf-8?B?aWF5M0p0ODBPRVN6Mm93N2l1cTMrMnVQb3JTZEtKczQ4ZW9DQWE4dWFTRW82?=
 =?utf-8?B?N2J3dk1OZFZkdWVMbnBoZ1FIdEFlUld1eUJCcVNvT3pqenFaTEUyTWtKRnlH?=
 =?utf-8?B?cDVRWVVoK1J2SWo4dDB1SWZpa1Erb2h2SmtzYXFSRGNsMld2c201NzFNalN0?=
 =?utf-8?B?alBWc1FBQ3lJSjNLMDMxZ09oMXFOM0FuRDF0UVdMbGtEa0ZUczRuNU9MRE5I?=
 =?utf-8?B?SDBjbE13STNtTnFibW5SUXlab1M1ZERTZXMzNmxlYnNsTDNFOFN5WHpvTmVB?=
 =?utf-8?B?UHF2cHFnSDd5Z3VTOStVQW1Qa2paVWUyQUVCQjhkQjlyQzVyMjBxQ1J0dE5u?=
 =?utf-8?B?a3ZPc3VCbmdxdG40WWFJZTdDYXBZRm1VOU93ajl0QWJJQzEyNWhFbTdPd0du?=
 =?utf-8?B?Y3dCVWFzS3Y1Ymc5SnBXbDJEekhCcWtUbjZnRUJaakwvUkJZdUp5WE1JenA1?=
 =?utf-8?B?TitvTWdFcHUzOHREYzM5STVoK3NFTmVsdUN4d3RKSk9qMHNNc0UrRVJvMDd4?=
 =?utf-8?B?eFZqOTFPOTNnREl6VlZhdFFHU1g5RGZxK0w2dGV6RThhSHVaaWVxT2wvRzgy?=
 =?utf-8?B?MldSNkhPZWlkSkRDc2hEdmdMNjlYbENwM0VkY0VjUUcxcXp0MDQyLzQ0UUZ1?=
 =?utf-8?B?U0Z0TXY2ZmQxTjVFMlJMRExqeUxvMDdsQ3MyQlQ3VDdhek9DdVlUcXYwbUhS?=
 =?utf-8?B?VDA3QS92Q1IwcWFHb1BhRVQxYXVtWWoxcmFFZzRXWm5TbGI2bjJ6dGdzRFc0?=
 =?utf-8?B?Q2p0V0ZNMEM0enJpTU9samxURUZaT3hjZHdmMzF2VGpzZG93VU9IaW8vNXY2?=
 =?utf-8?B?TmlvQ3FhaW1xdE1aNmdvZmlIYnh4cVlaSHNxaUdHaS9nVjhwckVnNDBLNHZW?=
 =?utf-8?B?eTNoZ3hsNnMyenlPdEhzcnI1eCtZZjY5K04xZFg5bUttMG9qREpMQUhUaTcw?=
 =?utf-8?B?QytQbUZWdGp2NGlCRklsRFQ0MVVONVpYZnlXanoweXR2QThUV2swYjVYRC9G?=
 =?utf-8?B?U2NndWRaVFd2dnQyL05YSlJydHI2bGcxNm52eVF5MS9ERUdWOERuc1JLQVpN?=
 =?utf-8?B?SkRaRHJJTUtVSEg2QXZHZWJJS2daelZIQ0xtWXg1cXZtRHc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(8096899003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVVsTkQ2T0VwcmZEN2lOUW8xT0RZWXBUNzlWVC80amNoUlM3cFNqRmdFUTZt?=
 =?utf-8?B?ZXRNR05GM1dtV3JjdVYzbFc1OUgrb0EwWDczUmdJOU8zZ0dwOUtOWlFzS280?=
 =?utf-8?B?clA1WS96RkJtQURhY1hXcUoyZStyWVcwZENZSlZPOVIxMVd4V3BSRzVBY1NJ?=
 =?utf-8?B?djVibDgwY3ZBbHU1b1RTcnhjUml5V2hJS29MNEFwcGM2NWw3cWs4UEV6Zldi?=
 =?utf-8?B?TjVhYnBwUHVzb2Y4d0VZTUUrbU9OQ1pGVWF4ZHgyTDFRY3JNcjdYbzRPMktn?=
 =?utf-8?B?dllxNXJiQVZxSWdiZWdmeFBIc3FYTzdCWEFWUWxLR0VhTmgwR2VNTTBuZW1C?=
 =?utf-8?B?eXhGMFE5RGI4bFNYbEhGaGdaQWdQS1NZSEZ1cEVlMWYzdHdJcjV4bjViNnQ5?=
 =?utf-8?B?YnhhRHhHa29RSXIvSFBzcTJKdW5NbjU3MVYxRHhpRU1CT3UzQjhTalp0SHhM?=
 =?utf-8?B?VUdVeUVWRVRrMzA0YlI1bUR4YzB5MnFxYUt4L2d1K3QvS1YwMWh4Q0xlb0tO?=
 =?utf-8?B?MTFRdk1EUXV0akJlM0pLYWtibkQzanBQUEJHTW51WjZnMU1XZFlueWZHaGw3?=
 =?utf-8?B?ZDR3OXRjUzJpY3RESk52Z0xnSzl4RUNWYmNwcGI1Q1FwSHljelk2YjdYTzAw?=
 =?utf-8?B?TzUzNXJlRHY3VDR0R0VwSUllbVdIMDF6WjFtNzNzOXB1cjJaVGNZODQ3SkF3?=
 =?utf-8?B?S1loaVgrQm5DVXpyL1hYTUlPQWQySUlJOWpBN1ZHQjNxREJTSGhFSll1RXVp?=
 =?utf-8?B?OElNMW1YVS8wejYyekRsajhuWGZSYndHVmFpeFR0YkUxamRXUWptYXhWN21M?=
 =?utf-8?B?U3RFQTFpN2RLUTl0cDB0Sk8wOWwrTm5rVjZrY1pybTA2dXIwYlVZK2JZdThL?=
 =?utf-8?B?aDV6SUFHNTZhanV0N3d1Q1JTTFpFY1BOb3ZWTUNwMTV0SEtEcXVMVWhqdURx?=
 =?utf-8?B?ZVBZenZISjg4dE42L21KNWJXalFjYzNZbjlxRlZvTWw4ZkFXT2IzSDRxcVdI?=
 =?utf-8?B?M1RUMTZsVDlVZUd5T3dFSE1USjY3MUxNSkFiR0tPNUxiRzNKRVVaaE5IYmtr?=
 =?utf-8?B?bzNUTTBWOHF4OUxvWG5jbStwSkN5UWVKZEVJM1ZUdzdhOGY2eUxFUkVJN0hz?=
 =?utf-8?B?dGZyd2Z0RmVxaDZ3Q1JpR2tXUno4OTFXK0xVYUZKdGU5YmJPQzgvb0JBL0RV?=
 =?utf-8?B?QWpzZVQ1SlphdTdOQ3R5QVpCSzVHbkdDNWx4T0NnN1k3SG5saFl5a3pzWC8w?=
 =?utf-8?B?K2tiUUh5WEZVQzVTUnF2eWliaWkzZWlkR0NjRUhIOVhrQTlWdENhallFSEMz?=
 =?utf-8?B?OTc1NzBGTFdTSjU1TDlJMGlvekdYRUUveVUwdmlEbnl2SG1VZW1DTnlLTXp0?=
 =?utf-8?B?NFRhQ0p5VXVVRVdMRlJza3JFTlZkT1NOQ3M5NmdaZzI2NjF1VGp3aWM1Y2lX?=
 =?utf-8?B?dnNvNTAySWp5L0pORFBjU1pxcVdqc01rbUhBMHNzdkRKWW5OSlVLTjJ4ZXBl?=
 =?utf-8?B?c25IWmg3eVc2NndwZ2FtZURnTXhaN1VpYlFCeVR0SjhsblpaRURDWTRxY0FW?=
 =?utf-8?B?YUJoWXdlY3FoSDFSOC9WQUxsT2FVYnZTajJsc2x0end4UTJIWFlMNzBIVzZ3?=
 =?utf-8?B?MkRsKzVSU2R2aDYxcUN0dys2L0pFNithRmNtVTAyYURjMlgwWlV2NVErQ3Bu?=
 =?utf-8?B?THg2aExZSys5ZFhuaWlyeHh1NjNWVHFWNElrc3IwSlIwbDVWUXQvZDZHWDVV?=
 =?utf-8?B?NFNzUWk1TjYwK2NhQUIvWHcrTzBmazBFdkxMTmh6Q3Z5TlV0bzg5RjBCN1E5?=
 =?utf-8?B?RlI0Wnh5aU9MdFVTMTdaVjZvNnZOaGhobEd3OEdlTU0xVlpUdHhYZElKb2ZY?=
 =?utf-8?B?N3NyZnVocTJRYkZVOFR1UzRFNXJRL2FZQ3Q5SncyMGdxcnRQaEZHcVAxVXIv?=
 =?utf-8?B?bGFVODZzSTI3aFdQYzlGYi9TR1lMSk1Xb3kwdWJxTWo2TlBkWHExTE50bys4?=
 =?utf-8?B?YW1UbFBMRFY5c3JMMzljTER2Y1N3R3pLTWQ2RUJ2RUdIeWlHb0ErampxQXZN?=
 =?utf-8?B?U2MzNTVFaExuTWxaeXl3MHl0bGU2Z0h4dzE3SS95U0Z3S3ZHcGdiSFhrQjRU?=
 =?utf-8?B?SmlSMnRKYkhXS09adzk3M3YvL20vaWRtZ3YrOUtMS0cveW9WTFNrUW9EQmZy?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221648e6-f4cc-4f93-8deb-08de0716918b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 09:31:04.9681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZM15ZF+FH4yDqjH36qLPRyhFh9/jD1tyuQpqmxxUVLdz7S9oIeIRAyqkCPtJdCaI3tqd/qPJhJOAKCu1VedvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5563
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 09:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224609

--------------a7ULjiBH6owrCB0kuoQJTVAe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 08.10.2025 um 13:01 schrieb Gyorgy Sarvari:
> On 10/7/25 16:59, Stefan Herbrechtsmeier wrote:
>> Am 03.10.2025 um 23:30 schrieb Gyorgy Sarvari via lists.openembedded.org:
>>> Cargo.toml files usually contain a list of dependencies in one of two forms:
>>> either a crate name that can be fetched from some registry (like crates.io), or
>>> as a source crate, which is most often fetched from a git repository.
>>>
>>> Normally cargo handles fetching the crates from both the registry and from git,
>>> however with Yocto this task is taken over by Bitbake.
>>>
>>> After fetching these crates, they are made available to cargo by adding the location
>>> to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
>>> that can be found in the SRC_URI is added as one source crate.
>>>
>>> This works most of the time, as long as the repository really contains one crate only.
>>>
>>> However in case the repository is a cargo workspace, it contains multiple crates in
>>> different subfolders, and in order to allow cargo to process them, they need to be
>>> listed separately. This is not happening with the current implementation of cargo_common.
>>>
>>> This change introduces the following:
>>> - instead of patching the dependencies, use source replacement (the primary motivation for
>>>     this was that maturin seems to ignore source crate patches from config.toml)
>>> - the above also allows to keep the original Cargo.lock untouched (the original implementation
>>>     deleted git repository lines from it)
>>> - it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
>>>     the separate crate folders are copied into this folder, and it is used as the central
>>>     vendoring folder. This is needed for source replacements: the folder that is used for
>>>     vendoring needs to contain the crates separately, one crate in one folder. Each folder
>>>     has the name of the crate that it contains. Workspaces are not included here (unless the
>>>     given manifest is a workspace AND a package at once)
>>> - previuosly the SRC_URI had to contain a "name" and a "destsuffix" parameter to be considered
>>>     to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
>>>     Having destsuffix is still mandatory though.
>>>
>>> The change does not handle nested workspaces, only the top level Cargo.toml is processed.
>> I use a similar approach for my Cargo.lock fetcher. In my case the code
>> finds the crate on the fly inside the a git repository because the
>> Cargo.lock doesn't contain the subpath.
> By any chance, did you manage to solve the workspace problem? If you
> have a working solution, feel free to submit it, I wouldn't mind if I
> wouldn't have to debug mine :D
I haven't test a workspace project. Do you have an example project?

>
>>> Signed-off-by: Gyorgy Sarvari<skandigraun@gmail.com>
>>> Cc: Tom Geelen<t.f.g.geelen@gmail.com>
>>>
>>> ---
>>>    meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
>>>    1 file changed, 108 insertions(+), 50 deletions(-)
>>>
>>> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
>>> index c9eb2d09a5..79c1351298 100644
>>> --- a/meta/classes-recipe/cargo_common.bbclass
>>> +++ b/meta/classes-recipe/cargo_common.bbclass
>>> @@ -129,6 +129,44 @@ cargo_common_do_configure () {
>>>    python cargo_common_do_patch_paths() {
>>>        import shutil
>>>    
>>> +    def is_rust_crate_folder(path):
>>> +        cargo_toml_path = os.path.join(path, 'Cargo.toml')
>>> +        return os.path.exists(cargo_toml_path)
>>> +
>>> +    def load_toml_file(toml_path):
>>> +        import tomllib
>>> +        with open(toml_path, 'rb') as f:
>>> +            toml = tomllib.load(f)
>>> +        return toml
>>> +
>>> +    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
>>> +        for lf_repo in lockfile_repos.keys():
>>> +            if repo in lf_repo and lf_repo.endswith(revision):
>> Does this works if the URL contains a "rev" query parameter? This
>> happens if the same git repository is used with different revisions.
> I *think* yes, since I query the revision from the fetcher, instead of
> parsing it myself (and I use both the repo and revision for matching the
> cargo.lock repos). But will test it specifically, and make it work if it
> wouldn't work out of the box. Thanks for calling my attention on this.
The problem is that the source replacement key contains a query 
parameter. The query isn't supported by the git fetcher. That means you 
have to remove the query from the SRC_URI but add it back in the source 
entry in the config.toml.

>>> +                lockfile_repos[lf_repo] = True
>>> +                return lf_repo.split("#")[0]
>>> +        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
>>> +
>>> +    def create_cargo_checksum(folder_path):
>>> +        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
>>> +        if os.path.exists(checksum_path):
>>> +            return
>>> +
>>> +        import hashlib, json
>>> +
>>> +        checksum = {'files': {}}
>>> +        for root, _, files in os.walk(folder_path):
>>> +            for f in files:
>>> +                full_path = os.path.join(root, f)
>>> +                relative_path = os.path.relpath(full_path, folder_path)
>>> +                if relative_path.startswith(".git/"):
>>> +                    continue
>>> +                with open(full_path, 'rb') as f2:
>>> +                    file_sha = hashlib.sha256(f2.read()).hexdigest()
>>> +                checksum["files"][relative_path] = file_sha
>> Do we really need the calculation of the checksum?
> For source replacement AFAIK it is mandatory, otherwise cargo complains.
> (But I'd be happy to stand corrected)
Have you test an empty dictionary for "files" and NULL for "package"?

>>> +
>>> +        with open(checksum_path, 'w') as f:
>>> +            json.dump(checksum, f)
>>> +
>>>        cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config.toml")
>>>        if not os.path.exists(cargo_config):
>>>            return
>>> @@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
>>>        if len(src_uri) == 0:
>>>            return
>>>    
>>> -    patches = dict()
>>> +    lockfile = d.getVar("CARGO_LOCK_PATH")
>>> +    if not os.path.exists(lockfile):
>>> +        bb.fatal(f"{lockfile} file doesn't exist")
>>> +
>>> +    lockfile = load_toml_file(lockfile)
>>> +
>>> +    # key is the repo url, value is a boolean, which is used later
>>> +    # to indicate if there is a matching repository in SRC_URI also
>>> +    lockfile_git_repos = {}
>>> +    for p in lockfile['package']:
>>> +        if 'source' in p and p['source'].startswith('git+'):
>>> +            lockfile_git_repos[p['source']] = False
>>> +
>>> +    sources = dict()
>>>        workdir = d.getVar('UNPACKDIR')
>>>        fetcher = bb.fetch2.Fetch(src_uri, d)
>>> +
>>> +    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
>>> +
>>> +    os.makedirs(vendor_folder)
>>> +
>>>        for url in fetcher.urls:
>>>            ud = fetcher.ud[url]
>>> -        if ud.type == 'git' or ud.type == 'gitsm':
>>> -            name = ud.parm.get('name')
>>> -            destsuffix = ud.parm.get('destsuffix')
>>> -            if name is not None and destsuffix is not None:
>>> -                if ud.user:
>>> -                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>>> -                else:
>>> -                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>> -                path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
>>> -                patches.setdefault(repo, []).append(path)
>>> +        if ud.type != 'git' and ud.type != 'gitsm':
>>> +            continue
>>>    
>>> -    with open(cargo_config, "a+") as config:
>>> -        for k, v in patches.items():
>>> -            print('\n[patch."%s"]' % k, file=config)
>>> -            for name in v:
>>> -                print(name, file=config)
>>> +        destsuffix = ud.parm.get('destsuffix')
>>> +        crate_folder = os.path.join(workdir, destsuffix)
>>>    
>>> -    if not patches:
>>> -        return
>>> +        if destsuffix is None or not is_rust_crate_folder(crate_folder):
>>> +            continue
>>>    
>>> -    # Cargo.lock file is needed for to be sure that artifacts
>>> -    # downloaded by the fetch steps are those expected by the
>>> -    # project and that the possible patches are correctly applied.
>>> -    # Moreover since we do not want any modification
>>> -    # of this file (for reproducibility purpose), we prevent it by
>>> -    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
>>> -    # here is better than letting cargo tell (in case the file is missing)
>>> -    # "Cargo.lock should be modified but --frozen was given"
>>> +        if ud.user:
>>> +            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>>> +        else:
>>> +            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>>    
>>> -    lockfile = d.getVar("CARGO_LOCK_PATH")
>>> -    if not os.path.exists(lockfile):
>>> -        bb.fatal(f"{lockfile} file doesn't exist")
>>> +        sources[destsuffix] = (repo, ud.revision, crate_folder)
>>> +
>>> +        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
>>> +        cargo_toml = load_toml_file(cargo_toml_path)
>>> +
>>> +        if 'workspace' in cargo_toml:
>>> +            members = cargo_toml['workspace']['members']
>>> +            for member in members:
>>> +                member_crate_folder = os.path.join(workdir, destsuffix, member)
>>> +                member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
>>> +                member_cargo_toml = load_toml_file(member_crate_cargo_toml)
>>> +                member_crate_name = member_cargo_toml['package']['name']
>>> +                shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
>>> +
>>> +        if 'package' in cargo_toml:
>>> +            crate_folder = os.path.join(workdir, destsuffix)
>>> +            crate_name = cargo_toml['package']['name']
>>> +            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
>>> +
>>> +    for d in os.scandir(vendor_folder):
>>> +        if d.is_dir():
>>> +            create_cargo_checksum(d.path)
>>> +
>>> +
>>> +    with open(cargo_config, "a+") as config:
>>> +        print('\n[source."yocto-vendored-sources"]', file=config)
>>> +        print('directory = "%s"' % vendor_folder, file=config)
>>> +
>>> +        for destsuffix, (repo, revision, repo_path) in sources.items():
>>> +            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
>>> +            print('\n[source."%s"]' % lockfile_repo, file=config)
>>> +            print('git = "%s"' % repo, file=config)
>>> +            print('rev = "%s"' % revision, file=config)
>>> +            print('replace-with = "yocto-vendored-sources"', file=config)
>>> +
>>> +    # check if there are any git repos in the lock file that were not visited
>>> +    # in the previous loop, when the source replacement was created, and warn about it
>>> +    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
>>> +        if not found_in_src_uri:
>>> +            bb.warn(f"{lf_repo} is present in lockfile, but not found in SRC_URI")
>>>    
>>> -    # There are patched files and so Cargo.lock should be modified but we use
>>> -    # --frozen so let's handle that modifications here.
>>> -    #
>>> -    # Note that a "better" (more elegant ?) would have been to use cargo update for
>>> -    # patched packages:
>>> -    #  cargo update --offline -p package_1 -p package_2
>>> -    # But this is not possible since it requires that cargo local git db
>>> -    # to be populated and this is not the case as we fetch git repo ourself.
>>> -
>>> -    lockfile_orig = lockfile + ".orig"
>>> -    if not os.path.exists(lockfile_orig):
>>> -        shutil.copy(lockfile, lockfile_orig)
>>> -
>>> -    newlines = []
>>> -    with open(lockfile_orig, "r") as f:
>>> -        for line in f.readlines():
>>> -            if not line.startswith("source = \"git"):
>>> -                newlines.append(line)
>>> -
>>> -    with open(lockfile, "w") as f:
>>> -        f.writelines(newlines)
>>>    }
>>> +
>>>    do_configure[postfuncs] += "cargo_common_do_patch_paths"
>>>    
>>>    do_compile:prepend () {
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#224426):https://lists.openembedded.org/g/openembedded-core/message/224426
>>> Mute This Topic:https://lists.openembedded.org/mt/115578466/6374899
>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [stefan.herbrechtsmeier-oss@weidmueller.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
--------------a7ULjiBH6owrCB0kuoQJTVAe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 08.10.2025 um 13:01 schrieb Gyorgy
      Sarvari:<br>
    </div>
    <blockquote type="cite" cite="mid:049f87a6-2e45-43b2-b04a-7b96e6cdb096@gmail.com">
      <pre wrap="" class="moz-quote-pre">On 10/7/25 16:59, Stefan Herbrechtsmeier wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Am 03.10.2025 um 23:30 schrieb Gyorgy Sarvari via lists.openembedded.org:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Cargo.toml files usually contain a list of dependencies in one of two forms:
either a crate name that can be fetched from some registry (like crates.io), or
as a source crate, which is most often fetched from a git repository.

Normally cargo handles fetching the crates from both the registry and from git,
however with Yocto this task is taken over by Bitbake.

After fetching these crates, they are made available to cargo by adding the location
to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
that can be found in the SRC_URI is added as one source crate.

This works most of the time, as long as the repository really contains one crate only.

However in case the repository is a cargo workspace, it contains multiple crates in
different subfolders, and in order to allow cargo to process them, they need to be
listed separately. This is not happening with the current implementation of cargo_common.

This change introduces the following:
- instead of patching the dependencies, use source replacement (the primary motivation for
   this was that maturin seems to ignore source crate patches from config.toml)
- the above also allows to keep the original Cargo.lock untouched (the original implementation
   deleted git repository lines from it)
- it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
   the separate crate folders are copied into this folder, and it is used as the central
   vendoring folder. This is needed for source replacements: the folder that is used for
   vendoring needs to contain the crates separately, one crate in one folder. Each folder
   has the name of the crate that it contains. Workspaces are not included here (unless the
   given manifest is a workspace AND a package at once)
- previuosly the SRC_URI had to contain a &quot;name&quot; and a &quot;destsuffix&quot; parameter to be considered
   to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
   Having destsuffix is still mandatory though.

The change does not handle nested workspaces, only the top level Cargo.toml is processed.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">I use a similar approach for my Cargo.lock fetcher. In my case the code 
finds the crate on the fly inside the a git repository because the 
Cargo.lock doesn't contain the subpath.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
By any chance, did you manage to solve the workspace problem? If you
have a working solution, feel free to submit it, I wouldn't mind if I
wouldn't have to debug mine :D</pre>
    </blockquote>
    I haven't test a workspace project. Do you have an example project?<br>
    <br>
    <blockquote type="cite" cite="mid:049f87a6-2e45-43b2-b04a-7b96e6cdb096@gmail.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Signed-off-by: Gyorgy Sarvari <a class="moz-txt-link-rfc2396E" href="mailto:skandigraun@gmail.com">&lt;skandigraun@gmail.com&gt;</a>
Cc: Tom Geelen <a class="moz-txt-link-rfc2396E" href="mailto:t.f.g.geelen@gmail.com">&lt;t.f.g.geelen@gmail.com&gt;</a>

---
  meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
  1 file changed, 108 insertions(+), 50 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index c9eb2d09a5..79c1351298 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -129,6 +129,44 @@ cargo_common_do_configure () {
  python cargo_common_do_patch_paths() {
      import shutil
  
+    def is_rust_crate_folder(path):
+        cargo_toml_path = os.path.join(path, 'Cargo.toml')
+        return os.path.exists(cargo_toml_path)
+
+    def load_toml_file(toml_path):
+        import tomllib
+        with open(toml_path, 'rb') as f:
+            toml = tomllib.load(f)
+        return toml
+
+    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
+        for lf_repo in lockfile_repos.keys():
+            if repo in lf_repo and lf_repo.endswith(revision):
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Does this works if the URL contains a &quot;rev&quot; query parameter? This 
happens if the same git repository is used with different revisions.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I *think* yes, since I query the revision from the fetcher, instead of
parsing it myself (and I use both the repo and revision for matching the
cargo.lock repos). But will test it specifically, and make it work if it
wouldn't work out of the box. Thanks for calling my attention on this.</pre>
    </blockquote>
    The problem is that the source replacement key contains a query
    parameter. The query isn't supported by the git fetcher. That means
    you have to remove the query from the SRC_URI but add it back in the
    source entry in the config.toml.<br>
    <br>
    <blockquote type="cite" cite="mid:049f87a6-2e45-43b2-b04a-7b96e6cdb096@gmail.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+                lockfile_repos[lf_repo] = True
+                return lf_repo.split(&quot;#&quot;)[0]
+        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
+
+    def create_cargo_checksum(folder_path):
+        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
+        if os.path.exists(checksum_path):
+            return
+
+        import hashlib, json
+
+        checksum = {'files': {}}
+        for root, _, files in os.walk(folder_path):
+            for f in files:
+                full_path = os.path.join(root, f)
+                relative_path = os.path.relpath(full_path, folder_path)
+                if relative_path.startswith(&quot;.git/&quot;):
+                    continue
+                with open(full_path, 'rb') as f2:
+                    file_sha = hashlib.sha256(f2.read()).hexdigest()
+                checksum[&quot;files&quot;][relative_path] = file_sha
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Do we really need the calculation of the checksum?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For source replacement AFAIK it is mandatory, otherwise cargo complains.
(But I'd be happy to stand corrected)</pre>
    </blockquote>
    Have you test an empty dictionary for &quot;files&quot; and NULL for
    &quot;package&quot;?<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:049f87a6-2e45-43b2-b04a-7b96e6cdb096@gmail.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+
+        with open(checksum_path, 'w') as f:
+            json.dump(checksum, f)
+
      cargo_config = os.path.join(d.getVar(&quot;CARGO_HOME&quot;), &quot;config.toml&quot;)
      if not os.path.exists(cargo_config):
          return
@@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
      if len(src_uri) == 0:
          return
  
-    patches = dict()
+    lockfile = d.getVar(&quot;CARGO_LOCK_PATH&quot;)
+    if not os.path.exists(lockfile):
+        bb.fatal(f&quot;{lockfile} file doesn't exist&quot;)
+
+    lockfile = load_toml_file(lockfile)
+
+    # key is the repo url, value is a boolean, which is used later
+    # to indicate if there is a matching repository in SRC_URI also
+    lockfile_git_repos = {}
+    for p in lockfile['package']:
+        if 'source' in p and p['source'].startswith('git+'):
+            lockfile_git_repos[p['source']] = False
+
+    sources = dict()
      workdir = d.getVar('UNPACKDIR')
      fetcher = bb.fetch2.Fetch(src_uri, d)
+
+    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
+
+    os.makedirs(vendor_folder)
+
      for url in fetcher.urls:
          ud = fetcher.ud[url]
-        if ud.type == 'git' or ud.type == 'gitsm':
-            name = ud.parm.get('name')
-            destsuffix = ud.parm.get('destsuffix')
-            if name is not None and destsuffix is not None:
-                if ud.user:
-                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
-                else:
-                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
-                path = '%s = { path = &quot;%s&quot; }' % (name, os.path.join(workdir, destsuffix))
-                patches.setdefault(repo, []).append(path)
+        if ud.type != 'git' and ud.type != 'gitsm':
+            continue
  
-    with open(cargo_config, &quot;a+&quot;) as config:
-        for k, v in patches.items():
-            print('\n[patch.&quot;%s&quot;]' % k, file=config)
-            for name in v:
-                print(name, file=config)
+        destsuffix = ud.parm.get('destsuffix')
+        crate_folder = os.path.join(workdir, destsuffix)
  
-    if not patches:
-        return
+        if destsuffix is None or not is_rust_crate_folder(crate_folder):
+            continue
  
-    # Cargo.lock file is needed for to be sure that artifacts
-    # downloaded by the fetch steps are those expected by the
-    # project and that the possible patches are correctly applied.
-    # Moreover since we do not want any modification
-    # of this file (for reproducibility purpose), we prevent it by
-    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
-    # here is better than letting cargo tell (in case the file is missing)
-    # &quot;Cargo.lock should be modified but --frozen was given&quot;
+        if ud.user:
+            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
+        else:
+            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
  
-    lockfile = d.getVar(&quot;CARGO_LOCK_PATH&quot;)
-    if not os.path.exists(lockfile):
-        bb.fatal(f&quot;{lockfile} file doesn't exist&quot;)
+        sources[destsuffix] = (repo, ud.revision, crate_folder)
+
+        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
+        cargo_toml = load_toml_file(cargo_toml_path)
+
+        if 'workspace' in cargo_toml:
+            members = cargo_toml['workspace']['members']
+            for member in members:
+                member_crate_folder = os.path.join(workdir, destsuffix, member)
+                member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
+                member_cargo_toml = load_toml_file(member_crate_cargo_toml)
+                member_crate_name = member_cargo_toml['package']['name']
+                shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
+
+        if 'package' in cargo_toml:
+            crate_folder = os.path.join(workdir, destsuffix)
+            crate_name = cargo_toml['package']['name']
+            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
+
+    for d in os.scandir(vendor_folder):
+        if d.is_dir():
+            create_cargo_checksum(d.path)
+
+
+    with open(cargo_config, &quot;a+&quot;) as config:
+        print('\n[source.&quot;yocto-vendored-sources&quot;]', file=config)
+        print('directory = &quot;%s&quot;' % vendor_folder, file=config)
+
+        for destsuffix, (repo, revision, repo_path) in sources.items():
+            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
+            print('\n[source.&quot;%s&quot;]' % lockfile_repo, file=config)
+            print('git = &quot;%s&quot;' % repo, file=config)
+            print('rev = &quot;%s&quot;' % revision, file=config)
+            print('replace-with = &quot;yocto-vendored-sources&quot;', file=config)
+
+    # check if there are any git repos in the lock file that were not visited
+    # in the previous loop, when the source replacement was created, and warn about it
+    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
+        if not found_in_src_uri:
+            bb.warn(f&quot;{lf_repo} is present in lockfile, but not found in SRC_URI&quot;)
  
-    # There are patched files and so Cargo.lock should be modified but we use
-    # --frozen so let's handle that modifications here.
-    #
-    # Note that a &quot;better&quot; (more elegant ?) would have been to use cargo update for
-    # patched packages:
-    #  cargo update --offline -p package_1 -p package_2
-    # But this is not possible since it requires that cargo local git db
-    # to be populated and this is not the case as we fetch git repo ourself.
-
-    lockfile_orig = lockfile + &quot;.orig&quot;
-    if not os.path.exists(lockfile_orig):
-        shutil.copy(lockfile, lockfile_orig)
-
-    newlines = []
-    with open(lockfile_orig, &quot;r&quot;) as f:
-        for line in f.readlines():
-            if not line.startswith(&quot;source = \&quot;git&quot;):
-                newlines.append(line)
-
-    with open(lockfile, &quot;w&quot;) as f:
-        f.writelines(newlines)
  }
+
  do_configure[postfuncs] += &quot;cargo_common_do_patch_paths&quot;
  
  do_compile:prepend () {

-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#224426): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/224426">https://lists.openembedded.org/g/openembedded-core/message/224426</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115578466/6374899">https://lists.openembedded.org/mt/115578466/6374899</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------a7ULjiBH6owrCB0kuoQJTVAe--

