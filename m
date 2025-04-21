Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9101C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 18:29:18 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.21956.1745260148710224697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 11:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YzDTJ8kD;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-604ad0347f5so1000313eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 11:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745260148; x=1745864948; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Rcd7rQyf9Vn5j0sovTxUYvVrmruiBeYCF9qO7tdMXc=;
        b=YzDTJ8kDt/zS8sEm/NI+j8MvXTzXTcSjoHqwVlVamBF13Lp24YobJXVWVXnui2DK18
         10W5YyHBkpkjxcgHVdIz1cRD/e98e70ScI+EZ6zNdTSEWfIn1fzoZHnXo98V05nJzZkU
         Gb/XEc3AaTTwgsm3PCD2HRtnwSk8bDkPZSg0N4q1ZjTCwrJjuEZ/0MYbuXhO6cm7clvT
         5PPpHPCM9K+RedVpJ8QbdLTrkUy2KN6OgFogrVD0/BwU3NayoAWfqYm3Ke1+j0TXGJvY
         gk1qpZTjG+6P7783OGYzi6m4bGzM/glc/wMtFRM0acCJa/VcNDLLF1pII1m2JANvjztZ
         T/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745260148; x=1745864948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Rcd7rQyf9Vn5j0sovTxUYvVrmruiBeYCF9qO7tdMXc=;
        b=LQ8pYzPP8Kgr3sbmA/RHMzfC7ss9UEw0GnkXa59HzHj/DSf+S6VIkJF6hb399OWauy
         a+IlTV1GMjq8zs1U1qqz/Y7HMFAvYbf6zVPMTV4qSu91sKQ5wMCQYjio0t5KzGob6asm
         h2AaIYgF5pF3VVGBmurJRGkNbp9JFt7J32q+8Gos4d4Z9mfjYAqCKLJLFcppSztcaA2s
         8uyC/bR3OI06wIlSrLR56Nj0J0FTIk0A7VsuE/yCs7yV/3OBrBW+0Fb8mOGmYEiw4Q7w
         FB0tG7024jOZe0KxrKfc4sfYqLRWIp7XIfLXRClu3cdXgEKmpY4LS34FMbPvyqIdGQUu
         8hcw==
X-Gm-Message-State: AOJu0YwEtKFPob6JWq9xGKEDNIQJqtA5hlBR5gxJ0c9vTO4Qt81xP84y
	ESk+2MFynGC7igTEaD4iyZ/TTpzvAqFwXlWFR8+PgwoFGgQhF+P0P5lXY74X607Ixe4URhFQV7Y
	Lr3YBrTWKYINu6KUWElYXZLjzrhM=
X-Gm-Gg: ASbGnctZx9LEwAoBgpkV8sKa3BLFBjj/YIGlG5k2URF6lQO1Qt71zg1YzaF+6zIwHPe
	8a0+i33VP6Ng6chtbiMLyJAbDKy6hO7WPHlMGOh3keHKezrhI9jSwbT10ef1qSpDb5CMM4OqCGo
	aPJyHOgjPW6tdLS6zZuZQS0g==
X-Google-Smtp-Source: AGHT+IHYgaZ5JV6hew43Twc59UcmF8WHDhwfvIZaygTQ0lKLjDw+Nij3CpOh/U7YBQCl+EkqmMafblLTLuW50X9K7QQ=
X-Received: by 2002:a05:6808:8209:b0:400:b833:135d with SMTP id
 5614622812f47-401c0930002mr6996784b6e.5.1745260147880; Mon, 21 Apr 2025
 11:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250418175911.4033750-1-raj.khem@gmail.com> <20250418175911.4033750-2-raj.khem@gmail.com>
 <d4b89d4a37faf4afe9bcc0c3a781f125426a0351.camel@linuxfoundation.org>
