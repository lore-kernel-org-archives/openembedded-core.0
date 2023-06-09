Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03517C7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:10:49 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.14403.1686319848203442380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 07:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SnwB4Ojr;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-77807e43b7cso81927339f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 07:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686319847; x=1688911847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMxouQZYG4S3YLnZKcY02sIs+52kTy0GtLKkosPWfF4=;
        b=SnwB4OjrUbDNE5XpluLz3e7pRZldVw+0X3WqMGZ5ceWmiAT2KtmTMklpHSpXxLJCCd
         rvIJhhHHMEBjN4kbi6Tpq1g5r6x47D7rqPsy/2ZV2Yu6xn7F8gv+uW3SnzwHZoyGqlgh
         pMVcaE7LU1qL3pr1egjw9hT4KFSzaPw3bXEix6An6ZGNQDPuHYlMeSMhcMs8zbvPacXy
         PT8BcD/7UbnzkHc4sOptGebSm819oabin3a2FTyTyxHduFg/fjEpUwBWcFtiTYHHwvCv
         JX+/KazhJlsTgqMmLDi0zsjNI83nOsNVIjetJK1cl8ksMeFQoaim2WAEgnNXuCBswdog
         WH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686319847; x=1688911847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMxouQZYG4S3YLnZKcY02sIs+52kTy0GtLKkosPWfF4=;
        b=AUHfsgEVqBVGR4G0RDAGxoKJI9ftFXenLYRdN4Bdw09gITdcKQ7fB3LNwWLHkldcBd
         xwCW7nnW3Ks8HNZapa3eGEl4tgPtCB9+bYFgsgtBV3F0yA6XXYTJIU7YHxwuulONDESh
         pcyZINc+sXjM3nq1HOOxOTer/qvpJnrhar5DH094fDDP82/RpGHGhoRfU+0smI+vWuN+
         13mpBLj/sslDxeavwEBZXNm2gP5QC/VvwTIccrWibXC11IeBDDjUHbRRcFjpwEuIb1yL
         DWYWgxRaEK4hwAGYHyVTBzvmY5cCCn4pzc7Zczhg7/KJm1t+3uHv4i1BcrB0n8rtiwD2
         8JiA==
X-Gm-Message-State: AC+VfDxC+wLk84rZXcjNLt42LOcfcQxj1SzE1MrM8dKKzv28x8MgiErV
	Q5qefB2EzRfbu+RuC5euknE9gPiEY62H5PCY+M4FnN7O16E=
X-Google-Smtp-Source: ACHHUZ4pCJWZaiecemHNo8kN6MiyQjurRc/Gt0xL2l2BA9l0F7PhSscUf1ELyrAgqQsxArXxVSzHWJ8xcyNdIV+HTHo=
X-Received: by 2002:a5d:8513:0:b0:766:48cf:6ca9 with SMTP id
 q19-20020a5d8513000000b0076648cf6ca9mr1960357ion.12.1686319847379; Fri, 09
 Jun 2023 07:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230608193901.363242-1-bruce.ashfield@gmail.com>
 <20230608193901.363242-2-bruce.ashfield@gmail.com> <1766EC6ECDD1A1C4.6460@lists.openembedded.org>
 <b57e0650e30de28f9f5b9c4cd375b197f45b8467.camel@linuxfoundation.org>
In-Reply-To: <b57e0650e30de28f9f5b9c4cd375b197f45b8467.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 9 Jun 2023 10:10:46 -0400
Message-ID: <CADkTA4OiFggDh6LD69vrxvpQnA9+CF8za-wJFDJPRfjseDDK=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] qemux86*: TEST only set preferred provider
 to linux-yocto-dev
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 14:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182557

On Fri, Jun 9, 2023 at 3:19=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-06-09 at 08:17 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Thu, 2023-06-08 at 19:39 +0000, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > We are seeing intermittent boot hangs on x86. To try and determine
> > > if this is a 6.1-stable only issue, set the prferred provider for
> > > qemux86 to linux-yocto-dev.
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/conf/machine/include/qemu.inc | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/i=
nclude/qemu.inc
> > > index 0d71bcbbad..121e8474c1 100644
> > > --- a/meta/conf/machine/include/qemu.inc
> > > +++ b/meta/conf/machine/include/qemu.inc
> > > @@ -21,6 +21,8 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
> > >
> > >  # Use a common kernel recipe for all QEMU machines
> > >  PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
> > > +PREFERRED_PROVIDER_virtual/kernel:qemux86 =3D "linux-yocto-dev"
> > > +PREFERRED_PROVIDER_virtual/kernel:qemux86-64 =3D "linux-yocto-dev"
> > >
> > >  EXTRA_IMAGEDEPENDS +=3D "qemu-system-native qemu-helper-native:do_ad=
dto_recipe_sysroot"
> > >
> >
> > Unfortunately this has other issues:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7276/=
steps/13/logs/stdio
> >
> > Traceback (most recent call last):
> >   File "/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/lib/oeq=
a/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >            ^^^^^^^^^^^^^^^^^^^^^
> >   File "/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/lib/oeq=
a/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >            ^^^^^^^^^^^^^^^^^^^^^
> >   File "/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/lib/oeq=
a/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >            ^^^^^^^^^^^^^^^^^^^^^
> >   [Previous line repeated 2 more times]
> >   File "/home/pokybuild/yocto-worker/musl-qemux86-64/build/meta/lib/oeq=
a/runtime/cases/kernelmodule.py", line 48, in test_kernel_module
> >     self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
> > AssertionError: 1 !=3D 0 : cd /tmp && insmod hellomod.ko
> > insmod: ERROR: could not insert module hellomod.ko: Invalid module form=
at
> >

I'll fix this up as part of my -dev kernel work to get it ready as a
reference kernel.

> > But also:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/6105=
/steps/13/logs/stdio
> >
> > which shows ping failures, as if the networking isn't working. I
> > checked the boot logs and the kernel is booting but for some reason
> > networking doesn't become live and ping fails.
> >
> > I can see messages saying the "IP-Config: Complete:" with appropriate
> > network config in the kernel boot log so it is all the more puzzling:
> >
> > https://autobuilder.yocto.io/pub/failed-builds-data/qemu_boot_log.20230=
609064146
> >
> > The ping failures repeated in many other targets in that build.

This is a strange one. Not seeing that here, but I'll see if some sort
of networking configuration needs tweaking.

>
> There is also a perf buildpath warning:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/6105/s=
teps/12/logs/warnings
>
> which we'll likely have to fix at some point.

I'll fix that right away.

Bruce

>
> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

