Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57CDC001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 08:11:05 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.2847.1690791060603169126
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 01:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CpgLuHnu;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b9cdbf682eso41560921fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 01:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690791059; x=1691395859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3jzu/DpYkgFwhgfYJ3u+iT8vhMS/Do6jvLmqyl+FpTI=;
        b=CpgLuHnuSZ3uAznL7rsPQ6SslvzJl3vFw2ACztLPmIsDtwa36odIm/W8quU7R4sz/5
         aaa0qgP8xS4t8wdVIYujs6ba75jwKqFh7L4UITAIVYKCST3v4LzY13Pv2V8xLx4OOn8E
         0HVczR94/G4LjQZVhZPSh6Kp/ms53pbUGF+UQiwGwYWkFSMW8U2TKDckW1XacH5C40mv
         rKji5oLlOPc+ahgXyXM8XBXvVh7N/xNAGN++jmSwJLNrFSr6Id/yiWPVQgmusgELItTE
         wxEwErro5LOTUzTE68L/Zbyhlku/HUoTPoSurQAUxYve5XZBD5KOSlPIQMNZdosDxWDE
         Ouwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690791059; x=1691395859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jzu/DpYkgFwhgfYJ3u+iT8vhMS/Do6jvLmqyl+FpTI=;
        b=fjZ7nPQsuHvQBJm1ddZolJaRnoedUHyxApAVRVuPARxfa3DY/3IEhhveFbuZfkCmyV
         XOySxjUMS2quhFevh8DntgjnXCdhi4cBombtNab1mBFtsg8utPyBp6RmETG5WTJpwJeb
         5T77U+hA/fY9Z8oaUZuKTbucESqo4ra1186GY0PB0S9T7kZhtxxsz6XKaCxxZcDVotxx
         ApvL+vSDSx53XsMGPgNJP5R52t7p9b8HIAJKfkvJJQthvtsgtx6v1dCp/YesI2QHhS9A
         N4ICU5Ku1lY29x0xkiZK1EUMOaX4ZT7XE7dtJ0U5N3W/aeD8QPHNOp3NRVc5crnNbfaq
         PQ8Q==
X-Gm-Message-State: ABy/qLYhQdd/M71rkJe/1eHQqQELaFK3VxJFvCTwsVG5cIxFuVOf980q
	0zZgXJjSjm4Tq9FS6Wgk6LEDv5XJQ2xAMchKgyQ=
X-Google-Smtp-Source: APBJJlE71K6OEoKJTVk/7RG+G+7NA5y0S/ISN3nPHFK8tzwqdAuIodi3CIQnjUISIpoLAc5yjPF2XjD1XGoG4Fw/m1Q=
X-Received: by 2002:a2e:7013:0:b0:2b6:cf31:5e81 with SMTP id
 l19-20020a2e7013000000b002b6cf315e81mr6092875ljc.20.1690791058410; Mon, 31
 Jul 2023 01:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230727143627.3718496-1-alex@linutronix.de> <20230727143627.3718496-12-alex@linutronix.de>
 <20230728131317ca8fba29@mail.local> <17760BA193C3A223.27447@lists.openembedded.org>
 <CANNYZj_=kDrFgL8nEv8vJsu6zvOra+V92=GjCGj-j2YVhhiOSQ@mail.gmail.com>
 <202307302036342002024f@mail.local> <1776DE5455DFB899.15684@lists.openembedded.org>
 <1776E39D10B7A347.29388@lists.openembedded.org>
In-Reply-To: <1776E39D10B7A347.29388@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Jul 2023 10:10:46 +0200
Message-ID: <CANNYZj84rh+GXEL7azYHKWCRREH7ypqmqD3mnkDeKd9ipemNqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/21] util-linux: upgrade 2.38.1 -> 2.39.1
To: alex.kanavin@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 08:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185125

I sent a revised patch that excludes the flaky test.

Alex

On Mon, 31 Jul 2023 at 09:36, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> I looked into it. Yes it's a race in a badly written shell script:
> https://github.com/util-linux/util-linux/issues/2399
>
> I'll see if the test can be easily skipped until upstream sorts it out.
>
> Alex
>
> On Mon, 31 Jul 2023 at 07:59, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> >
> > On Sun, 30 Jul 2023 at 22:36, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > > This is not 100% reproducible and so difficult to bisect. This is the
> > > log:
> > >
> > > diff-{{{
> > > --- /usr/lib/util-linux/ptest/tests/expected/lsfd/option-inet
> > > +++ /usr/lib/util-linux/ptest/tests/output/lsfd/option-inet
> > > @@ -5,10 +5,10 @@
> > >      3     TCPv6 state=listen laddr=[::1]:34567
> > >      4     TCPv6 state=established laddr=[::1]:23456 raddr=[::1]:34567
> > >      5     TCPv6 state=established laddr=[::1]:34567 raddr=[::1]:23456
> > > -    3       UDP state=close laddr=127.0.0.1:34567
> > > -    4       UDP state=established laddr=127.0.0.1:23456 raddr=127.0.0.1:34567
> > > -    3 UDPLITEv6 state=close laddr=[::1]:34567
> > > -    4 UDPLITEv6 state=established laddr=[::1]:23456 raddr=[::1]:34567
> > > +    3       UDP socket:[33864]
> > > +    4       UDP socket:[33865]
> > > +    3 UDPLITEv6 socket:[31413]
> > > +    4 UDPLITEv6 socket:[31414]
> > >  # --inet=4
> > >      3  TCP state=listen laddr=127.0.0.1:34567
> > >      4  TCP state=established laddr=127.0.0.1:23456 raddr=127.0.0.1:34567
> > > }}}-diff
> > >
> > > FAIL:          lsfd: --inet option                                 (lsfd/option-inet)
> > >
> > >
> > > All the occurrences are on the arm workers, ubuntu1804-arm-1 and
> > > ubuntu2204-arm-1 for now.
> >
> > Thanks, I'll try to narrow it further. May be that it's the update
> > itself, and not interaction with something else in the branch. Does
> > look like a race condition as well.
> >
> > Alex
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185123): https://lists.openembedded.org/g/openembedded-core/message/185123
> Mute This Topic: https://lists.openembedded.org/mt/100391613/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

