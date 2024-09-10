Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BB7ECE582
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 08:37:21 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.18255.1725957433486222737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 01:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KOxVTr6y;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so6341932e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 01:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725957432; x=1726562232; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqykeyF0w+NZ0o5snqnt5/OJ07gXRVpb8lbn8Gw73IY=;
        b=KOxVTr6yMoHTUxD5/ogTL5FxmbKS2jutBGO0NMbELFEPoCOP/RVZHDSuQTF07bGzKG
         HogcifiRnTCKDjnaYx0AoKlCc5F25K+jp/zxjoP2ObHFKeCpy2j7KKSDG/iHdcIC9GLT
         kWwo3kqxW2PfSs2CARqFLkQ9nTTNbhVmo5YLHtyiJHLLWTBh+H74K5Jlbnp5WiZQ0TrB
         sPf/8q6KCUCr0i7PH/Sd+0PG6nsgRaArPJ5QYHZguEQJvoKxJkxpyhpq9ycO5Vqqhi7t
         0wJn769UhC2+XiYtHa+xIF8W8zfqZbYFwAd/C9VLIiKRvKcQXtP3S+WWNRUQRnmoI354
         XEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725957432; x=1726562232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqykeyF0w+NZ0o5snqnt5/OJ07gXRVpb8lbn8Gw73IY=;
        b=ARc3ySf+P7JOkkN3RrCyD4sPvZcJ4yRhiJl1ijw1kqqVdT8DbOnGbrK9rZ9Eu3jJgn
         4Tamj+1wIfnRc1Epw5MuqzlE3cpBjaBZdB8h4vd33YA1WEbknfoqv1Tm8oivvbW4+wri
         a/EScBgaelrSPrWGcXS89kKoMZ1dYeWiVvTepAuvUtkja3ZPs+5dqYswVplEU5B9vGyc
         IZ92fFkSqiHVKY+Po4ckmbkUTkSszVU3w0V8yGBGKDd+C7sAxwD8g0YBAQ9V9cAgiruf
         OqG2dOpiLW8uZH5RzPun72RIztUTFEkechlYD2kml5Q2vKKfl1pjRfCve6Cm3s0LOuEC
         ya7w==
X-Gm-Message-State: AOJu0YwFi+S3HGgBobTrfgPyyPTeV28Dg/w1barPN+sLvRqY11dl/6QA
	nrV201SF2WEiieQYkpxm0G3iGKlGUB4dEJSfAaGw7V9VWTo1kU2autZbwt/S/4VRIm694rfHfr/
	/mksRk7NgAhvbCmyqUiUAHNka1vw=
X-Google-Smtp-Source: AGHT+IF/d+HSV7DCOglSIta4RNCPdBHLOt88Dp5f1xon6P3Ziu3XtWMoHB4NosldWxE4cNDB06IIR70F3E8UokLEVAo=
X-Received: by 2002:a05:6512:2514:b0:536:5827:8778 with SMTP id
 2adb3069b0e04-536588130d9mr9585324e87.53.1725957431340; Tue, 10 Sep 2024
 01:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240910072006.3938401-1-ejo@pengutronix.de> <20240910072006.3938401-3-ejo@pengutronix.de>
In-Reply-To: <20240910072006.3938401-3-ejo@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Sep 2024 10:37:00 +0200
Message-ID: <CANNYZj_zpBOjperL-mxO+D5rEM768Sed8VFohUkTJbnR6piDNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/7] barebox-tools: add initial barebox tools support
To: ejo@pengutronix.de
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 08:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204340

Can this be merged into the main barebox recipe? Does it need a separate re=
cipe?


Alex

