Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D5FC3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 15:32:45 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.53479.1747063956192690922
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 08:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IX+33VY7;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.182, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e73e9e18556so4283183276.0
        for <Openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747063955; x=1747668755; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByvXxNW1O+IdzqEXbC8r4Qk5oo+mB53c6I8FowTe4CY=;
        b=IX+33VY7GjsrUnVD3ZBeGgN0MFesOJNGudwgQRMmRQm8uS8f3jodnp56CAcGJxeBrw
         qRruojZzBBRc7Tz0gqrKxlO0fmCCnoyy49+EYhW28MWVx2trUAAbkWTXe6OPCUb/DdZ7
         hSx3QySwa0049/Lm3LsVPqLCQCJ2Pb1Mf4odYsKA9hC1SMjUl9v3BCRf+ZIOIOAqYQKD
         b5ZUnABa6/Wr5Gd90z+HEelkpin6wD0/RZDYduDA4GAwvzY21TRqRWwua0Nr0lXqpfdT
         hfjp3awaqiA43IVTtZUpVFmTkgIEVknqf8UCvEgARxgZo+DXEr/lDHiPBBm9R5lZ2ftL
         zRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747063955; x=1747668755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByvXxNW1O+IdzqEXbC8r4Qk5oo+mB53c6I8FowTe4CY=;
        b=fSWrkAt+96vYM1wsyESTQjlVeUZ2TsM5i9GyRbG9ThdOV30DeAa2vnv2eeN0Kj9Yl9
         YH2vdLegqnsirqNUtXik1WUBHpmzm9xyxTCnf3zDROVlwsdFJL9Cwl+GFgdU9WjDoHXQ
         sWVxz32R6RuuBALCOJdAz1lp2V59uIc0ucWlFoJnbUy14Q1vaLePp7WSkDNOmXLy+p9a
         V1mk/aV2xcr6pWRlzXi47HSnZPfUAHcLsfeKWgO5FJ/aRB6+riQ1YAvJin1Uxk40jhlU
         Vxr9CEU24wNN6h155vKveML1NyEPvQ2SC9wpgilQ0Vnzd5lNKt7GODafswqIoUX85wr/
         G3Rw==
X-Gm-Message-State: AOJu0Yycv9tkHJG60doHvjvOZJOMQpAFe8+2bbC9LFyuglO1jn8Wk8SS
	yQ2P9yVuwmDnCByQGf4EMkqD5QpSy9D8Eieewp1HrUtzU3QxD/OaNwIkQi5P2HjIcF+Rbkx/qTi
	dxK3PUo3KVOUox3/PZyZmc+OqlSz9Sb5i4qAaGw==
X-Gm-Gg: ASbGncsCcDQVdEq8ysJkvulep6Weqtx3kxqzGGOymkdfrIatR9mYGj5aow5zxeKrIen
	xAB9U/6zZrRZEamOklmgwh13IjFOlcxBi3yg9l+DnyfNXoF8o7Z9KwL7xsTEMxsTeocxRvyxrUe
	IY8cPBM6hATeeYr1EDtn3xEQB+/b34+JYtu27Z/Kq/JO8ebQsgPEvLZaIKbWnoTpNO
X-Google-Smtp-Source: AGHT+IGZp7rMZSacgkxbrYF/5RRE2Bq+9pL06p0HeEXf1ux8aVaxGnMpUdcEqSM2UnO6hNj0ZRzWdvyuGhtaaJCIeEA=
X-Received: by 2002:a05:6902:2304:b0:e73:3068:bbd7 with SMTP id
 3f1490d57ef6-e78ee0c14f7mr24566240276.14.1747063955099; Mon, 12 May 2025
 08:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <183ADB3BB2889EAC.12076@lists.openembedded.org> <7fd0841f-a002-414e-a2cd-76a448afb30e@gmail.com>
