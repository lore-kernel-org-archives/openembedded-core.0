Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96151C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 15:54:13 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.24477.1747756445970676523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 08:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kyr4ttJW;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2d060c62b61so3424440fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747756445; x=1748361245; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JW2W2HQq7MttqxIBr2zvbROiUF3n3tmyh7o5Xk4DaTE=;
        b=Kyr4ttJWWAce3YQpsNM1nDjuYzoWsvKopTjP2clTxmAVhyzu0y/WxRu6LXF3dHMoV5
         5BVK8D5ccOE26VCD8Kc4qzYj/L4qHu5G3eS/WLBA04aqPlcBiGHyXS44GBfSYy/TzH66
         EDnZo4CdAdvScavi1/iXF5iS6OTMHiPvKg0cgVzS5BRqJ6Lj8qAf4SLt+Zu8HBpK3quv
         H0Da+mNb2KF/DKfmIKtkGfKiutMgfZbN9FxG02FEfSYf/kpVr82nlYY9CE+lKTv9d0AK
         XGDj6LFuvWK9E9ZkiNr7uFaZeAJ1wkq0Y00CzPln/Y5V1rjBPQIeLgkFHyE1vm18LkRG
         rE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747756445; x=1748361245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JW2W2HQq7MttqxIBr2zvbROiUF3n3tmyh7o5Xk4DaTE=;
        b=fxJvB2ON75OVJrY4Femm0umAehwSXYiNZ7JjZKI5ZsT01I2GCMsk1fb4tSv3HfGrqV
         5TrI745/jBduD+s8RCdyNeQs/jQp2EqPIWzXRAUL/A8kUb/ezIxP3edxGZt7tlZe910O
         r451PfklgEAy9pYPdWe220zCTbHMPyz10LrIYy9MRVBq+7fxpCCmKHjZsL47B6FiAHjq
         +dPT9Jj9aQiytycnHWljdwD8ZfCvE9oMtI0W+ZgfwMEw5KzNuXT6ojM6caUZ/hSIbxT0
         Mt9DgTP1imfu19X7tb4+hQ7jXdNDnSEhhmrWTCye9v7pKAxmFJUpZfIropTBHFGbMQDa
         2Zqw==
X-Gm-Message-State: AOJu0YysictJEdmEZsYFDhm+WpXgVDrkviZq/dmgGUd0a37Efgy0NnVr
	OqUrt9dsQFg4VMpEbLHZo4wO6BgUFsgD1YPi65ym9vayQsW9NB8ny0iFQKwa4EgRMSt0KIsRw1u
	yomoALDcDmg1GeAioZwLrqQWzZo7WmcZi5txM
X-Gm-Gg: ASbGncv5wfMFpKh0yG7lptYcrNve+XHQ7f9HEZRzDcddzlG4Pf66esBou5nt0ng5OGx
	JtEn1tBN7Q62K0F6qM1yftSK2aZdKX+H4e/mVZ5ZF+4NZYZYcjVFmvR1GNPAQHKTsUpp1AfIPhU
	W/7x1Svbwtt97v+nmIOfoha22488tJYoB5
X-Google-Smtp-Source: AGHT+IGr+nfefar4+WXZwUjVRSNIagDaYQZqVkWalypA/60p16mCFW/wfInhMK+uhbas7O4EBJgJL/p8ZLqG8bjVaak=
X-Received: by 2002:a05:6871:a00a:b0:2c8:34df:8c4f with SMTP id
 586e51a60fabf-2e3c85e36c1mr9258852fac.37.1747756445072; Tue, 20 May 2025
 08:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
 <20250518-clang-toolchain-v1-2-5be46f8c4af5@gmail.com> <b141f2387a2a83d27ba1d5872b0a83568f486573.camel@linuxfoundation.org>
In-Reply-To: <b141f2387a2a83d27ba1d5872b0a83568f486573.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 08:53:38 -0700
X-Gm-Features: AX0GCFt6uC3JwITQD9lVVoLnfqtophNfU5eoNYz65Ps8LOBstplkwkcYKjdjSPE
Message-ID: <CAMKF1sofKn=WJMk4bJUHA75F3bSN64GQnMs_wHQvAUatjq0wew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/21] default-toolchains.inc: Add a global file
 to pin TOOLCHAIN variable
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 15:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216923

On Tue, May 20, 2025 at 7:41=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2025-05-18 at 14:30 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > Some recipes demand either gcc or clang, they can not be compiled
> > with
> > both compilers e.g. glibc, gcc, libgcc etc all exclusively need gcc
> > to
> > build and similarily, libcxx, compiler-rt need clang compiler to
> > build
> >
> > This header will contain the pinned TOOLCHAIN variable defintions for
> > such cases
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/default-toolchains.inc | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/meta/conf/distro/include/default-toolchains.inc
> > b/meta/conf/distro/include/default-toolchains.inc
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..691570a7a9f28187a5c7f6d0a6a
> > d80761c777e3d
> > --- /dev/null
> > +++ b/meta/conf/distro/include/default-toolchains.inc
> > @@ -0,0 +1,14 @@
> > +TOOLCHAIN:pn-gcc =3D "gcc"
> > +TOOLCHAIN:pn-gcc-runtime =3D "gcc"
> > +TOOLCHAIN:pn-gcc-sanitizers =3D "gcc"
> > +TOOLCHAIN:pn-glibc =3D "gcc"
> > +TOOLCHAIN:pn-glibc-initial =3D "gcc"
> > +TOOLCHAIN:pn-glibc-locale =3D "gcc"
> > +TOOLCHAIN:pn-glibc-mtrace =3D "gcc"
> > +TOOLCHAIN:pn-glibc-scripts =3D "gcc"
> > +TOOLCHAIN:pn-glibc-testsuite =3D "gcc"
> > +TOOLCHAIN:pn-glibc-y2038-tests =3D "gcc"
> > +TOOLCHAIN:pn-libgcc-initial =3D "gcc"
> > +TOOLCHAIN:pn-libgcc =3D "gcc"
> > +TOOLCHAIN:pn-libgfortran =3D "gcc"
> > +TOOLCHAIN:pn-libssp-nonshared =3D "gcc"
>
> This format made sense when this was in a separate layer but should we
> be adding this markup directly to the recipes now?

Yes we can, and I would prefer that as well.

>
> Does this markup work in recipes without overrides? I'm a bit worried
> that our variable syntax doesn't make this work too well at the recipe
> level.

We would not require pn override if it is in the recipe.

>
> This approach is much more aligned with the direction I think we need
> to go, we just need to sort the final details like this...

I will move these changes to respective recipes

>
> Cheers,
>
> Richard

