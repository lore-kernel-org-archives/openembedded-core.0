Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5243BE7F12B
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 12:59:32 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.16790.1695819566075339666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 05:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B+hEsBCc;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c131ddfc95so174995881fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 05:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695819564; x=1696424364; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgevcLfaVS67D2yPRuya14541bPEMjAmHTrx0OOrc7c=;
        b=B+hEsBCcWF1YCmO2hmGgSB0RUVHPI2uEbpZ7MG/knH5TaYz4dlBvuFK2Aaw7AwodW7
         5IR4pCPlfvSsz4Mz9ZeiRQXYJ9pwprnAr3tZsfZ4J1T9gwWLAey/O6RdzqXIVTOiRuIa
         YMvYkLVaS/IWnnuiw7Hoj6Pg5yq87hlVDd2VuNTzpWAEty12zvxDpYkMFoorPU2ljFfK
         61+njae6qzo+aZbJJs+sPp4jeqFnSBbTMaJ+uef1JQzMb65aZqAAaygBOz/kDivEGMEz
         IJlSXSrZFAOlh6pz3vmgtMOyiGCPVwmtf9eM4+DoP/DD5Kcdb9DacJ6pB4+69JytxT9w
         fi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695819564; x=1696424364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BgevcLfaVS67D2yPRuya14541bPEMjAmHTrx0OOrc7c=;
        b=Y4ThmW11vQaDg02n6jxPFqmzWpIS77BgxGStxRrwooLhdNmqLlFRFTFMa1IHUlIl9K
         UxQ5EXM4e7SAieqlQXocqv+tPLm+k5SqgjH9E3u1y9Afehaj+/F4mU2Y2kS5IW6S3Fcm
         Q7oAkxh+XWPJphbBb+bI4af8tnZQiHZiINfOUUzl9IeCcHuKBbce2kI1zHvPBc6ZW6Dz
         UvHyBvjc/G4t/9YMtuBeM38U4DfkqiT4kAumwtKDYqo14f4HPhZbF0RdqTGEDFUj27Tg
         DC0BrVoPXrxuDH2dZMW9duxkWuFQ3kI0tBnpGNs8roRR7d/NWoX3BzaEuuWde2UVIhp3
         FpgQ==
X-Gm-Message-State: AOJu0Yyl6hJSafIRSDGz4kxMvGEAKbMPf5tqVTiYNCJiNcvjEkarqVG8
	FzZ76ue1BvgzptgaFLmG1RK5AVaZW8uxT/9LXD4=
X-Google-Smtp-Source: AGHT+IGr7x3vzELO1r11D4H5j5Axcep0CThp2CLVYKQeZdvaYJIdL6u/jdsOd3vUKjPXi8hap9I0s0g97rJ7rSH+3xA=
X-Received: by 2002:a2e:9910:0:b0:2c0:3413:5d9a with SMTP id
 v16-20020a2e9910000000b002c034135d9amr1956261lji.34.1695819563844; Wed, 27
 Sep 2023 05:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230925080452.803540-1-jstephan@baylibre.com>
 <20230927101614dd0d974d@mail.local> <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
In-Reply-To: <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Sep 2023 14:59:12 +0200
Message-ID: <CANNYZj89k7MbA0zBKb3s6LF0Lz65Yv-q9Qp5igimgSqeiWu6+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
To: Julien Stephan <jstephan@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 12:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188316

You need to scroll up. The failure is in lines 557 to 609.

Alex


On Wed, 27 Sept 2023 at 14:48, Julien Stephan <jstephan@baylibre.com> wrote=
:
>
> Le mer. 27 sept. 2023 =C3=A0 12:16, Alexandre Belloni
> <alexandre.belloni@bootlin.com> a =C3=A9crit :
> >
> > Hello,
> >
> > I had a build were all the tests passed, then I had this failure:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5812/=
steps/14/logs/stdio
> >
>
> Hi Alexandre,
> I only see
>
>    bblock.BBLock.test_lock_single_recipe_all_tasks: FAILED
>
> but I can't see the actual error :( Is it possible to have it somewhere?
>
> Cheers
> Julien
>
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188313): https://lists.openembedded.org/g/openembedde=
d-core/message/188313
> Mute This Topic: https://lists.openembedded.org/mt/101570279/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

