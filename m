Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5773E77188
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 02:56:33 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.68])
 by mx.groups.io with SMTP id smtpd.web10.12642.1736218583985725891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 18:56:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=bSBKmfb0;
 spf=pass (domain: oss.nxp.com, ip: 40.107.247.68, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nm2eJsylmVXflc68gO8+RXcITfEzmeeIn1xE1ZrjQSmfkWnnC7ij76iM8xkddNfWwroM781hQf+JgUTQc17BPSYXpVCTylsi+oxNed9zOu+K/kPeYqvcvfwFF+T08JRmiBoR1CQxho8q6VX+WH33F+sVWGat6gB/ZNmm9IIknY7JcQFftJjKqfM7Dn3FC6LtDi7yDh8GdGxXqegVs+oj45zIa8tn8BN/tyhxcy8h4vGiPjgDLjyoH2l3WfPA0rETHXK3OzDeeT5ubXq0CxR5Fs4o4xtdC0KnvGD6ISR4pD1BUfPja+V3OmljNLjMLyLpKFmq2sxV/e9S8ya0ztLnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bc7Yu+scH5T0WbS7sP0WxugEM7XjXIXKC5SRZrR1VzY=;
 b=szalgDubZRmeoiT1js8qJ6QNvZJRnJFplekGgVxouOf60ifTYbRHAon/st2bK9R2PV/T0BjYEgOv5KNp81zpnfv4VS2PSRgIbcbDJpxwPZ0PGw6BGigCsF2NYbylKTN/0xKQbsSfP3K+9qMDnjdtb+xDdEeCt3s+ZJ/PHG3XacVDP2YSP7AVVcsV3HnHIiLH7D0gOVfTfMl/Eu15d2T41hOj8BtlSqzfX4xYcxIA2cxBPMPQam0Ypimqf3Va/0b01TvddN2bvtVu8ewnsyXivVSiNqn6ZGnFk8X8PKVPoOtySylsc3D4gxcTMWX3ODMT2JKNdBn8VsAYQuz4ldQptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bc7Yu+scH5T0WbS7sP0WxugEM7XjXIXKC5SRZrR1VzY=;
 b=bSBKmfb0apcUT7kBG7qFPmxKrS0OCmqYH3BYpmMMY4wRddE5mckwOtcuOkV0Uh+Jhc/tjhsjgySOrNv2NffCTqLsst6GiTePP6G+cs/t1w90G+oZ+FlIZc4yMxhk9qk4N3EpZNWyNAaIxl3lqyhcUF8BfRJ4XcVk4pg0UjolA5u/VW8iJyHHwTNP6lZ3D3a3F82KmXuZ0fMBXmxXLgwegQTNuxZ1vyimN9w/g/Luf/U5RBKn+uOBOO1BZDItBtul2v3DQHiyWR/n2eFkEJeQwP3eLM63qTXcNK69FIf9rX8zajqm1EmnKm/s3Uz60aPHolQsRTpxHLjhI8ZM6PPnAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM8PR04MB7426.eurprd04.prod.outlook.com (2603:10a6:20b:1d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 02:56:20 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%3]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 02:56:19 +0000
Message-ID: <7089f684-8414-42ba-8a31-76233da0e295@oss.nxp.com>
Date: Mon, 6 Jan 2025 20:56:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 5/5] mesa: Fix missing GLES3 headers in SDK
 sysroot
