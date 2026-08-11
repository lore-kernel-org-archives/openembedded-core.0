Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4193C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 12:13:17 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53066.1786450394290123162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 05:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KbfILtKd;
 spf=pass (domain: cherry.de, ip: 52.101.69.27, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBDpge2CRjg/22yDeyqchVKwesXuxHV7C1m9Rw/AV57qUmDpfXidcly8mn6iGZYeGk8o6mmFNYrXcucT87c2+3XVQW8wLThr4WjWVx9NCOKIPcH70M0R1+tJbX59VRrdtBcOLOTqShdHoTsEgrAkvCQsRGM8awGS3HgyxuFzF+MLVCrLv1dQzjke6ElcC4gzU+OYm1erVczK23eRZjWBteWhFUH3Cz1WTZIZCgZUltnO9zvTd3Mi6fLyH8UqdZCYUbTh/TfoecWAuFctWN3e3jjjdOvRnqwxI97aSIlWhYKfoS8vjeTW+PIQJF2LusQScMCmB2rl5EtwS5xkgZS6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DL2pR6a8jCM710qf529FzzWr0TItuXwp2IKjr3ZeHY=;
 b=abaYLzTB3u/N4NH5ZZZKKgAzP6tku6v50miyJKDLrD4WGiBvBi7d2PSKRtiG0l48htSNv4WoNNjaOWlqOYK63M2M3pENyGUFugjn7k0n8r/t5fjPwy1hx8gt45isMBSl30aGqOqo0D9VSzH7Scx3mGr7Wf7KpBuR6J5nsqImcdfU/UspdWnIBg2wXyPq/1LORSD+9Na+peXc9WDRrTRwbHkyMTcES4p+eGbdASDwZftPP4k2l15drXY8omQP93CUQyJyZpz5ETy0V1ni22bHfxI3OcPJ+Tkl3upQG681/YRR/XK2y3W/+sp/b4A3BAsCdBZgAQZ993P9mPct8a3Hkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DL2pR6a8jCM710qf529FzzWr0TItuXwp2IKjr3ZeHY=;
 b=KbfILtKdkhGG8HqPZa6Kj7mWZR5/Krx/lhMOcpNTE0hChY6zR35giJTnfXO9HJcROrfL49Ox/XTsLC1TUmh+J0wZTmRJQX/fcdbMVEZmOXNb/vWmwN7CWQPwvKvG6NkGRTLpEH7ndb1DmBc1iyForVxpDBVailzrGQvajDa0tzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by FRWPR04MB11198.eurprd04.prod.outlook.com (2603:10a6:d10:171::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 12:13:09 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 12:13:09 +0000
Message-ID: <274b9268-b499-44b7-9297-628de8facb23@cherry.de>
Date: Tue, 11 Aug 2026 14:13:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: add support for Clang toolchain
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, Sundeep.Kokkonda@windriver.com
References: <20260811105603.3447122-1-Harish.Sadineni@windriver.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260811105603.3447122-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::12) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|FRWPR04MB11198:EE_
X-MS-Office365-Filtering-Correlation-Id: aca44a52-7609-4cc6-9614-08def7a1e846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|10070799003|1800799024|376014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	szbdr4eBJg3I+GM35RLhUWYWHmTsUMLxiGMbmF++kMFfxeap+62yLwUdENCG3ca8AMiLGy14bxXy6jO0mTfjNllKberRwf0GuDBJgZ0iAA/aADB035A+APbde19UK1qx8u6+pArMp8GFvOFLzLr1gPSDlSdwiXgjkadxogwU0OF1p3O2c8IDZZ/w7HiQRH6OG44VUAGtzlT0qydGCZzOtRBxx4X0MNhSZqJDpcbGGz4lV3FMA3vYkrjQjZKEuoUr3SI2VNcXA11BlL70Os3HeqYkXvtvhJkKtBgRrQczRryeFSJP/+5I/hDM0zKxlPHRc5iBDeWU3xBJJih8mRrTx0VTgKK38KqAB4ijH8tB6l5FdRx9G6Ry7+n2f2oxgUxc7KejsD9DaWNgJhhdPAlwL8KR+yvQcvohm2BITNPPm4+E6uMpzW/h9RJG245ENlJJ2tVbuAo1FuXysGUIuBsw3sIwdn5KpMkXXcpc8/Ximdeb1EvDwrQ+TzA/ZqifVVz1FOwTkymejRnh4AJ38s7C2G38g2WWDUdjiYF9D10KldG97+pBPY6Bn4FE9t3mPJmcCj2n9xU4SNF5fE+icSjMZDyT+XHotw46dPJw1gWaG7E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejZkTGRRUkxBTGhWYjdWQ2VUYTlzcGFuOWhrMURaNDRNOC83bFphRllZaGRm?=
 =?utf-8?B?LzdXSnNuTWYwU3grQzNJb1gyM2ZnRG9wVnBqQ2QzT3FzeWN6a0Y5SkpmbXJC?=
 =?utf-8?B?OTZ3M0liOUxNWjFTL0d6RlJBdW9icFBoYXc0bHVGMW8xM0haUnp2cGJrTm5x?=
 =?utf-8?B?ck5tUHBmRnJBdkYxTjduemI0WFloOXlIbmZ0bmRhU2NVelNPdHpEUlRpT1Fi?=
 =?utf-8?B?NTI3RWdGbGIxRHZEdnlmYWtXcFdhSThVVWNKMlUvaUJWYWxkWVJncjg3WXJ5?=
 =?utf-8?B?eElNMEE1RWswUm82TTVuWHQvT1gvWEtLL0xTZDFnUnVmRmxSYXJXQkRkdHlR?=
 =?utf-8?B?dDl4djNwb2pPK3hhTytnRFhBTG5VaUFaSlBYMVkyRHp0T2JsUFdKZVRtdEYr?=
 =?utf-8?B?STloMnNuS3hNdE5waytZVWM3am9kdGxnTXJzbVdmVGFlNGxiMDkweE5hSnB4?=
 =?utf-8?B?VWRBYllnRnZKQWZHTE9aeWpPcCtEU2Q3ZVJ1WjRyYVRCK3lxVTZkVk5udFRP?=
 =?utf-8?B?eVNGZFY2V0hjanJ6dHljVmwvT3h0SnJIY29GVVIvczYvdGJnRmpFbjFCcGg3?=
 =?utf-8?B?ZmtHSnNuUy9uS2NsSUxlSytGMTVaYVRtU3BJTTRYb3h5NEtqS2ZCaG04cm84?=
 =?utf-8?B?LzVjRVg3VG1xZFlNQUNLSFVXcmJLVFVwQmNUWFpCQXdoK09VZVVlQm8xZ3Jo?=
 =?utf-8?B?WmN1cUNSRGJRVTVrQUJ3b2d3TTRsRUthUnlQUXFPdXR1bWh5UUY1VEpoMXp1?=
 =?utf-8?B?K3ozdXZzeHhHM0lGdzJ6VzlRdDkzcUpabExQMTdRcmk1ejNlM1FFS3MvQ2pZ?=
 =?utf-8?B?VWhINTJjNFVDaGpPczZobVpZM1FSNGl4NTZ0R2oyU0tiQmNLWG4yR2dYZGtX?=
 =?utf-8?B?THNOTG1haFZDUjFIRnkrdVR0Q2tkQnhxV1hpMC9uUzV5Q0JKem1ZWWxSRHFn?=
 =?utf-8?B?WE84RDFieW5aSFAvRkN1T1lxV2NjTjg3bS9zQ2xxUHFwanZvNEJiakdVZkpv?=
 =?utf-8?B?TjMwcFpiaDJ1bG1CelFBeGcyTGVZVVRsbU01aWZpa09JbVl5QUN0L2R3WjRo?=
 =?utf-8?B?UVN3cjBib2hPT3RKS1F1Z3BNMEhNVnVORHRpQWM0ZGRYWWVoRTJ0b2lqWThm?=
 =?utf-8?B?MmVPb2FRUHg2QnllNzdRT3A1ZlVNVmRzcHk3R3A5VTMvSmRJN3JWckJNTFNl?=
 =?utf-8?B?UDg5bE1LV2tobG5kVUdNVlBFYXBGMmV2aTluWEcyN2JacUltV3dxM3UvN25F?=
 =?utf-8?B?NVFzSnB6eEFzRTNtQ0w0b2g3dFkvTmZTV2YrOW5kK2FBcjh2alZUWWIyZmN0?=
 =?utf-8?B?RGxreG9uSEpkai9zbjZIU1VhdC83Q1VlZXg2elZwWjNDbEs1aG5zMmFFblFW?=
 =?utf-8?B?UFhZdEU0Y1ZzOVpOdk0yUFozZEFTZ3lNUkgzNVh6VUtxQWc0bzFZbXlxeVpk?=
 =?utf-8?B?emNjbC80eHMrYWl0cFlUQUJBM0lmaERkaGIveEpyakRBSmFYcW42VGt5Rm9W?=
 =?utf-8?B?dTI4S0t2S2JQUzBvQ05RR0psSUdSbmgraGNRNktyMGlDaTBqdWtsemhjRXdy?=
 =?utf-8?B?UG1rNG5WR1lmVjh5eDdlOTAvRXdhUGxyKzRyeTNqeVRqSTFIUjBZUjNXRUFP?=
 =?utf-8?B?UFBVUXY4b1VMS05saWNzZU9qZGtVc2JEVmF2V3JhTXZ5RlhiWjdLVW5acHJx?=
 =?utf-8?B?bjBnVDI2dlF3U0tJWW1tSUVGQWpiYnhLZzZTVlA5OUZpUnpZaDRFZ1ozRUhq?=
 =?utf-8?B?WnBMY3gzd2xTbU5tb25paTc2NGZEbEdUVDlYWnRBb2RCR28xd0RhUlpRMGdE?=
 =?utf-8?B?NWtGV1hTVTRRVVJBY2FBVStGMTNNZUpyRDhnY1EvSUlZQlhOQjl5L1JvZHpr?=
 =?utf-8?B?dng3NkNPOTNhVFdkMExpckJzUEJlbnVzUnFneDVuOC9ZbWdiT1l0anZ5ZDFy?=
 =?utf-8?B?Z2YyZ2gvclhUbGw2a3pCb3ZybU9HbFJ1dEwyZHh1dnB4dG0vWldHSW5HNUJZ?=
 =?utf-8?B?S2FvWVgyOWV1OWNtbkI0bE9MWXVYOE5BN21rcVF0NXY5UVZXL2QyNHEvME1P?=
 =?utf-8?B?VXJLWFppaGt6M1dFbU5PU2U2Q0M1M2JBdjRYZWhDK0c3Vkh4QTFXVDF6U2RG?=
 =?utf-8?B?TGNKSityRWl6azA1M2gzS3FUT2ZIN29MR1JtSjdwbThRdVNxWXJNZEtMNitW?=
 =?utf-8?B?MXEyUXJsYmw2bUtZSUxLYjRjWXk5ajAzVW9wNFZuamo4cGpaLzNtV3dXM21z?=
 =?utf-8?B?SDMyK1YwK0ZDNjBOdFIzejJYS0JPS1kyalVkYmozYUJ1Vyt3TGl3MU50SHhY?=
 =?utf-8?B?QlA1K1F2WEliRFZ1YWlOakdXYXdXRW1BbDhISE1uQ3VudExaNVJJUjF3TmZu?=
 =?utf-8?Q?3iGFDIXqNLfi72HQdSNpPD1OWJd6hppnrki2RLvXEDXpZ?=
X-MS-Exchange-AntiSpam-MessageData-1: 5uDVfIaKXmR9zQ==
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aca44a52-7609-4cc6-9614-08def7a1e846
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:13:09.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcZzwyobJftpkn8sBO8x+JLqp3vubI6yzi0N6e81/R/lgjDv0RU68JxXyiKkoeT27SWkL5xplFwoiO6A5p4JhBptHmX3W1Y/GQ2I6t5OcdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 12:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243195

Hi Harish,

On 8/11/26 12:56 PM, Sadineni, Harish via lists.openembedded.org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> 
> Fix build issues that occur when the Clang toolchain is selected.
> 
> Remove the hard-coded TOOLCHAIN = "gcc" behavior and make the target compiler
> selection conditional on TOOLCHAIN. This preserves GCC as the default compiler
> while allowing Clang to be selected when TOOLCHAIN = "clang".
> 
> YOCTO [#16385]
> 
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>   meta/recipes-bsp/u-boot/u-boot.inc | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 00a12f1bb9..2197039dbc 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -3,10 +3,6 @@ PROVIDES = "virtual/bootloader"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> -# u-boot is best built with gcc
> -# https://docs.u-boot-project.org/en/latest/build/clang.html
> -TOOLCHAIN = "gcc"
> -
>   DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mkimage-native', '', d)}"
>   DEPENDS += "${@ 'u-boot-mkenvimage-native' if bb.utils.to_boolean(d.getVar('UBOOT_INITIAL_ENV_BINARY')) else ''}"
>   
> @@ -15,7 +11,7 @@ inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native
>   DEPENDS += "swig-native"
>   
>   EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} V=1'
> -EXTRA_OEMAKE += 'CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}"'
> +EXTRA_OEMAKE += 'CC="${TARGET_PREFIX}${@bb.utils.contains('TOOLCHAIN', 'clang', 'clang', 'gcc', d)} ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}"'

Why not simply ${TOOLCHAIN}?

Have you checked we can build u-boot-tools, u-boot-tools-native and 
nativesdk-u-boot-tools with clang?

Cheers,
Quentin

