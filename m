Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C32C41513
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:33:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.130])
 by mx.groups.io with SMTP id smtpd.web11.17022.1716471186244832549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 06:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=jHBBmYhD;
 spf=pass (domain: cherry.de, ip: 40.107.20.130, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVfyYWdHiW172OdR1dOy3WXh4TJ0MPGSLSuqu8KqWdUiUul5CC1nDtSFXTZjqviIjAg5pMCImyUfklqgBQbRjKqPU4uxT9fPLiIT+7zhv5kM1+QvlZV9gY+1YR/7JnkT3JQdrv4S5dpbGlj3+AzVng/peE2IM9ol3coVe297hcS30EE6m2if68rXrgJPyAiN71hZHmtZSGDWVWb2qHxif/NSjEtBkjpJWubGuqnI3xNhBkk664JnVpueT6sq8wO/i3ulNuVwUSkrYOEEUzlh8Z55R9UJh8JB5EyByCya5z0RdYcuOyjina0IHrKM2JJOLKoCFLcoxJf2V/R7CRIenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rszf7UDDsm8QfSE744I6qxQEgeQpO9glLYYGquw0Ntg=;
 b=BtopBmmUBn/r8lSrW9tVJn6oZ21mHlgVRRov5wCRXZwyziBG5zZQ0kKlMTgeP8gga/5FsyOxy4HEPdo93qngxAhNUUBPPyVvvpKsrSLF1dEJTQJjpAAED9hF8Qx7EaqryCyLoprMYU1/GsIpB9DQk4Wt/sdxAyvh0d4cvq6iebQr/ftvbwwWey1arrdD3pydnhiKcGNYHXfVWDrgvc2ktOqM81Foc0GL+N/VY1Zx+A7pXAZdszyrqPcOhPW6qjuCUs5ChJ+Na8+DuGw+0qZBGYwned5FPdrJmEQ1Z4igYz3sXpxMp+rkcwpE49ANlS/6eRm2cmrCI5SDXJ2XfsTKHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rszf7UDDsm8QfSE744I6qxQEgeQpO9glLYYGquw0Ntg=;
 b=jHBBmYhDv8UW+KA7ftilbc9ys8gMGajDVNQFCiAYwoTz/211ijrwOaspKpcOL1SLaAgw/tWVUoB9mrY1cBZJXRNRWwouhYpXWO6wjmDMNuwbvEP28oU0j83bZ0szaPmUmOhJotIhbSAWTtPICHCAAMvyDw0FAad7jk1zWBGDmd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com (2603:10a6:208:16e::11)
 by DUZPR04MB10037.eurprd04.prod.outlook.com (2603:10a6:10:4d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 13:33:02 +0000
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd]) by AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd%3]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 13:33:02 +0000
Message-ID: <76a18407-d650-47a2-b8c8-f639350c3630@cherry.de>
Date: Thu, 23 May 2024 15:33:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] ref-manual: classes: add new
 image-bootfiles class
To: marcus.folkesson@gmail.com, openembedded-core@lists.openembedded.org,
 docs@lists.yoctoproject.org
