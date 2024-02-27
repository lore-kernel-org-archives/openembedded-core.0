Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082AEC54E41
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 19:13:38 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.2849.1709061210063376458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 11:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PPZOc0fK;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-29ae4c7da02so724377a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 11:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709061209; x=1709666009; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IY24YTQnR/yYBQSKANBE1k2V5PrvQwX0a2Tzjc92y0=;
        b=PPZOc0fKl18vrFB5IVom4JsZ3jOONPCI8a42MwvzJm2cR10Es/wImsxgks34fnFKHP
         QRJmFAitO1i8RQSAmEWOOLOM8MoXkUobXA2DSawjUWGw2CjWBpUUyh4EVcLnTupfTpDq
         O7H0z49icnfOLdilEJ3VDmt2hTyj0ndZOEULwC2klCk4pSDCAEcbLC/H76yTGxsl0ccq
         SowknGgD6KFjdzXc1Pt8hmXvkHDpSFXhMJzFKTYjj467iq0gR1WMKqnhpNHprCGZqjVt
         3zM9JmJx+zbRdSdZsssmoGRJsQF93r2DPQsxU+l8vMNFJan7qk5gQxvKV4jUEL/mbLkU
         IoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709061209; x=1709666009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IY24YTQnR/yYBQSKANBE1k2V5PrvQwX0a2Tzjc92y0=;
        b=QQo6CWQQH0GlBnrtv0UPqoPgZ+VTp/Y9EgXtpkYXwN+iZ/UbeSNMwrpAgPOolaIxOp
         u9QRES+xCCzsdj3O9/MvJgriwnc4kh/oWWj+6xG5SjfzVvX0f82DZpxPK2zWUHHPbIDL
         xUvrKvAFuY2Az0Z0Mg71CAmgIku0+2yonV0W6KBnSZBWGOOhm9BvIvMe+OVM3u6NtyUc
         IlGpuYQoth8YK1pCWM1BD54Zv8LR2qc/dw8oZLTqi8lwAlvKtBxMI0I9Qj1hRqke5fKl
         m1ygXnrHQGqAauBgTuXSTrpV2dIxUUbdkMZ+xOx4twYEWOJ6hDGDsXwzh97Rn91wSAMt
         tKZQ==
X-Gm-Message-State: AOJu0YyFRoCTXEhg1fs+PgmVNDUYGK9ijrkI9dEI0W2dCYUz/xPbhefL
	RCfWh+hatuo3t2GyYE4j0QNuTOlcqEj/1iauqT0c2t25HUTlrrmpJA1qpF4n1Qfu3AyTHDlHDkY
	0K6J+C5ozgzDMrZGUF/ZQ3Zqb8Mw=
X-Google-Smtp-Source: AGHT+IEQ2V7CLEUhaRH6xtM/4qeHizYJwOIIQnm+2aoXRgoNbZwYQj71eUsx94VvSbJSFGBU6W0gItKnungTPZkUGSs=
X-Received: by 2002:a17:90a:6047:b0:299:3efe:8209 with SMTP id
 h7-20020a17090a604700b002993efe8209mr8154609pjm.4.1709061209235; Tue, 27 Feb
 2024 11:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20240227170902.3718203-1-ejo@pengutronix.de> <20240227170902.3718203-2-ejo@pengutronix.de>
 <CADkTA4PY4HXpcu4K7YkuqLSuLor=tKfTz04fEORKBRycgE12Fw@mail.gmail.com> <b3485a14d8f03e3c29e6f12a065775e1522e7ad0.camel@pengutronix.de>
In-Reply-To: <b3485a14d8f03e3c29e6f12a065775e1522e7ad0.camel@pengutronix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2024 14:13:17 -0500
Message-ID: <CADkTA4Ou-ty361eSd3LxBvKNn75EoDn6pbtEE63gwd0kg+uWtA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kernel-yocto.bblass: run kernel_version_sanity_check
 after do_patch
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 19:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196292

On Tue, Feb 27, 2024 at 1:55=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutronix.=
de> wrote:
>
> Am Dienstag, dem 27.02.2024 um 12:36 -0500 schrieb Bruce Ashfield:
> > On Tue, Feb 27, 2024 at 12:09=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutr=
onix.de> wrote:
> > >
> > > The kernel patches may modify the kernel version, thus wait for do_pa=
tch
> > > before running the version check.
> >
> > While that may be true for kernel's in general, I sincerely hope that n=
o one is
> > patching in a new kernel version to linux-yocto.
> >
> > I don't have any great concerns with the patch, I just don't think it
> > is necessary :)
>
> Yes, the use case is actually not linux-yocto itself.
> Thus it might be most relevant in combination with moving the version che=
ck to kernel.bbclass.
>
> How I actually came across this check is that (in some projects) we use t=
he linux-yocto.bbclass for
> non-linux-yocto kernels since some functionality (especially fragment han=
dling) seems useful in
> general.
>
> I am still unsure if I should try to move (or duplicate) the required fea=
tures in the generic
> kernel.bbclass or if using linux-yocto.bbclass for 'mainline' kernel is a=
n appropriate use case..?
>

There's no need to use the linux-yocto repository when using
kernel-yocto bbclass, so
definitely, it is an acceptable use case. In fact meta-mainline, and
linux-yocto themselves
are both using kernel-yocto bbclass to build mainline/-stable kernels.

I'd rather not move the kernel-yocto bits into kernel.bbclass, since
if that was something
easily done .. I would have done it a long time ago.

Keeping the split in the functionality allows those that don't care
about linux-yocto to
keep their recipes and workflow the same, and those that want to opt
into the kernel-yocto
functionality can just inherit the class.

Bruce

>
> Regards, Enrico
>
> > Bruce
> >
> > >
> > > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > > ---
> > >  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-=
recipe/kernel-yocto.bbclass
> > > index 108b7e6752..854e4681d5 100644
> > > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > > @@ -729,6 +729,6 @@ python () {
> > >  }
> > >
> > >  # extra tasks
> > > -addtask kernel_version_sanity_check after do_kernel_metadata do_kern=
el_checkout before
> > > do_compile
> > > +addtask kernel_version_sanity_check after do_patch before do_compile
> > >  addtask validate_branches before do_patch after do_kernel_checkout
> > >  addtask kernel_configcheck after do_configure before do_compile
> > > --
> > > 2.39.2
> > >
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

