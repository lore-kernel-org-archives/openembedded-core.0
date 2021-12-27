Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5D2C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 13:22:09 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.12])
 by mx.groups.io with SMTP id smtpd.web11.26197.1640611327904714770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 05:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=X4LT4gLw;
 spf=pass (domain: outlook.com, ip: 40.92.91.12,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I79sQ2S7CdS92VLHlBpKVNKb7JjmUprfAh52TyvbPAajKa5Rmj5BbdsJ6FoIW5rdi5MgdLYa06xSi3/NnxzRAbDbXLtGCZgymbowfNAimpuetz93VBZtH6bK2dqkRC2MOgdh57bgxgQ+3hHWx/E+kijttVUI/nkMeGBu0Xq7YlXlZ6BGDTtCHbkwsl7LCDi1/Xi7UEpGKaRwDMO2mPQjSKs3iYyaOb/F8F9T9D983aS57r4rlHvj0OnuSpgszCENpxuuajEbxKFSnkoTmHw0K7xGwUjaQNusyMl45wzMuyTkJQA0ukKr6sg1d79lnzAeubzH2APQzt36xD9Rr4JuHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cm69tm16Ykaoj7fS51mX/9CtoMUnhV6UuCZV/wnT/Y=;
 b=kEdclYZqbeO9SCDBhQ7d14Fhknbh5S7c5TjcHJB5MTNcchT2wDSV0ZAMjNqbom6rjxtHwFX+io2PRGHxG0bcQcbxLtybnWtMQLGtEejNGkeXhYMjS7SNjIo6mLks6SctX9LmwOfZ1SDLN0cuwNbBAfiuQLh+f/2Z65SkrM+PrjwOsVHk6Uz8LySlWFzk2i2amcahHEwj1uKLV+ZE7kTkXD7S447qA5ULvzPJMN2oqssHTDoOQqTHIyupjWVrhjCl7mrr/XRndrxK2EF7wuyc2wqEA55r5ad5KVjfhhnanIWPn6jQnxQqncZGNyz+KgQVQOif/k+er4EvrVwE/ym0Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cm69tm16Ykaoj7fS51mX/9CtoMUnhV6UuCZV/wnT/Y=;
 b=X4LT4gLwCCJZsxl0Sc9YjZDAX1Nd7IEKaqD4WUU5C09+raM5D3bSSWBA9UZB0xfszEYanm7PzgEwiMp7SYZp7g/ApBoogld0i5zrtpmyp9l2r8RXm1LAlwcoMqX+gHCASHjXsTaK29vMg1nZ3Oz8TwSpVBmh1BYtemaDOPEM8QHBTzL3KiPG5H69zu4dWnNu/ltKQOH6PK7fnBp1eA4u4Wl/y5wFtOQcdlAZvqDkhy9nZGaOomi45Ek/j+ujf+HLJNlhVkk9/FIT0oVpisncqGiJGZRDpo+DreRDrIGsweyrKklu3SY7J3mcnXK6vaYZo3xzUP0O7brkC3hRbQmOOQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1763.eurprd09.prod.outlook.com (2603:10a6:200:8d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Mon, 27 Dec
 2021 13:22:05 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e%6]) with mapi id 15.20.4823.023; Mon, 27 Dec 2021
 13:22:05 +0000
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
 <CANNYZj-XR2XzOwnfPTN74mG1QiWcbE96+-iAb-VL7fYta9YA_w@mail.gmail.com>
 <AM9PR09MB4642BDE5CE4D2B51493CC1C1A8409@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <d92dcf7c-604a-2d67-c632-5d093148104e@herbrechtsmeier.net>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642CBE53ECB65813EF020A6A8429@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 27 Dec 2021 14:22:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d92dcf7c-604a-2d67-c632-5d093148104e@herbrechtsmeier.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [aHHWlMBvqfn+Q1GXJPR+SBSH1Ri59ljKJdtanJBp8pfHglQXZucYUOPTYLkNc7I1]
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <745c5ba5-c6ed-5b4c-fe95-aa15ea069270@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0a4af4b-ee42-4de7-ce1f-08d9c93be06f
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1763:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a4PoP68uHLj/oA4jgCnftn2U6LLd8nxpflCKeyv0k4rFXf5dxOSk5X4+dm09bW3acpNBTfAwKWRgHOqRQb/G73DdZq2Zo2R20UalG7+OfE+rbB293OuQMQ0X0GIQVC4hTJTcQoU94EEGT3BRau4OT4+UWP6bsVPIA0T4e3CIRqAzhF9o50TKOAl/ys9OJ9GNeQY3ZPbCGrRN/UcyeoSlh5RY4vrAeBVcvehH7aI8xi37LyVMdVF6HObKWu3ApfUHKILfU7dNMmW2OYkwkIH7U+2xcxMR5OhuYiF2O9u3dMDJhz6+YFLq+XsSeH8YeT5GZthk8mi0Mnskf2uPPFfb9sdrTx1Fq8iClfoDzO+mBQGotING2i+YFpUXVPUQAz9EHYuNX+TZfZoQ+EMZ/Xeol8nOG6t+3E4Lrb1we2ftobW6YaEW2MrFbGa9gAH1Bf3PpyKjm0Itm+EOYZUcByEK6HffNCmP3AjNceIm+joFQmFlRRSCxoCoSYrmMAa12zck6UH/hpk9ClWAhDCjm3+Vjorr1L7vvzh/RcE9en8YHyV33j3Z8smSfDlgF3QIGKW+fS+A27cfriMYor3QTU9UVA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEI4dGk3bXBEYUJiZEMrb3FpYmxOZ3pYU3UyWkdGbk8rUTBqUU9LajNFZDAx?=
 =?utf-8?B?TWFhcVk3Tkg5NExDVWJHMGQxTHhVaytmYVphL1lUMy9jVDlFWTIzTEhjYVVw?=
 =?utf-8?B?aVNwc1lDMDF3MHNRd2NHdGY4WEJBY3p4QjFOdndHM0svMU93U2cwZ3JOaHpY?=
 =?utf-8?B?RXdXblJOblBWTHhSSHdPbnlhRFdIRHBDWTRpV1BiS3NnUUIvR3pYcXk5Z2Jr?=
 =?utf-8?B?ZmtHdUlRSlFtQ3BVL0prVXQrM0hob2lKZzdXUlJEaFpoQXdtZERUZXMvYzFR?=
 =?utf-8?B?WXhRVVJuVW91NmV2TTNZT2NndEk2L3pGUmo3UGU0M1dwWDBaVUhla0ZWVFhL?=
 =?utf-8?B?Q2t4eStwT2FSalc5eGgya2VWZkRFSlMvRkwrZ3VMWTlsdEs1VCtLUXJSZDVF?=
 =?utf-8?B?Nkd0dVdxT2dOazRKN1FjYzdKdHZJdDlRTyttNHNUeklrNElkMHcwYmpIMldC?=
 =?utf-8?B?a1RhNUlqd0hHeTNDNWlqUXZieVNIc3pwdVV6MUJUM1VQZU00SXljeFIvbno3?=
 =?utf-8?B?M3kzMGtLd1crWitwUkJsOHAwRGxrQTN0ZW9kbTY1bmE1N1Y0a2pDZkg2RXZT?=
 =?utf-8?B?SlMrbkpGUEg4VEFkYlNQVjFVK1YwTEEvZFRMQWcwbmxBRllqdnB1U0RaNUF1?=
 =?utf-8?B?MjlKeXFpOCs2L3ZnYTgzYmZlM1FRME9JRXE5T0pvNEE5TXl3blFucHJnRVhD?=
 =?utf-8?B?ZGFjN0dWNXFMSG1xZys3c1I5OEpjWWQzZWE1bkRMcUdoWXFRbWY0bitTdjVq?=
 =?utf-8?B?RUZqMlFJWFY2dXpGampCV3N0bkNXODh5Vk9IcGxEcUVYYTlQSzlBa1Y4djNZ?=
 =?utf-8?B?OUZ5N1Y1NFBuWG5DVFZhNTdVZ0NJN05oRkV1QUkwd1U5ZE1nNFAvR2xyK3Nk?=
 =?utf-8?B?dFQ1bVc1VXRvTGpCM09sdFQraG0xNXoxMGllSUNjc3Zad05wYksrNXFxVHc1?=
 =?utf-8?B?b1ZPR3I1ckY5Nm1sZkdZeS9nQ2JyUzc0UGlmTzlic00zZWtBRkdjWGQzOTA3?=
 =?utf-8?B?Q3J6Smc2Z1ZhNzJ0RmlYdmZyTjlhZzBOT3pHVzZ4dktLWlNwY2JzQWw5Znhi?=
 =?utf-8?B?aGlqS0dBekZpblZYRW5oc0dlckpPR0l3eW9HcU1kQUdCY2J2ZEIyT2tnL0Rs?=
 =?utf-8?B?Ykd0dStNRW1GUzNqSXVpOTFyQWpYL2lGL1FrOFltOGRkczZ4cmZlVURqSVVG?=
 =?utf-8?B?dWRpd21RbWh4dFBYcDVwbHhCUUV0NXJnU0NsMGdqOElmZWEzQzRxUnJ4aVZE?=
 =?utf-8?B?SWoyOGV2dEcrMTVZaDdKN293bkUwMzkzcVNGUk5DcmNLbWJoOTdEbjFWM2tL?=
 =?utf-8?B?NURzWU00OGNrWGlhTDFvWjcxODc4VFhHcDhZKzBTTTRWSVU0bURKTy8zRm13?=
 =?utf-8?B?VEY0RHBTRE9rK0E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e0a4af4b-ee42-4de7-ce1f-08d9c93be06f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 13:22:05.8449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1763
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 13:22:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160023