References: <20240521173343.2954628-1-marcus.folkesson@gmail.com>
 <20240521173343.2954628-2-marcus.folkesson@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240521173343.2954628-2-marcus.folkesson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To AM0PR04MB6578.eurprd04.prod.outlook.com
 (2603:10a6:208:16e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6578:EE_|DUZPR04MB10037:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f835abe-ebf0-48f1-7669-08dc7b2cdebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Mkp6N09Yb2RGODlFUlJCUUUrYVg2UDVWQnRDdlFTTWROZjBNd1U4L2hibkYw?=
 =?utf-8?B?SzlocXlEdVlMbHRvRVlud2VwWW1XckxHTE1uVzBBaEtRZHhtdDZYcmVXb3ZN?=
 =?utf-8?B?c2tjN0xpZXhnSVVQRFRQVE82RUozMDdVOGpMTmNPclBuaXpPK1Z3Q3JTY0JJ?=
 =?utf-8?B?ZVlJalN1RWJ4RzJSQnpkUTVDaytzTlBmVWVkR29Yb3BmaERwK3J1WFpJcTJR?=
 =?utf-8?B?bjZoai9YQVNuYW55OWVDYkFubVJXanRja1RzcHVHdzBCTWJwbXdtc2lmeDBK?=
 =?utf-8?B?TmJmVEVZZWFMWGpVY2E3ckp3YjdZQXpWbXBkQnZYOVJoaWdsZVh5akNxS2xU?=
 =?utf-8?B?Z0pOblBRQUtOTTAwY2RrTzI4Yk9yTisxR3hEU0IyZW8vQllVMW14WE8xamRJ?=
 =?utf-8?B?MitxelVueWlYUzVMZE1wY05GYkZZa0ZJNEgzNDFzQ2gvbmFPS1ZuYVhkNTdY?=
 =?utf-8?B?K1Axcm5hczVvOCtqT1J1a2ZsbFFuNGZ6QXZ6ZUxhV09kMDE2MUgreURabTEw?=
 =?utf-8?B?eEk4K3JKeXR6R3plaldkRFZYdjlQZWwwK1VBQUdEaklTSkptUHVkV0hJN0NE?=
 =?utf-8?B?U3YrQmtGSDZnU1J0dVNxTGdTVXhLZGx5WnJMM29lOUxpL1hRRGJoZmJLT1Rk?=
 =?utf-8?B?Z2U3YWlsdFJ1U1hNcDhFcms5dkJrMDVvZlJMamg2bDVCQnQxNjJXVFVZNmdj?=
 =?utf-8?B?SUxHZVZTZTRxblV2aGtmTVUwRmFnMGFweCt0UUJGY3lVZU9NR2p3cVhSd3Qr?=
 =?utf-8?B?eHZtQWhyVTFLTWVacTU0V0NnVzc2dlRPOG1icVdKOVgvS21zZUdtcDdFVDc0?=
 =?utf-8?B?YVRWUWtwMnoyUUFGVXpPZjdiMXlHVkhnS1Z3cmUzWUJEdWxtdzE5QXJzSzdk?=
 =?utf-8?B?TjdQMjlpZmt6TGZaQWdvVzFnSHF6WStTWlJQWGpkVDNkQ1NEa0ZjcXlGQ3du?=
 =?utf-8?B?dklma0RweDNRSkVyZHd5M3ZPNDRBQ3ZNUnFaSWFXbkhHNDVoZS8rQ0U0UVRL?=
 =?utf-8?B?SDB2WExMMGVVYzlLSGtQdnFDVjZQZ3J2ZW5pbU9hTjVOak9wNE1BM09WQkNo?=
 =?utf-8?B?Wlp1NGFmTUY4QkxyajVTcHNPLzBsamxUQlhqQlUzaVNxNmV2SFdOUjE1bGdr?=
 =?utf-8?B?czAvR2tFZWh5VG8vUmtsUElFbjZZODlHL1F1NFdHVDh4cUZ2SHlQeWxFQ0hX?=
 =?utf-8?B?d1JlNm5xMWFCU2t2bk5MbVpKZ1RvTUJFSThsUEFMWXVHZU9RWlZEZG94ZVZ1?=
 =?utf-8?B?N2RMaFFIQithUkNZRXI1TTBXUXBaUUpBQUVwR0k5MElGV0IwSUlQWEZBaHF5?=
 =?utf-8?B?V0pkUVpyK3B0NnAzMUFzdzRUK210MEd0MUV5dENXT2p3akNIR04xZVYrQ0pw?=
 =?utf-8?B?YThBaGRraVhHeloxcHJlcEJYakg0bTcrYVVzQW1JM0NUT2QxdXd0V1RicGJV?=
 =?utf-8?B?eFhYaTVyNkpnZlUzcFhVMTF2V0p3MkpTSzZKdjBlODRoNERnL2g2NmVJdFMy?=
 =?utf-8?B?Wnp6c1RsNnBudEJQenZ2VWRGWEZGaDk0WkN4QTF6bzVuaGtuRFN6eHNzK1NB?=
 =?utf-8?B?c25pWlBhL1ZEcXV5ZENOUXd6VjdDQzN6L2Q3NUI5SHZVd3J1bEFpMnh6NEpa?=
 =?utf-8?B?MUpPdUVlUlk0ZzNOdS8ra0J0YlYvaEdwQ2x1RDVienBYdnN2c0tEZkdVMTZj?=
 =?utf-8?B?dWNvaHMzZ0twZE10VXdNL3FxOHpFU3NPcThqMHJ1YU1CdlZ6OHQyOEt3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6578.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SXJ4YVJRajNGNFRGQ2hIamM2SU5QSUZrOTRCM0Y5WHJmaVBKY0JkbGtrQUYx?=
 =?utf-8?B?WEFockJrRXVPK09jaUpNV3RFR2IyY2R6dlZDWGtVVUdLRnJEdFRhQUNvenpF?=
 =?utf-8?B?Rm9DQm5YdGxmNldZNkJUVzIzcXh4eEFqNzcyb1FVSk5xeFczeU9oSzVuWGo4?=
 =?utf-8?B?NjIyYmR2OU5MRmpnTGFhNmh6ZUt3OTVvVTBQWFcyUHNJSU9EWlBid3o4bm14?=
 =?utf-8?B?NUdNZzhidU55QVBwamlrVkZhU0hZUkJWMVl0Wm9IOXM2YzE1QTFwcHhBRWNo?=
 =?utf-8?B?TnYrajVERE9HeEFlYzMvcFliOFIzMHFoRWxVR0lEY0NWM2cxZ1lhSHBUVUNh?=
 =?utf-8?B?QjNOVDUyZmRBd1RxSzYvcnVON3JuMExUODBFVlN3aTRLZkZ5OGRGaEd0NU04?=
 =?utf-8?B?VHY2eVcrbEJQeDNEWVB0eDB4YUZ2b0o1TlE4WDNvQkJwMHBVWStoZ05iZFVy?=
 =?utf-8?B?Um13aktrTWpsZWRrZkpiazgxcHB0OVNBb05pTGxEYllZZ1BqUU4zRks3RmZD?=
 =?utf-8?B?YTcySVBBWWhqWUgvTldBQTYyVHN2WXlQdlN6WHpUQXpJbVc2ZTF1K1pOOFNn?=
 =?utf-8?B?NUFuaVpkeEVFdkJpak5abUMyZFNVbG8zelBJa1AvZDJjTVRuVjdtL3FPdE00?=
 =?utf-8?B?OHVDMERkekx6YXh1eXVvclFvcCtQYzZhSFNMMkpGSkRjVXlWeDdsaWlIV3NK?=
 =?utf-8?B?dTlrNjMrb0tnUEFJUHJabC80YnhFZ3FlV21oYUhMSVJ0YSt5d0kxeTA3S0JN?=
 =?utf-8?B?MkRPV29wRnpUeXZQTGJuVEFBa2tZcGMyWGNmSjRjK1V6a0Y5SlhnSzBaUk55?=
 =?utf-8?B?c3F2amQrMUJNZ1A4SGpaUUo2RHlKWktYVVczUnNXMGJPUWRnMjFXTWdwS0ZF?=
 =?utf-8?B?RUxOcTI1YUR2Yzl0aHlUV2QxSUhSMm5TNExFOUdSeS9PQmE4emVHeVQ5dWdw?=
 =?utf-8?B?S3VEWTlId28xUTBOZW12cmlOQmJlYldHcHRpR0t0TTVtSEJ6bkVBa0xDRW1E?=
 =?utf-8?B?bEpYRjBJcWZDN3pqZTZjOVVBZWFKN0puQngrMnBqTDh2T2ZDbElnOE9seS93?=
 =?utf-8?B?U2luVTl5bFVZem81ekZFOWlzVDdtZWtJVmJhbnB2SmdFVUh5SThTUFYvS3BL?=
 =?utf-8?B?cnY0OTBwMDR3QkRjWVQreXBXQjhFelRXYURSRFhTNXM0dEdhdFRzTDVsYXpB?=
 =?utf-8?B?SFJ1QjlXdXZ3eHRSaDZqUVkreXNiczVjcjVSWHdxV0dLM1ArWHhsMklOVFVT?=
 =?utf-8?B?d0VvSEFVL2JmTjFVSktPS2ZZd0t4TEhWQUVwbGxnUlR0dWpUalo3STl3UGVM?=
 =?utf-8?B?QzFYTVZBN3VhWUs4YjNrcWRpOFRVTWJtaWk4SDRpbjU0em8wclEreDRQVjdK?=
 =?utf-8?B?a1hyVWMvUFJBLys4SWlOWFpoYTdUbHJRVU40UVVDS1R0NlB6Y1NyeHF1NkRD?=
 =?utf-8?B?bWVyTlNxUkZWc2xCWDhMNVljeXdTYkY1Tnhic1B3bTVtOVB5TXYxak5vQk84?=
 =?utf-8?B?d3c1V2wvVUt4cjJ5WThoVEhtZWdtQmNEWktobzJMUFp1YWxuOGpkdVFFWkJ3?=
 =?utf-8?B?ajkxN3FMRE80N20wRUIyZ05sYVdnekZxOC8zbngyNHlYL29oMmQwY2JJdWht?=
 =?utf-8?B?YnN2SlExZStEaXVLK1ptc1dwbjZLT0ZMTUJZQkhRTVBCY2d4VWNVbzd4eDhX?=
 =?utf-8?B?S1ozOXlxR2pNemFzcTZGa0pxMEk2d2xqSTNodlBQWXJLMGJTalh1dG92QWw1?=
 =?utf-8?B?Rk9IVUV1RTloNUcweXBYQXR3L0Z6dkpadWJLaW1Bd3BZellmRjlWN2FvT3oy?=
 =?utf-8?B?VmovdE5JdkRVam15NmVJajNXdE9YM0FjZVNrV3lNZmtaMzJsMFN2eTFMT1l6?=
 =?utf-8?B?QlNXUzBaUEk0NGczdi84Mkw5SHFrcVlsazg4a2xlS2Zzdno1WnVhOHJjYmsw?=
 =?utf-8?B?b29oUG4wZWdBNTl3NDl1UHF4d1FRdUg1MENOWit2R0dxdGt1VTI4S2d6T0tQ?=
 =?utf-8?B?czNGNVZPRW8xSmI2dXhSbG1mSWwvTGlyM0hnY2NOTGdlb09YU0JGUlRqTUp6?=
 =?utf-8?B?VjBlbzFmRk9MblVZVVAwbjhOWEYvY2d6SkZYK1h6VnNMMnRoQ2U5Sno2eTZs?=
 =?utf-8?B?ZDB0RTdDa3ZrYVVqK3E5cFBtTTFZRnJENE5STTNFSWNaNlNwczk5NHRuL3pB?=
 =?utf-8?Q?/01orK7Aj9c+/ZNJGbp5ttM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f835abe-ebf0-48f1-7669-08dc7b2cdebb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6578.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 13:33:02.8434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ky23GEbsj89tWwC6sFbZBp728Xd6upMG3LpE4NQs+8eivrcXvHq8ny3zZ4bkJmcRajTXyrK+amto7vEzy3rlLJJaceL1ot4cCv1NAsPEMis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 13:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199794

Hi Markus,

On 5/21/24 7:33 PM, Marcus Folkesson via lists.openembedded.org wrote:
> [You don't often get email from marcus.folkesson=gmail.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Describe the newly introduced image-bootfiles class.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   documentation/ref-manual/classes.rst | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 9520d0bf7c..53b3697bee 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1169,6 +1169,20 @@ Yocto Project Overview and Concepts Manual.
> 
>   .. _ref-classes-image-buildinfo:
> 

This isn't the appropriate name for the reflink, we should ave

.. _ref-classes-image-bootfiles:

instead, to match the actual name of the class.

> +``image-bootfiles``
> +===================
> +
> +The :ref:`ref-classes-image-buildinfo` class copies over files listed

That's not the appropriate name, it should be 
ref-classes-image-bootfiles (it currently renders properly because the 
reflink is incorrect).

> +in :ref:`IMAGE_BOOT_FILES` to the /boot directory of the root filesystem.
> +

Tick quote /boot:
`/boot`
it;'s not meant to be understood as an English word.

> +This can be useful if no separate boot partition is used but all boot files

Replace "all" with "some", it depends on the content of 
IMAGE_BOOT_FILES, so we cannot say "all" here, it is misleading.

> +should be included into the rootfs image.
> +
> +:ref:`IMAGE_BOOT_FILES` is the same space-separated list of files used
> +by the ``bootimg-partition`` source plugin to populate the boot partition.
> +

I would not mention this here, rather edit the variables glossary entry 
for IMAGE_BOOT_FILES to mention that this is also used by image-bootfiles.
Also, it seems bootimg-efi plugin uses it, according to the glossary entry.

> +.. _ref-classes-image_types:

This isn't the appropriate name for the reflink, we should have

.. _ref-classes-image-buildinfo:

instead.

Cheers,
Quentin

