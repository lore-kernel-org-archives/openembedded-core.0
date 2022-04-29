Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A88FC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 18:38:31 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.13836.1651257508741644826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 11:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TGhNm+MK;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id p4so5855713qtq.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 11:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vvATzzR5ZeAL+mwx1yXOuFuuPw+KyVOM4s3TFyHoKLo=;
        b=TGhNm+MK2a1aC+1kthLKjukpLXQ6Vzuyp6vvgiLitGyvXVRFZ6fuw1qYhVFEdO9kmd
         G/1qX2cJXnBXyBdAt9HSRoe2ruWOPflK/zy4QfXHgbWBqEfob9lHjpYnl6HegGnPo5sP
         LRU0N/eN899hnCObAjde1KQi6YndnlTC5mXe4AuY9IfXmIGaFYNFJpDSjnsIUOOkp7FB
         bfWKoyHAYKXnZAGr27omJ+8XQfgSDd+xKGsk1nAWMuCckJrH8D0xL60/LipTIpll1EnX
         FJIM3Q0AaChSPUdplrRC1FcMVCjnu6+qn7yHez6Fr1yw0R8EK9Ry8JM/zLCUmWx+Cm6g
         KJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vvATzzR5ZeAL+mwx1yXOuFuuPw+KyVOM4s3TFyHoKLo=;
        b=6WGXO7PkV/50Qlay/ZW0SGwpRyDce4ZwBLbN+D1cBsVjDsaE4VIoOUKW4dN+jgP7wR
         GmoPHzossIlDulFU3x2eDSd6wyIHfBxlCBvJV7X2WkD1/AvC71lpioSauX/CRBxIKU5S
         zGDJ1EPXcA1Ou0C5E55qoCk9ryfJNem9yUx4t9cZvMxhd2rKoiehSUCrbtQv0y6nIxXn
         Oy4kDC8oIXH7ZcppKOU3+uB5Wpi378zpwvmHU6wtTI573mHiX0aYB/GRuGBycoU5S2gS
         g5q/2G0WOkTgN3M3dzwbR6H4VNoHLhifJ8AI+FOx1qnpX2M8pEEkv/V6vMdvA0WEFzLs
         iTCg==
X-Gm-Message-State: AOAM530NMrg9Tqjqep0qyNcdCuF+u8/ISvB0N8BtkFwGw9U5KL1LPpri
	8VYKDx13e6bbksMZcM0R9kEia/A88OQ7Ij8ZZAo=
X-Google-Smtp-Source: 
 ABdhPJzdc+T64mhbc7398VPAW0VMJOJGTMTtKt3PaNLUuB65/65yfKnFERKS7MYH0pivQs693tKKFJcBSIfjK0sbFCg=
X-Received: by 2002:a05:622a:1a91:b0:2f3:8fd3:7e4a with SMTP id
 s17-20020a05622a1a9100b002f38fd37e4amr721990qtc.54.1651257507731; Fri, 29 Apr
 2022 11:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220428062647.2717638-1-raj.khem@gmail.com>
 <b2ffb05a-5792-4630-8a85-5d4d64c7aa53@www.fastmail.com>
 <CAMKF1soLq0weUiGi+u--tgAk+ivxSCqo9Nvd5-cH5jpJeDvpJg@mail.gmail.com>
 <CAGDS+nnWUvDZq+GjyujADWv4XF9nzF8SCiQ8re7VMvYfOGu2ew@mail.gmail.com>
In-Reply-To: 
 <CAGDS+nnWUvDZq+GjyujADWv4XF9nzF8SCiQ8re7VMvYfOGu2ew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Apr 2022 11:38:01 -0700
Message-ID: 
 <CAMKF1srfNE++atFHX9QEtBHrugaPAhzVQKshDNVjG7J++3JLpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kmod: Enable xz support by default
To: Steve Sakoman <steve@sakoman.com>
Cc: Andrei Gherzan <andrei@gherzan.com>,
	openembedded <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 18:38:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165056

On Fri, Apr 29, 2022 at 11:24 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Thu, Apr 28, 2022 at 5:00 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Apr 28, 2022 at 4:27 AM Andrei Gherzan <andrei@gherzan.com> wro=
te:
> > >
> > > On Thu, 28 Apr 2022, at 07:26, Khem Raj wrote:
> > > > RPi kernel has started building compressed kernel modules by defaul=
t
> > > > starting 5.15, currenrly therefore meta-raspberrypi kernels are una=
ble
> > > > to load kernel modules since kmod and kmod-native do not entertain =
xz
> > > > compressed modules. There is a fix proposed in meta-raspberrypi [1]
> > > > but the fix is needed for native and nativesdk recipes as well, per=
haps
> > > > its best to enable it here for best out of box experience with
> > > > meta-raspberrypi
> > > >
> > > > [1] https://github.com/agherzan/meta-raspberrypi/pull/1056
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >
> > > I don't see any reason not to do this and it does help with the BSPs =
using this compression requirement. So here is my +1. Would it be reasonabl=
e to propose to have it in kirkstone too? Otherwise, @khem, I'd need to dro=
p compression or downgrade the kernel in kirkstone rpi (or make some yocto =
incompatible changes - which I'd rather not).
> > >
> >
> > Its already in staging for master [1] so hope to land it in master
> > soon. kirkstone is something from Steve to cherry-pick CCing Steve
> > here
> >
> > [1] https://git.yoctoproject.org/poky-contrib/log/?h=3Dlucaceresoli/mas=
ter-next
>
> It's hit master now, so I will cherry-pick into my next patch set.
>

thanks Steve.

> Steve