On 27.12.21 13:54, Stefan Herbrechtsmeier wrote:
> Hi Konrad,
> 
> Am 25.12.21 um 21:43 schrieb Konrad Weihmann:
>> What I so far don't really get is why increase in parsing time is such 
>> a big deal.
>> I admit when we're talking about npm it's some kind of a drastic 
>> increase in recipes one would have to maintain, just because some 
>> random project decides to use a trillion dependencies instead of 
>> writing two or three lines of code more.
>>
>> Still I come to think this might be actually beneficial, as it shows 
>> how broken npm is from a distribution perspective - as it may be that 
>> some users actually start to access the situation when they are 
>> actually aware what monstrosity of a dep tree they are inheriting by 
>> just a single npm module.
>>
>> So this is mind - and I don't want to sound radical - I would rather 
>> abandon npm and go support in core than to sacrifice closing the one 
>> main loophole in core that is preventing true accessibility at the 
>> moment.
>> Which is uncontrolled fetching outside of the fetching task, as this 
>> invalidates everything you will get in the end in terms of licensing, 
>> quality reports that haven't been done as part of the build and even 
>> CVE checking becomes pretty much worthless if one is allowed to inject 
>> random code on the fly into the build - and in the end everything that 
>> can't be assessed outside of the build is pretty much non-existing for 
>> most of the assessments I had to work with.
>>
>> In the past I showed that npm and go can be made to work with these 
>> principles, even if they would introduce a different way of working 
>> and maybe the need for better tooling - *but* they can work with how 
>> oe-core works at the moment - to the expense of parsing time - and 
>> that's pretty much it from my point of view.
>>
>> Still the gains outweigh it by far in my opinion, as it would make all 
>> of that accessible by common tooling already in place - including true 
>> reproducibility and builtin quality reports.
>>
>> BTW I don't think rust and therefore cargo is heavily affected by it, 
>> as the cargo to bitbake scripting works kind in the way I would 
>> imagine for npm and go too - so far just npm and go are really really 
>> bad to handle in this case.
>>
>> I'm happy to help on such scripting and tooling, but I don't see much 
>> worth in either accepting the fact that "modern languages" have to 
>> include some not validatable "magic" (which then would mean allowing 
>> uncontrolled network access) or working around the fact that a 
>> trillion dependencies is still a trillion dependencies no matter how 
>> you put it ( :) )
> 
> I fully agree with you and would be happy to add a 'recursive' option to 
> devtool / recipetool to create multiple recipes on the fly instead of 
> one big recipe with more than 100 different projects inclusive duplicate 
> and different compatible versions.

