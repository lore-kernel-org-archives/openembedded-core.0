Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF58C4332F
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 14:20:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.12239.1669818014894184413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 06:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zb3zMNhN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id bg10so378568wmb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 06:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dTMEsDUN3lLt5gzTaADH47TCxSvVT335Js2+ydlF/aA=;
        b=Zb3zMNhNhPhvvBirBgfz05IMNgyQintYEK/4gwNE2q1XcgLUaY+tq4JgZzlMlb9CcR
         vXGfnG0JP+g6vFEDF/Sw21QsljJL6IPEZbY3SdIibhoUeP4KtETlFH9LGWxvLLfAXfI2
         VhmUHUaMSiNtQB39ldDt8odE9wzptg5n5UmFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dTMEsDUN3lLt5gzTaADH47TCxSvVT335Js2+ydlF/aA=;
        b=p/037bATxf1Mn77libe7NTkJ732VAh8tnHRBw+QbKalfX42DZ+AXqPFdGrrPZ45gqR
         rGWFKL80ah0RFt7EgfwD0JOIQwSnTSBARbhZ0pqvwdhal+tzMQe/nf8mBws7Y2uhrH6G
         tADrUjZUiyo6LOnjY7NQ6vWIILI5PHq95/cUAAQfIxhLYeb07mKvISNttKhtF8Wv6oZR
         Rb0erTNZ1DbxH74Mp43c+i4AysIB4mIQuYm9CyE3yeoLqKhpgYEBR8y6DEGNJ/oHmLur
         Cz/gzBIICA0jxSzVPayfTUthHEiyLvoSSKPgCOQZRBj9OvpFHpcMKpDUb5zk3t6EgZZm
         Ygeg==
X-Gm-Message-State: ANoB5pnmwaw3PKJCxpxDfUumpTuSO5fQZsc869XIP7DG8TVna/n++eAV
	tL1QD4T1k9NlTJtsRHcX+wkQ9Q==
X-Google-Smtp-Source: AA0mqf6+l2Tk0NStGy4gezGXnSY5Pj00QN2d1qxi3wM2396qLH3KHIPcdAkfQoXoudSwga5Z2Au5XA==
X-Received: by 2002:a05:600c:2212:b0:3cf:8aa0:cbec with SMTP id z18-20020a05600c221200b003cf8aa0cbecmr33816939wml.161.1669818013117;
        Wed, 30 Nov 2022 06:20:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d673:1517:32d1:98? ([2001:8b0:aba:5f3c:d673:1517:32d1:98])
        by smtp.gmail.com with ESMTPSA id i1-20020adfaac1000000b002238ea5750csm2146039wrc.72.2022.11.30.06.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 06:20:12 -0800 (PST)
Message-ID: <ad2adc6af5026edc201cd3ab3a7b1f129cfdbd57.camel@linuxfoundation.org>
Subject: Re: [OE-core] [Openembedded-architecture] Y2038 proposal
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
	 <yocto@lists.yoctoproject.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2022 14:20:11 +0000
In-Reply-To: <20221130143604.5a6659dc@wsk>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
	 <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
	 <bda7b996024942763ae9d03ea0b958c3a38b04c8.camel@linuxfoundation.org>
	 <20221130143604.5a6659dc@wsk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 14:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174011

On Wed, 2022-11-30 at 14:36 +0100, Lukasz Majewski wrote:
> > On Wed, 2022-11-30 at 09:07 +0100, Alexander Kanavin wrote:
> > > On Tue, 29 Nov 2022 at 16:45, Stephen Jolley
> > > <sjolley.yp.pm@gmail.com> wrote: =20
> > > > We=E2=80=99d welcome a proposal/series on how to move forward with =
the
> > > > Y2038 work for 32 bit platforms. =20
> > >=20
> > > I have the following proposal:
> > >=20
> > > 1. A branch is made where:
> > > a. "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64" is enabled globally.
> > > b. qemu is always started with "-rtc base=3D2040-01-01", simulating
> > > Y2038 actually occurring.
> > > c. an additional runtime test verifies that both RTC clock and
> > > system clock report 2040.
> > >=20
> > > 2. This branch is run through a-full on the autobuilder. Any
> > > uncovered issues are filed as bugs.
> > >=20
> > > 3. Once *all* of the bugs are addressed, repeat point 2.
> > >=20
> > > 4. Once there are no more open bugs, 1a is merged into master.
> > >=20
> > > Any fatal flaws in the plan? =20
> >=20
> > Others have made some good comments. My thoughts:
> >=20
> > * We need to add some runtime tests to oeqa for this (in addition to
> > the ptests)
> >=20
> > * We need to have a 32 bit ptest run on the autobuilder (qemux86
> > should work, not sure we can make qemuarm fast). Whether this is
> > manually triggered, not sure. We could have a smaller set of ptests
> > to run for it?
>=20
> Y2038 ptests maybe?
>=20
> Here is the list of integrated tests to ptests:
> https://github.com/lmajewski/y2038-tests

Perhaps, yes.

> > * Could we optionally disable some of the glibc 32 bit function calls
> > to ensure they're not being used?=20
>=20
> Could you be more specific here? Would you like to disable some
> syscalls?

I'm meaning=C2=A0disabling the 32 bit glibc time functions.

> > We don't really want to diverge from
> > upstream glibc much though.
>=20
> Could you be more specific here? The glibc now supports the whole set
> of syscalls as of 2.34 version?
>=20
> To enable them one needs to pass -D_TIME_BITS=3D64 flag when compiling
> programs.
>=20
> This is now the official glibc ABI.

Right, but the 32 bit time functions/symbols are still available for
older binaries. My point is that anything using those older functions
is likely in need of attention so for Yocto Project/OE usage,
identifying those would be helpful. If we were to disable them, that
would make such usage very obvious.

>=20
> > The reason for that is that if someone has
> > existing binaries, there could be problems using them after the
> > change.
>=20
> The binary shall work without issues on glibc 2.34+ and 5.10+ kernel
> without issues.

Not necessarily. If it were a binary library, compiled with 32 bit
time_t, new binaries using it would use a different sized field.

> The only problem happens when new binaries with 64 bit time support are
> run on glibc or kernel not supporting 64 bit time.=20

That is definitely not the only problem. Some of the problems are
unlikely but we do need to consider them.

Cheers,

Richard

