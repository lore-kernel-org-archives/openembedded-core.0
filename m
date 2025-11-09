Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AF3CCFA13
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 01:34:42 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17741.1762652072870285668
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Nov 2025 17:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZHX6Bai0;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-656b7f02b56so1001649eaf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 17:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762652072; x=1763256872; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQkXKgZbzgcLN+0WDmAmm7/fdYehZi3QCaO27CUzsxE=;
        b=ZHX6Bai0yOimiRhiu5EEn51e3h8MGiXI/mBSsiB+Q2/2yV4sOI1wd1d3HYVH7nIqVe
         hM5UO0KW0KGfp5at6q5UCDbBxCiRSsC0BROQ1OE5pgUJrTCur0r/1vDRxt15bJ0OwQ8K
         Uoh1sUCBfvFwVylMZeOgJSTYEW7+hjiK1IG0QbmcWelQ9mv235cFw6wT8GOTW3rmqew4
         p621SsyuPp9UaFSWmeZEHABix7Wb09VShyGsHll1tWGQNuZoPvgJGXF549e4tTabd2/+
         /BAshf8Ul69FJhK6Rx8nHHJb73o76NHv/JLGkT3QzXVLFyD0Mp7r8Gb8H48ary5bw7D5
         dNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762652072; x=1763256872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQkXKgZbzgcLN+0WDmAmm7/fdYehZi3QCaO27CUzsxE=;
        b=P5mnTO8AU+gVI4Z7ETEO8Mm8TWHVbUgPiG8NlVyTUweKOiJTv/pKjWfirH8dBZjWav
         Ozs8PgyBi32CvUow4QXte3aF5RVEmGTBE7ApNM2S8qRU+AlMkR8xc9fWl5knkYpmwAEk
         kTdvHT1X9fkNnlWd/fk5/+qPGuPervbhMblvGocyfpQYpgrcQvd1KGJ35dw3RXyHXTc3
         Fv5tQAWiyrK1qHycopyP8DsCbfziZ7tSt5Rvg/lnqoWZ6TzNaVQ/mfu/m27CyFh2fnJT
         EZ5OxQZ2Y2sN/SKUrVYU1pRbyG9xRsD/TpstL57PKfp4sDGRomMe3eFROjRZDoSK7MAz
         4EKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+FEVes+/AntP2OCfVimXWPlgbQd56x9qsjFuxyaQKt4AfWG7gNfRpGSx4Hb2WY8AJuQLcybwprtq1mF0jKBwRpg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6hz7AjZAfucET4XLhPbP/U53ErblbPTeEVRC5lowEOuqmfodI
	D8s6G5LdvKoPNMWRmL5Vs9SRHBzePWLF0OUceD0BmFZ/ltCPr444yj4KG+5oarfY7iC8tWfn+oi
	ej+DEXlJvOGQpfCzf4OrjFmLTpIwqYEM=
X-Gm-Gg: ASbGnct4tJkjx4hIeDGFkpLZE+wowmJurYkwtmFz+pDDpF1uIvhkgMietffu+aB3yHQ
	bne5jQYfdeDWvvBMAYM539yoHI8OR2lz6zedcseUQxNHMxUPOoP9ZGP5T8St84ZKafdrinat3yG
	Wu8wWKxn4NQ0sEmv8Ve/Halr2yoNXc10EjhwqQEA1pQo82klHeRNRdGNfVYgx3Wg+JIuwUyikCn
	asQHfh9b1JaP3TpDxKUUH5jcsLYNH/u8GOlScKYkKXXRMHnKC7u3dilYiy/u/k=
X-Google-Smtp-Source: AGHT+IHSRu7V2Abc1gJzEjIfVoAdJt4P9jQQ7ASzmHjVKq8rx+V4JnGGuVucHdoRqPjBWbkw8k6YiGlECDjHfSViCrw=
X-Received: by 2002:a05:6820:4d87:b0:651:c2cf:8c8c with SMTP id
 006d021491bc7-656d1a788c6mr2268300eaf.0.1762652071820; Sat, 08 Nov 2025
 17:34:31 -0800 (PST)
MIME-Version: 1.0
References: <20251106204536.2079412-1-ankur.tyagi85@gmail.com>
 <DE35FEGOLJK5.C1B3O2A9MVY7@bootlin.com> <18762488E2A91015.568378@lists.openembedded.org>
In-Reply-To: <18762488E2A91015.568378@lists.openembedded.org>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 9 Nov 2025 14:34:20 +1300
X-Gm-Features: AWmQ_bn9tYXJVwFlv5_UNVb5T7lZwC6BPuGiGg117s_0k_ce2uwL3mniqTqrt5E
Message-ID: <CADySD0EDcMeV9SBOhg6BvV2MsWB8Q_Ck1vvfnFA202vvpUYRkw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/4] nghttp2: upgrade 1.66.0 -> 1.68.0
To: ankur.tyagi85@gmail.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 01:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226088

On Sun, Nov 9, 2025 at 10:14=E2=80=AFAM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Sat, Nov 8, 2025 at 8:52=E2=80=AFPM Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
> >
> > On Thu Nov 6, 2025 at 9:45 PM CET, Ankur Tyagi via lists.openembedded.o=
rg wrote:
> > > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > >
> > > Changelog:
> > > https://github.com/nghttp2/nghttp2/releases/tag/v1.67.0
> > > https://github.com/nghttp2/nghttp2/releases/tag/v1.67.1
> > > https://github.com/nghttp2/nghttp2/releases/tag/v1.68.0
> > >
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > ---
> >
> > Hi Ankur,
> >
> > Thanks for your patch.
> >
> > It looks like there are some new installed files that are not shipped:
> >
> > ERROR: nghttp2-1.68.0-r0 do_package: QA Issue: nghttp2: Files/directori=
es were installed but not shipped in any package:
> >   /usr/lib
> >   /usr/lib/cmake
> >   /usr/lib/cmake/nghttp2
> >   /usr/lib/cmake/nghttp2/nghttp2Config.cmake
> >   /usr/lib/cmake/nghttp2/nghttp2Targets.cmake
> >   /usr/lib/cmake/nghttp2/nghttp2ConfigVersion.cmake
> >   /usr/lib/cmake/nghttp2/nghttp2Targets-relwithdebinfo.cmake
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2701
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2533
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/2683
> >
> > Can you have a look at this?
>
> Thanks for pointing it out Mathieu.
>
> I also managed to repro this locally by enabling multilib, sorry I
> should have done that in the first place.
> Will send v2 later today with the fix and also enable multilib support
> for future submissions to avoid such errors.
>

Hi Mathieu,

Assuming no issue with other patches in the series, I have separately
sent v2 for nghttp2.
https://lists.openembedded.org/g/openembedded-core/message/226087

cheers
Ankur

> >
> > Thanks,
> > Mathieu
> >
> > --
> > Mathieu Dubois-Briand, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226086): https://lists.openembedded.org/g/openembedde=
d-core/message/226086
> Mute This Topic: https://lists.openembedded.org/mt/116160357/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

