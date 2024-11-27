Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2670D6D236
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 20:00:52 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.80638.1732737648772640950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 12:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=erLlarQD;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-71d3e506981so41188a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 12:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732737648; x=1733342448; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0tQigcHLLGwNsqh+mKWk5brg6ojQhoQPsvB9M11zaU=;
        b=erLlarQDTVgoXZhSgURHqJYgH0YUEVjlMYyKsRAO3vCV52SNvd0y5QdMsP0csUB0ji
         VAihiACT236+63fIYS+BZKWvt0QHA5mpvquH4yLChg4F21FpJZPO3NP8WHbHbVnWkWXA
         rvzIdZkLXkBryC1ozrCtf0/cXsbXB/zCfx6MkTPE1IrntNAPitgT3KppnKbl5NUZZhXr
         vg4cpdsSXUwNwuydV2vi2YXGjXEcJNox7wc/UmqEJ2R47V0QI6RYvK2dtWyqqdTRAX99
         CqCM+izTTYzrHFBuNlZP+q34KrDjTNVXEWHh+lK4xruo5XCoxiJI5ELXZCSjDuTC00ug
         5gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732737648; x=1733342448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0tQigcHLLGwNsqh+mKWk5brg6ojQhoQPsvB9M11zaU=;
        b=bctqsWnXJHes26cRNZKY9tSE68tcQ2Zh0sU1qLPgccFtSlFTMISDpkfxeJEW5YMcvh
         89K3tU668l5M83vDVXfzK1PtzmqPxYvK60g9tGA9DL2orkdVw0zlTCWy5RhJRjsBT+Nf
         luMVWndV5YaWx5BVGrcuRDef35ezoxBH3XX7DLzqHp8bjaaccNeLCpjK6o6pggAza1CK
         dmMRaeNIsyXri2zyOj71tnK/VguiRSNw2OxKF0YhcrW4Dr4eWVR1tUHN5E2xKj976G4b
         5n3rj4Xg+RalN0omXvUIKu/rYT5lwDKr0vPqneOKGNazprArYmDr40cGXfUb4Q6sENI/
         k2bw==
X-Gm-Message-State: AOJu0Yz3LnTwCmBYKk82eTMlFo6YD6iKckPjZbIyEvi0ExhB4R08viLf
	QL97WW5PQv2A6uQkk7DJFM9R/fTglndx9xZ+owMZlFiLxLYqgq5sgfqi2UaOn531YLsE35wMwJF
	2zNxAljTIoI0pxxdN37iUJdyXXdzq9wed
X-Gm-Gg: ASbGncvVTGpkJxeOQZqh8yoAPWPsiUKebYNAoPNrcgkmUfU52923GIv2J9LKHiUjE7s
	nIq58BeNtY1poXH2Ftgv69Fgn83avDg==
X-Google-Smtp-Source: AGHT+IGl3IbMkk3DnjlxxCV92CKSgoBkpzIuMB2Ju3++7es5DyN2XoK9BrQ0XeEMqTeMsgltENdgTaMx78h6VSg8vCg=
X-Received: by 2002:a05:6830:43a1:b0:710:f3cb:5b9d with SMTP id
 46e09a7af769-71d65d28523mr4070117a34.24.1732737646906; Wed, 27 Nov 2024
 12:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20241127005121.683644-1-raj.khem@gmail.com> <20241127005121.683644-2-raj.khem@gmail.com>
 <6251c0723200d0c0a3f3d49a6477a10c4de9a9f1.camel@linuxfoundation.org>
In-Reply-To: <6251c0723200d0c0a3f3d49a6477a10c4de9a9f1.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Nov 2024 12:00:21 -0800
Message-ID: <CAMKF1srA=K=2ky23m_pfPy7eymc2WzES7MnS3DfGpRhBHADuNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] weston-init: Make weston user member of
 seat group
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 20:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207964

On Wed, Nov 27, 2024 at 3:45=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2024-11-26 at 16:51 -0800, Khem Raj via lists.openembedded.org wr=
ote:
> > This enables weston launch to access the seatd socket
> > /run/seatd.sock to communicate properly to acquire seat
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-graphics/wayland/weston-init.bb | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipe=
s-graphics/wayland/weston-init.bb
> > index 3de697ec34e..52ffba336aa 100644
> > --- a/meta/recipes-graphics/wayland/weston-init.bb
> > +++ b/meta/recipes-graphics/wayland/weston-init.bb
> > @@ -102,6 +102,5 @@ FILES:${PN} +=3D "\
> >  CONFFILES:${PN} +=3D "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir=
}/default/weston"
> >
> >  SYSTEMD_SERVICE:${PN} =3D "weston.service weston.socket"
> > -USERADD_PARAM:${PN} =3D "--home /home/weston --shell /bin/sh --user-gr=
oup -G video,input,render,wayland weston"
> > +USERADD_PARAM:${PN} =3D "--home /home/weston --shell /bin/sh --user-gr=
oup -G video,input,render,seat,wayland weston"
> >  GROUPADD_PARAM:${PN} =3D "-r wayland; -r render"
> > -
> >
>
>
> https://valkyrie.yoctoproject.org/#/builders/3/builds/558/steps/11/logs/s=
tdio
>

yeah saw that in my CI as well overnight, I have sent a v2 to address it.

> Cheers,
>
> Richard
>

