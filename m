Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043D9C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:40:42 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.48])
 by mx.groups.io with SMTP id smtpd.web10.9564.1667324432023380056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=xMCXzQlZ;
 spf=pass (domain: seco.com, ip: 40.107.247.48, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsbCrL8LjlCdhhAAw9h/768DDmTfUjftUucJfxvvlYR7MUjkUgeI1ZaAGUiezeQ7bL6QfvfrZvDgCagnNIw8H16d1hy2ujdo12Gjn5kgdMyk1IyVvSiUWyfZ7GnOU+in6p52fm0gp7ohjeOHGiUz/z8wmhLVe34hfgQ//7n+HFN08xoaYm2zZF2887pRD4nbgPZjY6NCPScyJH5StvfCWDUxg5mfLoqSE48meSwpbw5A/RqKA3++w46QB3hhsDzj6t8uO3WK8EzBDyhMbis28CXJm5It9Zb5W9XDW/aZIqxBgXVM8Zk2+GPGBxys7RSU3S142CsvCyXw1e0huxQ/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixU12QLrxkDvpgc+9Tp89OaFDuK4vAxa5kPPyfzQpwM=;
 b=WgJdkSjsH8WJBV49R/sGQQASoG876fjS/2o4HRkL9P4k9W5vW9cuLfB8pJgDgauGmNZ/5+47NY6dc5+w4Q3Mz7PkaUiIcAG809tIg0hasU9pkfKz0eglcg+huifuB1sBUYv1KoMko16zwNBjctPfRIzF/BFgXcj8FHanFEdrrIQn4CCs+/ViViEYDrWDVszxAJLKfEzsCwtTEzI51SD6FEEVsVkTEQkpXGU8H7LLK4CICEbSowXv32wUJTgdfJKJOBu0vcA9d5FWiaJj1H122BRbdaqufPDuTwxvkERronw7sD1C2C2sLR1dKNSjp2pgdbh2yArDQxIm7u0KPdSfXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixU12QLrxkDvpgc+9Tp89OaFDuK4vAxa5kPPyfzQpwM=;
 b=xMCXzQlZLVHAYEYIxguOjT8R0FdETMJQsYpDSmm9V0nfNnVN3wIJFfIfFmb+HI5umTZ+GoqxBPAcIp4nsxPxKVHI2TnTjd/u+gFVlrxcrbfXcqBBZRqyP0OdWPPBzr71IMCiHtsAEHzWAkea6x3lk9kP13QD25jNipeG/EdEE+BbxNqDX6kbeSEsnUfXz07qi9UP7/CBX+UqT6aXHlq3NPFs8GIZaQtVtrC82xA28jqUj5qfiR/v/l7GVBVTWlEjm7+nxkivsb43I6/aLmG0FtRqfUxzON//Jc226EEs0lg4uCbge+Yo10aX6vSNVUqxPiJHTq7JWzvNH2NNjITvpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 17:40:27 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d%6]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 17:40:27 +0000
Message-ID: <3eccb82e-73ac-1e79-8a99-0d6b3cc7839d@seco.com>
Date: Tue, 1 Nov 2022 13:40:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 6/6] u-boot: Rework signing to remove interdependencies
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 openembedded-core@lists.openembedded.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
 <20221021233726.1751124-7-sean.anderson@seco.com>
 <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
 <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com>
 <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
 <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com>
 <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
 <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com>
 <3720dadc9a760c068eed340cd7877c92b6ffd482.camel@linuxfoundation.org>
 <3b106bb0-ecdb-efb1-1a54-7ad6ae345852@seco.com>
 <42bd04f74f012c2bf921c486087a6659c9534756.camel@linuxfoundation.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <42bd04f74f012c2bf921c486087a6659c9534756.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::9) To VI1PR03MB4973.eurprd03.prod.outlook.com
 (2603:10a6:803:c5::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB4973:EE_|GVXPR03MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: acb316ec-6474-4fdf-b105-08dabc3029bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GUXds1t3i1pU8RVciouO6Kug1mp5K+kF0KcyZ+SmDaJfvYcSTR3kXZXpAURvpbg2k9JMWNPhJ0T464rsCpGibYBXnmjKH/q9WqsovwCLL3MhIFJciH+vOXOaX4ssh4lDZO2z6U5FSsGSAsBbNH34nxx90AGCYZnDYWp2QRPumQYg2G44z37fmXtLq8eDTedu7xtE85hneh5gZ/xZqX1YYMrHZXjlrdnnRRef/1fJF6XoLhRfvlIQicE/swGxsPomQx8o/hVWSGXa/dy2y+Dj1tgAeJ47admRn+Xx/uKSRSKE0lkIwUDZehpzAprA4LpTJcKoCo+jczm5JCoP9upVUwdoJeOfKY9/nWpbUDRUBnda+r1RDqQHIL5sUB0DiyUgAQuxK/JnqGOCFieAV18fZEGFaXY6ABfaCRfRw91+XFJRRhCi/0uVvGyn2sqZBTlfhyR291CyuzoRhtwsMaNhrcTtfWgm7xdFN0YqSXqbmvBE6+5RW36ry3rVQIu4JkiwHKWBQabWcOR9JmPZKBtT52OXRma11se4clBWZz/ejZ7VdosrydT+vF1uH5C2DWdLHSIvPFImDcTx/PTcvscVrYvgl2rnoBXsDAtWztAc5ibmbpH0RXZkclJRF7kQQKHJgZCL+yumFNvukeEhs7jg2dRKCsyT/cJy/R3Yic/Uc1UoRTy3y/iyQfErXBGH15mg2c8587wBOCU3w/sL5x8E90ey7lQdsR2Nb2HyauxirYH1d9b9MebWaDxBm2iEihFP8LcrYj4x8LQyChsIrB1vFKY/h1/vBbuV5Y6mSd4qjBZrIzTXFjzhxwQLaUo1UUGeN3qHMRdV7lLBk+wVRmAd6sE+lnVAvAAtGNXTPLTi7Vwj5c6ZU0SZLkXVbP9F/BsP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(346002)(136003)(396003)(366004)(376002)(451199015)(186003)(52116002)(31686004)(4001150100001)(26005)(41300700001)(2906002)(6512007)(8936002)(5660300002)(6506007)(53546011)(44832011)(6666004)(36756003)(66946007)(66476007)(66556008)(4326008)(6486002)(478600001)(8676002)(83380400001)(86362001)(2616005)(38350700002)(6916009)(54906003)(31696002)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGlUM3hYTjRMTDNEUDBrWm1qaHBMT01uZVJVb2FWSHRWN2hqSTN5em5JZFdG?=
 =?utf-8?B?dW81eCtZNGtMTG1kb0xTeWhNdEZkTzRueFhRZTdOaXRoeThheFFGT0xENTNl?=
 =?utf-8?B?OEl0ZTN6anBhKzROc3RZODhud2NXWU1JOHdHRk40VkNZRWllUnFzSWU3cGZB?=
 =?utf-8?B?dGs0R1VTd3poN1BsZUYwdStPT2lyV2tFQ2VjQ3NzOHdCMzh1amsvbHBLMlBD?=
 =?utf-8?B?ajFNanhrYXhyd21wNXBNVGxsb3Zxa05saE5qdHIvTnpQNzNUbmhLSkpnVjRE?=
 =?utf-8?B?R3k4dWVYWk44Q3lZakpUdk5EK2dCaTJmOXBPekdDVHpTZnU2SERSTmNJWkMx?=
 =?utf-8?B?UklDWGk3VXd0aWdUUVA4QWFXVU8zU3ZiQ05RS2YyR25INUNDcm9IQTdkUUs4?=
 =?utf-8?B?RjhWSzMzL3RUa2p6MkYvVmRsUCtTVCtVdDBabmV2Wlp2UTE5eGlFSzZQWTND?=
 =?utf-8?B?QlhlSjNQcXlxSXFzQ1k3Nkt1UTgwMFRneFRadWpVMzExdEEyNmFvTE5jRTBS?=
 =?utf-8?B?bDB3VDY1THIxcDQvcW5HTVFuY2VXS1hRUWhmSWpBSG83T0Zya3FIWTN5WGJ5?=
 =?utf-8?B?bXJTR3pRVU44Yzlld3FuRklQQlgweVlHUVpWUEI5cGljTTJCWEQ4SDN4eGp5?=
 =?utf-8?B?djlhamZWWE1ZU3pvTWpvUVNTalRYOGt4RlNLb3VFcDJ6YzVzRjliS2tKVU9r?=
 =?utf-8?B?R081bVdkbStVNVUwL0t4eGw1bTVLNVFZV0RnckUvKzRzM1RXTE9tY1pSc3gv?=
 =?utf-8?B?aVZ4Mm5rYk1rQk4vS3lmSE94Y0pPa0ZsZnFraFNUcGV3MUVFeGpWMFJJb3lP?=
 =?utf-8?B?VGJIQjRWQTFPVGthSXRPSmpzaFAxbktFRWpERGNPNzB1MEZwbW5BVnkxRDZs?=
 =?utf-8?B?cmg1WjIrMURYVFZ5anIvQ1lkTEpWVzFpR3hIbnJOUmdqUS8rMlg4cDl2MnVu?=
 =?utf-8?B?QmpPS084aG5sUEZ0b0dvbDFidGhZOUlId25LZXE0S09aVmtHdUV4QllmaHAy?=
 =?utf-8?B?eVZIbytvelNUQmhlOVB3ajZDT084SWFBS29WU3ZNVldwcWx3R0t2UzRkYVVv?=
 =?utf-8?B?aXBmekdCOWl6WDZRQXpCRVlkWUZ2dVRRK1A5RFdnajlxWU4xVzFKT20zN3Iy?=
 =?utf-8?B?YzR6TURoWE9HcnFndS9rdk8rL0JBZW1IT1l1Tis1QXQ4bzlHd2NtRUVTU01G?=
 =?utf-8?B?Y0NBa0t3TmpHRmhERkIySGNQZ0hEckVWaWJFWmlOTk9zZEVDSUlkOGNEMjFL?=
 =?utf-8?B?WHlwZUczaTFrN01McDFwN09wOWFIRFp3dU9MUzZ0MUh5YVZwdURIWjdsUm1h?=
 =?utf-8?B?ekY4ZkdaSnRwdzFBNHh2dmlPNnRFQTR5aWRYTGRFSi9mbjRjUW9tTGoyYlQy?=
 =?utf-8?B?eVNvaGxIWHFJNS9BblRBUzJncWF5WXErZEw2SlNKSFl0ZVRDbm9RUGdjeWhG?=
 =?utf-8?B?dHUyaEwzZFhIbC9Tb2JybVdOU3E1azlmT0YyMjVSQ0JpSmlxTHh5bnpOeERt?=
 =?utf-8?B?V0VoU2NOejZ1V3RmZ1hvWnRQQWpwK0JhcFBTcmgwSm1QSFFTQVMrR1cwM3VK?=
 =?utf-8?B?SFBTeWdVQldFUlNWWlBta3RKMFd2aDc3Umt0czBXTDBESTJBcXM0UHhKU2hF?=
 =?utf-8?B?eGg1R2NlT0ljS3FNMlIzbWtwNEJNRElwc1ZvcEplaDFuRzJqeUFQZHNYVXFV?=
 =?utf-8?B?Ukx0OGJiQ2F2ZmsrYnRjQjNiUElrd1VyNWZKa253NUpUdmNHRFM4U3pGUktx?=
 =?utf-8?B?RW1iZVQ5a1VzUzE2RjhxVStRWFZlK0JsdWxHT1JQaDROZmFNTWxDczJLTk4z?=
 =?utf-8?B?NWZmUXo1aWVDYnIxVFMzNmlkRmVZL0lhTjdlcHZXbDUrb2Z1WHpFRExkWHN6?=
 =?utf-8?B?clBhR3FMMzhwQ0ZhazNyM2JIdW41ZFdmQkFoT0pESi9YVmlnZkZzV1dsNURX?=
 =?utf-8?B?VjIwdzJFeURxWmdQVjBFOHh3T2k3YmxSOS84b2lIWUJ5NkxONWZrR0xveWYz?=
 =?utf-8?B?blR5bU82eitBRk96WHkxYTR0TXJSYnIweVVpSWMwaUpmZXZkUzkxOGlvNHdL?=
 =?utf-8?B?OUFFMzZRRHBLbjk1bHNxeE95SkwrdzNrbUZuMFRpQm0rT3FrcEhNMWRNMmMw?=
 =?utf-8?B?SGVpM0pwczUyOW9QendXaktZQjZ0blBHZWgxaC9NM0s3RHFoVFl3SEFkQWVk?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb316ec-6474-4fdf-b105-08dabc3029bc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 17:40:27.3374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yfqBEOz75fLDAU5nlQs+9A+fO5iDKgKEwTidOFK7Wa0Jo73bwIISNHcf555vqp7mzTe3/2KCGPTL8VvCcoTNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 17:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172374

On 11/1/22 13:29, Richard Purdie wrote:
> On Tue, 2022-11-01 at 12:14 -0400, Sean Anderson wrote:
>> On 10/28/22 11:37, Richard Purdie wrote:
>> > On Fri, 2022-10-28 at 11:29 -0400, Sean Anderson wrote:
>> > > On 10/28/22 11:09, Richard Purdie wrote:
>> > > > On Wed, 2022-10-26 at 13:21 -0400, Sean Anderson wrote:
>> > > > > As noted in the cover letter, I ran
>> > > > > 
>> > > > > oe-selftest -r fitimage.FitImageTests
>> > > > 
>> > > > Ok, good. That at least means you were only running one class of tests.
>> > > > I was worried you were running all of them!
>> > > > 
>> > > > > I also tried using -j$(nproc), but I saw no increase in parallelism
>> > > > > outside of the usual for bitbake. This was especially noticable for
>> > > > > do_rootfs, which is single-threaded.
>> > > > 
>> > > > Sadly the parallelism works on a per test class basis so it wouldn't
>> > > > help in this case. There are only small marginal gains from running
>> > > > tests in individual build directories so we don't do that.
>> > > 
>> > > I estimate it could have saved me 2-3 minutes every build, since it could
>> > > have parallelized the root filesystem stuff.
>> > 
>> > On an initial run, it could have also ended up building a lot of pieces
>> > in parallel needlessly so it is all a bit of a compromise. It might be
>> > worth looking into whether we can make that an option, off by default.
>> > 
>> > > > > This is ommitted above, but I *had* to use -j1 in order to avoid
>> > > > > manually wiping out my existing build directory each time (and instead
>> > > > > ending up with dozens of pid-named directories). This is documented
>> > > > > nowhere, and I found it in some old IRC logs.
>> > > > 
>> > > > Parallelism using differently named build directories is an
>> > > > implementation detail, not something which the -j option implies.I
>> > > > guess you were also using --keep-builddir
>> > > 
>> > > Failing builds don't remove the test directory so you can inspect the build
>> > > output. As you might imagine, I had a lot of failing builds.
>> > 
>> > I'm very familiar with that myself, yes.
>> > 
>> > We did once used to reuse the build directory, that challenge is we
>> > have no idea what the user has done in there prior to the test so it
>> > potentially makes the test results potentially incorrect.
>> > 
>> > > > > > We haven't really had anyone try and optimise the tests either, I'm
>> > > > > > sure there will be things in there which can help. Please don't let the
>> > > > > > speed put you off trying to improve things and extend our coverage!
>> > > > > 
>> > > > > The poor speed of these self tests (and of everything related to the
>> > > > > yocto project in general) makes this project frustrating to contribute
>> > > > > to. It took me around 2 days to go from my prototype to this series,
>> > > > > most of which was spent waiting for tests to compile and losing whatever
>> > > > > train of thought I had. I probably went through perhaps 20 revisions. If
>> > > > > I was working on e.g. U-Boot, I could have made 20 revisions in 2 hours,
>> > > > > as it takes around 15 seconds to recompile it and run the full unit test
>> > > > > suite.
>> > > > > 
>> > > > > On the topic of these specific tests, part of the problem is that
>> > > > > do_rootfs is a bottleneck which takes around 45-60s on my system. Every
>> > > > > test which modifies something in the rootfs incurs this overhead.
>> > > > 
>> > > > For better or worse we've 'a few' more moving pieces than U-Boot.
>> > > > 
>> > > > Building a root filesystem from packages is a non-trivial task, taking
>> > > > under a minute is in some ways pretty good already. The only other
>> > > > thing we could do is incremental rootfs construction where it would
>> > > > add/remove changed packages. I'd worry that the result may not always
>> > > > be equal to a build from scratch and it might cause weird and
>> > > > interesting reproducibility problems (particularly when you consider
>> > > > things like postinsts).
>> > > > 
>> > > > I would love to improve our development "iteration" time but I'm
>> > > > struggling to see where we could get the speed gains from :(. Open to
>> > > > other ideas...
>> > > 
>> > > We don't have to build a full root filesystem. All of these tests just want
>> > > e.g. an initramfs. An empty (or one file) filesystem would work just as well.
>> > > If you still want to boot, you can make a busybox filesystem.
>> > 
>> > Could we update the test just to use an initramfs then?
>> > 
>> > I'm definitely a fan of keeping the tests as simple as we can whilst
>> > still testing what we need to test.
>> 
>> I can look into this, but I'd prefer to do it as a follow-up to this series.
>> 
>> I'll probably send a v2 later this week a fleshed-out commit message for patch
>> 5/6 (and with it possibly all those variables moved to a separate bbclass to
>> make it easier for other classes to create signed FITs).
> 
> The series did already merge so anything would be incremental
> improvements at this point!

Huh...

I really wish you guys sent thank-you messages when you merged something. Makes
it a lot easier to keep track of which series still need work.

--Sean


