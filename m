Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com [210.131.2.82])
 by mx.groups.io with SMTP id smtpd.web10.12358.1587913098459940497
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 07:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nifty.com header.s=dec2015msa header.b=jZ4vtWvK;
 spf=softfail (domain: kernel.org, ip: 210.131.2.82, mailfrom: masahiroy@kernel.org)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id 03QEw0sw027505
	for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 23:58:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 03QEw0sw027505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1587913081;
	bh=hmjH/6cE6RyXc8Sj8WHLdqcFq48WScCYqogARmxh1RM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jZ4vtWvKfuIK18het5z9GeKAK1zKHG0U0ZVUXM1CSVZ2gmrYIkISGN0zNyalwfx6j
	 qOQUa2I6Ps82Maaa7/OTuy01ES4MluSVdbjxPzxW7uDTUxW4y0C0PUM2hE+wscSKHX
	 ooqYJQcyCdUv2uybpvz3Bd++ehr4NWgMCuS6E3VKJNbzRZlsX7b5QIcGE79G5Fuyww
	 QWY3Uwp8HvGALIviXAjX4ShIsOVpyI6k3jpQ3Bry39/i8VTL3IP4Z1pmRNg1TxxFHs
	 VElpmtxWcCsmrarvqYxksTm6ccSo4lFj5N4S9glasrJbJaY/2rqcVO1Pqj7lAEJRC3
	 JbveSc/l9Om3A==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id y10so14659003uao.8
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 07:58:01 -0700 (PDT)
X-Gm-Message-State: AGi0PuahDljwTf3Du123QE32sLhZn+twrzDqA+IDN5egXZYzAXFxPbMX
	c9qppqxMhV5Hxg2EDU7O0LIFGSpWfiTDZd0FZgE=
X-Google-Smtp-Source: APiQypK2qplp3DvUywIUplQG+nxYClfh2VxcL7BdNEiLzw/kd5ytUBbAC11PDW0z2kydkEx3ivVKTPB2dqnv+XDjm1k=
X-Received: by 2002:a67:e94d:: with SMTP id p13mr13441118vso.215.1587913080179;
 Sun, 26 Apr 2020 07:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200425151908.1020349-1-masahiroy@kernel.org>
 <9bccecbd0ff9ba88e9afc12a9b9475775bef03e5.camel@linuxfoundation.org>
 <CAJ86T=XGh5y_S_K=nzA30pFY=LixQhFcO3jLcZco0cb5XCdLEw@mail.gmail.com> <16cffe54465cee6007792d6ac394987306f17f1f.camel@linuxfoundation.org>
In-Reply-To: <16cffe54465cee6007792d6ac394987306f17f1f.camel@linuxfoundation.org>
From: "Masahiro Yamada" <masahiroy@kernel.org>
Date: Sun, 26 Apr 2020 23:57:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNARaBsPrUCVerHv1XV2c30R28=kcDgKVKis7q4Jo=aLOYQ@mail.gmail.com>
Message-ID: <CAK7LNARaBsPrUCVerHv1XV2c30R28=kcDgKVKis7q4Jo=aLOYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RESEND] bitbake.conf: do not let DISTROOVERRIDES fall back to empty string
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andre McCurdy <armccurdy@gmail.com>,
        OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 26, 2020 at 5:13 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2020-04-25 at 14:37 -0700, Andre McCurdy wrote:
> > On Sat, Apr 25, 2020 at 8:38 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Sun, 2020-04-26 at 00:19 +0900, Masahiro Yamada wrote:
> > > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > > index 4b544a22cd..eb3dd0007e 100644
> > > > --- a/meta/conf/bitbake.conf
> > > > +++ b/meta/conf/bitbake.conf
> > > > @@ -739,7 +739,7 @@ DISTRO_NAME ??= "OpenEmbedded"
> > > >  OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-
> > > > ${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LI
> > > > BCOV
> > > > ERRIDE}:forcevariable"
> > > >  LIBCOVERRIDE ?= ""
> > > >  CLASSOVERRIDE ?= "class-target"
> > > > -DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
> > > > +DISTROOVERRIDES ?= "${DISTRO}"
> > > >  MACHINEOVERRIDES ?= "${MACHINE}"
> > >
> > > Whilst this can't happen with our standard definitions now, the
> > > side
> > > effects of it not being set are nasty so I'd prefer to retain this.
> >
> > What exactly can go wrong? MACHINEOVERRIDES is empty every time we
> > build a -native recipe, so just having :: in OVERRIDES or
> > FILESOVERRIDES doesn't appear to be an issue. Is there something
> > special about DISTROOVERRIDES ?
>
> native.bbclass sets MACHINEOVERRIDES = "" whereas with this change
> DISTROOVERRIDES would be set to "${DISTRO}" instead of "" as it
> currently is today. I think unexpanded variables were sub-optimal in
> FILESOVERRIDES but I don't remember the details of why.


Now, the same file defines this:

DISTRO ??= "nodistro"


In which case is "${DISTRO}" left unexpanded?



-- 
Best Regards
Masahiro Yamada
