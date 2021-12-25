Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483DAC433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Dec 2021 20:43:49 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.91])
 by mx.groups.io with SMTP id smtpd.web09.10624.1640465025866845089
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Dec 2021 12:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=FlRZ9Bwl;
 spf=pass (domain: outlook.com, ip: 40.92.74.91,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMl3GaeD3BpdNWX1/2tV9xxz1Cl5njI79AkUlnOmLnyf/6D2L7HbKRAJ92x43xE9+YvtvOrbeq3eAcGzxgX0KhaM+Phxr9ncAgD6UuqddRbQMNDRwI+WeKNaMRntnJnDB9Th/J/LA5igAM9UhfxXvyD0YjlvKV+bdergETCJ89uVkCS9/RmNvpO5dUT5NB52vDBqD4xa/8IunWZz6vVR/v8JuUmIh31jUzISgmvtF1qa5yvOXRb1grlTMSc20+/dYu+xKR3ebRwTIzTvLREBRcvr0Fc9fMYOVeTSRCnFLUuyiJEf60H2yG7s+QMu9FmPPbkTZ7AS/SuwxifLTTeDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuvymPYp3VCsMXClJk2DzPSqWUAtzIP59DoAgHFyxOw=;
 b=cPEWJIOMG7+Jd4bSTLsgcn7g+kGyNL+evYRoZMvim+nDoE0UN6+9nheRY0K6eMhloKhlrWIXHOgh6rrLwRjP36LY3e6+y+74JZG4NFXYf+qzvBf37hMePt2/jYJ5zONsXdl/w28HFflW/CfxsI0TAb4dbhw5fjdkhf24q5tJdACaj9cCYFTrl0VL3W9brbQ+61T9XeRPD2ENh9SmUdaFD278OlSvUwHNrkS6Sq+7VsI66sRZTu9nfcpnF+hWlsSPsyVd23X+W+L74aZCsu1+qw/6HjH/uIicXLVV/Vpf5gbOUcXbGMeRA+cYBTxXEsBT7ZgsPjMwzan0q/qB3jcqrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuvymPYp3VCsMXClJk2DzPSqWUAtzIP59DoAgHFyxOw=;
 b=FlRZ9Bwlyvkc/40eVDDgP9AeZmnt28JPV/dbz63C22ZOKWk3KHBQIB5M2fhar9V5o5F3biFjH9gLPtxOqv5vJcHrAtJKXFeu/XlvchgcSPSaxAWG1nbq9TkDmWFy40DqSeZKJBvFqnEi7yQTLtRr/dfcRMg38xZuWqruAENUmIWGVPPSy2DBt2wzxT2NFVMhzSzPPHDmXLkCwS6D0o9/DRgegYNEM+KaWPmwJsJ9XvzIzTX9ddP3Xd4iAYUxE9QNBPZQyK5jMPJKJ6A/HbZlyplKa0LEL+mAbWJEx0wNKBD2Ffli1PaVgsRwtCpEbNzGSny6TUL0w58ZphEoN5VRCA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1892.eurprd09.prod.outlook.com (2603:10a6:200:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Sat, 25 Dec
 2021 20:43:43 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e%6]) with mapi id 15.20.4823.022; Sat, 25 Dec 2021
 20:43:43 +0000
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>,
 Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
 <CANNYZj-XR2XzOwnfPTN74mG1QiWcbE96+-iAb-VL7fYta9YA_w@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642BDE5CE4D2B51493CC1C1A8409@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Sat, 25 Dec 2021 21:43:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CANNYZj-XR2XzOwnfPTN74mG1QiWcbE96+-iAb-VL7fYta9YA_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [Wc8FcQwWwi7aWSqOUzC7Ve9qpsphlaAwyrL4wqK2Y5JgMbwNRt3QUYM0erglHo21]
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <2b4dfec1-0ebd-2c1a-6dac-dbd95153dbc4@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ecaeb3a-dc16-4355-bee8-08d9c7e73d75
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1892:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/IWvG4F0RYshVmPngFbryPJtX7QwALFOHFV+wfcpwyPAulu63oEQGBj8D/SRVuY8CpqwAYdrE7/Qkj3KD9+IktyJQBLUoXoZ12Cxz8zMnkaT2RrtDbZunIaTgR9JAhIUKuAn0T5leoieBQwjLENySWugNdrdwNQ8hAjNrfiZgjc+q9eNiX1P6tYEPY5g8vFjafOFCSBL8trvYLLMrnM9pXsUSMgek1aR3FeWsTywOXbab6NF+MvMzDRVOIN9gIlzdLBiO9L8JcU7vrf8Eld+Q2Bv6Dwuuxf6sXuBe0Ev/tKVytQ6KGOdl5df3U8O0bUwwlbel0bHj+gYSQZ+zdYxw80AASWO8ef02lyHIy9/HVbLcLlnkLb5ZqHNNZysbOjKzkmOWxGb2aAoynZ2TU7aAql7r6+rr053CkvOBUsmoWMwb6LAmQ5O/ZJCkEDRYxj/rH9ETOHtvhVP4Nr4bVtyKN2jgA8D6t8AB7U7JDBMw4+13HWKLxFc7iY1vRTVJwLj9Ppu0qibKVGKOWFJNiPOjD54dH9STH+S8DMmth4aF2J9EzK3vGlz31nFMVJSXRc/7vPrltknzKtf2knxp77FrQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NERqNDhNcUV0WitzWjZ3NjQ3N2I0ZUlPUzJNQ3VKRTRjT3k5eHVoUmY4V2VX?=
 =?utf-8?B?dWtJV1F0anVEMjEzYm5aUzBLY3IvTnBKQjNkd2gvMkhNM2Y0dmtGcVUrM1Iw?=
 =?utf-8?B?T00rcUlZNE1zRmJQelQyOE0rZmF4czlzclNXSjVHYXB4Nlp4bURHWXc5K0d1?=
 =?utf-8?B?NGF6TVp0NTkxS3BvM1BIelAyVTVGVmd0WURRN1k5Ykh3QzR5VUx4aUl4aVcr?=
 =?utf-8?B?OHZmS3pWR2tPZXpLK01ZNzBld1p4YVlsUE9JamVpREZNZVMvNE5WdlJ3N2lT?=
 =?utf-8?B?M1FjcDZTOWVUZHVWYWlwTURlckJ3T0pmUWRHWXFEZFhqenJIV09sNWFsWUxw?=
 =?utf-8?B?WGhISjdyMWZ0bE9MZ1N0M0lDR01rR0RNR0JPUm9Hc0JvbGpCM0lodTJCbHhV?=
 =?utf-8?B?b3I2QnB3R20xUlNFcVNqYVdYR0ZmSEdwVU5YWGlBSDBCcEhPQ3dLdEU2SkhF?=
 =?utf-8?B?eUIrUlNWeDcxL0dKdzlRaXR3MHhsaDFHS1grUXgzYWZISThidjE1VFV6THo0?=
 =?utf-8?B?c2VsTjdhQnlIZFIvcmp4QkZkdVZ5eHVqTnZodFdHKzYzdHBtWGRSSWlkYkkz?=
 =?utf-8?B?dUE0aDBEb1ZFYVl3cFNnaCs0TEtJYUhmUGJFV0FocTlhRzYvSDhCQTFMdG1p?=
 =?utf-8?B?L0F2OFdPQ3Ewc1ozU1UyZ1dKOG5mK251am8vWmFwa0NlWmE5MzBZbDhHZHl6?=
 =?utf-8?B?OFlkUktadTd6UE5qekF2YWs3dmdWd0JIbHJTcFpEbWFuRUwwS2ZUdE5lNDVw?=
 =?utf-8?B?QWRHbHdBdFQzUlNEbzNwaHJmdEw3MUZ5M0NzM3FIamVPeG43YzJmL3FaOTdY?=
 =?utf-8?B?emxGRzhnanB3UU15Q0hGdllVcXBpaUZCaGtxOGVvS0NMQUU5RmhPVzE4VWVG?=
 =?utf-8?B?MWhPcEVtNUplNXF5d1BDRVQrQUlsMkFNMlc5RlJJYWZlcFpNUVRkU3FFZG9a?=
 =?utf-8?B?WC9Rb2lKTFI2RzMrR1hKUWk3MEFLS1RpRmhUYVVqQjAwc3RHaXp5VDEzZmZL?=
 =?utf-8?B?cmJGQWZnMUlyb3hoUkR6Z3FQcVU2eFo3M0NiZG9pdGFuY0UveGxIZHM5cXp4?=
 =?utf-8?B?Q3JwNko5dUJKQ0RvNW9SZVZNbUsxK091THhFamN0R0dyUXRmcDFKbk9aTlZP?=
 =?utf-8?B?WmZNbGdzTVJTZlRoTjc1eHhlRndVRC9HeTBGOVJ3SmZNZXE2STEzVlo0bW1s?=
 =?utf-8?B?RHBjMG45WldTSVpqTGt5OFQyQm5ULzVmZjdqZ3FYMm9sd0lUVnl5SkkvR3JO?=
 =?utf-8?B?RGFHUlBUMzduU3lZZXM1ZjRrdWt5cE9WbWpZT08xc0paUWE2RmdKL25XS0tm?=
 =?utf-8?B?MERWU252Vk5sU3lrdUtzd3JybGcrSks3TzB4SVpMN2xKK3lrM2dZZUlrblFk?=
 =?utf-8?B?S28rMHRRVEE5Nnc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2ecaeb3a-dc16-4355-bee8-08d9c7e73d75
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2021 20:43:43.4166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1892
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Dec 2021 20:43:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160008

