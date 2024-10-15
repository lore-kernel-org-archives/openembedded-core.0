Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81FBD1F9CE
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 20:56:21 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.7768.1729025777343837335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 13:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XIc8PjAO;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e7086c231so1420685b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 13:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729025777; x=1729630577; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zMwoDM/LqoC3EEplKprZSLL4y/rqna2RV4mg+MkTtY=;
        b=XIc8PjAO9iWBS5VJa7DrFDPV69aIHqZWARF7enbRfHdnT5+AAYfH/kHHzfsh9PKo6Y
         g5LoId047BuFC02tt2ejjd7FoM0FYm/2rlL10qf1pifU8KZwH43eYw869N8FrqA4nboq
         SN+dmmfWtkXa2Gy3sWmc2/KqEBM1tq+c3pagiZhvMxocmrFESpaadlF0FeyNSe72Dgw/
         vtRu4d9QVElo6eBzWaV9+imfVyRj52mgK6rQUB9T8cbmDXesfeV0b/c2jR9Yrz3DSqNF
         t3Oeq2uCPSKxyH9t2NWVisLtr05TYIZ1pmt0s83YRexp3jFleY2HyBT7JHvCiLN6ZVGV
         bNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729025777; x=1729630577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zMwoDM/LqoC3EEplKprZSLL4y/rqna2RV4mg+MkTtY=;
        b=Ud3ah/sxxr12CWYrs4SIj51f3Dp4B8LGqVC8ONr20xzRJoBDkhMLw7vZE4Y0ohR4IA
         XawpsUuR+1g7ppkMMsFeX/8mplRMuQe9MB4lDNlnigv/jdRRSdgsSbdP+j5Tx4ietOKK
         agyGOSkrPZGZyUDo678Vu6EHsqYhv9O0loag2eRB5stvsWmeaeTbgyZGHh/pnYyWe3GQ
         j3HtM1/OH9M44y1O6aNvZEoC4L2R7X3sP52R/y2zpZBezmb3Jnaobisp1J0XQQOh5tMF
         I0A3nb/kR6Jpz1rll1/DKshhsit3bKc1nqYk7zhTKUiaXKQ8fR12mCYuhxZHMGcUSTob
         l8aw==
X-Gm-Message-State: AOJu0YyQaJOn4PPf4zcqJ0CCpiwdOVZRdFbUdfp+wyyvR0/p7eSfUvSC
	sG44pYz5MhIHbtKwPtYwV/WJ+/XVuTkkpRqFukPZaa7UY57saRL5jWLRMdbbMfrEP/DrfkmyQG/
	h3pKd81ngtVQHJ6N8DS9YJeidQzGsD2ET
X-Google-Smtp-Source: AGHT+IEjc/6WzefDN3hF5KYkZl+xLpfGcTNk2EheXqP+KZUiJ/ugMmi4aQl68RqLim+WaV7B2GxLbbCJEpXFYWyRWXA=
X-Received: by 2002:a05:6a00:91ce:b0:71e:55e2:2c54 with SMTP id
 d2e1a72fcca58-71e7da37396mr2221796b3a.12.1729025776679; Tue, 15 Oct 2024
 13:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1728912923.git.bruce.ashfield@gmail.com>
 <88eada332f5d3d00baf9f2cedf63460d80356032.1728912923.git.bruce.ashfield@gmail.com>
 <453e16e5f843492aa7aac45e0311046729e4155b.camel@linuxfoundation.org>
In-Reply-To: <453e16e5f843492aa7aac45e0311046729e4155b.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 15 Oct 2024 16:56:09 -0400
Message-ID: <CADkTA4MGh=XDy+gCx7wYd-AvLCGweMFLTR_4hHQZ+tT36xUsDg@mail.gmail.com>
Subject: Re: [PATCH 1/6] linux-yocto-dev: conditionally add coreutils to depends
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 20:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205947

On Tue, Oct 15, 2024 at 10:15=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2024-10-14 at 09:45 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > 6.11+ uses truncate as part of the build. While truncate has been
> > added to HOSTTOOLS in oe-core master, it still is possible to
> > build a kernel recipe newer than 6.11+ on a release that doesn't
> > have the HOSTTOOLS tweak.
> >
> > We can test for truncate and condtionally add the dependency.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipe=
s-kernel/linux/linux-yocto-dev.bb
> > index 292897ce43..752d108bd8 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > @@ -44,6 +44,10 @@ PACKAGECONFIG[dt-validation] =3D ",,python3-dtschema=
-native"
> >  # we need the wrappers if validation isn't in the packageconfig
> >  DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '=
', 'python3-dtschema-wrapper-native', d)}"
> >
> > +# 6.11+ uses truncate in the build, so we need to either have it in ho=
st tools, or
> > +# build it ourselves
> > +DEPENDS +=3D "${@bb.utils.contains('HOSTTOOLS', 'truncate', '', 'coreu=
tils-native', d)}"
> > +
> >  COMPATIBLE_MACHINE =3D "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|=
qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch64)$"
> >
> >  KERNEL_DEVICETREE:qemuarmv5 =3D "arm/versatile-pb.dtb"
>
> This is for master so truncate should always be in HOSTTOOLS? I don't
> understand why we need this there?

It came out of a discussion to do a reference for people that are building
newer kernels on older releases (of which there seem to be quite a few).

So either we'd have to bacckport the hosttools addition (which is likely
possible), or I could throw together that reference of how you'd build it
conditionally.

Bruce

>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

