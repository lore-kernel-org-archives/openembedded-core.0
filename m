Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD95C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 10:30:07 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.9032.1738751399515497384
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 02:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=illL8ckA;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Jy71CJt4fAHhm5CtVfMsEaWgCgjNhnnRlStrjzAJfX8=; b=illL8ckA0kea33MzJ/BwDus4Az
	QSJnjvVcRUBeJ2RZh4McscgbdH/BHmWfHsw3SWoZoyi8zg2oA2GMjj5IDl2Qx8MVurfh3p6cPWtlL
	Tq2CU5A7T6JhQDpq291Y7LsGqEL3nCafgb+VwpInJgr0pJO8vTW5WSMlFSSZdzNm/J3eF3el8PaSB
	hznByjSwRw0hWjhR6EgAQR5MgtduZUHh7OUbKL+uVFGpyeGkCQN95c+DM0IGeKCt9h3/UghjGSZ1A
	qW1U8ZLuJTftvVVBfx58qU1aAtfK2yQjhWcJ2WGNNSr/YKlaUuMrYv30QuEusuIK090Xm0Wjg/gWY
	YfPNv6jQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <esben@geanix.com>)
	id 1tfcfN-000Pnc-08;
	Wed, 05 Feb 2025 11:29:57 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tfcfM-000HPx-2G;
	Wed, 05 Feb 2025 11:29:56 +0100
From: Esben Haabendal <esben@geanix.com>
To: "Richard Purdie via lists.openembedded.org"
 <richard.purdie=linuxfoundation.org@lists.openembedded.org>
Cc: richard.purdie@linuxfoundation.org,  sean@geanix.com,  Ross Burton
 <Ross.Burton@arm.com>,  "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] image/populate_sdk: Support usrmerge for
 nativesdk in SDK builds
