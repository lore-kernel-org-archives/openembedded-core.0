Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01642C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:06:25 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.110])
 by mx.groups.io with SMTP id smtpd.web11.20093.1646057182585659707
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=AZJhPIuP;
 spf=pass (domain: prevas.dk, ip: 40.107.4.110,
 mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcUKyzi8/Dti1gIedI+EQXqYNIwN2UyXnG3SILHJsYjJ1hED9N4UCgnXFyjkiLFHJUs8U5PXb2gts+lIDGh4OEWK2PGhfH0MHbnxftT25k/uEVO7uKpto6DhXEEG3t+D3sS9FD0oU0jeecohlTxhNpLjQQ4MI9021bix1NOvIBWgR6+xtfHbZUo18AzTxvYa7UEjjW3BI4txAkMlQYdo6gzn5YGwIVBUBPKFHEdFwp+mT7620U56OnMulpn7PtpaiXENqSYv/pF32wkJdJZdARqcxYalNEr38yIkw6TDwO5T7Zq6U9im6Dc/aviezf737Q3inGHAKoBT/wwYa2LDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zaRePIDBVYcq3xhpetnIof2ZloRawBKOy7LRqzojw8=;
 b=UUHz20tRMwcs533FQ/ma9Kjck3YYNfiiazcBKYbQ0yUO/Bdn+zvDnI86EF+Kzh0z+UYAyZiUTY7ZJzp4KSV5r3jbda7m5KOJynZGuhl89Kle4oWpDdiKn+FuUkxQGcl8f4yVb+VW0TWgPJFNnMIc18XPUWB7LXLuTfmc0LD9ihNKoUh2+I54QNg0eTspA1RInVWO8NOzButcACq36fUBWWNkmNB2YoRlKM1xOkBuNBf6AI2doUNW1Hj3pvyjtac//8pu+gDNwx84mqiyldjotb6EH1/42SRZ9T9EmTWecWuYZaS4vYS+gmZm1KOn5z1BuwUZ0alrvQpxQ+nBLyJY1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zaRePIDBVYcq3xhpetnIof2ZloRawBKOy7LRqzojw8=;
 b=AZJhPIuPGBGhZ1pfGfMZLWTLkJ7QtZMvKz83SfKzXTtY6+O43pKnZevkuhk/Re3Pn5PA+qRTAdrP7vambliOsMapnfswHs2KefVYCu+vrEVBAJgXMmHZ6EJ9sJJkKzPGsLWemUCvvG08+rQREOfZ7gNIKPFoUggABRZ97HYmJps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by AM7PR10MB3811.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:175::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 14:06:18 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5c4a:cdf:c117:7d1a]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5c4a:cdf:c117:7d1a%7]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 14:06:18 +0000
Message-ID: <c60f6d60-ff47-d91a-e97b-6a545c878e71@prevas.dk>
Date: Mon, 28 Feb 2022 15:06:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] bitbake.conf: add BB_NUMBER_THREADS to
 BB_HASHEXCLUDE_COMMON
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220228084250.3874136-1-rasmus.villemoes@prevas.dk>
 <eee2ca92c2a0078b9f767737e20445927f7f2f5d.camel@linuxfoundation.org>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: 
 <eee2ca92c2a0078b9f767737e20445927f7f2f5d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0058.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::28) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb728af2-d729-4824-b283-08d9fac37da1
