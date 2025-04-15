Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01117C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:21:54 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.75])
 by mx.groups.io with SMTP id smtpd.web10.19899.1744723306072986654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Fj0el6ok;
 spf=pass (domain: cherry.de, ip: 40.107.103.75, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBv11/sBFZeMceEF9DLJmEXaYjn1tIYMPmKOB9SBdyP1i/8imSx4AeOdxLHcpHKS/eKhUgfzYslSxdwIMmna3IccC9kJIJeHk/325aMwuHiekzGHNQZsKJu8Zsu2PWJRDOhY5NBqvtawShcAcyCHKuK1AGTqU79lcJ5QEq02M3xPkmQatEn4YeoAOPx2AoFMgr91J1ckw5wxNedk5wE6H3xatta07lg/5ZfOJ5I7tm1r3GuHubL/F2UhpVWKokBULYth5I4f0FzPzbJzlvaJgVGqYJVuPvfYOTKIbbi4GY47zSDNbF82vpCbf6j9Qd33agN0Jayw4gdemj3OVYpdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21p4zw5I2CdHWoT2yjVrW6tTIjyY/TrbFJKBPAdWowo=;
 b=cfqdx7F+7iqwbPoximPNJ9bG5Ze3kWtUXOZDNn8PFQDqvRVQtEmyHVDHqKhvN8o4Xmqm2dcEUBaJ69lnnVbVmXmka2/PsWr6ppZ0nlXBaFMCYZdO4Bd8NIkl8F9oTbC7aCzIUm+d4S9mUwL3wcLyNGd2XzyeWFP4CYR8TncdqNkSxfNhRlO9BpZjjQbYd5yvvbDOEY+yhRN3vpDZ0tPSutzC8t/t4B08IQUIWp7MhOgbJGPNzLHh7QnBzEfathEVhR6xBP4WctJ+PzRgi15HcdtTn7loN8r1hGTYYc7WFvl02ea91wChTYjQV86i8NF5qcNwuJWh5LR/HCJeuRLX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21p4zw5I2CdHWoT2yjVrW6tTIjyY/TrbFJKBPAdWowo=;
 b=Fj0el6ok43zkRQvFbucScARUT/u1awFGfmBzto233fH1ELKK0Zvff3E77IVWb7hdF4w6NtR9h3b6y0VJIbq4E1w2pSB4odRNJuSPAquVYeL/do7sNxbDqzcjQMYuwrizdfHj+6h4aJ1M6lof7uTQEo4n9FKuTZrBDvhCj6vbYB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB7008.eurprd04.prod.outlook.com (2603:10a6:803:13b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 13:21:40 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 13:21:40 +0000
Message-ID: <26bf7949-cf98-465d-8f4b-89c547b7b248@cherry.de>
Date: Tue, 15 Apr 2025 15:21:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mesa: enable PanVK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org
References: <20250415-mesa-panvk-v1-1-39592671ef11@cherry.de>
 <paj3defvlgkx7jdrbpeghryi6yu6v23tzbdkclcebnkfalqfcp@2spflej7b4rb>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <paj3defvlgkx7jdrbpeghryi6yu6v23tzbdkclcebnkfalqfcp@2spflej7b4rb>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a2c1ce-9c1b-4e90-9fa7-08dd7c2074f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QjlJMUx2Y3lSUFVzT3FoVHBzMStJSVg1enAvV2hESlJrNWdrcmszMWllMVhL?=
 =?utf-8?B?Yld3MlptZVp3MGFhdWZ0U2pGK0dJblk1SVJNM1hUMzJiRVFQRHVMVCtJNG1P?=
 =?utf-8?B?ZnNVaU5nSG1kejVDN3FoQXlkMjlnNGJ3enZNbmY5QlNQWkg4SWRITFFQclJX?=
 =?utf-8?B?Z0tMTnBSZGhNTHI3T1liQkFLa1dhQTljUWV5eUNHdGdmUkJUdGpzRk85UFlO?=
 =?utf-8?B?WnBBTDJZTkpGSW5RaHZqT2JSRURJVFhrdUVRdWhaKzd4Um9DSnh1WGtTcWc2?=
 =?utf-8?B?U2dxTjU4SlNVUUhIY3VxNkdDZEdUL3FDZGN2RHpTd3RtTFdnRGNMUUFNZ2hr?=
 =?utf-8?B?aW0wcEJsUmdvaFlWd21lZEpvNFRiVURpYUc5MUl0dUFWNGF5VVo4eEtBRnlU?=
 =?utf-8?B?MlZCUXY3MmYrK3FSZ1pkem90d3E4a2RUSGMyVGh3bjFIVjF0MjA5cmhPM3NY?=
 =?utf-8?B?bDN4eFVncWdaR0twMVVmUE5ZZ2R4L0RKMk5uM0YzZ3A1OWl4SlJYSzF5M0Jl?=
 =?utf-8?B?QzRZaktOdUlHejNhbU5TUFRqc3F2VTY1eG5tTk5pQ1pnU1Y5YU5ZN3kyeE9I?=
 =?utf-8?B?cFY0cFdrdlhBaHhnVWpoTUhYam9hUVVCdnU5MkZUdURqMWZKbXJjb2ZwMjdo?=
 =?utf-8?B?ZzNXbWNiOWt1eldydlNEeXI4MHh2aVY2Z21BWUl2WTZBclRKUm5PVHhucGpS?=
 =?utf-8?B?RG1WUFQwMW5sMzlMZjJrNmFKWFNMVFpHblNrUHo2T1lTaWZCWlNoaWNNT0tX?=
 =?utf-8?B?Q2t4ZGR4Z3pnNHdUVTF1Y1lpVFVuQ1VkZGU4R1RFWTEzM1NxdjNtM1VkQjBL?=
 =?utf-8?B?dXJ2OUdQL1FSWlZOQTY5OU9YQzAxWk9Ga1BvcnNmVE92Y29aZXQweFR3V1I4?=
 =?utf-8?B?UC8xRVJhZWovLzEzak1pbkJNRldtb1grQVFLWVMya0NqZ082QzUxdWc3NUgx?=
 =?utf-8?B?dGJPc3E1NWZ5T3pNd2ZFYTdlaGlEelZadGpKN0I1cy9YR2U2amZpUFBOMVN5?=
 =?utf-8?B?SGhjWStLWEpuZ3JlWUptTlZSbERnWlpjKzI1ckJnL0JTZjd3RzZhdG5Ba0Fw?=
 =?utf-8?B?Wk1ZM2oyQitteWlpNWpMQVNuVlV5MEE2UXU5amFLVHZ2Vm5uL0YyNE1HN3g2?=
 =?utf-8?B?RXljMDAreXlCSlQ5bXc4aWUxTDdJRjdVZ2pyQzgyMGpzUDZaVG81RStVamd3?=
 =?utf-8?B?OS81dmV1ZXVsQndVempFQVhHTGwxa0ZlSE5zbnNka3RrK2Zia1hxWER4ZnpS?=
 =?utf-8?B?bTZPTW40WUJqeHJzSkMxV216amZ1M0FHWnBUTUJ3MW5uY25hcjFoeVVmcVpQ?=
 =?utf-8?B?YlJlRkpYU1RKTkQwSkcxK1JSTnIwMktYeVdkc1g2MzEzY21yckUraFk1T3Nr?=
 =?utf-8?B?Vy9laVpyQ2JwNGt4K1BEMm5SQ2xtS2NVeTh3OU1OWERyVGtBdkVsL3F3UFBh?=
 =?utf-8?B?c1hDbVpKQkZHaGxFWXp3MVhMcVJFNjlGYmxVZ1E3ODVZYzQ0aG5BT3IxUjA4?=
 =?utf-8?B?bnBCRm90VzdPY0x2c2Q2L0tYT3M5cWJDQ3VDZGxHYVdXRnRXRXZCNGVJdzJu?=
 =?utf-8?B?S3NkQ1pPTUUzTGIrTitweWpwbU8yaVlCUDlaR0c3ZFREWUNyR0xmeHRhRTBI?=
 =?utf-8?B?Y3lVbFEzeENqR3M0WGdhTDRseG9HS29vYmF3OWpnNUJLRXJWYTNQYkgzSVNE?=
 =?utf-8?B?bXpWRmNhRWlaZUltcTNITFJoNkhCN2hlS3psaDJiQ3FIbGFFQnBGdCtzL0lp?=
 =?utf-8?B?MXcrRSt1TVJ2cGxVS0tKYS9DbzZiWXQvbTg0bFFsUTdYUG0xZkw4Mm1qSGY5?=
 =?utf-8?B?OC8yZThEM1dRN2NWNVR4OFlqUkZXVy9JUVpQc1B2WHd0N1FwdzVRQ1R0RGlx?=
 =?utf-8?B?WE9NYTVHOVEwWVk3bGd5bE1xeFRRb3RqcHRzM1NZb0p3RGxJb1d4Zmo1QWFs?=
 =?utf-8?Q?CU6WVF/m+7A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aXQvSW1iVG9mVDg3OXJCVXBaK0dVdlloTVZ1aGxacXIyUFZCRVNKMlR6ODRt?=
 =?utf-8?B?VWdYakRnbW52UGFsOFp5UjdReWgzbG54SUlHb2w1UTFlS1pYbXJwNWVsQjFN?=
 =?utf-8?B?SE1mUUVScFd5QlJJSGluUjlUN1Fpbk4wRGVOQmFKdmVGZitHOXZubmJadlBl?=
 =?utf-8?B?Um9HeWNOMnE0T2lLMktaQk1YWkFPcVh6Y3N4WFRtZHpjVUQ1VFg1TVdoY1c5?=
 =?utf-8?B?Tm1ETFpTd0lsUUt5eDY5UjcyODJhM0lSMFlJM2hxbXZFOHhHeW0vTEhLbm5L?=
 =?utf-8?B?NW11TUlkbzc5aS9aUWJjNDdmcFgxWXNPNEMrdDNuc0h0aWVGdDVkUkgzRkJt?=
 =?utf-8?B?SVlvU2MzUXM3cUhXdjNqT2xKVWxJRTVoN2xTMmJscmZsbitIcENsdkJQdExu?=
 =?utf-8?B?NWNhbGR5V0dCb2gvdFFpczdHdldwNDNueDI0SnhEY00rVHNSS3NNTXFHTXl0?=
 =?utf-8?B?emJSQk9MKzlJeVlTa0RsNXNQY24wV0cyckl2SFFmM01hRGVGZ3h0WFFSV0RK?=
 =?utf-8?B?RUVtSkdhaUVhdWx0QXFWc2VQWXdtbFYwTHNXL1VVWXEwR2R3a2tRVXExMU5p?=
 =?utf-8?B?UktKclJEeElZMDZuN2xVWjk4dWhjZGUyRTVFc0NpVTl1ZHJLdWVFcG94c2Vz?=
 =?utf-8?B?djY5UUg1aTNlQXRIK0xpR3RTTWZ2NzBPd1g2OEZnNkRTRjE4cW1iblo1amw4?=
 =?utf-8?B?V3AvRXVBeVRiRER2RjlURVJ3ZFhYVGorWmhpbFpabk4wS05EOFhUQkFyUGl1?=
 =?utf-8?B?ZHdYMmUwV3RMbmMvNzA4MCtsL1VCeG9JU2xrYVlLZG5LcGFlR01wZHhnN2hz?=
 =?utf-8?B?aEltYVFoV3ZGRG44Z2djS0VJUUU5ZElxWmp2aFdkaWFuODUrMTByMTREN1p3?=
 =?utf-8?B?Z0xRa3BGVC93UW5ZWnJaaUQvSmZrRkV1NHhmbk90VDZpSmxoL1lZTnFlbkhG?=
 =?utf-8?B?cVNjZXVYZ21KalhGdnhxNklWakJ0ZUV4d3A4dStzU0FCcjdrZlRST0ltcWdn?=
 =?utf-8?B?YXJSTjB5akxOZFB6end5bVZuQkJlS0RreUpZWmpNMUpVNUJsRVEyM1pSbDhF?=
 =?utf-8?B?UlBRRytTRFVHYWFaNmVUSm9aUHhHOVhCS3k0aytHMXdMc0xhU2hCeFh1d0ov?=
 =?utf-8?B?RkNYMUw2aFYxNWNPcGZFWStvajlMNWtFNUxYZi9rWHBnVVRnVTQxcmtjMTRq?=
 =?utf-8?B?Uy9BeDVCei9Vakc1TlBaTVBpUm5QbTkvMVR6VkZmb2x6aGJVbW42OFcxcEI3?=
 =?utf-8?B?VUVkNExmVVlMWFY1d1Vmb3RYNXNhMFdOZExKcFNnVGYvUVExK3lTVmFvY0dk?=
 =?utf-8?B?WHhiNHZSb1dMVEY5cGMxL1pBZnJnY2lMcWMyZ3dyZE1XKzBlZEdQWFF4M2hR?=
 =?utf-8?B?UjYvT2RUektacWdOcFNIQnpUNWQ5dlkxeFFtUTFnRnh2dkh5cWp2emxvU2xq?=
 =?utf-8?B?UkZYM1V2NXpEbFhjdVk5akVoeFl2c053WDZDVndXTVVZaDBETjUyR0p5bDEr?=
 =?utf-8?B?WlJOTjl5Q1NDa1ZheU05ekZ6UHBTM1M4NmJ5RHpROHR5N21OamxGcXJKYm5O?=
 =?utf-8?B?bE9ibXV2cWZMMXhUdlJZK1hNOS82MVR0VUdyR3o3SFNCNWc1RjgxZzY0Vm12?=
 =?utf-8?B?SEdNR2RsdzR0cnplbHdhcWlzZGMvL3dHVUxzNkRMSlZtWTM1SVNKRFRsV3gw?=
 =?utf-8?B?eXdTRjZaTDF5UDdmN2JaS3VmVDhOYlp4NXRqWnBWVXZaeGNDWlZmTDdjWlJh?=
 =?utf-8?B?anBZQVVIVTJ3WExubHIybkxlZ2RtYjVRcUVGS3kxUy96QVhQdVh6OFdTSERi?=
 =?utf-8?B?MXNkeDNtR29vRFFTNnBmN2RFRjZOU2VHcElncDh1RVdsVUQrOHVwaFhJQVlz?=
 =?utf-8?B?SDRnT05jdGNOakVnT20waittWTJhK2lRNUZmR3ByanNXa21qaFp2ZmxaVmhP?=
 =?utf-8?B?OHRidWxIbWF2YmtEWWpMM24rK3ViNWZHMUlDK2xsV1UzektIMmlzUkpVcVA0?=
 =?utf-8?B?WEFFYkVXV0JtaXl3VGRVMjViQ2o5WlE3bEdxOE05eUpTblU0NGRnVHNBMmRP?=
 =?utf-8?B?SnhBbnorTk1pdGF1dExLSTlRRkR2SUNhMlVVNnNLaXhROHdxZ1lWaVB6eDhJ?=
 =?utf-8?B?ZlkvYUlqSUtDaWIzb2pHRkt2VG9zb0JKSTk4Y1FCOHlzamJ5U3crbmkweS9I?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a2c1ce-9c1b-4e90-9fa7-08dd7c2074f7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:21:40.1656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xTCL3U4CbvzzaWb+FKY69vaODWGHZeP5NK5tc6LiCp1o0oQ0flgizt3O7F9M3/Qnu2YPdhsw8li5TUuFJvuyC+iseaRnlp+TpLesUv1Jhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214852

Hi Dmitry,

On 4/15/25 2:52 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 15, 2025 at 02:41:51PM +0200, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> If panfrost is enabled, we currently build panfrost tools and the
>> gallium driver. There's also a vulkan driver available for panfrost, so
>> let's enable it as well whenever panfrost PACKAGECONFIG is enabled,
>> similarly to how it's done for the gallium driver.
>>
>> PanVK is the "commercial" name for the vulkan driver for panfrost but
>> it's enabled under the panfrost name in meson.
>>
>> This was "tested" with `vkgears -info` with mesa-demos from commit
>> 11939e1697b894be3c68a89e3ea86fc51a320836 on an RK3588-based system.
> 
> Could you possibly try with vkcube from
> https://github.com/lumag/vkcube/tree/kms ? This is the branch that I've
> fixed to work without Xorg or Wayland.

vkcube from meta-vulkan master branch + 
https://github.com/lumag/vkcube/commit/a726b82a1d74a3c87846c463f0060c49f4f75fc8.patch

I get:

root@jaguar:~# vkcube
error: XDG_RUNTIME_DIR is invalid or not set in the environment.
failed to initialize wayland, falling back to xcb
failed to initialize xcb, falling back to kms
failed to take control of vt handling
root@jaguar:~# vkcube -m kms
failed to take control of vt handling

root@jaguar:~# vkcube -n
WARNING: panvk is not a conformant Vulkan implementation, testing use only.
1 physical devices
vendor id 13b5, device name Mali-G610
writing first frame to ./cube.png

cube.png resembles the one from kmscube so I guess that's fine?

> 
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>> Just stumbled upon PanVK yesterday[1] so wondered how to make this work.
>>
>> Sadly, vkgears from mesa-demos 9.0.0 doesn't seem to work well:
>>
>> root@jaguar:~# vkgears -info
>> xkbcommon: ERROR: failed to add default include path /usr/share/X11/xkb
>> Segmentation fault
>>
>> But I've bumped it to the latest commit in main branch with the
>> following:
>>
> 
> [...]
> 
>> ---
>>   meta/recipes-graphics/mesa/mesa-demos_git.bb | 47 ++++++++++++++++++++++++++++
> 
> This should come as a separate patch and ideally just by bumping current
> 9.0 to _git.
> 

Welp, this should have never made it to the patch in the first place :) 
Sorry!

Cheers,
Quentin

