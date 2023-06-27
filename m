Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79923EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 18:49:44 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.3661.1687891782042226086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 11:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=qQf0sEB7;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51d91e9b533so3669162a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 11:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687891780; x=1690483780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNWftcQ1pgs+ry2mCA1ePEBkIWhiNrTwgWkklQ3HIKk=;
        b=qQf0sEB7Vj25bSjGXTkDnahdbi82CFreh3Zf4pXyitByXlPb2hIqbpO45IGARXpmeO
         YTHeBMZ2Nn8cTcfA1HVfeNi4ggMR0EeoK7L5bXsnQnl2BwwMxbD3IoR0iUR1kIyur0pg
         DbIWOv+iCt4t3hFCIPJEEPEESkXbDvhsTF3d4s2/r2kbA8PgYLOooN7ocabzo2zr6jWO
         7LGrUGVfbld3tbOU1df8u6HdOAC8tW7tpNbCQf5FTZBilO6E7oqIeHpJxVLHgzeYrQLy
         Q9/0nimAc7BctZdfYS/m1HiO7SdCHD/WOgtm9CgTlpVdal67X49dpLbLE8xZ7o4JK2Nu
         EGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687891780; x=1690483780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNWftcQ1pgs+ry2mCA1ePEBkIWhiNrTwgWkklQ3HIKk=;
        b=cGKf25Bo8Ylvo197E1+OZmUp0ljc5aoDgom5y2mBPFR5xQlRnwLnZRXVD3D8TiRXnD
         q7Qm9Q7/jFzkxz0q0og7cg+GbrK2akvAMkfAxa8xGOnptd2enjoWG+RMzdYWw3DtvkRW
         gCBfpUYDy4S/XoN4hgXGj5bbdzDXPBEeVTA15X0wLO0/kEGeyKBPTXIlKwuaaSHJmIs1
         ezeB6jPbrx7joAewdxwgQKGaKuX57xEAk0hNppmN8EAvgjE3QUZ6IGDHtCbP93ivTLv4
         uJeJoYO8nTulkNHmtoTMhfRMbypz/K4UJnBrxzOAZ8YHVoG317M2wKYH64Z/EbSBdoLx
         uGFw==
X-Gm-Message-State: AC+VfDw3K/mBTYGw31oCN3OHbsfBzFiI2g8nmp+MqHYcnnMLdWTNHs86
	lxcm/RJ8xVSZxf69aWSAaXZU60PrmAC2H1UXIVxgwQ==
X-Google-Smtp-Source: ACHHUZ66feFQy2stwpL7QcnVTEHQy3z5kOW2cUNxlx+lUdHxLCOBJlqT9w8LDtG/nqP4KLxJMwDoKBPukAAoDvwUz14=
X-Received: by 2002:aa7:cd08:0:b0:51d:ad30:5ed7 with SMTP id
 b8-20020aa7cd08000000b0051dad305ed7mr1525517edw.35.1687891780198; Tue, 27 Jun
 2023 11:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230623162448.3162089-1-rs@ti.com> <CAOSpxdYUCYHjzu3J4ZbfeXpyx2+DkgaXvA3fWvVOtazUCSnWtA@mail.gmail.com>
 <6e86c4e8-928a-7056-b7cd-3b0216891587@ti.com>
In-Reply-To: <6e86c4e8-928a-7056-b7cd-3b0216891587@ti.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 27 Jun 2023 08:49:29 -1000
Message-ID: <CAOSpxdYT-BKnjkWAtou+wX80kFJ6JE5TM8SnBNtEF=6gPSyd3w@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [oe-core][kirkstone][PATCHv2 0/8] Backport all
 weston-init qol updates
To: Randolph Sapp <rs@ti.com>
Cc: richard.purdie@linuxfoundation.org, denis@denix.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 18:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183497

On Tue, Jun 27, 2023 at 8:25=E2=80=AFAM Randolph Sapp <rs@ti.com> wrote:
>
> On 6/27/23 11:00, Steve Sakoman wrote:
> > Hi Randolph,
> >
> > Unfortunately this patch series results in oe-selftest failures on the
> > autobuilder, three examples below:
> >
> > https://errors.yoctoproject.org/Errors/Details/710122/
> > https://errors.yoctoproject.org/Errors/Details/710127/
> > https://errors.yoctoproject.org/Errors/Details/710125/
> >
> > Note in particular:
> >
> > AssertionError: 1 !=3D 0 : Log:
> > /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-1203856/=
tmp/work/qemux86_64-poky-linux/core-image-weston/1.0-r0/target_logs/dmesg_o=
utput.log
> > -----------------------
> > Central error: [    2.392519] weston[373]: segfault at 28 ip
> > 00007fad628102aa sp 00007ffff5bf2410 error 4 in
> > libwayland-server.so.0.20.0[7fad6280c000+8000]
> > ***********************
> > [    1.742836]   with environment:
> > [    1.742837]     HOME=3D/
> > [    1.742838]     TERM=3Dlinux
> > [    1.800627] udevd[167]: starting version 3.2.10
> > [    1.806665] udevd[168]: starting eudev-3.2.10
> > [    1.964586] EXT4-fs (vda): re-mounted. Opts: (null). Quota mode: dis=
abled.
> > [    2.020081] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> > [    2.223651] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> > [    2.224563] Bluetooth: BNEP filters: protocol multicast
> > [    2.225490] Bluetooth: BNEP socket layer initialized
> > [    2.392519] weston[373]: segfault at 28 ip 00007fad628102aa sp
> > 00007ffff5bf2410 error 4 in
> > libwayland-server.so.0.20.0[7fad6280c000+8000]
> > [    2.394037] Code: 48 8b 47 08 48 8d 77 10 48 8b 78 08 e9 1f c3 ff
> > ff 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 41 54 55 48 89 fd 48
> > 83 ec 08 <8b> 57 28 4c 8b 67 08 85 d2 79 3b 48 8d 05 64 b0 00 00 48 39
> > 07 0f
> >
> > ***********************
> > 1 errors found in logs.
> >
> > Steve
>
> Rats. I'm concerned what could have caused a segfault in
> libwayland-server in this series. This only tweaked Weston launch
> parameters and the only time I've seen that result in instability is
> when you ask Weston to load a module that isn't present. Even that only
> results in a safely handled runtime failure.
>
> I hate to bother you with this, but where is the source code for this
> test? I'd like to poke around a bit more...

I've already dropped your patch series from my test queue, but you
could duplicate what I tested by adding your patch series to the
stable/kirkstone-nut branch on oe-core-contrib:

https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/kirk=
stone-nut

Good luck!

Steve

