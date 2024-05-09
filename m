Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC32C25B10
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 13:03:01 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.9625.1715259771881999820
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 06:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JW8qE+M/;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2b38f2e95aeso1421232a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715259771; x=1715864571; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9190CdEhtvdT7KEbVTR5OYUYFX1RKofRiAFE0pR7FIw=;
        b=JW8qE+M/say8GNJYcABdbpn4CBL/OrQzkpFahZiJQ4/xNSGroLkKe2G1+ydViNiHty
         dCsaVkJKQzyoShS8jxg/27fSgvrF1cWzigUMWMjjjYwEYI+xgAdsL/iZ/uMATdixFkHA
         ue+vlBwETX1c5wYhetcJA+GENlKt+krWnmZ9O5SGUjHYBLv7yosAcdqrjMkuv/3wxL6H
         ANFgZHjN9ZWEN5RZVCQE8tWxD/JE4yB1jGGurOixkVMZQy3MOYG+o5CiF8y6iAOGR+JS
         l0z7bpQuxqc5RztDscrSfBNi8eTQJlEazoVI7bjWmSr49MOxUZLZ4UnUROwBQBoeowGT
         1OMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715259771; x=1715864571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9190CdEhtvdT7KEbVTR5OYUYFX1RKofRiAFE0pR7FIw=;
        b=Dw1JhW7zGTWwsSjiFHtMFV2EIZlCoZ1z6FE58JpsFKquvl+wlg5pNnoy7mbhD8cgyg
         aYXX4TapnQPY1kOc/fOPMhk7SNhUT0ds+q8b/RMLrin/0G2ahXeMtdBgaqgANRIbrW9J
         4OE6Do3n0HzGCF5GfrQuVojbeFilscoItP1oIx3Cx4Eh92dgy7bE6ZO1mj6ofLCwBFg0
         ukbDHzLs3whoprV33fMVmGWXzzg9XQ7Q85iMDxut3232Wqn230LALwKwKJv9uvh5QzmJ
         gJgxTZB1WySVM+HDyc6pmvJsblijCmBM3nQMsY7kU6j4kjelO6vPvS6RzjdhHu797VQ8
         vtFQ==
X-Gm-Message-State: AOJu0YwQaoPKELl50i1iSl9hs+WhyAJ8leV9zzNwgT0Fsv1bvUgTsPGN
	RPZupMS6xGGpXZrjjGeYvde9g0P2mRNeaLURdoYlT2jBSvt5vI1+CrwJNSlloHdxvXUw0UG+i3n
	ga6YwNHhV/fq9rz+HdegqLpfBrlI=
X-Google-Smtp-Source: AGHT+IFSIU5YlCUVW96U1LcXfUkv5tjZyO+eftiuCVxfbaUG+CnE5b6kcd+2Fr47MA480dqMJNGd7MNnRPojiwqFSeQ=
X-Received: by 2002:a17:90a:ebc9:b0:2b1:54e4:e125 with SMTP id
 98e67ed59e1d1-2b65fe19e0amr3729693a91.22.1715259771201; Thu, 09 May 2024
 06:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240509012206.517279-1-raj.khem@gmail.com> <CADkTA4PtK4TvaqpO=0wZMjG78QTygojrDO7S33sTbb4M_ZPiLw@mail.gmail.com>
 <CAMKF1sph6-bJ1UMEaJdfeMKgLsmUDS-WGdCcJtOhg0rb=cwewA@mail.gmail.com>
In-Reply-To: <CAMKF1sph6-bJ1UMEaJdfeMKgLsmUDS-WGdCcJtOhg0rb=cwewA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 9 May 2024 09:02:39 -0400
Message-ID: <CADkTA4OECx0y2y6pGZsEQ4buE0ne7QLejiz=4QcHPEpCppH-qg@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto: Enable team net driver
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 13:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199175

On Wed, May 8, 2024 at 11:26=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Wed, May 8, 2024 at 8:16=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gma=
il.com> wrote:
> >
> > On Wed, May 8, 2024 at 9:22=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/recipes-kernel/linux/linux-yocto_6.6.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/reci=
pes-kernel/linux/linux-yocto_6.6.bb
> > > index 71bfbf9e032..4503ec94ae9 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > > @@ -66,6 +66,7 @@ KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc=
 cfg/paravirt_kvm.scc"
> > >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "=
mx32", " cfg/x32.scc", "", d)}"
> > >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES",=
 "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", =
"", d)}"
> > >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES",=
 "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
> >
> > We are getting quite a few of these now and that isn't a problem. But
> > I think we should
> > probably start putting comments above the enable lines so casual users
> > will know why
> > the various fragments are being enabled.
> >
> > For example, I don't really know what the team driver is, and why
> > ptest needs it!
>
> when we expand ptests for more than core layer, then certain packages
> e.g. libteam in meta-oe [1] this config option is needed to be
> enabled.
>

Cool. I don't have any concerns with the enablement itself, I'd just prefer
that we put a line above it in the file to indicate what depends on that
configuration so there's no confusion later.

Bruce

> [1] https://git.openembedded.org/meta-openembedded/commit/?id=3Ddf35bef3a=
e6411900efdfc3ea5ade23820e9af2f
>
> >
> > Bruce
> >
> > > +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES",=
 "ptest", " features/net/team/team.scc", "", d)}"
> > >  KERNEL_FEATURES:append:powerpc =3D" arch/powerpc/powerpc-debug.scc"
> > >  KERNEL_FEATURES:append:powerpc64 =3D" arch/powerpc/powerpc-debug.scc=
"
> > >  KERNEL_FEATURES:append:powerpc64le =3D" arch/powerpc/powerpc-debug.s=
cc"
> > > --
> > > 2.45.0
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

