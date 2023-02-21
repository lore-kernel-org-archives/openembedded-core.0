Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEBCC6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:32:56 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.75])
 by mx.groups.io with SMTP id smtpd.web11.39459.1676975574398146581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 02:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=BKJs60ua;
 spf=pass (domain: vaisala.com, ip: 40.107.14.75, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKHytMc9ucVee+cQ3oVGfLYBtPIEHa4/d8XmvDXyGVrOytrpyWP7wrVFRL9OJ2mGkRTTCs/3puD9KxsR3YvSpBtSkq71KdxLyj1C/irzN1vgNyRsadw0G6vDpMnnJ1FHg8JYY4x6mnT1xmYiXrnBJB9nkAXniyVYYSrgqWQpGFsRirQ3RZf1hP0sQ/qQAQbnPis998MToWhCqa0qTNApSyGYIABP0v4gOCpvKaMcrJp3OsUGJEB8AJurewhuFXXO4EltkOxYm8ilwx6MtL9VqNJGrGl5Ub8jJwaXNbKJ5+o5EBKnWLV8PY5IIA0qvXP4I5K+YXvXzjRdGcCqVoQAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRZNxqWfeaLObKFi1Q7tl6U1bUKmkXpGKs4fS8duM30=;
 b=ogdGB0XsucyRk7smifjrGKg2NA8aSy0uncQh8o6YonM5Wf+b3JLoQQZhOV2ss2frd9jGSYLGTOLBVxgyDeu1uWnsGkREinhY/8uXfz1UFUrZZ4Vo83iUh0xy6MXK+WEwQhAJ7W7nqvzDK6mos6AbvHqer2tirodk8BLlDkTQTWejJtwSMZP8e1d6Xd77bULvqdl1PLD+Ncq3Xe2coUunuB4cLIm4tP7o1MzoQGnfkB+1m10jLt/5B8zcG57YYADJ7v9KAt3cHtqrhuYQqd2EUWEB6+dS4q8wkZ0lxJYWry32iwGG1uyzvrr6d8QrAWTt55eMkVm2cNEEr3u840bhlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRZNxqWfeaLObKFi1Q7tl6U1bUKmkXpGKs4fS8duM30=;
 b=BKJs60ua1e9WannBC1DzPukXSvqCPbFP1Sc0LBizkC/zSN5y8cfR+qdPNJzh+C18G2+KDu0+i/u0banqE0E3IU60h0MlpDDi2f0E4vPotipjqB8vC+frPCtfYvPW8SVYUgLFeCZ0zfpC76Gt4ZY7HGEgAY+GMmjz9WtsLKyYshCHwxjRELZ7MG1hV/o9tZ/bwiYnvzXsrCODqynrTK/cxP3Qx7aWC5fPxxCe3OiCXx3Pc+tT2ItBdSZCWFweLnmIo2F/zWZ3miOep7S5M3ZjVxn7pLbR7ZbAaUAdVJx8/GYLK/regQj277YagmbmUcx7GQHqDda4zFLn9D6oHiIO2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by DB9PR06MB7196.eurprd06.prod.outlook.com (2603:10a6:10:217::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 10:32:51 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049%6]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 10:32:51 +0000
Message-ID: <c79a36ea-aada-ddef-be2c-e981782901a3@vaisala.com>
Date: Tue, 21 Feb 2023 12:32:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [OE-core] [PATCH] ref-manual: Fix invalid feature name
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 quentin.schulz@theobroma-systems.com,
 openembedded-core@lists.openembedded.org
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <20230219143133.66511-1-niko.mauno@vaisala.com>
 <8b58d703-93d4-11f8-4d0e-d6b922e995d4@theobroma-systems.com>
 <14a72505-0e05-6b81-ce33-580cf986c898@bootlin.com>
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <14a72505-0e05-6b81-ce33-580cf986c898@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0060.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::30) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|DB9PR06MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d393742-a825-43e9-621a-08db13f6fbce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fHXtsuEMW4uE0qYvYMk5RG6uGnFt5mhr7njJSGYasf/TEgdcv/boFBUEDn6Ke5w875zVDAMichw0j2UgPLjHf0PbMIbHZ9k1h81VjeSLCgxSlsjUk1e5HT1/1YlbyoAKWCdmBeFumzD/wjwJ1BT6LeD2AoqAFyhqd99jtevLOxj4P6u+pgkVzvHd48fnPPq6EuhBQCVdv43VNQmBfsjYNGoV04KlMH8Q8RDGsh6DMpAnTbMfiwOdu2dUqzX6X9UTOGF1hd3Sh1OkzRsdeabMcVZDghCr/ioNXHRq2QmDdJnsa9x+FQvuaEb8LorRGgEkmDzIaIss7h0F0KdR6jlAiJnfvjvg+zqj8jXihiFwgwwYRuQ2tPH1jVc77rngP4X4aQNMqH/I5ZXns3r+AyRiDcYf4VIrNUBPCCTzPOvp2zHWJVhZT+DaYEBCT5zDGnk/AyEfFwpH08u9bYAvkJW2jE8AbR8E8ZdWGf+hxdcf5FACB+/lNpOXvQGuWnNmuqq+B1YPrpVTyV3jyedEV1XEdDbJp+ZKw0GlAAiSUihsEiihKJ9UX/xqpAFfE1bV8DzZFf8J0rhD18ypvGvKoy0yxIZS4PTfwa/hGcFJYoax/31U0I+26TrJuckBDAHFx6KGPZbWXb6KqJU04VT2YyoY24shxMH3XPT/LRVkEY+wpy8i6eGxZExteJtfvKehi2P0EkNFDzSyVbD8NXbzqvHMBaQGEDCa90TWkvzQ24etrHI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199018)(38100700002)(41300700001)(6666004)(4326008)(66946007)(66556008)(8936002)(6506007)(8676002)(66476007)(6486002)(478600001)(966005)(86362001)(31696002)(36756003)(2906002)(316002)(4744005)(6512007)(26005)(5660300002)(186003)(44832011)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGpxTldzTEdCR1dWR0dHSytaRllsc0xJUnNlUDRLNmV5aGVibUt2aHVJeUlm?=
 =?utf-8?B?elVWN1JkdmJYR28rNVZydG9JbVIyQzM0eitzS2gyMGZXaDc4SkR2c0hTTE52?=
 =?utf-8?B?UVlvc3kzbysrVlJvWkh4cHNDOVpIdENrVGhYc0pFdjhIQ1pKL3d1alZjREV1?=
 =?utf-8?B?eDdyVUxJcUNKMGd2NzU2YlN3cmtUWkNFQmsyRllKOGk5ZE8weWRsd2ZaSlgx?=
 =?utf-8?B?R291WldjcURpelNCSUZHSHhzekExVTJMZ2psa1E2WC96Mlo1OHZHU0pBU21T?=
 =?utf-8?B?Qk96UXVlYlU5NDZNVGR6RWg0NlNkWWh1QzVmTjJFUE91NS9zVU94d0hXa0NK?=
 =?utf-8?B?UXMzZmorN1IvRUFWNEdBakJLUjM4dkFiZHVYd0UvMDRRWDJ1N0x6NjVNWWxm?=
 =?utf-8?B?U1dsQnEvVk1DZ3piMjVUMDN1cWFFVUU5VEZGeW9SdUZiNzBENzRCS3BGTjZo?=
 =?utf-8?B?TERMMVZKWjdvVHROMEQ5L0NpQUgyMmZnczFIZHBYWDR3b1h5czNqOXlLRjVV?=
 =?utf-8?B?TEMyVUFYbkxYa29rNGVGalUrcWNpQ1V2ZnhjRGY1RjVpUjZ2c3hOenlnSUxZ?=
 =?utf-8?B?QUVVUmVabXhneE84WjVMN25hZEUzL1Rrd2JKOEdQbXZaWFBsQjBLcTd4R010?=
 =?utf-8?B?V2JYRmZyZ0sxOWZCamE0WWJpZTNvTmYyR2Q3ZG9ZMnBKbFgrOWs0a1Z2NDMr?=
 =?utf-8?B?djRzb2pSc3VyUnhlWHVYbk9Uc3hnQ2V5MWd4WkowT2FRTWNTOE5yclVjSktx?=
 =?utf-8?B?cTA0VkM4eEJnVGJYbytmV2FUbmlvdXc3bTlDWU5qWjZLMTRKUDlFSFNSak9G?=
 =?utf-8?B?ODM2WVJrMnJ5Q1lyb1g1dkFVdDVmRk1OLzB2aUpYS3YzbE9YeVFuT2g0NzQ2?=
 =?utf-8?B?eHpubnJvOVFyNEhSRVBkdXE3WktwZWJJa09OeHpZTzBMMXhqYzhyak52OTY3?=
 =?utf-8?B?UE9oVkU5Q0F0VXhqbXpMaFA2Q0NPbXBvZUs2b3YzbG1NQ0RJb0tkQ1RJallG?=
 =?utf-8?B?bTE1SE9lZUVrNURpYzlVYVVXVWFxSGpVZDBIdjNtREREOUZiSFd6QkJEdnRO?=
 =?utf-8?B?ekw3Vm1iYkMyT0NOczBVaHRWVmpPak1pb1JMMFVnKzF1Ym1acVN4K0ppNzlD?=
 =?utf-8?B?M2RPM3RoMkZGZ1BXSE9rcjVUTVpjM1F5R0RFbU1sQWVrRGRxWjVCUm5Pa1dF?=
 =?utf-8?B?emVjV2J5NFFOQXJkc0NVT0V2UUErcHp4d1F1ZTVJaTJFM2FQTllDUzBmbTNu?=
 =?utf-8?B?NjNHRUdYRGRHeTFQYlo4NlNzSDlLS045dWZHYzFwTVlSczRQQkYvOVBxQzVx?=
 =?utf-8?B?SDRPdk0rbE9sQ2hCalR2c2IySDh2Uk1zd20zbG1HTnUrUmFjcXFCUlViSGxQ?=
 =?utf-8?B?MkJwNzVOMW4xNjhjN3ZFYndJMm1ZbG5KOEVYRm5uY2dvNFN2M1RXbkFjOVJ2?=
 =?utf-8?B?Ly9idVFycHUwMTdxSXFPTlVOM1gwMWRDNjdSYkN1RW9UQkxKb1VQZmNFTmo5?=
 =?utf-8?B?bWNMUDhLdVE5VFhNenhSWVFxcmNZOE15NzA2T3F2RzlMd0xaUzQyMmJuTE5Q?=
 =?utf-8?B?cHhEOXhGRlJkMUgyV29zdnJTRG02aTZyT0JvYzlXQkFRN2ZBaHgrckdIZ0RP?=
 =?utf-8?B?MW50SDBod3JpSkZOQjY5cEZDU0s2MzNQS2Z6MysvcU5zeVhKOVk4bkxxNEZa?=
 =?utf-8?B?M3BrSVVmRXlvdE9UNWpkUnZjdEFXUzJPNUxmL2Y2eTNpWmZsaFQvaXpFZFBo?=
 =?utf-8?B?RGY2NkdjRHVyVWYrelY5VENUMTlkMDUwaFZXZEgzZms4bmhnNWhReENobHpa?=
 =?utf-8?B?QTNWVUNoS0xGNFo5a2gwcTBVQmovZW90Y2ZLVUdCeE80N09OQlBJQkN1enJM?=
 =?utf-8?B?TG9SdzJjNC9EWWs3TjBlb2ZjWWdiamd2cUc2RFBRRklaaWszTDEvclRRVkVR?=
 =?utf-8?B?NjRqaVUrSzB5eWc5RWd5dWE0ZTNkQ1RpVFp1QnlTTTczOUtnRExzVThXcVJo?=
 =?utf-8?B?alkxZkVPeGV3cUE1UmR2bUlRZU55Y0NKRitXQWVXc2RKeHhueXBaK2sxS0dx?=
 =?utf-8?B?Rk10eCs0d2ZXV21DY2ZmbXVVMkFhN3hITlpNaFk1Z0JXYXh1WEhhaUtHTjFN?=
 =?utf-8?B?eTQ4U0NqTjJPNEE4VGRYdEZ0WW9NUWNBaUgzVGRNcFFhMUxOSzFaZEVKRHNl?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d393742-a825-43e9-621a-08db13f6fbce
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 10:32:51.3202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHhF/pJSNjksobwwREfUO8B30hm/TP365GrxhmrOGcven597YuRhsnjDgZ7U9DwSi68FplT3AriwR/8GF6d8Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7196
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177491

On 20.2.2023 19.45, Michael Opdenacker wrote:
> 
> Thanks for the patch!
> You also have an issue with the way your e-mails are received here. Here 
> is a workaround:
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity
> 
> I fixed the commit manually, but doing this will help for next time.

Thanks for pointing the issue Michael, I've now applied the mitigation.
BR, Niko

