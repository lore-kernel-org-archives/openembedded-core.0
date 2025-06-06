Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FD8C5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 08:35:19 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.53])
 by mx.groups.io with SMTP id smtpd.web11.29052.1749198909811060710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 01:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kznTq9NA;
 spf=pass (domain: cherry.de, ip: 40.107.162.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5JMR6R8cPQ4TLlsKZ7rCzGteu1BZdkqBlp8L8hiIvXPkA8DJ/lLU17Hikd3IKjchDW5zA83Rzajai/cKDZKdEsaj/EKcy+f0ihLOFYDg0V2ur1uea5sJNKVwkEv2d2VhAr9CixVu/ibvITzl1zk1PhzaZUR4agq/ptWjNiwPnVKPMsEFGnS65uAK3adTk9xA+x8NSTOfcjC/CzOzQfZE1cYeRBD20CENLNbFqM0uxBzHhMgLYc6ptAaK5qcKfSVspT4zUCtmr6H0Rwnuf96qK0+6ULqEYRMYcAlY4InT+z5ewSC4fC6DnQtlll5p2rFh11v6O0+V314W1S9pPusZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jE8bi/j8oPQKT/Tgq44wNfmjhIDnhGnqsZMXEJwbA30=;
 b=N7akKKc0XFyuZcZgRX2uC593Dc/8loNIse/WEdA9t2Z9dzpoWX233P4V6803czSMUI1rPQDMHcsy6NHBn+MSx8E1AaZqKY24+qt37lDFisEfMzrja8+hT1PrjsHoPLs1x6SWyaCz7Z3FEPBGLv6W5RElwd58B4j9qHlsTrpjZwqwdfEPFIJJ2lU5dzRju6T2NNtLqY2GOR5u/KrmViFio+Ww2Owp0SNg9wAIBFvRGnjX1nmzn1ZOvn2xr7IABuj7nSpV5DbJIvXR6NWdH8PS+hk7gjng04vMLPkkDyVT+2UyVlKZhxUt328JrcKqvp7PDE1BQuHiZEqnD2ZfIy6WGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jE8bi/j8oPQKT/Tgq44wNfmjhIDnhGnqsZMXEJwbA30=;
 b=kznTq9NAQ3ylOh9STllFZ7kJLx39gz7EXcqd4XN2DY2NKCXFe+rV+5bPPKr0Z+rC5ORQGuSocuFyMWzSKjBgLLMmcmdaiqaTvUMT+hRhCG7S7FLOZeY2Ebrzf8gNmlgIJHg0BPGeMzTi2zT8xFtDzms2v39tBYh0pYul70PiXjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8261.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Fri, 6 Jun
 2025 08:35:06 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 08:35:06 +0000
Message-ID: <3f05d487-57d1-4afb-a080-06f77b5bc3ad@cherry.de>
Date: Fri, 6 Jun 2025 10:35:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: move arm64 disabling fragments to
 versioned recipe
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20250605160624.1029863-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250605160624.1029863-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: e6adb481-7a45-456b-26bc-08dda4d50a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NEUzc0g1bFBsYzFCdzhlOE03MHNScXdoOWp6MGZ3ZHBVcXY5WDdJcERaemt1?=
 =?utf-8?B?TUlQTkNYWTlBVVFZMDFTalE5d0ZjaE5OekN5VC9GcjJ2ZW9Kc2orUjFDM3Vz?=
 =?utf-8?B?cmNUWmNZeEZSV05kNHVyemt6T3d1ZUw4aVQ5alE5SDQyZjNoYkJnTW95Zlor?=
 =?utf-8?B?eERLbGt3ZzZxNnFxcnc5L3Y3WERCcktBOUU3QXJ4V0Q4Ny8wcWQwMXdkUzAz?=
 =?utf-8?B?NVRLblFISlFjdlUvTkt1M25nL0NVTHJCVmNyNFV2WjlobWRJVjVSYlFZZXls?=
 =?utf-8?B?VkJKNm50cEh4OG9BVEN1dWpBQkd1VFlUdFpEdUJ6K1FwNXVYemFjRCtMbkxV?=
 =?utf-8?B?RjRvS1ZsVXFRRWUraThNRXdvUCtzQnV5VW9HSUxHWlZjajZuZFgrUHFZVjRD?=
 =?utf-8?B?aHNmSkhzWU9aWFlKS25IYi9hS0dUN3o1VVNhcmY5QmlicmpnU2JGQmhMMGJn?=
 =?utf-8?B?U0ZzUnhRdHlPcW04ZUJueUZIZVBGRi9nUEFaQVM3MlRaZnVFS3ZFWW1lcU0z?=
 =?utf-8?B?bnFoTC9ZeXdoQytQVGFPaUVTdW52dzNGakJoSDdDVkwvQ2xSTHNMdFkxOXE4?=
 =?utf-8?B?U3NpeGZYOGNjZlZBZUQ2Q0x2UkdQMk1BdTJwcmZobDZJU0RHNThPbDdnZXpk?=
 =?utf-8?B?bFBHaUR0clh3bXlmMUxkQjJpaTNrcXVUSzVyQVpqbHl5Q2l3OTJhRHdrSGFM?=
 =?utf-8?B?ZjVJQUxBYkNmc0p4MTFzVDE0a242UUwxU0N0QU9aY0F3UUw3ZW5vWG1mWURP?=
 =?utf-8?B?RlorTm1PeTlvK1BPTWxJQkIvN29RNzRIS24xckIrL0hxZXpKekM0UzZLY2M2?=
 =?utf-8?B?S2UydWRmRDlUWWVvTEtCM3ptVGFMUFo5RDNRbGU1RXJmcThrR25seWJlNlJt?=
 =?utf-8?B?cDhzb1pQRDQvOWIwa09YOWlyd1lLMllKOHRYR3pQR3ZDYnFBWTN5MUg3cXIy?=
 =?utf-8?B?NFNCbUFDU2RzYUwyNHdndGtKSjZ0dGp2ODA2d0xpd3JzSllBWlVWb29wcDBH?=
 =?utf-8?B?NTMzSmVCYStDVHZhVE45Mlptc2NXSHN3aFAvSmFhZHl5MkdSY0ZkUGRWME5Z?=
 =?utf-8?B?MDYzU04rRGNQMzhZQ1c4TEtCRXVOYkdiNTAwdHJ6eWNjdGwvNG92MXg0WTNT?=
 =?utf-8?B?MitoWXYyRkJQSmdxaGVJWWl2UVZmdjNLeVFIdlZRRzRsZU5xQnZ3T3ZUZzVK?=
 =?utf-8?B?aUNIUENacTh1YjM0WEpUQmVCZmFQcUpiZU9uUmMzN2ZRczlGcC9nSWNBZFhs?=
 =?utf-8?B?cHFKWWV2cEJmV2Y1YkVhUlZkREY0cCtHMjdBN1lGM2ZyWHhVblpTa251cHUx?=
 =?utf-8?B?NEllc09RUGZEbkQxemhQc2dzWTI3R3NIMDZpUEVQTi9rWFowdHp2aHhhZkFX?=
 =?utf-8?B?dE5zQVBmMmdwMTAxWUZsTzQ5dktrbnp4OUJuNFA4c3JROGRHVHZIdUNJdHc2?=
 =?utf-8?B?YUVqRlNUREh2TmRXVGZPc0wxZ000ZEU3cU5HRkdXZ3dyN1h6dTYvTVNIVUky?=
 =?utf-8?B?V0ZRL3E4L3RnakZuUURKN01CeUFrWDhIY1RNRUUybUJ3elhFN3doV1I4dUdS?=
 =?utf-8?B?NjVCd2pST1E3bGVYUzZ3YVczb1JibnpoaktEQjZqcENlWDBBRXQ0ZU9CRjF1?=
 =?utf-8?B?Z2I4ZEF2RndudXEvSEhsdzc3K1QzNmZ1NVpyczlhT0RhSFVFZjRlK3pkbzZU?=
 =?utf-8?B?TDRhcHYrTFZRZjdMVVBBVTZLTDZsREI4WHJGQTdwN0pmMVRtTnN5dk9TakN0?=
 =?utf-8?B?bHRkL2EyM1dZNW10K1JXeUlwSzNod1lBNW9EWmdPaU9iNFN2eTZ0a0NPK0d1?=
 =?utf-8?B?NGx3ZmZCZldEYUppNUhyZUlQQ0d1cTJoSkZVRVo0SncwdlRmSld3cFM4blVu?=
 =?utf-8?B?bHpkQzNDdHVmbXlBb3I1aWM3TmFZQnJPSE9vakZSWU5RWHlLNHYrOU5Cb1Bh?=
 =?utf-8?Q?lJB3h78Nb+0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M3E3QWFvNnRVeEhMSmJMNUQvclViZWpEWkx0R2VianpaM3VXL1FueHpoRFIy?=
 =?utf-8?B?RFM0L0I2QUtldDkyZWhXakZDUnFCOHZ2M0JYL09MbXlaSmp5RU0wM0laQW5v?=
 =?utf-8?B?K0ZUNFhkVklFMllrS3lQbWhBVnNSenBzWlhhMU1GQ3hNMTg2NjZoRlpGWk1N?=
 =?utf-8?B?RlRDZUhjbmJiYnNGRVdKTWo5R3YxQkxXK2JkNWlPYjkyYkx3dldBWXliT1hG?=
 =?utf-8?B?bDFSUm1mTEdWWGg2UXVVTGN0RExuajRnWlQ5a3Bucjg1YmJDY0NXNUdHN1dX?=
 =?utf-8?B?MnNJMnBNMThweUdhL0dhdCtDbHlrOUs3aXIzaHlWeEQzbTNUcjVFSGdTUXpR?=
 =?utf-8?B?MXRudFAvQ0xacFRYVmp1YS9Lb3JBREtGMnFFVGVoTUVheEsxeFhkN3Jlc0ZL?=
 =?utf-8?B?NDJrSU5vcVZRa0ptaTMxWWhBMjZnektiL1dFblU4dCtjVWlXN1RCUHJMRC9L?=
 =?utf-8?B?ZkZRUWQ4bUJwUVIvMTNUM0JGdFlkMjQ5RDU1R01YL1FUc0pxVWRETEFZTHpK?=
 =?utf-8?B?YU1lVnpsLzFwK2FINUZiWVd0QnhTUmpxbU5qakhad0ROQjlrTEd1OUlPZnJh?=
 =?utf-8?B?am5pT01XSCtIR1VpODlqYnJOT2VxejczTVo3anVQNitIL1daeG1hU0YxL1dD?=
 =?utf-8?B?S2NPZVlycXBLWXRpancrUjNOTUNEc25BMTFrNVEyakNMNXRYQk5rWm5jWEJG?=
 =?utf-8?B?NGgxeWNTU29KNVNtSTNsL3FFOE0rY2p4S0ZpT3NzR3lRN29WMGE2RVZzcGY0?=
 =?utf-8?B?SFYzRWFRQmFpazYyMUZMN1lOczh5WGh2Qkg4YWpHMUZDeVZ5bGtPcGtqTXNC?=
 =?utf-8?B?bUh6RU9hRFo4dVNNV2pYbHBYbEIwbTEvWVUyRExrdjNsY2lqUnlCL2ZMR2pS?=
 =?utf-8?B?TzRrQnVvWllJSGJ3UHR1UDZ6TmdkWmZvK3ZtMUhETCtIMlpPMzZvNzVxNDhF?=
 =?utf-8?B?RmhqZDJJc2RMNWxGb2plNTZLOUVpaHF6QnpFZWlCZ3N1eFJ0VGVRa3JNRHJm?=
 =?utf-8?B?L2dkVjk1ZS9nbXM5bDJCNUE0emtVcncrZHhENnZkOFE1QU4rZUxXWmpQOXhl?=
 =?utf-8?B?WVNGdFR4aWpCMmxpR1U4S3cvcTcrN2JvZE83Uk1sSWgvVXJpeEVkbnYwZFcv?=
 =?utf-8?B?dWQrMm1sWEdTSHEwNm1UWEs0d1AwMnllSW5KZ3gwdHlSa3pYcWZIa2ZmRkIv?=
 =?utf-8?B?MVpvQWRqUXAzeVJxcGdYZGk3cEFHeVBjRXVHNDNQUWVyQnIwV0tKOG9mVnJ4?=
 =?utf-8?B?N28wTHRQcXFMa3JkR1RpWUJYdDdJbTBoM1VQT2pzcHYyQTM1U0ZYa3pYQkY4?=
 =?utf-8?B?eVI0M05mYUtlZTBGcUtzRTF0Z0lCSXhiaWVmVnh4QlNRWUlSRFBUUzN5Wld6?=
 =?utf-8?B?NEwzemJJb0FVQVRwK3dnQm1MOWs0c21PWGNIaW9WTFp1NktWNUdwbEJ6UFlK?=
 =?utf-8?B?M212Q2xwbEErQkVYRkYrczZtSForc0ljY3dFeGpVR05WTFJmMy83ajRSK2lU?=
 =?utf-8?B?TS90dE1BZUZ6blZsbHZ5cG1uU2pRYllNK1hNMndWV2RHZ21ZSTRGSnBqYVU5?=
 =?utf-8?B?MzF2TEdjbGUvd1o2eFRaLy9nSHpFa3JpVTBIZXBaV25MMStQNTJsVGUrYUE1?=
 =?utf-8?B?WE12RyttVjd6RHVIQXozeXJMV3dmRkE5WHlGNGlLV1YrcFh5ZmJ2YzFWckVh?=
 =?utf-8?B?UEVFZVgxaDBOT09WWk5ScTJTSzVGU2wreWN2RXdqNFpYZlFZb3k1cEJONERE?=
 =?utf-8?B?dDlRVHJBUi9sazBlN3gvM0RiMFNLSUE3bGEwQm1ReUlVL092MGgvaC9La0o1?=
 =?utf-8?B?ZDVDdjFNZEI1dDRQQ1RJaWVyaXVpRms3cHdFM092bkJmNFZZK0xtcnNXeGh1?=
 =?utf-8?B?SWUxZURqblp3cks0WkNUekJSajNIZzlvdmozdGZqV1RPVGFtVWYvZWlQRFhv?=
 =?utf-8?B?M0lZRVMzeDdzOG82Y2dQbDBkaWlFZVc3TDhRTFFkNm8wSWFXVjR6Qld4aytt?=
 =?utf-8?B?c2ZIZSsyNFBmVTB3ME0rS1hSNzNGT0NDRzY3MFlLOGl6dUpRYjJ4NmFldm1l?=
 =?utf-8?B?MjFJcDMyMFFpamRnL2I4b2Z0ckxWTGwySXNLM2ZFVzhWT3Z4eWt5SXI2U0tL?=
 =?utf-8?B?WlJkQWlDZWRtaUFhUWwxVm5YQ2hXeE4xMUUwU1k5Y2RtL2tvWXduNzhRNEw4?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e6adb481-7a45-456b-26bc-08dda4d50a32
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 08:35:06.3763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzX8ezTm43egwpXXsnHng7hftY7JiEPxosYQNxKLGJ6GtaCVs40Gdjc1EEyuRiRkwEW3cBt0CeEH0Yv2eRyrPvhiAoA82q213eHxdBeEa4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8261
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 08:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218120

Hi Ross,

On 6/5/25 6:06 PM, Ross Burton via lists.openembedded.org wrote:
> More than just the u-boot_2025.04.bb includes u-boot-common.inc, such as
> u-boot_2023.07.02.bb in meta-arm.
> 

Oh yes, we do in our BSP layer for example. Thanks for catching this :)

> To avoid other recipes having to carry patches that may not affect them,
> move the files to be specific to the recipe itself.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-bsp/u-boot/u-boot-common.inc | 4 ----
>   meta/recipes-bsp/u-boot/u-boot_2025.04.bb | 4 ++++

The u-boot-tools recipe also includes the u-boot-common.inc so we would 
be losing the patches in that recipe. I would assume CONFIG_BLOBLIST and 
CONFIG_USB in the defconfig fragment wouldn't matter for tools, but 
maybe...? What about adding it to u-boot-tools_2025.04.bb so we don't 
have to worry about that :) ?

Aside from this, looks good to me

Cheers,
Quentin

