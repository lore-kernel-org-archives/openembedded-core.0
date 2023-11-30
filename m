Return-Path: <h4nn35.work@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAED5C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 12:35:42 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.71103.1701347737104503842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 04:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=acMlQTc4;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: h4nn35.work@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d28f5bbd6cso8652367b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 04:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701347736; x=1701952536; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoM95YT1JUWrZgHf5Rw0Gf+74r0DCNiSct9t37Yy4C8=;
        b=acMlQTc4hhTxIQw86N6OtuLzaY27FWWv5zwK43kqb0aGy8jNK+h+/MDOnXWQ6kxpWk
         kZauEzA1xpTdTjGnvrynU+ljs/zOG7mWxaArdLirCDBBabP/CkWIESHS7eLK/gjgbZZd
         wZe2STdFPmGySzYOrViXoJ8z1mbRi01AVF4Pe2p6gINZGgseM1837bIwf9nUe2dftJ6n
         KoMUyD48fqURLuTPVIGyfHAMbVI0QrFIrn81lwNrEuqHEBdPZYyEGHl8+KSqX7Wb5/8D
         rFdI+GCiLZAtEjcwkSPuohpgeBNMaN7ikKPsxqyM3JSsZRp9GdkSG/uEMMa+ok7fsKpM
         cLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701347736; x=1701952536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoM95YT1JUWrZgHf5Rw0Gf+74r0DCNiSct9t37Yy4C8=;
        b=tnfSSbU85wp3e8+QWWewzynnkLKFbmwnge8xQB/FMgnJ1o71ZEX9B8p68VkaL40fTG
         oRxwVYgjTFiVLkN20ONETuLkg2F5xeuNTktD2Rm96ztfo3MAESV9Kk8lveMROse4Wyb8
         eIs4yHEHG+GDU2mP2STQzBXFySgVa7gwiRLO/RsSo+FOn/Wu2jI4TsY349uYqFoTtasc
         64HgC+U/wW4LpoE+jfytUvl2ty8k08KZ1AqiE84feD9eAeHyTEBu9xXsCvy9Q4EcbkHb
         grxx4hXdBlN9s8a3zhlI4DzFOlux0ow7n10dcbpj7RYvAXwCmGL6HnWiFXaT0PZGgSUs
         Iezw==
X-Gm-Message-State: AOJu0Yyc7NW8h+H7LU02WHSR7UtKJJOEsWyZym2aOic3Be7eBcUUS/Zo
	DCMnltKYwwROTO+ikzdG+wxHXuG3YEmHCE2elw==
X-Google-Smtp-Source: AGHT+IF/9c0lVWDB6f/wgGmPZOgqr2TprEsU5R0X9Dg1ke2VnWJh7Den0t455vNJhvhynQf7GhAAlomCUYw4EF8eRYg=
X-Received: by 2002:a25:f602:0:b0:d9a:6c74:49b with SMTP id
 t2-20020a25f602000000b00d9a6c74049bmr19591464ybd.2.1701347736300; Thu, 30 Nov
 2023 04:35:36 -0800 (PST)
MIME-Version: 1.0
References: <CAHvQdo1KaZ2S1srqjvyj=R0tVroUieExEXmfBpiEBq9J1RZxDQ@mail.gmail.com>
 <CAMKF1sqXJRha2wXUoMu_M9opLT2FCB+-36L9uvx-YDZRO3BQ7Q@mail.gmail.com> <CAHvQdo0ewRcxj=dznV+ChSBHFp_WpOe2-YRv3KZ9iR=OFQGEWQ@mail.gmail.com>
In-Reply-To: <CAHvQdo0ewRcxj=dznV+ChSBHFp_WpOe2-YRv3KZ9iR=OFQGEWQ@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Thu, 30 Nov 2023 13:35:25 +0100
Message-ID: <CAHvQdo2WX_07CF3yFGvZMa2Kjky_kQdY5JZnynkrbw=e+NVgxA@mail.gmail.com>
Subject: Re: rootfs.py generates wrong ld.so.cache in case of usrmerge distro feature
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191505

On Thu, Nov 30, 2023 at 10:45=E2=80=AFAM Johannes Pointner
<h4nn35.work@gmail.com> wrote:
>
> On Fri, Nov 24, 2023 at 6:03=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> >
> >
> > On Fri, Nov 24, 2023 at 2:34=E2=80=AFAM Johannes Pointner <h4nn35.work@=
gmail.com> wrote:
> >>
> >> Hello,
> >>
> >> I did recently my first Nanbield build which required the distro
> >> feature usrmerge because of using systemd and as a result QtWebEngine
> >> didn't work anymore.
> >> I reported this to Qt(https://bugreports.qt.io/browse/QTBUG-119140),
> >> but looking deeper into this it turned out to be an issue related to
> >> the generated ld.so.cache in the rootfs.py.
> >> At the moment in the ldconfig-native which is used to generate this,
> >> are the paths to LIBDIR("/usr/lib") and SLIBDIR("/lib") hardcoded, but
> >> that isn't correct if usrmerge is enabled, at least I think so.
> >> The resulting ld.so.cache looks like this:
> >> 236 libs found in cache `/etc/ld.so.cache'
> >>        libzstd.so.1 (libc6) =3D> /lib/libzstd.so.1
> >>        libz.so.1 (libc6) =3D> /lib/libz.so.1
> >>        libxtables.so.12 (libc6) =3D> /lib/libxtables.so.12
> >>        libxslt.so.1 (libc6) =3D> /lib/libxslt.so.1
> >>        libxml2.so.2 (libc6) =3D> /lib/libxml2.so.2
> >> ...
> >>
> >> Would it be OK to configure the paths LIBDIR SLIBDIR using base_libdir
> >> and libdir?
> >
> >
> > I think it should check for usrmerge feature and generate the correct v=
alues during build
> This is already done in bitbake.conf:
> root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',
> '${exec_prefix}', '${base_prefix}', d)}"
> Do you really think we should check again in ldconfig-native for
> usrmerge, can't we just do something like that:
>  Add in ldconfig.c:
> +#ifndef LIBDIR
> #define LIBDIR "/usr/lib"
> +#endif
> +#ifndef SLIBDIR
> #define SLIBDIR "/lib"
> +#endif
> and build it like this:
> do_compile () {
> $CC ldconfig.c -std=3Dgnu99 -DLIBDIR=3D\"${nonarch_libdir}\"
> -DSLIBDIR=3D\"${nonarch_base_libdir}\" chroot_canon.c xmalloc.c
> xstrdup.c cache.c readlib.c  -I. dl-cache.c -o ldconfig
> }
OK, after testing this I have seen that the paths are adjusted by the
native class so this won't work.
But another approach using something like this
LDCONFIG_SLIBIDR=3D${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',
'/usr/lib', '/lib', d)}
$CC ldconfig.c -std=3Dgnu99 -DSLIBDIR=3D\"${LDCONFIG_SLIBIDR}\"
chroot_canon.c xmalloc.c xstrdup.c cache.c readlib.c  -I. dl-cache.c
-o ldconfig
doesn't work either because usrmerge isn't in the DISTRO_FEATURES in
case of native, at least it seems so.
DISTRO_FEATURES_NATIVE:append =3D " usrmerge" fixes this but I have no
idea if this is the right approach.
> >
> >>
> >>
> >> Thanks,
> >> Hannes

