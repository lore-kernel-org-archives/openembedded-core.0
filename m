Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7491AC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 16:14:41 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.83])
 by mx.groups.io with SMTP id smtpd.web12.8470.1667319278638170355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 09:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=ArDPRN2u;
 spf=pass (domain: seco.com, ip: 40.107.6.83, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/Ognvoztp55szUPtfgCRlzy8v0/c1q3CstJ6xWfVrs1fpS9E4xWL4lqwJdK0Lqq+54kz65OyeEQdCLGcQX0thZEG84QmQ4qSorhOpyiJkzoiHMQ4vMmDu5A0PJbb6WiPySBDbS/PR3ptFTKYsBh7hm7i3FnPcim8sWtU0iLDjkDMd/aem7DVrzlvabtj18aB+8ssQUloCteOLTvyhwuIFBIOOT/yH7F4WNbJuBkZW34Y1rdofCEYni/vWwC9dSDozGC8PbzYCOfDo6B//rSok/RyyKvEP1MLUw0WdaHqPZzMBB4HchrkaSbJ5N/AY5tEHVqRevhXYEgFrwAc7n5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yMbrMpmsQe24KkKxhDd5XLA6tpFMc/9cEcTh6CaORs=;
 b=ecTCb1p+HaWxui6GdYWqxnDdBF7JV8Kr1/JnG5zxMBuopY6/1ndkIaTE0b1M9ObOMeotMKK/TyT08F9CXWM+VQc9TFLTkCWPNlcI4GSySQ3JiPo5MHl5tb0zvfbc/oHQ6YgzYOM7hF20sJ7tJ/9KUAXhH1o0yG5kazfOAu4VXVjwmIKxCIZ2e3ywGNTNgpHdVLZ8u1ngm3x3MUdSdCG2Tferg2m3EM69JFq5LsxHSxYHiiErqd2Afiyh/TAJZXo1g221SqUKLtc68ZJ7qDJPiIc3qeGhgn/THWegaeB0djEjjk/sM3CNNpuy8pfk7N0EnPto0xOtrmyMnn1E3XBOgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yMbrMpmsQe24KkKxhDd5XLA6tpFMc/9cEcTh6CaORs=;
 b=ArDPRN2uXK60nwqdSKgvs30nRlLCPCR5FWqX/vSHgK8/uY0T8v1m5SD1vbHHEHembAIQLgzArFScigjuPrOFhxuht7YanjY/Ewqz8BhRPLZ+tPqw2DpzMa4svMICo1hT3/SFqSgnus0SRHx6r6fsRBbo8/IPS4pacg+jwSHVeJUy8jJh3GJE8ulFbg3oQvKQtWyzPf6JKN+4ORVdLj/BascZ06mJzEjPDPhgxuDBrRMiPzXh4FFt5bWsKOWgZs4PGHvc3ELMZiyi6yOtBtVoymkbBgNKm5O4cNQPcptLN0MrQ6+HD/KNNDSLO9Fdz70IFe1gDO4hBOYMGMl6xftRcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by GV2PR03MB9521.eurprd03.prod.outlook.com (2603:10a6:150:d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 16:14:33 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::9489:5192:ea65:b786]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::9489:5192:ea65:b786%7]) with mapi id 15.20.5769.015; Tue, 1 Nov 2022
 16:14:33 +0000