To: openembedded-core@lists.openembedded.org
References: <20241223200456.2504683-1-tom.hochstein@oss.nxp.com>
 <1813E70C807D6D62.28262@lists.openembedded.org>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <1813E70C807D6D62.28262@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:a03:180::22) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM8PR04MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: deadf4ea-1d15-4013-c3ff-08dd2ec6dc65
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RFNndHlUZzFtODkzbGZSZFFjak1GOGhjSnRGZS9DM01xcktVWGxzNllTczY5?=
 =?utf-8?B?MEpVcmFaOWx5TmZySWQ1OGh2bVkvWlFleFdkbXhvbFhaNnh0M0VjOFFFT0NC?=
 =?utf-8?B?YnRCZ3l5OVJTemZubWc3UFVhRk0rNDBycy9QMzA1TE9zdERUMUcrZW42bElW?=
 =?utf-8?B?UXpVSnpUaGpCQWVzanZHb3JRQjRxR1F0SE9EVGgzaGxXdXZ6UjEzYnpEeHN1?=
 =?utf-8?B?dWNqK25xYTY0TGRaVGN5T3kvUHdNL3pmQVM2Q0tIUXZvR1lJZHF2V1FiYUVn?=
 =?utf-8?B?UDQ3MlRKV3hEQUMyOHV6WDFUakVPbWRURzVEMEkybER2UGFzUjd4YzVLK0Jt?=
 =?utf-8?B?MllUYmY1cjBFV0hiT0NNWTkzMElGeFBDcmdDaGF5ZVRnVXBHZDZ0bHI5Y1Jl?=
 =?utf-8?B?c3RrbVRWYmZJbkdPOU0rOXhveUJkS0FMeWZZNDZhS2xseU1YT0ZHUjdVSFRh?=
 =?utf-8?B?NEd3Z05WUWxSNld1Qmd6L2lSWktRL05mOCtzWnZjdCtRNHhzS2ViaWxsN09E?=
 =?utf-8?B?MEFtRFlkR1RaVHNMOTl3SjU3eWRkTXhjL0NFM1p4K1VUZCtJNndUNEVxY3o4?=
 =?utf-8?B?MHA2akZ3YTRrR1Vra1hoNzJNQWxzZldheUxLay9BVm5IaUZnditXdVNPUWtY?=
 =?utf-8?B?NStKK2NHQ29yZVcySnFIWk1hQWdNN1ZGK0V6RFJkRFJWQ3dUMEI5SStmVFE4?=
 =?utf-8?B?ZVY1YVo2QTZXTlhxRldFL1lDU2hxUE9YU0tad3h2cllkRTJ4K0RCeERtbzRH?=
 =?utf-8?B?d2JnOCtHZmJ6MkdQUFNkNDAvcFVNL0dJQnYzM3hMd3FwaXZsb3lEbDlaOWVD?=
 =?utf-8?B?NmdlMVd1NHZ4UkRicmVrYmNZUzBuRFNUbS8ySjZOcWlsR1kyOXpWK1JPekkz?=
 =?utf-8?B?TjhRQlJ4Q0lNTDBSbWZpMmRRRmxpNWYvY2ZQWDRTejk3TjVreHpFMlhHeU9t?=
 =?utf-8?B?Y2R0d1QwYkVFSmNzdkpESjlZM1FyaWlzTTZFRW81OXFpQlFwOU8xWDVpUjRn?=
 =?utf-8?B?V3BlQVloeEJWcVlLYy9TTWwzaTVLaEVKTy9zb1Z3WFVRek1GSlBkR1RqT2E3?=
 =?utf-8?B?V0MwWTdmSDlDZjF2Qno3dGd3R1BpMnF5NnRNdzZMQUVQUzV6TXFNMUk0cVpN?=
 =?utf-8?B?NURWNXBKYVBxRnRBR0ZXbFNMVUpDMmNxZ0tUc0xjMjUvRld1WlBpcFJOR21F?=
 =?utf-8?B?elVmVTZzSzN4MzBqeW11dWozWEh5akhDb3RnOUM5eEhvY0VSdGVjWGxuZ3Jp?=
 =?utf-8?B?ZkhCbi9NUkxWR2NoU0xNMXBFSWprTVgwQWtuZjNOeGNFRTF2MmFrSi9Qamov?=
 =?utf-8?B?VzVNYlcxbjVWTDJaVkJ0YlZhenNLUUUrMmYyZXNuS3YvcTVJZXJ4MzlTTk1V?=
 =?utf-8?B?WTZqaGY4c04rcWJsdkJLT2JlaFYwRXJJMGRlUSsxZE9ST2hPK1c3ZHZGejE5?=
 =?utf-8?B?ejYzeGtVbTh3Q2oza1hDU3Zodmc3b1dyVTBhZXZYZ1ptQ1ZnR0JXa24rQjZx?=
 =?utf-8?B?TGdGTkovS1ZjbTVuc29QZjlSQ3g5L0NWU2xLNmRIVCtWQS80bVhLSzExYXZx?=
 =?utf-8?B?VVVqTTVJYnZVSWVPRmpOZ0k1cEtCQ1lPNnkvT3FhNTMvWVAvY09PdUFsVU54?=
 =?utf-8?B?ZFJFWDdVOFlXbFBXdlk0WDJ2Wlh2aSt0NXNIVFVnSHdOZ09EWVFLMU9XSlJR?=
 =?utf-8?B?U0VyZjI2RlhtRDYzQzBsOW5yOFpJZFZ1cFhZRnRrd0JPR2lmUkNvbGVaS1ZY?=
 =?utf-8?Q?eBiJIYLplrh+bVk2I5CU+9hkMr6ueW7+rN4VxeB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2N3bUVRMmQ0U0s5dzBNRmJ1UFdVUjR6RmpseVB2N3lJSFBhOW9wQWN1ZFFN?=
 =?utf-8?B?a3UwWVZRd3RWZTRGUXFQZWNhOExxcm4wNXp3R214aTNVVklLdkc2K3VUZFBr?=
 =?utf-8?B?OHplNFB2T3MyUGV6WWhsNnM5QllRZEtSS2pESjZMcWx4WEpqL3BFSzFUTHpU?=
 =?utf-8?B?TSs3ejdIMWRLLzdCWVIrK2VTSkY0RlcrWndpYXRRQUdacEo4VW05QTBjZ0Np?=
 =?utf-8?B?NEsrS0RDcTEwbm42UmZxMSt1ZEZmZG1FMW94ZDhhWHVndHZlS0pqa0VrZWMz?=
 =?utf-8?B?dVlxMFkyMG02R1VxVWtrck1SOFVaOVRRR1FiQUI2TmxxVFNwWnVQSTBodkhC?=
 =?utf-8?B?NnBZTml4ZTlWZTMrbWsxUUNic2hEN0FQeHRCdnRMSUNjMTAwS1pXWWZta2pF?=
 =?utf-8?B?QWZXaXJjdFlvVyttQ3NwQUR5STE5T0lod3NKRTl0TEpFQ1U3S2dMemlRSzNr?=
 =?utf-8?B?Y1dzY05QekZudlVaZ1diWGY5OHJSeGlqb3hJMEQ4M1NVRUowNGJRUGdWNitE?=
 =?utf-8?B?WGkyU1RLN0tLTkpOelEwZU4yT1FLTFFXUGNtR2M5ZkRDek9LYnVlRUxrdlcx?=
 =?utf-8?B?Ly9vczhjcmZhNUR3di9GNVpnZTJMRm9SNXF1Y01Yak5yUzFETloxYSsvT05w?=
 =?utf-8?B?a2I1S0U2aC9CNGJvb1I4bThPeGJyc1F1OWVyZU9hVFloRmJFZlNmVGZVUTRG?=
 =?utf-8?B?M2ZPSkp2V1V6elRmMXh4NEIySmpVOGZCamQ4NkpUZ1paSFRYNzFVWVdUUEp0?=
 =?utf-8?B?ZGh1WG1LV0wrMW40ZDNnLzF4NUFEUDdsdC84c2lyb3phVnRvVjZvUDdZVVN4?=
 =?utf-8?B?eU50ZTlkZ2p2ZE5kS2tSZ0YwYVY1WDFoanM2QzRCK1BQd2JNazBjVG1BeW81?=
 =?utf-8?B?cEVPYTRPUDVzSytVcGoxT21wV1RjQm5CVVY2Z09wU0l6UWxDd0svcmttakVP?=
 =?utf-8?B?VmhDL0pGdDh6Ty9tZDJCUTFmejV3TEdQZ2dicU01R2tZSTVRdzQrdTRwcGoz?=
 =?utf-8?B?ZGhKWWx6Q0lqZG9hczZKcHdjZS9hcEtTcUZwMkl2NjE2RmxCSmxwc3R1aDJR?=
 =?utf-8?B?c1VaWTRSeVU0V29YQjdpbnJMb1MrbHUzQmN6cm45R1IveityeGxwL0NBelVv?=
 =?utf-8?B?V2tINkJwOGFJUlYwSlRENy9ndmhIemdFUVgvK29PdGdHaUk3aFlaS0JXeWhz?=
 =?utf-8?B?SVVzYjZoUU50ZldrL3N6QWF6V1A2MndyTTh6a1BRSGwvak4zbGFzYWN3RE1v?=
 =?utf-8?B?QjlPcGQ3eC93SjhIZC9MR08yOEtsU2hSWHJocGM5NXpIcHVDTEpUMWpiRzdh?=
 =?utf-8?B?NDZYUDlWb2pSaWJVRWxnd1IwNjVQRmdlWld4ZUVlMk52MXNrWWx5MlNSOUVt?=
 =?utf-8?B?T3RxbjV5UDBmZGlkMzBvZWZwL21OQUF0WW9rN2hldGs1UWtBOHhvR2trSEMw?=
 =?utf-8?B?WkUvOVhjSmJjUXFwOFMzUkRiUjJCQnVJNFhTMW1IUzNqTXBYRFd0aHdHbjEw?=
 =?utf-8?B?ZGMwMzFoY0tjZ2R3STdoZk93VmdGTGUyS1ZTS1ZLSCthcFdCbHRYNzZJa08x?=
 =?utf-8?B?VmU0M2Y5UE93QU9YRHhWUVJNU1RZb0lFQ2htanNad0xuNDAwSFFKMS8vbHVv?=
 =?utf-8?B?UlNwamhoWlQzbENCNGczcjdCU3RCRmczU2xkMHRYM0RXZmFXNFd5c0ZBVXhL?=
 =?utf-8?B?citpeXRCSlhCSDhJeWN6VzhpRTlSemZqTDJwcDBHOTFkRzhiVytETnlYdGJZ?=
 =?utf-8?B?c2NPVTNndEkvVFZRSDZ0bmwwakVrdThDL01tOXpZUUJPRXFuanBmZUljTklo?=
 =?utf-8?B?Q0xOeUxtSFk5aXR4WldFcDQyZS93Mm5kTzFKd000aU9DRklSWW8yKytRK2dm?=
 =?utf-8?B?eXhNcG9RMGYrRFM5SzEvY0c5TXliekFyNHVyTjJhTTdkWkhtVU5JWlhxVlh4?=
 =?utf-8?B?aXdmeVl1UUppM0pNZHlKcmZidUNCUElVTTgzREFHLzJ2M25OVlBlV0hrSWxO?=
 =?utf-8?B?OEFqUHQ3Vm4wK2xVTkJFZWd3c3A5UUJraitWcXZGMjliUVRBOEIxZmNuNU9D?=
 =?utf-8?B?UjVuM0Z5WjRnRGlseHRJOTgvVEg5enZsZ3lHNGsxeFNBTEhPbXYxLzBNQ3BI?=
 =?utf-8?B?TjBZV1pLcms4eWRJbU5pQzJtNEI1UmdJbjEzT1JkSFhuM2NlUEJtbFRreUp6?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deadf4ea-1d15-4013-c3ff-08dd2ec6dc65
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 02:56:19.6160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1cl5vBtl+VCVMBhakqIwRVWGqxLLOhCs3HWXBNCBjbacMJDB0lVUIWyT1ipFkTDWBTemo5N5XXwR7JUo3WFdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7426
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 02:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209433

