Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E33C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 16:56:01 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.59381.1699289756359251596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 08:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gmeNvkLg;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1f084cb8b54so2060645fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 08:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699289755; x=1699894555; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxwmRKpsnW0Q/J7Gy88xJ8YWA7xoIn0+TFa1HjcIK0Q=;
        b=gmeNvkLgGCufYC1QpGvJng5m46MrFbWEM/u1KaT6RItXGwSB2Pd41cVnVyi87WDCx4
         qDG6U/2zYCmA7vewDbL4ygeCE/1crJFXitYqSlZLhZ0XrZvO35SfcfPdJIqAn+xGwmTk
         qCt8YXXrgsVS4nrxXDdKgdqo6FMLVsm4Wd3rVlXggj5DuornjW7zk6RMJgndPJ7VV58Q
         I9V3MDoXXHj/9j4Q6cfeFmiJHUvbzSvaE7yhHsHGlRjyYlE08t/Jxqo5sJMljxwfAdwk
         mpOm+K0X3cP454rRihva58+U28F40yvxhw6jsYM7FdacZetIGkv1rXFuLRWKfPkw7avB
         SZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699289755; x=1699894555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxwmRKpsnW0Q/J7Gy88xJ8YWA7xoIn0+TFa1HjcIK0Q=;
        b=jrU3a1VyrI0liNiYpVOvNox0SdbQiansH5Qa65WJPHC/4sACltIIKLWUBu/2wxbkNF
         gwTwnGL+9KmbLEpNoCinFCXx72xgtpViSQQBe9J/TJkrFWlp0fIGGiSGdo9D1rfp7xiu
         gN8hRAQsf1LNQlCsk4s1sjrY4et1nAfW/kSVStIivjnhR8hsaiSfgrW7TPomLVdmI7ko
         JxO0zxZ3yp21fjgfPLoDWUh1VwQUUfLNPiIIxGBE7qZdKMQZeKaWEeQd5bXvdF6z77bm
         /4m094Okgx3PGYJT1C/DIJODHT+N4r6BTI1aGWUeCdODaZWzMtgm89AT9FXfY3bbc4Iq
         dpCg==
X-Gm-Message-State: AOJu0Yz0MN0VNjnDlsnPX2idvo7Nqo/VxAhG00qISNyZu8hs87AUBnUZ
	1eqmo53A0QnSXjcdmYBOSBSqUplC2kLoxL+w1MG+R77vJNc=
X-Google-Smtp-Source: AGHT+IFy/BszNuuQO1B0pnrRb8umSvd3VJohL6YMC4/Ws41uAbYTDL4Gr2mJm6CTeE/h1TVd+gGGMq3gRJQZ7dAGsBk=
X-Received: by 2002:a05:6870:b6a6:b0:1eb:7a0b:9dcc with SMTP id
 cy38-20020a056870b6a600b001eb7a0b9dccmr283356oab.5.1699289755435; Mon, 06 Nov
 2023 08:55:55 -0800 (PST)
MIME-Version: 1.0
References: <20231103145037.2365572-1-fw@ferncast.de>
In-Reply-To: <20231103145037.2365572-1-fw@ferncast.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Nov 2023 08:55:29 -0800
Message-ID: <CAMKF1so5QoDnAKb6hM6DCyphj9VbTZ6qc6CQrHW_5GLbz20FNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: fix libnss-mymachines packaging
To: Florian Wickert <fw@ferncast.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 16:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190238

On Fri, Nov 3, 2023 at 7:51=E2=80=AFAM Florian Wickert <fw@ferncast.de> wro=
te:
>
> By removing libnss_mymachines.so.2 from FILES:${PN}-container it
> correctly gets packaged into libnss-mymachines, just like the other
> libnss-* components, due to PACKAGES_DYNAMIC.
>
> To make up for the missing lib in the container package, I added
> libnss-mymachines to RDEPENDS:${PN}-container. As I understand it,
> the lib should be installed even without this if anything from the
> container package links against it. But since I don't know if there
> was a special reason to explicitly add it to the container files list,
> like something using dlopen to load the lib, it seemd to be the
> safest option.
>
> Signed-off-by: Florian Wickert <fw@ferncast.de>
> ---
>  meta/recipes-core/systemd/systemd_254.4.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-co=
re/systemd/systemd_254.4.bb
> index ef29116bf9..ddc8a0219a 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> @@ -534,7 +534,6 @@ FILES:${PN}-container =3D "${sysconfdir}/dbus-1/syste=
m.d/org.freedesktop.import1.c
>                           ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.co=
nf \
>                           ${exec_prefix}/lib/tmpfiles.d/README \
>                           ${systemd_system_unitdir}/systemd-nspawn@.servi=
ce \
> -                         ${libdir}/libnss_mymachines.so.2 \
>                           ${datadir}/dbus-1/system-services/org.freedeskt=
op.import1.service \
>                           ${datadir}/dbus-1/system-services/org.freedeskt=
op.machine1.service \
>                           ${datadir}/dbus-1/system.d/org.freedesktop.impo=
rt1.conf \
> @@ -543,6 +542,8 @@ FILES:${PN}-container =3D "${sysconfdir}/dbus-1/syste=
m.d/org.freedesktop.import1.c
>                           ${datadir}/polkit-1/actions/org.freedesktop.mac=
hine1.policy \
>                          "
>
> +RDEPENDS:${PN}-container =3D "libnss-mymachines"

musl based targets do not build libnss-mymachines so please make this
dependency only for glibc


> +
>  # "machinectl import-tar" uses "tar --numeric-owner", not supported by b=
usybox.
>  RRECOMMENDS:${PN}-container +=3D "\
>                           ${PN}-journal-gatewayd \
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190164): https://lists.openembedded.org/g/openembedde=
d-core/message/190164
> Mute This Topic: https://lists.openembedded.org/mt/102365438/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

