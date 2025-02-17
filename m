Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C847C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 18:20:14 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.535.1739816407560091901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 10:20:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HAFWaTOW;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2bcc0c6c149so1091428fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 10:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739816407; x=1740421207; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErXBPmxo8RCIWlibtT7HjEpI7+9Q//JrGQ0csfZPgsA=;
        b=HAFWaTOWP6w8wfyaNA7rBOjNVaTQeQG4sx0vUvr6zNDD8bb6I90qbKRN8Rtm4uV3Je
         qoXo/eicvy+mC+fdzyRBBRtapYkQpO8fAHFvmUlOHCpbDNvlsm4B9d+vtmLg/ovdvPu+
         l7jrZ73R2x7x8UBYAV7Fmnx3jl8271PIRgwalm7MxxbHW/gmMz2Ir71nn/KPqTj6dSJH
         cMsNJxDsDVBiJanJk6qez1nSmwfdSYv5h5GUYKGdkpv3BCas3E5ZGSCflB/SP5HV/vX4
         6/MjV5VE/LNd79NYcGBtBAAPY77cwm8KyRKEli1o08jCbSRSZuZpGn7Dkz3XilvuxIaP
         gvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739816407; x=1740421207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErXBPmxo8RCIWlibtT7HjEpI7+9Q//JrGQ0csfZPgsA=;
        b=sgv7yUgAy6ooJJZv9CJLkA5jWxUmXvGZ1yxmnPARjy9uerCioP7y3eSfQH6eyHF2LD
         0NRRhzw1Ueh5czq1nfVAONorEcc995xnWpBOuw9k0KXY6RJuxNFET53zBovBc6OzNMmK
         PW0QZkDvlac33OmAynd1rvrkuVXWq9lztL4HEoGY2JQDeSrGyKBCJWq70h4F3n4nbV+m
         PWHHe0M8RcMGjLJ1UEfOUChVF4ds/HM1xeU5z5YyNZrwlEznKRXzzFgtEzIEJRk4Nu36
         +e+tvVcJLXeO1KRSDXViJ1AhoPTxICrTETAsVfq2hmEYOpGe6pqivfvpzZkD3GsNWgEi
         f3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUS2Jmj+7O1bowwpG/ZaJkp885IB1KOuiNgtgEaP0xZ89P4snyYIUOQvgz2WJotKLjBeUTQXaj31kY82vPaJcjcjA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzmmPSl8bPfzpiI46e59kokHMQhN/ZRz61/45f0pA9Ot1ArSlUe
	Ba/NHWn/dBWtYw2E+X0P1GMre3IuUowe9JUbk4tQsJiIwcfQbUAZBEIdGus4p7CAyJUhN6sTZqS
	5pj6BuvpajQNeHcAuG6bYzzG2zP8=
X-Gm-Gg: ASbGncvDZhBOigOUKVY7U48lHkhswyBCvoEnZstCkrP9WfjR/jEy6pOGfnqaKMaAk/d
	AS0M9mztqa2OZ9F6cSTdkpT+Riv1106nh7IVMsH/FtVv4KHb8p4lx0e0jSOfy+3WX2ca/tLbFkW
	c9365Xi3fvdsZk1puMen9KtMvDYQ==
X-Google-Smtp-Source: AGHT+IHw4kkcJKDxyvAjv7bLTjq3sOXuT/RhSWL8Xhjxw1c2aHSnEsMqFEeP3Hj/WXZ9rWHD8R5tXecJhMv5YlDUBbQ=
X-Received: by 2002:a05:6870:8291:b0:2b7:fd8f:7ade with SMTP id
 586e51a60fabf-2bc99ddbfaemr7052597fac.33.1739816406803; Mon, 17 Feb 2025
 10:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20250215165545.1929-1-alex.kiernan@gmail.com> <bbf0cbf2-b188-402e-83d2-f3e6f8dfd300@cherry.de>
 <CAO5Uq5R6abpgBoGMnatNthEThR0_GAqP+Q+etOurUT_9jLfkgw@mail.gmail.com>
 <1dac770a-f6b6-4b30-9c00-4d2576527409@cherry.de> <CAO5Uq5TOMEdKMB=G0r7Sav_B1P086o+BHiUDvOmGAUGEtQDWbA@mail.gmail.com>
