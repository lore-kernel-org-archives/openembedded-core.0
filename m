Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB3AECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:29:26 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web11.850.1666970957120375062
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 08:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=JVG3NAw6;
 spf=pass (domain: seco.com, ip: 40.107.21.88, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7MpM8r+5l6Qzg3qdo3Flws/5Ny/F4ihmg86XjgbbDbYZ31bpMQVyTikb6t/cbktR9AwAIjGZAE99SHqvfaICqIvvjgbuyktNGltkhTUiHbpuyTUDK4a1gVzfmj6t8bnFPopaiE2pkOZaXDdOyi4lM9YLATjSiU9xDSfhR3iEpp9kK+Rm/Ly7g0FByzWCMs5vH3zjA268oqN4JlT2xdIKA+ZZkLSgMH28WlJq/CwW0AYHgeFUpSpmomth7Y3hN4u8KxFRF6hqvmSb2WRRRPHZeXwH6uUn36Ma4YIq7JOO9nDWsazJKPP0IfLWC8o1pp4+M7ow/qThItGTJnAgUc2EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NNZO6qS0dl54cLKvyOwkT6MDnYyJsjTKXjhLMCoi/I=;
 b=nDWtfXY82YgbYQpw5EO+5pwnsf8kYUAkXalhYem1n6I2fYwZnY7TwJM7TugJPLTHw+HWDI4oBJcauDaPj4RI33u11hRHaPJDIgH+LBvXcWV0+c3EEfuwmTta8eCyf5i9cGUfkORa+vTmB+xAKcWKziZBQfwvMNTlee2rF9hfL9B9EswjOAUqFOQ/sbuIPLrRw/sTx0xkAJN7FJz0XzW2SK8vR5yFumMMDTsSuCVctQVhjooDGL0bKHCA7RuM8Cl5mTJHXLSD4SnQis0w3da+WA0QcC59SROPnt79wU6nzdwkiL5BqEULD1SLJ3G87WIjtzUtuQk/EEBAOtuytr2+OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NNZO6qS0dl54cLKvyOwkT6MDnYyJsjTKXjhLMCoi/I=;
 b=JVG3NAw6fA7BFBOOhRQ8sT9hBRLWdOcbvLfTHvLl5NDP7qQ2eSWVw8IN4UmrFuxGPFysRLPNvZzS6rle6kTVWmG1vK8xboRpKylqhov9j7GoEud7ST0JENDPgf1t4dexM5KHxfT52M2yU8anoQvcV1I12xFnDwBK/1HoNDAhjLG3n6XrUS1/3B1RH2PO4oz5JdG3GB5lGE92VChzaaRHurwNR8fofYo2rPTqWD8uIFN7LV/ljeRBW4RCK0sad+7jKeLSNdyRgvmjkJc6LiHz6gJw+sYx7+0e7QlTpMcx+LEKnEBhoBIx+wQY3jaQPR2OiNECZfwJ196PvG9QLmZr2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DBBPR03MB6875.eurprd03.prod.outlook.com (2603:10a6:10:205::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 15:29:13 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::9489:5192:ea65:b786]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::9489:5192:ea65:b786%7]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 15:29:13 +0000
