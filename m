Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBF6C7EE32
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 10:06:41 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.4700.1750932391688113982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 03:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S9eXMMwg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1292556f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750932390; x=1751537190; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b/zo02LGbwaLHbcME7UXj9Pf0Dk/ElUkIIZjYboywUw=;
        b=S9eXMMwg3v7ofH02vLwMT8QTNhV5JMzTmsA1hLdh9eneM3uxSahesPTsNHAiPle3hM
         QIEA0/tdk75yYFozvpjvNF38hHODCWbEW0wmkYXVJN+kGKzB9cZ+/FbL8DeV4I88ATcR
         QfyQSY+BfD/v3gqKt0diW4mdwQRVmdZv7v0Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750932390; x=1751537190;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/zo02LGbwaLHbcME7UXj9Pf0Dk/ElUkIIZjYboywUw=;
        b=FhbFz+8HQEoB96ex3CV9XOLykPhU7Hs+rEh/armZqMJsxXv7YnNu6D93qEcWJSPR3L
         TVQm+zzps7t5ROKdl/BXu7RTUJpVhNxXpr4YP6x0fBph8/lHuPBLfZsrgehnPAx9Ex5N
         CHaGkHb1qNcJHBUAFanAtpGqgcNWPINhD8Yhu+/GGOfrJSKQSOU6nJjjkFw4rh7D8uwx
         guRcZsNn0yXWTh64dcgAFiIWP4CBZ9xYIWTi9z0HVmfEGUCxoRtHLk3oOuf080OndAip
         yQZKFJzHDH2kTkxxPtwfK+oC09U2hxqmv9lYy7HpSPIOGRZhRpkwlNUmkiF11AIakzBE
         aiyg==
X-Gm-Message-State: AOJu0YzVSXxSdpLQveg8ELkexX2XMtM37dQS6VwonyezggDvGYIOrJzc
	iAWmC6aFaoWpMKHqhAb3niMT418n+IDwedyRhBUpY5+j9f0Di1REHj3rSRrQZwZzzhM=
X-Gm-Gg: ASbGncuyt0jumbanNu4J1dRVkiRC8BG9Ax+vIejtr2oddG1cwkZGP0jd2S9APeogWVs
	IhEVtrT1c71N2A6VgCqw0RqKYeQkp8vQLj1HiB3s/Mu4STBs/8hT0lOxc8+2RTDFY3+tfMyjTrC
	tHBCTdNFNQpLhehtqfbQAkCA18FeI8F8NNP7En2gr1kBKgS42K0l0wpqr1f16tIF8iWsmO0s5dF
	i5w7izGAzmYdJMIqMbXJyLj+qful9C6RzT6Q2KotiBr42G/Pwz7p6d0wsFXLdOK0RnFyaF/Wgxm
	xueP7/O1FOOphfqW6JSJg2BM9K3karDjV8ivk8FdXu1MyBG+nie1nCLB+1TzZpUH2TWx7+UuTdn
	03YwhsCN/AVDuIjKTUAoATOSV926bGBD6FeJJwFlcDdBfhWVzKpaMaNZ0Uj+YNQ==
