Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48875CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 16:53:26 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.1045.1755622404212042511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 09:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=24yjpZgg;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.177, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71d601859f5so44590487b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 09:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755622403; x=1756227203; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lcM+y3swvOwnu6ITS5YpyROXLfOeVyuuMX+ODnpHPg=;
        b=24yjpZggmjGkVyt5DTu9n5GrjRjEyW6ksNUVtLMhiTyznvGddIitSNTkx+5GxVJkmY
         4nZojZOd0njbKUYNiJ6q7Q9As0iAgRN/g6Pu2VmKueECfWPUgOvj6Cjk9/iZX6JGnJwT
         SB1pS2ic/ZxipFxcM7Qh/eb0mQgqi+ggQkB7LjE49ywlpcXSAbJ18AmpGRJMEcZqpU+9
         hed7WyCS+mv1kYCpolC0wqa2aT/giG5ZF8PMFYeUo4i3YYuMv0PnwNu3xkZq+aRle1Aj
         4JrDb+FoX8aJH7rZqg+kZa9QMopXZR8yOERmeNmwvODkYLTVwTa0/c7HZmindrsvO692
         jPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622403; x=1756227203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lcM+y3swvOwnu6ITS5YpyROXLfOeVyuuMX+ODnpHPg=;
        b=ejr+kpTB/uj+YeGa9IKHxg9MIWc5t6E2BQPVPrsxnBnx13luQVLRfTOjpeS0eNEM5i
         HDzGN7Rpnomgy87qFt8VxSVj8up87+ZQD6iHztiwF+EoEMmMD4Rf9PI3GMH2U5mj2b6p
         CVXvgX6E1lypdlN+vfB1NJoI8hU9va4tKgsSdIwWv9axypTYy/U1YRfjSdcYC7+VE7VG
         Xyc8+rHb2lTuo969OLWdLpCcJuj72cRx4MIC1VTFgWqQZWzNX7Hn9lXhE4IBxolDQMFd
         TMyK+dGmzkzAGAd2WSCpHdC7+3q/IxeEGhfJ3UoTUTLQ7wZS0lbI7vd9XvwmaJrQMnJi
         6omQ==
X-Gm-Message-State: AOJu0Yz1hnwkMst1+91Urybzb3hBnluQ6CE70KojFy3c+5UMVJ7PNhvp
	HBtNRn02GbfrH7d7+6wjq440u4sn9GYIu8X9/0/tKMEw8o8l18kB+5jqRjU3ng8M5nZ8SEjYEfa
	WG3+i6gPuCOFCzE8d3waJ5N91MChaA+bZ/VNgcm0Nww==
X-Gm-Gg: ASbGncueqrS+AHigf8roIIPCtOGQ2rB8/MAKv10DKtcfkuGjwioQZkd23Ly+6i/qTcz
	UZ24y7m4JAxTSjUkwuG8isE6TqMfDWbszzP1lNvoqAtE/X+JZcCwS7A1wsJOiAReJIjeBnGgo9Q
	PfaIwT3vgf9SSL0GcFi1vG34fdqfsB0gU7lEfDYTbjk+rduqkj56QBc9te5dWv6tBGOOLwIOGGl
	GTTcZgj8b94Zb2V1tjXRNGAQ3/WTEjvF58XHro=
X-Google-Smtp-Source: AGHT+IG9CpBI0NxkqfpYXz5fb7hnR37vJ1ZNPpOeR4rqxDj0cyikrSHvf/IyLgG1brFO3dXvFPgL1V/1DZji17pQmjs=
X-Received: by 2002:a05:690c:8:b0:71a:476a:ab5d with SMTP id
 00721157ae682-71f9d64d4acmr43102327b3.20.1755622403111; Tue, 19 Aug 2025
 09:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250817205033.3845672-1-martin.jansa@gmail.com>
 <8d5f70ac-7a0e-4c1b-b1c3-3949412843c8@cherry.de> <CA+chaQeo_Fa9G-4rNRuihvsnHbGJFZx_8JS7CHV83KY1w9uFBw@mail.gmail.com>
 <905aedea-e2b1-4b07-8f6d-f68863f60f0d@cherry.de> <CA+chaQek-wO5DvPanFJpC+hCgMH2FLn_EeStsgvXDy8LBb4Acg@mail.gmail.com>
 <dd63bc2f1d4d51e76550b2653fef3f35a0adee6b.camel@linuxfoundation.org>
