Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFCCC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 18:51:42 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.61073.1742237496451821224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 11:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jiw+V/Am;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f6eaa017d0so3411054b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 11:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742237496; x=1742842296; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUzqUlHP+1K+ZKkNG65RoIJtV06rNYY/6Shbkd+61pA=;
        b=jiw+V/AmZYtK+g10YkOFOBiysMdIH9duep19tPF/u9lpX6aLLhBaV/jIWE/zQb/vi4
         T2lhJ3U+w4txHsagYTE6+NuWW62yLeBebmhSIVSci7segx3VOugBvkgE5TsI0oyeZPNn
         ZHpuePX0MoP9H/bg2rqRAXMr32M/s/SlWhqi41SqrInWZh9IbZd243QKV9ZoQChmI3vT
         JNYhvWqUvjA8o9+9zeAfOK/0ZJkPHJVxQreBEOCAcynWspJR1ShBXrK4+xZYWOwLQCZ6
         GSYOxam3mwhKsuy02cVslO9v7Ej0NlgjvrSBfVBInuWduvWqbckFHH5aXTEYimNNvE/+
         Ljog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742237496; x=1742842296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUzqUlHP+1K+ZKkNG65RoIJtV06rNYY/6Shbkd+61pA=;
        b=Gaj4x9/zgwOSVvoxP7zPF5w+nvP1ryvkTvMZqibk194C4FoZn3tY+/BeSfLWMeOFC0
         PMop7idv5BSKEwJRn4wOh4h2GtBD2mLVehPj7D/d9iaCjL3Nm8IreglTiUN0m+17RzSE
         sX+NRZaO3vQNj/ZQNesA5xthzMZj/x/+46Ks30d6hSTT2l57YiLFw5x7K8+7wWK/nJ5X
         K51v6HJrApBAIRlhUMqa2vdTFvd/q/4lvhbc9Q0BUZPaFvro/4jpdfZFMktWQZs6hPJ1
         d53d/i2XhzV0XacNDXFNkLFe0Gt1NuuW0fOKiXjvV9LvxcnRCfEe77CWfJ7J8RxoVUSX
         2+YQ==
X-Gm-Message-State: AOJu0YxxFYt1hYRJFt30Qadu9fUnVJaUxhjMQwdXMZYVHMf3J6VjdeNs
	EX57uKxOgDuv+7sVm29wFhhJvW9jZq/4V8EFZkAh/DWw3E0IX0Rx4Jyk6TgFeZL7M6IctozweHU
	D7v7jsaF3YM2jVzgdPChkeizq8Ag=
X-Gm-Gg: ASbGncuKLIkdF4R70nwsg831aMB9eU15KyCd1wusykycfODUV5vtdvmrN8GM9kr1qdv
	vsCby6sokaobbuXHdloUHEXWs79ZRZhQGdLyJTFDpRGypG7ykbjzqPK9RltshR2s9zojBWeL9RK
	zdg1/cehf6YAr5+NruSK47IBdHMEIYbxJ9fHR9UOzESdQwBrLiF6sBXE4=
X-Google-Smtp-Source: AGHT+IG0oPOx7YEHm+ivPheO5DsmT06UdJuI7HHMNQRTDsp2PcOcilw06QjZembsoZP0XMrDkdeCcdlbyhwL1gNZ6co=
X-Received: by 2002:a05:6808:1528:b0:3f6:ea63:6a6d with SMTP id
 5614622812f47-3fdeefecf73mr8141771b6e.22.1742237495600; Mon, 17 Mar 2025
 11:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250317132749.1778185-1-ross.burton@arm.com>
In-Reply-To: <20250317132749.1778185-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Mar 2025 11:51:08 -0700
X-Gm-Features: AQ5f1Jpwi0f6UurAB9WCDW0VM3dQDuNhQMT0GLRRVbQAadcrvf7Dp-YbF2iRU4I
Message-ID: <CAMKF1sqxXdP502kkhpki4-xxVR3c7z18+bTAPDmrpsm_5t-d_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] mdadm: don't inherit autotools
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 18:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213124

On Mon, Mar 17, 2025 at 6:27=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> mdadm doesn't use autotools at all:
> - do_configure does nothing as it can't find configure.ac or configure
> - do_compile is overridden to pass SYSROOT
> - do_install is overridden but still calls autotools_do_install (which
>   is just 'make install DESTDIR=3D$D') and then appended.
>
> Clean this up by passing SYSROOT and STRIP in EXTRA_OEMAKE, removing the
> now-obsolete do_compile(), and merging the do_install()s.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-extended/mdadm/mdadm_4.3.bb | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
>
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.3.bb b/meta/recipes-exte=
nded/mdadm/mdadm_4.3.bb
> index 63c61b68c96..d90497d5a74 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.3.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.3.bb
> @@ -28,7 +28,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/raid/mdadm=
/${BPN}-${PV}.tar.xz \
>
>  SRC_URI[sha256sum] =3D "416727ae1f1080ea6e3090cea36dd076826fc369151e36ab=
736557ba92196f9f"
>
> -inherit autotools-brokensep ptest systemd
> +inherit ptest systemd
>
>  DEPENDS =3D "udev"
>
> @@ -44,30 +44,19 @@ CFLAGS:append:mipsarchn64 =3D ' -D__SANE_USERSPACE_TY=
PES__'
>  CFLAGS:append:mipsarchn32 =3D ' -D__SANE_USERSPACE_TYPES__'
>
>  EXTRA_OEMAKE =3D 'CHECK_RUN_DIR=3D0 CXFLAGS=3D"${CFLAGS}" SYSTEMD_DIR=3D=
${systemd_system_unitdir} \
> -                BINDIR=3D"${base_sbindir}" UDEVDIR=3D"${nonarch_base_lib=
dir}/udev" LDFLAGS=3D"${LDFLAGS}"'
> +                BINDIR=3D"${base_sbindir}" UDEVDIR=3D"${nonarch_base_lib=
dir}/udev" LDFLAGS=3D"${LDFLAGS}" \
> +                SYSROOT=3D"${STAGING_DIR_TARGET}" STRIP=3D'

STRIP here is not pointing to tool called strip here right ? perhaps
some install -s mumbo jumbo

>
>  DEBUG_OPTIMIZATION:append =3D " -Wno-error"
>
> -do_compile() {
> -       oe_runmake SYSROOT=3D"${STAGING_DIR_TARGET}"
> -}
> -
>  do_install() {
> -       export STRIP=3D""
> -       autotools_do_install
> -}
> -
> -do_install:append() {
> +        oe_runmake 'DESTDIR=3D${D}' install install-systemd
>          install -d ${D}/${sysconfdir}/
>          install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.c=
onf
>          install -d ${D}/${sysconfdir}/init.d
>          install -m 755 ${UNPACKDIR}/mdadm.init ${D}${sysconfdir}/init.d/=
mdmonitor
>  }
>
> -do_install:append() {
> -        oe_runmake install-systemd DESTDIR=3D${D}
> -}
> -
>  do_compile_ptest() {
>         oe_runmake test
>  }
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213093): https://lists.openembedded.org/g/openembedde=
d-core/message/213093
> Mute This Topic: https://lists.openembedded.org/mt/111749081/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

