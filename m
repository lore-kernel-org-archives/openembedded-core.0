Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FF4C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 17:22:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web10.10349.1666804925750437300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 10:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=jJxvYQYr;
 spf=pass (domain: seco.com, ip: 40.107.21.76, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUea9LihP0HEdVVLcs6qThhFasXfxd4pKdGTqXF5e8rlYeq415gYHBwsWgnkfPUiEcr9aOeDamcFpPjTnpx4MiHblUg7sNWARh4Dn+ZOGbHF4rk3Vc7le1JJI2HX8Q6mEWXgJW3e+Kua80d0c3J/itIXo7dFVPkFaGC9h4c3o081N5W1YT2kWh+wmrwnkB65HNY/CLIC1XsYDMPA1zZKlZ6PqKTvMEHwt4G9zvKPCfI+BvlaMVgxzlnRdXus6wpXunKmjHuP9kELXuFeL/r+xcDjMwQtsgXVk9cCwkcjbZCqkBBEwEEAxQcniwhZy66tU5iDi7nHB7byEjT9iwEe0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnoPQXLAlXdLF8YErqXWd9j1CbIvghJnDHUmC4YlE4Q=;
 b=CnH4MEBUv2MGyVCjDxaOlxaxKPqbdQC2EXNXoRfWDeuDY8YqcnGjAHxhuHTshruprAMWZpwA6d1phUJ0yw9stbpkNWCxHigT0Wu6EhG2muLVs/QnE/FuZGvmGWJspSJBeYqsYbUdYXgrHNbjthVBap4LlPFgqThjMn++7xUiX9V2HsZZimQKQWJWckFNqegn7hk5MxxKs2VM5JV8mjXM048Pk1hhk+izSG3zKpXyvtvpQr3r3TzdlURE54TF+JLwOeABmtXwMyg2a0mWl2zms1lnIf2/Z9uysR8/QpLOiZgG52jbA/p4kZOk2lmK9jQ6+8wFYCa2Gcrs0YgpXbHwQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnoPQXLAlXdLF8YErqXWd9j1CbIvghJnDHUmC4YlE4Q=;
 b=jJxvYQYrXTY7qJfqrmww9Q9ZcAeBns9DH81abRKMI5X7kffspZUksX5vZe+a+tSmWT79W2z5pBw/k52MzPfiDsTXT3z+j6aXCvKRo9PyS0bJjcmna3Q9uzwnJNrUuBxC2/a23qn6Ov2eGwyw3sIvKBVOAkpjh5CsJWseBrrTejYGB+G4lChpdcbn/kAHyefBE0NJ6XdVBeYzXwyeGfau2wYP+Io+9DuE+N7DMSecQI8EBdNJsUF1U9nunAzugwHDh0U/AGD+qAKrysEQ1EVYtYjcuAY77/3EAPXuafdkWjZQFDmOpKub9Z6Y106wmHwaV4/gpvH4QFyyWc3d0o3Geg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM9PR03MB6754.eurprd03.prod.outlook.com (2603:10a6:20b:2d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 17:22:02 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::447d:3157:60b0:ded8]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::447d:3157:60b0:ded8%7]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 17:22:02 +0000
