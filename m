Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9211C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 14:58:01 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.21270.1739890676328488021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 06:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N5tNCN98;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-543cc81ddebso5895193e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 06:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739890674; x=1740495474; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgDuQJLZ9Y/M5v9TER+xI7W0pOPTbn3HJl+yLeswcH8=;
        b=N5tNCN98K5Vvly+9wpUGX1THnnBKWcnBLln6FW4/OvUI2RfVYDvs95II+xF+kUF/Am
         BnKSrPuWf3f8fmPxxNC6i8uAIOjBNhs8KEoZw/s9Q3vNqOFZQ4WWFMk1KFnc0889s750
         zwLAkFYtHUyCpxETI+lWOvCOND2tpY+KMk0sMxBkD9AbnlLCCmXT0BM5vcxReSZNou16
         d/dfdlJs7R9r+Dk/fE1XuHDh8tF/ZEU+nBIcL92IvE1eRZ+0qJSCsxYedG46XFFQETc/
         /akvl3MKY5sYmGLPXiJspbebcAW6ug49Bbsn6LrDTTHAW9eWfBMgNkaG1ud5vQc/Jy3R
         a5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739890674; x=1740495474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgDuQJLZ9Y/M5v9TER+xI7W0pOPTbn3HJl+yLeswcH8=;
        b=sO3WnOObeqzai//iywCcgWvclxbNnVfgJp3hMjEfaGAaG17sQ0EkJ4la4EFXfFkAGV
         rfd5CFA0erO+dNoq0W8wFsBo4RZsShxsS21EkTJAX2sJpQLCfxgDrBwTnx9YzYn69v//
         uFF/DTv7unH2LO/mYipJAKqSl/3OsXy67VH0dhdT2MaeIsHRdQunGJwee4RoXSCYI1mq
         Co2c+9GnCwQ5pk0XwJdl1x92ZrroWYYsRuM+445YK/5x8HyKwdj1JkvyYFb15X9d6Kmr
         ROSn+BhNeenxbZJ1n5QYtsd8uXOndCyOt+ip663rRX7/VndT7UvucyjbHl6xoDUt8Wvc
         3m2A==
X-Forwarded-Encrypted: i=1; AJvYcCXxB6HSXiU61uoP4OLaJrmqbgs7ZoJWzun9M/NliGY+SV9SGZHGhyExoHgrjjaDrRnYTBY1dV+SET0L6biV3E05+Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxFhzoL2ZnhLWYn/3Um+H65oz41+BQtrULXcLk5A3ic2VJIvk3Y
	j1nzHtwTkP4/XNnV9b3S279LNOSqeHGAH1GAKuCvbU1Q33QSQBweettSdvo2+X8lJU4NAyAW5Kh
	o2dA/xpDjBwPfLr4g4ydlAY7dStc=
X-Gm-Gg: ASbGncsqU7t9lKMNC3QYq+tORqR/UJQZlk7EtFugSkZoZLAWnjjjZhAExJYRc01fr66
	n1fCEUnlk4FFC3XaNc6JwdoPUmTwAFDRgc7/LJ7QOLhwot+597k6MAfQT5C+E9JhVwLpCrSDYUE
	mQ4Is=
X-Google-Smtp-Source: AGHT+IEjWXm35uLo9gn103gcqKie14Loy2VEB6FDnGVS/0o1mzR5pvDm9JemHIx8EEA0DJKClvoIWv9PfEp2bVne+bs=
X-Received: by 2002:a05:6512:1189:b0:545:3dd:aa5f with SMTP id
 2adb3069b0e04-5452fe92491mr4170606e87.36.1739890674031; Tue, 18 Feb 2025
 06:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20250215165545.1929-1-alex.kiernan@gmail.com> <bbf0cbf2-b188-402e-83d2-f3e6f8dfd300@cherry.de>
 <CAO5Uq5R6abpgBoGMnatNthEThR0_GAqP+Q+etOurUT_9jLfkgw@mail.gmail.com>
 <1dac770a-f6b6-4b30-9c00-4d2576527409@cherry.de> <CAO5Uq5TOMEdKMB=G0r7Sav_B1P086o+BHiUDvOmGAUGEtQDWbA@mail.gmail.com>
 <CAMKF1srv9kPW23_WCg-Ha6xWGH+N7qNO2u=8NFFs92o4xg2mdg@mail.gmail.com>
