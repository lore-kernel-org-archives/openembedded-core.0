Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3852EC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 19:46:38 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.3631.1709063190355277429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 11:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGf0iZhg;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1db6e0996ceso34902605ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 11:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709063190; x=1709667990; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0At1rWQccjIQC+cEsarskG11rJSsjBRqITfuodgM1M=;
        b=WGf0iZhgl1KLVwKCQl5ZNiXdxytprohi2FkXnAqG/NSv1ABF2TzNW90u7NXBJU97ca
         pwEaVrNlMiE+cvVajOeb/UJwnMbp/jeC2wgAcGPcp0z0NK13Z6NwQRSD0jThXj9oQhRI
         5sjtVt6pKXUW0kYthCwGpsBzJLF/dD1CDfyddIZ9Esv43DySDL9DiWLolhMSycvIVl4C
         MbHjVViYcP+rr1V5XuFDxjL1QJmcD8Hrxa/F00nRucHN7BuNJ5srnwfSYiZZe5HwQfuY
         KmCLU9mJ7zs5ZKzZju38GcQAijdmJz9TThTaumt87jPHtkUnjv/PDioqPl2tyIykZMtJ
         n5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709063190; x=1709667990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0At1rWQccjIQC+cEsarskG11rJSsjBRqITfuodgM1M=;
        b=G/R2YUiq0IGLL5bFyKo9m5OQvNrpMfgjRIBli3IXQDlvgNXsTA+5KYqPYR7fjslzKl
         Nih27teU1hC1HbGUTIdZzlCFiBYojXdNs3JJh0WnOjTq/EsQcieLWa0mkN9opixSr6M4
         9145ASANfRwnRmubQCsvidnPHHVgvDKPERpPE0niGSeKjE4KgP2mB/4FSmRC73Gt+ULz
         hUQ/VCzQqTiCuFl482hNoduk9NUGveStG9zCraO1J0JXF9n+XRTb+ZJZFFGRQFGenI5i
         7B2lMHC1+xlQI/05HJHd9Ic8egYKcBr73RDejzz8F+/JvU6WfTSzoRUGwLrUw98mMP+a
         4dqg==
X-Gm-Message-State: AOJu0YxA2W/YlErHykJRYf6MCsOvDLEuXkxjUBi4DYNy5iKVWPfN3lef
	RfQ/xLeG1tQ5op4/XwNsYbzWocahToR1IVmyJmRT+UPgAdpNPPUjpFcXE88rg7o8YL8unVgRkbV
	HZt99jIUxPAPoOot0oTVKtSNYLKE=
X-Google-Smtp-Source: AGHT+IHl3AeV2ryq1KrcABwKu5Np1ADgTpcRpLFuHh/3STUwQlbiZ6D8ydvjMSbTqZaAdPrTEkgG/bLicryV3ssthMY=
X-Received: by 2002:a17:902:d507:b0:1dc:b989:9bb1 with SMTP id
 b7-20020a170902d50700b001dcb9899bb1mr2596007plg.20.1709063189657; Tue, 27 Feb
 2024 11:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20240227170902.3718203-1-ejo@pengutronix.de> <20240227170902.3718203-2-ejo@pengutronix.de>
 <CADkTA4PY4HXpcu4K7YkuqLSuLor=tKfTz04fEORKBRycgE12Fw@mail.gmail.com>
 <b3485a14d8f03e3c29e6f12a065775e1522e7ad0.camel@pengutronix.de>
 <CADkTA4Ou-ty361eSd3LxBvKNn75EoDn6pbtEE63gwd0kg+uWtA@mail.gmail.com> <5fe1a738ad6a53058fc7c4b1339ce64a0d0365ee.camel@pengutronix.de>
In-Reply-To: <5fe1a738ad6a53058fc7c4b1339ce64a0d0365ee.camel@pengutronix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2024 14:46:18 -0500
Message-ID: <CADkTA4PY-nSY8cQZY49LWG87OAjBT4=Pz=6R5eNTL4h4BNN6Tw@mail.gmail.com>
Subject: Re: [PATCH 2/3] kernel-yocto.bblass: run kernel_version_sanity_check
 after do_patch
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 19:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196294