What I so far don't really get is why increase in parsing time is such a 
big deal.
I admit when we're talking about npm it's some kind of a drastic 
increase in recipes one would have to maintain, just because some random 
project decides to use a trillion dependencies instead of writing two or 
three lines of code more.

Still I come to think this might be actually beneficial, as it shows how 
broken npm is from a distribution perspective - as it may be that some 
users actually start to access the situation when they are actually 
aware what monstrosity of a dep tree they are inheriting by just a 
single npm module.

So this is mind - and I don't want to sound radical - I would rather 
abandon npm and go support in core than to sacrifice closing the one 
main loophole in core that is preventing true accessibility at the moment.
Which is uncontrolled fetching outside of the fetching task, as this 
invalidates everything you will get in the end in terms of licensing, 
quality reports that haven't been done as part of the build and even CVE 
checking becomes pretty much worthless if one is allowed to inject 
random code on the fly into the build - and in the end everything that 
can't be assessed outside of the build is pretty much non-existing for 
most of the assessments I had to work with.

In the past I showed that npm and go can be made to work with these 
principles, even if they would introduce a different way of working and 
maybe the need for better tooling - *but* they can work with how oe-core 
works at the moment - to the expense of parsing time - and that's pretty 
much it from my point of view.

Still the gains outweigh it by far in my opinion, as it would make all 
of that accessible by common tooling already in place - including true 
reproducibility and builtin quality reports.

BTW I don't think rust and therefore cargo is heavily affected by it, as 
the cargo to bitbake scripting works kind in the way I would imagine for 
npm and go too - so far just npm and go are really really bad to handle 
in this case.

I'm happy to help on such scripting and tooling, but I don't see much 
worth in either accepting the fact that "modern languages" have to 
include some not validatable "magic" (which then would mean allowing 
uncontrolled network access) or working around the fact that a trillion 
dependencies is still a trillion dependencies no matter how you put it ( 
:) )

Regards
Konrad

