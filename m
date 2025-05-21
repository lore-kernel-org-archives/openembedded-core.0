Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF0DC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:14:19 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.49])
 by mx.groups.io with SMTP id smtpd.web10.12025.1747836851193367990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=W0WkagIX;
 spf=pass (domain: cherry.de, ip: 40.107.247.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rm53J4ZKWjGh+oFT2uQ3sqe15TcUqD7CbIANvt7oPOJpotAtq6cGtaALOMs8b630amMFVT/FW1TQgi63Uvoofh+BMMEdxNMf1VoAfSH8u+DcQ6r2ppH3aD6/32KuSB8v4j94fv5T8V8TBiK3AwSq/+Cv8wnQGTRwMziElEoWsf2GW4Cj8jzs61ieRJsAHD/6SSUMHltOSJY8p++6MKGcQ1hmolKR3Ff0zR7JMZhiJ7EhNW8t+kMB+56KRKwco+s0xLmV+wLopT48hyeetihdLoVyJDHcU7hkU16Ur7lczcHgKmehWXVSt4td8HzvLzLicgpE2xpHTa6HpxlX69sTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPvlF1+PRV3OUdy2UEcbaShRiWQ0TOzl3XpJJBL6T7Y=;
 b=BSRXutzhQmZyrcW7QVkrCTp7B3oLYiwzCPGsio9fOIbaPw19lRVEDYWf/u8StcRYpBsKZm0sBmsckWoEq0L+javdiN9zOFe1bDo4y6HkMjCNy7mgnkhQeLDG/SvaQoSLxkjeDNcM9zIj/PD1UjP5+5wukqvltKjL/vkUALt/UkaMqJEEXl1oNcY2g4Itk0MpzK93LuO87jfAY/YtcLsLPkARhpyMTHlYT8ODrUIa0PoOtpS3ywcfdQPyXosc3oARTpTqZFXRIyzyewyEJEDBl9c6rWJ2jVCMBSvj74wW4Bs2fjj6gbequ7AoYLHOM29MXI66h/qHPqF6W6f1U6b3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPvlF1+PRV3OUdy2UEcbaShRiWQ0TOzl3XpJJBL6T7Y=;
 b=W0WkagIX4Hd5Blc6InOMzMqy7Q0nGbXmr0WuGP4QvH/3zmeJgtwEjhpl968rFhTKcnY9ZZQAI0f5BYL5LS9Q1WZ+1A05CHTE7p0uw48VOJ4qUnTJmWSqwnWpJg8R5DDw3LyA8BsF0S6xcf0R6fgsPXv6NCuwyKvgxKOAT2J8K5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10785.eurprd04.prod.outlook.com (2603:10a6:800:26e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 14:14:06 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 14:14:05 +0000
Message-ID: <b85c6a6c-250c-4b87-b9cc-92ed5fd51d19@cherry.de>
Date: Wed, 21 May 2025 16:14:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: disable CONFIG_BLOBLIST on aarch64
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <20250521135136.166390-1-mikko.rapeli@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250521135136.166390-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10785:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2f6f6b-d528-4cbe-19e2-08dd9871bec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d0xjVEg0QU5YRWFzRXpyMndCQnNLY2p6Mm93N3lzbW54RE9BNUNQTmVMKzFa?=
 =?utf-8?B?bkg1SkRxNnJEZy9YQjYrTUNVRk1CQkZ3bWdMNW9XVWpZUE9IdnY3QUt4U0do?=
 =?utf-8?B?M3BwckxUb3QvTVZPdmljYm1Wd0dQVFJVdzhaK3Ixamdndm92MzU0TzhlQytp?=
 =?utf-8?B?NlhEZS93RmdPQWNDVHJFeUZjMjdoV25rUGIrUmE4anl0UzMvbTVYSUhPVjk0?=
 =?utf-8?B?eTBaOE11Y1NnSGI5T3NDMEoxQldyQ1F2RUUwczhGelBselBDNVhJMVI5RkJJ?=
 =?utf-8?B?TkFtQi91d3kyTzhxR0dNczlFdTZQUm93RTVUM25XRmdaRVZxL0pLVDVEalFz?=
 =?utf-8?B?aUlNSXl4cWdWQjVUQjRCUlVvRnJPaDlkL3J2T09CaHNuYmFGaWl5TDhxYmhD?=
 =?utf-8?B?clNjdkx0WElxblVGaE1GTzZlbEp4M0RhMHFvWkxoOU9va2NpT3Jnb3J4REwv?=
 =?utf-8?B?TkExVFkvMkJJNWx4SnFieko4WGJqd2w0SDYzM0U1THA3Z2NIZFU2Y0ZOdXJk?=
 =?utf-8?B?dms3ajczVmM1U3lpK1hON0I2YXZiYThaUGpGaGkzMC9jWkIyckJSb1FxQklh?=
 =?utf-8?B?K25vN3ZIWnZSOFpZeGliNHU1UG1qWE1FMFNXendUNmVnRHhXa3RGVVAvNVR5?=
 =?utf-8?B?UHZ5TDdZaklpa3YyU0tPRTI1d3VUOGZYRElqNlkzS0o0bWRncVJ0ejlOb1kr?=
 =?utf-8?B?b2Q4VTdHWlZMWGJFV3ZPZVc4Vm9qL05OaG9wcW0wUFlvd1l0K0Y4czBYZ1dj?=
 =?utf-8?B?M2EycGxhcXF6OGtzcWY5QXlFclJGbUJ4Q2ROcDJDand4RlN4UnMyQXZoYUFD?=
 =?utf-8?B?MzdBZzFaMXErZEc1VWplSDBVeXdDcHBRZGpPTCtZWUdXYWtLY2hzYWxnM0U1?=
 =?utf-8?B?Wm9WbzBzR3IwY0VYUUd5OXFTSE5DUmhmR2ZPNzhvbkNxaHAwb2ovTGNQcUlJ?=
 =?utf-8?B?YXlPRXpUb1hsVFJvMHFOSlpIa1ZJbldBUDBYRlF2eWtWd2p0L3B5dUVaQUo5?=
 =?utf-8?B?L01reTJFc1dhSHpCU1VSdXNza3dkWldnL29RUWdrS2NJa1gxSHFXRkdNTFdH?=
 =?utf-8?B?Zk9RV1JkMUhtU2RoUHlYYnMzOFhwNVo0UHpsamtkbmNDZDc3YkJwQkJMYkRW?=
 =?utf-8?B?YSsva2phQ0J5TmRrSThyUWtFMEFYZmN3NnNzREVVY2tqckRrMjJlSkxZekxI?=
 =?utf-8?B?REYvckZMMzlvelNlMlU2a2l2V0Q1QjNsZzNCc0V0ai85TW16ZFBFQjdZVXM4?=
 =?utf-8?B?ZHFxZjZwaUhqVXZIU0hDb01aRmJ2NTVDVWVoeXFDWWEwUjVpVHM1d0p2dDRz?=
 =?utf-8?B?YThjTzNBR25xRnVheFpwZE9Xa05naTVkWW11WnVWWk5sZVVpRFdid3VmUVlr?=
 =?utf-8?B?ZElIS0NHUFhtb2lOUHJZd1JaKy9ENlFSVUpZWlJUVHorV0VsQWl6U202WVoy?=
 =?utf-8?B?aHRDSHdOd3oxUUJrZm5ubUNncnNhTUtJend3QWhObFB5YUo2NitRbHhjMUlB?=
 =?utf-8?B?VGV2eFFUWmxleHdiSWhNMWJJS0pGUmlPYWhCRnJBZXJQVVMzL2NOYUgzaWRX?=
 =?utf-8?B?N3pQWjkyK0NBV0hKSzcxL3d2Q2ZnYzZkZkpvSlpjMTVnTDljQTdEWU1EcEpi?=
 =?utf-8?B?ZHRKVFhISkl5T1BhcWZUQTBMZEFPcXlQd0NJQUF5SjVWTVBxY25vYW5rdnBW?=
 =?utf-8?B?YUpBMFZDeHJybTRmcFhQd1Rxb0JRY1JxY05nUllyVVBKSEVJbHcwQ3NTSGNS?=
 =?utf-8?B?a2Y1YWxqaElPbG1KQVdxQkxCdzJjTlE4dnRpOFVCTXFWQzdXN2N2NnRCWTcy?=
 =?utf-8?B?dXExZkZoTjRMODdEOUdQZk54eUwvY2lFeWtmWGl3VTYvVCszRk9CSWdDYjJv?=
 =?utf-8?B?SWo3NE9SYytCNTdkR0V1SnRMZHEveTV3WHE3N1Y4Tys1M1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aU5kKzN3WlM5R3BRdDNaR20vR2Y4a05NNVVhVUpueTg5Ri9VT2ZiYWsxcnBI?=
 =?utf-8?B?NmF1czFKeUl0K2paTDlvUDBEemlBK081T0xqdnFRRWpqUlpHVStoYkNUaFN6?=
 =?utf-8?B?c1pyQ1JGRTl0TzA4U0J1cVgyMWhRWS9zSUcybXVFNWtVUDVCbWMyZXFKNVp6?=
 =?utf-8?B?NGZlSHJoaVpULzlPaDNGWnFUY3Z5STZHWC91ZnR6VS93UGJadjM5cVVpWkhF?=
 =?utf-8?B?VjR4WjlIZmN3SGRONi9lTnFEVEtIQkVUYXM5Wk9BaGFyZkw0MVV6ekxMZ3BF?=
 =?utf-8?B?MlZZYVFFTEQvdCtLTEJCL1k2UmNMMDd5bFJXbWhNcDlEdENhbHh1Y0hDOWlZ?=
 =?utf-8?B?QkZkbWg5bW8wYjJHaVNHQy9RRUZtUUN4alZoNUhpenFoYVU0bWx1d2pET0ph?=
 =?utf-8?B?NTVxRmZXZWZVNGtEK2RvUStjVk1UM0gyZmR4cCtIWE1MM3RhL0IrcXlrZzE4?=
 =?utf-8?B?OTZFMXBaelU2c21qOWlFTWtUVFFZWnJFc3A4Vzl1cHJHYTI5bU5KcjFwemZl?=
 =?utf-8?B?Z1VWbjdEM3V5dHJpY1pzTTV5S2FEazJWY3FtTUEwa3lBeVZNSytmWTMwNldl?=
 =?utf-8?B?cHRPZVpFYlN4QjZ1dk5oRndMNmNGU3M5bDZSRHJJT0hlVnZqd2VPcmZ2Z0sz?=
 =?utf-8?B?c0cybWFZS0JaVzdaZGl3YUlheCtmRDMwRmJ6NEI3SFdRT3hhRzBPZ29DWjVF?=
 =?utf-8?B?Nk9NVDlIU3Zpa3E1bXhEdWlLMFM2S0U3WjZlZjgrMnZJSGxDZzBPK1hwdExT?=
 =?utf-8?B?VzlXNTNQTGJWVW4wNS9ESW1XcjBPNXMxdWNvZm1RVWhFSUhIZHV0cDRVWnpy?=
 =?utf-8?B?K0g2RXNBQm9nVnRMeHNISTFFU3g4bkxBMjFNRTdBSVFETEZ1MGN6OVpvcmlV?=
 =?utf-8?B?NitsalNMSnFCNzRHMHlPcDZnemxjNGNzVnVMNE1QcWhWNlpJR05EZUxWc1Qv?=
 =?utf-8?B?ZU9tcXRQcTFseTRoZzhtQ1o3TlY1VmVMVHV0Wkd6aFUvUEhLMU8xejhob01K?=
 =?utf-8?B?dGFZOU5FbER4MGtzeDVNOWl6WWFqQ3ZtTlZjNkg5bmlaTjczU250K1p3M3ho?=
 =?utf-8?B?Vm10d2dsem16bE11bHh3Mm8yTnNrMXhaY084N1NzT04xWmcyQ29oV1d6UVRF?=
 =?utf-8?B?TU9hWGhITFhiRHF5eUM5bldoc0JkbTlMaUdnYzAyTFpxZGlvRmY5c0diSldn?=
 =?utf-8?B?RWNESHMwWitDejV0czlBRjQyN3BiYVAvSUR6eFA5Ui9nTW53U2YxV3JycHlR?=
 =?utf-8?B?UUJiVnBCZ1h5RnRCNk5pWE1qcmVvbGJ3dFRNSEJ3TXJsMUoyVmRBK3pOU0tN?=
 =?utf-8?B?WnFkbE9Id2daZzJOM201MU9XeWVFQlVCaEpKQWZybFRJNXFlOVAxQXhKTGV3?=
 =?utf-8?B?S3FaTTA3cUt1dWlwL0wvWnY3dXVrOExUdEVjU0Y2MEJIUVFiMTRXaVZSRjIz?=
 =?utf-8?B?ZkJ1MXlseGI4cVNGSVFmMFdqZUVSS1hONHZTckoyOHowK2l2RFhzcVp5OEFT?=
 =?utf-8?B?YkVsWklCbVJUQ0MwcG1uc2pPb0pWckRmR0xxUld2Z0RLcy9lNVNMWXc3ZHlC?=
 =?utf-8?B?V04yaEkzUnFiaFdtdE9VOWNmL3JhNHBEVGlHTWFINVFYVWJ1VCtvdjZVbFNj?=
 =?utf-8?B?ZTdpM1pCc1drbHpQMHJYbnFOT3hnWHJGbkZOV3NmRGFhazV5UVREV1FVUmsz?=
 =?utf-8?B?WFVuV2MxN0hBbkd3RUxGRHJJaGpiNHYxUXAxS3ZOSWgvVXovRjIwOSt1cWVJ?=
 =?utf-8?B?YlN5SU1uREYwdUM5cy9GcG5JYmRKOEVwTGJEMHpvd2d5Rm5ncWExTjhvbmpn?=
 =?utf-8?B?bXBxL2gyTWxRM2xSbVhzTmpOV1Qza1Y4U1o2QUVVSm8vZDVObFpiMWtSZmpV?=
 =?utf-8?B?TTRxVGF0U0ptai95Z2NjS2N0UDhXOEJ6Nk94am10dzFDK1ZZdHZlZkFPRU5i?=
 =?utf-8?B?cFBsUGxRZjE4b0lGaVhSQkNxNmNJUjFGYUM0em9rVHEvSWtWM0REaTRIdUI1?=
 =?utf-8?B?cmpPM002NzQ2QUY1WGpJUWR6RVQwalNWVFBlTm0reG14RHdzcDNWTVhhRGw5?=
 =?utf-8?B?VlpyalJaR1R0YWFnUmc0L0dKRzRtMS8xVXlZTEdnc21ndno5V1BUbll1Q0lB?=
 =?utf-8?B?bnlGMmZWQzN6djdlWXpPOTA1Nmw2SFV3cTNHZi9HY1Z3R05OcnZqRVZNOG1w?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2f6f6b-d528-4cbe-19e2-08dd9871bec9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:14:05.7615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkEvgSZ9gdeQqFSU5VIpL3pkO5CpoW8ngoMoZAqDIdpu4TVe0kWGZyMvOjuAZJG94Ijh+L32ltROByZGKKXg5c7q2oYIZb9Ac+XPmL39Qqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217033

Hi Mikko,

On 5/21/25 3:51 PM, Mikko Rapeli via lists.openembedded.org wrote:
> Booting on qemu with kvm is currently hanging on aarch64.
> Root cause is in u-boot and CONFIG_BLOBLIST can be disabled
> as a workaround.
> 
> To reproduce, build on kvm enabled host where "kvm-ok"
> succeeds. For example genericarm64 machine and core-image-base
> should then boot with:
> 
> $ runqemu slirp nographic novga snapshot kvm
> 
> Without this config workaround, the boot hangs without
> any messages in qemu output but ctrl-a-c to qemu console
> can shutdown the emulated machine.
> 
> This seems to have regressed after u-boot 2025.04 update.
> KVM boot can be detected from speed, for example genericarm64
> boots in 550 ms with KVM and without in over 5 seconds.
> 
> Fixes: [YOCTO #15872]
> 
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg | 1 +
>   meta/recipes-bsp/u-boot/u-boot-common.inc                 | 3 +++
>   2 files changed, 4 insertions(+)
>   create mode 100644 meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
> 
> diff --git a/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
> new file mode 100644
> index 0000000000..d01d3d12d8
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
> @@ -0,0 +1 @@
> +# CONFIG_BLOBLIST is not set
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
> index fd1eab5cdd..d8c70da782 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -16,6 +16,9 @@ SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
>   
>   SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
>   
> +# workaround for aarch64 kvm qemu boot regression
> +SRC_URI:append:aarch64 = " file://disable-CONFIG_BLOBLIST.cfg"
> +

Can you make this qemu specific? I don't think we want every aarch64 
board to have bloblist disabled?

Cheers,
Quentin

