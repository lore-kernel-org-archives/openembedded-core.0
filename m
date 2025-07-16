Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF827C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 15:10:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.8])
 by mx.groups.io with SMTP id smtpd.web11.24810.1752678608438421377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 08:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=oHqXsBRV;
 spf=pass (domain: cherry.de, ip: 52.101.84.8, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAoEDnbCHZj54H9IwAJA3USZGo3JAMLksWR0GV1KIFfIhgm7OYYD4CdBWiij9rFKxYdjCHZs3LYO2n1lflKOCo082HbhukZSPMTxNDOqorjn145sCrHRuFO2kC+tl4FT/Qf7Ak/EkGZ8IRc9hjNQNAJY3Bit2FwGPzH/9PUq2eBm3N/V3wSOrsTdoHAybim4gGzuD4jlbtjOwShFjkYaEMID+bXj3P4vZnSjS5FxqdFXPEowHviyOXi3dVAgCunE+tw/u6lzUzMPuyU4FS8nZhQ945nALcmT8KKQMzhgiSXr/Iivpvd73c3cpihSBsgFt6rIeH9Ua2Pzqzkbx7b+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpIJ/wUZtlvppbZ85flFRA+kB2kb4d6bx5CVzJ81oA4=;
 b=BXAM9h5z4W9H5mjXPIvj3sBwaJlKQrAEW6Yp3TNccjXr5TiPQC6wHhmz1nSSa4YOPUl/F686CGrvyCKKjkQ9unoHvvtpG6a30EHobYZwYYw+RBjnlW0u/nxef/JFdyrLYNbjL55F6bp+eGFcbQE8ay05h+VbujXjBtkKcea+6aseadyaEiYIg3pgIwXsxrEKKA/ApVZQf+YzKWBn3tV8YVBpG+dwK8bTPRKgwP6Hq32mYs/2pjCFR6//NxLFLdsxooscXUbwfth1EGR6I7iQTuo8LfUoegA/ytpmyWBrUFGqmJ0zlwRmqbOtLPN1uJ2N1zRVSRIDeTH/JCXGtGbYsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpIJ/wUZtlvppbZ85flFRA+kB2kb4d6bx5CVzJ81oA4=;
 b=oHqXsBRVP5TLZVynOaHHiqdHOXfpqDjgvQleD3Feu5Arf2ITUXNdZONNIawfPvoV1YRndZyVmecZ5rxncbD3ysDPYy3tXP6RTqWztKESi1GkhZ5/BVDii+sV9tyGzYxUHqmTmDzOpl3uDPWmugYl2jabc9Cja/YLEDTqAz6URYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB11515.eurprd04.prod.outlook.com (2603:10a6:150:284::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 15:10:02 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 15:10:01 +0000
Message-ID: <a514a643-5ca6-419e-845a-e62beabb198f@cherry.de>
Date: Wed, 16 Jul 2025 17:10:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] toolchain/clang: handle big.LITTLE Arm SoCs
To: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
References: <20250716145707.2271609-1-skandigraun@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250716145707.2271609-1-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0035.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::24) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB11515:EE_
X-MS-Office365-Filtering-Correlation-Id: 71937256-d611-468f-af6d-08ddc47ad5e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z3Z0MFk2TEllNXhVdnd0K2NHRUh0WTVvUUFRUFpkd3Exc2xQYXRFQnF5ekRH?=
 =?utf-8?B?Sy9IUHJ5azVxcmpxQ3MwSzd4a2xSWE40SUhiY09OaUIrS2hLRTk4MXVoekNT?=
 =?utf-8?B?bHRMb1hlUTdKUlRicnhrQ2VselZvcTFUNHJKRk05VWg4YktCSmcrSGFMVXhD?=
 =?utf-8?B?b0hzM1RZMjlUcGI5S1hjK0o4d2F5UGZ2dDdIV0NwUWUxWjE4SVd1VWptdE5R?=
 =?utf-8?B?Y2RUVHNUWEtsdUwxUkdoTit3bzFRN1ErLzJyTzZoZzJ6M2ZUcDJtSWNrMTNn?=
 =?utf-8?B?bXBpY01kbzNyVlJOVzcydjA3QW5kd3JmRm1NVTY4K09LcklrVDBHWGNEaHp0?=
 =?utf-8?B?TDF4RUgzRFcvcWd0RnJaZmJIRC83eEgwcXVRNWtHRi9Rc2VIVnhESDF4WWNo?=
 =?utf-8?B?K09PUVdiOVFPYko4Wk5FZ0R4NzhYNGwxQXc3QXA1QjcxS1RYanBSbGNDbDN3?=
 =?utf-8?B?OERKWEdVd0tTSE9CM1ZXQkVGUHF1RS93b21ZOUo1TW8vbEVhcFpBUXQ4Mnpr?=
 =?utf-8?B?ci9MbzF4K0NyUitSbGh0OGM4Z016bmpRRHZsU3BpcEtZZWd1R0huOHpCaXoz?=
 =?utf-8?B?bUpWOHlOTDNTY3dOVUlPOVNoMEtybE5wU3A3N1V5Y0dQMEhlTG4remxOLzRp?=
 =?utf-8?B?MVRFUGRSZW5jVkxWV2d6Y29pY3Z2S2VQT2hpUWhxd0NuaWw3a1R5c0pKUlVC?=
 =?utf-8?B?NWRPMnpTNms4V3BFM0pYVEUwejhWZFNyejhBc3ZJa29pNExmUmdUMG5pa1lh?=
 =?utf-8?B?UTdFaCsrbDV2b0lkdzV1NDNhQ09hVkphM3RJOTBrNFZKR2RhdUxTQjFvOWk0?=
 =?utf-8?B?V2VXTTBQUUJ1bVo1UVVGL3VRd1RhdzRTYURMbllXQXVmRE15NHF1WkVWeTM4?=
 =?utf-8?B?bkE2VTN5UmlTQmxVcVVvWSt3UUZHVEdSL1R3MEY0MisyZUlqeGZzYkg1cDdi?=
 =?utf-8?B?MUljMERFa2lQNkZUUnVIMlQyL01HbFBzQzFpZ2xnS0l6b21YYVdpRm1qOStB?=
 =?utf-8?B?MTBneXh4MTdkclJaZ3c5WG9QVzc4ZU1YTzNiVjRhSEtPOFZYNkx3VlBQVE90?=
 =?utf-8?B?ejJBVUtjZEFoTEdiaGl4Q1RYMTNtNGkyQndPZ1hQOXFYZ2JaRjlDQk5oWjFW?=
 =?utf-8?B?ZnNMSU1wR3NPSU1kOE9Hd2t1T0p1OUZnWUpaaC9uY3FIb0NLcENOcXltcjkw?=
 =?utf-8?B?cThXUS9vcVMrcmpNNUN3dUVaYXJFc3EzTXFDRGdRMElBczNIUFJhL1UzQmgy?=
 =?utf-8?B?RVBicnd6b3dZRmw4Tms5d2ZkUld2UEtYTGxBY0dnUG9yY1JTazRkMUpPbDBp?=
 =?utf-8?B?MVlibzN4SDgvUXJOd2xueDRiOUhHNXowbWVuT2VyT0ZrL0lhUlRzRkNNa2t5?=
 =?utf-8?B?RlJ4b25EUVdXWFNhZjlPMStiTEtVRGR3bGRaMldFdEJSNC9SVUJFSjA2Ykp6?=
 =?utf-8?B?M3F4VURqVzZSKzYzYmd3bHNLelRjNG1tbzE3anV6OWt4SitnRXVQY2hqK1d1?=
 =?utf-8?B?VjJOZFE1UkU0SWVNWjhFMStaN1dNaDBZQ2p0Nm9aVkltVExCUGZndFdDWFNm?=
 =?utf-8?B?RnozTVgrWDJyOXczUWp4TkhVVFJGY2NMU2ZSZ0IwOFREYTZpRGNIQW5ZVTEy?=
 =?utf-8?B?QjhZQkNZSldPU0Jsb3RMSDI1dzFCRTBha2VVNXdQRHNWZmYrZ2xQODVRN21p?=
 =?utf-8?B?dml4cmtIV0JyLzJEUGN2YmdRZzVJVk9CYXhabmR6ZjZxUlRxZjVqdHg1WXpH?=
 =?utf-8?B?OERuOVN1Tk1GTDI3UWllYkVuS3lNQ2sxVEEvdkdINTJ1THkzS3pRTmFweDRz?=
 =?utf-8?B?NkZuV09NQTNyZkJiU0llMlpDOW50MXVuNmNnNUVSOWRDN0tLVEY5akVBYkph?=
 =?utf-8?B?OVRITnpEd2FVZ09sUDZMZ0dJTVExY1cvSTFZZkhrTGQvdEtTZGZmSitNZWxB?=
 =?utf-8?Q?ayJiEpiySB0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Tm5wMVhGTEZncFBSZm04TW83YlR3VmdTUWU2YlkzWnkzclFHa3ZNaTJkUGM3?=
 =?utf-8?B?dHpxWTZlbDUyZ0dYS1kwNDZqSG1mNlNDRHNDaXUxR3k1dlNMSk40MkNpc0JQ?=
 =?utf-8?B?WTNPdk9MSUlPVWkyazVwRWxyRGtvRXBNTWpFci93UXdnMHVSU3FJRm9SV0Ro?=
 =?utf-8?B?WWY2ZitsaDIyREl6QzdKWVdOTWFnY2tFcndlVDI2S0ZOTDAwRVBqT0J6REwx?=
 =?utf-8?B?UVFaR25mckNDRXFwQy9XalhQUmVQTG5DZjZBNWZiMTZqYURrMVN6YmNBUUI5?=
 =?utf-8?B?cHFiTUFZYTh6RkdxQ1lpeDlLRGdQSm5ZaER3QXBjWHlFS3h4RHhKUTVQbk1l?=
 =?utf-8?B?SUtpU2JUNlNncTVielRqdzV4dlpBMUQ5N0RtZTV5YUhCU3hoL2tQVHVwbGVN?=
 =?utf-8?B?R2ZwOG4wOWNSU0FPZndxZ1ZOS2E5ZzhNSkpyWm9Eemo2ZFJLU0d6TGh6c2k2?=
 =?utf-8?B?SUdhdFZ2cjM0V2FkeW0rb0t6Y3BOZWVkTkVhME1VNVcweTFmWE9QV0drLy9L?=
 =?utf-8?B?OGk5bCtWSGF0U3FneEM4eVI0ZGVmZUhTUktVeVlpRHczeDJKZndZc1FrU2dq?=
 =?utf-8?B?aldWcHVRWXo2OEFOeHJvV0FqN0ExdlZaRlkyakJIenp3N2piLy9WbFNBTjdv?=
 =?utf-8?B?VS90d2psaSt4UmlSMEp2MWJtcTVKQUc5WVo5NFV0ZFRXem1KMVQ1aHgrMUxR?=
 =?utf-8?B?MTdLY0xHUThVM2g4MmtyOGtkcGJFaVZYb1pIMTZKRXNxaE05N3FJN3puNy84?=
 =?utf-8?B?OFdYSmFhYzFXcUR3MkhzbkN0Z2RaNkRLTTd4MUkwcUp4cVJ2V1o2UEYzRFY0?=
 =?utf-8?B?TzlYUWJNam5GV2xRKzJkRVRDREJuWjdXVFN3ZkhwaEpmb2ZtZlFwT0cvWmR5?=
 =?utf-8?B?WWMrOEhEZk8xK1EzL2t4ekZKQlY4dXZUUnF1N1docDdJeitMMS9HeUpHYU5D?=
 =?utf-8?B?ek9CUVNERG1XNGJlK0t4dVlQQXlkQklVMTNPN29kVkFHbUxOSGJlbnpFMzZp?=
 =?utf-8?B?RUsvdTVCUnNEYnZxUmtOMTg3VXJ2MXlqL0tSMVBIQnBqSTA2UlhCc3dYcTZi?=
 =?utf-8?B?VHpLWFE4Y1ZWUzRtb1pRd3lrYkdLTEhUdk4yM280UXhOOWVraGkwcCs2ZW5h?=
 =?utf-8?B?d05HQ2VBeHBNcEZCTXNmeUQ3UEEyNm90STB3L3BHalh1cUlrWmZjSENTb2pn?=
 =?utf-8?B?K2FEMTFudjZWR1IvRXpDYktuOWFkOVk2STJJeUd2dUxETEVKUFhkRmpLZDZ0?=
 =?utf-8?B?UlFGVkdQanNJWHA5QXlmbDUwOVp6Mjl4SS83VlFMYm13eWhxUjc5L09SUUdh?=
 =?utf-8?B?ekw1clRQM0I5NkcrTGl3SHNsaE1NUWEybTV3S1E1NGRmRy92dHNLZEl2aFM1?=
 =?utf-8?B?UDZhMHoxWWVqaUx1Z3NRbHhzbnAvT3VKN1JrbndORjdUMCtUM0ROYVdhSWZw?=
 =?utf-8?B?cjNnNzV5TlV2MWdRdlFyWDBJRWVEYXBaaE4zc29WME1LbXoxT3BqQWpYZWEy?=
 =?utf-8?B?NURxdmtqZTRLRGxKRlJYVU5qeVV5Rldxajh1dkY3UW1kREtBMnI1aGhjdVlt?=
 =?utf-8?B?SWhHMDlSSDdEeHl3VWFUNFp3R2s0bjFLK1hnU1JxWEh0YkFJcHVUSHVSWkRm?=
 =?utf-8?B?cVQ5T3lHNDJTMGJzWG0wYisrYmlsY2dDSTlzS2hxZXFzUWZLYjFvanZYTDFW?=
 =?utf-8?B?N08vYk1Dd2I3MUc2algxTGhmMVBHclU4Umx4U3QyZHlTanozVW40N0ZyZVR3?=
 =?utf-8?B?cTlWTm9yR2dhQVJUN0hlaHRyUEtIU0pMd2lRMlFkK2JYWlhFR3JrVHBhTThp?=
 =?utf-8?B?aytGNDZYcEI5eEc0UWhOb0dKRVpoalZFWkVscCtQdWk5NE9YZnprTFhWZy9u?=
 =?utf-8?B?Ty9xVmVZb2RMcU83OHIwY0MrTTlGaDFSRHk4ZWJseEhPUUt4a1h0azlWNStl?=
 =?utf-8?B?WmlxNzIyNDBhdWd2d0kya1JGQllHc1hnc1pnODhNUXR1elh0bkpLUFlMTzhB?=
 =?utf-8?B?end1VXB3azJmT2plTXo5YlBuYUYzYzRSbUlPUnRBZFJ0d29JZjJlOGlqZkQv?=
 =?utf-8?B?anVORUphMmVYUTd5c0Z1bzZrWE1jdXRLazhaeEtYR3BzMmFHSXZST0puOGgw?=
 =?utf-8?B?M0Y4ZlZ5VUhncjl2dmdZN2RnTTBuWmlRV1d5MjVlbU1IU1BqVXNscUFDQTVH?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 71937256-d611-468f-af6d-08ddc47ad5e6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 15:10:01.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcEkd7nxHzACUOjiyyiz0CAYPWxZPSm4Sr7Q7tJ3yvVC02drFbTlb7HYcl7Dn28xktkh9O0F2HvoWfXEzu6+Gf4hOuiw0jH839risZFtHGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11515
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 15:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220469

