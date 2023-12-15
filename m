Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8687C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 17:26:35 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.68552.1702661185862188179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 09:26:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=acK3rXK/;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6da52f16427so456764a34.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 09:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702661185; x=1703265985; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=runhUVcEy5Ef3oE36aZ3wxubI1NbBDkNu3JwxVhDda8=;
        b=acK3rXK/qL6Ryjw12OgmQnFAaX0IosFZ59zks54OWU69Fhx5IIjuAEvwryxVfbBC8t
         0RyZgbwTcUXxTTbsaJgwtt0SEBH8BL5LUv682tbTby54bHGpENlivj83+T1nUqnuGxp0
         COuoPSmPOhmCNCkOsY6BDoQIPg/iDLS6phxCap27BCUE6dJc54viphF0EuRLDVt1BFLG
         zfov7XZV8Zy1ugrY3ooY5QAJwo14jv/bKL066zfJTJLBQsr2/ZYlKrH6+isgoKcMKg4w
         JobT85QrN026LGXPPOYuQ6BJWHVV96VAwN+a4Bxigch7jpYZh01jSND9ghS3I83eQilx
         X8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702661185; x=1703265985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=runhUVcEy5Ef3oE36aZ3wxubI1NbBDkNu3JwxVhDda8=;
        b=l6XRhxQ9KQcA6AxuyTaU2LE+nB7hErgy2MFWqJY4pJlZGuqGR57lk8ugUBlC2s5bjH
         ta9bPnjZBWjCeEyTbF27yA5sZSc166PFNKZ1OB5bAquQMRUfl/rOPT/MJrUka0s2+uR7
         wEkbM2VsZzYUKqTvA8Aap7miiC/s9bDW/jnfDAjTlqVsQGcBzPs3saA41TGnf+3/CvSs
         JSA0m9wFTMOhnqvpC65nBn788ZIQyZhfwhTNa4I/1erHpbC7vbvg2dLS8iiluc4zy479
         3qyR+o4AWzsPdEbu/1tqdyZ27leHrcDCRDXLEqbS7+rT3pS8R8KxeZLFE2ZQaPMAw+9Z
         zzaw==
X-Gm-Message-State: AOJu0Yz9C1kzIbB/JqwoahOEdiqBO6T5zlRGTZC7Ko/Xrma/WEtf3Gxv
	ews9A4B490+neSH4Mm+KmK6n8ryjLPlvfuaKPo8=
X-Google-Smtp-Source: AGHT+IEyYPmsEfj/rJFswZYaUZWKqHVpz4oO709WWKm3yANlteBpP4h1PeCC79z0xoE2xo9A43G02ICZQheZQFjy214=
X-Received: by 2002:a9d:784d:0:b0:6d9:f4c1:2003 with SMTP id
 c13-20020a9d784d000000b006d9f4c12003mr11779061otm.15.1702661185136; Fri, 15
 Dec 2023 09:26:25 -0800 (PST)
MIME-Version: 1.0
References: <20231206074307.21110-1-johannes.pointner@br-automation.com>
 <654B156F-66BF-4AE7-A9C8-12FAD78EDEA2@arm.com> <CAHvQdo223q=L2H-z1K_rNw5voD_dLE+PbUqQ1d1d=NAT8a2LuA@mail.gmail.com>
In-Reply-To: <CAHvQdo223q=L2H-z1K_rNw5voD_dLE+PbUqQ1d1d=NAT8a2LuA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Dec 2023 09:25:58 -0800
Message-ID: <CAMKF1sptBWEh=h4bZNn9F_6naf+Usd+C2hf5+_Q9dfXFmj7bNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] ldconfig-native: Add usrmerge support
To: Johannes Pointner <h4nn35.work@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 17:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192539

On Fri, Dec 15, 2023 at 4:37=E2=80=AFAM Johannes Pointner <h4nn35.work@gmai=
l.com> wrote:
>
> On Wed, Dec 13, 2023 at 12:01=E2=80=AFPM Ross Burton <ross.burton@arm.com=
> wrote:
> >
> > On 6 Dec 2023, at 07:40, Johannes Pointner via lists.openembedded.org <=
johannes.pointner=3Dbr-automation.com@lists.openembedded.org> wrote:
> > >
> > > From: Johannes Pointner <johannes.pointner@br-automation.com>
> > >
> > > If DISTRO_FEATURE usrmerge is enabled, SLIBDIR is just a symlink to L=
IBDIR.
> > > ldconfig-native uses hardcoded paths for SLIBDIR and LIBDIR that are =
fine for
> > > the not usrmerge case. But if usrmerge is enabled ldconfig-native gen=
erates a
> > > ld.so.cache, which is done in rootfs.py, that looks like this:
> > > 236 libs found in cache `/etc/ld.so.cache'
> > >       libzstd.so.1 (libc6) =3D> /lib/libzstd.so.1
> > >       libz.so.1 (libc6) =3D> /lib/libz.so.1
> > >       libxtables.so.12 (libc6) =3D> /lib/libxtables.so.12
> > >       libxslt.so.1 (libc6) =3D> /lib/libxslt.so.1
> > >       libxml2.so.2 (libc6) =3D> /lib/libxml2.so.2
> > >
> > > This breaks for example the Qt QLibraryInfo paths if Qt is configured
> > > 'relocatable' and leads to the issue that the QtWebEngine can find th=
e
> > > QtWebEngineProcess, Qt WebEngine resources,...
> > >
> > > Therefore don't let ldconfig-native parse SLIBDIR if it is a symlink.
> >
> > This still doesn=E2=80=99t explain *why* ldconfig is broken, why the wo=
rkaround is a yocto-specific fix in ldconfig and not a general fix that oth=
er distros have, and why this isn=E2=80=99t a problem with Qt.
> As I wrote above ldconfig-native is broken for the usrmerge case
> because it uses hardcoded paths which are correct for the "not
> usrmerge case" but not for the "usrmerge case".
> Other distros as also the yocto ldconfig for the target system is
> configured at build time with the correct paths and works fine.
> This is an issue for Qt because it tries to determine the library
> locations using dladdr and this leads to incorrect paths that in my
> case broke QtWebEngine.

This is good explanation in general. It would be good to explain a bit
on how QT uses the native version of QT to manipulate paths
for QTWebengine.

> >
> > Ross
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192429): https://lists.openembedded.org/g/openembedde=
d-core/message/192429
> Mute This Topic: https://lists.openembedded.org/mt/103009101/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