X-MS-TrafficTypeDiagnostic: AM7PR10MB3811:EE_
X-Microsoft-Antispam-PRVS: 
	<AM7PR10MB3811B4AA31E66BF3A368172C93019@AM7PR10MB3811.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WBg9B3Ey8/MeB1QIskZEPFXRoyuZ87Rc+szDVom7Lo5K7CzkEfYHQaBlz7rmtTRyv6nVlwJ20IjsYo/jaANjiW4tnGsZuBZTtyFMqZ5OtEgGd43Uh+IbMCzzi5dPI+Up9Yk7/djOvqyqnD+PDT+fRbFJS8DdBfIv3WuiFLR/MDeHhLjNX+OOT4wemIuD+vo4YWqBvhhEHhrKNsyAO70GC5mSqMBaov7scG3JRsAf4jdH1OXkbS7xVMU4bMWNMfA/BL44+Z8lHLCLEC5zT0eUDPsfkPbvHiYOCq/HytiJHNPlLknFl27jI5zto8p3x/bOEQgTq7ObGplRCV/8n0IQ0YXe49IqcZ5s/5E7Tp13EWO4begTkLFrvTFGRopmvdfFfHht4DvMHZ2s7NUtbsWIY9VZ1kU9D0n0Ix9EzNUqaTAuf05MjDR0BEObXtdL8SE57ebCc42UJX8lXZrYCQ+Vj8PCoW9pAeebfMHBfABytkSnitlt2uO30UjU1uQwoFroePkEzuFr/J3z7HgxdWRNzgXTp83sQVX1QP6DB60Gu3Ze/7oG7v+Nr0Og7aSJOv3QzeqT958l43Ikq30xAxkpshnPnIriRT3HfIRqgj19qNlo1Mwlu8Z0ZGrt4NdWGx/8KE5a89Sr1IKKQqrz+r3u08bsT0A6IPhdnjHad0HGVeQq+9rNDZk+kyoJK0yDHhFG4nBL4Lsqc34Glpmyx2ArnXny+LwooP6z19jLlSwztsFxg44qS0e+AIVt+gPHRzLdh59+ZLAyn5iycCq5/6OTpltLDOkXjIVMdznFU7cLQk4UXr53RXjUKjksxXUhuJntqU1MCg7U2rWtZ+0lLbLEMIc1K4jWVI/JHYeuYReqLeo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(8976002)(6506007)(8936002)(52116002)(66476007)(66556008)(86362001)(8676002)(6512007)(36756003)(6666004)(31696002)(66946007)(186003)(44832011)(26005)(966005)(6486002)(38350700002)(2906002)(38100700002)(2616005)(316002)(5660300002)(508600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TzM5S3FUczBvM3BpVGhUYmtudVRudjI5VDZIK2hvRUZjbmpPWXE0YklSb0k4?=
 =?utf-8?B?ZG53T2FCR2d6eFRwZGtEWDdSa2xpaTd5am9NRnlUSFJEdGdFT1hUK3V4RFU2?=
 =?utf-8?B?Y1M4cTl0K215NGw5Q3ZsME4rNWVQbDF1TkpBTE9IZENBeEFRcGIwZVlhYytW?=
 =?utf-8?B?UjBSL25qNW0xNGZqc0FSaDd0dFRWdkE0Nmc1Rzc3YWdkdkpyaXptVUs2TWp5?=
 =?utf-8?B?KzRYQjFFaFg3NEVNaGVHU1U1NXdFRW5QeTAvK0tsanlPcFhET1JTN241ZW5p?=
 =?utf-8?B?SFRrY0RyRWZHT1p6WG1MNHlmUWM2UTgxVGlPVVZXYlJTVEZxY1dRMlFPRnJh?=
 =?utf-8?B?cEEvanpnNnorbjJDZytZczd6aDFzQXhzcVFDOE5idmlKRHFwbXdGdTNaWGtV?=
 =?utf-8?B?bmlEdEpCVDdOMG44OTFrVUdDU0t2Vm9ZU3lCQm1TdmFPT3lrc3cyb2ZXY1E4?=
 =?utf-8?B?dit1aHErS0d5TVgvVGZOR25Qc05JYjc5YVBTWFhiYi9kVUdTUnlnZitFVFpr?=
 =?utf-8?B?NEkzd2VSakFacjVpUXcrK0xRY1lFUzBpWWhzVk1KYmppQ2xpVDAwOEMycXdW?=
 =?utf-8?B?VU1idGsweUtOL3hTUHJJZlAxUFhWR0NsMGYzUHJrZGhUd2c5WVRBRjJnTE0w?=
 =?utf-8?B?VmNJNnRqbDUxVjBZQWw3TWkzb05NVlRtY0hlZFhPK1kxaDV4QmpzR0tFYmZ3?=
 =?utf-8?B?MjQ1ZWpzd0pCeEYyM0orWFQ3akdpU2F5REk5ZVdTNHZQeHlIVlVrWE9OMm1n?=
 =?utf-8?B?bGhGbWNtbnNuMkZSZExPUDRwd2EvS0JudU9MVTZwZDRnSno3bDZjWXZEZ2Rk?=
 =?utf-8?B?WVpmWEVSL1JuOVM1R0xXdG40MFBhWHl3dzRLR0gvUlVHOVkvN1FXSFI5NHFu?=
 =?utf-8?B?QVJLZlVsL0VzaklKMWlneEU5Vll6aHpxSS9laXl3dmhkTDBVaUJyQ1lxTjV0?=
 =?utf-8?B?NmcrQVByd1BSUURRVGhUd1ZrUG1XV2lRZWJlZnBCTWFLcEMydE1DQ1R5a1RC?=
 =?utf-8?B?bnM5NDNVV0crZXNMTHNWaVl3eG9SSGgxVmNxYmRnVFgyTDJ3d2ttK2J1Y2J4?=
 =?utf-8?B?WEgzZGl4NGdPVm92OVpaSG9PUXkra0RHd3pveDM1Yy9SRlliejJod2hQSGI3?=
 =?utf-8?B?a3VCWU9FWFFlY2ljY0plbVo1S2llL1A2MGp2K3ZvWWtHVXdjZDIxakptSHJ0?=
 =?utf-8?B?cXd0S0YxOGQrVEliN0lFWVNsM0xVM1RNdUlCdnlONjBCbmNscXNLZDlydTli?=
 =?utf-8?B?alJxaEM0OG5hRVBOU3p0b1FnT3B2czJmSDd6aUtLVElPVUZ5Vkhuc0g1Mndh?=
 =?utf-8?B?aEVncDRPSFhSRE9HclFCSm5pOHR6SjMzN2RDT2QrNWJacEo0cDQxZktEem9V?=
 =?utf-8?B?RmM4ZnBsWHJqWjdpeUV6TEZuaXVuTk12S3JMS1JGNlFjOXZzeGlsOEhROGRk?=
 =?utf-8?B?anFCcHFTUWp5YmhxdTM4Ti9wMCtMREhNWHRGMGwvYld3eHhnVXkvZURFVFRv?=
 =?utf-8?B?RUJnbmFGM21qeTYxU0RyM0xiRndoSHVaUFp3QllKSFFCYmhzVEtyb1NiSWxN?=
 =?utf-8?B?VDgvaVhqQmpkRlZnVzdiR3RROWl6ZklsSTloYXhHM2M1ZmFmaWZPR0FGSXNX?=
 =?utf-8?B?c0M2V044YlVadW9MZTlpWHBFOUJLUnJITXhFUmg4dDhXQ0tpWUlzNkxvekkz?=
 =?utf-8?B?aXZseE5TS2R6OTRuMGY4MGVtdkZ2cWJnYUhNK2FwMm5JVjR0VFhJQUtoK2Vr?=
 =?utf-8?B?UTNXT2VZNkdRZnVCU0lXTU5xTkpObnE4ZmF0WnUxOElET1hMN3M5V2tBSWtm?=
 =?utf-8?B?cnAvOHI2U0pOM3hwQ3kveWVva1UvMy9VZERGWWZEd0NWZ1drdDJhT0tJQk9D?=
 =?utf-8?B?YWduY2V5eXFuT2xCcjUyK1NXMlJucyt4YjBPdUdySlZDOEFjMUxxdVBKVkNU?=
 =?utf-8?B?NzBmeXN4bHE5bUNZRmRHR2JYc0w2M2pIM3JqcTRGNkh1RXIrcjQzN28zZGNL?=
 =?utf-8?B?MUJQd2JhOHBpYTB0RE9FUDJ5UHY5UGNMbEZPa1FNQU4vNktVUFlBWkgvYkxI?=
 =?utf-8?B?bUdGN0Q1cGkydm5tdzRMMC9vWUlTRmJVRTU5NnoyNzNKWlgvUGlPTDJQQ2pw?=
 =?utf-8?B?WE8wZnVPeG1xQy82L0M0aE95Z1Z5Y3BQaVNlRXJaMy9RcnJhNEEvZ2pZRThO?=
 =?utf-8?B?cFJsVmpWNFRGT0hsYW0xU3hNSHBIUnc5V0IwSzRaS1RUSDVMYnlnbTZjNnJu?=
 =?utf-8?B?VlBkQ2pDZlYvTCtxRGRPUENYZUtnPT0=?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb728af2-d729-4824-b283-08d9fac37da1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 14:06:18.7315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZRROBzISrlb0iI0iSNT8YvpSlXoyMWT80L165aTVhE/ZsnsLwgPCG4sYrISViXR8u/5NDC3qgQOGKYbqw4Q5OxuPJ5MnzmawSHiiOnjUYio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3811
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:06:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162498

On 28/02/2022 14.41, Richard Purdie wrote:
> On Mon, 2022-02-28 at 09:42 +0100, Rasmus Villemoes wrote:
>> The imx-gpu-sdk recipe in the meta-imx layer references
>> ${BB_NUMBER_THREADS} in its do_compile function. Changing
>> BB_NUMBER_THREADS between bitbake invocations leads to the well-known
>>
>>   When reparsing ...meta-imx/meta-sdk/recipes-graphics/imx-gpu-sdk/imx-gpu-sdk_5.8.0.bb:do_compile, the basehash value changed from 69be88cf220840ff2203e11cfe65681880b0bf9b88db67d50c1ba772b883bd18 to 5e6d5029fac8d7856ada4c2eca359568298f82cdb64567d7dd4deda503d9f83a. The metadata is not deterministic and this needs to be fixed.
>>
>> And I'm not the first to hit this problem with that recipe:
>> https://community.nxp.com/t5/i-MX-Processors/imx-gpu-sdk-compile-error-IMX8MP-IMX8MM-IMX8MQ/td-p/1217864
>>
>> This happens because BB_NUMBER_THREADS is in BB_HASHCONFIG_IGNORE_VARS,
>> so changing it does not cause the recipe to be reparsed, but it is not
>> included in BB_HASHEXCLUDE_COMMON and thus
>> BB_BASEHASH_IGNORE_VARS. This is inconsistent with and in contrast to
>> both PARALLEL_MAKE and OMP_NUM_THREADS, the latter of which even has
>> ${BB_NUMBER_THREADS} as default value.
> 
> Technically imx-gpu-sdk is incorrect. BB_NUMBER_THREADS is the number of tasks
> bitbake should run. PARALLEL_MAKE is what is used for parallelism in do_compile.
> 
> I appreciate that has -j in but you can use: ${@oe.utils.parallel_make(d)} to
> obtain the value that recipe needs.

Oh, I'm not saying that that recipe isn't buggy, but is still seems
awfully user-unfriendly and inconsistent to treat BB_NUMBER_THREADS
different from PARALLEL_MAKE wrt. hash computations.

But now I've raised the issue, and I don't care much what happens next;
I now know the root cause of the error I saw and rarely build using
meta-imx in the first place.

Rasmus

