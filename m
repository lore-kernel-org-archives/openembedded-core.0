Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175E7E66886
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 03:34:41 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94618.1766460869083981017
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 19:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HZ20IBOI;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so5044617a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 19:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766460868; x=1767065668; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFoqcnqbMI54Lrh47sCqp7HuSRzUPWKmxN4l6rGGwxQ=;
        b=HZ20IBOIwSzyeReFUZo+HlDegIoTduohYYWHow4lCcHijWzO/fgQv6Uz236IzBtlMa
         1xkL4+Lkt46d/a3SG0Db25m3LfaxRovk/TVRy5Ss/kV8GEWo/yV5l9ZJ+TWj2kb8DoT0
         jvi2JWpH6tvBAmqF0QUlXM9r9SkY/EI9jgUsg1NiXQVdxiUFM8w2uqv1ILMdoAq3hsfR
         OjVG9dJwwi+lZefPrJN4q0bSObTkZ/Lm+9q1sUTUc5u+8mYRmu14OBbkxvfsmLeCdD3D
         CqFWB/mPsM4dIhP2NAF5J1V+o/nDk/awoiZPSRA8gCDDinV2U6I2j9gycHXSTFEQfzN6
         ddKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766460868; x=1767065668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TFoqcnqbMI54Lrh47sCqp7HuSRzUPWKmxN4l6rGGwxQ=;
        b=vUVLABOGqLyhEBrI9FXG/S6iAmW5rJhv9MAZnFR5mGAFFQI78i+CSaCa49jr6U1zfO
         lbnHci03pcgwv8/hpis4dv+GooK2elCW3YxKTo/dGX2jbxHXBr9ki852WgoJohChuigd
         vnBI/xSdnTOB0GbV8xsrHgimZYu4DG0/gVq+DeLOgIpuoGVi2ZrEzW777Xs+GTsCf6lX
         fWJwIqv2+By2U5vdmvGcoINC5JernBS8ayFqDp9I1AsYD6I7rG0AAAvGQ2R/K3yaOiyC
         EjF/E9xVOcxiva+9VcHUyIMmS8cm9E1a4W/DW7rf9kF8cRasjDER5A/KVdKnGS3N5MrM
         qdYg==
X-Gm-Message-State: AOJu0YwraBdndZGpLI1JWetDqACGzQRQ7O0T2tEbDnCel357Kk3n/qcp
	22jlsTbf9ZXRLpCOzGKDi4XSfhmZfGDy/ZztUL1AyIsIy3wQBGxTJV5E4ZhamTcwbP4L5yKJ65F
	8PdEwbS18l/ZHdiVCCwmm23a33sfL+gw=
X-Gm-Gg: AY/fxX6dNTh/SMfRlc5PDfPNcS6GtRlXDlsZLBTuQDj1sh7GkxMZ9pW5OJfOdgOTeNX
	gPw1wDtNaxhZr8BP+hCf74oMgC1/wRb92YpWWNJFXJ5BBY269Q2cXngz3uxAi50ZXZw8bfOhO7z
	c7FQRmkeApPFt41yuT/uCsj393kNIGe2i6qFgguzjX2NTe4kSuKdL4WgHMjwOra3BuSjeI5BG12
	IqWco3m00Jc46WclYWPJs6I1269m7lSqJn25ueFggqhd+5WQNj4EjUvo3My7Fw7jvNl+w==
X-Google-Smtp-Source: AGHT+IEuuPT72/lRRzka0H2w/ZoLKiECbyteCd84/aWzBaG6XF8o1HVrHc7tO0leh+Vu602ezaDP01i9e/w/agwxTZI=
X-Received: by 2002:a17:90b:2f05:b0:343:a631:28b1 with SMTP id
 98e67ed59e1d1-34e9214e781mr12846443a91.16.1766460868247; Mon, 22 Dec 2025
 19:34:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766087617.bruce.ashfield@gmail.com> <5044d0ec483159af764bfd2b51baf08e6410ec8e.camel@linuxfoundation.org>
In-Reply-To: <5044d0ec483159af764bfd2b51baf08e6410ec8e.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 22 Dec 2025 22:34:14 -0500
X-Gm-Features: AQt7F2qrAegnY8wi0G7xrYlTgQU6r6kgYHJGbgeTHpDen1SU3PeBXGlOGz-E_Zo
Message-ID: <CADkTA4OCyZUO5ASTEi+i7iyhYD9Zp8byzYOa+4UBLfGt2w+xnA@mail.gmail.com>
Subject: Re: [PATCH 0/21] linux-yocto: combined and consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 03:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228445

On Mon, Dec 22, 2025 at 9:13=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> On Thu, 2025-12-18 at 15:22 -0500, bruce.ashfield@gmail.com wrote:
> > As discussed in the weekly engineering call, I'm sending this as
> > single series even though it crossed boundaries of the repositories.
> >
> > I don't have access to meta-yocto-contrib yet, so I haven't pushed
> > the component parts to contrib branches yet, but will do that for
> > future pull requests.
> >
> > I'm using this as a first run through some things I've cooked up
> > to coordinate the patches across the repos. The formatting is my
> > own, so apologies if it isn't clear .. and we'll see if it all
> >
> > Now to the series for OE-core:
> >
> >  - We have stable updates to 6.12
> >  - A kern-tools fix
> >  - Updates to 6.17
> >  - Removal of 6.17
> >  - Introduction of 6.18
> >  - Bump to libc-headers to 6.18
> >
> > I've built and booted what I can locally, and I know that the
> > major architectures work, and are functional with respect to
> > core features.
> >
> > I have more libc-headers testing running against meta-oe and
> > muslc, so there may be some breakage there and I'll help deal
> > with that if it happens.
> >
> > The update and then removal of 6.17 is on purpose. In case any
> > one was using it, they should get the latest tested before it
> > starts to be removed.
> >
> > For meta-yocto:
> >
> >   - removal of any remaining 6.17 references
> >   - introduction of 6.18
> >
> > The meta-yocto default changes are obviously REALLY RFC/RFT
> > there will be issues, but I've provided them anyway to make it
> > clear that we are going to 6.18 as the new default for all the
> > variants.
> >
> > Once we get 6.18 fully green and the h/w references udpated,
> > I'll remove 6.12 and 6.16 from master. That isn't in this series
> > by design.
>
> I ran this through some testing and it isn't straight forward.
>

Back online after a 10 hour drive!

> We need a newer strace with the newer kernel so I queued that patch
> from Robert. That caused ptest failures so I disabled the failing bpf
> strace ptests.

ok. I'll ignore strace and assume that bump will handle it.

>
> ltp failed to compile so I backported a patch to fix that.
>

ack'd

> We still have a cryptodev-module failure:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2922
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2897
> (all world builds I think)

I can handle this one, it'll be.a day or so, but I also haven't checked
the  autoupdate list yet to see if this is in it. I'll check the lists befo=
re
I start and see if anyone else has an update in flight.

>
> and an initramfs module space problem:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2931

And a config warning (easy for me to fix).'

For the space. Is it only genericarm64 that we do this test on ?  It
could either e normal kernel size increases, or it could be all the work
that has been done in genericarm64's config that has causes this.

If it is normal kernel, then I can have a look for something obvious,
and then we can increase the size. If it is only genericarm64, then
we should get Mikko's opinion on what might be options we could
tweak to reduce the size.

Bruce


>
> The rest of the build is still ongoing.
>
> Cheers,
>
> Richard
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

