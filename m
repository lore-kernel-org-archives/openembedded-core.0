Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B32C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 18:24:51 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.13884.1651256682965929475
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 11:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cNlDV6by;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: sakoman@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id t4so4512621ilo.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 11:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=twbHKD8DsURx95TIt7Vh8WOGpn7iRQMCJX/eydDP29E=;
        b=cNlDV6by9jdP6zb4Om0hu5wDm3ko2666YfUPVgoUzd9kudHF3rZcZRsmarD9NZ2rql
         BJqLnnlapn61twKcinePyMYI7ECZ6xtjebLyfLBLXACFF1N22SV2c9+Lq763kgiwRxPG
         h9AVhD6Rk1sxNPyN2rilPvWcQDOUBqsxORF+fbKsKstCJGvISXF8s6n/4wzprOqdO6H6
         wG+5KBXFDvf6N3KAE/6uSrS861nd3wrdmvf+jV7+gKw4QtqXXzon+lYUdaGNAPyxQyjI
         eBbNP2DH+71jhlRm8sjptkXSI+M85pyEVHSy/87MtklmkgafpixhTpY5iu/q876qWhLG
         Zd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=twbHKD8DsURx95TIt7Vh8WOGpn7iRQMCJX/eydDP29E=;
        b=VkN/U4AZGQfme3q+RQIaq1CQzRyywn7rDiUUvyrUG2FTj6c/QmsKDp05ppYR1SDWIe
         9rXtZobBrCZK40jNM6FgLZjgfd98UPJamG6RK1slXdH7W0n+P+sDzXm+XGvsvGp3Wfba
         6sYwnBjCOOXbKow2nOViHdYS7AZTgXQhDAmYi3CnE8zIltyzcdbcCnlWs744nYLaAHxW
         xGIRX8UNOs2Jm8y7TPFYpv6ii+mubLV5nPGM3HiJpMxcsXyuQUmpkss3Ly5zARI6rgw3
         SkpUKHDMK1VNQPiQun+gcwzfd7yZOClVq6c0n3gjvjI6sKReHfp8LERGQZ7a+RPX/4nc
         g6YQ==
X-Gm-Message-State: AOAM531oWk3w7YgYqW9eNlul8kA+/0psGnS0RgaN7o5LGcZlhBm0pfNS
	4Pi2DrstSSHmqXM7u08X+IjhPWM+cW79a1jMEt4=
X-Google-Smtp-Source: 
 ABdhPJyZzPAq+jJgWy4pggvusHM9Pwya0DoIPZOkvwki9VYkZOdLK5hb91aTG0a9GrwRAY44nZB3BJi8reXM2TDpRQ8=
X-Received: by 2002:a05:6e02:1ca4:b0:2cc:467c:7eaf with SMTP id
 x4-20020a056e021ca400b002cc467c7eafmr244060ill.175.1651256682395; Fri, 29 Apr
 2022 11:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220428062647.2717638-1-raj.khem@gmail.com>
 <b2ffb05a-5792-4630-8a85-5d4d64c7aa53@www.fastmail.com>
 <CAMKF1soLq0weUiGi+u--tgAk+ivxSCqo9Nvd5-cH5jpJeDvpJg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soLq0weUiGi+u--tgAk+ivxSCqo9Nvd5-cH5jpJeDvpJg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 29 Apr 2022 08:24:31 -1000
Message-ID: 
 <CAGDS+nnWUvDZq+GjyujADWv4XF9nzF8SCiQ8re7VMvYfOGu2ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kmod: Enable xz support by default
To: Khem Raj <raj.khem@gmail.com>
Cc: Andrei Gherzan <andrei@gherzan.com>,
	openembedded <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 18:24:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165055

On Thu, Apr 28, 2022 at 5:00 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Apr 28, 2022 at 4:27 AM Andrei Gherzan <andrei@gherzan.com> wrote=
:
> >
> > On Thu, 28 Apr 2022, at 07:26, Khem Raj wrote:
> > > RPi kernel has started building compressed kernel modules by default
> > > starting 5.15, currenrly therefore meta-raspberrypi kernels are unabl=
e
> > > to load kernel modules since kmod and kmod-native do not entertain xz
> > > compressed modules. There is a fix proposed in meta-raspberrypi [1]
> > > but the fix is needed for native and nativesdk recipes as well, perha=
ps
> > > its best to enable it here for best out of box experience with
> > > meta-raspberrypi
> > >
> > > [1] https://github.com/agherzan/meta-raspberrypi/pull/1056
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > I don't see any reason not to do this and it does help with the BSPs us=
ing this compression requirement. So here is my +1. Would it be reasonable =
to propose to have it in kirkstone too? Otherwise, @khem, I'd need to drop =
compression or downgrade the kernel in kirkstone rpi (or make some yocto in=
compatible changes - which I'd rather not).
> >
>
> Its already in staging for master [1] so hope to land it in master
> soon. kirkstone is something from Steve to cherry-pick CCing Steve
> here
>
> [1] https://git.yoctoproject.org/poky-contrib/log/?h=3Dlucaceresoli/maste=
r-next

It's hit master now, so I will cherry-pick into my next patch set.

Steve

