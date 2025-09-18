Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89561CAC5A0
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 12:47:53 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.143])
 by mx.groups.io with SMTP id smtpd.web10.13187.1758199663375057639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 05:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=Xg6umKOH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.143, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvlN9SA0ortDp5Rvgj83KTed/fW9nn494u3wClqs4MWIRbh3hlcNedQZsiaRrnD9pDzx4pGpVZ2q/qJfEA48u7qPeDbhtnh18KYfYSR+a4lSISZQuPM17Uu0aRVsHyaQsIr0FTlbRDMFly5PtbHyqPi08LVsgxDBNYIlvxyL8Oz7dMfsubhWrygXJqdjGzabQsq9DvTpSdsXPpkVvobPUxBcBKHv0A6andZx820/ZY+j5NHdjB4/qilh9LKcuCitFCQ5y/jT58vjz31G1V9w9RamCG54+AO3ZzOcA5Wisnb3lRboQNgXsIY5YDmIEZzHVicbnKVAdHd6zcPAmDLhgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqoEh2E6soIS9bTUfen7Ka9pblF83/qP+K/Dk8w7u8k=;
 b=UYa2fWnHCcMQXYo6cCuYlxbQsV8t47f+0OpjDoiiRVyGXkZhwUf+gPDr81eg3IcYyRNPlh1q4oCpB/F8a2Wrd90n5dpi3DBAyC+XRL7A3bUlVAD4eBMK6Ps0Zn7zZCJ6T6om+outw8wNOyYFdkaAxneg0A8j/qUAEpTMWPXtezd2MSAuDfPAPBLaHEUV3O8X859HeTd9ya12ToTlltoRBgJPdHHL/9CEVnQvM7vG7c7lBdmE2KTSVsvX0ikoTZ5i19VpjNQDXmejkiaEdWw0UhmXgcspZKMAHsDKIcyELEagvm6wwB3+NwHyHXC3Cl8W+mX5zIQMv4pXLUi3I+gWFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqoEh2E6soIS9bTUfen7Ka9pblF83/qP+K/Dk8w7u8k=;
 b=Xg6umKOHLUYciy68/62kIzvtcKpK6vcjRKuIE+O30m6o99E5NyivB8kRn6Y8ZGxKAq6bMw9bz053Qe/wf3Y6gNpT8F/xJXjtImxMT4kXd+9ujrd4Vz0Zt3jkdXPMGFHsgC53pIhW83o3QKa/s6HJ1lPZZseRpAoAKqgLfLrJB+45qwYp3FJBHoUzYQ5bR4TysUw3BvdGQnG+jwfoDfYew0oFLcYoKewmPQMUt97FQ/bBjFBZxBbLYhbrMdguTE5huPmp9Zx5a73xwMHSEPxMJxbYvoECuQ7Kqeu5TK2/1SBwmMQdSaF/N0ysgEyudd9oZ821uFPLuRbDLln2WvPzzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS5PR06MB8941.eurprd06.prod.outlook.com (2603:10a6:20b:681::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 12:47:38 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 12:47:38 +0000
Message-ID: <a9a5777d-d622-4e89-9888-3989f884e816@vaisala.com>
Date: Thu, 18 Sep 2025 15:47:36 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] cve-update: log timestamps and add force update
 for future time
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
References: <20250826185922.20154-1-peter.marko@siemens.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <20250826185922.20154-1-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0001.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::31) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS5PR06MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: 046ec2a0-f622-4340-6fd2-08ddf6b18c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T0w4Z3dKL1VMbFd1WEhUV0xYTkJ2RldpOGJNZVhQRlFPZG5zWTZmcEppVWlu?=
 =?utf-8?B?anpobithY2F4eFVUcFB1ZnpXOWtKWW9tdDdyeGsySDFZVmJEY0tTV3U5TVR0?=
 =?utf-8?B?MklxOTJyT25DZGtzTkxuQzVmMjFEZFRFVThGUzdDZFYzVng5UTBJc0dCbk1l?=
 =?utf-8?B?SDRLRkZSS3hWc245eTE1eGhOdytkcGwySkZkMytvS0lFaHJwOVNaQUtFem1F?=
 =?utf-8?B?OEp2WmFWeXdaOGcxa2E4UkZlS1ZXN1VBUWxUYkIraVFudE1KNncwWENiODhJ?=
 =?utf-8?B?d2hTRmFreTdPY2dEVmdmTGRtYkxQd2YxeEtGL3FFNEQwL2xncVRvYXZkcjY5?=
 =?utf-8?B?VWRjK3R6TTJ2NEZaM0xLbE1zWGhDTlBXNkNKVU51NTI4VHlUdmtFRm53Y0Zs?=
 =?utf-8?B?bU93ZVl6cmdFNUdnRm9QSFRxZk5zWE1VNmF6Qzh3cGZmaXJ4R0ZxcGVhdkNa?=
 =?utf-8?B?bytNOEdBSGUwWW1OYU1xbXQ0QjIxeVFxS1Y4NVpUTGJ1Mmt4SWE3UGFIRy8r?=
 =?utf-8?B?azJ1UmtzV1NXMTE5c0RqQlZYY2pqZjZGL25kbHJZbW1NbnJuREQxc0lIejNQ?=
 =?utf-8?B?Skc1RDZyQ1p1YjMwNnphU0NVWXB4ckNNYllMSTY0QVhidEZUa0paSHpjRHhM?=
 =?utf-8?B?dURXTDg5czB3RzN1clIwNUowWW54cElYT3JRQjhtWEpZL1JWeCtJSEFaaEtq?=
 =?utf-8?B?Q3VzK1RNRHprWkhxNGJOcExSTjNQV0FUMkI2VFBoK0lTeUdISURMUkhEb3JN?=
 =?utf-8?B?UU9QZzJDM0ZjN2NvN1NNRGJybGlLZTZ0QnE4R2h2Zzd6ckZ3eGxIMTFYcHFG?=
 =?utf-8?B?VjZNaHcxdmJtWGtMM3JFRU9GYk9MRDVRVkozMXp0Y3N0dlQ3dFVpVk1wdWl6?=
 =?utf-8?B?ekJZZVR2UjNkSVI1NVdlQnVKN0tRdTVXYzM4VllTZTkyY3U2T3NQcWFaVnhQ?=
 =?utf-8?B?SEpwRUxJeE8vZStYTCtrOUVMR1VPdW01NzlTMzdFMG1kaUh1eTlwR1ExbnFy?=
 =?utf-8?B?ZzlCQWsrMDFWUkFKLzYrd0gwSHpkQmdLSjB4N3c3aWE5YXNIclQ3K0paVEVK?=
 =?utf-8?B?U0Z3RkRTUDNkSG1hYUplYUl6T2V1cDdwYzl4YmlhRERMbTBKdlBzMStVUW5J?=
 =?utf-8?B?dXVEYnRVckpLdUlEWVJVNDJscW5yTVd1VjVrWk1seU1iVllDdUhtaThjVTZZ?=
 =?utf-8?B?Y21BLzhuR2M5WkNUZXlBR1NUeGNvcVFnN3BsNUtEYmEvOVJhMVlHUEdLS0do?=
 =?utf-8?B?TVpFQVpYZTg0ZmQ2RGlrV211aytpWFBMcGg0a1l3ajJWeUNXSFEvK0JKckNq?=
 =?utf-8?B?dkNJcVhiRmhkUWROWGRiM09Da1cyckxvWmlqWjhIZEQyNjV1S1EzRXZjMkJZ?=
 =?utf-8?B?STVIQTlkY2lXOXBpWXNxTnVESFNVc2pZYjNZU1V4ZmF4UzRSMmpJZjdLbC9i?=
 =?utf-8?B?R3dsNjNjZDNFaVM4UlZaUmMyUndoZEVNcm9xVWNRUk9xS1VHZ3hucnQ5RzZ3?=
 =?utf-8?B?WUZWTzU5Qm1GTm1MNjNrbFFTRE9qVHdId2tUMndmT2FrWnFkcGE4c3kxWXFH?=
 =?utf-8?B?VGFtU0RMaC9adjRZUkZSUno0QWJWK3BYdks1WGdEWGpVM2FpajdzVlZidWxs?=
 =?utf-8?B?QjRvVTlXbmFTbmRQWUN5R3ZxY1NxNmJocTR1T1JKOWFLZm9XVEtWdWJjQWhx?=
 =?utf-8?B?M2w3c3o0dE40V3dVanJKZUJvRU9VYk9yOGFZVklqTklodXM3Q2pKWnBqOHIz?=
 =?utf-8?B?czdSNlo3ajB4eHlkMzkvYzE1VW5BYUxFVGZQaVZBNGs1NXN3czNjWHkzWDg1?=
 =?utf-8?Q?/kyA7eZ2Z3+nKUOFX2zuXXC8BKcR+gYdBJajY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1NZcW54Q1M0MXJPT2NBTG5wMnpkakxqODZBLzUwZlBFdEFkME9DSm5MdUNB?=
 =?utf-8?B?K054V00wZkVGdG4ybzBzWkw5UnJqQ0lQWFc2ZVhDbGNZWFlyTi9IZ0pQbWJ3?=
 =?utf-8?B?ZkhMS3F5LzBGenM5ZXhuMzNFTWVOTHpnTHV2UFNjNnZrS1FSeDBGNm5XMDF4?=
 =?utf-8?B?NThqbFhQR29laHRFdlJZMFRmeWlScFhGY1p0MG9nNHJrbWRKclBQZ1AwL1o5?=
 =?utf-8?B?L28zNHFHT2pOQ0JEUzlHOE5qRi9UTzFFMVo4RlF3NEhIUktMRnJsNmtIUlBL?=
 =?utf-8?B?Unprc0ZaOEdSYitBdUJURnNVTmd4VERuLzkyV1Y0N0pwTkJFV055cG93UUVZ?=
 =?utf-8?B?cW8wQVd4RHMzeTZWTGpFZlRoQ0U4ZTlHL1RFZXYwazdlOUQvR0ltZG9qeTVR?=
 =?utf-8?B?U05YNXBrQ3drR2ZVVnNjUVI1MzVMTDRBejRzUDR4UHNyeGJ0UVhUaC8xODNV?=
 =?utf-8?B?L29pckZmNUpPL0FicW5lUVNwNTVXZ1UxbnhUUkdiU2kzS25RcUNaRUxoVjZR?=
 =?utf-8?B?OHBQUUdwNDhXSTRqa0F4VU9RWWhUU0FPbXo2K0tjUE10NlZLYlBCVkhRZHJk?=
 =?utf-8?B?TFJRN0ZXck5wNm43em5jUjZiVTd0MHF0clE1Vk4vTEhrK0pNSGNKZG4xR243?=
 =?utf-8?B?eW5IK0JDeGYrckFPdk0zQS81ZFNibjR3MCtnM1JpOHRlYTlpUGhEd1V2aUJF?=
 =?utf-8?B?d1dPcS9Pek9rUUpYTHkvZTNKRW02TFFtTU1zNENrcGdmbnB2TDdtQXJyeHRm?=
 =?utf-8?B?aUlNb0dPa0V5Y1gzbUsvd2NCZG1iVUUzYnBqaWJacGFDMGNDZHJabkFDSTd3?=
 =?utf-8?B?VmlBRm1qRlNOdnNPUzRWYitXbmlCZGszMzQ4ZEtXU1lRR3NUVkc4c3pZc21F?=
 =?utf-8?B?WUdFeVVKcFlxWm9EcVp6dEtLL0toMXNWb09UTFJVSnZyMTlBM1NvOTFrQ3V4?=
 =?utf-8?B?UmxRUThWTG9DcFBFakx5VDgrWUtBdW42ZER3ZDdaL1g4elArZjdJRGNhVFZY?=
 =?utf-8?B?ZEkxREtza2QxNFZHWnAyem1nMWRmRjU2Z1B3N2IzTjdKbUFHdFRTajNqc1Fi?=
 =?utf-8?B?cFFmeEtvdHlpTXREY2pwclppTW9Xb21oTC81ZWtnd0g0em5WbFo5bDFTUSty?=
 =?utf-8?B?V2R0YUkrSnVDbFBYVXVUTmFFRDIyRjhTb2JOaVZVU3pWL0UrRjdmUW9INjZr?=
 =?utf-8?B?YWx3QUJtalhodTFWbkMwSS9QL1hxYVUvQjBiVVlkOC9kRmNKUUlBWTBDSS83?=
 =?utf-8?B?ZWo1cU03SzBkWmJRUXpIc2t1VU9xaVdVcjExRkdOQUdUaWVWSUlMQVk3emdz?=
 =?utf-8?B?SDgwQm5JVkNtQjRDcHBhZ1hhK0FFUmRIN0wzNStMeng1Y09CSS85UXpRSmtk?=
 =?utf-8?B?ZUJZSVRTTVNTUEdmSllxdk56TldCTlZ6bVlCVjd4eGxndWdQQ3FFUTlhRmRF?=
 =?utf-8?B?OFQ5c0Fac2RKTlhXeGZsOVU2cVFialUzNUJwLzdTYWtzeVprRWJVS0VHT3RK?=
 =?utf-8?B?NVB3aHhSV3IrWUFoUDhveCtteWJ6RWhkOUQ2cS8wbnZmMVptV0tGMXZSUXFi?=
 =?utf-8?B?NVVHWFRXeEpiaWRVdEZJT1FzYXk1ZmwyakVCUGlzQkt3WDVzSFZpa0V3LzZ2?=
 =?utf-8?B?SGU4OEZpMCtKQTFJckFZOTJON3pCSTh2NTU2UkpnbGVRTXg4YitxMFRrcXlU?=
 =?utf-8?B?WWxaZll5VmJjNUIxeEcvclM1UHEzTWtPR3BuK3BXcjhMUklPblRMNmlKdXN0?=
 =?utf-8?B?RHloSzFXSUZ5Z1JGTkVMcFpmZk10VEQ2S1d1RTVzQ2N3R2FFR1duRFBrd3lO?=
 =?utf-8?B?dVJYZW15ckMxeXdCWDJaN0xQaTNzYjZFQXpZU0p1SnJRRmtxL3VTOHYvazZH?=
 =?utf-8?B?OVJuYUNkcUpLQ21uWVZDM1c0emtHSVd5ZHpPVTVoK3ZES3U4NzJtbkFQNDFO?=
 =?utf-8?B?TUZpdU1Xa2hXZTkzcDBscU1XS0Z1OHN3T1U5bVVtM2kwU0ZLOFA4ZWM0UkVJ?=
 =?utf-8?B?dmNOUTg1VnNLTU8zR04zUG9XOXFFT050TWFmVFViVTY1QmJXSkp6a3BvM1B3?=
 =?utf-8?B?MGRXZjlXSkphOVM2bllUeCt5d1Ridk5FdjUzaGpHU0NRMm5JU2dzSVdpS2ZT?=
 =?utf-8?B?aVZyUENVWE8zSjRQb0E5ZGdOZkt6LzkwaGFxWGxZS0tWMzlzMWRqZklIcHVP?=
 =?utf-8?B?WVE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046ec2a0-f622-4340-6fd2-08ddf6b18c70
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 12:47:38.3722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YcvPICOa02fhfyv0MeAMoByyk4Upya5ehdFxGWtI+M9IGtec8qU29EmbCvV6v+b81nVaDc03ZJYWTlVKeMV9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8941
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 12:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223638

