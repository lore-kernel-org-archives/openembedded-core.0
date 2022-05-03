Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D952C433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 16:21:35 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.1236.1651594891329043526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 09:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ti99lvIe;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id x22so8779910qto.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 09:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7+5wyl6XPsblOmmpblILjrXjDC7mil2rJ9J+/VSgYgw=;
        b=Ti99lvIemO+Ys6et/Gz+GMlcUi7dMI1Iv2IxnMejhAPS6LLF+oWjIQZHJ9MABYzLjl
         SJ5DrXWWEC+ehfUZUeHKxwoCxipeyTrDN3WqFRouvjONmVt1JJv/WZ/vk8t7aniOqW5F
         +C2dW6APo7Gg6HzrMXYSt8MvnjzuFT1G19RC2t191ZqZzE9u+zP0Vz2hTgaUtXYmy5t3
         I9CEGUHdOktMS1n8lOl3FyQKRep5vtWelE3DuKV1sRTZIcOTt29xOL/821gHzG46xLxz
         3QpytUgmw/GAxDdn68fsQuOlbSY1T8YZHUtnDHPa2uW/dINh4tNraTxp/5t8pzUF2J2D
         PWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7+5wyl6XPsblOmmpblILjrXjDC7mil2rJ9J+/VSgYgw=;
        b=77tOMtoY28uQEmXpvap8AsdaVlG3fPUVmmNdgrZPykX0al1nyG9oaXkx2uhrQxHtXu
         xYq4CyZ2r6Git/y8f2CEj2WT4oztEcE4r9WB53uTZEEliG4uGt49QqGYyHl58RSQibqo
         TE64LrTFByl26J0w7QyYJE6PvcRBQP94OYQVxIgzkvsKypJIEwV9HthiEEdB/D7QDxXR
         qcwQoNWvWf2ISkpyTOC7qbIA/u+S/sVAEkI9zxvjBIXpKaPDJNaCYlGC6QboisTp3kty
         xSkpEB/FKMuefX1Mec2TXj2xltGNfLqyeMfaWOGKNLCKum/9p/k//ZFEeehcHRCizGkK
         1hOQ==
X-Gm-Message-State: AOAM532vPqf3sF2NFYFN/A/0D0bb6SmMVdTGsUmcWnHj8g3wokJCZw0k
	TB9rYhFIUb2Jko/x1O1YULKZANmxZkekRCVJFTY=
X-Google-Smtp-Source: 
 ABdhPJwDX9W/xXk7TJtPN8iJSGcgyuYPJM5ERaa3+NtpS8Q+nHVNLvJkpr+Gu3wzCw3zKWsoKLTNayObUl9MI+nR7z8=
X-Received: by 2002:a05:622a:108:b0:2f3:b31b:b45f with SMTP id
 u8-20020a05622a010800b002f3b31bb45fmr1527404qtw.532.1651594890341; Tue, 03
 May 2022 09:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220502211001.4183095-1-wes@mitsi.com>
 <20220502211001.4183095-2-wes@mitsi.com>
 <CAPnigKkL5LeyUj5NGwb0iYOeEBGSvm0FAO25zmVD2G9KATEijg@mail.gmail.com>
 <CANNYZj-19bZmShcS4ws_3hDKpxiir7-abo5M-_WEiEUUCCK25Q@mail.gmail.com>
 <CADqWEoSCJay3HL8iDU5yM4McJ1M7JLnfRJWFt7sm1kGQfuU_Fg@mail.gmail.com>
In-Reply-To: 
 <CADqWEoSCJay3HL8iDU5yM4McJ1M7JLnfRJWFt7sm1kGQfuU_Fg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 May 2022 09:21:04 -0700
Message-ID: 
 <CAMKF1spZ529yEBOz=4tCBdpQskrpHr6dS3X920QaER25SN34jA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: disable libjitterentropy due to cpu
 usage
To: Wes Malone <wes@mitsi.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 "William A. Kennington III" <wak@google.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 16:21:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165205

On Tue, May 3, 2022 at 8:23 AM Wes Malone <wes@mitsi.com> wrote:
>
> > Isn't this desirable if you don't have an hwrng?
> Perhaps what's needed then is a 'hwrng' in MACHINE_FEATURES?
>
> > Can=E2=80=99t rng-tools figure out the right sources at run time?
> rng-tools enables jitter by default if it's built in, even if hwrng is
> available. Maybe it's faster to do this on more powerful machines but
> it's disruptive to run the cpu at max for so long on my pi's.
>
> We could also disable it with the /etc/defaults file with `-x jitter`.
>

I wonder if rng-tools is still needed after 5.6+ kernel after this commit [=
1]
Arch Linux wiki says no [2]. We added this as a recommendation to
openssh by default [3] [4],
I wonder if we can turn that off by default and perhaps add havaged as
dependency if needed.
[5] changed to use /dev/hwrng which seems right change to me. I also
wonder if we can tune
the resource requirement for rng-tools with limiting cpu threads and
buffers allocated for this.

[1] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa5=
1bb4c44e32
[2] https://wiki.archlinux.org/title/Rng-tools
[3] https://git.openembedded.org/openembedded-core/commit/?id=3D9b01375236e=
19e3366c58877c4154d7c71632984
[4] https://git.openembedded.org/openembedded-core/commit/?id=3Dfe99349c1bd=
72b69d22ab0dc52b8825d3157b8e7
[5] https://git.openembedded.org/openembedded-core/commit/?id=3Df1dc9ac4671=
0814c27cae2d22e79c84a9522993a

>
> On Mon, May 2, 2022 at 11:47 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Yes, I wonder why this needs to be disabled altogether at build time. C=
an=E2=80=99t rng-tools figure out the right sources at run time?
> >
> > Alex
> >
> > On Mon 2. May 2022 at 23.33, William A. Kennington III via lists.openem=
bedded.org <wak=3Dgoogle.com@lists.openembedded.org> wrote:
> >>
> >> Isn't this desirable if you don't have an hwrng? We want to generate
> >> entropy so we can perform cryptographic operations by default if we
> >> bring in rng-tools.
> >>
> >> On Mon, May 2, 2022 at 2:10 PM Wes Malone <wes@mitsi.com> wrote:
> >> >
> >> > After boot rngd maxes out the processor initializing JITTER entropy =
for
> >> > some minutes. Here we disable libjitterentropy in favor of only usin=
g
> >> > the hardware random source via config.
> >> >
> >> > Signed-off-by: Wes Malone <wes@mitsi.com>
> >> > ---
> >> >  meta/recipes-support/rng-tools/rng-tools_6.15.bb | 1 -
> >> >  1 file changed, 1 deletion(-)
> >> >
> >> > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta=
/recipes-support/rng-tools/rng-tools_6.15.bb
> >> > index 0696351903..4eed060960 100644
> >> > --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> >> > +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> >> > @@ -21,7 +21,6 @@ inherit autotools update-rc.d systemd pkgconfig
> >> >
> >> >  EXTRA_OECONF =3D "--without-rtlsdr"
> >> >
> >> > -PACKAGECONFIG ??=3D "libjitterentropy"
> >> >  PACKAGECONFIG:libc-musl =3D "libargp libjitterentropy"
> >> >
> >> >  PACKAGECONFIG[libargp] =3D "--with-libargp,--without-libargp,argp-s=
tandalone,"
> >> > --
> >> > 2.36.0
> >> >
> >> >
> >> >
> >> >
> >>
> >>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165204): https://lists.openembedded.org/g/openembedde=
d-core/message/165204
> Mute This Topic: https://lists.openembedded.org/mt/90845997/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