In-Reply-To: <CAMKF1srv9kPW23_WCg-Ha6xWGH+N7qNO2u=8NFFs92o4xg2mdg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 18 Feb 2025 14:57:42 +0000
X-Gm-Features: AWEUYZlzi27e-ey4tH1QwMaWHcdHTD6gTsokSsXc5HJ2CrYzKYrGO4SRd_U1iaU
Message-ID: <CAO5Uq5S5eAdK1hzs8y+NnCYeO9u_G60M9DD106fqA=JVhPcXwQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] packagegroup-base: Add option to set zeroconf provider
To: Khem Raj <raj.khem@gmail.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 14:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211626

On Mon, Feb 17, 2025 at 6:20=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Mon, Feb 17, 2025 at 10:10=E2=80=AFAM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On Mon, Feb 17, 2025 at 5:05=E2=80=AFPM Quentin Schulz <quentin.schulz@=
cherry.de> wrote:
> > >
> > > Hi Alex,
> > >
> > > On 2/17/25 12:16 PM, Alex Kiernan wrote:
> > > > On Mon, Feb 17, 2025 at 10:32=E2=80=AFAM Quentin Schulz
> > > > <quentin.schulz@cherry.de> wrote:
> > > >>
> > > >> Hi Alex,
> > > >>
> > > >> On 2/15/25 5:55 PM, Alex Kiernan via lists.openembedded.org wrote:
> > > >>> avahi, systemd-resolved and mDNSResponder (in meta-networking) ca=
n all
> > > >>> provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to sele=
ct
> > > >>> which of these will provide service via packagegroup-base-zerocon=
f.
> > > >>>
> > > >>
> > > >> If I'm not mistaken, this seems to be fitting RPROVIDES usage?
> > > >>
> > > >
> > > > I guess I'm guilty of copying what was there (WIRELESS_DAEMON)
> > > >
> > >
> > > Fair enough, consistency is probably better here then :)
> > >
> > > >> and then we simply RDEPENDS on zeroconf-daemon?
> > > >>
> > > >> Does that work (haven't tested myself)? What do you think?
> > > >>
> > > >
> > > > And then selection via a PREFERRED_RPROVIDER:zeroconf-daemon =3D ".=
.."
> > > >
> > > > I guess I think it should work, though my concern is the interactio=
n
> > > > between the daemon and the nss plugin, which is how I ended up down
> > > > this rabbit hole in the first place!
> > > >
> > > > We seem to have very little usage of RPROVIDES (other than as a
> > > > migration mechanism) and PREFERRED_RPROVIDER in general.
> > > >
> > >
> > > That makes sense if the packages are absolutely incompatible with eac=
h
> > > other. For example, for the WIRELESS_DAEMON case, you may want to hav=
e
> > > wpa-supplicant but probably could have iwd too in the same rootfs and
> > > let the user pick the one they want to use?
> > >
> > > If we can have multiple zeroconf daemons, then that wouldn't be a goo=
d
> > > solution anyways.
> > >
> >
> > Technically you can (as this is a multicast socket), but actually
> > making it work properly isn't straightforward as you'd end up with two
> > daemons both announcing the host record. Pretty sure you can make it
> > work, which is different from wpa_supplicant/iwd (and I guess you
> > could even make those coexist if you had two wireless interfaces?),
> > but I'm not sure it's an out of the box configuration we should be
> > point folk at! libnss-mdns is a simple pick one or the other choice,
> > but that's enforced anyway because they end up colliding in the
> > filesystem.
>
> I think sorting a sane default would be good for all. I am not too tied t=
o any
> one package.
>

I think this gives sensible defaults... if you're a systemd user (with
systemd-networkd) you get systemd-resolved, else avahi, unless you
need to make it through Apple's bonjour conformance testing, in which
case you probably want mDNSResponder, but that's definitely an opt-in
choice (passing BCT is possible with the others, but the testing is so
painful, frankly going mDNSResponder is just easier).


> >
> > Frankly it's a bit of mess...
> >
> > --
> > Alex Kiernan
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#211549): https://lists.openembedded.org/g/openembed=
ded-core/message/211549
> > Mute This Topic: https://lists.openembedded.org/mt/111202159/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--
Alex Kiernan

