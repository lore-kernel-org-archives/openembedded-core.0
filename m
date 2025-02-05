Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01835C02196
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 09:53:57 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.8365.1738749226482330063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 01:53:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=PRwapjP/;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ilK8Y6UpKjOiOlFQxVUV9qk2vH0Nqw+2KF8l2tmjuvk=; b=PRwapjP/bNmlEGk4cLj1jPTWWl
	tC1zbxeG9KC8WGPL+JHUT03DuFmsrsrfvvOpdlsg8dXQ9I6W3RcDieaT4vkNkFx5OIw1EzhxGs5Xi
	27G61mZ1DPAlXOoxtRZ0+iKhv2u6IIGViVzeuIcCmEj5M0oz5bjrr8uNP+DrRqXF+wSKNK9HORs1d
	6c1ohsEL1gQDJP2Aype0020ZFur7VH4TUJz3/EORw6B1GMnZ8XINK7IDM6PtpwERin5AUPlDOxYD/
	yFo2xIik/Qpt2O/tpj1sLb9T/iS3iaEjoB5GxBoNCx7jtenSoZk45YoCdhY/O8+TAZpNKdWeUWvJS
	AScPk+Zw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <esben@geanix.com>)
	id 1tfc6K-000J89-2t;
	Wed, 05 Feb 2025 10:53:44 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tfc6K-000BkJ-2n;
	Wed, 05 Feb 2025 10:53:44 +0100
From: Esben Haabendal <esben@geanix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Richard Purdie via lists.openembedded.org"
 <richard.purdie=linuxfoundation.org@lists.openembedded.org>,
  sean@geanix.com,  Ross Burton <Ross.Burton@arm.com>,
  "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] image/populate_sdk: Support usrmerge for
 nativesdk in SDK builds
In-Reply-To: <f7ca0ce2a482d4b52d55f026bea16ff8475e0b2a.camel@linuxfoundation.org>
	(Richard Purdie's message of "Wed, 05 Feb 2025 09:02:50 +0000")
References: <20250117130851.4055166-1-sean@geanix.com>
	<C02E5327-1001-4CA9-BA15-E063F862C4AA@arm.com>
	<3ot3xt22h6idimbs4xrb4cnojyxeswugitvortqlinqdffb76o@tebg2u26fzin>
	<ygnmol4i3p5iixvkrzw6spgljha7vnx6zjljajqr4q2j6r5mvo@eud25kakycyq>
	<38dd9094715c7221474248449177f995a443eea6.camel@linuxfoundation.org>
	<87frksg5i5.fsf@geanix.com>
	<f7ca0ce2a482d4b52d55f026bea16ff8475e0b2a.camel@linuxfoundation.org>
Date: Wed, 05 Feb 2025 10:53:44 +0100
Message-ID: <87bjvgg1jr.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27539/Tue Feb  4 10:37:52 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 09:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210838

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Wed, 2025-02-05 at 09:28 +0100, Esben Haabendal wrote:
>> "Richard Purdie via lists.openembedded.org"
>> <richard.purdie=linuxfoundation.org@lists.openembedded.org> writes:
>> > > Is anything holding this back?
>> > 
>> > Yes, there is.
>> > 
>> > You're using the SDK in a way which it wasn't really intended for and
>> > we're seeing "feature creep" where systemd's requirements being pushed
>> > into places they don't really belong.
>> 
>> Applying "usrmerge" to SDK is not a systemd feature as such. In my
>> opinion, not splitting binaries in multiple bin dirs in general makes
>> sense for an SDK. And throwing in a simple symlink for making stuff
>> work, is super innocent in my opinion (for whatever that is worth).
>> 
>> What is so fundamentally wrong or bad in allowing people to create SDK
>> with usrmerge?
>> 
>> > If systemd was truly "cross", you wouldn't need to force the target
>> > layout into the SDK.
>> 
>> There is no pushing of target layout into the SDK. The need or desire
>> for having usrmerge in SDK is independent of target layout as such.
>> Of-course, if you are having any kind of systemd tools in SDK, chances
>> are that you are including some systemd features in target rootfs as
>> well. But in theory, it is really independent.
>> 
>> It is totally possible to for example want to include systemd-repart
>> command in SDK and not have anything systemd in target rootfs.
>> 
>> > The SDK layout should be independent of the target
>> > system and this breaks that understanding.
>> 
>> I agree on the former, and disagree on the latter. What Sean is pushing
>> here allows people to build SDK with a usrmerge style layout. If they
>> want to use usrmerge layout in rootfs layout or not is a different
>> story.
>
> Play out this scenario. Firstly, we would now officially have to
> support two different SDK layouts. The alternative is we don't test one
> of them, which would imply one of them is broken some of the time.

What do you mean with "officially" here?

Right now, as I showed you, you can try and add usrmerge to
DISTRO_FEATURES_NATIVESDK, causing SDK to fail.
Are you saying that we should see that as a "feature"?

As it stands now, anyone that for whatever reason comes up with the idea
of adding usrmerge to DISTRO_FEATURES_NATIVESDK will run into this
problem. Is that a good thing?

> As soon as someone wants to include systemd-repart or libudev or one of
> these other tools, we'd effectively force the selection of usrmerge in
> the SDK since it won't build/work otherwise.

No, we would not be forcing users to do that. The tools that are
implemented that way is forcing that choice.

It seems to me that your suggestion is that Yocto users should not be
allowed to use such tools. At least not without out-of-tree patching.
Please correct me if I am wrong.

> We'd at least need to make sure there were clear errors about why the
> configuration wouldn't work.

Do you mean

1. Why adding usrmerge to DISTRO_FEATURES_NATIVESDK won't work?

2. Why tool X, Y, Z won't work as nativesdk tools?

As for the answer to 1, it is because you are not accepting fixes to it.

As for answer to 2, that will be an uphill battle, as more and more
tools are starting to assume usrmerge style layouts. It doesn't matter
if you like it or not, but given the dominance of systemd, it will
happen.

> These two factors combined effectively forces everyone to that layout
> whether they want to use it or not.

Switching to only supporting usrmerge style SDK layout would be fine
IMHO.

> I really don't like imposing design choices like that by stealth.

You/we are not doing that. Somebody else is doing that. If you like it
or not is not really important. It is there.

> To be honest I'd probably agree about only needing one bindir but what
> I object to is doing it via usrmerge and doing it because systemd
> requires it.

Sorry, but that is knowingly making OpenEmbedded a worse tool, without
any benefit. If we switch to having one bindir, placing a symlink to
make stuff work is a no-brainer.

> If we did it, we should do it properly and for example
> skip the symlinks since we control all the code.

Most of the code is only under our control as far as we are willing to
patch it.
I believe reducing the amount of patches to 3rd party software was a
good thing.

> That would probably break systemd too though since that wouldn't match
> it's world view either.

Yes. And a lot of people would not see the benefit in breaking systemd
for the use.

> I've been reluctant to go down the single bindir path before because I
> know who will get all the bug reports to fix. I worry that will be the
> case for usrmerge in the SDK too since people like to apply a bandaid
> to make their specific use case work, then move on. I totally
> understand why but it does make me reluctant to take such changes. I'd
> also mention, how often do I actually say "no" to changes? I can think
> of only two in the current development cycle, both complicating the
> SDK.

Switching SDK to usrmerge looks like a simplification to me.

/Esben

