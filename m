Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EE7C001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:26:49 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.16686.1690986402188247869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 07:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=TW9j+0xr;
 spf=pass (domain: baylibre.com, ip: 209.85.167.45, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fe463420fbso3195959e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 07:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690986400; x=1691591200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsB4+7Mnw2m3/1hYh3A+mhyPVWtqkT1PByw+yWbz9cA=;
        b=TW9j+0xrNwVfFMulSPbGvXaP/+knwNInmKbkRPd/kjcdx0ghdt5vsz8BXLHI3pEBEj
         2wObUMS3WswXxqdYJG62OyWWDJRAgBrw5XVyxOb6j6y+K/HcQMYddjtNCyJPVJVdFNeG
         EenSLsEjSjII/NKCWL6rXAGK5DhujGUwJ/HouAt0YQNppm4PMY7WemnRX1YciTW7OI7G
         mW9/C4TxxYLxc8Vy+s3OgAGg26LKzmZqfrjH5krRxhG4TWF5doYcucZeJ+IGQsQW5gvj
         ilHHWajMB4WTHvXdsgtX68rK5HNN5NcanJQP/n4BkfpeYmsyGqABky4iMGo/nGeAw49+
         Bt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690986400; x=1691591200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsB4+7Mnw2m3/1hYh3A+mhyPVWtqkT1PByw+yWbz9cA=;
        b=ejKhjkUT65C+M2y+qKWR2jWT6M6yPYV/TrLZ9ab/hV9dOXoV4w/YqXlPAj7nX3KqGW
         nUsCoLND37EVeCbdamBCgcsVJf0vUKOOn8IBxFlXOZqxGRQMpHGCrB98gFQhr3drhyzy
         EQzo2IIuRwkE3qSoEdFjYJnIKv8wEQMSkac9FSjrrgYwEntc6CuJZuY2/Vb2Wnc0AI98
         bfOHC6JYkK0VPtmYPw2bi5dYnOCpDCtAtUm/JHdamIJ45AxXLHOl9V3XivWhkluEMQzG
         EpuTXnKb9Vn9Lxzo+seQVbd8/4NJvLXKTfLd7izheESNUhqIt2kJZs8BulgPhZWskoAs
         +m1w==
X-Gm-Message-State: ABy/qLbs2uAZJBTsXQOc2DFeHqskv3KATrNEtsgZ/NA3OMKFvpupfiG4
	ETkw4iRSHqAr4XmwM6YlsaXPYq+vqUgdhbmHBn7Y1w==
X-Google-Smtp-Source: APBJJlG+1uul648mBijzmogB2jd7ZSTk2PfXhYaoy2AYCPybfr7H8whWT69q01gmBad8+NjRLALjpW5Oiwt8MVBl7fU=
X-Received: by 2002:ac2:4f0b:0:b0:4fe:45ca:f8e7 with SMTP id
 k11-20020ac24f0b000000b004fe45caf8e7mr4523027lfr.57.1690986400250; Wed, 02
 Aug 2023 07:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230727135612.951926-1-jstephan@baylibre.com> <202307292244101a8e8cea@mail.local>
In-Reply-To: <202307292244101a8e8cea@mail.local>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 2 Aug 2023 16:26:29 +0200
Message-ID: <CAEHHSvYW3CNDv0qocawAuyhzF8nsAfaJ5+hqyt=9A1RX7+jHCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 0/3] Add bblock helper scripts
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185409

Le dim. 30 juil. 2023 =C3=A0 00:44, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> Hello,
>
> On 27/07/2023 15:56:09+0200, Julien Stephan wrote:
> > Hi all,
> >
> > This is v3 from bblock script.
> >
>
> This doesn't apply cleanly on master, can you rebase?
>
> Thanks!

Hi Alexandre,

done, just pushed v4 here:
https://lists.openembedded.org/g/openembedded-core/message/185403

Best
Julien
>
> > Improvement from v2:
> > * Add a function in bb.cooker to compute task signatures
> > * Replace the findSigInfo function by the new created one. This has the
> >   following advantages:
> >     * findSigInfo needs the task to be already built to get the siginfo
> >       file, meaning we cannot lock a recipe on a fresh build
> >     * we can now generate the signatures for all available task of a gi=
ven
> >       recipe
> > * Check if a given task is already locked. If so, don't duplicate
> >   entry in bblock.conf
> >
> > Limitations:
> > * Needs to taint tasks that are locked, to display a warning
> > * I may be still missing some checks on user input
> > * Silently does nothing if given task doesn't exist
> > * Silently does nothing when resetting a recipe that doesn't exist
> >
> > I did some tests using qemux86-64 and qemuarm but I may be missing some
> > corner cases.
> >
> > Improvement from V1:
> > * Signatures are now package architecture specific meaning that if you
> >   switch MACHINE, the lock sig will not be taken into account
> > * I added the -r option to unlock recipes
> > * I added a -d option to display the current bblock.conf
> > * Added an include directive for conf/bblock.conf inside bitbake.conf
> > * Added -t option to specify the tasks to lock/unlock
> >
> > Limitations:
> > * I may be still missing some checks on user input
> > * I need to find a way to get the list of tasks ( by default still lock
> >   only the do_compile for now, unless -t is specified)
> > * Do not check if a particular recipe/task is already locked when tryin=
g
> >   to add lock. So entries may appear multiple times
> > * We still need the signature of the tasks to be already computed befor=
e
> >   locking. Need to find a way to generate it if missing
> >
> > V2: https://lists.openembedded.org/g/openembedded-core/message/184697
> > V1: https://lists.openembedded.org/g/openembedded-core/message/184584
> >
> > My branch is available here [1]
> >
> > Cheers
> > Julien
> >
> > [1]: https://git.yoctoproject.org/poky-contrib/commit/?h=3Djstephan/bbl=
ock
> >
> > Julien Stephan (3):
> >   bitbake.conf: include bblock.conf
> >   bitbake: cooker: add a new function to retrieve task signatures
> >   scripts/bblock: add a script to lock/unlock recipes
> >
> >  bitbake/lib/bb/command.py |   6 ++
> >  bitbake/lib/bb/cooker.py  |  16 ++++
> >  bitbake/lib/bb/event.py   |   8 ++
> >  meta/conf/bitbake.conf    |   1 +
> >  scripts/bblock            | 182 ++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 213 insertions(+)
> >  create mode 100755 scripts/bblock
> >
> > --
> > 2.41.0
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184932): https://lists.openembedded.org/g/openembed=
ded-core/message/184932
> > Mute This Topic: https://lists.openembedded.org/mt/100390731/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

