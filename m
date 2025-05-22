Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959A6C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:31:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.54])
 by mx.groups.io with SMTP id smtpd.web11.22903.1747917108415428879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=m1tFRw5j;
 spf=pass (domain: cherry.de, ip: 40.107.20.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liNfjOaDUJ2H3UEpVZNxlOAF3fnK3rRPhKZ9Twnl2zCnxv+oa26g0kldl4BBTurkknfKFNbbdpVTbAYDSuOKqz64q+6o6ys0k01o2HbYPwGzfLsnVRNe2ZJaeloZHisU1wfL0qEEZZZqhTpDQ7IsT4PK1lkP+76h1Ijh5i3fDUw2kMqrhSO8bghw52NPxCdGXtWiRXGYFZxXM/RELCi1chkJsX7rCbAPSj2o5mnDb5ENImVO0o0mSEQBuY3XpSoWtOJfN49B/4dSxzxueCml7OCEh/cMhNbQ7DL9VbeJq5cI9oZPuU1U/Q1UeNGhYaX/EVkCq/Ye8thEeGizkQhs6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+Ck8P5pIaI7sGLRS0Zs6e52XbRNtwBLN21XTGJe6Z8=;
 b=Vhl/0iaHAfOxxhwwxSAMHZhHX5ngzf67IPusOGZj7AZ0spZVYJdVInqIgl7imhKH6pSTj7mm9FkjkDrRUYoc9mJv+rJzLzq+7Y5noZGAuop6x+t8BlFthw31KSLsO2FAJQ8j3VhESlzKoa6PQsFx7g92geb+6OjLnv5dO1pZQ9VuYypoJ+2mGzngoaubie1cTQbzxR/OmxqZ60qS3+Zet1iAAjqxacutQJP5TL1zCw89o7KmNZTT9VZrV+gIKN8AwBZGY7/mbNSCo89eOJHKF5fzobC/KzY4yGLHIh7S6A/9IvZlBJSbXQyMtNQWhPc36+3XcFbi37K1hupvUUwZ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+Ck8P5pIaI7sGLRS0Zs6e52XbRNtwBLN21XTGJe6Z8=;
 b=m1tFRw5jAOrrRIEVxUVbt1aoZm7omn9+askeZ7PBuZZR4rl+VBu+cGpmfZdMFZRMEi7lcyk+eSuzqJll3UBNg71NHI3xK8D9uui6NaYjsYk/eGDTn2mKZ5kuprJwf3SLqR+XLyc5bij5j7mnMRVvvurSHlUBu9C0IuFScVEYERI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 12:31:45 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 12:31:45 +0000
Message-ID: <5bae0922-e589-4b92-bb8c-258b0fcf405a@cherry.de>
Date: Thu, 22 May 2025 14:31:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] rust: remove file-native DEPENDS
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20250521191449.1486927-1-ross.burton@arm.com>
 <20250521191449.1486927-3-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250521191449.1486927-3-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0262.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::35) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ac5dd9-7558-4b54-0757-08dd992c9d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ay9SZHhVTVBHd1FpVlJyR2piRmRReHV2QytLODVQQjdUM0JPNWVtUDFZemNT?=
 =?utf-8?B?Y0liZ2VJVDN4bzBJNTEwWDlhM2N2Y1E3TCt2R3hsVStQRGVnK2EzQjJ5L0FW?=
 =?utf-8?B?bnFvSjRvLzdVZ0V5UUhUZGFRSGluRFhPUHJ4MzRVT2lMMHk3cHd1V0tEQzNB?=
 =?utf-8?B?NzNMcE1DYVdtSkFUNHVQQ09FME5zc3o3QlRMb0xHTHhubk5za3cwY2hvcitP?=
 =?utf-8?B?QWthS2tRaFU2ZjdwZDI4TzFPM09PcUNXYzNLQnVVbENISG5RRDl3MmlLS0Fm?=
 =?utf-8?B?ZXY0UldLYjE4R1J2VHpFbHR1bHFkUm43THZSM2RvTnBpdDFyaXZlSzB4VlJp?=
 =?utf-8?B?UGE1MTV0c25JUWVkWWhxWGpISXovc3FyMUpBdnpnNE53YkFOeTQxWkx3cFkv?=
 =?utf-8?B?akxpMG4zTm1yZ042VFFlWGF0QlAreVhRRWZOckNldTdESDU2bjJrQmhRV3ZN?=
 =?utf-8?B?OTdFVVFtYWl5UXM0U3BMNW9kaEJkRXllUmN4QzRNSlhiOElrYzNJbFlBQU44?=
 =?utf-8?B?WmJ2UDFCTzNZU0hwV3NNWXIyNjExRlgyZDNtYkZTMW1qUW1LUjdlZk9qTVRa?=
 =?utf-8?B?SmFyK1J0WGljU1laL25GSzdPK1dlNzRGVDJsUmhZZzBSRk4xaU1DdTdQaU5W?=
 =?utf-8?B?bkxuemhtYWFRbU4yWUt5U2lmMjRkNjFHSy95ckVYQ3Z0M1BYWmVxQkN6d3p5?=
 =?utf-8?B?MXlFRGM5NVlBelRHM3piZkhUbHQrSXBZT0ZUNFVHZUMrdTUzdTZpU2MzUXhG?=
 =?utf-8?B?VERJc1R5K3V3eEg0aGtrL25zbk5XNXFxOTRpTWYwNVZZR2RWQUw0Zm5DUTk1?=
 =?utf-8?B?L0xDREd5dGRpWnJRY0JSejFOQVM1QWRSaHhoTSt1UUQyWWNvOUN5dXNFL050?=
 =?utf-8?B?ejN4NVVOWmw5c2lmSGMrcUdTcmxjSTd1a3RCdjcvNStGeXpQQkZyMUFqQUpx?=
 =?utf-8?B?Wi9hYzcwQWdwTUcvWDVmZkQ4eUMxZUJUL3NlK21qZnU2VE82V1Bxb2lWeWtm?=
 =?utf-8?B?K1lSZVpMdnp1V0NnRGVRdmVXWG9OMVFkd3llVk02SGhSM0VQN3JyV3hJOTdi?=
 =?utf-8?B?aTA3K0I3QkVIQ2JhbVpVZzlSN09iTFgvRE9vbUFqZCsvWmU3VTlRUGxQaUIy?=
 =?utf-8?B?aFZVb0J4bGlSMmZPaldWcjRvTEhIVUJpaTR6QzQxbUdwTU50aU9USFZmanVx?=
 =?utf-8?B?RnU0Q1RSam9OTUJaUzZoZkJmZ1NEZkNjSi9OTmUyMVVLR2FnU3FVMzI4Z2tB?=
 =?utf-8?B?YmdTaUg3czJyb1Y0K1pGdkZFUWVxZmhlMDZ1dkpKeHovM1dOeW9EMW5KeEho?=
 =?utf-8?B?YzF2ZHFyUmVBUWJiRjRvVzRNQmNvS0ZKNHZuRWhtMStVdVZmYnlmTFpvb1cv?=
 =?utf-8?B?SSsxcDRTeTVXam9GVnJ3VUNvaW9DQlZabzdBWFdLYndIa3RVSjdodGlZTmc2?=
 =?utf-8?B?QnI0enVQK0dReGErZWdrWkJNZHdpZ1VvbkFiNW1SMjNTaWRBMnJpdXVDdGJo?=
 =?utf-8?B?cTlDM1huanFRRnd5S1czYjBUU1F1ak1ibFluQTdZU0x0Y28waGZCZzVqaTg3?=
 =?utf-8?B?M0NVRVEyZjAxc2FuOXZKRHZhMytTeitPSVpBVjZyUDg2djdzaWtEODJ5YmY2?=
 =?utf-8?B?RzlZaE5HOHlOSHhTR3lkTng0WEs5L0pCWDVLdEE4bU1icDkxbTQ1VjlqSjUw?=
 =?utf-8?B?V0xFcEMyRHhLNzBRbEIzdjQyVFBmRFZZVExIejB1RmhFN2FHMzRUbXk4UHo1?=
 =?utf-8?B?bE1lMFYzalNlZEV2cmc2Vk9hdlRDUitZdEI4bUNGcW0xWkZTKzQ5NUE4K0Zi?=
 =?utf-8?B?SHdtbUQ1OUdjT3BPRGQrSk9ka3E3SFFWNVYyaG1UZ1pGb1VydDB3eUozM3kx?=
 =?utf-8?B?MkMwcTVhOWt6aUxvKzVrVlNtTDltMVU2OHd3eWN0V3BZbVkrM2h6VUtSY21a?=
 =?utf-8?Q?o985beV1Lew=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MTF2Z3dYS0dBcUhQNVI4c0I2RU1kRkltbzZxRjU1aDVMMkg0RUJHd0tLTWNY?=
 =?utf-8?B?S0FSWjZRZjZlaHhKSXVjKyswbFRpUEhNcEluMGFQay9iazNUWUZKR0VOWXVi?=
 =?utf-8?B?aVRXOVpxZ0F2MW8zOURjRXNMQ1VXYjIvTklqTVk0WGRKNDBtSDM3QnJnV1o1?=
 =?utf-8?B?NTh6cHFlVkhtT00vL3NQZzRvRUxOeGM1ZzN6a2o0U2FxVVQwZWV0UzAvWVoy?=
 =?utf-8?B?UE5DMjRGZjBoVVB6MWJGMk14Snc3S2cyL0JndHBza2FBTlpXRGNQcFVNN21V?=
 =?utf-8?B?WFpjR1F0QVdUek0vRWZxZ2R4OUI4OGZwSU9PblBaaTRTVUFXRGdLQlFzK1Fi?=
 =?utf-8?B?Q1NidENZbHdDZDVRZ1dkNzRpanpSNkdKaUVGNDRvUGN2SkRQczJKZ2JaNFZm?=
 =?utf-8?B?Nm5QdGFOaFU1WW1zQk1MTXc3emF4bTBsTFMxaENHbVBoWFZXaWVtcGc0d0JY?=
 =?utf-8?B?bUVhOWZvOEZnVGNucGRrNXY5TkRzd0R0OGQrd3VDZ1pwYzdsSGluVkZTQTJN?=
 =?utf-8?B?ZGdLK01RTUFPN0hTWEZYNUgxVXJzemVHbk0xUnljVFg1ZDV1TjJGOFhvMFRQ?=
 =?utf-8?B?aW1weDJpOUlZMnFSSEEyQXV2ZzVmMGpGcjV2ZVdMdEZXZTFoVmR4K2Y4V0g0?=
 =?utf-8?B?N21HbHkyVFRLVGUrUXlhVE10cGZXdzhIcHlCLytscTV5M1lHTCs1NDZuaDZ1?=
 =?utf-8?B?Y2xyekg0NzVCY0F3dnJ1dnZGeS9iQ2lXYnpzWTd2clQ0Ynd1c255QmxlUjAr?=
 =?utf-8?B?VTg3OFRVQ1dKVnRPR3kycUhGbE85OFo0bEowVk4vNVVvT3dySW8xYjNGOTJm?=
 =?utf-8?B?SGxNS0IyVi9VRVRoR1p4eEtLenVIOG9NM1RSdXBuWGpTZXhnT0FhOWdGUWxr?=
 =?utf-8?B?M3hvY3BILytWQVZqSVNoZE4vaEZ6WGFHUzBPaU1IdlZydi95Y1dwSHN3dUN1?=
 =?utf-8?B?b2IwZGlkZFhSOGRZNXgrU29BVmRjaldKWC90T01PdjhSSTduWjlkdVNyWG91?=
 =?utf-8?B?SUdPU0NzRVN0RWJQa2xkb201RitjanZYVE5zUzRPeFJGalVsdWNYc0JiemV0?=
 =?utf-8?B?RWxwNVlFZkRwSHoxLys5eDA1Z2NZMWtpL1R5bWtPNU5mNXcwU25td0dSWEtX?=
 =?utf-8?B?QUpvY254eW1FakNpdmw3VjJyK2dUa1JrTVNCc0xlMU9ycVh4NmJWTGhtUmNR?=
 =?utf-8?B?VFpGNFVQWmZuQ3k2c2RFcGhxWUtNMm9tdXc4UStoYUdZUzVMaGhZQkEvZDZR?=
 =?utf-8?B?Z2Fabk5RLzNZMWV1UXc4N3FZYUZzNEQvTy9vZHhhTDJOQjdTbXJadkw5Qis2?=
 =?utf-8?B?N1N3Zk5KYkVxZm80NWVDQzVXMzBVMWJSLzJTaDBOVE1FbVZ4bnZTSk0xeEsv?=
 =?utf-8?B?WUJBLzd1dk9IVitDKzNiMWRrMEdYckovSmx2alFvNXlhU2RYbWN0MEk1WjFP?=
 =?utf-8?B?MWgwRDFtODF3VjhNajZPVWZja0RGZHJRT3B6VkpkZDJKNHVwWTE0V2sveEsy?=
 =?utf-8?B?OFd5Q0VEVlRDai9TRFNFMi9UcEhkUkdmRW1TU1pwdS9lRWgramhrVHlKUUpu?=
 =?utf-8?B?VFB4b0h4VE1XVm1MMlRQMXk1WXdSeWZnM1N0R2cwQ0xwRkF4NE10c2JSMGRy?=
 =?utf-8?B?bGdPaFhYL3MwNGhWQ2h2MDZqMlloMldYcWJSczZCOVRvdHdvazJlKys1WnVk?=
 =?utf-8?B?K1BCMGhKeElCcFhUdktDZWwzRWtDRHpzNTZWdjFEYVlsTUZhRE5oam1SdXFk?=
 =?utf-8?B?ajErWm1WVVBMc2dNaWJXN1VFUjNUYVE0YkRpbGJhbmpEWWM5czMvQ1dlN0JY?=
 =?utf-8?B?cFdsNVBKM3FnWmFxVklmcEZxR3pkc3ZWcS8yMzkxTzVyY3lvR252WEUwcDZk?=
 =?utf-8?B?V2dNU0d6aVZGKzNmUUg4ejcwSENCeGl2VEw3cnEvY2plL3BIRVRzNFpUV3Y1?=
 =?utf-8?B?UVZ5dGxkdC8rNlM1bDR1WGN1dlNseHZoeFd4QWpJZHhNY2FVQnR2bkdCM2pW?=
 =?utf-8?B?TmRtaG1BRGxLMlJyRE5ZQmxJeDNFcTd3MlpNUjZVSHJvQVJyUjN1aFdOa013?=
 =?utf-8?B?eHNvUEw4c2dLYXVNcWIxKzFDSm04NDlrVi9BSUR3emEwVTB6SlkvUGljb21K?=
 =?utf-8?B?enY4LzJGNkVHcWU5K2NrT0daa2J5bGQxZmFXNFY4YWdyK1p5NVVuWGtIZGVC?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ac5dd9-7558-4b54-0757-08dd992c9d08
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:31:45.0027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWItJ+8ztqtYdb/uI6SkJVJiDm3UUMgUP1UzwAdMkLSi1H1yO/vSlu9jlPl1SfCL0DVwqEbvavn3Vk4ie5CiWfM9HLZaIXJKG/fBJkkRax8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217096

Hi Ross,

On 5/21/25 9:14 PM, Ross Burton via lists.openembedded.org wrote:
> It's unclear what this was for: there's no use of "file" or libmagic in
> the recipe, and the guide to building Rust from source doesn't list file
> as a dependency[1].
> 
> [1] https://github.com/rust-lang/rust/blob/master/INSTALL.md#dependencies
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-devtools/rust/rust_1.85.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/rust/rust_1.85.1.bb b/meta/recipes-devtools/rust/rust_1.85.1.bb
> index 6411e43c961..a4a2c69d9d8 100644
> --- a/meta/recipes-devtools/rust/rust_1.85.1.bb
> +++ b/meta/recipes-devtools/rust/rust_1.85.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9c0fae516fe8aaea2fb601db4800daf7"
>   inherit rust
>   inherit cargo_common
>   
> -DEPENDS += "file-native rust-llvm"
> +DEPENDS += "rust-llvm"

Also not sure it's a big issue if missing since file is a dependency of 
OE/BitBake according to the ASSUME_PROVIDED variable in 
meta/conf/bitbake.conf? So being there or not shouldn't change anything?

Cheers,
Quentin