In-Reply-To: <CAO5Uq5TOMEdKMB=G0r7Sav_B1P086o+BHiUDvOmGAUGEtQDWbA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Feb 2025 10:19:40 -0800
X-Gm-Features: AWEUYZk0YQXlEttDVA1CGxr17OyYTmkmquCu9lTzL7B8tG0xn6vCpm6C0maakw0
Message-ID: <CAMKF1srv9kPW23_WCg-Ha6xWGH+N7qNO2u=8NFFs92o4xg2mdg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] packagegroup-base: Add option to set zeroconf provider
To: alex.kiernan@gmail.com
Cc: Quentin Schulz <quentin.schulz@cherry.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 18:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211550

On Mon, Feb 17, 2025 at 10:10=E2=80=AFAM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Mon, Feb 17, 2025 at 5:05=E2=80=AFPM Quentin Schulz <quentin.schulz@ch=
erry.de> wrote:
> >
> > Hi Alex,
> >
> > On 2/17/25 12:16 PM, Alex Kiernan wrote:
> > > On Mon, Feb 17, 2025 at 10:32=E2=80=AFAM Quentin Schulz
> > > <quentin.schulz@cherry.de> wrote:
> > >>
> > >> Hi Alex,
> > >>
> > >> On 2/15/25 5:55 PM, Alex Kiernan via lists.openembedded.org wrote:
> > >>> avahi, systemd-resolved and mDNSResponder (in meta-networking) can =
all
> > >>> provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
> > >>> which of these will provide service via packagegroup-base-zeroconf.
> > >>>
> > >>
> > >> If I'm not mistaken, this seems to be fitting RPROVIDES usage?
> > >>
> > >
> > > I guess I'm guilty of copying what was there (WIRELESS_DAEMON)
> > >
> >
> > Fair enough, consistency is probably better here then :)
> >
> > >> and then we simply RDEPENDS on zeroconf-daemon?
> > >>
> > >> Does that work (haven't tested myself)? What do you think?
> > >>
> > >
> > > And then selection via a PREFERRED_RPROVIDER:zeroconf-daemon =3D "...=
"
> > >
> > > I guess I think it should work, though my concern is the interaction
> > > between the daemon and the nss plugin, which is how I ended up down
> > > this rabbit hole in the first place!
> > >
> > > We seem to have very little usage of RPROVIDES (other than as a
> > > migration mechanism) and PREFERRED_RPROVIDER in general.
> > >
> >
> > That makes sense if the packages are absolutely incompatible with each
> > other. For example, for the WIRELESS_DAEMON case, you may want to have
> > wpa-supplicant but probably could have iwd too in the same rootfs and
> > let the user pick the one they want to use?
> >
> > If we can have multiple zeroconf daemons, then that wouldn't be a good
> > solution anyways.
> >
>
> Technically you can (as this is a multicast socket), but actually
> making it work properly isn't straightforward as you'd end up with two
> daemons both announcing the host record. Pretty sure you can make it
> work, which is different from wpa_supplicant/iwd (and I guess you
> could even make those coexist if you had two wireless interfaces?),
> but I'm not sure it's an out of the box configuration we should be
> point folk at! libnss-mdns is a simple pick one or the other choice,
> but that's enforced anyway because they end up colliding in the
> filesystem.

I think sorting a sane default would be good for all. I am not too tied to =
any
one package.

>
> Frankly it's a bit of mess...
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211549): https://lists.openembedded.org/g/openembedde=
d-core/message/211549
> Mute This Topic: https://lists.openembedded.org/mt/111202159/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

