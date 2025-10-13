Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA05CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 18:24:21 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.52178.1760379860609627992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 11:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FGPejntd;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71d60501806so45651467b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760379860; x=1760984660; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFIEQJ3CZfeU/KVMK7azrqcHy2FV8gXkMiKg2wpF9FM=;
        b=FGPejntdXveuTxGzuaZVqsJKWTPMq4apjszoxxj0genmIp8xMw+SwzFXUiA70e9ePl
         hrhdpHdUcV0TDkiRBLhZBToWUOe5yZQJmGqicXVITQiNMQGy8xo5XYIN93nYYDkafhyr
         14bo5ojCuhHgC4QQtVultD3snFp6VDoFJdfXo/suI1Z+oUjwKedmz0RYoJQR1iNgKpN0
         C4DlW95DiK+wPlelrRi6sC+mCPsfJEBgyYV9QGh9m7yS+LGUm95Onzpq7rHTdh2IqrBr
         bjBdddT4xoEtJoflVVy9SKIWP55ix6OWXN1JW6UurfiCbaPSzfiCwCKza++yJpUifzD1
         R+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760379860; x=1760984660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFIEQJ3CZfeU/KVMK7azrqcHy2FV8gXkMiKg2wpF9FM=;
        b=HKoNOE2XR2mXbc8XBV0pd1HmX08RBRqCZgBQYi9ZeOPAN1khdP1jLmcLGAhiQs2FHN
         ZXxajyVa9VJtmDJWM3VbpsfF7bbpdIsaPpP5P6u4swAbf0bRqgo0Selc1MLXdyPTvy3X
         S3zmE86cQdkQWLbgYpqhKBwJ+dP5HVs6dBhcUKSCqbr0erLV6XKj6BwyIfoMznomnINm
         Wul1Js+wHTrU5a0Ws2eV3oDvSbITQM80YqZikKGHiR6oTPqya9VkvxluqN4zFzhYVp0h
         gCwAs4XKELt6JtzXDXb7LPsvWGerC/MhpJRGFE73d3IA5aS+qQTGUwuPRyU8opOU9ssF
         i14g==
X-Gm-Message-State: AOJu0Yzu+fnR5oVHKhBm6+1jbxRLGtnBgEu2SxBBma/rfTA9BXdOxSa4
	SSxlE4QVtGvFCwpxPje3Krivzo8yz817KB20REnrdGAhK+GLHHFnxL97cGvcoGcJblph2XJKFyS
	x6m+jF/362RgV6egOiDbfW7Ko+tO20Sc=
X-Gm-Gg: ASbGnctIC+qQ24KxdTSKYgDOmq0uMQvilvo49OwfJPXwU6RiEr9aqr0kAqNTFZlhH0Y
	DwMnCAkMGl4732ZXfq4aJDHUJbl2yDRwm3PsJi+3b2dpCBcgtuvtFnrfZpIbuMQ+PMNNx6L0DZ8
	g7W4exQQPvCApENTQ7ZnOMzCQPdf5swzHSB1McSJzMVrviKITOIPyCHVCHT15g8MfvWU8TEJ2Uf
	7AO58GMOetPtZqo3TQ9K1s2z/QzHIj5Psuw/ZA2VS5QnkoobOZE0ZAFPTEhBUys9A==
X-Google-Smtp-Source: AGHT+IEREIhJ5KV4y4qG87u5ah2cyW/cwfglty8PF3hKR9l2kdzpE6ekyafIos9a7BJsylr6j0i9R5o1oBKm1nUInag=
X-Received: by 2002:a05:690e:150e:b0:63c:f5a7:3cc with SMTP id
 956f58d0204a3-63cf5a70d6fmr8121795d50.56.1760379859540; Mon, 13 Oct 2025
 11:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251013124515.2362058-1-ross.burton@arm.com> <20251013124515.2362058-2-ross.burton@arm.com>
In-Reply-To: <20251013124515.2362058-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Oct 2025 11:23:51 -0700
X-Gm-Features: AS18NWDzeyfegTpdhVLL85pVQ3Gq26Yr5runoZolA2J3vCr8qs5SEbQkiCjApnU
Message-ID: <CAMKF1sobt0UNtqurghzrAmVSG2Yu8twXRH1-roim6pGJ-fj1zg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glibc: only install nscd if it's been enabled
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 18:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224793

