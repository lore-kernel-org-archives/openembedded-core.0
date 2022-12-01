Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827E1C4332F
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 23:08:07 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.60725.1669936083191730059
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 15:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HazvYO4A;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id n42-20020a4a956d000000b004a047b3964fso479519ooi.12
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wYVZAc30CpWpMTGje8SxY6tDD9T798GLehl5QH04DZc=;
        b=HazvYO4AX1j2ME6iIsVIWEotupj+4pTeYFRGRhXnVB1kdux2jysQ7rOjajQKGtdl09
         YmBEQAkaxptpbUCR/c9nhqY2jFbuopz7+BDYepER3nPjMetKz4vpbdswsYAgptPk1H3M
         UeCaMXuUIaW0BQ9dEN372geUUTeZWaAbjtkPu2QQxhPGq9rc+Wl/efEA1SfXjmyhPvgB
         2k7enEco+ODQc1n1qj0xEszLe+OM2DXCd3RujF5q+qEdFfF0Ypn2fwDpWvzNYeCb3ucn
         G7mGq6jIau0hy82IV1js/sGB2O8JF3orFB9mvTSco7+HGetbg3ZROpjmbVRq7uM7jtfQ
         9Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYVZAc30CpWpMTGje8SxY6tDD9T798GLehl5QH04DZc=;
        b=grANZm7Gv83fbhLjZ+ehL+s/cb13Hvay7oagMd/gSBxSFKuQDSI3L8gpV6194rVaIN
         CX/00K16k0bQNpOpYr9+ZGdaliy+LDIrpspdi8DurQXdpoyjJkSHZvAlFVXRGEF4/dgN
         AiBmPlqVzm04CPOYbGjLRPYuUDmMM2hc/YHUJfrMuii4/AII4yf6RHYV5LaG4HLOAyuQ
         Ubx+ehnZXFew1i8Zm+URfqy1zpEji+gwWMWavkNmHnvuGm4PoTG9tJ+wRt9eM/dfghHj
         8cMM6dvK4gcfuJlp/94v7BbW+CP2apjBKVlwUHvAKUbFlWdWv0ncIfuA6LaPI4k+hqYG
         fbQQ==
X-Gm-Message-State: ANoB5plK5M3daOsAtslhzZi5RpIzahk4NwqNTJM1p0EEKGnhDjSFloZ9
	8iCfsNxwISiRYYyt5ug87smMxRAxVBiTs8igOnc=
X-Google-Smtp-Source: AA0mqf5dS0WFS03S5LHdQcuseJxqLDwBGJ39qfTy1pzY+s86sxk5dfwDNtji2u341/Ec8JjJnkSOXK3H8Pjh+YZTNpA=
X-Received: by 2002:a4a:d138:0:b0:4a0:805d:a8e1 with SMTP id
 n24-20020a4ad138000000b004a0805da8e1mr3405046oor.9.1669936082201; Thu, 01 Dec
 2022 15:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20221201190248.175753-1-raj.khem@gmail.com> <20221201190248.175753-6-raj.khem@gmail.com>
 <e65f40a225318abefd91c75d51943fc141368082.camel@linuxfoundation.org> <Y4kzP3WMTabOHMYB@mail.local>
In-Reply-To: <Y4kzP3WMTabOHMYB@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2022 15:07:36 -0800
Message-ID: <CAMKF1spdT_yK7K-Do++uMvbxsfAhuPZMu-6qgPn2uBkwi-aSGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] pseudo: Disable LFS on 32bit arches
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 23:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174215

On Thu, Dec 1, 2022 at 3:05 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 01/12/2022 19:12:50+0000, Richard Purdie wrote:
> > On Thu, 2022-12-01 at 11:02 -0800, Khem Raj wrote:
> > > pseudo overrides certain libc functions which are aliases when LFS64 is
> > > enabled. In anycase pseudo may not be much used on 32bit systems anyway
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > > index c34580b4ff..c3f0a987fc 100644
> > > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> > > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > > @@ -17,5 +17,7 @@ SRCREV = "c9670c27ff67ab899007ce749254b16091577e55"
> > >  S = "${WORKDIR}/git"
> > >  PV = "1.9.0+git${SRCPV}"
> > >
> > > +TARGET_CPPFLAGS:remove = "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
> > > +
> > >
> >
> > We need to put some comments in here about what this is doing and why.
> >
>
> Note that this was one of the issues I had with the
> -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64 build. My guess is that we also
> have to remove -D_TIME_BITS=64.

Eventually yes, however lets do that incrementally. First I am trying
to get LFS handled.

>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

