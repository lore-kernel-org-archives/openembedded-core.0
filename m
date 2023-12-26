Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D618CC46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 08:59:10 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.77444.1703581144135785778
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 00:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KwiNtsIK;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so5006689e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 00:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703581142; x=1704185942; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDL9Y2GgmUz4bht84A+6vDGB8HkssvlWMY8utfCWEuQ=;
        b=KwiNtsIKa2KeCXr2NJij3y5n5CgkhoUivuBBcpu3W8Qbl/q8dc8QkL3FaXOKD6YSUi
         3DsDJo6o6MAKPZSkT6uJS9C1dkmGprRUxXoS2BtqQFmReL+2Cwn2zTQ4umRh42M7poJl
         VPNKh4v20GBn9Gs6xHjYwVTFvCmjnSmGJdLU3AzQbXoB8i7g7F6eQgNYZR0BjQWp2oT/
         L9/Tkf2ulveAoFANuLa01HuhM7QLeIlfZS4kI3Omf2ZwzBRyP2WPFdnGUEzvzjRA/EoD
         r6Mq0RSL8TCUOVIEYjMpfpHGLqglVnw3n4weyIjU5me05QxTcTYZx3+EHvfhHHU1O7Rb
         Kw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703581142; x=1704185942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDL9Y2GgmUz4bht84A+6vDGB8HkssvlWMY8utfCWEuQ=;
        b=FT3wLXG+LweU9u6CPWlG68iBZB+ybfRCKP8POLUh34Ua43wtq/FiUmTLXs8+/95Fbj
         5XED30pBQ0E5w7cHT0W4aKTRe0PnYiHI4bQe3DY2wPy3rVuqILCk29u8Ci60susSTQT1
         WOiDdIRJpT6DBUFXg36WG+N4mlV9HYnkgi584xDBYVcbPS+d1TXiF1HaK6zgL4cBGvqS
         ClMwENmITpHmnHdXbc9qY+DsMLJD54JqPI4R+JCrLVgWNuzKpVVNlwnubKjUyLNprDA+
         DRPHzZtUQQD3t5WvYVY8qVb4vyvUR6x1/DxeUF75XLQjXf7lWC0EuRrb/riyxagzERH0
         JZaw==
X-Gm-Message-State: AOJu0YxxisAvrdRzb44+brjZOoD9y+wGRZZsA0OrjjQTYXGOhYbuL9Y+
	HGl/SUu+8TseUW4DBXjSLLutvUfp5pc+C2GcTwg=
X-Google-Smtp-Source: AGHT+IFvtpYqgHTOrtF1GsVTxzYjFgddecaXGPP8GrzzG23ssVLdF11WIwKM31jEryG82U+MJUC8KIal/IpiDDZ/fLY=
X-Received: by 2002:ac2:5f88:0:b0:50b:e713:574d with SMTP id
 r8-20020ac25f88000000b0050be713574dmr2552347lfe.75.1703581141795; Tue, 26 Dec
 2023 00:59:01 -0800 (PST)
MIME-Version: 1.0
References: <20231224230934.831-1-alex.kiernan@gmail.com> <17A406727F961131.18684@lists.openembedded.org>
 <40a32888473597abf1b65d85e46efde7ce153d54.camel@linuxfoundation.org>
In-Reply-To: <40a32888473597abf1b65d85e46efde7ce153d54.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 26 Dec 2023 08:58:49 +0000
Message-ID: <CAO5Uq5Rq4jZrjp8tv3MDcdhXQEUgEOnsev4GZOKFPXB1zO1DJA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 0/6] Stepwise rust upgrade 1.71.1 -> 1.74.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Frederic Martinsons <frederic.martinsons@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>, 
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>, "Shinde, Yash" <Yash.Shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 08:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192908

On Mon, Dec 25, 2023 at 10:02=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2023-12-25 at 08:40 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Sun, 2023-12-24 at 23:09 +0000, Alex Kiernan wrote:
> > > This is the 1.74.1 rust series rebased to include a revert of
> > > https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f27=
7704d1d08a8ec
> > > which I'm pretty sure is what's causing our filename churn. I've chec=
ked
> > > 1.72.0 and 1.74.1 for the absvdi2.o intrinsic (one of many intrinsics
> > > which had the issue) and in both cases we're not generating the dirna=
me
> > > based prefix - hopefully that means that the interim commits are fine
> > > too, if not we can do the step back through the commits to find the n=
ext
> > > issue.
> > >
> > > I've dropped the zvariant tests as upgrading it isn't useful (since i=
t
> > > no longer includes git crate dependency) and spurious oe-selftest
> > > failures aren't helpful. I guess we need to include either something
> > > synthetic which tests git crates, or pull in
> > > https://github.com/jthornber/thin-provisioning-tools/ from
> > > meta-openembedded which includes a live example (though who knows for
> > > how long!)
> > >
> > > Assuming this does actually fix the reproducibility issue, I'll look =
at
> > > how we fix the issue properly, rather than just reverting the commit
> > > which I think is our problem, but I'd like to try and get us back on =
the
> > > rust release train if we can!
> > >
> > >
> > > Alex Kiernan (6):
> > >   meta-selftest: Drop zvariant recipe
> > >   rust: Upgrade 1.71.1 -> 1.72.0
> > >   rust: Upgrade 1.72.0 -> 1.72.1
> > >   rust: Upgrade 1.72.1 -> 1.73.0
> > >   rust: Upgrade 1.73.0 -> 1.74.0
> > >   rust: Upgrade 1.74.0 -> 1.74.1
> >
> > Sounds like a good plan, I've started a reproducibility test:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4142
> >
> > With zvariant, we might be better replacing with a synthetic example
> > for testing purposes?
>
> That build went green so I ran an a-full to double check and check
> everything else:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6374
>
> Curl ptest warning was the only issue (unrelated) so it also looks
> good.
>
> Looks like you might have tracked down the issue, nice work! :)
>
> Should I merge this as is or is there something we should do first now
> we know where the issue is?
>

Obviously we need the upstream pieces sorting, but I don't think
that's a blocker to merging here. Just ripping out zvariant and all
the associated infrastructure I guess wants fixing first, though I
think don't we need anything more complicated than:

https://github.com/akiernan/hello-rs

I'll try and have a look at that later.

--=20
Alex Kiernan

