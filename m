Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE957C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:48:57 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.65])
 by mx.groups.io with SMTP id smtpd.web10.84798.1754045329791999020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 03:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=oSQupUiD;
 spf=pass (domain: cherry.de, ip: 40.107.162.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YutnZK630Ls0ojkDqlNGow2eRtKSaHWol5EyHs/JqvWMGhPjMq5RpbRb8HzpU1DlAzGCDqTuZM3at6oLXSNhDuJT1SkwRhPjUvzs2hMFQoLVrdPNJBNq7AgurKCFPI8Evf88xKJm7t8s2hPrGoBJdBP8L6k9ulG6Xb+9VhKoZ/1fO40ej9CRd+FMUE09npcxUoOtVfHYgjeaw3bylloG0GcWBRhiwU4oGFU4axmX6Q7LTll13cxkjeeD+ZaDt4gSm5PjLzZgaImD+knGlMr8QbqCxEttDPG9Rwl2uKiPS7gvkgq9MqUS4DopurSAIiqz/Gy6OMhXPBRuDvMRe7zkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5w4goFAQeQpHmNkkHa56WS8JasRJsD436Oc8cHyc14=;
 b=xAs9rXJFbCjpIhc1LsO9PvUNQz1ZliyPq5Rh7efpSJ3Zb2QHE70+KZmtlQsg94cXaOmV/tOJLJ414drBzIdam4u3k9paTYUiZrMH4lO6ljG7iIsi2MlZd2H8kYY8e2NYEkCeDoiwRnJMLq03dciAls43p/dRt5jJJvTF26AM6WnlwVpqxAWQ8NJOz1SHYYUQcKS0NiQNAoPjEAOzRGj/+CbCCNmo1pafEaB5gs8pP2W3/xUBZpB/acH/c7Q/TT+hKOvn/nqkA9ryxXeh8yM2GAaUXPhWFQ80EX0m+WpPd8c6x8djK46oS6Wr6CBJ/X2UX/GVOaaarlMsIKGdbXvjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5w4goFAQeQpHmNkkHa56WS8JasRJsD436Oc8cHyc14=;
 b=oSQupUiDLGcnpEWLpvjgb5fx16qecvGx0lGMudEeajLHCa+ai+KvVjX87IZxYLEhqV/4VcPG8+mTmfDS4nUEj1C4mBwqZTP4EFUrjZcAc558jUQCsfeYaeBA9qwM0rX3uM7TaytQ4y9E29Bs5YSIo8T28MxURrzZ8FB9jzrIsNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 10:48:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 10:48:45 +0000
Message-ID: <0f213c21-5916-4f41-8534-a2d2ea0aa73e@cherry.de>
Date: Fri, 1 Aug 2025 12:48:42 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Add xz to HOSTTOOLS
To: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1753776105.git.liezhi.yang@windriver.com>
 <b35dc1cc758d4ea4a58f26403bc0ab0cc88637a3.1753776105.git.liezhi.yang@windriver.com>
Content-Language: en-US
In-Reply-To: <b35dc1cc758d4ea4a58f26403bc0ab0cc88637a3.1753776105.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0107.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: a0106ecf-fb9e-4276-1073-08ddd0e8fce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHRsZkd0MGhqcmFmSUZRMGpKMUhSYXN6djhBY0pQU1U1UmZEampBallKL0pt?=
 =?utf-8?B?U0xiUG9OSytaUDhmeVFRTFNINDYxemh4elNXRXZOK3NMVE1yUWJnSVd2TEpk?=
 =?utf-8?B?V2lFR05FSkNNTFo0bnM5S0NkQTFWYlpJYmZGeG10QTkxM2JWT05CSTcxMFBC?=
 =?utf-8?B?L05MMTRIdmg4TVU5S3VaVTVCbVFSTWl4N2tsV2UwalJ4aHdadGZ6RGdLZncv?=
 =?utf-8?B?eThOQkZvYWNDRXgzZFNDSUFFR0MzcSs3TitQVEVWb3FpTWwyOGdFTW5qVkQ1?=
 =?utf-8?B?Y3RFVjFEVkFFSW1JQUJJT25UdXdEQlpWS0ovYW5FN1lDZDhEeUdtaHFPOWlk?=
 =?utf-8?B?dWd6dWZRODMrempqN3E1V0ErU3VvOXZObnZRUWU2LzZhUVV3SWpoLzlwekUx?=
 =?utf-8?B?MjRkTTZ3andmb1QvTHlMQzNjZ21CNmFUb3dUUnh5MVQvUm9RdGpLZGp2ckE3?=
 =?utf-8?B?aXNDdHRobFNYa0ZHUHJXTkhlRlFoTHdkenNoVG10RVp2cGpuS0ZQYzc4TENj?=
 =?utf-8?B?VjdsSlBPZlNQdU8wNHFua2x4M1RpZk9YVU5xV2crQXNlQk5zTTk0eWpORzBI?=
 =?utf-8?B?bjFicXY2bXJzZytMcWY5RG1HTklVanNCWnQyTlg4THNCcjJVNXhsVTRNYnUw?=
 =?utf-8?B?QXF4S1BkekRkNWM3MmloZzYvaTFmRUxoUFRCczdrUCsrMW5ZajlkUWsycVo0?=
 =?utf-8?B?ZHl6bDdCTk8wK3YySTc0dDBMenVZZjJjSERuSjQwa1NuUG9aSDBCTmVyWGZF?=
 =?utf-8?B?OUlkejB4V0NKYStvdWFXeHdVcVEwSk1DR3hMUmt3OXBXcTN3djRuRWR6WEx1?=
 =?utf-8?B?UDhIZ3VsdkZnR0srb01jeDFqMHowdjFNU1g0aE9jbHRUT284V0x3SFJJK3BN?=
 =?utf-8?B?WHAreC80TVViU2FqYWZCUGJIOHovUk5wMTNXQjZYVTJ0NWhld0dDbVhiNGV1?=
 =?utf-8?B?SzhOVW5aVjFBY2xMV2NpMkFwaFV2WFlwczM5bEQ1SzFQdlR4NDhtM0l0SGNw?=
 =?utf-8?B?RHJFVUZEdTdPd0NkTHV6Sld3TkNOamtEQlgzMmpCN1ZOK1VJU09sNkNRVlQr?=
 =?utf-8?B?em1lUnZOY0ozUzI1TWZSUTVFWFk5MUNFV0tRNWdyS0F4SnhDSlhKZUlwSS81?=
 =?utf-8?B?OGVMQ2hheTZIeUdTbjN2bzV6MVdGSXVoSUhqWjdLcmNzOUp6WXMxV0JXWnY3?=
 =?utf-8?B?OGp1MDJhMm9Gazl0NTdVZGJSczA0UXRpQzRnQU45OGFkMEV0MjhMRXRSUkIr?=
 =?utf-8?B?OWNLZW43dXk2WitxTGdMMUp0dlJhaDhrb3duMUNkVkhnclVFTDUrejdCc3ZQ?=
 =?utf-8?B?ZVIxcFg2VW9SOXMzaUluRFFPeUdDdDA2Qng4bmN5UDlnMjJ1b2hGeXZSOXE3?=
 =?utf-8?B?bW53bHUrNzFETEtZUHBnNEJ2MzM0VE9EYUVVdnc4eEVJbEZ6VUNFTnZGRDdN?=
 =?utf-8?B?YjRJWkh1TXg5MFNCaVRSYnNYeUY0VG5LWDJiQXUzZW4yaGM5MnF5R3JwNk12?=
 =?utf-8?B?YkFYanF0cVk4MW5TMHJlaFdseVQrL0JuMW42UU01Skh2ZUcrQXVmRXlRVnll?=
 =?utf-8?B?QXpTRm5NTWQ2TWxrYmFXUHF1a3lsRWh6ZHRXbjJvVVdGTElnNUlYTmxEaGtH?=
 =?utf-8?B?TkMrSDhvbDlHb0ZwODJnbWQyVC9Ga0xYNzdIT1VzU0ErN3ZJMlpjMTJaVXl0?=
 =?utf-8?B?bCtlQjBZd1pmOU0vMG1jMWtpblA5bVFvNmlnUWN4WkRxOFdVWEZjOXNBSXE4?=
 =?utf-8?B?eXV1NDhZcnAvWXhaUEptSGpBVVlXempxVHQ3K3UySXdGVlNDUHlIb0hnNEYz?=
 =?utf-8?B?ZWQwNjVCRnJPdUpKb2tWc0FJMTFRQXNEMXliZXh2VDYwb1hOUGZTYVVFRGJU?=
 =?utf-8?B?UmtpVnl2WG5rbzVNbFEwazlTQUFzV2gvajcwSjNBcWlHN0VmRWV3RHEvWlBF?=
 =?utf-8?Q?Ckuyja6h704=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnpqdksvbGpyVHV2eHNaMGRHTzc2N1hNdCtqSGNWU3o1YlNxc1hsM0xrU1ZX?=
 =?utf-8?B?b2dEQ3ptQnl3dEY0TE9Pd1ZXSC9ua0ttSk0xcmplK3RUeXliYlhMUEhpVThJ?=
 =?utf-8?B?SXNZbVFYZGJFUXl5em5NbzBQcVpIZElEc1FtbGdSUWhDSXlXSkx4SjdMMUZy?=
 =?utf-8?B?SDhPeWNuOVVqakthREhSN3R5eTNvYWg1dmF4RCtEZ1FvNnVBU0QxQkExakY1?=
 =?utf-8?B?VVBTODRjaXFuczhmTm9nbzlubjg5a0YwTWJkRHhGYXVCSU01YkR3QjdOVE9k?=
 =?utf-8?B?SXU5VldvOWRqeDZqaXRXR3RWLytzVi81L0xJVFRzYTBiQUM2U0l0N1RpYVEw?=
 =?utf-8?B?Skh2RGJ2Q2d6OHE5OWVvVzlxanJ6U0k3NVd5MjhzQVUxdVN4aU1SWnRkQTFD?=
 =?utf-8?B?ZXR1bUNyUDhwMGoyRjBtcHlQVFhNL2dhWVdyb2s0dW5rQmZXdGw3aFR4THZM?=
 =?utf-8?B?VDBFZVlubmVUMVNDR3RFN05aR2Q0OVc1ZytXM3VlOVQ5RHI5ZHdRVTcybkhh?=
 =?utf-8?B?Rlp0MDVBRURuRHRkdEhobFBJR3hRYm9NYVlSQUNFUFhUWE0vNE4xTEtTMnNM?=
 =?utf-8?B?MWNoK3pWN05CUzNpdVlKTzJLcVdTYmtvOVB2UnNPWlBLcEN1ZUxUc3pWd1F6?=
 =?utf-8?B?ekVLMDFiTzJEc2c1ZXFCTmYxMm4zNUpYRmYwN2lobU11OVBXd2lKVExhTWtQ?=
 =?utf-8?B?d1RhT24vaG5OaVVkb0FKWXBhTFpxWlVMZnVYalJNVnU5cjYvV29UTGdUclhq?=
 =?utf-8?B?RkwxZjNFNjZhKzJ5SkdKaFpFTHpjQnpSSVdkK3A4RE1hM3VwaHo3bXdjMjlX?=
 =?utf-8?B?Y2dQT1h1Z3oxOTBVZ1VpNVU0OVkxeDlsdEgwVE9YL0o4RGNwdk15cmN6ZWhz?=
 =?utf-8?B?SldOUC8wT0FwTWtyWVd5b3paZElTRjg4RXorUmVsSDR1M0pibTc4QkVNTndu?=
 =?utf-8?B?N1JrbjdkdHdFbGtsZStOMk8rbkFjcUxSbDh4VXlIUkh0UUxlTXppeXkvWjdD?=
 =?utf-8?B?d1U5a00ydTJTRlF3M25COTJRMHphRTE4RXdZQzFPai92bHNZdnEzQ2RjQStU?=
 =?utf-8?B?dTZvTGRMTGJqV2xsTnE0NkJjcVphQm5mR25mR2h0TVFCbEhxSTZheXhZK0lh?=
 =?utf-8?B?NThFWWtxZU5ZdDhRc3N3UmgyT01CbEFycWFvajBWcFJ4b2F6cFo2MktIcTQx?=
 =?utf-8?B?dTBuMWd1VUJwNEg1MlR5NnZISzh5YmhaNGxTMFJmODA0clRXUDB4MUs2OFMy?=
 =?utf-8?B?cEo3UkVFRmViRnViZ1FRaURXLzJxZHp2K2IxSmxnMzdIVTNBcU9IVUIyMDcz?=
 =?utf-8?B?N1FaK0M1S0V3TTRrZzhzdDFQc05nZndSeDJ2VVkrS2E0SDBWd2x5TXRUMVdy?=
 =?utf-8?B?cUFxSHhrZzk5YXlrUVpRTVFuQW5qeXdyNWlFdnNqZDVQNEFON0dpREsrQWMv?=
 =?utf-8?B?Ni80cDRSWWMzR0NWcDJ6TXIrdnVqcGpmUG9zSDVlbE44UHVqMUsreUpjUm5w?=
 =?utf-8?B?NG9adElKR1V1c1ZkZnMzVmVxK2Q0Z3cvbStIZlBhL2RxVUs1d01PcUcrelJ3?=
 =?utf-8?B?SzYxSFBXZUh5R1plbVpva1gvU2QzTTJTaURKUTE4U0c0emt5YllWaW00cEJs?=
 =?utf-8?B?MGs2OFZEZ0haYmZUNlFUWmQreEU2bmhxVEhNbFVraUZtckpvMHI0d0NiaFlx?=
 =?utf-8?B?KzFoSElHZkR4ZzhTaTlJQWgzQkFYM2NqNWF3M1lVclVwZVNRUFhCa0lyOTdR?=
 =?utf-8?B?K3B6YWtMTjhidEUrc0p2UjJhdmFRaUw2OUdyQ0RPbmNiTlJGUExoRFIzL05U?=
 =?utf-8?B?bDVyV1pZMFJETHVsYXpsbzFMdTdoUGIxbGNxVm0wTlhReHU0NG1sUVgrS1VC?=
 =?utf-8?B?ZHRYVzlBUXVkR2poTWxXMkNvOGFEcmRYaVlzdVhPdEhRSy8yOEVROEtlblhD?=
 =?utf-8?B?cWt5K3krSGhkN1NIUHFkaDlEM2VJQUUwcW5WSnFGbmx5aHVpTVNXc2J2Uk1B?=
 =?utf-8?B?eWtSbE13Z3oxRDNjelA1MjVuKzFWeHNxUllpRWNVTzlvSFBOaTBmZzlBZzlu?=
 =?utf-8?B?T0JDMEhmVVRvSTRyMUdxMTFXZVpkejFtcHFFV2Q4ckJ1eC8wdXFFL25pemtS?=
 =?utf-8?B?Yk81aC96cVB3Y2NBY2VBaCt2OS9xcVJ0azZGNUtEYmg1Qi9qWW1FcUdmQ25x?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a0106ecf-fb9e-4276-1073-08ddd0e8fce0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 10:48:45.8587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzLxeFc1K9TbsqJM+PBZuYP4N+K7ohLjef6bsaFn4bW59ooGOhKA7oZFPZJ9TwjgWesCaBrUU3JgGHlrwO2F41U2yIuWrNkcpBxpxiP8+w0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 10:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221228

Hi Robert,

On 7/29/25 10:03 AM, Robert Yang via lists.openembedded.org wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> The uninative tarball requires xz to decompress:
> WARNING: Disabling uninative as unable to install uninative tarball:
> WARNING: tar (child): xz: Cannot exec: No such file or directory
> 

Is this something we should be making uninative specific maybe? Maybe 
something like we did for ip, ping, ps, scp ,ssh, ssty which are added 
if e.g. testimage.bbclass is inherited?

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/conf/bitbake.conf | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b02459c18f..fb26e72669 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -524,15 +524,12 @@ HOSTTOOLS += " \
>       python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
>       sha1sum sha224sum sha256sum sha384sum sha512sum \
>       sleep sort split stat strings strip tail tar tee test touch tr true truncate uname \
> -    uniq unzstd wc wget which xargs zstd \
> +    uniq unzstd wc wget which xargs zstd xz \

I think we want this to stay alphabetically ordered?

Looks good to me otherwise. It seems we already have xz listed in the 
dependencies in the docs (almalinux, fedora, opensuse and ubuntu 
according to my git-grep :) ), so no update required on that front?

Cheers,
Quentin

