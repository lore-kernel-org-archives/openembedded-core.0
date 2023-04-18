Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18F1C6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 21:04:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.21578.1681851850555843040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 14:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=E6P7XY06;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-2f917585b26so2213265f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681851848; x=1684443848;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q+igBr+2Hq+t1B6PeGtLJ7V8uhaUjB0BgYG5oyRxsWc=;
        b=E6P7XY06s3jksnlrf1Ly5HYlSLUrUio6xHK6sDScAmYuHUvd8kEXXQIjP9g4WkyKmT
         tbu07qWVi/0palRHPzb4CirXpp3S4K6BimuubgqQxvQbas28gv+r8pkseyIqFJppFjgr
         6LQvKe9OViQ3Ilb95APZ4tqYrLD/LoA63QnMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681851848; x=1684443848;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+igBr+2Hq+t1B6PeGtLJ7V8uhaUjB0BgYG5oyRxsWc=;
        b=hTbXAXYN941s4+jBpMDI4+aO7NOKevQupHzJ2FgAK0UbdkXhM29EIEwef+6oD0foe6
         cDDeM6nljFKEW7Fkkt2A/ev1pMFoZTpu/w59rLwM+ilZ17cSFZia1p/36W9DnXZgJyaV
         rj8Bk62pQAVlzH4OphmHvf+VWi1ezTNLrU9cl/KKQjziFfuv4sVgZNMFdTjf8bwTOI9J
         zCBAF8WDGDdnSNUIXY1xR/rvvtteky+GYFbTh1oVL0Qb60nFHDOBl93X3ydtRNFpMvEF
         6l02DoqjzsIXoTrk4kLmtNOzfXybOGu1wHYq1lCW5ASHBFqdfzzjdZW1ONfoZe5M18LX
         AQ5w==
X-Gm-Message-State: AAQBX9dNYyJUONf7GtftNVKCBQQrxUzJYqdcmVGc1fEoYB2kHcJ25Ski
	tWVQmk4ypBUjwhwQ7GpeHJCClw==
X-Google-Smtp-Source: AKy350YYzRoaKJvVC7tqmR9dVkiXfETJD3OHXdsvlu1grS15lRNrR0G49CSUyoit0OP3pdokrhvLig==
X-Received: by 2002:adf:fc90:0:b0:2ef:b4a9:202f with SMTP id g16-20020adffc90000000b002efb4a9202fmr3065721wrr.69.1681851848561;
        Tue, 18 Apr 2023 14:04:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:46ea:39e2:ef85:eafd? ([2001:8b0:aba:5f3c:46ea:39e2:ef85:eafd])
        by smtp.gmail.com with ESMTPSA id g2-20020adffc82000000b002cff0e213ddsm13957467wrr.14.2023.04.18.14.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 14:04:08 -0700 (PDT)
Message-ID: <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Jose Quaresma
	 <quaresma.jose@gmail.com>
Cc: Christoph Lauer <christoph.lauer@email.de>, 
	openembedded-core@lists.openembedded.org, Christoph Lauer
	 <christoph.lauer@xtronic.de>
Date: Tue, 18 Apr 2023 22:04:07 +0100
In-Reply-To: <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
References: <20230416103052.28268-1-christoph.lauer@email.de>
	 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
	 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
	 <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 21:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180202

On Tue, 2023-04-18 at 16:25 -0400, Bruce Ashfield wrote:
> On Mon, Apr 17, 2023 at 6:31=E2=80=AFPM Jose Quaresma <quaresma.jose@gmai=
l.com> wrote:
> >=20
> >=20
> >=20
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia seg=
unda, 17/04/2023 =C3=A0(s) 20:51:
> > >=20
> > > On Sun, 2023-04-16 at 12:30 +0200, Christoph Lauer wrote:
> > > > From: Christoph Lauer <christoph.lauer@xtronic.de>
> > > >=20
> > > > With rm_work active, external module signing throws an error:
> > > > scripts/sign-file: error while loading shared libraries: libcrypto.=
so.3: cannot open shared object file: No such file or directory
> > > > Preserve libraries that sign-file script needs during runtime.
> > > >=20
> > > > Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> > > > ---
> > > >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 +=
++
> > > >  1 file changed, 3 insertions(+)
> > > >=20
> > > > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_=
1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > > index 28e0807d1d..0e24efc597 100644
> > > > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > > @@ -32,3 +32,6 @@ do_configure() {
> > > >               -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDI=
R} $t
> > > >       done
> > > >  }
> > > > +
> > > > +# keep native libraries required for module signing
> > > > +RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"
> > >=20
> > > I'm really reluctant to take this change as it isn't the way
> > > dependencies are meant to work.
> > >=20
> > > It sounds like something in a shared workdir is depending on somethin=
g
> > > in a recipe workdir and we simply don't support that. Everything need=
ed
> > > should be in the shared workdir. At best this is a bandaid and there
> > > will be other ways to make this fail such as cleaning make-mod-script=
s.
> >=20
> >=20
> > The problem is because for signing the kernel modules the sign-file.c [=
1] is linked dynamically with openssl-native.
> > This works when building the in tree kernel modules but will fail when =
we try to sing any out of tree kernel module.
> > To sign the out of tree kernel we will use the binaries from the shared=
 workdir but the native libcrypto.so.3 is removed by
> > the rm_work bbclass. We need to link the sign-file statically otherwise=
 it will not work with the rm_work bbclass.
> >=20
> > [1] https://github.com/torvalds/linux/blob/master/scripts/sign-file.c
> >=20
> > Another solution for this problem can be changing the make-mod-scripts =
to be a native tool and in this way
> > they will be installed and the dependencies will be handled correctly.
>=20
> There would very likely be different issues if the scripts were
> generated and then packaged as a native tool / package. Since they are
> so tightly coupled to the kernel. We'd just trade one set of issues
> for another (out of sync artifacts, etc).
>=20
> I'm going to hack on this a bit.
>=20
> That being said, I've never done any module signing .. since I don't
> need it in my development workflow.
>=20
> Is there a canonical guide to getting it setup so I can test my static
> link and relocated artifacts fixes ? is it with meta-integrity and the
> kernel-modsign bbclass ?

I did think about this a bit more. It does likely depend on the version
of libcrypto from the host system as to whether it reproduces or not.
The possible solution ideas I came up with are:

a) statically link sign-file so we don't need libcrypto
b) copy the libcrypto.so into a known location in the shared workdir
(probably some new path) and then adding an RPATH/RUNPATH using chrpath
to the binary.

Cheers,

Richard