On Tue, Feb 27, 2024 at 2:32=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutronix.=
de> wrote:
>
> Am Dienstag, dem 27.02.2024 um 14:13 -0500 schrieb Bruce Ashfield:
> > On Tue, Feb 27, 2024 at 1:55=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutro=
nix.de> wrote:
> > >
> > > Am Dienstag, dem 27.02.2024 um 12:36 -0500 schrieb Bruce Ashfield:
> > > > On Tue, Feb 27, 2024 at 12:09=E2=80=AFPM Enrico J=C3=B6rns <ejo@pen=
gutronix.de> wrote:
> > > > >
> > > > > The kernel patches may modify the kernel version, thus wait for d=
o_patch
> > > > > before running the version check.
> > > >
> > > > While that may be true for kernel's in general, I sincerely hope th=
at no one is
> > > > patching in a new kernel version to linux-yocto.
> > > >
> > > > I don't have any great concerns with the patch, I just don't think =
it
> > > > is necessary :)
> > >
> > > Yes, the use case is actually not linux-yocto itself.
> > > Thus it might be most relevant in combination with moving the version=
 check to kernel.bbclass.
> > >
> > > How I actually came across this check is that (in some projects) we u=
se the linux-yocto.bbclass
> > > for
> > > non-linux-yocto kernels since some functionality (especially fragment=
 handling) seems useful in
> > > general.
> > >
> > > I am still unsure if I should try to move (or duplicate) the required=
 features in the generic
> > > kernel.bbclass or if using linux-yocto.bbclass for 'mainline' kernel =
is an appropriate use
> > > case..?
> > >
> >
> > There's no need to use the linux-yocto repository when using
> > kernel-yocto bbclass, so
> > definitely, it is an acceptable use case. In fact meta-mainline, and
> > linux-yocto themselves
> > are both using kernel-yocto bbclass to build mainline/-stable kernels.
> >
> > I'd rather not move the kernel-yocto bits into kernel.bbclass, since
> > if that was something
> > easily done .. I would have done it a long time ago.
> >
> > Keeping the split in the functionality allows those that don't care
> > about linux-yocto to
> > keep their recipes and workflow the same, and those that want to opt
> > into the kernel-yocto
> > functionality can just inherit the class.
>
> Yes, I wouldn't move the meta data handling and its tricky pieces, since =
this is actually something
> I see in kernel-yocto.bbclass, too.
>
> But.. do you have an opinion on adding simple config fragment handling in=
 kernel.bbclass (like we
> have in busybox or u-boot)? So mainly calling merge_config.sh somewhere a=
round do_configure.
> (It would however need to be compatible with (or replaced by) the more ad=
vanced handling in kernel-
> yocto.bbclass.)

I do have a very strong opinion.

If we were going to do that, I also would have done it many years ago.

Having some, but not all of the meta-data and merging split between the
classes would be a disaster.

If there's something that the meta-data handling is doing in kernel-yocto
bbclass that isn't working or isn't appropriate, we can fix it there.

Other layers and classes in those layers are of course free to do whatever
they want, but we need to be consistent in core.

In fact, I've had a bug and a prototype patch for many years now that
does move some of the configuration merging to kernel.bbclass, but it
only increases complexity and doesn't offer any benefits .. again, since
if there's something wrong with the fragment gathering and merging
in the kernel-yocto bbclass that makes it not broadly applicable, we need
to fix it there, not make things more complex and confusing by arbitrarily
splitting it into something unmaintainable.

Bruce

>
>
> Enrico
>
> > Bruce
> >
> > >
> > > Regards, Enrico
> > >
> > > > Bruce
> > > >
> > > > >
> > > > > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > > > > ---
> > > > >  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/clas=
ses-recipe/kernel-
> > > > > yocto.bbclass
> > > > > index 108b7e6752..854e4681d5 100644
> > > > > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > > > > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > > > > @@ -729,6 +729,6 @@ python () {
> > > > >  }
> > > > >
> > > > >  # extra tasks
> > > > > -addtask kernel_version_sanity_check after do_kernel_metadata do_=
kernel_checkout before
> > > > > do_compile
> > > > > +addtask kernel_version_sanity_check after do_patch before do_com=
pile
> > > > >  addtask validate_branches before do_patch after do_kernel_checko=
ut
> > > > >  addtask kernel_configcheck after do_configure before do_compile
> > > > > --
> > > > > 2.39.2
> > > > >
> > > >
> > > >
> > >
> > > --
> > > Pengutronix e.K.                           | Enrico J=C3=B6rns       =
         |
> > > Embedded Linux Consulting & Support        | https://www.pengutronix.=
de/ |
> > > Steuerwalder Str. 21                       | Phone: +49-5121-206917-1=
80  |
> > > 31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9=
    |
> >
> >
> >
>
> --
> Pengutronix e.K.                           | Enrico J=C3=B6rns           =
     |
> Embedded Linux Consulting & Support        | https://www.pengutronix.de/ =
|
> Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  =
|
> 31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    =
|



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

