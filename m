Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FADC83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 09:07:05 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.56])
 by mx.groups.io with SMTP id smtpd.web11.9433.1753261618826495835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 02:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EPW2/qpC;
 spf=pass (domain: cherry.de, ip: 52.101.66.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOj69k/qMIzFYKu2x0Zi5pPp4pj0H38OhYYow5mjAnf1af6EQtR5Ir5lm5zM0yacFc8+0oq/VxE1kXiJzqb08429lssFq92EK1OC61Ugllx8QrQ9JMLWpetKZOvJZwM7R0UgnevcvtgRTFZXSxyAjhIYiW5b3C9CPZB4wYPUB9XG7xtPPt7NHEYNtqSK61G3ACSnNvPL9iOF/bqsTmZJ42U+t5IB3tt7urqyImW+h6VJcPIOA738emp7OUxu/ElEM1tHXx/O8LwWg7Q8N/sQcDfMc8W8KrjG4ETsIlxilSAdpNYmC2RP+DTP/H58YAVH8Akg3WzzYTpBCLw7xi9/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGGu6HXFdL5uopas7SdFG5qMFZNwauCsGKyi6KFQUPo=;
 b=S9xsqkBGyuZo361xrABzNXA3swn9755cArTa/e0xlQvUOZzeUihdSTl58vJb888b72z14y9Z1uTZUNyJh9ANImko5PBeVJaMAm3z5K8ebSUEmV3fekMzcbDc9Z0L06cvbv2ckvUyVoP0xOncDb2yWncZ5r3BgPFBavS9YtI5fYryVubPoxTqbgd0l4f0d9+h6RtxoweVLlzqu8GBdkP/9BvqD7/CXYo6GSUPgCWBt4KcF8fvUHEMOy0UxI9n/3Q5tL6xO3Xa7BJpNSJnAWREXCw1YCqKLaxDGaja7uQg7GuXMD3MIscT9KnkoFBOQ+d4jJVE7YCVqVrM6B9tuIG6cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGGu6HXFdL5uopas7SdFG5qMFZNwauCsGKyi6KFQUPo=;
 b=EPW2/qpCjGJc6/gRTeTbGFIqrf2Fa6rUkqu9WtvXMyxXXf8iOX/ehxvdhWQLFKV8R4lxCA9RIyZUxNBLW6asqpT8S0kOBxt8OSPQOOSg71AaXm2dILPy+okPA9pNCfN9DepPVPITRTbTjVMzyPSeIEDYO6M7miroG1vu//hfl5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by OSKPR04MB11343.eurprd04.prod.outlook.com (2603:10a6:e10:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 09:06:52 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 09:06:52 +0000
Message-ID: <ed194d92-ea63-4282-bf93-a93e01a97816@cherry.de>
Date: Wed, 23 Jul 2025 11:06:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] feature-arm-crypto: Add +nocrypto to -mcpu when crypto
 not in features
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20250723012936.3799471-1-raj.khem@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250723012936.3799471-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0136.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::34) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|OSKPR04MB11343:EE_
X-MS-Office365-Filtering-Correlation-Id: 75975a07-11af-4695-5424-08ddc9c843b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OVFkR0FaUHlJaTdCSldNSm03dVo2enNYMGo4VTd4VlNRM2Z4Y2VIU3NZaE41?=
 =?utf-8?B?c3laeFVUL3k2ZW1JVkVKaG00MzNTUDBNRWhVQ3lxc3FaSGo2YWRUeEFZbVB3?=
 =?utf-8?B?UnQ3b25TREhSRU9WQnZzeWN6TUdZaUZSa3NBdXhIcnhMLzgvRmtwcUpqbEQ2?=
 =?utf-8?B?a0ZFQ0xzaTVEK1VzRURSS0plY2hYWStyTys5d1dkWm1GWDlQUGJpNU5Mdm90?=
 =?utf-8?B?c09BS3dXT2hUb0VTUVhPY3RKb1BqdEZoSVJ6QXZUZGlORlhLVjNoc3BPWi9Y?=
 =?utf-8?B?NXZHOG5iOGdURWYrTEtjOE80OUNPSHhCb0lvR0dDNDkzMmw1UGxRQjlpZ0NT?=
 =?utf-8?B?VW9hN1dRd1ZrVUs5anRYNE1SNWdDV3lGVGZFQXNvalg0WENtK2xLZU9zUzdq?=
 =?utf-8?B?OUlMKzNEOUgyaEI4cCs2MUpXMkZuYW1CcXEzSmlqbjZYVnBDRTYydm8yTlpC?=
 =?utf-8?B?UEFGQjBxdlNZdHNIYjc3ZldSRGxDMkdsV2hiRzMxY2RUc3BJRk9oKzAyMXJv?=
 =?utf-8?B?RlRWK3Y3bkpRL1JlTUg0SmJweTVaV1V1YWltaWUrc1lBZ216bE8wZUthbnR0?=
 =?utf-8?B?Y1JIL2ZRQm1peTNmalBvaFNNcFdHaGVOaWlBRmljRWJZQk1sR21iNVBtUnc0?=
 =?utf-8?B?UEU0THdiSG51b1oxR1FHRzAxOWszOEppTXpFNlhyeUk1elhORjJ0RmlyMGFr?=
 =?utf-8?B?RHZJWUE4WWZwMXA5TDZpNWxDUHN0ZzFxdmZOTnRHM0t1NjE0MG1xUnVXUnlS?=
 =?utf-8?B?d3hDcDNqbHA2UDRRL1E2VWtqcnV6dkJveFRCT25WQUVGOWE4SkJGTHk0ZVVH?=
 =?utf-8?B?bHZVRnV3S1lVVlp3YWxOWWpIMXJ5QzBzSzlTN05rbGcvWGN4Y0tFUVNXZlU0?=
 =?utf-8?B?cU5mZVBhQ2FWbGkrYnVwY0Y0UjFSaHIwSnNhZFk2QStCamlES0J5a3pYbDRj?=
 =?utf-8?B?bkZpSW9sWFBtcUplL0lxR2l2UUtmTmhZTjV6dk8wZnFTWXphU0VUNmx5NndU?=
 =?utf-8?B?NVhrYVRGci8vQlk1aWdHbEx5WFM5a2lFeVJDSCtUUjhLalZWMytvaDlpcGg2?=
 =?utf-8?B?bzkxdHZsQ2xwWUhxajdLTXQrRExhbHd1ckl4OXRpRnB0RDZmc1p5ZXNLKy9w?=
 =?utf-8?B?bXNwbFU1azdtRnNsdElyZm9VdCsxZUxrK3I0dTc2aTl4TjNxM0l2RDFUNnMx?=
 =?utf-8?B?OFloSy9MSHJSQk5QWk1nOGZSeTIxZE9abVd1M1NuWGZmL2xpY0g5Y2xhUzdL?=
 =?utf-8?B?UFJNdnIzQWVMQVF0QU1OYjROM281L040UHpxUEFGNHpwSVNHVFhTNTdqYWM2?=
 =?utf-8?B?akQvZVFEeUlqaDFyQkdmajdIcWl3VCttMUZVbFJxNGwyaGZGWVl3c0p5azMy?=
 =?utf-8?B?ZHpjMVBIZjJRN3J5UVptZzZWNlNpeVVNNjBCMEJGM0lPcklmVG1GSkhSd3No?=
 =?utf-8?B?dGFMRDRZRUI3NmNtcmlGWmc0Tk1OcUpvRnZRekk0UmJNUmozblRJM3ZRSUdh?=
 =?utf-8?B?c2NONEZKK0J5TkhTdFYwK1JtQVpGNjJYZ2NQUitpekxpQnNGL0JvRlU0MUM2?=
 =?utf-8?B?ZGxEUHhaN1FxY0hWbDZvaG05cDBOWjlwVEtiRndMT1hMTFFiUlRnbDFBQTQy?=
 =?utf-8?B?T1k0TFdvZHNTOFQ5K2U5Q0ZHUWFxaloyQUx5YjFhOE5GR3RyWW1uMFZWeWxX?=
 =?utf-8?B?elBTYmhxandnQVYxQ3lqVnFIY3hyNXZUVWVDNGNQeS9MVC9yclh4K05qWWpp?=
 =?utf-8?B?WWFkQ0tMd2NKblhKVmdqbk5TWVFrWVRGWXl6bGZhcldkN1JQOUVEL0gvbTdW?=
 =?utf-8?B?eUpXY3pTMmo5NzN6TlRTdEJEVGR6TGNYTk9DcFI0Q1F4RnZlSnBvbzdPYmlQ?=
 =?utf-8?B?T0pib29EL0hJUy83TTVwdXplRjdvRXZwamVIOHBDMXQwbUxRdmVmTU96MjEr?=
 =?utf-8?Q?mIAi7/zpyE4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFVqb0NPbklJY1VhbnpZUkxld3FESms2VWVBUHBlMHBXYXp0cHRJSHBYT2Vy?=
 =?utf-8?B?RkJpaVVaaWZMSURWcnV2OHUzUUJYNHY5eTFVVWhodGpsRTcwUEQ1eGNFOTlC?=
 =?utf-8?B?YVphL1VXRUFqc3paYm80YnRXd3NHaTgyeHFLeVZRM0p3QkhEZTdzSng3TnhQ?=
 =?utf-8?B?TXZsUHJ6QXJPZE1SSTV1cTJLSEZRcW1KZ1UrSUwyOXZmSjVkU1UvcG11d1lx?=
 =?utf-8?B?S0owdFVISCtHc1k2MTZwR1JDOWpvMWxvS0FNS3g3Tll3dW9hT0VNbE8yN25K?=
 =?utf-8?B?bFh1Qkh3NDhvOVhCcjVWMTlWcDMwaWlsVjJ4Zy8vZXR5VXd3Umd0VXZOaEl3?=
 =?utf-8?B?amh1NDVhY2VkQmNxaVZKMGVqU1NFZldHMmg3SnNhM091THFZcHREaXJkbEJU?=
 =?utf-8?B?R1BFNWJZeUVtQllWT3JOOFcrRVQ3YndWeERmTHhrS0JzMEtwT2JYREFMaVJQ?=
 =?utf-8?B?U1lMd0RURkVoK2xoV0NCZWRicGJqb00xMnozcEl0NG5BbDRoYXhUSE9FUWth?=
 =?utf-8?B?U1RQeFVQNVdXUWVCOHU2QW9aODhQNFBQQkJ0SWFHeGllWW1CMmsxMUxIZG5a?=
 =?utf-8?B?M1MxWHgzQldPdmhiR2d6NSs2cHRUVVA2eHdaWmtaMlNZYjVWeWRQQUNtQ1Rk?=
 =?utf-8?B?UVVDcVJuSWdwSjJvY2ZhUlpETlZBZHBuTHhISXJpdUhWVGJXbTdKZ0dzQ1RI?=
 =?utf-8?B?VDZERWhOT1lycE1pUnUrOUJNdytDV1FTMnZlNS91aHlEWGtsRlU2c0FPRWs3?=
 =?utf-8?B?eVkyTTJIRFE3KzB0WmJMWXlneGZOKzlGZ015blhVdC9nclo3aDRNdEQ5VWdW?=
 =?utf-8?B?U2RLOUMvZlZrdndHRXhxY3Q2L3VXbEtPR0VxdE9UWEI0ZkV1ZGsvY3BVdXd5?=
 =?utf-8?B?Q0ZBTXZpbWVPa2t1WW9lWDBNNFBRM2FET296VEdmNUtRRGEralk3UFh3Y2R1?=
 =?utf-8?B?Y2x5bDBwSWMvTFRYc09vQkpzOVZXUkprdUwreFBJbEE0WlE2NlFSMnBiVWNi?=
 =?utf-8?B?TUpWSGh4RVVJWmZoNTlJQ3JUTGs3cHkzMEdrRC9FNGgrMjBOMmpJVis5SzNH?=
 =?utf-8?B?TWpmTGdCakhtVkEvZlJvcDB0UnRUYVdHL1Z0NUwxMG9xcndhMG9jdktJSnpr?=
 =?utf-8?B?c1FFZkpjQ1ZEZVpodTBoNzFodTFubXY2UE8rTUdYb1hkQW4zelVjWnpvQ0E1?=
 =?utf-8?B?WU5lTFRvTC81NmlHOG1KS0R3ODB5UkloUmhxVUUrN2RQSERwbmtGaFpRTEFt?=
 =?utf-8?B?ZUI3Tk92ZWtiU2tEM1lCMHp5azRQeGJHNEJRQW5FZmNFVFBBU0t6b0ZhNFpl?=
 =?utf-8?B?UFNmME9Sb1QwWUEyT1MwQjVrQ3VQSzVKNEg3bmdDUG01WE1QNUVkSXBUeS8w?=
 =?utf-8?B?YWxETmVCaENXMkVVczFKWWJua1hwVWNzL1ZremxrUzZHM2tObEhIdFdkOEdK?=
 =?utf-8?B?a2F4MktqQzdWQ01QalRHRDVBTHA5WCswaVF1bHY0b2FGU3pxSnUyN0FTZGJI?=
 =?utf-8?B?amNQMGdjaHZRR2Q0MElOMkE5NkRQU2JRb0J6M0dzQ3FkYlJUYkVtWGIrWkFR?=
 =?utf-8?B?ZWZadFdENW9aNGFzK29RYXZPK2E0OGVoOWJJK3d3Tk9mUU1nKzdWNXFoMXE2?=
 =?utf-8?B?bnY5UFYyN1BkeGlwbkNEd0pyY3FCYkFSRHNSMXBsb0E0aG1OSUdmL0prNzFz?=
 =?utf-8?B?SFFlQmxPcXRvUldkSGFjeWhpSHViTTE4YnVRU3RBMUp2TVFTVmtXbElzby9K?=
 =?utf-8?B?aVd6Wk1yWWZWTzBBUSs4MXdVUE9oNnc4enNpdlJQLzRoT3dmTEdESzFHV2Jo?=
 =?utf-8?B?eURPMU9taGpHc2ZlVjVoN3dPa0MzMUtSSTZReEd5NU1RUHBjRDdKb2JCTWRy?=
 =?utf-8?B?UlhKN0w5RndJRFpwdTA0OEkzbE5TbHE3ZTVoQmo1TS9vWXl1SFIzZUUzMEtU?=
 =?utf-8?B?NTlIOUZoTk11aWNYeXE5MHBaS0FDbGNKdURmNnBnbnd1cUtwZk5WSHM2blZZ?=
 =?utf-8?B?WlNZUUpXaGRjNCs0bi9nSlZnTnJNWDFuR1pqRk5jZnZmMnQrbFE5eDV0amhL?=
 =?utf-8?B?ZlRSekJuWVlKZWVUbVFOWTZkeEM4VjY1ZHJ3WVA5bWl2TUpsVHFuOFl6Q1lT?=
 =?utf-8?B?eGluc1hZRlZxdGI2TEx6QlNKYVltTllDYjdrZll4T0xiZGl6dEx4a3pjMEFW?=
 =?utf-8?B?S2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 75975a07-11af-4695-5424-08ddc9c843b8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 09:06:52.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQd+BKUke91VIEI82ckLv/3uC7aAFViY2yxroyzJssVv3TMH1CtHAoJpP+aO1ID1X/a7dFoVk3LZ82mG3x3gopARJK8ggU78AyE6AnF/MmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11343
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 09:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220796

