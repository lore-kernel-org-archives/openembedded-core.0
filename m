Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web11.1136.1587850660859412901
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 14:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JNoYSVop;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id i22so13293411uak.6
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 14:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W33FaLT8gZPM1UwRd8Yhoidh3tzpu0CIcbTA7rzAbcI=;
        b=JNoYSVopcsp2udOQswifIPVd+TkTmkVgodPtCwzadKP4CukqUJVcWc9AntKaiPsdC/
         O8GqIHwEHw60OCTryWWKlCd6x8u6pSEU4AB0J3hq683mcxM0R6UscgkorU/gZRSzUSu9
         SRTFFpHUAvuzfC8ogfvVsPHMAz7H2se82oPx11OuRV6ltxu/kvI0CjncxE8XyY8CvWv+
         9zsPXcu+8Pb5O6qf34P6TjRR0ili+zfvC+BJt/t65dcy4YCbcLnjHXP1L+0H+sV0wD7u
         GwoLtqi3BgW9Tc/lTGZZFWdFr/B/Kz7cU5TwE8D8SL85pQwFehinSSyFXTcihoGUpTZo
         Jqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W33FaLT8gZPM1UwRd8Yhoidh3tzpu0CIcbTA7rzAbcI=;
        b=aqb2H5PzUKQ9gP6XL33AZRJykvLd4ZsJui1uVCF8GmXJMf107zh9G7WRaiQPodgsWZ
         dwMvk+qxd/NaQ3YSU+JSp3HtdkbypUsvGIndWfk4RU0i61m6xSDrKfBz2tzNHzhpaK9S
         UXryaOxnq9xD0qWQAcigCTfFZSyCo8Y6Np3vVlWv37jDnfTqskqWyakRRa5lT1RIDUdl
         +z7Qi66E4bFYaCxwmMhlQMM00cNOYzuaIw60HVT7mIEpS220zIfGW06ZyFYWNL8IZ2Vd
         PxltW3pQu6FVASdVNmx/25PEzvEWrbNUuBbtfhK9zoqLQxNo+b2TEs++gAhW5FFmt9ZS
         9JEA==
X-Gm-Message-State: AGi0PuZLkwuLwFlqT1wujCtGfhJWikD1RjbRBapjnG7k6mS7U/7auMLD
	bRp5LrDkS1PBNaNrQ6AWg024q4olo/ALjXOB4W4=
X-Google-Smtp-Source: APiQypKza6DhFZMXQyH46eIU6iIiaTHb615aMC8hd4r7e3hPpk6ZaCOOVBcycZG6y2dz84nvom4mFIAfBz+6oWRvmEE=
X-Received: by 2002:a67:2284:: with SMTP id i126mr12047681vsi.223.1587850659804;
 Sat, 25 Apr 2020 14:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200425151908.1020349-1-masahiroy@kernel.org> <9bccecbd0ff9ba88e9afc12a9b9475775bef03e5.camel@linuxfoundation.org>
In-Reply-To: <9bccecbd0ff9ba88e9afc12a9b9475775bef03e5.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Sat, 25 Apr 2020 14:37:29 -0700
Message-ID: <CAJ86T=XGh5y_S_K=nzA30pFY=LixQhFcO3jLcZco0cb5XCdLEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RESEND] bitbake.conf: do not let DISTROOVERRIDES fall back to empty string
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 25, 2020 at 8:38 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2020-04-26 at 00:19 +0900, Masahiro Yamada wrote:
> > Commit abacd7243a2e ("bitbake.conf: fix distro-less failure expanding
> > FILESPATH") mended the littered DISROOVERRIDES when DISTRO is unset.
> >
> > Some time later, commit b7279f996397 ("bitbake.conf: Default DISTRO
> > to
> > nodistro") added a weak default to 'DISTRO'.
> >
> > So, this line can go back to the original simple definition.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 4b544a22cd..eb3dd0007e 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -739,7 +739,7 @@ DISTRO_NAME ??= "OpenEmbedded"
> >  OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-
> > ${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOV
> > ERRIDE}:forcevariable"
> >  LIBCOVERRIDE ?= ""
> >  CLASSOVERRIDE ?= "class-target"
> > -DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
> > +DISTROOVERRIDES ?= "${DISTRO}"
> >  MACHINEOVERRIDES ?= "${MACHINE}"
>
> Whilst this can't happen with our standard definitions now, the side
> effects of it not being set are nasty so I'd prefer to retain this.

What exactly can go wrong? MACHINEOVERRIDES is empty every time we
build a -native recipe, so just having :: in OVERRIDES or
FILESOVERRIDES doesn't appear to be an issue. Is there something
special about DISTROOVERRIDES ?
