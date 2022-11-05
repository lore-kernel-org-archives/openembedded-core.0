Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36724C4332F
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 19:52:36 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.9630.1667677946182170111
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 12:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=DumZoROt;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id v27so12125059eda.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 12:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+JItGC8iwQdWtiWMQHZpRk/UkMmrOz3hIdxI4uACUL4=;
        b=DumZoROteTixwRR/ETI2irWDUFl9Mc1/rqObCP0JKcO0EmkbqMb1HZt1RSnPyEbuwo
         RKX+2RIqyCXkj8+OHAxdz6dv/vVbqGAZfgJ8bDhVDjpylvkk1CzY2A8j1cEvbzNICjK6
         fE//sf80mD7wi5d9h7aZEMuJeHOeqpYdCvdn7v2mSfKSBIulxgOBeMmW4t02wx5rBwAQ
         nfci+ggTwihR+6u4nv4gSuzl298d8UOTPf0h1KVVAfMQrXYnWB05RE/WOplnrndfYf4j
         fwZXpud8obOMy9EdbNJQaIp0Q3oXU+kPSH9RHkVKBdWoLOH3/DoBfa7yvs6iqxrZ1Sif
         wTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JItGC8iwQdWtiWMQHZpRk/UkMmrOz3hIdxI4uACUL4=;
        b=WeVpKsBYQAifEoaSA5Cfrb9NunJM/lR6aK/wmSScQR3aUB/MrAAH2htgZWN8p2TekK
         x6gF/HmeanNFMfEKr/YWnLlDsHROzty4CPLDqEb9SPUbOYBPk8P3t6PIxxa2xpSAPkXx
         3GIGmc2DiMoBXmoVSt8EBzFhjMncfPUmiZI3izMbeFqx83qFirAQepTCPnHnxW5Sk9JK
         4TNmpwfL5bomedtc4IOEElpqNRBdp+gsWExYzSxL/8Ph58Bb036F6IkeguFacB4eg2Ft
         LT4BO86YuafdMtOvHIFlQI8fxS8LWRi1Z64YXXxsZYaLS7b97hWPs0hDiennZd42/yZn
         llew==
X-Gm-Message-State: ACrzQf1Z1tqOOUn/+38m12ySWI8JwB6ceILX8O1mf7R5fqJLwo8bk6Ud
	5I67u/RTf6kcLEHxFVjUHkjmxskF8Nqkn6B6Cj72WQ==
X-Google-Smtp-Source: AMsMyM5M3UjTR8t0WpPVeoa/GUV1zoTyMctSIoVzI7yw5IHvRhG46QJYlJELa5Rebcaie/au3PjEdCQ3IdXH1LaaVyE=
X-Received: by 2002:a05:6402:3512:b0:461:e146:d2e7 with SMTP id
 b18-20020a056402351200b00461e146d2e7mr42113175edd.39.1667677944598; Sat, 05
 Nov 2022 12:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221105154203.273684-1-pkj@axis.com> <20221105154203.273684-2-pkj@axis.com>
 <CAOSpxdZzGOPfcesAm0ykhcatZCMUwLUBjLudauD1J1Kod1UFFw@mail.gmail.com>
 <CA+chaQcY4iku9jwfsTQqe95E_Gge6X5GC=ZHLBDVwr7_poa86A@mail.gmail.com>
 <1e435dd091324e19aa0231e86ef5da8d@axis.com> <CAOSpxdbOxC-Vgzbw-dtj_TpiEGXo1kL6jeN-8L9TjCgrJy_4xQ@mail.gmail.com>
 <b9edf078b81a42d9b64ad375a29d3018@axis.com>
In-Reply-To: <b9edf078b81a42d9b64ad375a29d3018@axis.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 5 Nov 2022 09:52:13 -1000
Message-ID: <CAOSpxdaLJUfJ2d2mdzH56Guso1xdNembr5zQnPYK-JwwwmPwFg@mail.gmail.com>
Subject: Re: [OE-core] [langdale][PATCH 2/2] externalsrc.bbclass: Remove a
 trailing slash from ${B}
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 19:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172759

On Sat, Nov 5, 2022 at 9:46 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Steve Sakoman <steve@sakoman.com>
> > Sent: den 5 november 2022 20:41
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: Martin Jansa <martin.jansa@gmail.com>; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [langdale][PATCH 2/2] externalsrc.bbclass: Remove a trailing slash from ${B}
> >
> > On Sat, Nov 5, 2022 at 9:36 AM Peter Kjellerstedt <peter.kjellerstedt@axis.com> wrote:
> > >
> > > Argh, the second series (with three patches) is intended for Kirkstone,
> > > not Langdale.
> >
> > No worries!  I think we are good in kirkstone too:
> >
> > https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut
> >
> > Patch series for both will go out for review in the next day or so
> > once autobuilder testing is done.
> >
> > Steve
>
> Ok, good. Since I typically work with the poky repository, I do not
> normally see the *-nut branches, and tend to forget they exist in
> another repository.

I've got -nut branches in poky-contrib, so you could look there too :-)

Steve