In-Reply-To: <dd63bc2f1d4d51e76550b2653fef3f35a0adee6b.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 19 Aug 2025 09:53:12 -0700
X-Gm-Features: Ac12FXwi_ycmRKuVAQbibDqftpWR5FI-8XrmX6JQs5lgfgBJBIZLBUnaXUvFhME
Message-ID: <CAOSpxdaTNWxO6EuCOJ_yfBmcHKOCQvtTAaJLOb_5ihHi=Xfm4w@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] e2fsprogs: Fix build failure
 with gcc 15
To: Martin Jansa <martin.jansa@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 16:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222122

On Tue, Aug 19, 2025 at 9:31=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2025-08-19 at 13:36 +0200, Martin Jansa wrote:
> > On Tue, Aug 19, 2025 at 11:57=E2=80=AFAM Quentin Schulz
> > <quentin.schulz@cherry.de> wrote:
> > >
> > > Hi Martin,
> > >
> > > On 8/19/25 11:24 AM, Martin Jansa wrote:
> > > > On Tue, Aug 19, 2025 at 11:21=E2=80=AFAM Quentin Schulz
> > > > <quentin.schulz@cherry.de> wrote:
> > > > >
> > > > > Hi Martin,
> > > > >
> > > > > Do we actually support any distribution for Scarthgap that has
> > > > > gcc 15 in
> > > > > its package feed?
> > > >
> > > > I haven't built the whole world, but these changes allowed me to
> > > > build
> > > > our images with gcc-15 from ubuntu-25.10 with scarthgap (and 2
> > > > more
> > > > changes sent for walnascar).
> > > >
> > > > So even when it's not officially supported (or tested on AB),
> > > > these
> > > > changes are safe enough, right?
> > >
> > > My opinion is if you want to build an old branch on an unsupported
> > > distro, you maintain a fork yourself. Otherwise use containers
> > > (kas,
> > > CROPS, ...) to build old branches on unsupported distros. Master of
> > > course is a different topic, and patches to support new
> > > GCC/glibc/musl/clang/cmake/whatever on yet-unsupported distros is
> > > *very
> > > much* welcome.
> >
> > I use containers, this one with ubuntu-25.10, I can switch to older
> > ubuntu if needed, but it's useful to catch issues early (by someone
> > who can also provided patches where needed, instead of random people
> > reporting that LTS versions don't work on their new system).
> >
> > All of these changes are backports from master where it was already
> > fixed by Khem or me before (with the exception of cairo where I've
> > backported just 2 fixes from upstream instead of whole minor upgrade
> > as the rest of the upgrade isn't needed for LTS).
> >
> > > I'm not sure we need to add on maintainer load by patching Yocto
> > > for
> > > unsupported distros. But that's a call the maintainer(s) and or TSC
> > > to make.
> >
> > Agreed, Steve already queued the patches in scarthgap-nut, similar
> > fixes were already merged in meta-clang and meta-tensorflow, so
> > hopefully these small changes to keep the LTS buildable on newer OS
> > versions don't add too much trouble for them.
> >
> > I am not asking anyone to regularly validate that older LTS work on
> > newer OS then what was originally tested, but if small already tested
> > fix is identified, sent and doesn't break anything on older supported
> > OSes, then is it too much to ask for it being applied?
>
> Our policy has been to accept simple changes to keep the releases
> building on newer distros as long as they're not too invasive/risky. As
> the releases age, the barrier to entry increases.
>
> Where a distro is known to work, we also have been known to enable
> testing on it. It really has to be on a case by case basis though, not
> all distro changes are equal and we can't know in advance what they
> are.

Richard took the words right out of my mouth :-)

An additional factor for supporting newer releases when feasible is
that older releases on autobuilder workers are phased out over time,
leaving a smaller and smaller pool available for LTS testing.

Being able to add newer releases to the LTS worker pool is definitely
a good thing!

Steve