On Tue, 10 Sept 2024 at 09:21, Enrico J=C3=B6rns via lists.openembedded.org
<ejo=3Dpengutronix.de@lists.openembedded.org> wrote:
>
> From: Marco Felsch <m.felsch@pengutronix.de>
>
> Add initial support to build the barebox tools for the host and the
> target.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../barebox/barebox-tools_2024.08.0.bb        | 58 +++++++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 1b3d485e48..067c4af096 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -55,6 +55,7 @@ RECIPE_MAINTAINER:pn-avahi =3D "Yi Zhao <yi.zhao@windri=
ver.com>"
>  RECIPE_MAINTAINER:pn-babeltrace =3D "Alexander Kanavin <alex.kanavin@gma=
il.com>"
>  RECIPE_MAINTAINER:pn-babeltrace2 =3D "Alexander Kanavin <alex.kanavin@gm=
ail.com>"
>  RECIPE_MAINTAINER:pn-barebox =3D "Enrico J=C3=B6rns <yocto@pengutronix.d=
e>"
> +RECIPE_MAINTAINER:pn-barebox-tools =3D "Enrico J=C3=B6rns <yocto@pengutr=
onix.de>"
>  RECIPE_MAINTAINER:pn-baremetal-helloworld =3D "Alejandro Hernandez <alej=
andro@enedino.org>"
>  RECIPE_MAINTAINER:pn-base-files =3D "Anuj Mittal <anuj.mittal@intel.com>=
"
>  RECIPE_MAINTAINER:pn-base-passwd =3D "Anuj Mittal <anuj.mittal@intel.com=
>"
> diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb b/meta/r=
ecipes-bsp/barebox/barebox-tools_2024.08.0.bb
> new file mode 100644
> index 0000000000..25f4998d4a
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb
> @@ -0,0 +1,58 @@
> +SUMMARY =3D "barebox bootloader tools"
> +HOMEPAGE =3D "https://barebox.org/"
> +
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000b9ca1f0d3364286c4=
192"
> +
> +DEPENDS =3D "libusb1 bison-native flex-native"
> +
> +SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
> +SRC_URI[sha256sum] =3D "b08a762da8d63dd18b4f2d9f5d0a8da001b6e608d1b3eff6=
dcebc6a2e575d535"
> +
> +S =3D "${WORKDIR}/barebox-${PV}"
> +B =3D "${WORKDIR}/build"
> +
> +inherit pkgconfig
> +
> +EXTRA_OEMAKE =3D " \
> +  ARCH=3Dsandbox \
> +  CROSS_COMPILE=3D${TARGET_PREFIX} -C ${S} O=3D${B} \
> +  CROSS_PKG_CONFIG=3Dpkg-config \
> +  CC=3D'${CC}' \
> +  LD=3D'${LD}' \
> +  "
> +
> +do_compile:class-target () {
> +    export userccflags=3D"${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +    export userldflags=3D"${TARGET_LDFLAGS}${TOOLCHAIN_OPTIONS}"
> +    oe_runmake targettools_defconfig
> +    oe_runmake scripts
> +}
> +
> +do_compile:class-native () {
> +    oe_runmake hosttools_defconfig
> +    oe_runmake scripts
> +}
> +
> +BAREBOX_TOOLS =3D " \
> +         bareboxenv \
> +         bareboxcrc32 \
> +         kernel-install \
> +         bareboximd \
> +         omap3-usb-loader \
> +         omap4_usbboot \
> +         imx/imx-usb-loader \
> +         "
> +
> +BAREBOX_TOOLS_SUFFIX =3D ""
> +BAREBOX_TOOLS_SUFFIX:class-target =3D "-target"
> +
> +do_install () {
> +       install -d ${D}${bindir}
> +
> +       for tool in ${BAREBOX_TOOLS}; do
> +               install -m 0755 scripts/${tool}${BAREBOX_TOOLS_SUFFIX} ${=
D}${bindir}/${tool##*/}
> +       done
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204337): https://lists.openembedded.org/g/openembedde=
d-core/message/204337
> Mute This Topic: https://lists.openembedded.org/mt/108370664/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

