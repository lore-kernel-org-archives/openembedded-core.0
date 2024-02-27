Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7968AC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:58:31 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.2043.1709071102933879691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eLAVQ7Oi;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5e4613f2b56so3383741a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071102; x=1709675902; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiM0HAxRIA/ykBCoQvK77mCQ2GwrkDGxWc2wuuAceOs=;
        b=eLAVQ7OiKKRkcSF3ywxcF4jRQh6jy4quWbZmFRIqlwqzy0UpWQ1IIuvjVL1GURrQ9n
         8i/EWQ/3N1ju1pRT2GFNYfrRrFjMm8hBKzwGIvdVCdQvygFTbw/qFVVVRr+4KX68XGeV
         /ivAKNh/IX6mQYwifYMJ4jhKmC1vDXYxZet+XafyJBRBtsoUAiA8fOR2uS1a1OxKJ0I6
         ieYsxhJXa0DwCOUCU7wshf2uTohC8vEXtSOzbzr+uZyBSvk47bmUCD6b3+VUsrtefODi
         osLW7z3MB1qq7wnHcRwiCkyFGXebeiFk3wTlX1ZDlDpHPYJqNLG2aGjeRUs2Mq+k7jIJ
         nLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071102; x=1709675902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiM0HAxRIA/ykBCoQvK77mCQ2GwrkDGxWc2wuuAceOs=;
        b=JAgsFXI9LgIQq11QEL2MpwmRIjW8H5SAHd1iJYYCnjL5qyeldNoDsLj+3iRF6eS2cG
         dPXdPruTTzsJOM/auXJ8/PjlD/1PESpt/bLoFjsAIG/KYb1kzDo3ghSzhxm5/ErAMMXp
         ZX8x6yRhHsl90OLDjFLhQUCpEcmNq2OGCOkWNwPwm+QuMPQTfhH275rBWNfM9ESFMg8q
         0H+fd0Sbo6WKU9DWDQRcQPV75O08gfhb92T+qriLwzHd8kJPhbN/m8K9Y6FC1m9D3DbE
         qA6Fu7wmOgjLH9+1JmqqINJqY0hcuMZ8MK6QK4/f3iHO4cuffmv7og8xZWQ0s/Tiyk/+
         RxeA==
X-Gm-Message-State: AOJu0YySS9FWgGQyU/7PnrIemAMkIlMTfS7NBu/D8p6aNu67x+Md4N4y
	0/YFT5YurIHI1Uy+12rNA1azpqgcfbhCFoegY4iadgT0lSkuqzh8+1Tvdkt6vVX/9eVbbQn88VL
	dF1C4dutEE9xN+11rh+6q4QjKCPoLbiG8
X-Google-Smtp-Source: AGHT+IE+5i2WTdXC3ZiEimKiVcNZKTlh/hzccNi9Q1pDEqScgpDSCMDXYpq8p8OYQn3txPpcAp3xXRVFK/WA7nbhgvM=
X-Received: by 2002:a05:6a20:e605:b0:1a1:e83:8eb4 with SMTP id
 my5-20020a056a20e60500b001a10e838eb4mr2839018pzb.9.1709071102184; Tue, 27 Feb
 2024 13:58:22 -0800 (PST)
MIME-Version: 1.0
References: <20240227170902.3718203-1-ejo@pengutronix.de> <20240227170902.3718203-2-ejo@pengutronix.de>
 <CADkTA4PY4HXpcu4K7YkuqLSuLor=tKfTz04fEORKBRycgE12Fw@mail.gmail.com>
 <b3485a14d8f03e3c29e6f12a065775e1522e7ad0.camel@pengutronix.de>
 <CADkTA4Ou-ty361eSd3LxBvKNn75EoDn6pbtEE63gwd0kg+uWtA@mail.gmail.com>
 <5fe1a738ad6a53058fc7c4b1339ce64a0d0365ee.camel@pengutronix.de>
 <CADkTA4PY-nSY8cQZY49LWG87OAjBT4=Pz=6R5eNTL4h4BNN6Tw@mail.gmail.com> <8f49574f0b5c04fd8852e4358d4130d54e8b42ec.camel@pengutronix.de>
