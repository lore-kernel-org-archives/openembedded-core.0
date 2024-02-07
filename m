Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC33C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 13:51:42 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.20444.1707313901684791224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 05:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PCletCsa;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-296a79e6295so472804a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 05:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707313901; x=1707918701; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Na1gkpEsGfwItMCktQbOPsvR1FnUfMhswuOk9sfD8Zk=;
        b=PCletCsaRedjowZBr23HIGjPK72DbkpXFjUufpSlJXAK0CZTmvWDKYQ6uI7x6U7kYN
         +DToHNmxxJLx1+G+++xD+mz1JR4Oj8/1xvx6WVqsFRKIIMeJMt0XPtFokoBJgPNWtuXj
         9WOtfnHEBp5yBA7azK+FFfRVIMd6+RB10UShjlhw3++PUumWMDnMg2LppbcPtIK/cLg2
         pjeF0RDqzBdY3X+xSfMDNRdSDLg1KUj+2GJwX1BCDGhpOQt+4HdcRCfJBtMhk2zCgcCP
         4i6o575+6ecSoTLLANOmzv9jav209j/ANwZeqVtb0p9fYfzLnFjG80LPEnVrwXAiLOnk
         H2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707313901; x=1707918701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Na1gkpEsGfwItMCktQbOPsvR1FnUfMhswuOk9sfD8Zk=;
        b=G5Y4mv4MHfAWN+mqqlASHidPBpF0Y2mDbWiPgYAdgEqwheXiYru4mNCILhR6BvOLS0
         3E4Hu3smCh/OwCQfU3ldKWbClPDxlP5tgcayJ4SmED6iJ959C7pFkM7gXEZgQjEQyljZ
         ItGSpu5se9mU3ZwGFpMx2JV9c2+ZRccjN407HxINCElTMWbbNKBHymUuv/gC6mXp5/y5
         ggWpfSK9LpQZgYnpSKBEXVoJymtZo+RvpPRnUoB4dzrQo7l8ZNqbRIAD+MshKb3xcwMl
         tM/zZIOlajKurXXGJjfQbxc0sx/AFD6BcJ7kI0LeXJiy+c8szWp/mVBYnkwHcSBASuhr
         N0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlv96nxzfAWzkthXrzL0fO5Xos4d6ZCC1Udjkd4WgO/VYe6jdXe16yfjE+b22WwWafbtTzInH9ywI8WxilQ0n797BfGekWVRLyOZL29XwbM5Wa1l3I1H6Z
X-Gm-Message-State: AOJu0YyBsRIu/taPzuuMFW2PtABuvhGVGtV1AruNzn71u1QwbuJWz0Du
	g5mWOqQYDYdA2fN1daqIRW49lSgI+Hw/myuHvYTFBOQCa4Qgtdlta8c3Fe1YNjh+BFjxDGqu2H4
	7Fu/Wu00uhsxqCj+hX18wQ1ZKGYE=
X-Google-Smtp-Source: AGHT+IHVqOQv9VCsXsAZPyLGFSIC1tDJXuHAfcmRv18eJpZiGjvFkQAVkvPnlJNspV4TwYZ367JHWdgB5bkxczzqdJQ=
X-Received: by 2002:a17:90a:31c7:b0:296:18cb:b717 with SMTP id
 j7-20020a17090a31c700b0029618cbb717mr2736985pjf.25.1707313900097; Wed, 07 Feb
 2024 05:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
 <CADkTA4NS3=8tUYUz_SMiwfd+E=takHWEVTYi1AjuX41A0p8YOQ@mail.gmail.com>
 <d8b9db15ae3ff57b6a34cc1a0278d208d588a773.camel@ew.tq-group.com> <ZcOGrdeSLp2e_291@nuoska>
In-Reply-To: <ZcOGrdeSLp2e_291@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Feb 2024 08:51:28 -0500
Message-ID: <CADkTA4Ok_jtBhz+ztyq19gKMdu+9_KQkG8dAdCaXBK8NsTuNWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: install .config to deploy dir
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"oss@ew.tq-group.com" <oss@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 13:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195063

On Wed, Feb 7, 2024 at 8:33=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.or=
g> wrote:
>
> Hi,
>
> On Wed, Feb 07, 2024 at 02:14:33PM +0100, Matthias Schiffer wrote:
> > On Wed, 2024-02-07 at 12:42 +0000, Bruce Ashfield wrote:
> > > On Wed, Feb 7, 2024 at 5:26=E2=80=AFAM Matthias Schiffer
> > > <matthias.schiffer@ew.tq-group.com> wrote:
> > > >
> > > > Deploy the kernel configuration with the built images, so it is eas=
y to
> > > > check its contents, or rebuild the same configuration outside of th=
e
> > > > Yocto build system.
> > > >
> > >
> > > I'm not convinced we need yet more clutter in the deploy directory, b=
ut
> > > at a minimum, this patch also needs an update to the documentation
> > > (apologies if I missed it on the docs list).
> >
> > Sorry about the missing docs, I'll provide a patch for that as well.
> >
> > >
> > > One could argue that the config could be pulled out of the other
> > > packages and artifacts, and that it wouldn't be recommended to
> > > use that config for rebuilding outside of yocto, as we aren't providi=
ng
> > > the matching sources in the deploy directory.
> >
> > There are at least some cases where the config can't be pulled out of a=
nything else - without
> > CONFIG_IKCONFIG, the config is not embedded in the built kernel images.=
 In constrained environments,
> > it may be desirable to disable such options to reduce the kernel size.

Not replying to Mikko, but to  Matthias for this comment  below (I thought =
I'd
save us an email by doing both at once).

On this point, I am well versed in what we can and can't do with the
config embedded into the kernel and related size concerns. So I
did consider them in my reply.

My point is, that is a CI system wants to look something like this up,
I'm happy to push the requirement to provide that information to
whoever is configuring and building the kernel, versus putting another
file into deploy for everyone who builds a kernel (or duplicating informati=
on
we have elsewhere already).

> >
> > As a data point from other distros, Debian/Ubuntu disable CONFIG_IKCONF=
IG and instead provide the
> > config next to the kernel images in /boot.
>
> Check the kernel-dev package. The config is there.
>

This was also my first thought. Just save that package and use the
config from there. At least we know it is curated and in sync.

> > >
> > > I would also be nice in the commit log to indicate how cleanup of the
> > > deploydir has been tested to show that we won't end up with config*
> > > files and links in the directory after their associated images have b=
een
> > > removed. (I haven't looked at the deploy classes in quite some time,
> > > so I'm unsure if anything in particular needs to be done).
> >
> > My understanding is that unclean deploy dir issues are pretty much a th=
ing of the past, as
> > deploy.bbclass sets `do_deploy[cleandirs] =3D "${DEPLOYDIR}"` (so do_de=
ploy always starts with
> > a pristine destination directory), and the sstate tracking takes care o=
f the rest.
>
> I agree that deploy directories have way too many things already. And rec=
ipes often get it wrong trying
> to pass files through it from providers to users without setting task dep=
endendencies and sstate caching
> correctly.

And we have the kernel shared artifacts dir, which can be saved / copied
if a later stage in a pipeline needs the information.

I too have seen issues with sstate and the cleanup restoring (or not) files
that I'd expect. But have never made it reproducible enough to debug.

In the end, I'd leave this up to RP as he likely has a better global view o=
f
the deploy directory and if adding another file is acceptable. The minium
needed in a v2 would to indicate that the docs update will be done.

Bruce

> Cheers,
>
> -Mikko



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

