Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D95FCCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 22:12:52 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2246.1777587166228902733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 15:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G5mE8Lvr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so748221f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 15:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777587164; x=1778191964; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9RiKpw8zDipyTVEeDG6QKdzcVBIKf9DKGbP4S8hPzZc=;
        b=G5mE8LvrzMfTLQfdXuct+APfdUt4W/g83vQo1APhJH0ztRuI4gHG9fEIzzX9m6jmFS
         KlgVBcAF+Pv2QfmttbUsRW3kFycUYkxIAtxNoUBsFv55qzvnI2VNccqvdqK8vYJ7e1WA
         2BQGmpWVqZ3ohhQWRJJczD0u29v/xT4m4WJfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777587164; x=1778191964;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RiKpw8zDipyTVEeDG6QKdzcVBIKf9DKGbP4S8hPzZc=;
        b=F1kHTGAdTng9d3No5O4pRLDBNO474Ia/5JXcHKxzJhcfrZ8eKaE5OIo+/rRIImq4ID
         AQU7c3zTimRM7FElNeWytArMV/2qejh0J4lMO26Ply7aW+1QsQYQXFZnbOWe650C6CW2
         0Cd+Bh1h5kuUjQZlY7JL41eK5km5XfvJZLNb7XDrR2XvnNkjUIIaRiXs5qX9AM/P0kyo
         yyMMZMjojkGcEi2kHOwAPUVoYTm1kPnmpN3B/ewW2Ic69pqNGLMQ4VxqSlC7nI+gYeZi
         xr+vIEs/NoGWxVf3sARPGbRhLRsx3s73wFvNx6cPMVLSkhOnd26PGJfWX3mYYy4pWfyz
         tTaQ==
X-Gm-Message-State: AOJu0YwG3ssnFBeXqoLQhXy9cWfnc28t+bDv9PXk2YBRejwl68/3PWLR
	gxotOkIwowHnR1ahx1vBtSjOeP2fNfvmwibocjHxyj4jO8IAIzFZdE3mjrpX4qqbJOE=
X-Gm-Gg: AeBDieug52MGcPYHd8RLbJZU6X7h3rUnc4x50wGoO0We0kh3N3PKih3MzPFEbWu/ktm
	UnUq7X7k2MvYmYtJfRiFFMGvmTfoHxB+gSZNVNpXVRuuKvR//j0X/EvTbp61yFXwdbYa+NELgrq
	IpaO5Y6csbCKasSL4sHGSm5tdeg9K7W+RCROqefuMOSR1yQC2xfRx8a9lYMfmzmAn5F68ygyePs
	10ulNMh82l0GD+/nhuWY4gKOD8SbZYDhKCYNfwbf7bZf+9QNGRnyuuGQOKGiLc4/vdIRd2gZsUQ
	MqB8sRlyyqwbsy1u1BLLdDeodB6+j7rr6XkCQ6VWuWLLvhf2bFKMkEsz5qIK1iEjFI4dMNfcxUV
	GSrqj98KC9nhxw6TqWxuiwvI2Tx/XP7u7mEJ5U0UMtkbtQjc5ZFw5oH1notlrG3sOxpfXP2Je1H
	N5I6zZbC5nH52CnJ6irVy0rt/YWUfK6XzUK+w4iCvSijOkDJ3Oj9lncpfMhNbnUKg3orBTn/Ou0
	nz1rUCHMJN57Pg6rbL3TpkkyzDbWWC4vCB5Cg==
X-Received: by 2002:a05:6000:2204:b0:43b:3b80:6776 with SMTP id ffacd0b85a97d-44a87b85a50mr698679f8f.30.1777587164589;
        Thu, 30 Apr 2026 15:12:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9943:7451:f7ef:baf8? ([2001:8b0:aba:5f3c:9943:7451:f7ef:baf8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8f51bac8sm651472f8f.16.2026.04.30.15.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:12:43 -0700 (PDT)
Message-ID: <5829500e00f459d2ad76027b2b56662223871795.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/7] Remove 'extend_recipe_sysroot' from
 'BB_HASHEXCLUDE_COMMON'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adam.blank.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2026 23:12:42 +0100
In-Reply-To: <CAFAffzxnk+YvferrFbRO2O_rrz8FvGbgKAmGewq0Rf=Mxye-cA@mail.gmail.com>
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
	 <64eb162c5c22721ff9d11d9c1f0d6c15aea3640a.camel@linuxfoundation.org>
	 <CAFAffzxnk+YvferrFbRO2O_rrz8FvGbgKAmGewq0Rf=Mxye-cA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 22:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236190

On Thu, 2026-04-30 at 17:15 +0200, Adam Blank via
lists.openembedded.org wrote:
> >=20
> > which is a lot of non-trivial change and a lot of extra data in the
> > sigdata file.
> >=20
> > Do we really want all of this data to be added into every signature
> > computation?
> >=20
> > Are we 100% sure that add the newly added variable dependencies are
> > "safe" and won't trigger sstate cache reuse issues?
> >=20
>=20
>=20
> Well, obviously such increase in the visibility of dependencies is
> not a comforting or welcome thing, but let's not forget, that those
> dependencies truly are there :-)
> I'd ask the opposite question: given the extent and nature of the
> relations exposed by this change, do we want to keep wholesale hiding
> them with the current implementation?
> Or in other words, are those particular dependencies (stemming from
> 'extend_recipe_sysroot') so irrelevant for the overall signature and
> sstate management, that it is justifiable to keep ignoring them in
> such a unique way and on such a fundamental level?
>=20
> Unless it is truly a desirable situation and the whole subject can be
> dismissed, what would be the recommended way to tackle it?

I'm mentioning this as I wanted to explain the delay, and why I'm
hesitant about this.

Not every piece of build information is put into the hashes and we
previously made a conscious decision that extend_recipe_sysroot and
anything hidden behind it were out of scope for the hashes. Looking at
at the list of new dependencies, I can see why we did that.

Does having these dependencies help the average user? or does it waste
space in the sigdata files and complicate the dependencies? Right now
I'm torn and I'm not sure which way we should proceed.

I should also mention that in testing, we've had sstate mismatch issues
too, e.g.=C2=A0
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3747

We don't know which of the patches under test are at fault for that and
the errors are non-specific, just that sstate wasn't matching. It could
be something in this patchset, or it might be something else, we just
can't tell and don't know.

Cheers,

Richard