In-Reply-To: <4e7e8eea32f307dd28e5bec216a1b149e42ba5f3.camel@linuxfoundation.org>
	(Richard Purdie via lists openembedded org's message of "Wed, 05 Feb
	2025 10:10:04 +0000")
References: <20250117130851.4055166-1-sean@geanix.com>
	<C02E5327-1001-4CA9-BA15-E063F862C4AA@arm.com>
	<3ot3xt22h6idimbs4xrb4cnojyxeswugitvortqlinqdffb76o@tebg2u26fzin>
	<ygnmol4i3p5iixvkrzw6spgljha7vnx6zjljajqr4q2j6r5mvo@eud25kakycyq>
	<38dd9094715c7221474248449177f995a443eea6.camel@linuxfoundation.org>
	<87frksg5i5.fsf@geanix.com>
	<f7ca0ce2a482d4b52d55f026bea16ff8475e0b2a.camel@linuxfoundation.org>
	<87bjvgg1jr.fsf@geanix.com>
	<4e7e8eea32f307dd28e5bec216a1b149e42ba5f3.camel@linuxfoundation.org>
Date: Wed, 05 Feb 2025 11:29:56 +0100
Message-ID: <877c64fzvf.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27539/Tue Feb  4 10:37:52 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 10:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210840

"Richard Purdie via lists.openembedded.org"
<richard.purdie=linuxfoundation.org@lists.openembedded.org> writes:

> On Wed, 2025-02-05 at 10:53 +0100, Esben Haabendal wrote:
>> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>> 
>> > On Wed, 2025-02-05 at 09:28 +0100, Esben Haabendal wrote:
>> > > "Richard Purdie via lists.openembedded.org"
>> > > <richard.purdie=linuxfoundation.org@lists.openembedded.org> writes:
>> > > > > Is anything holding this back?
>> > > > 
>> > > > Yes, there is.
>> > > > 
>> > > > You're using the SDK in a way which it wasn't really intended for and
>> > > > we're seeing "feature creep" where systemd's requirements being pushed
>> > > > into places they don't really belong.
>> > > 
>> > > Applying "usrmerge" to SDK is not a systemd feature as such. In my
>> > > opinion, not splitting binaries in multiple bin dirs in general makes
>> > > sense for an SDK. And throwing in a simple symlink for making stuff
>> > > work, is super innocent in my opinion (for whatever that is worth).
>> > > 
>> > > What is so fundamentally wrong or bad in allowing people to create SDK
>> > > with usrmerge?
>> > > 
>> > > > If systemd was truly "cross", you wouldn't need to force the target
>> > > > layout into the SDK.
>> > > 
>> > > There is no pushing of target layout into the SDK. The need or desire
>> > > for having usrmerge in SDK is independent of target layout as such.
>> > > Of-course, if you are having any kind of systemd tools in SDK, chances
>> > > are that you are including some systemd features in target rootfs as
>> > > well. But in theory, it is really independent.
>> > > 
>> > > It is totally possible to for example want to include systemd-repart
>> > > command in SDK and not have anything systemd in target rootfs.
>> > > 
>> > > > The SDK layout should be independent of the target
>> > > > system and this breaks that understanding.
>> > > 
>> > > I agree on the former, and disagree on the latter. What Sean is pushing
>> > > here allows people to build SDK with a usrmerge style layout. If they
>> > > want to use usrmerge layout in rootfs layout or not is a different
>> > > story.
>> > 
>> > Play out this scenario. Firstly, we would now officially have to
>> > support two different SDK layouts. The alternative is we don't test one
>> > of them, which would imply one of them is broken some of the time.
>> 
>> What do you mean with "officially" here?
>
> Tested on the autobuilder. Taking that patch would be taken as a sign
> we planned to support that workflow.

Ok. So by official, I guess you mean implied. Fair enough.

>> Right now, as I showed you, you can try and add usrmerge to
>> DISTRO_FEATURES_NATIVESDK, causing SDK to fail.
>> Are you saying that we should see that as a "feature"?
>
> You can do lots of things. If we take patches fixing things it does
> imply that workflow becomes more supported.

Probably, yes.

> If someone files a bug about usrmerge in nativesdk, are you saying I
> can still close it as "not supported" even after I merge patches fixing
> it?

Is it officially not supported?

How can a developer know that?

>> As it stands now, anyone that for whatever reason comes up with the idea
>> of adding usrmerge to DISTRO_FEATURES_NATIVESDK will run into this
>> problem. Is that a good thing?
>> 
>> > As soon as someone wants to include systemd-repart or libudev or one of
>> > these other tools, we'd effectively force the selection of usrmerge in
>> > the SDK since it won't build/work otherwise.
>> 
>> No, we would not be forcing users to do that. The tools that are
>> implemented that way is forcing that choice.
>> 
>> It seems to me that your suggestion is that Yocto users should not be
>> allowed to use such tools. At least not without out-of-tree patching.
>> Please correct me if I am wrong.
>
> I'm saying that out of tree patching in this case is definitely
> preferable.

Ok. I guess that is your position then.

>> > We'd at least need to make sure there were clear errors about why the
>> > configuration wouldn't work.
>> 
>> Do you mean
>> 
>> 1. Why adding usrmerge to DISTRO_FEATURES_NATIVESDK won't work?
>> 
>> 2. Why tool X, Y, Z won't work as nativesdk tools?
>> 
>> As for the answer to 1, it is because you are not accepting fixes to it.
>> 
>> As for answer to 2, that will be an uphill battle, as more and more
>> tools are starting to assume usrmerge style layouts. It doesn't matter
>> if you like it or not, but given the dominance of systemd, it will
>> happen.
>
> We should just do what systemd says and drop support for musl, sysvinit
> and anything else systemd says?

No. And you are being completely unreasonable here.

We are discussing placing a single symlink in the SDK, and know you are
implying that this is a part of a greater plan for removing support for
musl and sysvinit.

Sorry, but that is just being bully.

>> > These two factors combined effectively forces everyone to that layout
>> > whether they want to use it or not.
>> 
>> Switching to only supporting usrmerge style SDK layout would be fine
>> IMHO.
>> 
>> > I really don't like imposing design choices like that by stealth.
>> 
>> You/we are not doing that. Somebody else is doing that. If you like it
>> or not is not really important. It is there.
>
> We don't have to just accept it.

Are you imaging that by refusing to support systemd tools in
OpenEmbedded SDK images that systemd is going to change anything? I am
pretty sure you know that is not going to happen.

So the only that loose out on this approach is loose out is OpenEmbedded
project and users.

>> > To be honest I'd probably agree about only needing one bindir but what
>> > I object to is doing it via usrmerge and doing it because systemd
>> > requires it.
>> 
>> Sorry, but that is knowingly making OpenEmbedded a worse tool, without
>> any benefit. If we switch to having one bindir, placing a symlink to
>> make stuff work is a no-brainer.
>
> I very strongly disagree.
>
> The point is that OE supports customisation and layout is one of those
> things. We use layout customisation to make the SDK work at all.
> Removing/limiting the ability to customise undermines one of OE's key
> values. Even chipping away at the edges of that will ultimately
> undermine it.

In this case, you are the one that refuses the option of customizing it
with the usrmerge feature.

And in this case, the SDK is not working, and allowing customization
with usrmerge is a way to fix that.
Refusing that, without suggesting any alternative solutions are not
productive IMHO.

>> > If we did it, we should do it properly and for example
>> > skip the symlinks since we control all the code.
>> 
>> Most of the code is only under our control as far as we are willing to
>> patch it.
>> I believe reducing the amount of patches to 3rd party software was a
>> good thing.
>
> It is, but there is also sometimes a need to patch things.

Of-course. But this might not be such a time, as OpenEmbedded really is
flexible enough to be able to support something so innocent as usrmerge
in SDK.

But I guess you have decided that we will have to do that in a way so
that will not be shared with other OE users falling into the same trap.

/Esben

