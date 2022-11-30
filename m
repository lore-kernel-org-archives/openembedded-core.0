Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9C3C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 16:39:25 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.16381.1669826359700350380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 08:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vnzyl5Kx;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id m7-20020a9d6447000000b0066da0504b5eso11541335otl.13;
        Wed, 30 Nov 2022 08:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhLQ2+AFBKYvd49hjnpbxAfRbq33zxkIhZB5jg0/T3k=;
        b=Vnzyl5KxhrFX4sxvT1Zw4jEg+eAFnsL2ZSUZethz5dDhvpZDwdGfCYrBNupJny7Zmw
         r10FNAdpBf2xZRvbkh6hbrUKcuXQXr3wiNp7+xWStXsbm/yHeoJf6x45GYnQ4Vun85GX
         rLOWLArgFZhn3VdV5Fvzkv9YLFyhcTmZ5ujkfKvh71MKjzfUSD4ejhwOZFWUfXkcOMmg
         ANLQoN1w5jQrb5FSxU7cJCD42mun5MvX/VH6dUNFf6/6AUK1+TnEaJ2i6EcE/O7k7tsk
         Q/KyLo1PBhPN7U9q4N9Oc79cnl2Ouml/atMUpeg8LctW56Z3Eprc455mp2tKUTHTPutI
         jGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhLQ2+AFBKYvd49hjnpbxAfRbq33zxkIhZB5jg0/T3k=;
        b=ZZTg5Lvf39DCAhdz9a/K+YdzVAyWE2bmb8LL3kmCH6xmr7Ip/Mi39nb2mTeGFUs19G
         R07PeXL2nNTpE3QAKdZAtwvA1JwMxbUruCBNn7XoyJ4h/mdOGHGWddu2GVtZk8ZHiw1J
         5vB0fkw7GkVJwxpW9IhVs3XU/XFMS+qWuYGWOxQxmGEp9EOaOs6v7NbzqWrdiqiPbEyl
         2mXae58O9TQArXq+cshrljxtULydo9TbGn53oCPlKLXI8Ogsap57Gvp/oCmt/WpcldDv
         8/EtTYKgbpjUO4G5/e9wCwh1vTQI75mj8TMpGSTsRxvcJgNFlCztTpggolgzaDG/Ejo1
         IaYQ==
X-Gm-Message-State: ANoB5plZGeGG2yQ9E7LHjk8L1j2bIWrV21ZRUYThlIkPZX4auZM5BrhB
	L70i8yhRao8xobwZdJ590UVUF5YvW4U/gDyFBBk=
X-Google-Smtp-Source: AA0mqf71OIdPxFzES4vlNVJOhTykEJFZoaulr3FqFMyCcbYVWBCeN3/hfzIPJQkBszVx3OTqtudk5EtfT6jOoFcwmFg=
X-Received: by 2002:a9d:6486:0:b0:66d:ca7a:8b1a with SMTP id
 g6-20020a9d6486000000b0066dca7a8b1amr21987424otl.55.1669826358840; Wed, 30
 Nov 2022 08:39:18 -0800 (PST)
MIME-Version: 1.0
References: <0b6801d90409$885d6860$99183920$@gmail.com> <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
In-Reply-To: <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Nov 2022 08:38:52 -0800
Message-ID: <CAMKF1spWtZTUwAqweKYPQaP9wh=-pHHt0v5c6yNYXD1bu==onw@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Y2038 proposal
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 16:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174024

On Wed, Nov 30, 2022 at 12:08 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 29 Nov 2022 at 16:45, Stephen Jolley <sjolley.yp.pm@gmail.com> wr=
ote:
> > We=E2=80=99d welcome a proposal/series on how to move forward with the =
Y2038 work for 32 bit platforms.
>
> I have the following proposal:
>
> 1. A branch is made where:
> a. "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64" is enabled globally.

I have something like this on yoe/mut branch on contrib repo ( due to
musl removing the LFS hacks).
However there are packages which need to be fixed at build time.

> b. qemu is always started with "-rtc base=3D2040-01-01", simulating
> Y2038 actually occurring.

this is a good time machine :)

> c. an additional runtime test verifies that both RTC clock and system
> clock report 2040.
>
> 2. This branch is run through a-full on the autobuilder. Any uncovered
> issues are filed as bugs.
>
> 3. Once *all* of the bugs are addressed, repeat point 2.
>
> 4. Once there are no more open bugs, 1a is merged into master.
>
> Any fatal flaws in the plan?
>

Not much issues except that package fixes may need to be carried
locally for a while.

> It's not hard to see that Y2038 problem is real and serious, e.g. on
> qemux86 core-image-full-cmdline built from master:
>
> root@qemux86:~# ls /
> bin  boot  dev    etc  home  lib    lost+found  media  mnt    proc
> run  sbin  sys  tmp  usr    var
> root@qemux86:~# date -s "2040-01-01"
> Sun Jan  1 00:00:00 UTC 2040
> root@qemux86:~# ls /
> bin  boot  dev    etc  home  lib    lost+found  media  mnt    proc
> run  sbin  sys  tmp  usr    var
> root@qemux86:~# ls /
> -sh: ls: command not found
>
> On qemux86_64 the same sequence works as expected, of course.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1663): https://lists.openembedded.org/g/openembedded-=
architecture/message/1663
> Mute This Topic: https://lists.openembedded.org/mt/95354042/1997914
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture/u=
nsub [raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

