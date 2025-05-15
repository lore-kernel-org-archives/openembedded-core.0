Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2D5C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:45:34 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.65])
 by mx.groups.io with SMTP id smtpd.web11.11367.1747313132589598470
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HAPRKtrV;
 spf=pass (domain: cherry.de, ip: 40.107.21.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eq68bhy7aUrP8YKzmuqTSGv40tWVvKSZSm9MbkogE5GHMVNwh4Pvx7Rqy0tGiXVQKzDsa+ci1iV3yVlNal7x14+Cuhe0aOxpb+p7wDgbTzNei9+H+xdmqvOhOxE7NHN7PEWLNX2PPe6czW3qld4QKhPWcgoWfUkPTh/Me1xndJI2Uu9nM7f5WR/ezYuaPvHoX7HhnPP6tZXVVJax/PFDmUzejK+1/9T0sq6dRaQgW9wkQsCPCebMPTtK2B3zi0lDzbMJiUH5510NUsy8maZp5FfwuVuzrDu4aYCZ+oBT3ER/Hnxj5FdeXpikIaU5nqgLxsxL/zTlr38DkvlBSsiBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IA50MCgDAEq2yP+NkZfsTNtLvzrCTUWDeQbY/VOzAGw=;
 b=odNIvE6hSE7o4QhY0MHLbLfAUtrnXaquA9r59EFUfrx0x0J5+i7qcSK+YgM6o2srDuZgQRxvEJef37UeJUvez8jF9LQ7+66JSYTMy5ulwPluRv/DpKCJ4b8yEsadY88VvSDhzZssOLBNgRHhjWoGHoGzAgwub8QUoEM++MzesZX5kC++O2rwv5THlYu/wTC9PLZ4U9bcOtEVtO36/3NXaX5DdeoPQsJnepngHG/4u1W7Vj/nvoFRRzR5Rk6Hw1Cyw/diuZwGfDhKALjS36sMTVza9acka78BfJn+SfwGKOLsP1NjWqhMKqPaQ/FQwyignZPUS97IY96xZUEew7mk6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IA50MCgDAEq2yP+NkZfsTNtLvzrCTUWDeQbY/VOzAGw=;
 b=HAPRKtrVLwCFVkT66rFDWU0m5ejWmNBQh645igsqBXtHugONLYx9nkssRoCXzPWZa0ELiRgnwyZGTtoGi8hsSn1dxxvA2Yj8pW+HA5e4duSrTlIgm6wdvDKo4pAZ3M4cUEAF+/h/vQSenZC0PQRTEMrQn2CXDK4njvQEyrUt68I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PAXPR04MB9090.eurprd04.prod.outlook.com (2603:10a6:102:227::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 12:45:28 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 12:45:28 +0000
Message-ID: <b3bbb9fb-458d-4718-a19a-b188b274a794@cherry.de>
Date: Thu, 15 May 2025 14:45:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 04/22] kernel-devicetree: export dtbs to
 sysroot
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Cc: marex@denx.de
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
 <20250514185225.162998-5-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250514185225.162998-5-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::18) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PAXPR04MB9090:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1a4eee-bcdf-46be-737d-08dd93ae5eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RHR6MG1nZUdiSGg0OEVtTGluRGtVQ3NOcWpxc1FRYjhwRkUxVFIwSy9XUjZp?=
 =?utf-8?B?SEJmN3o0S05ZQk13OVVaVnlUdGQ2UE9wVnlVS1RmYmgvMk5mNXBBMlZ4Rmd6?=
 =?utf-8?B?YXJsWTRqeDUxNWc1U3FvTVlnMGFmY2ZBWXBnWlRwdVZnV1NBTjN2L2RmWWRm?=
 =?utf-8?B?SUVnWE1LR0JLcGlsTUlUU29HN3dVNXhTS0c4YUdvMHFQL1ZBT2FEdHNnUFlL?=
 =?utf-8?B?WWhQTWRQeFZqY3Nkay91K0ZkR3J6MXVrTjBSNnhWSklCVUcvZWdFTTFQandD?=
 =?utf-8?B?WXA0TlRMWEp1a1RXZXNFeFg1Yk80YUQyVXhoUUZxazJuOFRKeHkrUm5sbEJP?=
 =?utf-8?B?RzQ5a1d1amVVRFRQQ3FJSUFWQlkvSjVoM0dHWkJHdDdBQUJHWmQ0ZlJieDdm?=
 =?utf-8?B?WVRqZjJ4czBQMDhJWGFuMFhXOW9VZjBRTEhXcUVmK044NTV6WE9RRlJaZlUr?=
 =?utf-8?B?OGpVQklkL2Q1UWtMV2lkNTRybTlSd2dXMlo2OWZ1SFNjNnlGa1NWLytvQUg0?=
 =?utf-8?B?WmlEMFh4ZEdDcFpUQ09QejJFWHd0OGpWQklVWXdma3RZMFVVSXVRZG5kbjU1?=
 =?utf-8?B?Tnhrc3k3QlIyWTJic0pRekd4bVdkaHJqWG01SDlTYlFQWFdmMXpxaC9sOW9T?=
 =?utf-8?B?bVZraFBCR3QrUk1sNUpqemkrYjh4TXVPNGhYam44RlpUSkdmMXVuOW15ZC92?=
 =?utf-8?B?WXpobWZqMW13Z3NpeDNXOXJyY0hRQ01STmZralE4Wi8zTGhLcXVKYnVEZ0ZV?=
 =?utf-8?B?ekhjYW5pdmhJWEJJTktjRFExcCtuZHpySlhIUkZMTGRQK3VBY3daWlFMNFhR?=
 =?utf-8?B?YzZVbGxiOXNnbnhXeWFqSWVmc1JlNUR3a1VUdytKOUlHTjFSd2M2SnlkT2lO?=
 =?utf-8?B?ZGt1WVJyWlZhQ1RsTEVscG9QWGVNMTNtWVAzVVp4Z05sUXJQalZXNHlnNm0w?=
 =?utf-8?B?TXhCaWVUY1FteXE3a094MEh6SjI5Z3hoTERDWWhIS2hHeTFiYVZyWU5jMUxy?=
 =?utf-8?B?ZXJiZ2hGa29IdHpzMGVuYU1BS3pHRmpNbnd6bUhjVHhkTDNhR1NEVE9Wcmlp?=
 =?utf-8?B?cHlHU3dqYkV3VklkRHhoN3ZMSG9SSm9CTE9zWjcxNHNjUDJQT3ordklkdHls?=
 =?utf-8?B?V2xIR0hhWXNHdHAxR09RemxPOFFjRTdZU3IrQ1NodnMweTZUK2FmSHJIemMr?=
 =?utf-8?B?ZTdKRzNYTmg3cjBHc1pXNUxGNTYwdmIrNlE4czd2TExiL1ZWcUQzc1ljb3Ft?=
 =?utf-8?B?b29KbEYrSzlKMjlwcjdjUXhHdDV2UlVFZ0paRStWblNScFV3a1U2dkNBd3Vz?=
 =?utf-8?B?QThFRFZiYjROMjY0em1jSEhNVHRsNFd2aG16dkQ1d2NLUXpTRUx6ZlV0Mjg4?=
 =?utf-8?B?NE1ZNTZQc3h2Tm9uZjN6TkFJY3A0UjFlSXlDNHVPN2MwVUdxanVoeUx6czhS?=
 =?utf-8?B?N3pSekZGTWFEcEdKSjQ5UU5JdURvemdBUFJpdmw5a2pzK1lEVkFYd1h1czk4?=
 =?utf-8?B?Sm1qOTcyeXFjUit1THExQzhQYi9QZkthZlA5QndvVjZiTlVyemNTZWROa1hs?=
 =?utf-8?B?QitEdUdMZ1JqSHRRdTk1U3JDLzNXOXlxZ2FMUm1Wb2dxYzRjbnFTQ09oY25C?=
 =?utf-8?B?NXQzK2NISC9ZZTV6eCtXcnQvZ1diMnN3VjJmMndBdllSZmhqVEN6SjV4T0h3?=
 =?utf-8?B?VHJpWTl6NkxlTktwWElmU2hyWDd6Uk5kSjk2c05Gc1lqQ0NRamZETHV5YU1j?=
 =?utf-8?B?YkZROGNrby8yeXJPandpS1pGL2trd3AvYWlERkUrTVRmaGExc1JZbCtNckdB?=
 =?utf-8?B?M0c1V1Q5K01IMUdYTFdidm50cVhtRUFRMnFoK2hWdGpJM09JZEdHYlRmSUtN?=
 =?utf-8?B?MVdmVjNIaURLbU5SbXJVa1FOZTRsMFIrSUNRV0pJano3UVdNNlp4cHBENXVa?=
 =?utf-8?Q?ETaxwhzfBJI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0JHQzQycUVTekh2RUNrRENsazJZV25nM0hkS1dFKzJxMG90Z3lQQ2JBQTRz?=
 =?utf-8?B?MjlaVWxRSHJtS0czeVJ6MnVsc0hweHNDVFdiT2tMSG85TEtuZVZxREw4Q1VK?=
 =?utf-8?B?RThMd25WN1FxSjVFQnJ2T3ZpbXhtNEJUS2UwWFVsd0UwTkVhR2E5a3p2OEdK?=
 =?utf-8?B?LzBUbkVWQmkrRUM2ajRKbmloWVlpMTRyUWZaVVo2VGFMMXpiS1Q0bkNDWFJu?=
 =?utf-8?B?TmJJT2d6UE1Td2FEejJQMlNwRjNGK2NScWErcjE4R3VHOFFBT1poZkdtLzZU?=
 =?utf-8?B?ekZ0NVd3dmo5b2p1VWg0bFJEVG9MdWEzOFMzdG1DRFE3ZS8rMVdpZkdxOHla?=
 =?utf-8?B?TzVoQjhpR1pvcW9NL09WTHBzaGdSam1FT2d0QVdIZEdBUjBpaUJuSU5LRjlE?=
 =?utf-8?B?ZStVMWZhdHJMeDhoR2VCWWV4M2pRSEdRNHFLaFQ4WWsyTWNySlRjMCs0Titl?=
 =?utf-8?B?UTlUNk9wQ3pySFQwWEpsRjRUREdEZVBmcnhDK2dvbVNHNjhjU0hwbXhwb2ZH?=
 =?utf-8?B?bUx6ckNqYnNlUHZMUG1XZUd3SDRXMDZLQ3dGOUxrTVZaQk9oQTM3bWc2K3k3?=
 =?utf-8?B?TFkzdU40dHM2UW5icG53RW0zL3kwZ0s0RDJSand6ZGQwY0NMS01uYVF4MzFa?=
 =?utf-8?B?L2FzL1BEWU42UVZJWklkYVFONE1hVHNKS3c3OFNidVhRRFVaOGVreHcwZVQy?=
 =?utf-8?B?czVmMGIyQ2U4bzVmSEM2T3pZUlB4RjJaWEFmOWd5TXQrQkpta2pSUGduOEds?=
 =?utf-8?B?VndvT09jQ1hmYW5nMGpoWk1qUHcraVViVTE2QU5VVzQwSG1DVjRsaXZOZlk4?=
 =?utf-8?B?dmVYaXRYS2dBaWVIdVQxRFVadGw4b1dseVlhd1laUkl6Wk9zTHlxdmovYTFI?=
 =?utf-8?B?ZER6WDhQbGpPQmp1eFVvaGRIc2h5NHdtb2ZTN3ZiLzR4ZXA2RTJFRXc5dHZu?=
 =?utf-8?B?MmQwc0RvdHpxdm9meldFVm1MTzladzZ1NnJodUN1VUxLWVQzK1JUcjhLNGZJ?=
 =?utf-8?B?S1pCM3l5NWo5QWVFM3UwNUpiVUpPa3U1czc2U2hvc3gzNHFuN0hzMkwrM0Fz?=
 =?utf-8?B?TGxZQm5DcWVmSWE1Tms5TU4zWDIyUGE5bklDUGppNllCVlBGTWdrcVZOY2xY?=
 =?utf-8?B?Zjdpd3FGOHluVEFVWHFDaHUwSkNJbURaZmxubWpGVVAwR2hxQVZSTzIvc3JM?=
 =?utf-8?B?SVFRdjM5dVk4dWtnbzBOeUd1Ry9ZU05JV1hrcURINGQrNHJGdjVsMVlaSWwz?=
 =?utf-8?B?THhFSjlIYnA4TGpWNHk5RFo5VEtUV0lNZndsOGVDckwweFg3cVkwR2t4WDJy?=
 =?utf-8?B?NStVSHRic3FORFhDbE0wb2xneDMxaGNNYUNFVElNamFmaDNKK09kVGtRcGZY?=
 =?utf-8?B?c1lNUDRUVmk2SVZkS1BFWXVDbW9xbmdQemdqaDBFT2tCSk9QQS9uRy9oek56?=
 =?utf-8?B?R3hRaWJwemovTmV2TCszWmg5TmdjdUEzd0gwTXJnU2NBN2NORW84WG1Dako1?=
 =?utf-8?B?Q2kvSzgra0M5RWRKai9rSkNoOTRuYU1rVENiS2NOT0hoTjV2YW1KN0pIOVVi?=
 =?utf-8?B?QWY3ZXhhRmxsaU9KZXExWVB2R043cE9LOVdPVnMvUnpXSHR1RXdySVJ5N2lj?=
 =?utf-8?B?VnlKTVNFcS80SjQyRkhHQ3FKb08vYTNqTDJTZXpUN1lyZ3U3ZkxLcmFuMHJQ?=
 =?utf-8?B?ZFlwcUZ6SlRYZmtxcmVCekJUWnh4NTJHZFBjSDh6cFNtYlhYUkRnVDZDTGVo?=
 =?utf-8?B?TitoQ1VPOXp6L1B5UXJsMUxINkVBOFpBcGMzdno3WDlzZE1GTUw1bEgwelFv?=
 =?utf-8?B?QXlLZTFhQ2NmTVRiSlNKd3duTHF6NmdrMldBZitRTStsT1JSelVHRzI5V2tO?=
 =?utf-8?B?R0QrSlJCdVBTOEJOcmpacEZBLzZYUnB6Ny9VMTd6OUI0K245YWJzdDlwY2FY?=
 =?utf-8?B?TldaMVRpYk1hU0k0MGZZQ0RPdkJ1WE01dGs2dUI1NkRlMEdnWXZabXFoQWtF?=
 =?utf-8?B?VlY3UWcwb1FmVmRaNWozTTZ4ZTZLVmFoTmFTVjJ0WVkvYk1LZWk0UUxla0hm?=
 =?utf-8?B?YUJXN3J6RWZleitqbEFQQ21Ta25JaTd3WnhpOVpZZzZpV0YwZG5UWXkyU2d2?=
 =?utf-8?B?MHgxRVl5SGc5YjZRSTgyUnpiQXFjdjBQbkk1TlQ5K21ZSVFIMlN6MWE5dE42?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1a4eee-bcdf-46be-737d-08dd93ae5eaa
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 12:45:28.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgwsvoiy4VuIIS9YYbWjdJ0Fiq/HmBhO1PN6fx44oygAzr4dSzEYIPhQnqMWqfRG60D29bmr05nIEU2tTCOJkmwbXZmluHLx0dC/Nz256sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216667

Hi Adrian,

On 5/14/25 8:50 PM, Adrian Freihofer via lists.openembedded.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> Forward the devicetree blobs via sstate-cached sysroot directory to
> other recipes. The intention is to create FIT images independently from
> the kernel build folder structure later on.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   meta/classes-recipe/kernel-devicetree.bbclass | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
> index eff052b4029..75e394c5826 100644
> --- a/meta/classes-recipe/kernel-devicetree.bbclass
> +++ b/meta/classes-recipe/kernel-devicetree.bbclass
> @@ -88,6 +88,10 @@ do_install:append() {
>   			dtb=$dtb_base_name.$dtb_ext
>   		fi
>   		install -Dm 0644 $dtb_path ${D}/${KERNEL_DTBDEST}/$dtb
> +
> +		# Provide the DTBs also to other recipes
> +		install -d ${D}/sysroot-only
> +		install -Dm 0644 $dtb_path ${D}/sysroot-only/$dtb

Aren't they already in ${D}/${KERNEL_DTBDEST}/?

Why the need to duplicate?

Cheers,
Quentin

