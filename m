Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37E7C5ACB3
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 16:25:34 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.11423.1700324732162829188
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Nov 2023 08:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KdODBD0O;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-58a0154b4baso1996549eaf.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Nov 2023 08:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700324731; x=1700929531; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEsaOQWk+i9+sJ7cxfC+gRfxzqxd2FR3Kg1o9EkGueY=;
        b=KdODBD0OcvRLwmve92A10+XZWFKrge0UucWksFGlumvQ52rXQU2opT/Y/UNKE7s7Ex
         xjbAYQjHNXSn0VqaOF20pJ96RmDvhPZcXL5gDeZ18P6Uw/wEZUW7/H3oNAjG6OibihzD
         e0xwyJWKuqcWbGQDdoTD0FrmPXo9qt8DBOupRVBpK490mTcvoZXM4TNzU+spcgshNWfm
         ni8epDcXhEQrwLaliLWZSYizSVMxnyQuNOzbtcDyX2KzauT6sbI4DoJA9esIznh9Ve4u
         NLZgfToy0enWHxOwjlx/icMn+piX0DSVykQzMk/Nnj13AcAlwZ1xmMF3gKJyxId93+Z9
         c06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700324731; x=1700929531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEsaOQWk+i9+sJ7cxfC+gRfxzqxd2FR3Kg1o9EkGueY=;
        b=JIGDhFizquGdRdQJ82N1GNEeRYh01vaizT8R49Z3NyI2ju4v7VF83Y8dLITSAYCozM
         PmQRtB0w0QVhUIJ7bLPQWfff9cQycp4vwPC7xjyZYEPKBt6muMR3vS85MYDJq58fTrw/
         3JadCeqN05++D8c6dWGc6rSaEsHskt6utPblgzS6Sfhgytrrn8zU9CPKbM289k0JVryS
         g7G8ZuK6TD1EcIRvi7e5wkcQsB9aqPwBTpbKT7XjsgR1pCPQy6NDFzvvuxDc4sFddmtk
         rRbCgVpb9QOVV0kryN7PpZIiqeTghkPqePECoayOuUBRsZbi/DXUIqu8sivrUH5jiIKZ
         IzQw==
X-Gm-Message-State: AOJu0Yz/xMObFgOKyRurkj89qTngcAhQtKjWxvV6FOswrPTKv7UmJ0Kf
	1pfzHkEP6k30OpL0pl7rHrwl1TZbQDa5Fe1/MRQ=
X-Google-Smtp-Source: AGHT+IGOwUWdKfzicYflrx6R/7TMJmqKgsyNKD39/k7tfFoVh3dy8eNkyeGYttvnUzU5j35b8ZU2MzqRNoSG94RuiDI=
X-Received: by 2002:a05:6870:d62b:b0:1f4:daf6:7918 with SMTP id
 a43-20020a056870d62b00b001f4daf67918mr1139410oaq.26.1700324731194; Sat, 18
 Nov 2023 08:25:31 -0800 (PST)
MIME-Version: 1.0
References: <20231116115457.1462082-1-lukas.funke-oss@weidmueller.com> <20231116115457.1462082-5-lukas.funke-oss@weidmueller.com>
In-Reply-To: <20231116115457.1462082-5-lukas.funke-oss@weidmueller.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Nov 2023 08:25:05 -0800
Message-ID: <CAMKF1sr7O6xDzUaOrJuhCwMtmR0zXKtD-z_Xhnth-yBwLi6adg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2 4/4] glibc: use nonarch libdir for tmpfiles.d
To: Lukas Funke <lukas.funke-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <quaresma.jose@gmail.com>, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>, 
	Lukas Funke <lukas.funke@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Nov 2023 16:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190864

I am still seeing

ERROR: glibc-2.38+git-r0 do_package: QA Issue: glibc:
Files/directories were installed but not shipped in any package:
  /etc/tmpfiles.d
  /etc/tmpfiles.d/nscd.conf


         Please set FILES such that these items are packaged.
Alternatively if they are unneeded, avoid installing them or delete
them within do_install.

On Thu, Nov 16, 2023 at 3:55=E2=80=AFAM Lukas Funke
<lukas.funke-oss@weidmueller.com> wrote:
>
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> The documentation of systemd states that /etc/tmpfiles.d should be
> reserved for the local administrator and packages should put their files
> in /usr/lib/tmpfiles.d [1].
>
> [1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html
>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller=
.com>
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
> index 1d4e4c5274..1ef987be0a 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -42,7 +42,7 @@ FILES_SOLIBSDEV =3D "${libdir}/lib*${SOLIBSDEV}"
>  FILES:${PN}-dev +=3D "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}=
/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_nons=
hared.a ${base_libdir}/*.o ${datadir}/aclocal"
>  RDEPENDS:${PN}-dev =3D "linux-libc-headers-dev"
>  FILES:${PN}-staticdev +=3D "${libdir}/*.a ${base_libdir}/*.a"
> -FILES:nscd =3D "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_sys=
tem_unitdir}/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
> +FILES:nscd =3D "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_sys=
tem_unitdir}/nscd* ${nonarch_libdir}/tmpfiles.d/nscd.conf \
>                ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98=
_nscd ${localstatedir}/db/nscd"
>  FILES:${PN}-mtrace =3D "${bindir}/mtrace"
>  FILES:tzcode =3D "${bindir}/tzselect ${sbindir}/zic ${bindir}/zdump"
> @@ -132,9 +132,9 @@ def get_libc_fpu_setting(bb, d):
>
>  do_install:append:class-target() {
>         if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fa=
lse', d)}; then
> -               install -d ${D}${sysconfdir}/tmpfiles.d
> +               install -d ${D}${nonarch_libdir}/tmpfiles.d
>                 echo "d /run/nscd 755 root root -" \
> -                       > ${D}${sysconfdir}/tmpfiles.d/nscd.conf
> +                       > ${D}${nonarch_libdir}/tmpfiles.d/nscd.conf
>         fi
>
>         if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'f=
alse', d)}; then
> @@ -280,7 +280,7 @@ python populate_packages:prepend () {
>  pkg_postinst:nscd () {
>         if [ -z "$D" ]; then
>                 if command -v systemd-tmpfiles >/dev/null; then
> -                       systemd-tmpfiles --create ${sysconfdir}/tmpfiles.=
d/nscd.conf
> +                       systemd-tmpfiles --create ${nonarch_libdir}/tmpfi=
les.d/nscd.conf
>                 elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; th=
en
>                         ${sysconfdir}/init.d/populate-volatile.sh update
>                 fi
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190789): https://lists.openembedded.org/g/openembedde=
d-core/message/190789
> Mute This Topic: https://lists.openembedded.org/mt/102625108/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

