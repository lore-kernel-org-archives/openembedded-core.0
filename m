Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45722C87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 11:07:31 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.27])
 by mx.groups.io with SMTP id smtpd.web10.4370.1753787243099948298
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 04:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YqHxvzMN;
 spf=pass (domain: cherry.de, ip: 40.107.159.27, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDjXwR0Os+2SPUbwj5hS4UD7heL1Q1hY7H834vlpVwQAQ6YARemr3O73aHwd+LD4MaQleHCzr01buBjxrN+YPKGwLijXd7abse3BHBsXkmV8s8vQqcEPxzwsHmWEKzHmkKnw/oAOSdsKx0bKl8JPNJfrXZZ/I1wD9mjFHMG6tbr5CmgkZa9xuf2p7qoWB6eXDfsVe/CurfubRHMw5uNbIURXBBvTjeG/gcM/SkerUjmCHp4ZxiF1BJoLDMmnOv4aLrxl4mXtUSIXq6T0sqzMyyyLLLVZUEQON5Ei+GXJXuIg+8rzh2Nn6h9SJZnllj0unI8upIUkekgTBI3KMXX1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WkNn/hOsH9COXBRpp3ZXvLYvbiDXGmh5kMre2LytPg=;
 b=Exzn9+1MWuLvCKUJutMU73zXkfU3r4ZM/8eyTEoN+ZLibB4RklS6rKk4tz0qltMLn3kz9lgFRwgwW6R6jAfbQbix1HIy4AeKMzCUYVhq7T1monvKu6KcIcXwlKle/3YwzuO+ap+lLFFJkgC7x0MN+ESKKHLmp9ZDUr76vsKyhrzt4crLbw9jQhvqTGH+TjPZTudtdfKpNUmCEUksMqJK1TY1/QrZ0ARLgI2go5Aep3HHw2geg5Lh4YrB5sniq48QdcH4gv+fQmWyhcrK7DZAe93hmG4YhQXuxtM9p2ShND/RpI2+rEAh77aw9X2fz6h/8xPUGIyYdq3acyzEd/vciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WkNn/hOsH9COXBRpp3ZXvLYvbiDXGmh5kMre2LytPg=;
 b=YqHxvzMNADxP1nv9cDSUP2LfS6SdLt0mCisxOPn2/Fl63KuLcwVwMa6atRooNz+r6mRJhTwS9Yer2+XJdmiWEoYtr0CRh1AF7jKBem9SI/qeVC4R7FRzSy40kwF9M5gvQI0/vLTohCK1s0Ukj+gEyhhdrGBiZyHg271Vl6IeEpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB11058.eurprd04.prod.outlook.com (2603:10a6:102:489::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 11:07:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8964.023; Tue, 29 Jul 2025
 11:07:17 +0000
Message-ID: <8df98858-1aac-4314-ac6e-b43b7593aee5@cherry.de>
Date: Tue, 29 Jul 2025 13:07:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 6/9] mesa-gl: drop egl/gles from default
 PACKAGECONFIG
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org, Markus Volk
 <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
 Ross Burton <ross.burton@arm.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de>
 <20250729-mesa-libclc-panfrost-v3-6-42559ddc93ef@cherry.de>
 <t7yu2iynfa5vewdnzliamq7u3b5ufppjpanm53n46m7pqhtop2@a2y2gfbu2lud>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <t7yu2iynfa5vewdnzliamq7u3b5ufppjpanm53n46m7pqhtop2@a2y2gfbu2lud>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: LO4P123CA0540.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB11058:EE_
X-MS-Office365-Filtering-Correlation-Id: edd83ae9-4481-4783-2ef1-08ddce9014ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cVZPNlgzYTg5ak1WQ0hnOFVGaHhZcjRIa1ZYOFVWc3NzSU5qQzFkU1dBcDhZ?=
 =?utf-8?B?ckRRZmVvd2N3U0pscVdqOGhhS0lRY01MVkFtckxIY3UvK01wQ3BxN2FHcSto?=
 =?utf-8?B?NlNqZVJ2dU51N3RYbnc3RFRwVUh6TTdGZWJlS3dMMFFVcmVCQzFlRlh0dC9R?=
 =?utf-8?B?aVQ5UXVjNldwM21id0N2ZW1TaUN4YTBTWEJ4MnVXcU1pQk0zVlp3TTZQKzJh?=
 =?utf-8?B?N0hsRXdEdEhMb0ZuUVJjQ2diM2RTQ0pjM1pUNUNJVmZweE5jMVhPTzI5ejJX?=
 =?utf-8?B?VDY3SUJDeUUxT0t6ZXdUS3lJUUErZEJGVnZZaDRJUWEyRGQ0eTF1cXh2Y3ZH?=
 =?utf-8?B?SXJmcDhTUUl5MWhyZXZmcG5TaUppSmE1UFZWL29KZEE3UEtrd09jeStmME95?=
 =?utf-8?B?dlRjOHlmWkpFWUNsNmlhMFVVV01lczhVenNtQ01YVTFvb3BEYXJFcTd4QXFI?=
 =?utf-8?B?UTY3eC8zTlBhMzhjaUl5T1EwVCtMNUxLcEFkYXZOT1A1ZVJEK0VuU1ZHYXJG?=
 =?utf-8?B?RUpXcU90dmFlVWI3ZjRXckJHaGNrVnBKVkszRHFCL1Q2RUlOajY4QzZGaHpu?=
 =?utf-8?B?WEJmMmdBOWZtdkN2b3k2cDNJYURHcXA1ZnN4V2gveUJNSEFXbmJZU0FEclgv?=
 =?utf-8?B?NGNVVFo1ejExR09ZeFpINDNidzBDU002dFVjR1QraHMyZzdJZHozZ1ZUYUxM?=
 =?utf-8?B?UnYzNWQwc2VvRkRKWUtqdjVYWFh4YWttUEFjU0ZJaUhJWVRpOGlGS2FLR3l6?=
 =?utf-8?B?K2t1TUQ3V3BSMFhoUndlTndPMG9ZZFQ0bFpSRU8zcEV2VWMyN3Z5K1E1dU1m?=
 =?utf-8?B?MUJRNWpORS9mSndNdldHUmY1OURYYTNVMVF0YUFFOGxMYWRteFYveTVneERV?=
 =?utf-8?B?R2xseU84Szl1SXFnSGxKRDF1Snl0VExwYjE2dDdKOFNzVlFWK3M5TXpuQzdS?=
 =?utf-8?B?RW1Jalgrb1JXT0RZdTB4MFcyMkJ4UzNWYlNCbjZBVVhaYi83SE1HZ3Z5YUpW?=
 =?utf-8?B?RzhJeHVkMUJ3T3c4bldnempTT0ZydE5kUFJLWXVOa0cvVnAyQTl1VnV6dllL?=
 =?utf-8?B?N2hHL3ZDK0gzcHZRWXpBSWFlUTk2L0c1cTZ1Z3lzdnZ0cVlYWFhsQ3dOV2Ny?=
 =?utf-8?B?WDBYQ1JqVy9yR1A3OTRWM2FQa0ZUcFVvV1dvalkyQlZUQjI4ZFBGNC8zcVhm?=
 =?utf-8?B?SjdFQlhTWityV1hENDVJRGsrZkVKaE9RcGh5bWxsZzZTMFFteTkzaG0zdy9W?=
 =?utf-8?B?UklteFFZcm5xZ3pxcG9PV1g3ZW5UK3N4anpRUk81ZGxBS1VQRUl5aFhJVWxy?=
 =?utf-8?B?clM5UlNPb1NDYjF6YlZpSmc1dlYxMzlielFwV2RDTFRrYkE1L0Y0dFFLRDM5?=
 =?utf-8?B?VnRDMjgycGVpUzVaaWpyQjFXcnA3VHdEa2hmNXBON0haZEwxK2xMeEMzRkFr?=
 =?utf-8?B?SnhscnZDdkdmcmdsaFN4UlVwNGltOWRYSC9XazlOZkl1Vk41QVpsNFA5RWVP?=
 =?utf-8?B?KzhhQ3lqN3lyOFhjdGFQVWkyVzBuOUg0aVp4b3BpNzBGWWdLTlVoTEJ2QS9F?=
 =?utf-8?B?YzgxWDdXUjRkbEUrb0hwMndIZmU4RXJGR2h6RDF6Y0JnbHZZTFY0TWQvTWgx?=
 =?utf-8?B?Ti9zZEk5T3lSajVyVXVESjRkVzlTRDZiWTdTQkpySFlzRHppSzhjMEVobGc2?=
 =?utf-8?B?KzRoRWRaL0t5dm4xdnFGWTkrbUNSU2s4d0s0SXl0SklMZ2Z4K2JSbkpWbmxw?=
 =?utf-8?B?QUcrS3hlTkM2QjhnTndqckxGZkplQWtCQnk3eGRGRGQyVC84V2lCQXNRelZh?=
 =?utf-8?Q?hiXSYn+5SjAPqSFxh4+yX6eMh3EcPo8o9MRLI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MXdteU5oODBaRlc2MEJtVXpkSDJxdmtlRWdLNUZReSt0eHpLNDlmSUUrZ09z?=
 =?utf-8?B?QmIvNUc1d0NJZ2RQWVk1K1RJU2ZGVlp2UjE2cnJxbGk2R3EwMG5MV080a1U3?=
 =?utf-8?B?YUZFVkxsS2YzK0sxcVJrUCtzVGtQUzNTcEVMaWFMN3hjbFQ4UHYzS0p5a0Y3?=
 =?utf-8?B?d0hFMVphNWZKQ0FEZGp0NnV0amxZUnJKVFdKN3IxbTVFcXJWc2FLd0V4d05V?=
 =?utf-8?B?Yi9kazdMZEVkY0hBbVJLTWJOZEFyUEE2dlp3VFlSSUVacFl0QndzTnRUSWJn?=
 =?utf-8?B?SzIyc1pyam8wMHdjdUlPVlVvVzlDNzV4TUNoWmJzUFpVSnF6TkcvQ2s3bTZ4?=
 =?utf-8?B?dTJEa3FpNWIzRHZvVlNQZmRQYTRFeDdiWTFnMVNnbnFEVTUrWElGYXBuZFpN?=
 =?utf-8?B?QUZwWVNnU1AwQm1OMWl4UVRtQXpyN2NQUVZnSTFnZDNKY25CcHhFNWtaTmlP?=
 =?utf-8?B?NzZZREhMQlA2aWpNNSs5cDhjUWxnYjN3T2p0ZlhFRWZrSkRJcmRUL1VIUHRn?=
 =?utf-8?B?K1gzK3J5a01lTVFjL1Fqd2xFU2Fia1hKd21yUnMrMW4rajFTSzZtUWFTbC8z?=
 =?utf-8?B?RHV0QW9td0Y5Y0FZb2dRaC85d2JMMktOcWxRRGdQUkZxb1FKWXFtSzFkK1pI?=
 =?utf-8?B?ZzV1YTlSZnQzQTdsM3FNRFl3MjUreld1dWppdmdEVDdGOXpkVUNtQitkYnVG?=
 =?utf-8?B?ZG5VZVF0ckVPaTZxenhJWVdCQ29DVFc0YkhZb0dORE5hMWcrZG1HeXVtazYw?=
 =?utf-8?B?SC9zb3BKL2FxSHBEWVAzNWxSZzUwRFM5Qm10cWVRSExsRXllbW9GMHV1QjBY?=
 =?utf-8?B?SVI0SW5Jem9sdURwNjVXMGJ1eXREK3FUM0lFVm1BbXV6S1JhTm8zdG1taEdF?=
 =?utf-8?B?QXNoMmNsaFp5MFVhc0hRRGZxYWszclR1QUhlRk8zUllCdjlqR1BWL1ZEcU1M?=
 =?utf-8?B?c3dVRXJJZk5OdXlYcGdaemxiUmRaOEpUY3lHVVJoMVpEUU5FeUh4a3hvdEM5?=
 =?utf-8?B?M1ZMN3oyT0VGOUovbkJ4cjcyTHhhb0owbW95SjZtZmw0ejh6Y01PYm5VQVZn?=
 =?utf-8?B?S0xYQmxlT0c5V1hCL05BRTBRbjNDd3Ivc3JnLzRtNCt1NC9NSDI1NFRJWXFR?=
 =?utf-8?B?MTJTdXhUR0UrR1hrT1JvMVdYb1BKWWkxVHUrTTZqQXVqbFZ4REtRNEhlMVJi?=
 =?utf-8?B?VFpJd2FDMUlVMExsSG41Tlk4SnhXdVBpMXU1VGExWFFlWlpMMEtRMjQ2UjNn?=
 =?utf-8?B?VmdvbWhZM2wzUHdnMHZXT0UwNGk4VXdGZUZjK2plSTZkQkhJem9VN0UvWWpo?=
 =?utf-8?B?akZzbGwzRTN2ZnBoZzQ4ZjJaR1czUHdraGpwcGg2OVluYng3M1V1NHVNYkt2?=
 =?utf-8?B?ZkdHVmw3bkpubVJVOXZGZkJoelpDc09ERlNEVWw2eXNTWkJBdW4xcWhBV0xY?=
 =?utf-8?B?ZC9wc3lPclVFYmFycDZVTUNBWFVFK3I5dm9RK29UQUZOZi9GOWdJS0d5QVQy?=
 =?utf-8?B?UG8yaUZoNHFvRnpQZllKY0FjVldUNnphZ2JpczJwakREODE2WUlrYkhuTTVQ?=
 =?utf-8?B?UnFLcGJJL0F5NS9DbU9LaVJqTDEzbWtXNDkreWRMbEIvYU8xbEJMeDRaU3d1?=
 =?utf-8?B?VitQbUt3TW1KVUhYaXQrNlNnZm9Ua1YyQklBNTNuTnZSejJubngvbkF4T2lT?=
 =?utf-8?B?QnNrRG9LMlFtT1hnL20rSC9mYlVtaFdZdCtkK0liaGg3K3ZWSlZTS1FteTNF?=
 =?utf-8?B?a01DWGpaR2xuQ2RBN3VsYnhXZ2doeHJCVmR5S0VUMkMxQllBamJtSThSWXVu?=
 =?utf-8?B?N2NpRmJBc2YzcWg3Vi9rb3JReHlManZFL2FSRGd6OC9pODZwTkw5cVIydTds?=
 =?utf-8?B?TFJZK2FwTEN3Wk04TWRBSWJPMjhBZVBWTzVnVFBlYnJlNlUxOGVyTm1tQ1hw?=
 =?utf-8?B?Mi91VEtsTnVJbnFjeHRyR2hPRlZNZDM2aGMvS1puQmd3YXpVeGZpSDllZHFO?=
 =?utf-8?B?UHVaUUVQbEt3V3V1OUIrbllRcDFPVXpoLzRwek05aTdWbVFGTFYrVXpLWEoy?=
 =?utf-8?B?SXQvQkZsMjRyZDMxenExN3I3WTR0UnBXSDBjQ1hFcCs0YjZFTW9lTmFoU05B?=
 =?utf-8?B?bHlqSCs5WVJyblVWQkJEaXZmSFJhbTE5TUhUL2RTUUZDemxCRlhidVVleVFQ?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: edd83ae9-4481-4783-2ef1-08ddce9014ca
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 11:07:17.6996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijRvwLs/htpBPlEM3G04153gP3EXWjbVm8r7GETVei/y67TUNigHbifz0D8n42FeeCHJeq6WfGYIr2wAhjCgBv/b1tYu8C6YIP6nFoK0bA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 11:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221060

Hi Dmitry,

On 7/29/25 1:02 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 29, 2025 at 11:36:27AM +0200, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> According to the introducing commit log[1] and Dmitry's recollection[2],
>> the whole point of mesa-gl recipe is to provide GL library in case there
>> are vendor-provided GLES libraries.
>>
>> Therefore, let's remove EGL and GLES default PACKAGECONFIG as if people
>> really need them, they likely should be using the full mesa target
>> recipe and not mesa-gl.
>>
>> [1] https://git.yoctoproject.org/poky/commit/?id=015cb13a67c672de30f5384dab5ab4b8db305281
>> [2] https://lore.kernel.org/openembedded-core/5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn/
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Please squash this into patch 1, otherwise you are fixing an error that
> you've just introduced.
> 

I've not introduced it, it's been like this for years already, I'm just 
moving things around in patch 1.

I would argue we should have the moving and the egl/gles removal in 
separate commits because it highlights there was an issue with how we 
used to configure it. Patch 1 isn't intended to change anything in terms 
of behavior.

I have an additional question though, should we make PACKAGECONFIG 
"opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 
'', d)}" like we thought it was before patch 1 in patch 6? or is what's 
in patch 6 good enough? We can start with that and people using mesa-gl 
can trim it down further if they want?

What do you think?

Cheers,
Quentin