I saw that patches 1-4 are accepted but not this one. Do I need to re-
submit?

Tom

On 12/23/2024 2:04 PM, Tom Hochstein via lists.openembedded.org wrote:
> Building weston with core-image-weston SDK fails:
> ```
> ../libweston/renderer-gl/gl-shader-config-color-transformation.c:29:10: fatal error: GLES3/gl3.h: No such file or directory
>     29 | #include <GLES3/gl3.h>
>        |          ^~~~~~~~~~~~~
> ```
> 
> Both GLES2 and GLES3 implementations are contained in libGLESv2.so.2,
> which is packaged in libgles2-mesa. However, the headers are split
> between libgles2-mesa-dev and libgles3-mesa-dev, which is why the
> GLES3 headers end up missing in the SDK sysroot.
> 
> Add a dependency so the GLES3 headers are properly associated with
> the GLES3 implementation.
> 
> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
> ---
>   meta/recipes-graphics/mesa/mesa.inc | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 9fdf496e8b..b3c595b767 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -233,6 +233,11 @@ DEV_PKG_DEPENDENCY = ""
>   # development package of libgles3.
>   RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
>   
> +# GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
> +# Add a dependency so the GLES3 dev package is associated with its implementation.
> +RDEPENDS:libgles2-mesa += "libgles3-mesa"
> +ALLOW_EMPTY:libgles3-mesa = "1"
> +
>   RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
>   
>   PACKAGES =+ "libegl-mesa libegl-mesa-dev \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209052): https://lists.openembedded.org/g/openembedded-core/message/209052
> Mute This Topic: https://lists.openembedded.org/mt/110262802/3617670
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tom.hochstein@oss.nxp.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


