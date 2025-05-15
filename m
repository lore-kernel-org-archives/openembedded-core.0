Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56A4C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:11:08 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.40])
 by mx.groups.io with SMTP id smtpd.web11.10609.1747311064216524935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZF8e17io;
 spf=pass (domain: cherry.de, ip: 52.101.72.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EM9eiz/GYVgQLRGJ6sfjEU2Kme5loW7ZFAE8VA3n9WQwJqCZNoX/1WhVNSYpKI2Qx4NdvWRvq+9bES2TOQE/LqB5m/UMH8IOtejfH33efF3uM/76y03DiZIWPZnfUtHILDvK4+614UTUg+KX1IR5pid9R+nkR6wHDdXLThFQz1lSCX7ECi6B/waQyEPYLlJfb/baJ0PiYZ95zMr8FLSfBlpZHP6/u2RNVNTQ46DlICRPvTcNraRY7GX9iTMSN1rrFLaS6Z+DaFpYBvre2DHtalZVd6dw4m1WhcpbIGPeIpEBWfYlxCMfmbTRP4ykwpKuk3juPrsOyEK0eFf12V7ZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtZxOViJqFIMLiaYAM/qEeTdRZWO9mHaIfkCUZC3ZFg=;
 b=ZNSFaAGVWBttsjuv3upZUSPu+88TFnk/SFa8cZNnU/VZhkUIOnUHR7TvlJJmctlapvZxJtoiGzERIymWUtdikIS3PU6+fYyaPB9QRoJ+8745SuD+AU5ErYFfJ6dOcxDG+V8lo9v7hASUSyf1YQhAVcDL1IoJVW4QjdlcmT1J2cIv06FAYFOmiZcH4dsookUfVR+H0SbS5bPnSHTATe54dHwIBCubT2dz6g0Du9EZzsYlZkgiwYKT2WiCPUwIcPakHgkaexIE8VZJzIV/3CXHkNLGoMztA7udbqItfDnsHi93++gI5O3vkXPAApKPE+/Msz+RR9U24HzO9ylnMSd4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtZxOViJqFIMLiaYAM/qEeTdRZWO9mHaIfkCUZC3ZFg=;
 b=ZF8e17ioOIhILQEC8pWwcdwspBqZEkIRKC6zOdHiJpeItJCfHjoyLHYO2vZ69qNnVxYzCs6yjIKy/fKacbmc0BsjDxNK+YkgEI0DZokVGD1dxIRuh7fkEa3fBuMrtUgYrB3PtqFqFrHCB8X3k1Tkv806vl0DgWa8hBzs11bNjxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA1PR04MB10206.eurprd04.prod.outlook.com (2603:10a6:102:456::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 12:11:00 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 12:11:00 +0000
Message-ID: <07ef3a4c-265a-40d2-939b-d3843662df38@cherry.de>
Date: Thu, 15 May 2025 14:10:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
To: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
References: <20250514125706.495571-1-daniel.turull@ericsson.com>
 <20250514125706.495571-2-daniel.turull@ericsson.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250514125706.495571-2-daniel.turull@ericsson.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::10) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA1PR04MB10206:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f7a60cc-b57d-426f-209a-08dd93a98e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T0t5TGE1UGQwTURFTVpWaGNScTQwTjB5dkJPdkFIajNFT2JRS2NpbndGL3pu?=
 =?utf-8?B?MHhLYkwxWkFMZFU1YUYvWW9oWUpqTGU5NmRBbVZCc3FWZkxHV0dvNkcyMk8y?=
 =?utf-8?B?YmkvR1FhcVg5b0dyWGljQ0JBc24ycTJQdHZuOXl2WEl0SUVUOWFyeE5HN1hW?=
 =?utf-8?B?SDBZS0QwWU41UE8zVmgvdTBiL0lNZjV6WjhTelFGL2trZUlCc0Rid1BHSjN3?=
 =?utf-8?B?TFBDMk1ZSXUwTFZzWXJsckhKYkpHYWVlTjRnaUJlOEF6WWFROEgvVExDbTRq?=
 =?utf-8?B?S09pazlRTmd0d3lyS0Q3cnN1MW0razlDTDVIRVd5dWIxcHRlYVlkMjkwTFdk?=
 =?utf-8?B?bjV5RnIxYjl5UEJxOUhLQUVYTDdBTkNnNVA3SWNGM1FZRHlhdzZsTVN5OU1x?=
 =?utf-8?B?NXFtbVpFZlh6Smk4ZzlCR1NMbFRvTGw1ODR6UFRCSEZJblg2Y1dFVlFmeE0w?=
 =?utf-8?B?TGtTWjllRGl1Q0kyakhRb3A5YmdSd3FNRUk3UCtUL1NhMmdPeFZVaE1EeG1O?=
 =?utf-8?B?SHZVYW40cGRyV0tBUUI4N0cySTF6ankxMk5QWnQvWFlDcFlEcFMxU3R4WEw3?=
 =?utf-8?B?SDUzeFRrQnN3WnJTWnZvd3Zwak8wT1pKZHZObzFnUDllYWM4TFYxc2RuUDRE?=
 =?utf-8?B?NW8zWXFmbjZvMDZ2OXRKM0VWZEM0MTROR05KVCtOVmdUQXJzSWRmUE9YaUg4?=
 =?utf-8?B?OGYzTFBrRTFBTVd6N0F4SVFqV0JFOG5TVGlwTVprMm5mN2V6V21yZGowN042?=
 =?utf-8?B?NFMyRkpiNklYUzh3RVNleklCRXFlTEhPeXQyeTlqOGIrK0JpQ3VzcThtOTQ4?=
 =?utf-8?B?Z1Jpc2xlSmR1bjJleU9MNXJHaGs4TlFEclA5L010YWVnZ3h2WlFEOUQ2NTAv?=
 =?utf-8?B?MnlPQ2h0R0hGK2RWNmRnT2h2OEhEbkZyUDE1dXYzb3gzeGJhS3Vod2RTazZn?=
 =?utf-8?B?NHVSbmlZRjZZenV1M29pS2MyQkdQN0ZQSWJGTWk3ZzBJdjN3K1Ztb3Z6QkNL?=
 =?utf-8?B?N2gzb1VoZWsvMndkSnlrWVpJLzVpeks0K3RITGs2SEFnMDJvOUYwWE1sQ1hy?=
 =?utf-8?B?TFJpbk4yaVhxY3dQTkpkUDBmSjlhVXBIcXFiRXlKRnpzbXhNSzZWaERtQnpU?=
 =?utf-8?B?ay94eEtTUTdrNlZKdmE4cHZ5MXBTdFpYWWZuV3JmbTZKUzBBTWVyNU1tSGpZ?=
 =?utf-8?B?aG5XRzRQeEFSZ0ExQ1dQcUdmK3d3Q3B2OE1EUnJRdHlSTEN5aEdXUWJwYS9j?=
 =?utf-8?B?c1VNUlRFb0xuRW1xL0VLMTlaZ0VERktzSnFvQnZmdTBwMkNwcWlkOUpHSUFt?=
 =?utf-8?B?TjZwM2REa1M5T0RlRWNXM0lGUFhYanF1eldJdXRVTitPYWtYTHlUTmI2dHdn?=
 =?utf-8?B?ZFN1dmV4M3NhczhKbWZOVnJTTzNqYVZ4THlhY2RFdWpYQWJteU50Q3Z4OUtC?=
 =?utf-8?B?UEZSZXRWWlpDcHVEcE5rQ1FFRkRRNk80VnZZaVRrYUgyNnlteHpudUxBSXVN?=
 =?utf-8?B?eGh3aHJnclpyUzd0eVl0MzUwS05UejF2Q1N6UzZrVUJodDNvek5oMjRRRVZR?=
 =?utf-8?B?YU82bm00eDhid1hvb0JwSWd6N290TWZwd1JZcXNqSnJ3RXNYeXJuTXFqblY0?=
 =?utf-8?B?eDlLNDh2WWxTTG5vU1lldmlCcGhFZGZqbHZUS0swN3BkVk9JK3BFOFQ2RmRH?=
 =?utf-8?B?Vnd5dy9Sc2JUZTBxNVlFWXM1d3FaKzVwbDVqN0o5eGJaNnpzQUpLQkw4azlz?=
 =?utf-8?B?akkrSnZaQjgyYlFFZUdIR2ZReHZjTndpckFHcDBQdkNwNmxYc2RieC93RXpa?=
 =?utf-8?Q?sk5GMMP8agmwMWd/kjUZB5pu06rgrwP/Pdt8g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Yk51S2s5MmVrS1RVOE42OXpYTEd0WjVWOUQ5NXZ4bUFoRU5qRWZ2ejBEL3FX?=
 =?utf-8?B?TFIvMzBGVlFUaWhsVm1ENGFKeGU4Z3BiVUhvK05aZGpSRGdGb1AxRUVpanhj?=
 =?utf-8?B?SS80ay9PejA0VUV3TWdIQ3dtNTVlZGhCK3dBQTdDOWFydzhiZ082UE9GeElu?=
 =?utf-8?B?MHJTOFBTWU9KYlU4M1hoZjkrMDNQU0U0cmhoeEgySTZTZUxYT3ZhRjcvVnZj?=
 =?utf-8?B?YVpEd0t5Qmdib3UrQWltK2NGTTNST1l4RFAvY0xzZjAra3lCbXh5YlpwR25B?=
 =?utf-8?B?dEJTZkxKV2hHRStTZkRxSnFHdHFYN3JBMFpmaDJDdVF0Q1Y4UkJ5R01PV1hC?=
 =?utf-8?B?RWszSllwVjBvUWgrSzlWRldKaHR3d2U3WCt4RkR1ajdDZEpDVU14V1lkYkRC?=
 =?utf-8?B?N3Y1Wm5FcXRIeVVtbGpzMVNISURGK3hFNnByMlBzYnJiMmFzRnVXekJIL25h?=
 =?utf-8?B?ZWlzUk8wSTFtOHE3bmgvbjNRUE9hYzVmUGFFRVhWYkRVK2VsUkZUQnI0OUZl?=
 =?utf-8?B?K3hteFdXelZRSUljdjNTVWE5cVlOWHdNYnZKeE0zNVhTUitpOUFzUUNlNW85?=
 =?utf-8?B?cHd0a0lDTU5qUnJYWE9HL2NDUWlid3M0MVhwK3B1QW1nL0ZTY2Y4cG84T3VE?=
 =?utf-8?B?RGYyTDBadXdTbXdWeTYyUG5NRFB2R1d3a3Q4NnlxYm1YMXg1QXVuRmVhSnZl?=
 =?utf-8?B?YW4ySk5tZ2FuTGlhUFlCU2E2RnQwY2grZHpLdE1GUlh4cFA5clRJcHNMTHEw?=
 =?utf-8?B?dmFMSFd1UGNkVE81VTlxTmF4N0tnOTlVYWFGTlIxSVg1Mmh4MkxSY0FEYUdm?=
 =?utf-8?B?RWRZa1JIaXdaMXEyM2lJcEsvWDJ6ZUkvU0ZFTy9tcjkzelAvSTdReW9WUUhP?=
 =?utf-8?B?eHFFUWlVdGNZTE5wUFBDT05XdFliMkZtYVdyR0d0aEIvWThyWXh6UGxnK2R0?=
 =?utf-8?B?OFNvUDJLY0NmVXh1U2N1Mkh4M1d6SSt2ZmV6V2xVN0hVcW9jU2k4VTNVZlNE?=
 =?utf-8?B?NjRycUtRempyWVNyRHllc0JVNUtmc0hDRUJqQmdFTGczcVhYOWRIZ09LN05n?=
 =?utf-8?B?NWh1YnBsZ21jZ1h1Nmp0eTA2dEw4cVAwOElzc3pwN2VLOVYwS3lmREI3N3Vy?=
 =?utf-8?B?ZjdJV3FGTzZObEQ3N29GVkR4WGt4OENTUzg4Qk5EQWJ4cVJSK2RFcXYyaTlS?=
 =?utf-8?B?V0szWHJoVm5HZ05NRlJFSUZncytYRGNjaHFYOXAzL3B1eldXbmExTXBYTGhL?=
 =?utf-8?B?Q3BWazh1cjZvQk9yRHJzdTZqcVJtR25LUlhQUEZXaGIxakFTN21ubGxYbytY?=
 =?utf-8?B?R2RrV3FESFV5aFRJT2xYY05KeWV4VXZJd284VjM4dE5XUWpoMjNXeVA5UThP?=
 =?utf-8?B?NDhnNkdaZWhmZlBkakJqVjMyTW8zQTByNHYvdlB1cWNvVzZISDhnSmRLVGE3?=
 =?utf-8?B?Q1ovcS9tMktpckdPK1Bwb0NySlpSNjhuYkV2MUZXWjdhS3paei8rNGMyRmRh?=
 =?utf-8?B?TTlJMzBBRVZHeHQzdGJqb1hvYUs3YU95NUVDemNnTHBIL1FjZlA2WHRPOHJl?=
 =?utf-8?B?bFFLc0tsMU1mRzE4bVZxQ3RlZDJjK1A1NUE3ZDAveVV5czBMK3hMVUgveUZz?=
 =?utf-8?B?TW5PMjBQRXBzajk2N3RDSUxmNHVqWVkvNnRoWFNXN1ZnTm4vU211WTc5OTdu?=
 =?utf-8?B?Y0hXeHdtQWVJTzRQMTM3M3NnV1IyUzhFcmlCUytuQk56TXl4VW82VStwTkor?=
 =?utf-8?B?eGFPckZXSE5uQUFnT1BzV1RrSzlKK0oraE9OdjMvL09OVngyaTYxM1JXTnZx?=
 =?utf-8?B?eU9jVFMwRHlzazdSTXZRd25MR1hpdGJYTWFqYkNxSCtzUFNiMHVENmM5L1ZY?=
 =?utf-8?B?MHVRUk1UMnZXSk5BQjJWNWNSWFZpUlloZ2xPUHdud3RCUmxPYUxpa2pjVml0?=
 =?utf-8?B?ZnNTUDl2Zm0yL0JUekpIT0tENEZMczlDTEpMR2hkU1VDV3FDRStvVmUxd3dZ?=
 =?utf-8?B?eWlDQVpvZkpHcml1cjFxWVEwc2VpV051SzRpWFhDZzhoSDgvZVdBeFFhM1RM?=
 =?utf-8?B?QXJRQlFnd1BZcStxQWFzc0d6VUFkT1dKV0pPY2FML1ZkUHJlTi82ckZtd0JI?=
 =?utf-8?B?V1h2SkpTNWJWQnUzcWdpR05OcWdQVjkvSVBCY05KY0s4Nzhqa25CeDV0NjJ3?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7a60cc-b57d-426f-209a-08dd93a98e51
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 12:11:00.4580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LX9EA3DAB9W7iUT/LMYgDwC06ofx/MYoh7HZqTQ9yc4K4fpFQyKuPZwcWvyKFFJkvYsbjl4vSb95hV9sIzCEuCJzK7xSHweb1fh3ftYMlJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10206
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216573

Hi Daniel,

On 5/14/25 2:57 PM, Daniel Turull via lists.openembedded.org wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
> 
> When SPDX_INCLUDE_COMPILED_SOURCES is enabled, only include the
> source code (.c) files that are used during compilation.
> 

Header files also have C code in them sometimes, e.g. 
https://elixir.bootlin.com/linux/v6.14.6/source/drivers/net/ethernet/stmicro/stmmac/descs_com.h

Also, CVEs could apply to macros or constants too, which could also be 
in header files.

Also, there could be assembly code compiled in that could have a CVE as 
well.

Finally, the kernel also has rust code, which could also have CVEs.

All in all, I'm not sure discriminating on the

> This enables an external tool to use the SPDX information to disregard
> vulnerabilities that are not compiled.
> 
> This commit adds the basics, so recipes can implement it own methods.
> 
> CC: Joshua Watt <JPEWhacker@gmail.com>
> CC: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>   meta/classes/create-spdx-2.2.bbclass |  9 ++++++++
>   meta/classes/spdx-common.bbclass     |  3 +++
>   meta/lib/oe/spdx30_tasks.py          |  9 ++++++++
>   meta/lib/oe/spdx_common.py           | 33 ++++++++++++++++++++++++++++
>   4 files changed, 54 insertions(+)
> 
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
> index 7e8f8b9ff5..dd8ee6ecbe 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -137,6 +137,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
>       spdx_files = []
>   
>       file_counter = 1
> +
> +    check_compiled_sources = d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1"
> +    if check_compiled_sources:
> +        compiled_sources = oe.spdx_common.get_compiled_sources(d)
> +        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
>       for subdir, dirs, files in os.walk(topdir):
>           dirs[:] = [d for d in dirs if d not in ignore_dirs]
>           if subdir == str(topdir):
> @@ -147,6 +152,10 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
>               filename = str(filepath.relative_to(topdir))
>   
>               if not filepath.is_symlink() and filepath.is_file():
> +                # Check if file is compiled
> +                if check_compiled_sources:
> +                     if not oe.spdx_common.is_compiled_source(file, compiled_sources):
> +                          break
>                   spdx_file = oe.spdx.SPDXFile()
>                   spdx_file.SPDXID = get_spdxid(file_counter)
>                   for t in get_types(filepath):
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
> index 713a7fc651..e9dde34513 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -26,6 +26,9 @@ SPDX_TOOL_VERSION ??= "1.0"
>   SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
>   
>   SPDX_INCLUDE_SOURCES ??= "0"
> +SPDX_INCLUDE_COMPILED_SOURCES ??= "0"
> +SPDX_COMPILED_SOURCES_DIR ??= "${LOG_DIR}/spdx-compiled/${PN}"
> +SPDX_COMPILED_SOURCES ??= "${SPDX_FILES_DIR}/compiled_src-${BP}.txt"
>   
>   SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
>   SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdocs"
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 61d7ba45e3..083e004330 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -156,6 +156,11 @@ def add_package_files(
>           bb.note(f"Skip {topdir}")
>           return spdx_files
>   
> +    check_compiled_sources = d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1"
> +    if check_compiled_sources:
> +        compiled_sources = oe.spdx_common.get_compiled_sources(d)
> +        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
> +
>       for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
>           dirs[:] = [d for d in dirs if d not in ignore_dirs]
>           if subdir == str(topdir):
> @@ -167,6 +172,10 @@ def add_package_files(
>               filepath = Path(subdir) / file
>               if filepath.is_symlink() or not filepath.is_file():
>                   continue
> +            # Check if file is compiled
> +            if check_compiled_sources:
> +                 if not oe.spdx_common.is_compiled_source(file, compiled_sources):
> +                      break
>   
>               filename = str(filepath.relative_to(topdir))
>               file_purposes = get_purposes(filepath)
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index 4caefc7673..e1b7f576dd 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -242,3 +242,36 @@ def fetch_data_to_uri(fd, name):
>           uri = uri + "@" + fd.revision
>   
>       return uri
> +
> +
> +def is_compiled_source (filename, compiled_sources):
> +    """
> +    Check if the file, is a compiled file
> +    """
> +    import os
> +    # If we don't have compiled source, we asume all are compiled.

s/asume/assume/

> +    if len(compiled_sources) == 0:
> +        return True
> +    _, extension = os.path.splitext(filename)
> +    # Special case, that we need to ignore, since this is not a source file
> +    # We filter .c files
> +    if filename.rfind(".mod.c") > 0 or extension != ".c":
> +        return True
> +    # Check that the c file is in the list
> +    if filename in compiled_sources:
> +        return True
> +    return False
> +
> +def get_compiled_sources(d):
> +    """
> +    Return compiled files from the SPDX_COMPILED_FILES file

s/SPDX_COMPILED_FILES/SPDX_COMPILED_SOURCES/

Cheers,
Quentin