X-Google-Smtp-Source: AGHT+IELU3qqOgky1eH+5jr5EduAWjF9wRg/cOTHooRAdaF92es9JygdU+tpGD7cWXu0YBBGDf4LAQ==
X-Received: by 2002:a05:6000:200e:b0:3a5:7991:fd3 with SMTP id ffacd0b85a97d-3a6f310df1emr2334241f8f.11.1750932389834;
        Thu, 26 Jun 2025 03:06:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3006:882d:8520:75c1? ([2001:8b0:aba:5f3c:3006:882d:8520:75c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805d342sm6917282f8f.21.2025.06.26.03.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 03:06:28 -0700 (PDT)
Message-ID: <f2e0550f251683ed085ac7abaadbaa2f9aea04a2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate.bbclass: apply proper umask when
 fetching from SSTATE_MIRROR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jun 2025 11:06:27 +0100
In-Reply-To: <87tt43xaev.fsf@prevas.dk>
References: <20250606093905.2715221-1-ravi@prevas.dk>
		<0088740e272e5c9a1181de3f258c7ace3f7f3e17.camel@linuxfoundation.org>
		<87ikkuzuf6.fsf@prevas.dk>
		<5be4f30a9368b56993590b8ebe5d6d5120b7c15e.camel@linuxfoundation.org>
	 <87tt43xaev.fsf@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 10:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219341

On Thu, 2025-06-26 at 08:51 +0200, Rasmus Villemoes wrote:
> On Wed, Jun 25 2025, Richard Purdie <richard.purdie@linuxfoundation.org> =
wrote:
>=20
> > On Tue, 2025-06-17 at 09:41 +0200, Rasmus Villemoes wrote:
> > > On Sun, Jun 15 2025, "Richard Purdie via lists.openembedded.org" <ric=
hard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > >=20
> > > > On Fri, 2025-06-06 at 11:39 +0200, Rasmus Villemoes wrote:
> > > > > From: Rasmus Villemoes <ravi@prevas.dk>
> > > > >=20
> > > > > Currently, files and directories created under ${SSTATE_DIR} when
> > > > > fetching from an sstate mirror are not created with group write,
> > > > > unlike when the sstate artifacts are generated locally. That's
> > > > > inconsistent, and problematic when the local sstate dir is shared
> > > > > among multiple users.
> > > > >=20
> > > > > Wrap the fetching in a bb.utils.umask() context manager, and for =
simplicity
> > > > > move the mkdir of SSTATE_DIR inside that.
> > > > >=20
> > >=20
> > > > I appreciate this sounds crazy but this is causing some kind of
> > > > regression being reported in our automated testing. Specifically,
> > > > running:
> > > >=20
> > > > oe-selftest -r sstatetests.SStateCreation -j 1
> > > >=20
> > > > fails for me locally with this applied, as it does here in CI:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/=
1767
> > > >=20
> > > > Worryingly, if I run:
> > > >=20
> > > > oeselftest -r sstatetests.SStateCreation.test_sstate_creation_distr=
o_specific_pass -j 1
> > > >=20
> > > > i.e. a specific failing test, that fails even without the patch
> > > > applied, and it shouldn't so there is something odd going on here e=
ven
> > > > before the patch.
> > > >=20
> > > > We're going to have to get to the bottom of this before I can merge=
 the
> > > > patch.
> > >=20
> >=20
> > I finally got to the bottom of the issues. NATIVELSBSTRING handling was
> > causing weirdness when running the tests which was than masking other
> > problems. Once I fixed that, I could unravel the problem with badperms,
> > which was just broken as you mentioned. In the end I cleaned up the
> > umask handling there using bb.utils.umask and combined some of the test
> > cases for clarity too. I've sent a couple of patches.
> >=20
> > This should mean your patch can now merge as it is correct IMO and the
> > tests were just broken/breaking.
>=20
> Thanks for taking the time to work through this. I was hoping the needed
> fixups were small enough (or localized enough) that my patch, along with
> those fixups, could be eligible for walnascar. What's your take on that?

A quick poll of a few developers on the review call as we discussed
these changes suggested it would be a candidate to backport.

> I got into this because we currently have to set BB_DEFAULT_UMASK =3D
> "002" to get the sstate dir perms right on our shared build
> infrastructure, but it turns out that that cure is worse than the
> disease as I wrote here:
> https://lore.kernel.org/openembedded-core/87wm9r1wcx.fsf@prevas.dk/

I have been meaning to look at that a bit. We haven't really supported
changing the overall default umask as the potential for unintended
changes is significant. It could probably be made to work but someone
would need to put a lot of development work in.

Cheers,

Richard