Message-ID: <3b106bb0-ecdb-efb1-1a54-7ad6ae345852@seco.com>
Date: Tue, 1 Nov 2022 12:14:30 -0400
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
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <3720dadc9a760c068eed340cd7877c92b6ffd482.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0312.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::17) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|GV2PR03MB9521:EE_
X-MS-Office365-Filtering-Correlation-Id: fee87b21-0115-4ad8-88f0-08dabc242a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FZtbnAFwU36J6MicB69wFbLSRocj804TsdeCowknYfGfrtapnjqE9niuLZBlj70a8DhOguhXwspQQui2WLsZgu9vbYnO4kKllHnCQOooO9MhpBCWwplrhUyV1IuqE4RtE9jFxR34UkZR5fwKjqCC37jhyq08IhSSkOOyrPdqSs/XZPCS09dXBZxfUIzPoC2dFZGNY7cIoDUBTRAli28ILPNTbrQ8T86i+LdUytt/vv1DbLhI9SArSqVdBp4oUSKU8MCQTmj1zJLwi7RJyt+De5J6+w7dg1IRtXDNDZlTqV8ILPPyNUDQfiipbpjfPEcYBoHP+obEtyMtwFDVaAc7p32yvqwPIfHmjnh8P8nyQvkpOC/zG/wsbtaPQ85Kj7lgItfSseS4ex9x+V2myQAKziOd37LbWXWsf+ROhSdWTz9LnDzOoZV+x/KyUisrJcqgg1uIJtfbSOH/3q2fawZ5y/5Yqbq7bMBwMPk12fqvarAokfM+MtqJ9IkFFBuqvDnwv3Y4RkNAIlAadZMQsA8XUD+hVRh28kQ6AnaKDLj7bgnu/V9qsLlAA6hWJyI0ROnjZlBvio6zeQOL1tsr81vkBrE7/Zq9+NxYyio3pA4yfnRFIcLu6W0ieMcgVDR0Jl+bpKRjtKWg3mSs2I/jlNY2XOSc4NJvFQxc52dY7PbVtXRs3fNTSaRVHJRH2ODlU9OlikI6hsmGoOi0x8+pAIXfRZdIzE302mvoCW62nHcRejM70Y6r0WQcTxtsZlkA9KpXmH184lC1/hw7a/SVch/FamZGeAYCsOdHNaeKCiBDswvPdrKU/DupqHWASodPp5nZeJsW5BYQtmLWIFWVbNTBLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(346002)(39850400004)(366004)(451199015)(53546011)(52116002)(5660300002)(31686004)(44832011)(38350700002)(26005)(38100700002)(2906002)(6506007)(6486002)(86362001)(4001150100001)(478600001)(31696002)(6512007)(54906003)(6916009)(41300700001)(2616005)(4326008)(186003)(66556008)(66476007)(66946007)(8676002)(8936002)(83380400001)(316002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUo3SDUxL2loVkdDQ1JWaTdMMk9pcHVzRTNyWCswd2hWRzlCSWl5ZUVLYnNJ?=
 =?utf-8?B?ZGZMTXdqOVBqQWhkVGFNQTBUa2FCcU03clJoTk4xbDh6RDNOcVdFMEpBaUhX?=
 =?utf-8?B?VDFCRFRpT1FSeDQ5bnQwV1ducVg4bC9vWEFCT0c4MUVCTHNrVWJrMnNuVjNh?=
 =?utf-8?B?VDloVWVPczJEclJ2dmZPaHRqVTVrck1KdzlqTU9HcTlBNXBoZEN6THJUZ01Q?=
 =?utf-8?B?WEdJaC96MTB2USt3SVNlOTRnNXZ0Uk44djM3UENsdTVDMHJDM0txWjFTb0Mw?=
 =?utf-8?B?dlVxbmFDUWZJS3VkeURPeGhWSk5Uei9oSXVjYmJlME1HYTlEU0NYdVJRYlR0?=
 =?utf-8?B?S2JsZy9PdnRsY0F0b3hnSkJhWGVtWTkzYTIxS28zckc1QUdFdkpVT0hWU0RX?=
 =?utf-8?B?S2V5L3dRazJEbHNIaGcvTU9QenROeFZWSjFpbVlxbEh1aGxQdjRDTVpTUlN0?=
 =?utf-8?B?UTI3ZWdreWU4REhEaTJjSXRlTTNqSGlHa3JxcUFIcWZpQ0UrK1ZYMWg1cmh3?=
 =?utf-8?B?SCt1TzJBb1ZKd1k0WUIvS2dnUk5OdVpBbTN3Wkw0YzhCNTBZNUhvdXVCMHhC?=
 =?utf-8?B?cFF1Sm5XM1ZtS0k4YWtxejV5RHVaZEVSa2RkdHJtZGJ2ejhGc29WUkd4d2VG?=
 =?utf-8?B?RUk0MGFaT0ZtYmg3UE5PSTNrdEtBRmZ0M3FKRytHQWZvSjhlb1FJc05PRkRV?=
 =?utf-8?B?NnRmbmp6ZkYyV3lzWFpCQUxndzJTTFc2UkxSZmwwUzR5eGhLSUh0dEJaZE9m?=
 =?utf-8?B?dkNJb3VKTXY2Y0Uxa2g2QXRqZERNZTdFNXpDN0xPaktsODNETk9YRCtESHZi?=
 =?utf-8?B?aXhLOEQzNUZZMHlINzhhU21iSWNPZ0RLMEUrbUlFSVlYM0dwdlJoQ0hEY1lR?=
 =?utf-8?B?dmoyQUcxazBYNnU5cThJQTFwKzRzR3RxNGs0UnpZQWpGNENtTzZTam1lTnhn?=
 =?utf-8?B?dFBtcXllUlZRaTB0azNQeEFBTit6cTYzdC9JU01xRG9EZUcrblloK1k4ZXBK?=
 =?utf-8?B?aUJXSUorcHMvMFNwZXBpVzJncEZDa01heVRxNE9qSURsK0wrZkIvcWYxOFUr?=
 =?utf-8?B?dEVrcjhHdnpsM0RpZ1ZYM0QyTGNNbXpoYm1yV2Nyb0xQUW14QnhEdStCMkEy?=
 =?utf-8?B?LzZ0eGlUVGcrRjJueklEa0NMZzMyVHpXdE1XalQzRHVGZ3VIVEtWRmNKWHVS?=
 =?utf-8?B?K0dvay9KYmxSR0FoQS9FYjI5ZmF3VGtvbTNvaGxSb0ZNMFpWUzROTktPTDRY?=
 =?utf-8?B?czVMWk1CangrRFF6dGVLS0NqdVZxY2Z0Q3UvM1hDY1QyRXM3Um1rR1VOdkpL?=
 =?utf-8?B?Q2hESExPL09nTTI1cnI0WCt6N2ZQS3NnU1lLeWFnbkRQaERBVzc5bExtZnpq?=
 =?utf-8?B?akZ2YnBseng4dTRXNlNENERkUkdCcFpjeENSVGpGTnFaRGdTZStVNVQrTndU?=
 =?utf-8?B?cHhTQ2FzWGFFYjVFTkp2dzRkTlRpYnhHUWdpR3ZjUm1XMzZBV003KzNnbVFZ?=
 =?utf-8?B?RWcvYklLamR1cUFjTlpzNEk3TUs4anNEZVVTcnBPYm9FZVRqamlVeURwSEI2?=
 =?utf-8?B?cHlFa2NTRVF3M3FXUE9vY1FJZzBlclRQQzdvOFFIV1dza21CSHo3dTRreWlo?=
 =?utf-8?B?NlFZMTR4enFGTHJTcUlKS0pVL212MC9tZ0swYVpOZWdvOUNkM2ltK3ZleXM1?=
 =?utf-8?B?c0ZPc29tYVNIVkZqZXFSUHRGVy9QMGZRVDNvZzNOQnV2OENMdys2WmFBYzRZ?=
 =?utf-8?B?N2dTb0N3MjJycUhXVGtpUnRaN2ZOalJwYzdUT3JzaVZmYTFJQjNlTE8zeEE1?=
 =?utf-8?B?NUZONkp0clRHVW41alhVNTVPY1IvY05yV1l0cUMvMVVZY3lRTWhPZlBoeTNT?=
 =?utf-8?B?Uk1WZ0NkMFd6VVgzYTV6akNKZlV5RXdDcHNJbTh0Yy9sOEhlQTN6YlJrR3JH?=
 =?utf-8?B?ZlNUYWJIM1RqS05LSjI0RllTRlI2dHJQa1FxeFhRVWFRU2d5amdvSUJWS0tv?=
 =?utf-8?B?TlluRmVKQittRWRYUEdDSEx5dktvYUxkK0FydVByUXc0UnNhMy8xRm5SSmx5?=
 =?utf-8?B?WHVNTW5sTFdteFZHNHBnQzhmN3dDcVFrUU9ZcE8xN2ZYWW82ZWxRK2ZEdURo?=
 =?utf-8?B?eTJNSklBMXNGd3UyTzgrbDZIWE16STQ3dGwyWFVpUklsM2VyTjExdXJiNjZx?=
 =?utf-8?B?c2c9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee87b21-0115-4ad8-88f0-08dabc242a03
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 16:14:33.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/Als8zOsnRBO+cFC/TrljtOLC0+vQwrffeGB+hG2+XABI7+ev2WM/X7gjizj9jCiu2LAUDhRffQEYQ9EfxneQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9521
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 16:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172365

On 10/28/22 11:37, Richard Purdie wrote:
> On Fri, 2022-10-28 at 11:29 -0400, Sean Anderson wrote:
>> On 10/28/22 11:09, Richard Purdie wrote:
>> > On Wed, 2022-10-26 at 13:21 -0400, Sean Anderson wrote:
>> > > As noted in the cover letter, I ran
>> > > 
>> > > oe-selftest -r fitimage.FitImageTests
>> > 
>> > Ok, good. That at least means you were only running one class of tests.
>> > I was worried you were running all of them!
>> > 
>> > > I also tried using -j$(nproc), but I saw no increase in parallelism
>> > > outside of the usual for bitbake. This was especially noticable for
>> > > do_rootfs, which is single-threaded.
>> > 
>> > Sadly the parallelism works on a per test class basis so it wouldn't
>> > help in this case. There are only small marginal gains from running
>> > tests in individual build directories so we don't do that.
>> 
>> I estimate it could have saved me 2-3 minutes every build, since it could
>> have parallelized the root filesystem stuff.
> 
> On an initial run, it could have also ended up building a lot of pieces
> in parallel needlessly so it is all a bit of a compromise. It might be
> worth looking into whether we can make that an option, off by default.
> 
>> > > This is ommitted above, but I *had* to use -j1 in order to avoid
>> > > manually wiping out my existing build directory each time (and instead
>> > > ending up with dozens of pid-named directories). This is documented
>> > > nowhere, and I found it in some old IRC logs.
>> > 
>> > Parallelism using differently named build directories is an
>> > implementation detail, not something which the -j option implies.I
>> > guess you were also using --keep-builddir
>> 
>> Failing builds don't remove the test directory so you can inspect the build
>> output. As you might imagine, I had a lot of failing builds.
> 
> I'm very familiar with that myself, yes.
> 
> We did once used to reuse the build directory, that challenge is we
> have no idea what the user has done in there prior to the test so it
> potentially makes the test results potentially incorrect.
> 
>> > > > We haven't really had anyone try and optimise the tests either, I'm
>> > > > sure there will be things in there which can help. Please don't let the
>> > > > speed put you off trying to improve things and extend our coverage!
>> > > 
>> > > The poor speed of these self tests (and of everything related to the
>> > > yocto project in general) makes this project frustrating to contribute
>> > > to. It took me around 2 days to go from my prototype to this series,
>> > > most of which was spent waiting for tests to compile and losing whatever
>> > > train of thought I had. I probably went through perhaps 20 revisions. If
>> > > I was working on e.g. U-Boot, I could have made 20 revisions in 2 hours,
>> > > as it takes around 15 seconds to recompile it and run the full unit test
>> > > suite.
>> > > 
>> > > On the topic of these specific tests, part of the problem is that
>> > > do_rootfs is a bottleneck which takes around 45-60s on my system. Every
>> > > test which modifies something in the rootfs incurs this overhead.
>> > 
>> > For better or worse we've 'a few' more moving pieces than U-Boot.
>> > 
>> > Building a root filesystem from packages is a non-trivial task, taking
>> > under a minute is in some ways pretty good already. The only other
>> > thing we could do is incremental rootfs construction where it would
>> > add/remove changed packages. I'd worry that the result may not always
>> > be equal to a build from scratch and it might cause weird and
>> > interesting reproducibility problems (particularly when you consider
>> > things like postinsts).
>> > 
>> > I would love to improve our development "iteration" time but I'm
>> > struggling to see where we could get the speed gains from :(. Open to
>> > other ideas...
>> 
>> We don't have to build a full root filesystem. All of these tests just want
>> e.g. an initramfs. An empty (or one file) filesystem would work just as well.
>> If you still want to boot, you can make a busybox filesystem.
> 
> Could we update the test just to use an initramfs then?
> 
> I'm definitely a fan of keeping the tests as simple as we can whilst
> still testing what we need to test.

I can look into this, but I'd prefer to do it as a follow-up to this series.

I'll probably send a v2 later this week a fleshed-out commit message for patch
5/6 (and with it possibly all those variables moved to a separate bbclass to
make it easier for other classes to create signed FITs).

--Sean


