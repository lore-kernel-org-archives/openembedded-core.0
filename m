Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5981ECAC5A0
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 12:16:13 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.44])
 by mx.groups.io with SMTP id smtpd.web11.12458.1758197772653520311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 05:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OdVVv3f4;
 spf=pass (domain: cherry.de, ip: 52.101.83.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/HrIyAOF7rfqr0es484cx22xWI/4JTfWiSXTvcy5N6+XmNPKs6QzCZCtquA3f7Om95oQ/tMVoZA/AoJei8Caunz/pUyesXw91cs7nnoycXNAiJCXySrIreNAo0O7pbK/wwA024FqLI/q5pxO/uy0EP+3JQeA1VLB0KJrO+MzJFSpJlaTfE7tfEXREU78O4ZX2eJYa/b5KQgLmsyGOyoUrPQmiWXmCA4+VcE2GpSq4MR5L6OTLj5b5h6Th/BwGB+l1u/IcT96uKOHV3gr9EzDCyJhnj6Iz6oGwjCCxw7c3f6xuIkQuRA3mLMadlFXQ279A6tY6Fp/lxjtIBxLGg0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfgyfpvqH3+Vi/Osb89y7M85Yq2J8KX2DqKBVPpHuV0=;
 b=nuiow/Cath2olv41Xwe1N/NnV14q5ildBpX7fzFFSyOoaaqCFHLzvD4Z37afpdFZ5qkDwoxA7dZ7mqsog1Dv4kmYxJam/9IsQ4CUSyovvDXluSxu5IUSyWnNZNpoU1c9ko40zexc66SImfklCXyi1MwP/ZO97RUfbEZy4aeNG5mGfj3PGtdckwO9v/syxfjSGopA20Tq7PtZEeS+CiJSPcwICKCugOk/Kp+VF2cJ26XTAkwi37bzo9un5XatTEdUTbqzBSRuU3wCHSmemtGuWll0vesiCh1gIdCz0qYVLi7qfxQIQzNtON5zFir/FocAn/8K53i+MZ8LaUa4AwQXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfgyfpvqH3+Vi/Osb89y7M85Yq2J8KX2DqKBVPpHuV0=;
 b=OdVVv3f4frLy5UlorGhO0FCCTv8wlG3orQziv6H5WONzeUk+zDzbTKBlvnza5hC2pN3Qj5vOdi/+SLxLW/4fV0UaxGsMPTjpfBS9PL0VJiGnw8pElSg2AH8mqOek2qord0NW27lflpJ7LoOrgE32pU8TWd8H1PPm78ujYi0vris=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9317.eurprd04.prod.outlook.com (2603:10a6:102:2a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 12:16:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 12:16:08 +0000
Message-ID: <aace897a-b003-4929-995e-479740c109f3@cherry.de>
Date: Thu, 18 Sep 2025 14:16:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/2] mesa: add opencl DISTRO_FEATURE
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20250915232557.536762-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250915232557.536762-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0239.eurprd08.prod.outlook.com
 (2603:10a6:802:15::48) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9317:EE_
X-MS-Office365-Filtering-Correlation-Id: 940f7692-6cbd-45c2-912d-08ddf6ad25d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZWJXUHJ0UmJlWUVqY1AyT0dSa3NMdnVrNzBNVGVvQ0xNS1lZTUpqV1hOcDUr?=
 =?utf-8?B?S29acGhBRnRLcEFsdCt1cFBOVmE4SFlJS0hGdnlYcGdBcTNCL0RKZ0JTZXZa?=
 =?utf-8?B?UUZoU3FRN3dueDNJelZGZXNHT2srSEtpN2l3V1hvMHNyRFBoVUdnVGNPMWRJ?=
 =?utf-8?B?ellPQUdjTmhCMjJwUm1oVHh2NldXSjJtWktiTEdmSVE3U3ZZV2hHNW1DK3Q4?=
 =?utf-8?B?Q0FVNmFOWCttUGFkZE94VU14WTArd3U0N1crQzdFZWRtdHpSVHNoQ1RRKzNk?=
 =?utf-8?B?b05LWVdkNk85c2tNUWVCVXdPSmltNTQ5eVhadHJ5WHdjaWhZNUs4VTVqYU9v?=
 =?utf-8?B?YVNtQU9ZUDF2MXFiZG1qZ2o2SkZWcDF4WmFFU3RKc2Nyblo1VGFzb1hvSXdB?=
 =?utf-8?B?M0Jzb0pJNE5iajE1Um9kNGoraUthZ21MZEdGRDVVWVdKTGhsbGcyYzhocU5U?=
 =?utf-8?B?alEyaWtmL3IyQzc2ZXduOVM1bngzS1hvS0drbk5RQ2RvcjNyeGV4NDY5UEkr?=
 =?utf-8?B?VldCWW1KZWRXU3ZSRHAvS1VrTUNyUHNsYkNyYnFsei9VQ1doMllveDFjVFNF?=
 =?utf-8?B?d3c5b0g1TzJkNis2QzE5MDNHWW8zd2l4Qm8xbGhudlhEbDNnZDZtRmZzVHoz?=
 =?utf-8?B?a0V4cXd5d2lxYm1UZzZtVzZmMXd0UVR4b2VOeHNqOW9zTXlscTJPUDBzSGFN?=
 =?utf-8?B?T1g1MXh2N2ZVMXd5SjM0b1BXdGRFekJZSXdYNlg1R1lSR09EeVdzSzFYSXVn?=
 =?utf-8?B?N01LbVdrRUYvSjliVGtJdVVhS1NtM3FWeW1BQndHL0taTXl5YjBrcTRCVFRj?=
 =?utf-8?B?dHN6UVAzRlZIYWZBKzRmS0ErZW0zcmJsWVZYY3ZqazgycWgyQXJrcXozeDM1?=
 =?utf-8?B?TTRFZVpJYXl4amkydHBTVStmd0JHeWZLMmR2ZDVpNDBoZlFwelZHRXg3VkM2?=
 =?utf-8?B?d1p6OHNNZEcrQ0xLQVpZUzR3eFB0a0xHSWJQcVFqZy9naTBwRGhSbFN5SHhi?=
 =?utf-8?B?bUxzTXpLcjR2OHk0bTFDSDN6N1ZKWGdieTRxN0xmU2RaRzNnVmNqdmFWMERw?=
 =?utf-8?B?RGRDRU54dEdtYnorVUZZSWtkQm1PelM5RWJvdEFnQnhnOE1tbWU4em1uRCtl?=
 =?utf-8?B?SnFlZkMybE1RcHQxS04zVjN5SHJ2aWsxSCtzanRRa1lDNTlrZ0JHL2NPRm9l?=
 =?utf-8?B?NzJHcHdmdnFzTUNGOGlSYmI5UTg1b3Vmdm9CT3hmLzlxdlZmS0ZSYzFkZEh4?=
 =?utf-8?B?WDNSYjAxRDhIQVpVMWhJRTBkZG9DaHVadm5wdFQwNk1kYkZRUXBTS1ZjbW9s?=
 =?utf-8?B?OUNwcGRkNnd6ajBBdnJuNDlNc2FSQU5FS21rY0FORlFMbVhHQk5vNTZ2YkpY?=
 =?utf-8?B?eHR2SXQxRVo5R25WMGtURlY0UGd0a1hVcDhvTjNXdzUxcVZES05tQlE2WUg3?=
 =?utf-8?B?b1p5cWI0U25nMHRncXRaNFk1OEJoWkIxbXdYcGlTQ09SbmVCMEhZRnlFbnRM?=
 =?utf-8?B?QXRzZTVkZlViTitHTGxwdG5IV0M0ODJSeVVTUlBna2NkL2tVRW4vUWhUYnpT?=
 =?utf-8?B?NGJSeTdlVlpVTHlsVlNScnZKMmRuTGgxUzU2MVRFQnhyNDJBV3dzc0I5V1hS?=
 =?utf-8?B?WkU1UmU0N2psZWlibHg1ZC94NklSOXR0Q1VlVEgrdGhkWTJ6OUVpTDNmeHda?=
 =?utf-8?B?OVZKY1JadTNFZkNoajZzeldiYlAwMk5iczNnL2E1dUdyNHhkNlZ1TXVoUm9Q?=
 =?utf-8?B?WkR5b1E3UkFCMkU0NXdxekdldVRoaUNkS2pMTEI4UUUrbmNPdVR3dXFvcURh?=
 =?utf-8?B?V3VtZXJDOUJJVlM0b0lVc0ZQamlqbjF0eU1FbDhLMEFFV3BKMXFKL0lMbTRl?=
 =?utf-8?B?bjJJTEVjWEhEeGhab2dOUzJVOEFRTGlFQWpGUnFTQzNPeFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c1Nrb3hMK2N3VGJXREp2czJqZmFpWTdDblV4TjBHdHdzTEpuNkZtSHVjelI2?=
 =?utf-8?B?Ky9iOTdBTHFJNEdtUlFsRFNwUTYzQlFvRDl4MkxqTkhGQkZ5cldScmNTM01l?=
 =?utf-8?B?ZDNBRytyOUJqRFppK1grVDlqVjVHYUtCL3BGVmNsaVhyVU14Q1FRcGRrUlBl?=
 =?utf-8?B?bEtYcE9hcTZQaGJSZkQyb2w1S3Q4NVdxSlkwazVwN2xlK3VDRlFsMy9rUm5i?=
 =?utf-8?B?ZDdQUFJPTjFZaVByNmxuUVBiQVI0TGY4eTM3WWNvNkR6ZVJGbHVEektHNGJo?=
 =?utf-8?B?ZFhiRXplaVpIay95NUV1Vm94VFlSc2NNNlFmTW1LV1I4cVRBeHFEamZTZzJ0?=
 =?utf-8?B?Nlk0TmVnd2lEb0VueWZPa0NvY2RIcDVtMXl5MjhJU1VITERZYjV2ck8wUkdu?=
 =?utf-8?B?ek9SdCs5T3ROTi9tOTJ1cFVyR0U5SElzZVpQMjlvVThCd1hSQ09QYnZtazhL?=
 =?utf-8?B?VGE0OW9VUnMyeE1WL0w4TnkrOHFZOVdSRGZEaUFmVVIyQmFEeWJ6VHl4SGNC?=
 =?utf-8?B?T2MrZUZyTTY5cjFSSFFlTTNVbldTZ0RwTTA4MXhhbHQyYk1GUVVzVTRCV0xu?=
 =?utf-8?B?S1hBNDZTWWZEdlp5MHNHTHQzbFdUZXJya1FXOUZUcWJrREd0SE1LUFpOQnd5?=
 =?utf-8?B?eUxBYkRwaStHYVBWaXRSOWVTYmhlU3pnU0Y1cnc1R094clZObDEyVHFERDRz?=
 =?utf-8?B?TzliU01WaUo2ai9BeUx3djBWc25lVGszSlpWWDQwWWtJcjhqR0FLZkVMa1lT?=
 =?utf-8?B?R21YUjRwdSszaFNvVzFCcVh1Qi9NMTNPUlBhQkllR2trTGRsOEtKdXBKWWY2?=
 =?utf-8?B?RzVLUGhTd0dhZHJPb3JkTFY1NFFreDhDSHJUd1cwSytONDhmTysyLzhhbUc4?=
 =?utf-8?B?ZHM5UUNxUDVHWEM2SFFVRCsxZm5XYXlxV1oxNzEwY3Z1aXVTTnc0aFZpVnhS?=
 =?utf-8?B?akZaQm1jUDNYZkdNVXBFMWhKMW1vU1VsS2lnSjVieUIweGkyVHJ2UVB0b1di?=
 =?utf-8?B?N0xLbmlRTy9DdlVqaXFxNm5EbTE1clQydldCS0Mxb3FZaVlxUGdKNXJGRGho?=
 =?utf-8?B?LzRPMzg2S0VyN05ZMkwvcE94R2pUbWlOUktxMmw5RU5IM290cE8zSXZ1Y3ZV?=
 =?utf-8?B?TTJWUFBWNzRKWEhGVUxpV1VmajFWcDZKN3VvaUwxZG5YVFgzYlgySnhjWE0x?=
 =?utf-8?B?aTNKVkpxV0xwL3VBWGcybHlDWnQvWXlubzBHaVowMlhOUUg3QTRNdE52Kytm?=
 =?utf-8?B?WU9pV3BMU044L2RWQzkxQWhrbHkwRVpqb3lHMGlFL2k1d1VqeXZVZVB0eTZW?=
 =?utf-8?B?WmwxMDg1REE2TnJPM3ZtSW84NnQ4aFFzaCs4bWhqUndINlNZblVnZ0xqdUdu?=
 =?utf-8?B?TVl4TzNTTERFaEJrdEZWMEpCcWlkN0FSQkJ5aytmNEdQdXZxa2dIQVErMG00?=
 =?utf-8?B?blFKajRVemREcnlHWTFQSjBYdm5YNVFTcG9oRnhNQ0EvS1FoTmtJR2FMdzZ2?=
 =?utf-8?B?SkIraE9sNjVxNDZ0Mzd0OEswdEl1ekdEMDFjMVpxTTd5OEtobFMrajlhODNq?=
 =?utf-8?B?alRzblNWbElkak1uaGlJQW9kYWtyYkxQbGVPOGRpajhMTGUwbmtBU2NSNWlL?=
 =?utf-8?B?OXBUdWVzaXNCK3grcUFBdFVEcXdIWHZWK2F6SlNvNTZPVVdWVGRocU9OYmp5?=
 =?utf-8?B?K0JMV3BBR2x3SHU4VWJlbHZYdkVEenpvWnY5YzNPZnJSOUpPMFprRWhTcURi?=
 =?utf-8?B?cGdla2UrWHpBSHIxdEhwTlJUYVJ1T2xQOUhQdXZkcHN6N1djbFFLdktkZUJK?=
 =?utf-8?B?S3ZoMXRMUkhnZVVlSkVLclRoYlFhY0wrdmpKeFFucGZURzRVeHRPaVR3bE5p?=
 =?utf-8?B?bXppam5Jd1ZJQ2JjcERtMzBURHRuVUxHWlVncEE3ajZ6WXBDRXpSNlpZQlEy?=
 =?utf-8?B?aURKQXE5d1JiK3ZQTGZvUE11Yzl5YXpNM0svTHZ2NjVUWGd3Ui94RVdWUVFn?=
 =?utf-8?B?VElBclRQQldUdmJvN1BGUitpNjdheUFYcmNwNG14aHR5RG5GVFA3c1E2YmUw?=
 =?utf-8?B?Z3RLNWdLb1ZsK3FKYVNsZGx2OWt4clF2MWJoWlFsNk1lQnNHZVFNYk9DUzVF?=
 =?utf-8?B?VXVzaC9RYU5CbXlla1pkMEE0WFhpck9GRGs4TUpEZDFtZkp6UGtwbFF0R3Rm?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 940f7692-6cbd-45c2-912d-08ddf6ad25d9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 12:16:08.3141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKcAJrivxA2J1I/vED82zMVZs+uyP1ymKN3Z8+7C27alMCeNLLqdagETMIhI4MFp0ihdLKeeiShxU72+sgXp99HyTfthzPsveqhnravV+UM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 12:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223635

Hi Dmitry,

On 9/16/25 1:25 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> OpenCL is an important part of the GPU-related world. It makes sense to
> be able to provide headless environment (without OpenGL and Vulkan), but
> having just OpenCL as a GPU user. Currently it is not possible since
> mesa requires either of those to be enabled for the DISTRO.
> 
> Add new 'opencl' DISTRO_FEATURE, controlling enablement of OpenCL.
> 
> Note: Mesa, if built with the libclc packageconfig (which is required
> for OpenCL driver) depends on the mesa-clc tool from the mesa-native
> package. It is required to propagate opencl DISTRO_FEATURE to the native
> set in order to be able to fulfill mesa -> mesa-native dependency as
> otherwise mesa-native package will be skipped.
> 

Ah, I think I see now.

Wouldn't that be handled by removing the dependency of mesa on 
mesa-native for libclc if we switch to depending on mesa-tools-native 
instead? Something I attempted to do here: 
https://lore.kernel.org/openembedded-core/20250822-mesa-libclc-panfrost-v6-12-393cf47e2fa2@cherry.de/

What's preventing me from doing this right now is that we have expat and 
zlib in DEPENDS in mesa.inc and mesa-tools-native is including it but as 
a native-only package. In that scenario, DEPENDS content is NOT 
automatically replaced with -native recipes, but only through 
PACKAGECONFIG dependency mechanism. Therefore, we would need to migrate 
expat and zlib to a PACKAGECONFIG option (which can be enabled by 
default!) so that mesa-tools-native can be merged and thus remove the 
need for a mesa's libclc config to require mesa-native's config to 
contain libclc. Which means we don't need to have opencl in the 
native/nativesdk filter?

What do you think?

Cheers,
Quentin

