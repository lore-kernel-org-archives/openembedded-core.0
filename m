Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6463CC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 18:31:49 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web08.876.1645209104809623332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 10:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2012061000 header.b=jVp1SZQy;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 21IIVdZU014113
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 19:31:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1645209100;
	bh=rM1+WzmPmkqoJqS9/f7PwKdw8mn5e2hwK3XjURbkMd8=; l=4539;
	h=From:To:Cc:Subject:References:Date;
	b=jVp1SZQyUW42URuRQhvj2hHaCePa/QrZ2oW0GfFfNA//nSRhjTcZQS0hh+8p+UQP2
	 ubP8uehnr3lV4NLOBpX6j6wIvP22fXAWL4OYe9KOAmHsFO7KARa2ojPwdsRAIKE2KA
	 WmCSHLypK6exhkSUoA9uI/9lFMCBzCessfZOFKEw=
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 21IIVbW0019564
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Fri, 18 Feb 2022 19:31:37 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 51FB68493D; Fri, 18 Feb 2022 19:31:33 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
 (ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 21IIVVkh014019
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 18 Feb 2022 19:31:31 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
 4.94.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nL82V-001cnD-40; Fri, 18 Feb 2022 19:31:31 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Saul Wold <Saul.Wold@windriver.com>,
        openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] convert-variables: Script for Inclusive
 Language variable renames
References: <20220217003248.581903-1-saul.wold@windriver.com>
	<ly35kg9tsz.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<caf357e342ad33e0117af76244ba13fcd804f4fc.camel@linuxfoundation.org>
	<lyv8xc8d2o.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1e1bc174431d443b20d0c81f71b46cc62d447948.camel@linuxfoundation.org>
Date: Fri, 18 Feb 2022 19:31:31 +0100
Message-ID: <lyee4081rw.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 18:31:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161950

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> > > > This script searches for a list of variable that have been renamed
>> > > > and converts them to their more descriptive names.
>>=20
>> s/descriptive/politically correct/
>
> We did try and make some of the names better describe what the variables
> do and make the variables more consistent.
>
> For example, a reference to HASHBASE was changed to BASEHASH which
> better matches every other reference to that thing in the code.

When you really feel that this Yoda style naming must be fixed; then ok.
But for me, the gain would not be large enough to break the api.


> The BB_ENV variables were also traditionally very confusing. Once you
> know, you know but for new users they weren't great.

The new naming is much more confusing.  While this kind of operation
(exclude or include something) was previously named by "whitelist" +
"blacklist" more or less consistently, it is scattered around across
multiple variants now.

Especially for the hash related lists, searching for "whitelist" or
"blacklist" in the sources revealed often the right way how to do
things.


> Also see the discussion about the license variable issues. I'm very
> consciously blocking the "simple" change as I want to see things
> improve.
>
>> Variable names were perfectly readable.  A change should make things
>> better, not worse.
>
> See above, there are at least some changes which do. I'm sad you don't
> agree.

ok; some changes are ok.  E.g.

| "PNBLACKLIST":"SKIP_RECIPE",

because former name is misleading (it is not really a list/set but has
some specially addressing by varflags).


>> Why is the rename done at all?  It makes the product just worse due to a
>> less usable api and because it causes a lot of work for the users of the
>> api (I shudder when I think about updating my CI to work with new and
>> old branches).
>
> For better or worse some of the terminology we have is offensive to
> some people.

Is there any real-world evidence that this is really the case?  Especially
the embedded sector is filled with blacklisted terms (i2c master/slave,
spi mosi/miso) so I do not think that somebody is really offended.

In the opposite, I feel offended when such changes are labeled as
(technical) improvements ("more descriptive names").


> Obviously (and sadly) there will probably always be some element of
> something which someone could be offended by but these issues have
> come under a particular spotlight.=C2=A0People with far more experience of
> this than us have produced guidelines on the key issues,

In my experience, such people have too much spare time and invented a
problem only to come up with a solution later.


> We do have people wanting to try and improve things. Projects do
> need to be open to and able to change. If we don't try and take this
> input and help those people make such changes where appropriate,
> we'll just alienate and frustrate more users even if those users
> were not personally offended by the language, a kind of "rot" can
> set in to our community. I do not want to see that

I see a much higher risk when significant changes are done due to
political reasons rather than technical ones.


> I have advised caution all the way through this. Should the project
> get this wrong, the potential for negative social media feedback
> against the project is huge.

Does such negative social media feedback really exist resp. does it
exist in channels that are relevant to us?

Linux kernel has not "cleaned" its api either and just said that future
development should avoid certain terms. I can not remember any negative
feedback.

Just do the same here: avoid some terms in future development and when
there are really technical reasons to touch existing variables, then
rename them.


> For me personally, there is also a huge risk should I "misstep" in
> handling this. The potential to break things for users is also really
> high, I realise that. I have done a lot of work to try and make sure
> issues are at least clearly reported to users with some idea of how
> to resolve them so the transition is less painful. I do have some
> experience of making changes to the project and am trying my best to
> use that to our benefit.

You are doing a great job, but the project evolved beautiful over the
last >15 years with the old identifier and I can not remember any
complaints about them.



Enrico

