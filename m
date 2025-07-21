Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAEFC87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 08:26:01 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.4])
 by mx.groups.io with SMTP id smtpd.web11.35657.1753086358743085833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 01:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AHpPAw86;
 spf=pass (domain: cherry.de, ip: 52.101.65.4, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3dpfgWnQKMYFEaptyHdQ/tYF1Dv9K020eHky+71HkzvaspwSa4IYhGCQAXYRQGOoHPdx/dsx2OrIfohsUBg5neYwsN0YK9rdyIytoEm1soc0NyclHvFi5tcBAVllSpl4Md7U/jCJg02qWUpdahmV0zGm91Ux51hG9JpLXXB26cOrTYdAtINtENgoJYhmmwHA+6juEXH6XAzOknbyU/uiD+2URSK3tX50YsWgqM8xd4CwaIc6BV2flMr57lPg038ct0oJfxsR/fRYL6H/PqGh2y8YGyN7t539i4xrvxguSNJovnEw9fnKGtrWNEitC6wGIXFnd6ojsjzDttuPDvsHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmpPWfRZ3cjkKsCVfnUzf1FPM5I7fJ56tXrERnYY18Y=;
 b=HP+FRMvlMDrfnM5c/G9Gworxya+H+cKUE7dz+n0shioJLCis2PhNAoACCyWy0KX51hxtH/n6bA8YDGmoFHGc+DJlUNBS0POslktK0vyHzHJVnfJrJmcePpQ9Fp4HnktH6HelgrIe6hFhd+CgY6CLcgTydmNUZ9yiOpmfrw7Chlbt969j/genpsLLSG1jnxPyfCHyKELlQkBXJOAqF+fRLBsZQG+E9s3rV7kKf/4nUOj37FTK3MIRrdZl7aD8Y4e5TlzCFiEZeTmVdxY/DjWxtO+xJ4UArfXkLHvoya9RjeCIn//ZZeQTHKNYSyN6JrrSjLmX6d1Qv89Qrv6jXRUZug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmpPWfRZ3cjkKsCVfnUzf1FPM5I7fJ56tXrERnYY18Y=;
 b=AHpPAw86J6QB6fXQI3kc2exHbh0KHYzafTLm4NOSqtpir6AAqkLAUnjg7wMc+A7WljCunqWWbLwkQ8ayYCgyNi0KYP1I3xEGnRK/jUWbhw2CJCHxMxr+BGnrGpzONka3j4NDe/jDF3/H1T8JpwbH8wqNHGv6YKHWcJ2A/5EndQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10752.eurprd04.prod.outlook.com (2603:10a6:150:203::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 08:25:51 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 08:25:51 +0000
Message-ID: <fdee61be-8ea3-46df-8292-c912727ec087@cherry.de>
Date: Mon, 21 Jul 2025 10:25:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] tune-cortexa53,tune-cortexa72: Add +nocrypto to
 -mcpu
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
References: <20250721054721.261911-1-raj.khem@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250721054721.261911-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10752:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7f5353-f003-4a30-d5d4-08ddc83033d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QXNOdjE4TU15TThsb3dhNVFjRXRPUitpY2pDK2R0Z1ZwUEtxVzVBUGp0c2dt?=
 =?utf-8?B?WHRHZDFFUFIxWlp4MnZkTmZvcVVRMGUvZW9OczR4TGdmK2ZpYlUwUmpHanoy?=
 =?utf-8?B?WnBPRE50bzljMk8yaWpLNFMvM2gxMnMrbVhkUFNUVUFVaHl2WkdKTWtyUFJi?=
 =?utf-8?B?VndVSUdpaWJNVklFUTNib3NWY2dQZDhCa3ZONTY4clk1emxPZW53emNkMlNU?=
 =?utf-8?B?VUU2WmlKcm1ZZ1d0dmlWbjdTdzIvM1ZDcWFaOFU5VmRaK1J3M2lXcGp5K1JJ?=
 =?utf-8?B?RHp4Q0Z2Um85YVg3VWdRZ3lBUy9ONWpaeGtjM3E4c29aVzRjNk1FRWQwMU4r?=
 =?utf-8?B?dVIwVENtT29NamFFaHRTZG9TSzZ4cXBDZ1J5S05RNHZONGVDalpjR3gwcnZH?=
 =?utf-8?B?dDdJeVFpdUNoNXZ3cnptbWJBMEJ6UlJ4akdzNGcxM21TRW8zTWk3YmNzNWpO?=
 =?utf-8?B?ckwvc0YwTjJiV1JxTUdtZWEyQVBBcS9pRFppakpzUDgwdjN1cU1vVkVsay93?=
 =?utf-8?B?MHlQcWhKdGc1YXQ2Y3pSTXpTL1liUlFma0E4WGVRSGhYdkRsR2Rua2ZkREt4?=
 =?utf-8?B?djdlUGFNRlh0ejVqb3NDS3dXcnFVVTgxWkFvYnd2cFVJMzlHWFNxTm53aHVN?=
 =?utf-8?B?ZmFzbG5nSXd1TGQ4cmhGcUgrbDZlOEV6Q2Z3TTZBa3pBU2dDa0xTaXJLYnJ6?=
 =?utf-8?B?RWhsWGNXR3crd1pGT1dIejVLcXNFM2FCbkRxd2s5RHB0NDhQZnNqN3ZISVBC?=
 =?utf-8?B?Zy8xejlZR1lERkdsY2YwZzgyQi9QNzJJT0xyLzB5NUY1WlJEeGxGM241VSsy?=
 =?utf-8?B?RnlubnI2Ky9MOVNOMkNRK2JvWE11dVFpbmIyVVZXSnZHQXkzMHRBVWQ3R2d5?=
 =?utf-8?B?TEpnT3d6UGF3L0g3MEQ3TU9IMXAwTXYwK05hZFExVmZ2TERQYVpvRTZoSEhW?=
 =?utf-8?B?ejl1aE9sUUxYbW1od2J4VDB3VXBRcGpDbVBKc2ZWSkl2alJwVjJvRTJOcVRo?=
 =?utf-8?B?a2hCY1U5VE5Rd3hTSXZ1eXBBUXpkeW9uZ2lnUHJTTHUvaC9pQklkTnF6MGFD?=
 =?utf-8?B?RThBNThlWFJYTzJlajVMLytRK09takJaZG9SNXcyUExDdDBqT0U4bW03dDFS?=
 =?utf-8?B?b0ZNSzFSUWRWRElwV3NEQVBJcHhsbm1qNDdYWU8xVjRPam9MR0Y5eE1uc0Zy?=
 =?utf-8?B?bzdKbXJxUEZxYzR5NkdvQWFIZlRBL1lraFk3cmtWK1pJMXp2VVluV2lwMnd4?=
 =?utf-8?B?dFFWdy9qcmt1azVzYUgzQndPdFdLaE5adGxBQ2hhVzFmMUc3T2lLbVEyd3Ix?=
 =?utf-8?B?ai83NmVJME9ibGlkWTNEZzhJNmJCOC94RGZ3MW90OHRJSDZnZmZ3SW1VYTJK?=
 =?utf-8?B?RDcwUnArYkdGdVJQUGZheU16VzNKTUtzSFZxSDByeWRqWTh6cG1DMnFMcTdT?=
 =?utf-8?B?L09uc1hFY25SZDlUTWFrZnFjNmdKais1d05XbUtOOUg4bEljbURza2RaSG4w?=
 =?utf-8?B?dkszSndyeHFsVlNZOXlCQ1ZzNlpYaER5ZkJwTCs1MDNVTEdzeWVoQ0RNd1FJ?=
 =?utf-8?B?dTZYZXFTRi96QmZqekxmSUZ4eEhUcFBQR0VFUnVLcFpHenEwSmpHZTFRQWdV?=
 =?utf-8?B?WnVRNUtacCtnTW1xdWN1aWFHcTQvZm95SUlWU2wxTWVObzFNTUdQam94QVVo?=
 =?utf-8?B?OFVBaVJKSXRyRXRzVWxUMWlHTFFzbWRFcmJaNkhsMUFRbVZJWlIxQlI5TlJ2?=
 =?utf-8?B?UUk5bHpmbUFmci93amJmOWwzZGhqVVZxUU1OSDA0SVhKenlKL2thOEFmUDVW?=
 =?utf-8?Q?o26IbGHc4XvPoLhGHHoEg73fi+xAtRHCVJ/h0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0RRSktDb1Q5YkUySUttRHVoTkxyY3ZHS3VHUmN6eW5sU2hUSGtiRnloL0pG?=
 =?utf-8?B?ekN4RFpXbHJuK1RaRFRJVFowZEdwRVNhR1RTbnVqOUM5V1VaZlFsWENka1hR?=
 =?utf-8?B?c2U1Wnl4d3BhVGcwVzZLRUUwZFJxZzQ4ekN6YldJOWZyT0Q3eitCQjd6dHpk?=
 =?utf-8?B?TGhmRVRMRE1uZlhzNkg0TWI3UjhwMVRXNW1vWHJtMG5xaTdGOTFWOVEyVHA0?=
 =?utf-8?B?YVFpdmZWdFN3QUNrZFFXYzhkR1A0T0VHa3daamNLYnUrUisxWGlQcmFhVmlh?=
 =?utf-8?B?UlVydTBvNlVPREZQWUdrVDMrZkFnWU5STmU5VVI5U3AvSlJtYmxhUGRTVU5o?=
 =?utf-8?B?dzZzVktyQUgvV2tycVZOcjVDOHJ3bXRTOVZyb1BaY3hmN2dHSi9XT3k3bHBJ?=
 =?utf-8?B?TWp0UStOTjlJcnZJdXpUeEZmUHZWZnlwQjhKenhpN293YUlFWG9Zd3M0cW9X?=
 =?utf-8?B?MWErbmp6a0s5M0RrQjh0cmlpNXU4bFQxTUd2ZWNsY1hKcVg3cUJMSW5qcytM?=
 =?utf-8?B?enFUSlFNS1JzdUp2TmRRL1gwT0FIQSsvZndIZ09IMDdLS3VMNjA4aGdZZ2Y4?=
 =?utf-8?B?dWhZVEw4MjdZa0xLOUlzcDlrRnpKOXVKNUk3UWh4MENrajdOSnhobXFuREpy?=
 =?utf-8?B?MDczL0tRYk9BOUI0cjMvZnR1RjltT2tEdEtEN3A3L0JtM0hHbUFPNEhVRmpM?=
 =?utf-8?B?M1lkbDdLQnJuSkVrYlJ6TnRCaDVueUN3RHdIVS9JamNrZGpxVEJrZXV4SFNy?=
 =?utf-8?B?aXp4SS9nL0ZaZXdlZnV1Z2UyNUtQWGdTYTFFQUo0M0c2Ym11bWVxVEpLSnh3?=
 =?utf-8?B?Y0cxYmlpYW8wTjBKRXdFbEl3QTBFUjNacDNoaHU4UW96Sy9yckNyLzJDOXAz?=
 =?utf-8?B?L3BxMzJtazl4ellWanB6Y01qSEtYL2ZYMVlORzBoa1NiUnlmWjRLT3IxamFY?=
 =?utf-8?B?ODUyU2dSSmsyVnFKOTA1ZEpFa1JNSzBMRTVobk1XanNkbldEVmUzK0lVUDRP?=
 =?utf-8?B?OFEyaTBDZVF5blhiaWtKbjUzOHJ4RjV2RXlEc3lOazI4MkdSOTc4cjFVK3F4?=
 =?utf-8?B?aWRmbVEzSlpkU0VkWE54ZEVUWFp5d2oxNFJJdndndzZnc2s0elhMOERwOTJi?=
 =?utf-8?B?OUtKSWlYaGkxRG5JQ001S1RaU1RlQUoxWnMzb2phSzRSTU9seG40Ny8ranRp?=
 =?utf-8?B?RWRiRWppMldUR3FCSVZmbDBVZlBnOVcyRE9tWXNZTDlKZkNBSUh4VEx1d0ZP?=
 =?utf-8?B?Z3dSdHVTdGRRMlNHZm9KSVcvQUF3enlObXFJQnMvcnJIQ3k1Q3h4SjNyTlY4?=
 =?utf-8?B?RGsxWEFJT2ttNjBkaFNvRzF2aU1BS0x1UkNRNzIrelZKZ25KTkRxRkowMWd3?=
 =?utf-8?B?ZjBxdW1IdWIzNWhXQ2JrL29PVmtJc2lwNkszM1p5UkdISlk2Ujl5TW9ucWs0?=
 =?utf-8?B?VXNsclZEYks1TE5oOVMxSDZNd3hablhFbTNuMUMveGk3OTZkdVNlbkVmVlBh?=
 =?utf-8?B?Tmp4bSt1bHpVcS84ODV0cS9wY3NtVTQzRVpEUzVQbHVtZi9tUjVoZUZJL3Zi?=
 =?utf-8?B?ZlBwZm1aWWNXK2NHdWZBTWQ3UE52WGducnczdmM1QnNjalZNL1o4aDFQSVJq?=
 =?utf-8?B?SGdMekpwRk9leUo2bEZXMWNhUW5jV21VODFxYlRmU0ZQSEE3dlRKeWoyZTlH?=
 =?utf-8?B?WDIrV2tpWHQ2UlVWdlkwYU0ycnR4WEpXdnJzY3ZDMC9VQktZZ2p4SmNaRG9O?=
 =?utf-8?B?YlQxbkdONUswVnZJWG1wMmpLb3ZVQkRCUjNsUnZmekxaa09XTzRjbmFjRzJ3?=
 =?utf-8?B?MGR2RTlzZlU4R2xtT2E1Vm1HWUpjdENkTGRpeCs0blhxNlF3R0pkb0lzM3JO?=
 =?utf-8?B?YWVLZ3hFUTFTWEtkNXRyc2R3QWVzcmtZTWQ3RkJyYTNrcnM2QklvQkpWZ0pG?=
 =?utf-8?B?SnVlMXJSWm1CYzVjemZUbjhlQjFwayt5V1dMN29FNzlQR2xuTlc2S2VYS1pi?=
 =?utf-8?B?Ly9oU1A5MXNRb0l5VFhtNUxCdytTK3luYU0zVTFxZHQ4MFgyYURINUZVVVJN?=
 =?utf-8?B?OUQ4MXFuNFJxZjF1WGdsdytNNk00TUNyZjNSUHlqK2c4MWI0RGpacEtpNjlP?=
 =?utf-8?B?UXZTVDNLTm5TdmQrbnNsQ3ZqdFJTZUE0US92Ymo4VEhFbVAzckJhUEFiK0hh?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7f5353-f003-4a30-d5d4-08ddc83033d4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 08:25:51.1845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzD8G/xBy5xo+w9yAOkWS1HOq8WCML31O4wrJPil3Kk/Q7zEhaBeI9Cir6FnFV2ISzGUCXdqVF5WViHVvpUfSTCWIR9yzsnXqtKtc1Vvrng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10752
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 08:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220668

Hi Khem,

On 7/21/25 7:47 AM, Khem Raj via lists.openembedded.org wrote:
> When crypto is not in tune features then add +nocryto to
> -mcpu explicitly. This makes the behavior between clang
> and gcc match. Currently -mcpu=cortex-a72 has different
> behavior in clang and gcc in terms of what features are
> considered default. Clang's philosophy to enable common
> features but maximally, gcc on other hand takes minimal.
> Clang therefore enables crypto with default set but gcc
> does not. crypto is optional on cortext-a53 and cortex-a72
> while, this is not as common but Broadcom SOCs in
> raspberrypi3/4 have dropped crypto for cost reasons [1]
> This results in illegal instruction traps [2] [3] when building
> components e.g. chromium, qtwebengine, weston etc
> with clang using -mcpu=cortex-a72 for rpi4 target.
> 
> Adding +nocrypto makes it behave like gcc does today. We
> do have separate tune if crypto enabled cortex-a72 cores
> are to be targeted (cortexa72-cryto) as DEFAULTTUNE
> 
> [1] https://forums.raspberrypi.com/viewtopic.php?f=63&t=207888#p1332960
> [2] https://github.com/llvm/llvm-project/issues/85699
> [3] https://github.com/llvm/llvm-project/issues/90365
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc | 2 ++
>   meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> index a88575eb156..65fd6333198 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> @@ -2,6 +2,8 @@ DEFAULTTUNE ?= "cortexa53"
>   
>   TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
>   TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53', '', d)}"
> +# See  https://github.com/llvm/llvm-project/issues/85699
> +TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+nocrypto', d)}"
>   
>   require conf/machine/include/arm/arch-armv8a.inc
>   
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> index cbb6418c069..cf09db00664 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> @@ -2,6 +2,8 @@ DEFAULTTUNE ?= "cortexa72"
>   
>   TUNEVALID[cortexa72] = "Enable Cortex-A72 specific processor optimizations"
>   TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=cortex-a72', '', d)}"
> +# See  https://github.com/llvm/llvm-project/issues/85699
> +TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+nocrypto', d)}"
>   

I'm very unfamiliar with the tuning part of the machine configuration 
files, but isn't that something we could add in

meta/conf/machine/include/arm/feature-arm-crypto.inc

in the counterpart of +crypto?

I'm just a bit confused by the decision to only touch cortex a53 and a72 
tuning files? Reading the DTs and the commit log it seems those are the 
cores in the RPi 3 and 4 which do not have crypto, but I assume this 
would be applicable to any SoC without the crypto block anyway no? So 
should be generic instead? Are you aware of the RPi5 having done the 
same cost-cutting measure? It's sporting a76 cores so maybe we need to 
do something with that too?

Cheers,
Quentin