In-Reply-To: <8f49574f0b5c04fd8852e4358d4130d54e8b42ec.camel@pengutronix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2024 16:58:10 -0500
Message-ID: <CADkTA4PiAOWxt+jZmc6XRDEv9BMj=NBRrd3NuoHQt10MOHdEqg@mail.gmail.com>
Subject: Re: [PATCH 2/3] kernel-yocto.bblass: run kernel_version_sanity_check
 after do_patch
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196316

On Tue, Feb 27, 2024 at 4:01=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutronix.=
de> wrote:
>
> Am Dienstag, dem 27.02.2024 um 14:46 -0500 schrieb Bruce Ashfield:
> > On Tue, Feb 27, 2024 at 2:32=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutro=
nix.de> wrote:
> > >
> > > Am Dienstag, dem 27.02.2024 um 14:13 -0500 schrieb Bruce Ashfield:
> > > > On Tue, Feb 27, 2024 at 1:55=E2=80=AFPM Enrico J=C3=B6rns <ejo@peng=
utronix.de> wrote:
> > > > >
> > > > > Am Dienstag, dem 27.02.2024 um 12:36 -0500 schrieb Bruce Ashfield=
:
> > > > > > On Tue, Feb 27, 2024 at 12:09=E2=80=AFPM Enrico J=C3=B6rns <ejo=
@pengutronix.de> wrote:
> > > > > > >
> > > > > > > The kernel patches may modify the kernel version, thus wait f=
or do_patch
> > > > > > > before running the version check.
> > > > > >
> > > > > > While that may be true for kernel's in general, I sincerely hop=
e that no one is
> > > > > > patching in a new kernel version to linux-yocto.
> > > > > >
> > > > > > I don't have any great concerns with the patch, I just don't th=
ink it
> > > > > > is necessary :)
> > > > >
> > > > > Yes, the use case is actually not linux-yocto itself.
> > > > > Thus it might be most relevant in combination with moving the ver=
sion check to
> > > > > kernel.bbclass.
> > > > >
> > > > > How I actually came across this check is that (in some projects) =
we use the linux-
> > > > > yocto.bbclass
> > > > > for
> > > > > non-linux-yocto kernels since some functionality (especially frag=
ment handling) seems useful
> > > > > in
> > > > > general.
> > > > >
> > > > > I am still unsure if I should try to move (or duplicate) the requ=
ired features in the
> > > > > generic
> > > > > kernel.bbclass or if using linux-yocto.bbclass for 'mainline' ker=
nel is an appropriate use
> > > > > case..?
> > > > >
> > > >
> > > > There's no need to use the linux-yocto repository when using
> > > > kernel-yocto bbclass, so
> > > > definitely, it is an acceptable use case. In fact meta-mainline, an=
d
> > > > linux-yocto themselves
> > > > are both using kernel-yocto bbclass to build mainline/-stable kerne=
ls.
> > > >
> > > > I'd rather not move the kernel-yocto bits into kernel.bbclass, sinc=
e
> > > > if that was something
> > > > easily done .. I would have done it a long time ago.
> > > >
> > > > Keeping the split in the functionality allows those that don't care
> > > > about linux-yocto to
> > > > keep their recipes and workflow the same, and those that want to op=
t
> > > > into the kernel-yocto
> > > > functionality can just inherit the class.
> > >
> > > Yes, I wouldn't move the meta data handling and its tricky pieces, si=
nce this is actually
> > > something
> > > I see in kernel-yocto.bbclass, too.
> > >
> > > But.. do you have an opinion on adding simple config fragment handlin=
g in kernel.bbclass (like
> > > we
> > > have in busybox or u-boot)? So mainly calling merge_config.sh somewhe=
re around do_configure.
> > > (It would however need to be compatible with (or replaced by) the mor=
e advanced handling in
> > > kernel-
> > > yocto.bbclass.)
> >
> > I do have a very strong opinion.
> >
> > If we were going to do that, I also would have done it many years ago.
> >
> > Having some, but not all of the meta-data and merging split between the
> > classes would be a disaster.
>
> I would not call config fragments 'meta-data' and was thinking more about=
 something that is replaced
