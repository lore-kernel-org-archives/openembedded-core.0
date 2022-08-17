Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15473C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 09:10:44 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.109])
 by mx.groups.io with SMTP id smtpd.web10.26468.1660727433949884803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 02:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mysnt.onmicrosoft.com
 header.s=selector2-mysnt-onmicrosoft-com header.b=F4Kitm9b;
 spf=pass (domain: kontron.de, ip: 40.107.15.109,
 mailfrom: frieder.schrempf@kontron.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlzJ3dKgVMf5yyM+Z2BfZb99Ju5cKp2JwREr1QVy32W0zBwOECvz9ej51KP5xVkg+WGa4cLvNC2TEeIrjtR9JO8vz7826/vWa9X5QpqJLyBEbzbrJE3TqWTR6v8rqd5OPAtNHrC4X1fFJo4nlVTnT0B7BYCugEcwmM+YMS+g+Ux58if+RmRNexhs+scZr/iwQhwDjm5mV7MlWbvb/pGVdeNcDYHDT0agOA9SNsilH5I1vjrnuiW5pr2M7lwS77oRjkgJUM9LXXdfFaFE1h6UVBVKeEfUCnZHq3+A5nTi6pkEBFmMuvmBe86l/bKXPtI09PjbnmulTm0wsgTdi9+4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y619AEMum+LKRmR+6xeJjF4GmdvAAOhwDCx832k0ss0=;
 b=ceob6Yd/ryYSI6bjhD9DilfiXIvi5+YxOD+uIC4NH0tf0eGNTQQR6ZzQevVlT1yK5ZztnV5VUH5sADzMKs6fcUMTeS4BeO8D3ayV602SvrZ0PKNpWTb1xBZVle4b6OReekveXpDNXv/1KFdJkz6zzL2NNYxBOHBKJYvYGg2/FFoPhBsAFQFihZAOETYZSXK5Qrs2Gl93Rzj1ntIkXKeO0AhwGCTu7nSpLvQxrrPY/fokyt5Sr+UKFtuGRxvbXTkjKAK7Z3/C0wMGlZ+1Y6VWevoHmNJi0GN8PmemZw1Y+jlQ06o1mbtSAUErZ+8CuLYLTAtXvmnKTZnxwTt8MeXwgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y619AEMum+LKRmR+6xeJjF4GmdvAAOhwDCx832k0ss0=;
 b=F4Kitm9bAmXv1oNY6cY9QUQK4HvJB0p53ZiB0aNj0FZjdEkwWTPEEMBi3UhmK5WC1tbeK7/pplOD/2n9JAEgrGog4IBx36szm/DdskyJUo2Bl+JTT7fe2BJgK3PqVlNd3uopI2xNJ1EOEfGMoZRpMmCPu4S/vIIehYyL+ac9IfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM9PR10MB4023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 09:10:31 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e8c2:f87d:c1c9:c637]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e8c2:f87d:c1c9:c637%4]) with mapi id 15.20.5525.019; Wed, 17 Aug 2022
 09:10:31 +0000