In-Reply-To: <7fd0841f-a002-414e-a2cd-76a448afb30e@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 12 May 2025 08:32:24 -0700
X-Gm-Features: AX0GCFvIiAXUaFe7vWKFzlx8SguL7TKd5qM5dhn6bOI79rZfKTxsuVjR2LhWQ_8
Message-ID: <CAOSpxda8rwuRtqi9++Tkzd3onzgtrpFJBWCLy5zfreA8yMe6EQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Password agents shouldn't be optional
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 15:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216375

On Sun, May 4, 2025 at 11:12=E2=80=AFAM Vyacheslav Yurkov <uvv.mail@gmail.c=
om> wrote:
>
> Do you think this change can be backported to scarthgap?

This is not a clean cherry-pick for scarthgap.

Feel free to prepare, test, and submit a version of this patch for scarthga=
p.

Thanks,

Steve

> On 29.04.2025 19:46, Vyacheslav Yurkov via lists.openembedded.org wrote:
> > From: Vyacheslav Yurkov <uvv.mail@gmail.com>
> >
> > If extra-utils package is not included in the image, you'll always see =
a
> > warning that password agent is missing whenever you start/stop a servic=
e:
> > Failed to execute /usr/bin/systemd-tty-ask-password-agent: No such file=
 or directory
> >
> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > ---
> >   meta/recipes-core/systemd/systemd_257.5.bb | 10 ----------
> >   1 file changed, 10 deletions(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-=
core/systemd/systemd_257.5.bb
> > index 2a18445eba..acf97517a9 100644
> > --- a/meta/recipes-core/systemd/systemd_257.5.bb
> > +++ b/meta/recipes-core/systemd/systemd_257.5.bb
> > @@ -602,26 +602,16 @@ FILES:${PN}-extra-utils =3D "\
> >                           ${bindir}/systemd-cgls \
> >                           ${bindir}/systemd-cgtop \
> >                           ${bindir}/systemd-stdio-bridge \
> > -                        ${base_bindir}/systemd-ask-password \
> > -                        ${base_bindir}/systemd-tty-ask-password-agent =
\
> >                           ${base_sbindir}/mount.ddi \
> >                           ${systemd_system_unitdir}/initrd.target.wants=
/systemd-pcrphase-initrd.path \
> > -                        ${systemd_system_unitdir}/systemd-ask-password=
-console.path \
> > -                        ${systemd_system_unitdir}/systemd-ask-password=
-console.service \
> > -                        ${systemd_system_unitdir}/systemd-ask-password=
-wall.path \
> > -                        ${systemd_system_unitdir}/systemd-ask-password=
-wall.service \
> > -                        ${systemd_system_unitdir}/sysinit.target.wants=
/systemd-ask-password-console.path \
> > -                        ${systemd_system_unitdir}/sysinit.target.wants=
/systemd-ask-password-wall.path \
> >                           ${systemd_system_unitdir}/sysinit.target.want=
s/systemd-pcrphase.path \
> >                           ${systemd_system_unitdir}/sysinit.target.want=
s/systemd-pcrphase-sysinit.path \
> > -                        ${systemd_system_unitdir}/multi-user.target.wa=
nts/systemd-ask-password-wall.path \
> >                           ${nonarch_libdir}/systemd/systemd-resolve-hos=
t \
> >                           ${nonarch_libdir}/systemd/systemd-ac-power \
> >                           ${nonarch_libdir}/systemd/systemd-activate \
> >                           ${nonarch_libdir}/systemd/systemd-measure \
> >                           ${nonarch_libdir}/systemd/systemd-pcrphase \
> >                           ${nonarch_libdir}/systemd/systemd-socket-prox=
yd \
> > -                        ${nonarch_libdir}/systemd/systemd-reply-passwo=
rd \
> >                           ${nonarch_libdir}/systemd/systemd-sleep \
> >                           ${nonarch_libdir}/systemd/system-sleep \
> >                           ${systemd_system_unitdir}/systemd-hibernate.s=
ervice \
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#215684): https://lists.openembedded.org/g/openembed=
ded-core/message/215684
> > Mute This Topic: https://lists.openembedded.org/mt/112524855/4455192
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
uvv.mail@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