Hi Khem,

On 7/23/25 3:29 AM, Khem Raj wrote:
> When crypto is not in tune features then add +nocryto to
> -mcpu explicitly. This makes the behavior between clang
> and gcc match. Currently -mcpu=cortex-a72 has different
> behavior in clang and gcc in terms of what features are
> considered default. Clang enables different set of common
> features than gcc on other hand. For example clang
> enables crypto with default set but gcc
> does not, gcc recommends to disable unavailable extentions

s/extentions/extensions/

> in -mcpu [1] explicitly. crypto is optional on cortext-a53

s/cortext/cortex/

I am not disputing this patch is needed but there's just conflicting 
information (to me).

This says

"""
For example clang enables crypto with default set but gcc
does not, gcc recommends to disable unavailable extentions
in -mcpu explicitly
"""

which can be summed up to "gcc does not enable crypto by default, but 
recommends disabling it when unsupported", doesn't that mean it's 
enabled by default?

And I finally managed to understand what bothered me.

-mcpu is the one which enables extensions by default it seems? But the 
variable (TUNE_CCARGS_MARCH_OPTS) here is for -march, not -mcpu! And 
-march doesn't specify what it enables by default in the docs it seems 
like, see

https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html#index-march-2

vs

https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html#index-mcpu-2

So we need to modify the commit log to reflect that and not be misleading.