Message-ID: <c09410c6-2b55-497d-97b2-e05484f9a4a4@kontron.de>
Date: Wed, 17 Aug 2022 11:10:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [OE-core] [PATCH] siteinfo/autotools: Ensure task checksums
 reflect site files
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <20210921121537.1611646-1-richard.purdie@linuxfoundation.org>
Cc: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20210921121537.1611646-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::19) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e254e0d-6483-4c15-5b5f-08da8030559e
X-MS-TrafficTypeDiagnostic: AM9PR10MB4023:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+bibZLRR2CkNRXqyD4JHUZSI13CCMH/2+0eWHlfdR76U0Z3otbPJKlo2+Zj2N8z2ZiM5xPitmnglFaIGH5sK7hV462g3s0066KCR+FubvvzLQ4wvVQ6FN/K9cTyslc2Rh8aCNvNIKgp17QewBydzzhCmlzU3FATuP6wcXO7L31ywNvSDADYnEFYeyx58P9KA3Ih/RsZ30gkbKj+rbuzZj/LSHwLsA2IKdsYEZ8ZOCrqDsiduC6jxqolEV3x0L6NHyYtm1+0yKQA1deyNbVlHD02dGo51xapnKGDYJCbZKcHvkCfzX321tTByXCaRHJBO8MjyLgxsKPL7kTbsoVXARsdhXJ6hw1nzLl1uhjtAVZFuXwboPuxIlDPCBAAvvKdGg2ZDjMJjRJ9l/NqCF58Rgt3Mzn5ORwWkrA0lGt6pmucmlqmkuf9kVFZl6GkZEKq3/NQencLInZgZMK3pgw/XCONIucHMVxH4T1wxiB0BDFfAXf/mWWxqrZ1VOubIKI1qV/b6h+yvKtpZhXuPy6ep9xzkA0sIjnr5Ssi36M7pzKXu8S+W24edekceP6yTsK9wekKduV3tmrBw8Q6O7Axa1S1CSlEWkDnXz1b6PpK1qCdS2s+3WXXeL+4TbTd2oD0+JBUryGKPIoDF2zuT7alR7gW7n5pkcvHMet5/tXfCs2CxIw3qS72eGa7XtyvfnArUyRQtJBotcTXHe9H5R1yj4TbIQtQzUHIoBjsFewZp01OliXruqaPqC9ZO328xg0ECyT+9SLc5cvc/O400aV5HDGaGzjfLOCRefUv/FuDKlETqng8YkSJaGrKUPUsGUUc41SZQsx6CXqTMnlIxMMbDWg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(66556008)(36756003)(66476007)(44832011)(5660300002)(31686004)(66946007)(6916009)(316002)(6506007)(31696002)(86362001)(83380400001)(8676002)(478600001)(4326008)(6512007)(38100700002)(2906002)(8936002)(6486002)(186003)(2616005)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aUJDeDJwNWl6aCsrMC96bC8zQjZQQmlic0t6U2g2Mm81SjZkNVhzKzJxUG5a?=
 =?utf-8?B?YzAxWGxGOTJEdHZ1Y000NEdvMHVvTXA1VlE5L0ovQU5ZRHFnOXY4NDRtc2pz?=
 =?utf-8?B?ZE4xMHJvWUpoSU9VUTI2bWNudENVdjJnK3pZRUw2QVErQjl5RFZadk9id0xI?=
 =?utf-8?B?eWd2cy9pYU4yK0dXWVc0ejQ2YjE4L3RFd0hMOFRxVnlieUYwNGNtN3NxWnVm?=
 =?utf-8?B?dEhBdE14Wko2bjlhdXludHRCbWJNQS9CbnVlTFUwYXJSMlcvOTVNSkhNVk5Q?=
 =?utf-8?B?MEFPcUFoOEszSFRMaEFBV2RsYkZBR3BVcjVFSnpMODR1VWZCZzlxRG9LazRC?=
 =?utf-8?B?UkhPeXRxWWFMS1JjSldRZUFPd1J5aldselNZM3ZuMVdHT3gwNGNxUUVVcVdM?=
 =?utf-8?B?L1VxenZMcWhrNVpYc0JqcllzbXdOc0hqbk91WkhJalpZKzhrYWRPTUJldjNj?=
 =?utf-8?B?c3d5Q1hNekNHZnN2U0hZRE5HNTZ1UzdzVU1POEYwOHl6WG5LcXFQS3ZSaW9v?=
 =?utf-8?B?V0VQaWUrTmkxOVJuNVRReXF2UVpCM3h2UFZZVXJjWEpONERmR2dROFpBamFQ?=
 =?utf-8?B?Q3RXcFFyRHJWN1czRGVWWXBPc3N6WFVVL2VHeEw5MGwrWC90QktuUzlJbDN3?=
 =?utf-8?B?RGZKbE40U2R6SThKbXhvZm5JaGhWODlLT0VGbzQxR1pmYVZBcUNNcmRyQWhi?=
 =?utf-8?B?R2Q4S2EvYjhYb1hDVm9mWmNMcWkyek9jeHlNT1ZweVpNQWdidXUwRjRMNy9k?=
 =?utf-8?B?eVh2Y01FZHB5NE9sQXhFcWdxRmszRXNrWEFOTkNxNHVsekNrSU5EcWU0TXpr?=
 =?utf-8?B?S3FqQXN5VTlkbE9NY0w0d3JGcGlveEw4cHBVZnRSL2g1dWpJdGlKTkdCZ3o2?=
 =?utf-8?B?aVZjVXFkcTNlVUJYOUVmTUdxYWVvd1o0UlcxOUtxckZsQzFacGJ4dWFPVzQw?=
 =?utf-8?B?Mkl0SENZRXBxcEJrOVFkeXQ1bW5PcjZ0SldoKytFcUdmaGxQOXNSL2ZsQzMr?=
 =?utf-8?B?UHJiTG95VFJFOTE5ZWh3ZHRZRXovdVFNUzJvQjhmNGZjTTJscWN6Q3F5NzE1?=
 =?utf-8?B?RjJNbEt1bjNFK1lsenovWjhZekJteWNZaTZlbzQ5bFo2ejhLNzJsY2VLaXM3?=
 =?utf-8?B?N1BPL1NzaVpGVklPWDMzdE1vdnZXNG9oU2EvQmwxYmtaaXRuTW5JQ1VkK0NL?=
 =?utf-8?B?a3NEMzFlMEJYUzdsY0trSDV3aUxJd3VvdHpTNmFTb3Nrb002cEY4V2w1NVJC?=
 =?utf-8?B?VjdhQ0s1SUkrR0JDcU1PTUk1YzVuV2c1Y3RlV3BJbnBaR2Qvby9NMVFhd1hL?=
 =?utf-8?B?dy8rbkJZaVFHL3FSamJkR2pmcnovYWdoUnh0czFkN2Z6YkhrMHNyeWczY1hF?=
 =?utf-8?B?blJmamd5NFRsOUVsMjlYVVQvZUU3RFRUaVE3NllEMFFCbURPb2RmZHdyeHd6?=
 =?utf-8?B?T1lzc1IwZkoyTHc5TWRsOWxCTEhvMWh2aVU0L3QxWWxhK2pQcjc1QWRlVHFN?=
 =?utf-8?B?MUwyRExBR2p3Um9jMnk5b2JuSUVTaWRDRDFOUVVTTmpvWUNBckhmb08yWUg5?=
 =?utf-8?B?QnlOd2RqaVZ6YU5kdmRTcUZlUkthNkdzMjdac2RycE5ta3E0Q1pXcFoxSXVU?=
 =?utf-8?B?em1LMFpMNk5QbTVNT1FUd3M1ODdvU2VYbEdGK3VrMWNYK0NobVBweVZoUFE1?=
 =?utf-8?B?OUhtdnB3MEk0NzMxcGwzeS9TZUFNZWdEUk0yWnRlQVlRT01ySVlhNGlNbnU2?=
 =?utf-8?B?QzRkL3lJeC9MVEFiRlE4NVdIaUN6RWhkQUwyNEJ2RUtuWmkvNEJwMWIveHdo?=
 =?utf-8?B?THFXcXZyUEVTeU5xOFBUUVBwZjdBT0JveE5xS0RIQ3NCVy9NOVIyMmh4YmNz?=
 =?utf-8?B?ZTZHZGQrZWZhZHdZYjBDaFgyV21rTTJpbk9KUXlOZyt5aytxYTA3MmR3NWpj?=
 =?utf-8?B?bjUvcmpqYzY5VGFoU2hIRXhNK2ZFUkkwUVkyZWhaZG4veEZQLzBwNVBwK1Bh?=
 =?utf-8?B?S050NmJFWUZjYkVsNE1ISnd4N0ZYWGpFLzFiZEVIZDdOdi9WbGNjcGxVcW5G?=
 =?utf-8?B?ZVNKZUdIR2JmRUVKZEVjQkdFQTNJMllCQVFQQmIzd3B1ZVdGZlRJcXRBRHlR?=
 =?utf-8?B?WXJ4YzVlZjIrZ2Vvd0lyVHhvaFFjb1hVR3VjOUpiQ1pTTUlsV1dxTHQybWNS?=
 =?utf-8?B?blcvckl5U1hOcnVBdlRkeVRNTDVUN09CQTFZR2ZEWGFMN0xBQzArYWZSenVp?=
 =?utf-8?B?Y1o4aUd1Sm9QcnZ4Q1VUdXh2b053PT0=?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4e254e0d-6483-4c15-5b5f-08da8030559e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 09:10:31.0979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uv+p+ilu83qa9de6Uhwu+JIHmQdUsG6SbdKAEm6EdSpJ5uBi0UlPRBMWPsZSfpr6rNdpGk9j9q8rFd09GNgaPfe34+QacWz8fzDNBn1AX+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 09:10:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169475