On 26.8.2025 21.59, Peter Marko via lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
> 
> CVE update is currently not working properly on autobuilder.
> This improves logging for problem analysis.
> 
> Future time is something which could be reason for current autobuilder
> problems since the DB was not updated for more than 3 months by now.
> 

CVE check mechanism, which relies on a CVE database that can silently fail to update for several months, seems troubling to say the least.

Looking at the do_fetch() method in both recipes they seem to use the os.path.getmtime() method to resolve the last modified time of the database. The value is however based on database file modification time. This seems inherently fragile, and I would be curious if there would be a less problem-prone approach that could be used to resolve the last modified date, such as resorting to the most recent CVE last modified date. Seems it can be extracted from the database file by issuing:

   select MODIFIED from NVD order by MODIFIED desc limit 1;

I'm not sure if all things considered it is completely appropriate to utilize the NVD MODIFIED value in this fashion, but it would feel at least less hazardous than referencing the modification time of the database file itself.

-Niko


> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>   meta/recipes-core/meta/cve-update-db-native.bb   |  7 ++++++-
>   meta/recipes-core/meta/cve-update-nvd2-native.bb | 11 ++++++++---
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
> index 0c7bc5f4151..713c73e574f 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -57,7 +57,12 @@ python do_fetch() {
>               if not os.path.exists(db_file):
>                   bb.error("CVE database %s not present, database fetch/update skipped" % db_file)
>               return
> -        if time.time() - os.path.getmtime(db_file) < update_interval:
> +        curr_time = time.time()
> +        database_time = os.path.getmtime(db_file)
> +        bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_time), time.ctime(database_time)))
> +        if curr_time < database_time:
> +            bb.warn("Database time is in the future, force DB update")
> +        elif curr_time - database_time < update_interval:
>               bb.note("CVE database recently updated, skipping")
>               return
>   
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> index f7a306c995c..1411d16e20a 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -71,10 +71,15 @@ python do_fetch() {
>               if not os.path.exists(db_file):
>                   bb.error("CVE database %s not present, database fetch/update skipped" % db_file)
>               return
> -        if time.time() - os.path.getmtime(db_file) < update_interval:
> -            bb.note("CVE database recently updated, skipping")
> -            return
> +        curr_time = time.time()
>           database_time = os.path.getmtime(db_file)
> +        bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_time), time.ctime(database_time)))
> +        if curr_time < database_time:
> +            bb.warn("Database time is in the future, force DB update")
> +            database_time = 0
> +        elif curr_time - database_time < update_interval:
> +            bb.note("CVE database recently updated, skipping")
> +            return
>   
>       except OSError:
>           pass
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222475): https://lists.openembedded.org/g/openembedded-core/message/222475
> Mute This Topic: https://lists.openembedded.org/mt/114905419/3618471
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [niko.mauno@vaisala.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