While at it, I'm wondering if we shouldn't simply do that for all 
TUNE_CCARGS_MARCH_OPTS that we have today?

I see:

+crc, +fp, +simd, +dsp, +idiv as well that have a +no variant.

+sve and +sve2 though, couldn't find them in the official docs of GCC 
(though 
https://community.arm.com/arm-community-blogs/b/tools-software-ides-blog/posts/getting-ready-for-sve-with-gcc-11 
and 
https://github.com/gcc-mirror/gcc/blob/master/gcc/config/aarch64/aarch64-option-extensions.def 
define both, so I guess it's fine too). We probably should report or fix 
this in the GCC docs?

> and cortex-a72 while, this is not as common but Broadcom

"while, " is a bit odd here :)

> SOCs in raspberrypi3/4 have dropped crypto for cost
> reasons [2]. This results in illegal instruction
> traps [3] [4] when building components e.g. chromium,
> qtwebengine, weston etc. with clang using -mcpu=cortex-a72
> for rpi4 target.
> 
> Adding +nocrypto makes it behave like gcc does today. We

s/it/clang/

> do have separate tune if crypto enabled cortex-a72 cores
> are to be targeted (cortexa72-cryto) as DEFAULTTUNE
> 
> They are added to default feature file since crypto extension
> is available in multiple arm architecture versions e.g. armv8,
> armv9. It is optional extention as per spec [5]

s/extention/extension/

Cheers,
Quentin