Hi Gyorgy,

On 7/16/25 4:57 PM, Gyorgy Sarvari via lists.openembedded.org wrote:
> clang doesn't have Arm big.LITTLE specific tune options - when they are used,
> the compilation fails with an error like this:
> 
> aarch64-poky-linux-clang: error: unsupported argument 'cortex-a72.cortex-a53+crc+crypto' to option '-mcpu='
> 
> To avoid this, in case a big.LITTLE SoC is the target, select the tune corresponding
> to the LITTLE core.
> 
> This has been lifted from meta-clang, extended with cortexa73-cortexa35 which
> was missing.
> 
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>   meta/classes/toolchain/clang.bbclass | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
> index d7b8a3657c..b0e284be84 100644
> --- a/meta/classes/toolchain/clang.bbclass
> +++ b/meta/classes/toolchain/clang.bbclass
> @@ -34,4 +34,20 @@ TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-pre
>   LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
>   LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
>   
> +# clang doesn't support big.LITTLE tunes, choose always the tune for the LITTLE cores
> +TUNE_CCARGS:remove = "\
> +    -mcpu=cortex-a57.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
> +    -mcpu=cortex-a72.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
> +    -mcpu=cortex-a15.cortex-a7${TUNE_CCARGS_MARCH_OPTS} \
> +    -mcpu=cortex-a17.cortex-a7${TUNE_CCARGS_MARCH_OPTS} \
> +    -mcpu=cortex-a72.cortex-a35${TUNE_CCARGS_MARCH_OPTS} \
> +    -mcpu=cortex-a73.cortex-a35${TUNE_CCARGS_MARCH_OPTS} \
> +    -mcpu=cortex-a73.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
> +    -mcpu=cortex-a75.cortex-a55${TUNE_CCARGS_MARCH_OPTS} \
> +    -mcpu=cortex-a76.cortex-a55${TUNE_CCARGS_MARCH_OPTS}"
> +TUNE_CCARGS:append = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa72-cortexa53 cortexa57-cortexa53 cortexa73-cortexa53", " -mcpu=cortex-a53${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
> +TUNE_CCARGS:append = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa15-cortexa7 cortexa17-cortexa7", " -mcpu=cortex-a7${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
> +TUNE_CCARGS:append = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa72-cortexa35 cortexa73-cortexa35", " -mcpu=cortex-a35${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
> +TUNE_CCARGS:append = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa75-cortexa55 cortexa76-cortexa55", " -mcpu=cortex-a55${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
> +

Wouldn't it be better to have this in the tune conf file directly? I'm a 
bit worried we'll have more big.LITTLE flavors in the future and because 
this is in a separate file it'll be out of date.

We should be able to do that by simply using the toolchain-clang or 
toolchain-gcc override wherever appropriate?

E.g.

MCPU = "cortexa73-cortexa35"
# clang doesn't have Arm big.LITTLE specific tune options, so select the 
tune corresponding to the LITTLE core.
MCPU:toolchain-clang = "cortexa35"

TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", 
"cortexa73-cortexa35", " -mcpu=${MCPU}", "", d)}"

[... and other replacements in 
meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc]

(NOT TESTED) something like that?

What do you think?

Cheers,
Quentin