Message-ID: <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com>
Date: Fri, 28 Oct 2022 11:29:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
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
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0351.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::26) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DBBPR03MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 565efa35-1005-40fd-04f1-08dab8f92a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wsA0JKeNHXcRgMK/mk6I1FPd8GRPQ2a8UUKUUZDCl+UE6nKa/WZUA31qTsS940KfBN8++vYsR4VAvz6DekiGS5huyGcqF0GpsTtBctJkKokg3MyBp0VEWqdD99WcOZAy03FaBURnDhbjIX0YF3zQEaW7b6s/n3Vkb/MOq7RYl7gRyzPPMJN+87XChLng2xJ5EUWBKvYZoNvTPpgpKIJFOZ3fpzaaQanMLweP/Zr41EPYOsaeVb0ruuD00LcbkFYJ9g6IccupfnLneK23SlYIjMN5EAWtofX2KKfifSUk9HRJUPjrflsDUT9Bqp6M7SKYISkZGQfhYxme8iR3Um5xsWvnEqJTiTJG/o5CsJc0Iw43an4an2rUJiW/uw2UfEQqy4w1ZeXB6LdFnWsJR643jLcc+7qKYTYs/X1MEneynkCc+utYUORAYcwvCqyBXfX4PzjTwIOhXlWk8zD4Zld0bkstO5DYzqf+hEf7xS0uWQtLoeCsQEhYUhaSMK9Vl+s48QDcgUn18+T3sXJpIxcfT4uCJ5NbVaSS/6Q5U8x2EJxuxBels7e00MH89LAG0MIkhQMY7SQ++N3zPLsNm+3O2/W6Amaqfipkcd0/YbXvt9yqqVXxwzPH+SZ/ULzGAoOOn4Xpb+yjgvpdcLp5MO8WJ+l1E3GCO4trd90TIltT4pHh+emSUe5bKL6/fOFq0iSmaPe3oKO7nZwzsC4EJQwTVX0sWEaGrhZAp0FNIXyqqXVMZU5kjd9sMdF1JHH1c10rbXsqXhXsuPTkyLNdaKkzUvUXyDdoc/gWwIx4/VoudvZei0JmTvh8hHCi+zUQfYaa8NXSiPzOm4WcIFlu6zI+sQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39850400004)(366004)(346002)(451199015)(36756003)(31686004)(66556008)(316002)(38350700002)(31696002)(44832011)(4001150100001)(2906002)(5660300002)(2616005)(86362001)(186003)(26005)(6486002)(83380400001)(41300700001)(52116002)(53546011)(6506007)(6512007)(6916009)(38100700002)(66476007)(8676002)(8936002)(66946007)(4326008)(6666004)(54906003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cE9EL21ZcG1UWWVlUUN2VGpmeWh2ay9oYjJDT2ZoUVo0NVZCT290WkpUN0l4?=
 =?utf-8?B?MUpXdDY5M3pua05hcm02QVJBSkYvd0NPb2J0MzN1VVhsM1FZaTd6MzlyNmlk?=
 =?utf-8?B?T0w0b2g3bDBPT09qUi9pRlN2VWxMb2ExN3M4Q1dpTWNQbXp1M2srZWw2MjUz?=
 =?utf-8?B?Sjh6b1ZFUTlvQWZ1SFBuRnJkWUtya1hPVWlMRG1mTm1KSStJTnRxWC9MZWdh?=
 =?utf-8?B?SjJuTXlMSFF6MnRyODVJOWovZmIxS3J1cnJkZHV6Si9JcENFY0cwVWpSbHR6?=
 =?utf-8?B?VVRpeXpaYXczVmFCR1FzQW44cld2TUJ2L2FpQnBjb0RhL1h6MjJUTkoyNUYr?=
 =?utf-8?B?ZVJPTGQxZXFvWE5MSXpRVWdYYlJ1RTRnV2I1TXFBQUVKTUo3Snl2TU5kUzFi?=
 =?utf-8?B?ZzMyZDNyekpwMmFmYTNET0ZMTmM4bTIveEVsUW9HaVdDN1RpaEU2UGxTWnlx?=
 =?utf-8?B?OUkycm5NREswSWc1NG9EczVlWGF1SmdjZHQ0MFE2UHlYYTFzL00zUWlXMGJn?=
 =?utf-8?B?WTRxVEhKOW5KbWFPdSt4YXBucEhBQmtMNUxSQUFqSStwemdLdkhlZy84Uk9i?=
 =?utf-8?B?dkZqcDZnZWdzWXNRZ2s4STdseUlYUkFSUTgvYVhwN29qRlJYQUQ2bEJmeity?=
 =?utf-8?B?TmJSTndVNXVOc2VpNHVhdVFlL3ZmQTAzRUNWVmVINzRBMFdXeHlSSzdsRUJv?=
 =?utf-8?B?MG1zN2dzMHd3a2o0WStuaTZNZVdXUmZHVTQ4bkZKL1pqdVZ1N21rTW9kWGp0?=
 =?utf-8?B?QUVLamFobGw5Q3RuVU9uQkZOOU9ZWkNXalIxNFZpTTZwSlh0NzNvOHA3OXU4?=
 =?utf-8?B?aDg1MUhHU0tSYlRCN1RFZWpoYzFkZmpyVXJsZDlCL1lNQW91bXNtOVJXOE5E?=
 =?utf-8?B?Y1JCT0pGV0U0VDdzaytaUDdnc2I4bzJObXdxc3dETU1WNHNTeUl1NVd1RmND?=
 =?utf-8?B?TlhzYkRJaWFvaVI0RjkzNmlsRW44aXg0TmlkRmE0RDdOS0dPT1g0am1yVlI4?=
 =?utf-8?B?eUlQeFFEM1VpcGVVVm9KODNPbE01OURsT3drSlVReVNYdGQ0VXEzeVVlV09u?=
 =?utf-8?B?MU5xcC9PNFpYbmZ2U2Fjd0tZSDhKTUNUckgvN3JQK0I0RWJaRXoycnRXQjNq?=
 =?utf-8?B?UGJuYjRZYlVMSStwbjQ3dVM1L1k3Z2RBcWhoeXE3bzQzZGdQZXVpS1RQNVhh?=
 =?utf-8?B?d2MwQlhRTnVaTmU1bEFYY2wvNXQ3a1B0eVJjTUR1WkY0d3ZpTUJyM3hnTGpw?=
 =?utf-8?B?UmRMb1pQMkFrcUNxdW9KbnRTNnhwcGZDR1kyN1pLM0swYkRUZ0QxRHYxY3Az?=
 =?utf-8?B?emJ5L3NzVkdtTUtaOFBtZk8zYTVaOWlTbk5mcUtVbmcxYmFoY2h6MTBQK01o?=
 =?utf-8?B?L2xvWURGVjVMMDQzWHB3c1FIQjMweDVJaW5MMGNoNmhrQ1g5RHZKM1hENWFj?=
 =?utf-8?B?N0hXQ2ZhRnpadXlyWTFXUUU1eG5PbDY5WDBzbGNNaG9oQStaMmdNOGlBb3Zl?=
 =?utf-8?B?RmZwUHBHeElmcjNWNjRRTFh0NzVKVFUxbVE2ZlVFdzBjRmNwNi8xMVJSY1B4?=
 =?utf-8?B?alpXRVlXRFVMVGlNZlEvYzJEYkpITG5iWVRBWUgvQy94QVlJNXNFeFRHdUFZ?=
 =?utf-8?B?WWpyblIvWWtyZThoV2RCaHY4RWc5R3BiK0h2N1ZiYTBXejVuTythYXFlZVJz?=
 =?utf-8?B?VWZELzFadEhQRDFERnFrOCtBcWZJWk9jZUdUKys3aitDeUdwc3VPQVBDS0JK?=
 =?utf-8?B?Z1l2RkhqZXFpUGtMcXpBM0RNMmIvUWpDaExna1Q3TGE0ckh6R2NFdFNHYjVx?=
 =?utf-8?B?am14TTY2VzNBUzNlQkt6MjUrSGNXc1VNalVpQ0dKK0wwN3pjaUhteU9YSUxM?=
 =?utf-8?B?N2VPTlYrL1dEVmxCV3dCcWRjRWpxc0dMWFQ2T3N1Zkt0dkM4MHp0M3BoTjNh?=
 =?utf-8?B?bEtSWE96Z3NhZ1hTMDR1d3Q2blIwS0M2NTRkZG9MZGhqS1VYNUFWeXIyT2JE?=
 =?utf-8?B?L0phdG44MmU2N05CaDdWWkNTdm0rcjFpbkRZZXRPUUtmMWw0MW40SGZxU2Y0?=
 =?utf-8?B?Q2F2QVJRMFkvWm1Pb0hHS1F6RVdKSEh1Rkxrc1U4S05uaHk0ZTBZZUIwVDFy?=
 =?utf-8?B?OHJKWFdqc09PUFhnSEFMUFhtMURXaHU1YlhEbGo1V0g3N29tU1RVam1PeUEv?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 565efa35-1005-40fd-04f1-08dab8f92a15
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 15:29:13.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9J8DOVW4YkSdLTiH7sAoym7RrCC09V0rDjl7NmanMcSbKTUdN9wxq8VqTQs9xvVWY44ol+WKyi3jm8NfsHmwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6875
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 15:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172259

On 10/28/22 11:09, Richard Purdie wrote:
> On Wed, 2022-10-26 at 13:21 -0400, Sean Anderson wrote:
>> On 10/26/22 13:00, Richard Purdie wrote:
>>> On Wed, 2022-10-26 at 12:49 -0400, Sean Anderson wrote:
>>>> On 10/26/22 10:08, Richard Purdie wrote:
>>>>> This looks like a pretty nice improvement, I've been worried about how
>>>>> entangled all this was becoming. Is there anything better we could do
>>>>> with testing of this code? We rely increasingly on the tests to spot
>>>>> regressions and I doubt the testcases we have cover the code
>>>>> complexity.
>>>>
>>>> FWIW, I found the test suite to be fairly helpful when debugging this
>>>> whole process, if agonizingly slow. I found many bugs in my initial
>>>> implementation which were uncovered by the test suites,
>>>>
>>>> The best way to extend the test suite would probably be to have QEMU try
>>>> to boot using the Linux and U-Boot. This would help cases where all the
>>>> artifacts are created correctly but e.g. the wrong U-Boot is packaged.
>>>> However, I am rather loathe to add more test cases like this, because it
>>>> already takes around 10 minutes (with sstate!) to run the tests. This
>>>> basically kills the speed of iterative development.
>>>
>>> Out of interest how were you running the tests? Did you look at the
>>> parallelism options? Were you just running specific tests or specific
>>> suites of tests?
>>
>> As noted in the cover letter, I ran
>>
>> oe-selftest -r fitimage.FitImageTests
> 
> Ok, good. That at least means you were only running one class of tests.
> I was worried you were running all of them!
> 
>> I also tried using -j$(nproc), but I saw no increase in parallelism
>> outside of the usual for bitbake. This was especially noticable for
>> do_rootfs, which is single-threaded.
> 
> Sadly the parallelism works on a per test class basis so it wouldn't
> help in this case. There are only small marginal gains from running
> tests in individual build directories so we don't do that.

I estimate it could have saved me 2-3 minutes every build, since it could
have parallelized the root filesystem stuff.

>> This is ommitted above, but I *had* to use -j1 in order to avoid
>> manually wiping out my existing build directory each time (and instead
>> ending up with dozens of pid-named directories). This is documented
>> nowhere, and I found it in some old IRC logs.
> 
> Parallelism using differently named build directories is an
> implementation detail, not something which the -j option implies.I
> guess you were also using --keep-builddir

Failing builds don't remove the test directory so you can inspect the build
output. As you might imagine, I had a lot of failing builds.

> and could have used the -B
> option with $PID or similar for the same effect.

Probably.

> We could document
> that?

Please do.

>>> I do think we need something like you describe and adding a linux+uboot
>>> approach is something I've wanted to do for a long time. Usually the
>>> time is taken on our automated CI rather than impacting users, unless
>>> they're working in that area at which point the tests are hopefully
>>> helpful.
>>
>> Which of course provides no incentive to reduce runtime.
> 
> Most of the tests do use our standard tasks so there is as much
> incentive to optimise do_rootfs as there would be otherwise :/.
> 
>>> We haven't really had anyone try and optimise the tests either, I'm
>>> sure there will be things in there which can help. Please don't let the
>>> speed put you off trying to improve things and extend our coverage!
>>
>> The poor speed of these self tests (and of everything related to the
>> yocto project in general) makes this project frustrating to contribute
>> to. It took me around 2 days to go from my prototype to this series,
>> most of which was spent waiting for tests to compile and losing whatever
>> train of thought I had. I probably went through perhaps 20 revisions. If
>> I was working on e.g. U-Boot, I could have made 20 revisions in 2 hours,
>> as it takes around 15 seconds to recompile it and run the full unit test
>> suite.
>>
>> On the topic of these specific tests, part of the problem is that
>> do_rootfs is a bottleneck which takes around 45-60s on my system. Every
>> test which modifies something in the rootfs incurs this overhead.
> 
> For better or worse we've 'a few' more moving pieces than U-Boot.
> 
> Building a root filesystem from packages is a non-trivial task, taking
> under a minute is in some ways pretty good already. The only other
> thing we could do is incremental rootfs construction where it would
> add/remove changed packages. I'd worry that the result may not always
> be equal to a build from scratch and it might cause weird and
> interesting reproducibility problems (particularly when you consider
> things like postinsts).
> 
> I would love to improve our development "iteration" time but I'm
> struggling to see where we could get the speed gains from :(. Open to
> other ideas...

We don't have to build a full root filesystem. All of these tests just want
e.g. an initramfs. An empty (or one file) filesystem would work just as well.
If you still want to boot, you can make a busybox filesystem.

--Sean

