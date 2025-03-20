Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1457C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 17:36:32 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.980.1742492191390601500
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 10:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sb8PVyMF;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499bd3084aso1050039e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 10:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742492189; x=1743096989; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68wjmqxBFUnLPIIl28K400uekWgiq5Ptw7grfz2q5jw=;
        b=Sb8PVyMFgFuleB074RzZA29TBuN1beGNyiLU1dkryOXzdFfM+aZPN40UItCJdromD0
         TzH2b/JRfMltgVEeKjCDLYqF+yn+VRZcCfQoeF2yGyaMlT7J+sxoV4aU411HFyZlmajT
         6bhE+Ry4KVtsriB/QbuIMuZ40VTeYXjn0YSj+Qv8k3VlFFxYpoOFAlxTOLFtDAJsjwQH
         0uuF+bRuyZ7aQXHxHjhosk7wmA+OcNt7fuxW58ie8C5oFstVaJuAyA0UJaER9oWRBVpm
         /ylSMzCMos2tyzWfxaDGQX4S2/kjaieluBRMEcBTGxHwAXhu7WQsSV7BElq7kb+PPULU
         fxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742492189; x=1743096989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68wjmqxBFUnLPIIl28K400uekWgiq5Ptw7grfz2q5jw=;
        b=bu34Ys+C3DJsYp9xj0+k1rwqU9zAooHqCEWHq79Umm8fAkAytLA48kpaFJX+NvL7xl
         TT5RhP3AUtjHY21RJ1JzgCgOUmf4eUhio1DhxYYvY0h+mYpIH7jmTTd9ge5G4nzuLFeJ
         pWXVhxWpjxt3roQ4cV3ScdXuzU+xRVaBUmec4uIzQvAHvUdCDlR1yOkEGM1Xn0eM2F74
         xGJCfiglBUnEa1REc+5l7B/sulonEo+TPKVpMi+hOr+YqrCGxhdvDI1yVcTZyka0uLSH
         dHVfRLrxJVycHlYgfwCY4w8Bwu1FOZLSpWfnFg7DqwxTEBmYdCNu4ZG/RY5PT+Z5yUN3
         Uqlg==
X-Gm-Message-State: AOJu0YwrEYyW7J4r1BMpwwB9sTGAjxwC5gI90bSk42ivf4JGP3nRZ2+H
	4W/4BHgKZV1oyChxPKeh5lbbeKyBmJWIwW+WIPqa079ZB3SOa2bZju0o7fAxzljNtUsjNmH6uuX
	WLpevVezDhf2oWv9QN8RmRxXFCyQ=
X-Gm-Gg: ASbGncslsDyWFgbSSWNBqyQhR+XfWrNJiU8su4aQCUYGbr/silYkBczlEX0v0fVt/Oy
	46/60wV7qSJCCnYqP6NdSIRTKd/SWWlx7H47epKY3W7qH7DkpeYNcjoY9aLe9pMpb3/mg4FKkJj
	RXlJ9UJIzfjk66oNoKcFJI1eu5BCeB
X-Google-Smtp-Source: AGHT+IH73iuI7ykjsITbB8mPy7DFX9RrWBlFDKs7fm5jdQ3hLXYP5u+WQgqlSUk95BI/Fk6DomzXHcJBKiCS/zvI4BI=
X-Received: by 2002:a05:6512:b94:b0:549:38d5:8853 with SMTP id
 2adb3069b0e04-54ad64806c4mr83223e87.17.1742492189149; Thu, 20 Mar 2025
 10:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250320165517.129442-1-martin.jansa@gmail.com>
 <182E912DEB60EF95.20788@lists.openembedded.org> <CA+chaQdD7i8xjuz9iPSNMfETo-5BNxsN=LibdZPrgdTYatccfw@mail.gmail.com>
 <182E91CCE4A2B275.19116@lists.openembedded.org> <d3f1a6601b2438007a963b69bf41d647672f78eb.camel@linuxfoundation.org>
In-Reply-To: <d3f1a6601b2438007a963b69bf41d647672f78eb.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Mar 2025 18:36:15 +0100
X-Gm-Features: AQ5f1Jo1oIXh6f2JD8j7R-qu8KG0JRdFmz27HSonFpYQNZ7aGc_7CT-kSmL0Sww
Message-ID: <CA+chaQc4kxzLcbFkZswbftUevsjcO4aYDzNVh6hMxj4miv9m1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jean-Pierre Geslin <jarsoper@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, DongJoo Kim <dongjoo.kim@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 17:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213422

On Thu, Mar 20, 2025 at 6:16=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2025-03-20 at 17:06 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Thu, 2025-03-20 at 17:59 +0100, Martin Jansa via
> > lists.openembedded.org wrote:
> > > This 2nd one was supposed to be sent only as RFC, but I forgot to
> > > update subject sorry.
> > >
> > > And this version also has a typo "=3D ?=3D", will send v2 if we want =
to
> > > do
> > > something like this (reverting the
> > > https://git.openembedded.org/openembedded-core/commit/?id=3D16745b204=
52de60ae2474433cc1a2fb1ed9f6a64
> > > is imho better as it doesn't respect the original author from
> > > https://patchwork.yoctoproject.org/project/oe-core/patch/202206061326=
53.60232-4-brgl@bgdev.pl/
> > > and with CARGO_BUILD_FLAGS_PACKAGECONFIG it's imho more confusing
> > > than
> > > useful as the default)
> >
> > I have a strong preference for not carrying things like this. If
> > there
> > are existing recipes that break, we should just fix them and move on
> > rather than letting the past dictate the future IMO.
> >
> > I'm trying really hard to simplify things where we can.
>
> Martin pointed out I was misreading things.
>
> If there are recipes using packageconfig in RUSTFLAGS then this will
> break that. We probably do need to revert as I really don't like the
> alternative variable mess. It does mean recipes will specifically need
> to add the flags to the carbo build parameters but that is the lesser
> of several evils IMO.

Agreed about the revert being lesser evil.

I know very little about rust/cargo, so it's also possible that we're
using rust/cargo wrong and there is a better way to achieve
conditional compilation with flags passed to cargo not by RUSTFLAGS.

I've checked the recipe where we're using:
RUSTFLAGS:append =3D " ${PACKAGECONFIG_CONFARGS}"
and it's public as:
https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-mu=
ltimedia/gstreamer/gstreamer1.0-plugins-webosrs.bb

With the RUSTFLAGS then being used as
PACKAGECONFIG[unifieddecodebin] =3D '--cfg feature=3D\"unifieddecodebin\"'
in the recipe and in code e.g.
https://github.com/webosose/gst-plugins-webos/blob/%40rust/gst-rs/unifiedbi=
n/src/lib.rs
as:
#[cfg(feature =3D "unifieddecodebin")]
...

Will send revert unless Jean-Pierre or Bartosz have better idea how to
deal with this.

Cheers,

