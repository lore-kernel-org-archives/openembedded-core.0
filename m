Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F54ACCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 21:14:41 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14063.1762636474338229473
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Nov 2025 13:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M04nC/Rq;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-45033024e45so174230b6e.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762636473; x=1763241273; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3n28O0yBMLjStOTK5NqjOOLNIUqcR/s7QBC7QvuC5k=;
        b=M04nC/RqynxXMSmeom0Go/1SLtUh25xz9wNHy4z7uKCHBvHSc0d2PXZQgjysTvfwJw
         m0/B2SbHfYsTJLK61qr5K2/4NqgLOm4r5G3sTnHLtCi7D46KFqqwOF14GsEz6E4KxWut
         vw62AK/aLG/V/rEzhb+XdKNYyd8jSU8WVIcaCMljBcqW18L5Jdy9eugOVvmP0DDdYp/T
         jZgM5sXk/qOG+GocPFs/L9U3ZFUH5D7JurBu0NFScSj/apEP31wOmAWwmaq1fNg1CGCx
         e4FOBh/h9IZ50CTk9gbD/0UtG/joFX8ZksCaXd473LrfYNxse7t7Pkuk9grAwdB+K2Wo
         t2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762636473; x=1763241273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h3n28O0yBMLjStOTK5NqjOOLNIUqcR/s7QBC7QvuC5k=;
        b=tPMRD7fZrfqwQXZsYR2jcxQYKu9Zt5+7ynkHO7LzYxR2y8AyD8NW1QgUNkFPbjJeQX
         jbOhvyoCv0mrnGAvJ7tC6aLB3bscIh5UztI/vSfUWBF4xBGGXLlkey1BwRD+zgYpZpj6
         QmQ5dt9sKP0HuC0s73smA+BCHWgQXtmMEn1IWm6uoCLJuoyBh1n80IZ7eN6QiWgckhog
         tVC/NPUUrzsH4T4bv6S8rcHGZmwqO16rJABIqAAOTbKpQftOI6PW75TQ2UPCgH0pHxsu
         FCzZryCY1afhIOq4Eg7y8Zw6SbhMhhMhQyVnraCFrb7K+DaMM6tNnkHJyGJASVSa1oLi
         nR2w==
X-Gm-Message-State: AOJu0YwMGeVWXGgaI8+w/w5s4E8wdRTgj3vFbHUC/xJCU3oLcOFwtFfh
	e1ArcLvaXLnU6QK9z7Xp6SaWpSK8SzGdf3+boyZkt9LAeYAEIH0hnrMGVdyB9ZgED4QcaZ5k7hm
	oKt3c2uQzuSOntXEcULuBsXBppFQazSY=
X-Gm-Gg: ASbGnctOBd7O+ERB32holdDJOgOvBc7zwkgBNwWmZpu+ycOYdHG5SbvMP4/ulg/cGVE
	cjJcJG1Bk52Oq4thzzeZZ7foDtExACQSWX43tc7KYWKsUBdcAAh0E17YBZbHGBSLnM+f8zR68lQ
	CZ2gnco55SvXCmd91okdF+tXfVqGtF4w5S5tq2XMEYBkNu8htGQ/Afc0yVFkTYH0TXZeDEA126I
	KcdrJ8g94DxHjziAAP6IzAUiWl8Nfl2/APezWfuZHiwv2KTkUcnG7DuyR4F/Omn4/Euyw2R4Vr/
	Er5vN8XH
X-Google-Smtp-Source: AGHT+IHR0cnft7wALfyBRXQLhctZlu+r8SD2Ti1m2YcDLPKxEDbdRyHLMJJMkBeNwIALHMakIduMBskDWgwYsAP2jyQ=
X-Received: by 2002:a05:6808:1a21:b0:44d:a4d3:b6a6 with SMTP id
 5614622812f47-4502a3fd79cmr1965822b6e.35.1762636473379; Sat, 08 Nov 2025
 13:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20251106204536.2079412-1-ankur.tyagi85@gmail.com> <DE35FEGOLJK5.C1B3O2A9MVY7@bootlin.com>
In-Reply-To: <DE35FEGOLJK5.C1B3O2A9MVY7@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 9 Nov 2025 10:14:22 +1300
X-Gm-Features: AWmQ_bnK_ySMC85bETSywU1ja_B6e-l7He1IeBB3EQqNkFGe-lyjdoFD-FkH2ys
Message-ID: <CADySD0HbLkexh+Wyjn-3zWXiAAfHfU-qr0kXS6FY4zuJk-Fvrw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/4] nghttp2: upgrade 1.66.0 -> 1.68.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 21:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226086

On Sat, Nov 8, 2025 at 8:52=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Thu Nov 6, 2025 at 9:45 PM CET, Ankur Tyagi via lists.openembedded.org=
 wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Changelog:
> > https://github.com/nghttp2/nghttp2/releases/tag/v1.67.0
> > https://github.com/nghttp2/nghttp2/releases/tag/v1.67.1
> > https://github.com/nghttp2/nghttp2/releases/tag/v1.68.0
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
>
> Hi Ankur,
>
> Thanks for your patch.
>
> It looks like there are some new installed files that are not shipped:
>
> ERROR: nghttp2-1.68.0-r0 do_package: QA Issue: nghttp2: Files/directories=
 were installed but not shipped in any package:
>   /usr/lib
>   /usr/lib/cmake
>   /usr/lib/cmake/nghttp2
>   /usr/lib/cmake/nghttp2/nghttp2Config.cmake
>   /usr/lib/cmake/nghttp2/nghttp2Targets.cmake
>   /usr/lib/cmake/nghttp2/nghttp2ConfigVersion.cmake
>   /usr/lib/cmake/nghttp2/nghttp2Targets-relwithdebinfo.cmake
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2701
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2533
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/2683
>
> Can you have a look at this?

Thanks for pointing it out Mathieu.

I also managed to repro this locally by enabling multilib, sorry I
should have done that in the first place.
Will send v2 later today with the fix and also enable multilib support
for future submissions to avoid such errors.

>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

