Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2447D5C0C3
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 12:50:34 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web10.11746.1731070232912626893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 04:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ids68Uut;
 spf=pass (domain: cherry.de, ip: 40.107.22.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCd1n52cVxCb68u+me05UJbb+Xv7IfH7Chn928t2HXAZf7D8dClFFC4QTcbMapZflfZXeRwFueAegYqu9JJvuxwJTVCGroRekQ/7CpcLYNgn6TE/0YQ3OFe0VvMPY51aP+24V5BNrToaapsY7CMMittFpxLCDMdF58kmiETNL0f3WN2NqNdnDXfoep2Aw87X0yPW/KKKddqez2vFwr6wQgqlwfXYZfrgEyQmUzgC01UQI4FpIOelnxOa6QKQ6a1xJINl+7FfcGl450ktu4C+AsFGPDpTBCme0fIw58T9VO7ELl+eajNxcrwLLMjUWgjYk78jG+qk38Z3Tcp4/bU2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmE2l41bZFqgl9b/vtA3eKoZjpzLPaW33clxP5bvAWQ=;
 b=DY0TeDv960168rXSgyns1X2PrT/hK32A6rp5QixmGDcrGvmNUu2IWs4RtaqcIjRo84sEwTq1AQscNyng1N7PIkeyiaDF2pqUFqFDollORzBudCGrqKNM9HFTn2D4rg+8mZ23zU/WwJGGHe7+5yo2qvb8xRLGYXVgG7dq7J4H97Ra0sDPEuv4lc6MUC4Y9aYqsgX6Dyf/YDci36YvVSzxkfX82ontjroxJM6GjzU1tsFuSSsGDLSKbciWq89IVso5i1LZpetJCI57msL0JH3XtK3L97t6EK0ft6sOi+NHwDvoIwut8SV0R2LvWf5c73lMbZPXuh9WTVcV9Z5OZtF+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmE2l41bZFqgl9b/vtA3eKoZjpzLPaW33clxP5bvAWQ=;
 b=ids68Uuth/IaOPpBwV2R/CauVZBo+BkSnJMVm+WoineVukJsEU4WAwdkFeZ9ain2YI3PzdZ3wU9lnFirtKeFBErxo2b9q+YKRdkrWpSpdTYn5dSefM9EZE/PaRRTuP+45mhRhUda49lYDgbZiFvOOzL4r2hBXonrA+nwsqPJbFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7504.eurprd04.prod.outlook.com (2603:10a6:102:e6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 12:50:25 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 12:50:25 +0000
Message-ID: <0fbfacbe-9a16-4196-9294-9372e22c04bf@cherry.de>
Date: Fri, 8 Nov 2024 13:50:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/4] python3-cython: add patch to prefix map
 source paths in generated files
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20241108115559.770860-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241108115559.770860-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b136162-7cf7-4bca-d89d-08dcfff3ea0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZFpXWVVmbWRFdCtpT3VQZWNON2JQS2E2VGxSOTJhc2ZxTDdrbHZQY2VueWYv?=
 =?utf-8?B?VWc0QWNRMWdFcGl1V0lXcWpTeUVndk94eGtvYWwyRFhRREtESldSV2lsZTVV?=
 =?utf-8?B?SWtKVE5qSFhtMFh1bDE3RzFMZkhnREJVdkpjNGh5a3U1Snpjckt1a0lTT1FC?=
 =?utf-8?B?d3lnVHc3WjA4TkxYSEhKakZWaFpmZndEaEdBeWd1NlhPVjRxNzlyU1lXSEtE?=
 =?utf-8?B?MHZra1E3VWNZbkRmYkZjL01EZ0ZXL1JVOGxyMlFsVXNhcjduSmxrWnk5eGlO?=
 =?utf-8?B?OUVOREF5OExXZXptczFQYXVNNmJSOUJEYnZkYUEvREgyM0NSNGJnaVZjUVdk?=
 =?utf-8?B?eVBQTnRyakdTN3ZLck1SczBQdHN2am8zblFjTCtqQi8xcjNSanZNbWdDUFVY?=
 =?utf-8?B?eEhENW5pbi9yTlJrUjQ4S3RIYXl0Rm5vbzdlamo0ejI2bVh3dWlkNWZFdEFO?=
 =?utf-8?B?Q082Nm5ESWNMT0lNSDBCRzVSeEpNMlFrUncvblB1c3BJcDJLaCs4aEpYMmNX?=
 =?utf-8?B?Qkt6OXBvQjJmVWd5TnJIVmdnVDkyWmR2eGRyRE1ySzFkK0cvZUJPd2M4cEQr?=
 =?utf-8?B?MFBMVm5YYmlrTnQ4MlljUGNlbXdCUE12U3NuWVZwVGw2aGVPQmFIcUpPZTAw?=
 =?utf-8?B?STBiSVZLMXl5OUVFYk9kWGNEam80NHgyYmM2a1hKc1BxUGpucXoxUW5WbzVx?=
 =?utf-8?B?SFN3dkZqYXJtSVZFajNrUFM1aGZOVXFNWGpjS0dDRk8rdXNrM2tYenVUYUU1?=
 =?utf-8?B?ZnhLdzRaUFZKdHFrSzdWQ3BVK3ZaSm0vaDVDR0h1eVNDZzNnWTNBd3RLaVhn?=
 =?utf-8?B?QnU4R1JEb0hlVW0vaWJKb3FrOTFQOGQ5cUEyQ253M3daeUY0T24rZjQrTGpq?=
 =?utf-8?B?MEdGZHlCMUNxNDlQV2ZJMTZvV09abGliZEY4Rmh2NnpjN1dxWVg4alQ2b0V2?=
 =?utf-8?B?Z09TR1EvODRlSEVIVzhYbjVFamg4TGRzRGZPSXpjUW1haGFaWDRQU0RNVnVW?=
 =?utf-8?B?ZnJmd0dqbmR5V2xSdUdXQmtmNnNsdmZpeUpoK3RudFNFVU9NUWRLN1JNT29v?=
 =?utf-8?B?SFBPYTJOVVhNWDNRaW8yblNTQUhlcUpybTNnNGtYTXNQMHMwSGZwdmdFY2Mv?=
 =?utf-8?B?ZFRSQUtxVzFRVnBzZitXb2JkMHhZL1VuMU9CN2xieFUzUjRwVGVGclc0QzUy?=
 =?utf-8?B?VXVKcnlRS2U4dktXaXRpNXlpQU5HaEFOV2MzSGtTa3J1UmFNSGU1WEkySHpC?=
 =?utf-8?B?bkFpUllYR0FnT3paUnFxVURwV1p3Yk5ZMnUvWnZBandaL1ZOclN2QkVETFVJ?=
 =?utf-8?B?NndMd3M0RGRPVXRaWElYRHRMQ2NRaFBsZ1NpQmVaL05OZkhZa1IzQWlMZm00?=
 =?utf-8?B?emFQM0NFNHMrYkpCZ2lvbHl3ZFQ5OWg1Q3E5VUZVTmErcXB5MnBVYmRCajUv?=
 =?utf-8?B?Ky9wSUFXcWl4QTdoT0syTUt3cUNXaGl0blhUT2M4aGRONE1rZGlSUUVOYzNt?=
 =?utf-8?B?TndqZEcyaEw3ZGRLd0pjcUI5SFRYY2pIWFBFaHcxQ0xDa3RGT21ZSDh5K2tE?=
 =?utf-8?B?UmpYSVRRaWsvTHRRcDllUjZrK2l1VVdIRkt1RVNJejc3dzFiS2hpdWpsMXd3?=
 =?utf-8?B?WlF3Q2U2N0tpZXFBSEZaOWdMUUQ2QjdzQ0lDZWx1V0RyaEcrdVVXZjdYNnR4?=
 =?utf-8?B?Wk5sUFBzZVlTTnVlWkdTMWNSZVdEYm43MGM2dkRnRmR6RmFaaE02Mmd3VlFM?=
 =?utf-8?Q?nXGhdmwdwPEIMOKCd1dNmjLzywOUZp9kVCo8/eG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S2VES0RRN0d6RENwTlFLVVFFdjdveXhnMzNoQjA3Qy9odzYzaUJWRll3TTFV?=
 =?utf-8?B?eFpKVGM0ampxSzE2cHNuWFB6S3FPUEczNWhEakpsRkd1QkpMOFE2WE12ci8z?=
 =?utf-8?B?K3ZNbXMyZlpVY3hPU1h6YmhzYnFkUXlMR042WG4vTzVEK0xZSWF2QVZ1UTE5?=
 =?utf-8?B?MWF0Qk1YMStqVUR0Vk53VGNqRHlEaVhuUmVUVExEam5pdG44SDk3MnJVekZ4?=
 =?utf-8?B?NHJyY0ZONERyaFdIOHgyekxlbDNHUytRTWJMMG9GakhVbHdUcGV3KzR5Zkoz?=
 =?utf-8?B?UWRvajIxZExZeWgra0dFRC8waEJpVmZaR1hGWnBCZHVYc2pJQUFpZWZWRUZa?=
 =?utf-8?B?amh6dmtLMzRsSUlmVzdGekMwTFN0bjlSVnhzNk1sZTZNQkhRQ0U3MWZQWWYz?=
 =?utf-8?B?d3hyVmZxM3A5OXpnWmR2RlJPclIyQ29FTjFzL1htdGExUkZiUUVyNXE5eFpK?=
 =?utf-8?B?eGUrL1NReFJ5bXZjTmlBZ0J1YnJnYnUyVWIwNjRwOUdseEl6ejNRd3RoTW1l?=
 =?utf-8?B?KzM4VTJCZGlXbVZZNDROSnpyUGNKQmp6cmdoSTdHRHNjUzBtSklKY1poQWRw?=
 =?utf-8?B?S1NKVzRNYTBvck1PeHYzblQyVkk0bkQ0TXc1MkIvVHpreVRibVJJclpmYnBS?=
 =?utf-8?B?cktNOFNib0xvV2trRUZQN2twbUVTN25nc2xTbnJwaDA4NjF1RW5XNlNvb2hV?=
 =?utf-8?B?dndmYWFMT3l2VkFoRFNoNVlUbGxoZ3dYaDhqWU85SG9VY3czcWFsenJPV1c5?=
 =?utf-8?B?R3BRRUlzN1gzN1d3RThKYndFdW5vcE9pNDJHdmFST3NaNER6SzJKcFhCNjhy?=
 =?utf-8?B?M1pDbG1SVk5FeDBmR00wMUZpdVpMRGJoR2pLclRNNXE1eXgxcVhtVDQwWW9E?=
 =?utf-8?B?TEViemxUZFoySTRBN2kwb3BNb045aURDZFA2dlVxM0FUT1d5dkFFZVgrcnBX?=
 =?utf-8?B?RGVFQ1hTSVZjS1RGTWlOdUwzcm92QmtueVBkc0c5eHdJcEFmVTBuVmRadzVO?=
 =?utf-8?B?UFlpOFdLNzk1VUlDd1N0Qmc1c083czUrQlVGWE1PL3oxdWxBZzdHNDVHcm44?=
 =?utf-8?B?R05tYlBzbVdvUGI5Qk1DaXZsQXgxYlFPb2xQM1haa3BJMWdNMWFCWEdGNnNM?=
 =?utf-8?B?ZHcyOGVsZUVCeUhOcnNlTzZxK1V5NnExN1h3YlhHWFNLQ1BLTDJNeEw4SWdR?=
 =?utf-8?B?NnZ3aTNlc3pFQ3pVMTVLUUpLclpmZWkyWlRUQjdlM0VMNmlhSUh6VTdqV2Z0?=
 =?utf-8?B?ZUMwOXdHQ2EwWXN0cjROV3dXd25JRENSbGJzYlBwTWprN2w4a3dyenZaNm8r?=
 =?utf-8?B?LzNFaDlEMkU5dnJtL2NTREdsOG5Ba25KaVNsN3dsdUxOd2E3YmRXKzdNUDZV?=
 =?utf-8?B?cEVLNGRvRno0ZmlGRU9JTUpETENKUTBJVzRmRXNJM3dSWS9rK1lqdnNnVDlW?=
 =?utf-8?B?V2tuSDMwV055bkU0U2k2QkRXS0lTeWxRK3Jpb1oxb3RsK1kySzV2Ny9pb2FO?=
 =?utf-8?B?eXg2Q0pjWDNmSlpRUFdUYytHeE1IbmNJWFBaalg3Q0NqUmRFRmFJNTBveVkv?=
 =?utf-8?B?ZndGTFNybGYwTnYwOVlWMDBOU0VYOGFLNTlEZXNtUGlYUG56ZlAzcW0vYUhX?=
 =?utf-8?B?M1J3S2E5Y0ZpdlNodmoxUE9zeVAzd0w1MmpyQmd6YUNoWTJoMnhzckh0ZUdH?=
 =?utf-8?B?YzZFR1lyYVVOMmtrbWVpcjFrOW9EOTR1UmdNQzU1YVBSUnREY1M3TnlKYWZH?=
 =?utf-8?B?bnh4QkpKNmRVNnA2QmtYb2lYRGVZYzhoY0QyWWRieUZYRHNwZnhpc2prajZ2?=
 =?utf-8?B?aEVydElkL0FRK0c4ODJ3Y3lxbW5LU0tzaVR0QW51V01XOWJHakVVNVNwNUJx?=
 =?utf-8?B?R3gwaExwbXhkYW1NQk1VM3FmclhWSi9pTFJCVUxRc3p0VnQrQVJpZzZsWnJY?=
 =?utf-8?B?Z2U1eTdMR2dVUU9FZ0dqM1o0LzMxc3ZhVlIzUlpHeUdqRjZLTkkrWkdjMzFi?=
 =?utf-8?B?WVdGeSt0OExxTkFKUzMxVUFNbmhJYzVnNU1WblNLdXozbWdjNURHaFJMSWNX?=
 =?utf-8?B?aThYcjJBUzNKQnFyQXpoWEEydjdQSkczNThhdWlXVnZ6dWYzUnQ0NFZ2VHI0?=
 =?utf-8?B?Z3ZCWGQzYmMxQzc0ZWlQRE5IVS9Eb3J6MEtlQnIzWmpPem8yZlRVQ0NTeDA5?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b136162-7cf7-4bca-d89d-08dcfff3ea0d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 12:50:25.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiT4u56zO+Wed65MZu6OUlIlucM65xBSi1MTa9uTxlD9FryzqGYA4691jnPFvR/PGtNSsLz+vTuANdB/o2O8cjxoS98sg8+nqUJ0+d+kKvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7504
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 12:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206869

Hi Ross,

On 11/8/24 12:55 PM, Ross Burton via lists.openembedded.org wrote:
> Cython generates C source code that contains mentions to the original
> .py files, which results in build paths being embedded inside the
> binaries.
> 
> Implement prefix remapping to change these build paths to point at the
> target debug directory, so that we don't leak build paths and have
> reproducible builds.
> 
> This patch is currently not submitted upstream, but will be shortly and
> I expect it to evolve before being merged.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   .../python3-cython/0001-WIP-prefix-map.patch  | 148 ++++++++++++++++++
>   .../python/python3-cython_3.0.11.bb           |   1 +
>   2 files changed, 149 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3-cython/0001-WIP-prefix-map.patch
> 
> diff --git a/meta/recipes-devtools/python/python3-cython/0001-WIP-prefix-map.patch b/meta/recipes-devtools/python/python3-cython/0001-WIP-prefix-map.patch
> new file mode 100644
> index 00000000000..adc9463ffa7
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-cython/0001-WIP-prefix-map.patch
> @@ -0,0 +1,148 @@
> +From 4d1b7911372561b22e03c7f2b4ec807502b5b9c1 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Mon, 4 Nov 2024 15:36:39 +0000
> +Subject: [PATCH] WIP prefix map
> +
> +Upstream-Status: Inappropriate

Can you please provide even some temporary commit log and a proper 
commit title, so that if somehow it ends up never being modified we have 
some clue on what's happening there?

And here I assume we want "Pending" instead of "Inappropriate" since you 
say it'll eventually be submitted?

Cheers,
Quentin