In-Reply-To: <d4b89d4a37faf4afe9bcc0c3a781f125426a0351.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Apr 2025 11:28:41 -0700
X-Gm-Features: ATxdqUHCD1woOtVMb5Q4P2YTB9U7qQFjQZalSWqc54o6hY7_uWJzF75C_EbhiGY
Message-ID: <CAMKF1spywscwx4WvgJaMHkgAVu0ZBOo-6wsML0Zf22mexHWXqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] bitbake.conf: Switch prefix mapping to use -ffile-prefix-map
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jacob Kroon <jacob.kroon@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 18:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215181

On Mon, Apr 21, 2025 at 5:29=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2025-04-18 at 10:59 -0700, Khem Raj via lists.openembedded.org wr=
ote:
> > -ffile-prefix map is more comprehensive when it comes to reproducible
> > builds and its superset of all prefix-mapping options in compilers
> >
> > This makes is cleaner and workable across gcc and clang, clang does not
> > support -fcanon-prefix-map and it has to be explicitly omitted when usi=
ng
> > clang.
> >
> > There are lambdas generated in templates by clang which still get the
> > absolute paths despite -fdebug-prefix-map, this helps with that as well=
.
> >
> > nasm is an outlier and we have fixed it by adding -fdebug-prefix-map op=
tion
> > luckily we do not pass DEBUG_PREFIX_MAP to nasm, in all recipes which u=
se
> > nasm either pass -fdebug-prefix-map explicitly to nasm or they rewrite =
it
> > to use nasm flags syntax.
> >
> > We have discussed this in past [1]
> >
> > [1] https://patchwork.yoctoproject.org/project/oe-core/patch/2023042803=
2030.2047920-1-raj.khem@gmail.com/#10281
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Jacob Kroon <jacob.kroon@gmail.com>
> > Cc: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > v2: Drop using --ffile-prefix in go
> >
> >  meta/conf/bitbake.conf                     | 14 +++++---------
> >  meta/recipes-devtools/rust/cargo_1.85.1.bb |  2 +-
> >  2 files changed, 6 insertions(+), 10 deletions(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 8f90026f7c2..b4e1964f77d 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install =3D "${PARALLEL=
_MAKEINST} "
> >  ##################################################################
> >  TARGET_DBGSRC_DIR ?=3D "/usr/src/debug/${PN}/${PV}"
> >  # Beware: applied last to first
> > -DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> > - -fmacro-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> > - -fdebug-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> > - -fmacro-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> > - -fdebug-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> > - -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > - -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > - -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > - -fmacro-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > +DEBUG_PREFIX_MAP ?=3D "\
> > + -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> > + -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> > + -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > + -ffile-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> >  "
> >  DEBUG_LEVELFLAG ?=3D "-g"
> >
> > diff --git a/meta/recipes-devtools/rust/cargo_1.85.1.bb b/meta/recipes-=
devtools/rust/cargo_1.85.1.bb
> > index db18ecfda9a..150c2d2b801 100644
> > --- a/meta/recipes-devtools/rust/cargo_1.85.1.bb
> > +++ b/meta/recipes-devtools/rust/cargo_1.85.1.bb
> > @@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY =3D "${RUSTSRC}/vendor"
> >
> >  inherit cargo pkgconfig
> >
> > -DEBUG_PREFIX_MAP +=3D "-fdebug-prefix-map=3D${RUSTSRC}/vendor=3D${TARG=
ET_DBGSRC_DIR}"
> > +DEBUG_PREFIX_MAP +=3D "-ffile-prefix-map=3D${RUSTSRC}/vendor=3D${TARGE=
T_DBGSRC_DIR}"
> >
> >  do_cargo_setup_snapshot () {
> >       ${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.s=
h --prefix=3D"${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
>
> I'm a supporter of cleaning this up and doing this but I think we have a =
selftest failure that needs invesitgation:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1469
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1386
>
> I'm thinking it comes from this patch, I'll need to confirm that though.
>

I looked further and your suspicion is right. Its in copydebugsources
function in package class that
we explicitly look for -fdebug-prefix-map in cflags to map the source
file locations which ofcourse was failing now.
I have sent v3 with this fix and some more cleanups.

> Cheers,
>
> Richard