> by kernel-yocto.bbclass. That a split of meta-data handling would be a di=
saster is something I would
> agree on.

That is what we've always called them, because it isn't just the
fragments that are the important part, it is the common nature
of the fragments (the actual merge_config upstreamining is
something that grew out of what we have, and I participated
in the effort).

The fragments abstract and describe the feature and carry
information about how they should be applied (and in theory,
are used along with the patches), hence the "meta" information
they carry.

By keeping the official support in kernel-yocto, and leveraging
the kernel-cache as the common location for the fragments,
we've been gathering / consolidating for 10 years now. If fragments
end up sprayed everywhere (which they still can, even with the
kernel-yocto centre of mass), then really we haven't done much
else besides whacking some text files into a larger text file.

>
> > If there's something that the meta-data handling is doing in kernel-yoc=
to
> > bbclass that isn't working or isn't appropriate, we can fix it there.
>
> Ok, if the opinion is that strong, than this is the way to go for me firs=
t of all.
> (However, I do not have any meta-data in mind in our use case anyway.)
>
> > Other layers and classes in those layers are of course free to do whate=
ver
> > they want, but we need to be consistent in core.
>
> Clear.
>
> > In fact, I've had a bug and a prototype patch for many years now that
> > does move some of the configuration merging to kernel.bbclass, but it
> > only increases complexity and doesn't offer any benefits .. again, sinc=
e
> > if there's something wrong with the fragment gathering and merging
> > in the kernel-yocto bbclass that makes it not broadly applicable, we ne=
ed
> > to fix it there, not make things more complex and confusing by arbitrar=
ily
> > splitting it into something unmaintainable.
>
> Keeping it maintainable should be the primary goal, indeed!
> I would not call it 'arbitrarily splitting' but at a well-defined point (=
*no* meta-data vs. meta-
> data), but if you have already tried to do a proper split I'd keep this a=
s a good hint first of all
> that the topic is quite tricky.

If the merging happens in one place, the fragments coming from
another and the audit of the results living in a 3rd, then we
are definitely splitting things and making it more complex than
it already is.

If there really is something causing issues in the kernel-yocto
implementation, then that's where I'm interested in seeing what
the issues are, and how we can fix it.

Bruce

>
> Thanks for sharing your opinions on that =F0=9F=99=82
>
> Enrico
>
> > Bruce
> >
> > >
> > >
> > > Enrico
> > >
> > > > Bruce
> > > >
> > > > >
> > > > > Regards, Enrico
> > > > >
> > > > > > Bruce
> > > > > >
> > > > > > >
> > > > > > > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > > > > > > ---
> > > > > > >  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/=
classes-recipe/kernel-
> > > > > > > yocto.bbclass
> > > > > > > index 108b7e6752..854e4681d5 100644
> > > > > > > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > > > > > > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > > > > > > @@ -729,6 +729,6 @@ python () {
> > > > > > >  }
> > > > > > >
> > > > > > >  # extra tasks
> > > > > > > -addtask kernel_version_sanity_check after do_kernel_metadata=
 do_kernel_checkout before
> > > > > > > do_compile
> > > > > > > +addtask kernel_version_sanity_check after do_patch before do=
_compile
> > > > > > >  addtask validate_branches before do_patch after do_kernel_ch=
eckout
> > > > > > >  addtask kernel_configcheck after do_configure before do_comp=
ile
> > > > > > > --
> > > > > > > 2.39.2
> > > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > > --
> > > > > Pengutronix e.K.                           | Enrico J=C3=B6rns   =
             |
> > > > > Embedded Linux Consulting & Support        | https://www.pengutro=
nix.de/ |
> > > > > Steuerwalder Str. 21                       | Phone: +49-5121-2069=
17-180  |
> > > > > 31137 Hildesheim, Germany                  | Fax:   +49-5121-2069=
17-9    |
> > > >
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

