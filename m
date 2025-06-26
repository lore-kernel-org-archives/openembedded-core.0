Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BCCC77B7F
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 04:30:10 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.960.1750912209761445080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 21:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JmsEHopn;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-708d90aa8f9so6321837b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 21:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750912209; x=1751517009; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pj39S656OE6JaWjhZvUQwBDj6R3xqtLzNqFJy5iCY4U=;
        b=JmsEHopnXKd9gkOLf4SAsm6uvnnYyVctiwaPh+QKs69a2BSkUcq/XdmARfxKcGQ6eK
         MciIOUKMoKKqp5awPTI6ie6of8Ui20sifPdjYDVcSrh24Vyzece6KHwl+kAuEaOe+Rir
         BR8vAmCvO4QqHB7meEU/LzIpt6U1IBBFxh3J+nResdjzlN6VG3YWLd/MNjEOf/+0aZmW
         z9ztR+G3UFThBzvJNDCtGyOCVKvLdWAWyPh1eO3XsCNw6Hb4SPf7ZWHkZJeDpjXBRSnR
         OxfFtbqZ5lQE1AqUjl5SWpCj+b59LWzlUtAZ2C0778GP6blzquvBoG87AnkZWTuq1O4T
         vaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750912209; x=1751517009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pj39S656OE6JaWjhZvUQwBDj6R3xqtLzNqFJy5iCY4U=;
        b=CsOF7ywjrKz1WSEhVd61DDnMosouiIjvHBm1vX0F+Xpibf3CGpYgDb7YsHYnsRy7/Z
         XrYnbfC9ohEpV8irV7BPNiMrqjogYtSEaR1i8XK3dGf1obiLbt7ZQHniNa6WIzm0esBT
         /kGREkgoyBWf6WyOcGokJYAj9QuozjUtgeZaGIWb74Wo5ioVIi1hHbKt1O4ChPsD08Tm
         gOollOlMWXTuLLZcfgGlm465PrOh+3iI8wtRzNf638ShUTrvDeTGuw3Pm2tcny89UHt1
         7Rm6geABDwOdzYFwwIMs8TpwPBmx6Ly1xOzmXbIQqCnVhOubwkEi1DVIeZr+uLZPZ5Dn
         K+ng==
X-Forwarded-Encrypted: i=1; AJvYcCU5DBFy7GezeJLoxUbovJ34GkalN1jGzJPYiy8uO5i3QU8aj7LH4mr90AM9PbcdPZyhIbc+EMCkkxdgoaiNE2QXmg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YznKbLM5QzRNDZd0KztsGBeS4spKrICqeXIcOEPJNJ2y/qF4/eM
	aD4frgjZI7JxBpKg+L5UKa3iCmiB+mWUPo9YHZxaW4OwEbpsx2DULsVP4Oaqr2Bb+jrxa6Z5hsS
	rnzMubLXlndRTmIQQ0Ddi5JML4Sr3tPg=
X-Gm-Gg: ASbGncvhOdMxp7E6iNdhiVywKN6TFdlv4c/bXB4DUG+CQhX7G27MSKTL314a6cNcCXw
	1RqFZE9ns4lSJh5wCwOIhrSrNRl7JhfIm7IR6QAb9rNegLuNuA7XIs+XRoBg1g04dHOn696jdYa
	neXUoedTr39GUlLHV3C0yXoM3flsZZioeDQkCMpU0XCyc=
X-Google-Smtp-Source: AGHT+IFU5FmasLNlA7v1T9zC0GZtbX8UU3adZJHY93x9/kOL7tnxMYgA0UO98jIkQO+9ZiMy5P01CVjLLKxjK/6jMDo=
X-Received: by 2002:a05:690c:7107:b0:712:cc11:af0 with SMTP id
 00721157ae682-71406b6be9bmr77582727b3.0.1750912208803; Wed, 25 Jun 2025
 21:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250624215053.3162975-1-pkj@axis.com> <66ad34980bea73369408af8719d9a1ecb464baba.camel@linuxfoundation.org>
 <DB5PR02MB10213421A4CCDB7F61E5C5822EF78A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213421A4CCDB7F61E5C5822EF78A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jun 2025 22:29:42 -0600
X-Gm-Features: Ac12FXzGb4EVg9wSAzvPbSLLkEqj7ExE-Gsde5Nk7G_EBTIyIaYfd75BsW6lvsM
Message-ID: <CAMKF1srT+nRMw9MT=gpZK4tbi9-QBMf8F=4_DoE8C1=VXhZTRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Use :append to add to CC
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 04:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219336

On Tue, Jun 24, 2025 at 4:43=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 25 juni 2025 00:27
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-core=
@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] glibc: Use :append to add to CC
> >
> > On Tue, 2025-06-24 at 23:50 +0200, Peter Kjellerstedt via lists.openemb=
edded.org wrote:
> > > Due to the recent changes to how the toolchain variables are
> > > initialized
> > > via inherit_defer, it is no longer possible to add to CC using the +=
=3D
> > > operator. Instead, CC:append needs to be used.
> > >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  meta/recipes-core/glibc/glibc_2.41.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-
> > > core/glibc/glibc_2.41.bb
> > > index 7771fac041..2ef738f5b4 100644
> > > --- a/meta/recipes-core/glibc/glibc_2.41.bb
> > > +++ b/meta/recipes-core/glibc/glibc_2.41.bb
> > > @@ -111,7 +111,7 @@ do_configure () {
> > >  }
> > >
> > >  LDFLAGS +=3D "-fuse-ld=3Dbfd"
> > > -CC +=3D "-fuse-ld=3Dbfd"
> > > +CC:append =3D " -fuse-ld=3Dbfd"
> >
> > Given my hatred of using append, is it not possible to put this in
> > CFLAGS?
> >
> > Cheers,
> >
> > Richard
>
> Given the commit message by Khem when that line was added (see commit
> 63248d2cbd7a15aec5b864d0058fe919eb17c46c), I did not want to risk it
> by changing it. However, that commit also mentions build failures if
> the option is not passed via CC, and since we have not seen any build
> failures, maybe this is not needed at all? But I will leave that for
> Khem to answer as I have no idea.

I think it is still needed when building glibc for distros that use
lld as default system linker

>
> //Peter
>

