Return-Path: <stefan@herbrechtsmeier.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF18C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 12:54:17 +0000 (UTC)
Received: from dd43212.kasserver.com (dd43212.kasserver.com [85.13.165.135])
 by mx.groups.io with SMTP id smtpd.web09.25963.1640609655725491170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 04:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: herbrechtsmeier.net,
 ip: 85.13.165.135, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.45] (unknown [94.134.94.51])
	by dd43212.kasserver.com (Postfix) with ESMTPSA id 6BFC943C062A;
	Mon, 27 Dec 2021 13:54:12 +0100 (CET)
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Konrad Weihmann <kweihmann@outlook.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
 <CANNYZj-XR2XzOwnfPTN74mG1QiWcbE96+-iAb-VL7fYta9YA_w@mail.gmail.com>
 <AM9PR09MB4642BDE5CE4D2B51493CC1C1A8409@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <d92dcf7c-604a-2d67-c632-5d093148104e@herbrechtsmeier.net>
Date: Mon, 27 Dec 2021 13:54:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <AM9PR09MB4642BDE5CE4D2B51493CC1C1A8409@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 12:54:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160019

Hi Konrad,

Am 25.12.21 um 21:43 schrieb Konrad Weihmann:
> What I so far don't really get is why increase in parsing time is such a 
> big deal.
> I admit when we're talking about npm it's some kind of a drastic 
> increase in recipes one would have to maintain, just because some random 
> project decides to use a trillion dependencies instead of writing two or 
> three lines of code more.
> 
> Still I come to think this might be actually beneficial, as it shows how 
> broken npm is from a distribution perspective - as it may be that some 
> users actually start to access the situation when they are actually 
> aware what monstrosity of a dep tree they are inheriting by just a 
> single npm module.
> 
> So this is mind - and I don't want to sound radical - I would rather 
> abandon npm and go support in core than to sacrifice closing the one 
> main loophole in core that is preventing true accessibility at the moment.
> Which is uncontrolled fetching outside of the fetching task, as this 
> invalidates everything you will get in the end in terms of licensing, 
> quality reports that haven't been done as part of the build and even CVE 
> checking becomes pretty much worthless if one is allowed to inject 
> random code on the fly into the build - and in the end everything that 
> can't be assessed outside of the build is pretty much non-existing for 
> most of the assessments I had to work with.
> 
> In the past I showed that npm and go can be made to work with these 
> principles, even if they would introduce a different way of working and 
> maybe the need for better tooling - *but* they can work with how oe-core 
> works at the moment - to the expense of parsing time - and that's pretty 
> much it from my point of view.
> 
> Still the gains outweigh it by far in my opinion, as it would make all 
> of that accessible by common tooling already in place - including true 
> reproducibility and builtin quality reports.
> 
> BTW I don't think rust and therefore cargo is heavily affected by it, as 
> the cargo to bitbake scripting works kind in the way I would imagine for 
> npm and go too - so far just npm and go are really really bad to handle 
> in this case.
> 
> I'm happy to help on such scripting and tooling, but I don't see much 
> worth in either accepting the fact that "modern languages" have to 
> include some not validatable "magic" (which then would mean allowing 
> uncontrolled network access) or working around the fact that a trillion 
> dependencies is still a trillion dependencies no matter how you put it ( 
> :) )

I fully agree with you and would be happy to add a 'recursive' option to 
devtool / recipetool to create multiple recipes on the fly instead of 
one big recipe with more than 100 different projects inclusive duplicate 
and different compatible versions.