Hi Steve,

Am 21.09.21 um 14:15 schrieb Richard Purdie via lists.openembedded.org:
> Currently, if you change the site files, nothing rebuilds since they are
> not accounted for in task checksums. They could/should be through the
> file-checksums task flag. We need to cache all the files looked for,
> whether the exist or not so that if they do exist and didn't,
> the checksum also changes.
> 
> This gets complicated by the need to clean out hardcoded build
> paths from the variable and that other layers can have site files.
> 
> This patch adds this functionality. A new variable, SITEINFO_PATHVARS
> is added which controls which substitutions to make on the file-checksum
> values to remove the hardcoded paths. Layers adding site files will need
> to set this to a variable that has the layer path in it and is excluded
> from task hashes (COREBASE is the one the core layer uses).
> 
> This patch will cause yocto-check-layer to fail for some layers
> where site files are added yet the layer isn't a machine specific layer.
> This is arguable correct since these additional site files apply to
> all recipes and things from a layer like core could be changed by such
> changes so it is right they should rebuild. There is a determinism issue
> potentially there if not. meta-openembedded does have some such references
> but looking at them they should move to core or likely just be removed as
> most look obsolete anyway.
> 
> [YOCTO #13729]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Do you think we could have this patch backported to Dunfell?

When I'm building the SDK with "bitbake -c populated_sdk image" I'm
getting errors like below. Cherry-picking this patch solves the issue.

Thanks
Frieder

ERROR: When reparsing
../layers/poky/meta/recipes-core/meta/meta-environment.bb:do_generate_content,
the basehash value changed from
f8e0d4bacfb2940c49542bf6b72b81fa06f96746fa1f4acb58a56c4b28a766da to
2bd1f3bb9789d9d2330e546d0678ae875882376905b00de4d4661ec2c935eb27. The
metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake meta-environment-kontron-mx8mm -cdo_generate_content -Snone
ERROR: Then:
ERROR: $ bitbake meta-environment-kontron-mx8mm -cdo_generate_content
-Sprintdiff

