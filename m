Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E55C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 08:28:36 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.7451.1738744101394288545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 00:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=HLAY+GJt;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GWrubvn/e3Ie+DIc4fEFz1jx4wNYEXjWB26TvKvOD5U=; b=HLAY+GJtMAwEp4CK64XiBdbvwB
	ScbEBf+2WtONJJZ+wnkzydM/WtRlEGP86lXfYV1l9GoYGtgs6oz5qIaKML2pR3/WWYJ7X9bxmPMV0
	iNKeh0uOzrZU+oLklthf7DPVIS+iKqMnUnYKelP5/BxGOL01n9q3zszpShbkwVbXE1vX85b5PSANW
	UH//xJWGmLw4Z+LaeeyCURpnifyYerLicslTtPTCbTbn6l/tz08rbs+7d2+JrSnA81dflxfrFtEN+
	RLnUo60iekEQEB7p0y3mTXjQjTln9RI2cVmz70EWY641Hrl3Rvx3EMbd0jloqV51tXNWMN0xEPPwc
	I8eweIsw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <esben@geanix.com>)
	id 1tfalf-0003Gt-1U;
	Wed, 05 Feb 2025 09:28:19 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tfalf-000Jyv-1S;
	Wed, 05 Feb 2025 09:28:19 +0100
From: Esben Haabendal <esben@geanix.com>
To: "Richard Purdie via lists.openembedded.org"
 <richard.purdie=linuxfoundation.org@lists.openembedded.org>
Cc: sean@geanix.com,  Ross Burton <Ross.Burton@arm.com>,
  richard.purdie@linuxfoundation.org,
  "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] image/populate_sdk: Support usrmerge for
 nativesdk in SDK builds
In-Reply-To: <38dd9094715c7221474248449177f995a443eea6.camel@linuxfoundation.org>
	(Richard Purdie via lists openembedded org's message of "Tue, 04 Feb
	2025 14:15:05 +0000")
References: <20250117130851.4055166-1-sean@geanix.com>
	<C02E5327-1001-4CA9-BA15-E063F862C4AA@arm.com>
	<3ot3xt22h6idimbs4xrb4cnojyxeswugitvortqlinqdffb76o@tebg2u26fzin>
	<ygnmol4i3p5iixvkrzw6spgljha7vnx6zjljajqr4q2j6r5mvo@eud25kakycyq>
	<38dd9094715c7221474248449177f995a443eea6.camel@linuxfoundation.org>
Date: Wed, 05 Feb 2025 09:28:18 +0100
Message-ID: <87frksg5i5.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27539/Tue Feb  4 10:37:52 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 08:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210832

"Richard Purdie via lists.openembedded.org"
<richard.purdie=linuxfoundation.org@lists.openembedded.org> writes:

> On Tue, 2025-02-04 at 14:59 +0100, Sean Nyekjaer via
> lists.openembedded.org wrote:
>> Hi Ross,
>> 
>> On Wed, Jan 22, 2025 at 03:04:35PM +0100, Sean Nyekjaer wrote:
>> > On Wed, Jan 22, 2025 at 01:41:11PM +0100, Ross Burton wrote:
>> > > Hi Sean,
>> > > 
>> > > On 17 Jan 2025, at 13:08, Sean Nyekjaer via
>> > > lists.openembedded.org <sean=geanix.com@lists.openembedded.org>
>> > > wrote:
>> > > > Some recipes(systemd) requires usrmerge. Create the required
>> > > > symlinks for `/bin`, `/lib` and `/sbin`, when installing
>> > > > nativesdk
>> > > > packages.
>> > > > Enable the symlink creation by setting the `usrmerge` flag in
>> > > > DISTRO_FEATURES_NATIVESDK.
>> > > 
>> > > This implies that there is some layout dependency between the
>> > > target and the sdk environment. There really shouldn't be, what
>> > > broke to cause you to send this?
>> > 
>> > Hi Ross,
>> > 
>> > In order to build and test our rust programs, we need libudev which
>> > systemd is providing.
>> > We are running our tests with nativesdk.
>> > 
>> > Systemd is requires usrmerge.
>> > 
>> > Hope that explains :)
>> > 
>> > /Sean
>> 
>> Forgot to ask you yesterday at the OE Workshop.
>> 
>> Is anything holding this back?
>
> Yes, there is.
>
> You're using the SDK in a way which it wasn't really intended for and
> we're seeing "feature creep" where systemd's requirements being pushed
> into places they don't really belong.

Applying "usrmerge" to SDK is not a systemd feature as such. In my
opinion, not splitting binaries in multiple bin dirs in general makes
sense for an SDK. And throwing in a simple symlink for making stuff
work, is super innocent in my opinion (for whatever that is worth).

What is so fundamentally wrong or bad in allowing people to create SDK
with usrmerge?

> If systemd was truly "cross", you wouldn't need to force the target
> layout into the SDK.

There is no pushing of target layout into the SDK. The need or desire
for having usrmerge in SDK is independent of target layout as such.
Of-course, if you are having any kind of systemd tools in SDK, chances
are that you are including some systemd features in target rootfs as
well. But in theory, it is really independent.

It is totally possible to for example want to include systemd-repart
command in SDK and not have anything systemd in target rootfs.

> The SDK layout should be independent of the target
> system and this breaks that understanding.

I agree on the former, and disagree on the latter. What Sean is pushing
here allows people to build SDK with a usrmerge style layout. If they
want to use usrmerge layout in rootfs layout or not is a different
story.

> If we accept this patch, how can one SDK work with different init
> systems?

Why should it not work with other init systems?

1. Accepting this patch will not change anything for anyone not
explicity adding usrmerge to DISTRO_FEATURES_NATIVESDK ?

2. Whatever init systems is in rootfs does not rely the use of usrmerge
in the SDK. Adding systemd utilities might, but it is another thing.

> So I don't really feel it appropriate to merge this change, sorry.

What is your general opinion on using usrmerge in SDK layout? Is it
something that is not supposed to be working, or will you accept fixes
for it?

Adding this to local.conf does not produce a working SDK:

DISTRO_FEATURES_NATIVESDK:append = " usrmerge"

Sean is simply trying to fix that.

/Esben