That, yes - and a split between sources and recipes, I guess, is needed.
Like creation of a sharable inc-file for definition of sources (SRC_URI 
and dependencies) in addition to the actual recipe itself.
(One could also think about versioned inc-files here)
Nevertheless this is needed to untangle go (luckily npm is much more 
straight forward in this sense).

Like one has a go module "a" that consists of an inc-file, which defines 
the needed sources for "a" and the needed dependencies in terms of other 
go modules.
And then you have the recipe "a" which just includes this inc file and 
go.bbclass (plus the usual recipe specific meta data).
Now I could build recipe a or I could build any other recipe that 
depends on this go module with a version I could define (or tune).

I know that this isn't something that is not very welcome, as projects 
tend to define their versioned dependencies with lock-files (and every 
language/eco system in their very own way) - still I think the "freedom 
of choice" for a version is something that is a superb feature when 
using yocto - so I personally would rather ignore the maybe 
outdated/wrong information of a project as to not have it (this choice) 
at all.

So if one could make that happen with devtool (maybe using templates or 
so) I think the project would be prepared to fully support these 
"modern" languages without giving up on some of the principles like 
reproducibility

-- to get back to the responses from you other mail --

 > Is it possible to create a recipe for the source and a recipe for the 
 > binaries which depends on the source recipe? In this case the DEPENDS 
 > is always the source package and the RDEPENDS the binary package.
 > A BBCLASSEXTEND could be used to create the source recipe automatically.

That could be worth a shot, as I think this could actually work - 
basically the same idea as above but with recipes instead of inc-files.