Message-ID: <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com>
Date: Wed, 26 Oct 2022 13:21:59 -0400
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
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:208:2be::8) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AM9PR03MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e49f9c-6476-4521-d140-08dab77698ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GRHw9Lm7HDvuJuZPC1gV3X+qPWCZxiFD1eOmQPvvadc0jZhTEtpZPA3IAnLd5ODWk4TG59lFKT2nyleIggOUHBQQ1aK9aCS50ne8jQsObh5qTeRGPFiPI/Pcyr/7+aIzWG9w9weSlF/+cB6//Dxye53XIh7Rw5xdmo54virRWWRx+EF95BjbCfz/MhilHjZboL+wevmu15bIre/BB93jZpqKAQgQrWqOWVtclAIIOYtxU4N8vqllAOzhoAQCMPw8/qv0O8iDddCFfir2pcPXM97HgMgEnorHlkwlKMn1We44Yxd4LWVR8tdmL5JTa5dWozfhE3Ozc97nMbNRe8LfrrjEkVw7t1h+THgsW8fr4Ga5zzW7LkNxO9ueQlb6SpCjPCLJWcC9fwpYDyUDmvNO82Li2xm7EaGrRPLU3tDEifjk44aDjxEFoIKygv3FfVZydA7sFV6w9Rgz10sdtpGrSzBLbbscYnhf+LQhiEvfUpZEv21+8avjN0X/8MEvTP/lYw+Omu7iPJZslmLTGDu6kqWFUc5kpLXRcIf5DBB0445iLsWGuW22RW9J7808WcxrX5j+IeNmyYf9H3Y5l0kClTSjIgj6hjr0JgdQshquFrZ5W+tXeH7RdJT57FSmnDgb1KiPyCVu3ORkkrXFsNL6PPZ5UHDGOva2dmKsVS2JTKdFEaQTB5FjrBfHT+j2UmXmSxeKPNB6MpQ0ESfhP9uEIa8a6Z7LIy33fZ31QEKWm39uAkH99RDjFnJnxcs64A+zSn5Wcbqgm6txtvK03ill7l6tVMxsRcaCLQ7Bwpnv3XWN+0TfOesNnJ0WHn/ENkQ3JOQG2ynf0QmTbaemcukJcg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(366004)(376002)(39850400004)(346002)(451199015)(31686004)(36756003)(38350700002)(38100700002)(66476007)(5660300002)(66946007)(8936002)(66556008)(31696002)(86362001)(6916009)(54906003)(2616005)(6486002)(186003)(26005)(6512007)(478600001)(316002)(8676002)(52116002)(4326008)(83380400001)(6506007)(44832011)(6666004)(4001150100001)(53546011)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?blNiSzJzeXZnSDQ1WERXQkNYMFFvbC94NkhHNDdUbHIxZWZOSk1GeGo3bVdr?=
 =?utf-8?B?eWhSWUhSVXd5dGVBL3NMeCs3S2VuZXluS0FYSUV5Vm5jUjkwYWNwbllQTXZi?=
 =?utf-8?B?Q2JoZ25YeEUyK09xZ250K1IvNW1GZjhEZktxVi9mbHc0L2RPUlllTWNsWk1w?=
 =?utf-8?B?YllxVmkzVDY3VjB3T1BNaC80QjlEb1grMVYyeGxNVFVqVXZ6VnBGL1dBNTI2?=
 =?utf-8?B?SUE4YTFiWmtiVVFPM2xkVlkvN2w1UlY0ZU1IbG1DQW1NRGtIbk5RNUNDdUVB?=
 =?utf-8?B?dVBRZXphQkIyUTZTYWJxUjRqelU1ajFrSGFYVDFNWDRnSnB6UXp2ZUl6aGdO?=
 =?utf-8?B?N29UUEJPTGVuaW5lSEtMYkZQVjhlMmJWSWVoMDJYbXp5eGF6NUxNMGNaU2xK?=
 =?utf-8?B?WFdrQmVrSWhJZUo4eFJvdisxa1J6emdzMGdXQzI5aDhuVkhHbGU5NVREODBN?=
 =?utf-8?B?cWRLZjJMQjdJSk1XbSs3ZlJDMXBqTFByL2FEd2N5eEtBWWpCbTNwL3lCTEZI?=
 =?utf-8?B?dWZnRi9BL3VEcFkxQ1Fkd3ozRzBsYzVSRzdIU3lGa0EyU2dDZXFoUy9TMkRX?=
 =?utf-8?B?UXAvVlZmTFVmM0paaDl4blRIT2FoMXBMQ2QwZ1V0TU5uVVpOeXMzQ3IyT1JI?=
 =?utf-8?B?S1lSa1RTbWFFdkNXM1QwMTFnamRwOTRqaDhVU0Fwb1FMNEIyeVc5Q21HM0du?=
 =?utf-8?B?ZEZOUHRIaEFlTGFqZFcyN0hNYWpRRmNzWW5RV1FDM0dCbHVKclJoajl6ODNu?=
 =?utf-8?B?SnFLeFU5MjJrblpwM2F5b1FscTNwZGQ0U1FSMFRpZmlKU0UyK2ZzaGNCSXBB?=
 =?utf-8?B?b2RkZDlFU3BmU1VQcGRVc0hXYkVuejgxeUVRYUw1OVA0Nm5KalFzRlFUY0xp?=
 =?utf-8?B?MlYvVk1lVFJIUUM5N3dzQTZiTGhtS0RRdzl4b0pEQ1cxOGVGT3ZnZVZNTWcr?=
 =?utf-8?B?RS93cTl6MWxNSVM4R1o1dG56c2NtbjJ3ajBQaktmcHRwYXQ3SW1aUnFhUnRv?=
 =?utf-8?B?Z2IwTTlVcTk5LzN1TlQ2MmhYeTAzNnEzT05ILzRUQ3JLVTRVN3BuRCtSTTF0?=
 =?utf-8?B?WDByWkUrYWRjZ3lzUWN6d1dDM013UTIzVXNlc09FcmhUb0l5WG9rWStSbGJ2?=
 =?utf-8?B?UVUyQ3VVeU9mdElkRE95cjNYckt3Slpaa0N3SjFrZ0ZHSm52OHE2OHE3bXBw?=
 =?utf-8?B?bGFSOFhwSE1NM1FoTlJCSU85QXVoT1c1RjQzMEYzS3VjRjBPTUNvWHMzNFpn?=
 =?utf-8?B?aWpGQ3JEY1d1MDVQOTljZlVvZHhwc3VPZDRXSDluTlJLa0R5NTVmMUkzblo3?=
 =?utf-8?B?S2xUSVpCSzI1TmZoVjhRYkZ1YThTdDBORjBOVGVkc0pmVEJWZVRoc1hrZGE4?=
 =?utf-8?B?a0tybC9OY2hlYzBKZ094U25MM1p4YWRoYXE5ZWg5eGxuMDhLQ0tsaURXVmh1?=
 =?utf-8?B?TkRoVTNiSElzMUhCSXFoR1g5OE44dzlXV1Fkbmd5TTVIZno0VUs2STVBVWFr?=
 =?utf-8?B?bGZGcHczOWRpdXl1SktUR2FsWWJxd0FYdUVQNHJxUDVxZkM2M29NSVRDTEZo?=
 =?utf-8?B?ZktZRFZVc2RJcTFoREdsN25OMTdkczVHUi9PcTJvbm1nNzZlQnJQZUZzTGdk?=
 =?utf-8?B?ekpEcFQrVnR5cW9iMXB3cVMvTkV1OG1RbUVRQTJSZlNJeHhXY1ZNcDZnYlhj?=
 =?utf-8?B?b3ZFUkJGTmtmb1ljSGR4NDJYSFFpV29CREY2ZWM3VEowVnlYYTltSHV1bjM4?=
 =?utf-8?B?ZVlLUUtJdk51MU5kNUJ1YldoUEtxSGJTYTBaWXlEZ3pyWVBncHRhSjJYcytV?=
 =?utf-8?B?Qk4wQlNra0NZZmVwTUJrRkVQelFPdFdsUFBOMEpEOFRJbVpFZzlsM1ZBc3Nz?=
 =?utf-8?B?MGJzTTcrdTA0TXJRMkF0Y3czNkpwVlBxOEdSSHBISmhIMHlEREV1cWtPWndz?=
 =?utf-8?B?R2YzRHphN1ZxK2NCaG01ajZqdnlrM3ZnWTk3aTJJekU3dTZPaWEzTTNwQ3pa?=
 =?utf-8?B?SGlITzd1SHNlQThqZ0hOaDkwQTRLZHQ1VEVZemZnTkxDU01rQnl0ZGV4Z1lm?=
 =?utf-8?B?WlJmOW9qTHRFaXd0RFdBNnFvd2xkc1RWbGcxYk84YzVzMzVqaGxjMy93V1BI?=
 =?utf-8?B?MW51THRic1pVc1dzdzQzSmRTSTEwbkpMZndIdDk0WjUzWnFNMnFJWmlzNnFO?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e49f9c-6476-4521-d140-08dab77698ae
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 17:22:02.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeiSeZLaWi9vhXyMwI/2Rm5jFgCX77QgYeNyC9CEXGkMh+IwUYn9SP/HKDgAzPUeLpSFYF2OFK12AZUrjPhVPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6754
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 17:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172166

