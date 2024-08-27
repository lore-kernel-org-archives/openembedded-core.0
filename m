Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C31C54735
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 10:25:52 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.21])
 by mx.groups.io with SMTP id smtpd.web11.74524.1724754342546356699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 03:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=k7T2iA7h;
 spf=pass (domain: cherry.de, ip: 52.101.69.21, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9BzCiI+M1rCO071NAILNddipwpnuyllKhf4hZeaDGOLSdF1Y98j0JKVvyRVxzW3nn5hupgce7ZRF4IW3np/5BYAiiWiAMEEEzJDiKem3Hl+G37ud3w9BPOw7h3hc2U9mldKXQ4GFiZRSceZ9CojLD0VJTdl4o1/xEbLxpn92EWMCPhpV9sVTpL1eaa32fM3zvvKl5YGtaH2u/J51m0hpj8J1wa5DzRPegHbmGeaOQ6HklKwEO0o4jnsdV3Q7B1BpY61CJKXOTOTPg7E1KvIW6RDMyCkurdHcyXyWAfNsAC8LF2mPcF794BGroxLK8rYcchG0lm3pXs0DqAuHMMGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4Vd/VXz/GblZiSBFjOkkS1DETS75NqDO881RQq/dQo=;
 b=LZyBl1V3szfXyWdweTYQDCn+5Ao0LDlL75MIFbO74BIsf4/pu3KV18yDc3eZDTIt+a+3y0Uf32dJ2EB6Aepc0ggyXGAcysGEmkzAYxeUe7mawuXSdxxpR7L1Mrwr+3It0yFqeOZthDLYG97h9E5gVYtypmoCIfEPS6UQ1T2M79DegG2czYaR8nknVOO9t1SJMzYgJc9/JfGs0uajmpZTYmBJdMh07kYZ80aJsQHnUa0iIoKpKvUvgyvmu91zZbA3LdmliF59w/4RXJaxgwdOBYK5XUKuQRUV0HOg9lGSAEOEQQNHESe4KiqFSPSEilvASGH7m6Gesr1obmNcHsXV/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4Vd/VXz/GblZiSBFjOkkS1DETS75NqDO881RQq/dQo=;
 b=k7T2iA7hIrwd4jzNQeLDDFNHbK0Ku/cMjKwAbF04NQrI+VGhyesBRu7zt+apIXlg1AEa92T73woeUeDxq4usgeNnVPCJl1vFsfkFGYK9uiDDboiPfs3cCF8u9xoz0KJdG6g7/pLXm88yZVkdeDY01H8pWYLzqFDjMfEKFWaJQng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DUZPR04MB9983.eurprd04.prod.outlook.com (2603:10a6:10:4d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Tue, 27 Aug
 2024 10:25:38 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 10:25:38 +0000
Message-ID: <e93464b1-51e2-4058-afa5-3811975de62e@cherry.de>
Date: Tue, 27 Aug 2024 12:25:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] linux-firmware: package qcom-vpu firmware
To: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
References: <20240827100930.127469-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240827100930.127469-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DUZPR04MB9983:EE_
X-MS-Office365-Filtering-Correlation-Id: 216a9497-b428-43a1-ce4e-08dcc6829824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WWUwR1QyeFZuME9yV29nQmlsd2l2TzdUUEludkYxWU1CbEVMZEpGRlRSelVN?=
 =?utf-8?B?K1YrcklkSm5OLzZaWUJ3czNnMGs0ZWRHM1J0RUZIYlZoV0U5Y2xQL0IxVDRY?=
 =?utf-8?B?MlNjTUlkZFBVczAxYWR3b3NXVGIxR0tZaDBmZ3JoMm5Xa05nT1JwUVJUUDQ3?=
 =?utf-8?B?Tm8xQ2VzVWNINTd6QWc3Q2hGZVJQOHZHQmVOU1lLem5rS3phSVM3TzZTUGZ1?=
 =?utf-8?B?bG13OHNZNnQrZEZrNm5WU3JjTm1iRzFYVEpINWdpZGRSeFgzc1VSalFBQTRw?=
 =?utf-8?B?WVJERUVabTFaM1VoWDFXNTRPaXFPWU5taHdMdXRaTUtFa0o4Ylh3QmZMQXVC?=
 =?utf-8?B?ci85YlBwWVNxblJpUjRKQ0hkYVl3bm1rTWdud09IcGtYemd3VmtqU2s1blJH?=
 =?utf-8?B?YXl5Rk1FMW1PMlVFSS9oTEtEeDIyN1ZIbjhJYlJjeVIyUG9Bay9HcGpqVjB5?=
 =?utf-8?B?OVptdHlBYUVVNmY3VGcyYkwvQWFsQUoxU1BpOU9VMFBsR0lXYUxmRmMvYnYz?=
 =?utf-8?B?NHp2NWFIWnM4cy8zeTFTV3QwQUhuZ0piUnRhQjRwVUFwVFZMNHpoa1lXaXdj?=
 =?utf-8?B?WEdselJ5K2NoZEpRSGwva3pROUxMSkNOTHpnR08zZWpOOWM0RFp6NFV3OGFs?=
 =?utf-8?B?ZGdEc1RCRFdZS3pVUWM1TnRlQWFyakNsREQ4RTErL1pQcHFVVmZibEFaTlZU?=
 =?utf-8?B?NVY3RFE0Z3pHVTFFTjRXMk1lUEJPckJ3RGluaEZEajdHYVlvakpTVVE0V2Jn?=
 =?utf-8?B?bk5LN0drV1dKMmhZMzJYOUp2RkVLS0dtazluOU8xdHpsWFdVdUZPcUN2UHAv?=
 =?utf-8?B?WHVwTlNqNE11WHg3ekkzYzQ4NEtCR1VTZElDMUpBZkFwUHphVGFRd1o2SUMx?=
 =?utf-8?B?NDNhZ0p3Uit1S0FCL2hLTkFBM3hEMElmSjFFMjZab2NQbURBWWYrd1k2bjlD?=
 =?utf-8?B?NHZ2cTh0ZVkxSkdtSGRmSWp5Skt6bHY2UFd2RXRiZHFhM3gwbFRLam42TEFh?=
 =?utf-8?B?MzRzeFVZU3JGMkkwdE91dmdvbGhOUzBDQ1I4eHdIMDJhQWkxTnJPa0RRRExt?=
 =?utf-8?B?dXNzYUdpSjNBSDJ3SU9xcTVwKzRTSDhZYXRvNUt5WXVSbW1Ub0pxTmN5UU1V?=
 =?utf-8?B?RXlXY08zdjNDU3Q1M0ZMd1hHaWtMMFJ2d2doWndWS2FwRDNRamEvYnRIVC9s?=
 =?utf-8?B?cVQwQlNLek56bmVhcldsVmJxQVp6SFRkVkdzUUZUcUVzTXVsRXFzWXdkYmFT?=
 =?utf-8?B?MDc0eFNXMDFkSFNGaVp6UzRSSGROMzE0ZEFGUStUc3JSb29lWjY0SFlUQmVI?=
 =?utf-8?B?UTJaNXZzMERyYk9LQWppbTFUSkNnZTJDV0FQUlNsbm5ReExpTzhzT3U1d1JO?=
 =?utf-8?B?QUUyMmtpL2dPTHhUcEp2RzV6TVkzb0xPTjZYb280K1o4WmE4dmRqMFNVMjJh?=
 =?utf-8?B?UjdvcmJGY01seENRd2ljbGI3bjdzZE5OTnkyNWpCdDBETUVLWUJvK0g2Qml3?=
 =?utf-8?B?b0xoRDVDcE1wTFFwSGdqb016dzlyaXdiekZNemxiQ09QR2IyTnFyaFJSN0xy?=
 =?utf-8?B?RmNaV1NzQ1RHQzlnRXZWcG5yYVNRZldYaUNxWW8wMVh3Q3BDSUFXelljYjVh?=
 =?utf-8?B?c0R1RDlKdW9zMDNmNzdLcXdaLzhCbHpyR3l3M3FJd0J0Z3cydG50ZjNNUWFn?=
 =?utf-8?B?aCtnWnNldk5NeHdQUXFlSnRGd1ZMUS9IUTRaVUxOMWx3NU03VHRWU3BIVXpj?=
 =?utf-8?B?ckJXSDRzeWJ3NWtvNXc1RUp3bVlIUDAxbmpDaVpFeEVzOWFKVGdDNXlhYmRj?=
 =?utf-8?B?UVZJTFlnTHRYV0F6WTE2UT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?amFBUFdidnRMSGVKbnhKQktTOUc5Uy9kUXAyWWYwKzR5K0p5VkF6bk92cjg2?=
 =?utf-8?B?WlY5R0gzSXRXUFNhTjhjT01aRHRxYVVxSjFLWmdxVUxNdXR1dDVUdkU0NHd4?=
 =?utf-8?B?SFQybFZUalVIclJsUFlzUFplVGlpZjB2VEl1M3RKMEh4U2RaWDdFb2pKd0lw?=
 =?utf-8?B?bVR1VlBxWkNiL0krWXNYT2tLKzJJTVphZzlINC9UekM3b044eUpPeWpBQjF5?=
 =?utf-8?B?aEU4R2lpWEdMSVpFWFNKT1MxOEVDRUZLR3pNVmNoRkRXTzdOS0IvNUJ2Mmw3?=
 =?utf-8?B?dXJ2UHJHM25xL1lNdzlpam9pY2NOaEpIYlR6WWl3YlAvYmRMV3p2QUpldWVV?=
 =?utf-8?B?S2FNdjJjOWsxNFJhdHFEK05lMVJCWUhKR2NpVWRiYnUycEhXcE5BcHRURXRu?=
 =?utf-8?B?VnlKeGlxZmdPdlpmc2MrNzVaQXBQSlg2WEhxNGFnbnhxem9Kem1lRWRSaWlh?=
 =?utf-8?B?MDZ6Qmc0UjZ2WFErdVhvMGJkY0dWbCtLdThHcjM1Z3d0REhsS1lFQXE3aXp0?=
 =?utf-8?B?a2p3TjZXU0tLM3cyM2lkeWMwc1B5RThHNG8zcEdzOGhVdHpwb1QrWHF6TkV1?=
 =?utf-8?B?NUV5Uk05ZmNsMnltcWRqaTFmQ29wL2FpZ0cxZWNlRzlpaTVVVzRNVUt5c2RI?=
 =?utf-8?B?N3FzSFg5cmhoWVFMZ3Bmd1EzOXROL2pXYllsMmJYQWVHN1BOU0JRVU1GbTRk?=
 =?utf-8?B?SUx6bUFlMDFXUVh2d1JGTExBWTZvMGQxQ2pBNk9DaDE0RUwyTi9nRUJvYjJN?=
 =?utf-8?B?RDdoZjNmcGd2eWhpMy90Y1MxRDMyYit2djhCV3Y1Rzc3MWgzakE4bzZnRHZE?=
 =?utf-8?B?a3BFM2FkdmlyVW5BNndDTzJ3Nkhydkd6cC90RmhiNGhLbDNGaUViS2ZIZStD?=
 =?utf-8?B?Mkw1bEJFYkxjL2gydVRoZmN6TUZ5MWJvd0RnMVFFWnpHRXNPUG9VS200K1hk?=
 =?utf-8?B?UXpvZkh5TFhRenY3RTVxMTBmcVlNbEs3WWZ1YURNNjAxZGV5MnJmM0FjQlJo?=
 =?utf-8?B?VGV0SHp1SXI5eTN5VktTRHZuc3gzZ04wVGQvVkk1QUJtWXplR3lBK21DMG9F?=
 =?utf-8?B?Mm1hd29TY2EvTnRwREYyOHN1d1M4cjE1ZzlJSVd4VzVZYVphRkl2SUllYkgz?=
 =?utf-8?B?bkM5SDRYbEROeVEva1hJWCs3SCsxcFcwTDRhVW1JZFMvMjE4Q2VxVnp5czdM?=
 =?utf-8?B?OWNacWJyMWdjM0NQL1N6V2hlcithRUdhY1Q4OUFCSklldFhMM1VYcEhoOHhj?=
 =?utf-8?B?aXVwTkxCZklrNFNqWmdXRzVLV3BoY0tlY1NqREZTWlNOd1lmWVhRUmNCTUIv?=
 =?utf-8?B?ZVQ2dTRWYmpFdFFOOFRvQVh5azZQNGJSWExMaU5IajFOcWhaZlNkK3UyRC84?=
 =?utf-8?B?N2tha1V6UjFlZlpTMThZQUVPMGcxWWJWVHFBYzNpYVVrd3NxTEwwdUJsUnJ5?=
 =?utf-8?B?V2U5T084Q3V0QUdvRmhZK0FGY0tKSm1saWlmTVVSK2g5U3Y2R0NENGNjUFN4?=
 =?utf-8?B?L3hzKzBtUXZzNy9LTjVSNS80WVdoSXBiNkMrd3Z2ZTZTQ0RHUFpJWHhsVG5Q?=
 =?utf-8?B?d2JiTjVMQnphbytxMXVLZi92TEhXV0F0aUFYYkpaLzlCRW02Yy9RM3NOZ0Z0?=
 =?utf-8?B?cVVYaG9VWWdXcDZ5VlNleFlDRkRyNFlHVGhya3R5S1ZhQnEwcVZvSU9Oc0pW?=
 =?utf-8?B?ZTRwQ0FEcTFaSkVFeWVRR01qNUhNK2lyVzJrUHpuUGVWSExGU0cxVGFzY1BL?=
 =?utf-8?B?eS9LK0RHMFJxMnpYTzl1Ymc5K05YYmJmQXQ4VjVuQVJTdk9neHUvQ20xT1dC?=
 =?utf-8?B?emp2ZGw2RnNNNTB6WWxZdmRTTFVGVUNKZkNHY09yRmlGOUNQMEJtNE0zanNB?=
 =?utf-8?B?aERiWlNXcU92Wm8xUDhURFhod1k1M2VnMWozLzZCVU00Rm9kSWM1YnhndXov?=
 =?utf-8?B?aDU2SWxHOG9qMi9QN285M0g3ZTNBVklQazhxUVdneHNCTVlsYjI3ZE11TDNE?=
 =?utf-8?B?VmVicG1rQS81eXA0d3htMlBXcTBlNHgyUmdGZHZFNjg2SmlpTG96Zkdna1Qr?=
 =?utf-8?B?b0pLM1JtdjVjbUpLS0FHd0VRM0M0bjlpZ0l2YjdqVWlKUHplQjJwQkdybzkz?=
 =?utf-8?B?Y0JSWjNUWmt4YzZYSHdacU1QRGNUUytSSUo2NGhwY3EzRFVRaVFBWlhDMTgz?=
 =?utf-8?B?Y2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 216a9497-b428-43a1-ce4e-08dcc6829824
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 10:25:38.1585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/EndlfhMkQ+cyPU4xqRYZmyNo9MRAny9vXdxPbJS5k+a0eGZQDuRAzveBTtzjO9QOann6TjQGO9TI2zGR+dJbydo2srARhQGhxpZrmiL5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 10:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203826

Hi Dmitry,

On 8/27/24 12:09 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Release 20240811 has restructured the locations of Qualcomm VPU
> firmware. Follow those changes and implement a single
> linux-firmware-qcom-vpu package holding all VPU firmware files. Use
> RPROVIDES to provide previously defined names.
> 

It'd be nice to hint at the commits in linux-firmware that do this reorg 
for reference?

It's also not necessarily required to merge those together as we could 
probably still have two different packages to avoid bringing in files we 
don't need (I assume the same SoC doesn't have both a VPU 1.0 and a VPU 
2.0 ?).

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
>   - Dropped unrelated (audio topology) change.
> 
> ---
>   .../linux-firmware/linux-firmware_20240811.bb    | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
> index b6fb0f9a4560..d55ac9267d8f 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
> @@ -382,7 +382,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>                ${PN}-qed \
>                ${PN}-qcom-license ${PN}-qcom-yamato-license \
>                ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
> -             ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
> +             ${PN}-qcom-vpu \
>                ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
>                ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
>                ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
> @@ -1368,8 +1368,7 @@ LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
>   LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
>   LICENSE:${PN}-qcom-venus-5.4 = "Firmware-qcom"
>   LICENSE:${PN}-qcom-venus-6.0 = "Firmware-qcom"
> -LICENSE:${PN}-qcom-vpu-1.0 = "Firmware-qcom"
> -LICENSE:${PN}-qcom-vpu-2.0 = "Firmware-qcom"
> +LICENSE:${PN}-qcom-vpu = "Firmware-qcom"
>   LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom Firmware-qcom-yamato"
>   LICENSE:${PN}-qcom-adreno-a3xx = "Firmware-qcom"
>   LICENSE:${PN}-qcom-adreno-a4xx = "Firmware-qcom"
> @@ -1413,7 +1412,11 @@ FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
>   FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
>   FILES:${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
>   FILES:${PN}-qcom-venus-6.0 = "${nonarch_base_libdir}/firmware/qcom/venus-6.0/*"
> -FILES:${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
> +FILES:${PN}-qcom-vpu = " \
> +    ${nonarch_base_libdir}/firmware/qcom/vpu/* \
> +    ${nonarch_base_libdir}/firmware/qcom/vpu-1.0/* \
> +    ${nonarch_base_libdir}/firmware/qcom/vpu-2.0/* \
> +"
>   FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"

If we're deleting qcom-vpu-* PACKAGES, then you missed this one line to 
delete.

>   FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw"
>   FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
> @@ -1458,8 +1461,7 @@ RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-venus-6.0 = "${PN}-qcom-license"
> -RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
> -RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-vpu = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
>   RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
> @@ -1503,6 +1505,8 @@ RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo
>   RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
>   RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
>   
> +RPROVIDES:${PN}-qcom-vpu = "${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0"
> +

I'm of the opinion this does not make sense in master branch, backward 
compatibility is not required in master branch so we can just not have 
this line and let people update their dependencies if needed. I'll let 
maintainers decide here what's best :)

Cheers,
Quentin

