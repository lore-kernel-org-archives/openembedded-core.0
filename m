Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12562109C029
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:45:48 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24434.1774449939635301286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 07:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=h8DD27JU;
 spf=pass (domain: cherry.de, ip: 40.107.159.23, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqZm2aLctRf11xRE37YoaL73My+kCToLnq0AqXaP2YZY+Q9XXQgLaLyBmCSzTgi1JEp+fhLT8SOJWT3DQGS2ANheG/LDe8XPCZ66i1psWQwrpmV0WgiT6fNYhUxeadZeRNauEpgGujahxM9FK7ULJjCgWGs0169fugdSpxs/xQyiVlY5M/YmIxqjF7blkD4jQ+koEjSQg7TnWzUemWpX4nFxgz4QzuUUYxRGTYTxwmG9XwLbVGRckhHAlqa7oKfjn4SCFJtt6n3xkJPHSFylZc9PvMeTEsTvVf8PR8Rkq8OKX8wWBEoyKvGcZKwrezhJ17F8fpg4j43vqUV9HCF/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcD9gJkEXHZcHa1aYwJbuMWwAsf/hTX+CeTtslkHrOs=;
 b=QzNknXOW1YHu+Gs18AwTjh+590p0ITP9pxxB4O9b9GvHQqIkbQMk2SmGNTFmVqlGWpJqc834Nll0eAupT2QZUtzm7xVvPAUvmR8G+WnKfzMo2LrlzJ+A01df80jBIz11cb5lC+e9SX7U9w/0WIR60kX1S9sK1TdKLwybeR1mKW3rTtBcPzd3s5TmnO1QQ4YVshiDRPatmQ94v/O9wimgnCMU51vQDnsAwe05yJxnceu+BrbJC5gn/z34tO/Vf857e5tehLp1mMzojuQFPypNmyW4R/YvX/OzKynD0Izsrkj6esVf0KLXqVGCuygbRDFHWQ7Z92nhUJC2a3lILBGYWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcD9gJkEXHZcHa1aYwJbuMWwAsf/hTX+CeTtslkHrOs=;
 b=h8DD27JUsQNldSOuUXYxVgrnOB/pI4swlvv8nd56uZ6v0K1aD8KzV8a4z83Eo8yqvh8LuPw79SEUY2ThvSLtSJzrF8C2zbbvMg93ToVFyoP6XX2d0xvZsAjbiZnHTWsGG88OpmrcS78rbOB/lpT2HaVONbd0GqDMyU1NZfQkm1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS4PR04MB9339.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 14:45:15 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 14:45:15 +0000
Message-ID: <f4ed8844-38e7-49bb-9363-822af85f5012@cherry.de>
Date: Wed, 25 Mar 2026 15:45:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa-tools-native: fix do_compile failure
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>
References: <20260325073954.1176537-1-khem.raj@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260325073954.1176537-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0292.eurprd07.prod.outlook.com
 (2603:10a6:800:130::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS4PR04MB9339:EE_
X-MS-Office365-Filtering-Correlation-Id: 14fc0348-9e24-4980-9401-08de8a7d202b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	McNX1YJ76LMyolPT90vrqCWp0bKAhThy1q518dHEr8XbfHut7shibdjuuONtQEW8Ll7XCVIfypN26vSrYm40bmegy8ib16fI3E3uiyQGKEpwIeKwOHAWK7WW1ArqamGQzJ2Lk1HzqE2KCEd12gX4m2EiVSpmT1c1yqKui9zaOCuhPolpIS+TYx2gBXCbES945ec+zd4N1O/gDEJLsUC83GcWu76RbnBRF470G1B2v72ej0po95THbqohupXXzDvRhLlNOvfcolPXdfRUIV1Ba0fxjEO4L+FkM+kfih71MOUX9VKyS/iAxBFQUAkQrSlv1yAnlIdt8J40oZXkDvfMUhV1IphnsA7BfXIT9TPVYcl4KI8H/tpnT7sWSm+A5R7a0VQhntWhRzZCPzAmIxClflAUeI3VBP3Z2AVh+i/i4cF0S+FLFaoMzJ2bwLbvqt433EPozVHBqJZWC8QNDtKDZV+hAd385OeBJe9SpMMRD2GLYf3z9dma1bm2LEpU6Jco5KaDoXtS52V4VYbTdKcutGbxqmVwb1lD/BFaInN5WRksFX2e13ilBbDKSmNPoiWGi8SIC8BfUw/WmzjsBj2HiVsBrVFYBGUVBluG1OOqX/nlPrrAjEdqyKlbfe0DUV8WYDs/0Nsy3rdMauhlEwse0oATMr+eDAwbGC6sC0fJOS5l+zjQ0qk/fLpmbpDZCQrjdrcoK3u5e1wAXaDgGj3eT+Svzf5FsT23XIXak04XNt8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGw1NUhPcGwxekFUTlJyM3ArcjlzZXd2UllQcEo0RytKUmJCM1h1V2NHaE1W?=
 =?utf-8?B?WWhLM0dPMUhUeXJGQ052UTJyTjJwYWdERXFiWTdXa3JGdmdzd3FJcFFra2h0?=
 =?utf-8?B?b2JBUVNrcDJOcmFsaXNabkl6dGNlYSs0ZERiMHJMLzBYaXlRUVBpMXVIU2Jo?=
 =?utf-8?B?eGk2OFk2MDJWNDdWY1grOTREdHZWUHAzNy9QVzF3OVlPcWcvN1lHSVR4ZTlY?=
 =?utf-8?B?YmxqaktkWU4vbHp2SzZqbGNlUUMwN3ZwbHM2QUNyTG5yTFNxSHNkdHpLb2VJ?=
 =?utf-8?B?bXdHU055aVlSMXRjemk4N2xwQlRBeXNMUVdpQVVjcG1sUzVLemxUNCtTRXJD?=
 =?utf-8?B?M1lBQm9EZ2RHcC94M0lLby9aOU5yVXoramJsUUppTllUMm5VcEp3aEtDTWxJ?=
 =?utf-8?B?SjUvUHI1ZDEzSzhYMnkzWnJkZnhwNi9TeHgrZWZKTWtiTUdBL0k5ZC9OR1Jt?=
 =?utf-8?B?ZW1xeHJPK2VUNHU4TGt5d2RGRklpUVhoazBsMHJvS29raFpBOGZrb0Rud2Fx?=
 =?utf-8?B?YWdzb2I0S0tpVTcwUnRDbkNMYjEzM1RLUTBsMTRlSkxJVFBZOG5lSEZFWGFM?=
 =?utf-8?B?NHFoMWZTM1kyUWxkdXFkTFVNeXdUMzZoeVFWZ0pnUzVYTGxNM1cwNWpEa3RF?=
 =?utf-8?B?eDZkV0VqMEVUbjEzZG5FVTFzV0VHemlZVm1NSitxSmphK0RHTGlXRU5hNVo1?=
 =?utf-8?B?M1Z1VEJNM0NhUyt0eUhBYXVpSktOZlhobEFaVXJ4VWNmVjlqU2RaMnFEZTJ2?=
 =?utf-8?B?VmZ6RjdwNnUyUmc5eHB1c2x4enV2OWE0eW9FRHdlOXdZUFU0Qkgza05kdFdW?=
 =?utf-8?B?T29IcjhDeWNRQThIODJzRVlFVTB1Mjg3K2xQVW8vY3pPZHZNU0x3Y3VXbDVo?=
 =?utf-8?B?YUYxeXZpRUp0eERzVmxqYnByZ0NWOGRZWXo5UncyWkdxQmMvazJsN0RqdWVI?=
 =?utf-8?B?bnM3dy9VekJuRjg0cUdMVG9iOExwRUZ5cVFJeUd3a0lOMmlBZFNkWnV5eFkz?=
 =?utf-8?B?VUJlZEUvK0lGQ2NjNXhaZVFUVlFhNGg1NG91enZiR3BVbFR2QTFoRGZyQkRP?=
 =?utf-8?B?ZXIwSW9hemVNMVRXbDROb084NnJ2ZDFuekVaTFlVdW90ZWJSVFczVDRZelNW?=
 =?utf-8?B?UlBOOEI2bFo1NTRYNUtORlIrNkJ0UEM5NGYrY3FFMzNNbTBNZGdFdk5jQmZn?=
 =?utf-8?B?ZXZaek1PeWdOMXVuZFpaMWp6YUNUOUdhUFZjbkdRVDAwM0tXUXM5QlB2SmN2?=
 =?utf-8?B?ejUxd2VmOER2YlBLK24rQ3ZnKzhmMHRudjM2eXhNM2RrOUJwZHdCN3Q3bkts?=
 =?utf-8?B?UU8yanJXZlN3NnZkU1hEbEo2d1gwd3BJWHdSa1BLdE9FNE1OK3QxelNVazRP?=
 =?utf-8?B?eTBOaE9xVUNtMkRkbU1PZ1hnaFdmUG5jTDZBM0lIcEI0UGZDbXp3eDdMRHZw?=
 =?utf-8?B?VG12WWNVbVowV0twcUNRRCtrTFErL3hJekVLZHlETGFvQ0J3V2tvVDRyQml1?=
 =?utf-8?B?T05Zd3BRWloxWGV4WWoxSlB2SW16K3lmSUtVdzk3a0VuTmlPNnRBc0pMMzBF?=
 =?utf-8?B?L2N1aHVmY1g3eDJUaFliaEg5Sm10ZENGbysrRWk0ZVZBRGlubzJkMi9ZNTIw?=
 =?utf-8?B?ZEcyaXBRNHNaZjFvcm9RQWlpaFNubkJvbGhpck1vKy9wMGt0eHh3M2x3L0V0?=
 =?utf-8?B?eWRKQVVBdmU4U3RQZjBpTkJMNkltckh2ZDljMjE5UE1LYlhLOHYzM0VFOWhX?=
 =?utf-8?B?RW1ZZE5YVHRraHZuWTlsbThDQkQ1UVZVeTdwWXIxa1N1TzlkMmRXbk9udU53?=
 =?utf-8?B?aFpjMmN1OGtDS2U4eU9JWGxJSG5Dc0lNV21tQndPRHFVS3ZRRnhFYTVCNWdM?=
 =?utf-8?B?dGkwZTBEMGhzUTBRb0ZkQVdGR0dtMkJFTzl2M2FuaGxjT0tiajZ6NjA1SkJm?=
 =?utf-8?B?RnlwRTVwcFkxNks2em9Ub01hbEhZOGFJRjBST2k1SFZ5aFRmeTBEeHRVc3hx?=
 =?utf-8?B?U1NvRW5SQW1tcy8vd2xmc2FBSW1Wa0cxMFk4K2hTWDFVeVJqdXB2Slc4WWtX?=
 =?utf-8?B?TU5tT3ZSUHM0dXpLWXlmU0tPUjZCd2puci9ta0FTdGJnUnR6S3JSc2xXcitj?=
 =?utf-8?B?bGZIRjFSb1FJbHdUT3BqbU02WGg0S1JuZlpyZDBBeU5RN0VuUmJRWkxtNDll?=
 =?utf-8?B?LzJUMzVRbjAxWllldU9XdXdJUGp1bFpVVkV5TVdCQU1LRUVwYmxXUDdaU0V1?=
 =?utf-8?B?U2lPTlFhdENReDRmUCtGVHQzVGgycDdqWUtMTHRlaEV2QlNXTkVKUnhFaDJo?=
 =?utf-8?B?SWpFZTROMFhZQVdRTkVkeTlVK1l3em56R1JsUittclJpaDAxZkFDUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fc0348-9e24-4980-9401-08de8a7d202b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:45:15.0132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vyx0TElH4OxFHjfzJh/LVcLiHyJ0J7CAVd/QUATV2lAQhJ1EgjyCT4ByCPBWC2TANG2qxY0jAkBhZqa0fDqiuzOc4A+bU75ebfGoFscY/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9339
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 14:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233921

Hi Khem, Changqing,

On 3/25/26 8:39 AM, Khem Raj via lists.openembedded.org wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Fix do_compile failure:
> ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal error: xf86drm.h: No such file or directory
> 

What's the setup for this failure?

> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-graphics/mesa/mesa-tools-native.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> index 50d2f5cbb0..743e3391e9 100644
> --- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
> +++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> @@ -11,7 +11,7 @@ PACKAGECONFIG += "gallium-llvm"
>   # to PACKAGECONFIG like in mesa.inc
>   PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
>   
> -DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native"
> +DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native libdrm-native"
>   

libdrm-native is brought in via the wayland PACKAGECONFIG, which is 
enabled if DISTRO_FEATURES has it, so I'm assuming this issue can be 
reproduced on non-wayland setups?

Reading the code...

src/panfrost/lib/kmod/meson.build

clearly highlights there's a dependency on libdrm (dep_libdrm), but 
dep_libdrm (created in meson.build) isn't created as a required 
dependency, while it probably should since 
src/panfrost/lib/kmod/panfrost_kmod.c clearly calls functions from 
xf86drm.h which are only defined in the lib. Maybe something to patch in 
mesa itself as well, so that it complains it cannot build the tool 
because of missing libdrm dependency.

libdrm is apparently necessary for DRI, GBM and any Vulkan driver (see 
with_dri2 in meson.build). DRI is true when building Gallium drivers (we 
have this correct in PACKAGECONFIG[gallium]).
We would need to check but I'm assuming we're missing the libdrm 
dependency in PACKAGECONFIG[vulkan] if we're building without gallium in 
PACKAGECONFIG.
That still wouldn't fix the missing libdrm dependency for panfrost tool 
though, for that I'm suggesting we add it to mesa.inc via:

TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', 
'libdrm ', '', d)}"

to match what we're doing for the freedreno tool.

Cheers,
Quentin