On 10/26/22 13:00, Richard Purdie wrote:
> On Wed, 2022-10-26 at 12:49 -0400, Sean Anderson wrote:
>> On 10/26/22 10:08, Richard Purdie wrote:
>> > This looks like a pretty nice improvement, I've been worried about how
>> > entangled all this was becoming. Is there anything better we could do
>> > with testing of this code? We rely increasingly on the tests to spot
>> > regressions and I doubt the testcases we have cover the code
>> > complexity.
>> 
>> FWIW, I found the test suite to be fairly helpful when debugging this
>> whole process, if agonizingly slow. I found many bugs in my initial
>> implementation which were uncovered by the test suites,
>> 
>> The best way to extend the test suite would probably be to have QEMU try
>> to boot using the Linux and U-Boot. This would help cases where all the
>> artifacts are created correctly but e.g. the wrong U-Boot is packaged.
>> However, I am rather loathe to add more test cases like this, because it
>> already takes around 10 minutes (with sstate!) to run the tests. This
>> basically kills the speed of iterative development.
> 
> Out of interest how were you running the tests? Did you look at the
> parallelism options? Were you just running specific tests or specific
> suites of tests?

As noted in the cover letter, I ran

oe-selftest -r fitimage.FitImageTests

I also tried using -j$(nproc), but I saw no increase in parallelism
outside of the usual for bitbake. This was especially noticable for
do_rootfs, which is single-threaded.

This is ommitted above, but I *had* to use -j1 in order to avoid
manually wiping out my existing build directory each time (and instead
ending up with dozens of pid-named directories). This is documented
nowhere, and I found it in some old IRC logs.

> I do think we need something like you describe and adding a linux+uboot
> approach is something I've wanted to do for a long time. Usually the
> time is taken on our automated CI rather than impacting users, unless
> they're working in that area at which point the tests are hopefully
> helpful.

Which of course provides no incentive to reduce runtime.

> We haven't really had anyone try and optimise the tests either, I'm
> sure there will be things in there which can help. Please don't let the
> speed put you off trying to improve things and extend our coverage!

The poor speed of these self tests (and of everything related to the
yocto project in general) makes this project frustrating to contribute
to. It took me around 2 days to go from my prototype to this series,
most of which was spent waiting for tests to compile and losing whatever
train of thought I had. I probably went through perhaps 20 revisions. If
I was working on e.g. U-Boot, I could have made 20 revisions in 2 hours,
as it takes around 15 seconds to recompile it and run the full unit test
suite.

On the topic of these specific tests, part of the problem is that
do_rootfs is a bottleneck which takes around 45-60s on my system. Every
test which modifies something in the rootfs incurs this overhead.

--Sean