On Mon, Oct 13, 2025 at 5:45=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> Whilst the actual nscd binary won't be installed if the PACKAGECONFIG is
> disabled, we were still installing the init scripts and configuration
> files.  These should be wrapped with PACKAGECONFIG checks.
>
> ${localstatedir}/db and makedbs.sh are part of libnss-db not nscd, so
> ensure they're still always installed.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 41 +++++++++++++----------
>  1 file changed, 23 insertions(+), 18 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
> index d4941a21a10..3d721d8f69f 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -98,16 +98,20 @@ do_install() {
>                 rm -f ${D}${infodir}/dir
>         fi
>
> -       install -d ${D}${sysconfdir}/init.d
> -       install -d ${D}${localstatedir}/db/nscd
> -       install -m 0755 ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
> -       install -m 0755 ${S}/nscd/nscd.conf ${D}${sysconfdir}/nscd.conf
> +       install -d ${D}${localstatedir}/db
>         install -m 0755 ${UNPACKDIR}/makedbs.sh ${D}${localstatedir}/db
> -       sed -i "s%daemon%start-stop-daemon --start --exec%g" ${D}${syscon=
fdir}/init.d/nscd
> -       sed -i "s|\(enable-cache\t\+netgroup\t\+\)yes|\1no|" ${D}${syscon=
fdir}/nscd.conf
>
> -       install -d ${D}${systemd_system_unitdir}
> -       install -m 0644 ${S}/nscd/nscd.service ${D}${systemd_system_unitd=
ir}/
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'nscd', 'true', 'false',=
 d)}; then

should it check for initsystem type as well before doing the following
operations I wonder

> +               install -d ${D}${sysconfdir}/init.d
> +               install -d ${D}${localstatedir}/db/nscd
> +               install -m 0755 ${S}/nscd/nscd.init ${D}${sysconfdir}/ini=
t.d/nscd
> +               install -m 0755 ${S}/nscd/nscd.conf ${D}${sysconfdir}/nsc=
d.conf
> +               sed -i "s%daemon%start-stop-daemon --start --exec%g" ${D}=
${sysconfdir}/init.d/nscd
> +               sed -i "s|\(enable-cache\t\+netgroup\t\+\)yes|\1no|" ${D}=
${sysconfdir}/nscd.conf
> +
> +               install -d ${D}${systemd_system_unitdir}
> +               install -m 0644 ${S}/nscd/nscd.service ${D}${systemd_syst=
em_unitdir}/
> +       fi
>
>         # The dynamic loader will have been installed into
>         # ${base_libdir}. However, if that isn't going to end up being
> @@ -132,18 +136,19 @@ def get_libc_fpu_setting(bb, d):
>      return ""
>
>  do_install:append:class-target() {
> -       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fa=
lse', d)}; then
> -               install -d ${D}${nonarch_libdir}/tmpfiles.d
> -               echo "d /run/nscd 755 root root -" \
> -                       > ${D}${nonarch_libdir}/tmpfiles.d/nscd.conf
> -       fi
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'nscd', 'true', 'false',=
 d)}; then
> +               if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'tr=
ue', 'false', d)}; then
> +                       install -d ${D}${nonarch_libdir}/tmpfiles.d
> +                       echo "d /run/nscd 755 root root -" \
> +                               > ${D}${nonarch_libdir}/tmpfiles.d/nscd.c=
onf
> +               fi
>
> -       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'f=
alse', d)}; then
> -               install -d ${D}${sysconfdir}/default/volatiles
> -               echo "d root root 0755 /var/run/nscd none" \
> -                       > ${D}${sysconfdir}/default/volatiles/98_nscd
> +               if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 't=
rue', 'false', d)}; then
> +                       install -d ${D}${sysconfdir}/default/volatiles
> +                       echo "d root root 0755 /var/run/nscd none" \
> +                               > ${D}${sysconfdir}/default/volatiles/98_=
nscd
> +               fi
>         fi
> -
>  }
>  do_install:append:aarch64 () {
>         do_install_armmultilib
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224781): https://lists.openembedded.org/g/openembedde=
d-core/message/224781
> Mute This Topic: https://lists.openembedded.org/mt/115733355/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

