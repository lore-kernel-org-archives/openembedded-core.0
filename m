Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13489CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 10:54:21 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.14468.1757501659656859585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 03:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+O8o2EG;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-723c971b63bso50301306d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 03:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501659; x=1758106459; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZpW87c9mA0jeDl0tTS5mRvcsiL0yNEdmVzdyX+G62g=;
        b=T+O8o2EGNdT4lGG4eiCHfe0SndfGXwQ6F4TeIUzMBRsnlv2yx1b7C7FtLmtbwENYoe
         Queq8+RkAQbiwhftNSEnU8W6Z1QZSZVCTetp6iBHe3XAZvu502L90chdYGrfDWUrIQPY
         B3zujuXnGRo2f9yN19eGCQpEyQ17G3nJzNnOSdTqOHYIISR4rHjEtvO3xoeSx9CZq4s2
         yJIOQEjh8VK4zlwTCCFipPZ325476aLUieyeeB9eoVv8wsHR2Xo+5q4bjx7CTttv84QE
         FGexTsK6yNcYiOX5aJyLkpHNeki/Nr6ItpMQiFGtUZ87CwY6emwUMEwNvCZV+X5+Wu8p
         sD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501659; x=1758106459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZpW87c9mA0jeDl0tTS5mRvcsiL0yNEdmVzdyX+G62g=;
        b=OmbaRn5wfz9QekXlidheY7G1nWB+Y1/vTGRUqC0797WIeoFEwvXlOyV5OCK1MSHJ8R
         s1vDKzJFbuScryKKocQlaHOHzMO9qXLSY4qP/OCw64Aec6DmNEG9xm+6kOfXNdXJ06qN
         Hi0RoZD+Md9XSPonf7cwBBwFXoQ64H7wkGa5G/ieCynMV30hdJIszF3NeR/kN6PobK++
         um3+E7lt3xO3K/uerbWeTykkiuj3BmDNuWym7Ux8Mmt2IPC4E7nxl2mIq/48ZYDsVfJ1
         JBVVNG9S0i7TnLCO/CYRp6VKQZKn8qQEK9B6w5WD5goS9IZ54jland5E9dBjlMvU4Rg1
         lC7w==
X-Gm-Message-State: AOJu0Yz69Ap++PuaCFCZUtc17a47gZEJeA58JJrWKGGBLu1kRApV4vvW
	aUNnyOgi5XJc50/0CiX3ui9HjK4Q/4qfpI1eDg4PIn3NoJPj7POTl9KrEUSbZi4iVwXKQcX/CNL
	K8XfckGPBlDbPzWFiifClAawYoKodL60=
X-Gm-Gg: ASbGnctAhzJ+QydiAGUNwdAtG25A1egfuBZPgWk+lfUEQT0K2zXz5sihJ+EIizkX1/u
	qAVpuysctMtfVblWcOpSVtuvXhvGe9rMny6nKndXq6udaQpxagPGz0NPTRXp6jhpwmEtolxs3xU
	mwE4heD74zIqwAhexa7zOIjif8z/pfT2HK+8MMwNpC5uA7tfS/+3Tl6mXIwjm16JW+s6H8W/GSD
	RmQcfcyX9WhemAU7++T1JFlSktETIufUoLEI0cDWPhmeTMWAkzS7Jyz8HZMTQMN5iAIwao18hBy
	YA3g55807wB+pDIHx3XiZwQ4SU+cHld9aJ7oXZ9m
X-Google-Smtp-Source: AGHT+IE5t3nrkYn9rKPj4s+2Bn11G4osuTiwQ/mTNXKlHADpFcuxlyJJC4JWMORuWx8NKFWXNk2emHEUb5IwH12zvIY=
X-Received: by 2002:a05:6214:20c4:b0:71f:238c:1491 with SMTP id
 6a1803df08f44-739404112f7mr159932826d6.53.1757501658450; Wed, 10 Sep 2025
 03:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250910105053.315379-1-alex.kanavin@gmail.com> <1863E64593D699AF.18650@lists.openembedded.org>
In-Reply-To: <1863E64593D699AF.18650@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Sep 2025 12:54:07 +0200
X-Gm-Features: AS18NWDRnGwimeE77DIMb6tQTpn3Ro7TmXevCgZs9od8Oi-XsvLpPjWUMIkKJiA
Message-ID: <CANNYZj-KYoE8aJ+vGpXj82Dk9Ei_G2M_O8jE1pXOxNu+N=hUZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/6] maintainers.inc: unassign Anuj Mittal
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 10:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223199

Hello Anuj,

please see below; if you do not wish to be unassigned as the
maintainer of these recipes in openembedded-core, please speak up. But
it is expected that assigned maintainers update their recipes to
latest versions in a timely manner (which has not been happening).

Thanks,
Alex

On Wed, 10 Sept 2025 at 12:51, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> Same as previous unassignment: no activity for a very long time.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc | 212 +++++++++++------------
>  1 file changed, 106 insertions(+), 106 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 2dafade677d..f98009a1b33 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -44,7 +44,7 @@ RECIPE_MAINTAINER:pn-apr-util =3D "Hongxu Jia <hongxu.j=
ia@windriver.com>"
>  RECIPE_MAINTAINER:pn-apt =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-argp-standalone =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-asciidoc =3D "Yi Zhao <yi.zhao@windriver.com>"
> -RECIPE_MAINTAINER:pn-aspell =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-aspell =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-at =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-at-spi2-core =3D "Tim Orling <tim.orling@konsulko.c=
om>"
>  RECIPE_MAINTAINER:pn-attr =3D "Chen Qi <Qi.Chen@windriver.com>"
> @@ -57,11 +57,11 @@ RECIPE_MAINTAINER:pn-babeltrace2 =3D "Unassigned <una=
ssigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-barebox =3D "Enrico J=C3=B6rns <yocto@pengutronix.d=
e>"
>  RECIPE_MAINTAINER:pn-barebox-tools =3D "Enrico J=C3=B6rns <yocto@pengutr=
onix.de>"
>  RECIPE_MAINTAINER:pn-baremetal-helloworld =3D "Alejandro Hernandez <alej=
andro@enedino.org>"
> -RECIPE_MAINTAINER:pn-base-files =3D "Anuj Mittal <anuj.mittal@intel.com>=
"
> -RECIPE_MAINTAINER:pn-base-passwd =3D "Anuj Mittal <anuj.mittal@intel.com=
>"
> +RECIPE_MAINTAINER:pn-base-files =3D "Unassigned <unassigned@yoctoproject=
.org>"
> +RECIPE_MAINTAINER:pn-base-passwd =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
>  RECIPE_MAINTAINER:pn-bash =3D "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER:pn-bash-completion =3D "Unassigned <unassigned@yoctopr=
oject.org>"
> -RECIPE_MAINTAINER:pn-bc =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-bc =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-bind =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-bindgen-cli =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-binutils =3D "Khem Raj <raj.khem@gmail.com>"
> @@ -71,7 +71,7 @@ RECIPE_MAINTAINER:pn-binutils-testsuite =3D "Khem Raj <=
raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} =3D "Khem Raj <raj.khe=
m@gmail.com>"
>  RECIPE_MAINTAINER:pn-bison =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-blktrace =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> -RECIPE_MAINTAINER:pn-bluez5 =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-bluez5 =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-bmaptool =3D "Trevor Woerner <twoerner@gmail.com>"
>  RECIPE_MAINTAINER:pn-boost =3D "Unassigned <unassigned@yoctoproject.org>=
"
>  RECIPE_MAINTAINER:pn-boost-build-native =3D "Unassigned <unassigned@yoct=
oproject.org>"
> @@ -89,7 +89,7 @@ RECIPE_MAINTAINER:pn-busybox =3D "Andrej Valek <andrej.=
v@skyrain.eu>"
>  RECIPE_MAINTAINER:pn-busybox-inittab =3D "Denys Dmytriyenko <denis@denix=
.org>"
>  RECIPE_MAINTAINER:pn-bzip2 =3D "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-ca-certificates =3D "Unassigned <unassigned@yoctopr=
oject.org>"
> -RECIPE_MAINTAINER:pn-cairo =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-cairo =3D "Unassigned <unassigned@yoctoproject.org>=
"
>  RECIPE_MAINTAINER:pn-cargo =3D "Randy MacLeod <Randy.MacLeod@windriver.c=
om>"
>  RECIPE_MAINTAINER:pn-cargo-c =3D "Frederic Martinsons <frederic.martinso=
ns@gmail.com>"
>  RECIPE_MAINTAINER:pn-cantarell-fonts =3D "Unassigned <unassigned@yoctopr=
oject.org>"
> @@ -131,7 +131,7 @@ RECIPE_MAINTAINER:pn-coreutils =3D "Chen Qi <Qi.Chen@=
windriver.com>"
>  RECIPE_MAINTAINER:pn-cpio =3D "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-cracklib =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-createrepo-c =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
> -RECIPE_MAINTAINER:pn-cronie =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-cronie =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-cross-localedef-native =3D "Khem Raj <raj.khem@gmai=
l.com>"
>  RECIPE_MAINTAINER:pn-cryptodev-linux =3D "Robert Yang <liezhi.yang@windr=
iver.com>"
>  RECIPE_MAINTAINER:pn-cryptodev-module =3D "Robert Yang <liezhi.yang@wind=
river.com>"
> @@ -171,12 +171,12 @@ RECIPE_MAINTAINER:pn-efivar =3D "Ross Burton <ross.=
burton@arm.com>"
>  RECIPE_MAINTAINER:pn-efibootmgr =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-elfutils =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-ell =3D "Unassigned <unassigned@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-enchant2 =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-enchant2 =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-encodings =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-epiphany =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-erofs-utils =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
>  RECIPE_MAINTAINER:pn-ethtool =3D "Changhyeok Bae <changhyeok.bae@gmail.c=
om>"
> -RECIPE_MAINTAINER:pn-eudev =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-eudev =3D "Unassigned <unassigned@yoctoproject.org>=
"
>  RECIPE_MAINTAINER:pn-expat =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-expect =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-ffmpeg =3D "Unassigned <unassigned@yoctoproject.org=
>"
> @@ -213,10 +213,10 @@ RECIPE_MAINTAINER:pn-gettext-minimal-native =3D "Ro=
bert Yang <liezhi.yang@windrive
>  RECIPE_MAINTAINER:pn-ghostscript =3D "Hongxu Jia <hongxu.jia@windriver.c=
om>"
>  RECIPE_MAINTAINER:pn-gi-docgen =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-git =3D "Robert Yang <liezhi.yang@windriver.com>"
> -RECIPE_MAINTAINER:pn-glew =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-glib-2.0 =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-glib-2.0-initial =3D "Anuj Mittal <anuj.mittal@inte=
l.com>"
> -RECIPE_MAINTAINER:pn-glib-networking =3D "Anuj Mittal <anuj.mittal@intel=
.com>"
> +RECIPE_MAINTAINER:pn-glew =3D "Unassigned <unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-glib-2.0 =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> +RECIPE_MAINTAINER:pn-glib-2.0-initial =3D "Unassigned <unassigned@yoctop=
roject.org>"
> +RECIPE_MAINTAINER:pn-glib-networking =3D "Unassigned <unassigned@yoctopr=
oject.org>"
>  RECIPE_MAINTAINER:pn-glibc =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glibc-locale =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glibc-mtrace =3D "Khem Raj <raj.khem@gmail.com>"
> @@ -244,52 +244,52 @@ RECIPE_MAINTAINER:pn-gcompat =3D "Khem Raj <raj.khe=
m@gmail.com>"
>  RECIPE_MAINTAINER:pn-graphene =3D "Markus Volk <f_l_k@t-online.de>"
>  RECIPE_MAINTAINER:pn-grep =3D "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-groff =3D "Hongxu Jia <hongxu.jia@windriver.com>"
> -RECIPE_MAINTAINER:pn-grub =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-grub-bootconf =3D "Anuj Mittal <anuj.mittal@intel.c=
om>"
> -RECIPE_MAINTAINER:pn-grub-efi =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-gsettings-desktop-schemas =3D "Anuj Mittal <anuj.mi=
ttal@intel.com>"
> -RECIPE_MAINTAINER:pn-gst-devtools =3D "Anuj Mittal <anuj.mittal@intel.co=
m>"
> -RECIPE_MAINTAINER:pn-gst-examples =3D "Anuj Mittal <anuj.mittal@intel.co=
m>"
> -RECIPE_MAINTAINER:pn-gstreamer1.0 =3D "Anuj Mittal <anuj.mittal@intel.co=
m>"
> -RECIPE_MAINTAINER:pn-gstreamer1.0-libav =3D "Anuj Mittal <anuj.mittal@in=
tel.com>"
> -RECIPE_MAINTAINER:pn-gstreamer1.0-meta-base =3D "Anuj Mittal <anuj.mitta=
l@intel.com>"
> -RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-bad =3D "Anuj Mittal <anuj.mit=
tal@intel.com>"
> -RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-base =3D "Anuj Mittal <anuj.mi=
ttal@intel.com>"
> -RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-good =3D "Anuj Mittal <anuj.mi=
ttal@intel.com>"
> -RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-ugly =3D "Anuj Mittal <anuj.mi=
ttal@intel.com>"
> -RECIPE_MAINTAINER:pn-gstreamer1.0-python =3D "Anuj Mittal <anuj.mittal@i=
ntel.com>"
> -RECIPE_MAINTAINER:pn-gstreamer1.0-rtsp-server =3D "Anuj Mittal <anuj.mit=
tal@intel.com>"
> -RECIPE_MAINTAINER:pn-gstreamer1.0-vaapi =3D "Anuj Mittal <anuj.mittal@in=
tel.com>"
> +RECIPE_MAINTAINER:pn-grub =3D "Unassigned <unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-grub-bootconf =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
> +RECIPE_MAINTAINER:pn-grub-efi =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> +RECIPE_MAINTAINER:pn-gsettings-desktop-schemas =3D "Unassigned <unassign=
ed@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-gst-devtools =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
> +RECIPE_MAINTAINER:pn-gst-examples =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
> +RECIPE_MAINTAINER:pn-gstreamer1.0 =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
> +RECIPE_MAINTAINER:pn-gstreamer1.0-libav =3D "Unassigned <unassigned@yoct=
oproject.org>"
> +RECIPE_MAINTAINER:pn-gstreamer1.0-meta-base =3D "Unassigned <unassigned@=
yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-bad =3D "Unassigned <unassigne=
d@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-base =3D "Unassigned <unassign=
ed@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-good =3D "Unassigned <unassign=
ed@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-ugly =3D "Unassigned <unassign=
ed@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-gstreamer1.0-python =3D "Unassigned <unassigned@yoc=
toproject.org>"
> +RECIPE_MAINTAINER:pn-gstreamer1.0-rtsp-server =3D "Unassigned <unassigne=
d@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-gstreamer1.0-vaapi =3D "Unassigned <unassigned@yoct=
oproject.org>"
>  RECIPE_MAINTAINER:pn-gtk+3 =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-gtk4 =3D "Markus Volk <f_l_k@t-online.de>"
>  RECIPE_MAINTAINER:pn-gtk-doc =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-gzip =3D "Denys Dmytriyenko <denis@denix.org>"
> -RECIPE_MAINTAINER:pn-harfbuzz =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-harfbuzz =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-hdparm =3D "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-help2man =3D "Hongxu Jia <hongxu.jia@windriver.com>=
"
> -RECIPE_MAINTAINER:pn-hicolor-icon-theme =3D "Anuj Mittal <anuj.mittal@in=
tel.com>"
> +RECIPE_MAINTAINER:pn-hicolor-icon-theme =3D "Unassigned <unassigned@yoct=
oproject.org>"
>  RECIPE_MAINTAINER:pn-hwdata =3D "Hiago De Franco <hiago.franco@toradex.c=
om>"
>  RECIPE_MAINTAINER:pn-hwlatdetect =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
> -RECIPE_MAINTAINER:pn-i2c-tools =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-i2c-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-icon-naming-utils =3D "Richard Purdie <richard.purd=
ie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-icu =3D "Unassigned <unassigned@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-ifupdown =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-igt-gpu-tools =3D "Anuj Mittal <anuj.mittal@intel.c=
om>"
> +RECIPE_MAINTAINER:pn-ifupdown =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> +RECIPE_MAINTAINER:pn-igt-gpu-tools =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
>  RECIPE_MAINTAINER:pn-inetutils =3D "Tom Rini <trini@konsulko.com>"
> -RECIPE_MAINTAINER:pn-init-ifupdown =3D "Anuj Mittal <anuj.mittal@intel.c=
om>"
> -RECIPE_MAINTAINER:pn-init-system-helpers =3D "Anuj Mittal <anuj.mittal@i=
ntel.com>"
> +RECIPE_MAINTAINER:pn-init-ifupdown =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
> +RECIPE_MAINTAINER:pn-init-system-helpers =3D "Unassigned <unassigned@yoc=
toproject.org>"
>  RECIPE_MAINTAINER:pn-initramfs-boot =3D "Otavio Salvador <otavio.salvado=
r@ossystems.com.br>"
>  RECIPE_MAINTAINER:pn-initramfs-framework =3D "Otavio Salvador <otavio.sa=
lvador@ossystems.com.br>"
> -RECIPE_MAINTAINER:pn-initramfs-live-boot =3D "Anuj Mittal <anuj.mittal@i=
ntel.com>"
> -RECIPE_MAINTAINER:pn-initramfs-live-boot-tiny =3D "Anuj Mittal <anuj.mit=
tal@intel.com>"
> -RECIPE_MAINTAINER:pn-initramfs-live-install =3D "Anuj Mittal <anuj.mitta=
l@intel.com>"
> -RECIPE_MAINTAINER:pn-initramfs-live-install-efi =3D "Anuj Mittal <anuj.m=
ittal@intel.com>"
> -RECIPE_MAINTAINER:pn-initramfs-live-install-efi-testfs =3D "Anuj Mittal =
<anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-initramfs-live-install-testfs =3D "Anuj Mittal <anu=
j.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-initramfs-module-install =3D "Anuj Mittal <anuj.mit=
tal@intel.com>"
> -RECIPE_MAINTAINER:pn-initramfs-module-install-efi =3D "Anuj Mittal <anuj=
.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-initramfs-module-setup-live =3D "Anuj Mittal <anuj.=
mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-initscripts =3D "Anuj Mittal <anuj.mittal@intel.com=
>"
> +RECIPE_MAINTAINER:pn-initramfs-live-boot =3D "Unassigned <unassigned@yoc=
toproject.org>"
> +RECIPE_MAINTAINER:pn-initramfs-live-boot-tiny =3D "Unassigned <unassigne=
d@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-initramfs-live-install =3D "Unassigned <unassigned@=
yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-initramfs-live-install-efi =3D "Unassigned <unassig=
ned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-initramfs-live-install-efi-testfs =3D "Unassigned <=
unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-initramfs-live-install-testfs =3D "Unassigned <unas=
signed@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-initramfs-module-install =3D "Unassigned <unassigne=
d@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-initramfs-module-install-efi =3D "Unassigned <unass=
igned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-initramfs-module-setup-live =3D "Unassigned <unassi=
gned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-initscripts =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
>  RECIPE_MAINTAINER:pn-intltool =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-iproute2 =3D "Changhyeok Bae <changhyeok.bae@gmail.=
com>"
>  RECIPE_MAINTAINER:pn-iptables =3D "Changhyeok Bae <changhyeok.bae@gmail.=
com>"
> @@ -297,7 +297,7 @@ RECIPE_MAINTAINER:pn-iputils =3D "Changhyeok Bae <cha=
nghyeok.bae@gmail.com>"
>  RECIPE_MAINTAINER:pn-iso-codes =3D "Wang Mingyu <wangmy@cn.fujitsu.com>"
>  RECIPE_MAINTAINER:pn-itstool =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-iw =3D "Changhyeok Bae <changhyeok.bae@gmail.com>"
> -RECIPE_MAINTAINER:pn-libjpeg-turbo =3D "Anuj Mittal <anuj.mittal@intel.c=
om>"
> +RECIPE_MAINTAINER:pn-libjpeg-turbo =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
>  RECIPE_MAINTAINER:pn-json-c =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-json-glib =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-jquery =3D "Joshua Watt <JPEWhacker@gmail.com>"
> @@ -310,16 +310,16 @@ RECIPE_MAINTAINER:pn-kexec-tools =3D "Unassigned <u=
nassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-keymaps =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-kmod =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-kmscube =3D "Carlos Rafael Giani <crg7475@mailbox.o=
rg>"
> -RECIPE_MAINTAINER:pn-l3afpad =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-l3afpad =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-lame =3D "Michael Opdenacker <michael@opdenacker.or=
g>"
>  RECIPE_MAINTAINER:pn-ldconfig-native =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-less =3D "Yi Zhao <yi.zhao@windriver.com>"
> -RECIPE_MAINTAINER:pn-libacpi =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libacpi =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libadwaita =3D "Simone Wei=C3=9F <simone.p.weiss@po=
steo.com>"
>  RECIPE_MAINTAINER:pn-libaio =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-libarchive =3D "Otavio Salvador <otavio.salvador@os=
systems.com.br>"
>  RECIPE_MAINTAINER:pn-libassuan =3D "Unassigned <unassigned@yoctoproject.=
org>"
> -RECIPE_MAINTAINER:pn-libatomic-ops =3D "Anuj Mittal <anuj.mittal@intel.c=
om>"
> +RECIPE_MAINTAINER:pn-libatomic-ops =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
>  RECIPE_MAINTAINER:pn-libbsd =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-libc-test =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-libcap =3D "Yi Zhao <yi.zhao@windriver.com>"
> @@ -337,10 +337,10 @@ RECIPE_MAINTAINER:pn-libdisplay-info =3D "Hiago De =
Franco <hiago.franco@toradex.co
>  RECIPE_MAINTAINER:pn-libdnf =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-libdrm =3D "Otavio Salvador <otavio.salvador@ossyst=
ems.com.br>"
>  RECIPE_MAINTAINER:pn-libedit =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-libepoxy =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libepoxy =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-liberation-fonts =3D "Unassigned <unassigned@yoctop=
roject.org>"
> -RECIPE_MAINTAINER:pn-libevdev =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-libevent =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libevdev =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> +RECIPE_MAINTAINER:pn-libevent =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-libexif =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libfakekey =3D "Unassigned <unassigned@yoctoproject=
.org>"
>  RECIPE_MAINTAINER:pn-libffi =3D "Unassigned <unassigned@yoctoproject.org=
>"
> @@ -372,24 +372,24 @@ RECIPE_MAINTAINER:pn-libmpc =3D "Khem Raj <raj.khem=
@gmail.com>"
>  RECIPE_MAINTAINER:pn-libmodule-build-perl =3D "Tim Orling <tim.orling@ko=
nsulko.com>"
>  RECIPE_MAINTAINER:pn-libmodulemd =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
>  RECIPE_MAINTAINER:pn-libnl =3D "Unassigned <unassigned@yoctoproject.org>=
"
> -RECIPE_MAINTAINER:pn-libnotify =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libnotify =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-libnsl2 =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-libnss-nis =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-libogg =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-libpam =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-libpcap =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libogg =3D "Unassigned <unassigned@yoctoproject.org=
>"
> +RECIPE_MAINTAINER:pn-libpam =3D "Unassigned <unassigned@yoctoproject.org=
>"
> +RECIPE_MAINTAINER:pn-libpcap =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libpciaccess =3D "Wang Mingyu <wangmy@fujitsu.com>"
>  RECIPE_MAINTAINER:pn-libpcre =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-libpcre2 =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-libpipeline =3D "Wang Mingyu <wangmy@fujitsu.com>"
> -RECIPE_MAINTAINER:pn-libpng =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libpng =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-libportal =3D "Unassigned <unassigned@yoctoproject.=
org>"
> -RECIPE_MAINTAINER:pn-libproxy =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libproxy =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-libpthread-stubs =3D "Unassigned <unassigned@yoctop=
roject.org>"
>  RECIPE_MAINTAINER:pn-libptytty =3D "Unassigned <unassigned@yoctoproject.=
org>"
> -RECIPE_MAINTAINER:pn-libpsl =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libpsl =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-librepo =3D "Wang Mingyu <wangmy@fujitsu.com>"
> -RECIPE_MAINTAINER:pn-librsvg =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-librsvg =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libstd-rs =3D "Randy MacLeod <Randy.MacLeod@windriv=
er.com>"
>  RECIPE_MAINTAINER:pn-libsamplerate0 =3D "Unassigned <unassigned@yoctopro=
ject.org>"
>  RECIPE_MAINTAINER:pn-libsass =3D "Simone Wei=C3=9F <simone.p.weiss@poste=
o.com>"
> @@ -399,32 +399,32 @@ RECIPE_MAINTAINER:pn-libsecret =3D "Unassigned <una=
ssigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libslirp =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-libsm =3D "Unassigned <unassigned@yoctoproject.org>=
"
>  RECIPE_MAINTAINER:pn-libsndfile1 =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
> -RECIPE_MAINTAINER:pn-libsolv =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-libsoup =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libsolv =3D "Unassigned <unassigned@yoctoproject.or=
g>"
> +RECIPE_MAINTAINER:pn-libsoup =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libssh2 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libssp-nonshared =3D "Khem Raj <raj.khem@gmail.com>=
"
> -RECIPE_MAINTAINER:pn-libtasn1 =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libtasn1 =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-libtest-fatal-perl =3D "Tim Orling <tim.orling@kons=
ulko.com>"
>  RECIPE_MAINTAINER:pn-libtest-needs-perl =3D "Tim Orling <tim.orling@kons=
ulko.com>"
>  RECIPE_MAINTAINER:pn-libtest-warnings-perl =3D "Tim Orling <tim.orling@k=
onsulko.com>"
>  RECIPE_MAINTAINER:pn-libtheora =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-libtimedate-perl =3D "Tim Orling <tim.orling@konsul=
ko.com>"
> -RECIPE_MAINTAINER:pn-libtirpc =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libtirpc =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-libtool =3D "Robert Yang <liezhi.yang@windriver.com=
>"
>  RECIPE_MAINTAINER:pn-libtool-cross =3D "Robert Yang <liezhi.yang@windriv=
er.com>"
>  RECIPE_MAINTAINER:pn-libtool-native =3D "Robert Yang <liezhi.yang@windri=
ver.com>"
>  RECIPE_MAINTAINER:pn-libtraceevent =3D "Bruce Ashfield <bruce.ashfield@g=
mail.com>"
>  RECIPE_MAINTAINER:pn-libtry-tiny-perl =3D "Tim Orling <tim.orling@konsul=
ko.com>"
>  RECIPE_MAINTAINER:pn-libucontext =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-libunistring =3D "Anuj Mittal <anuj.mittal@intel.co=
m>"
> +RECIPE_MAINTAINER:pn-libunistring =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
>  RECIPE_MAINTAINER:pn-libunwind =3D "Bruce Ashfield <bruce.ashfield@gmail=
.com>"
>  RECIPE_MAINTAINER:pn-liburcu =3D "Wang Mingyu <wangmy@fujitsu.com>"
> -RECIPE_MAINTAINER:pn-libusb1 =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libusb1 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libubootenv =3D "Stefano Babic <sbabic@denx.de>"
>  RECIPE_MAINTAINER:pn-libuv =3D "Unassigned <unassigned@yoctoproject.org>=
"
> -RECIPE_MAINTAINER:pn-libva =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-libva-initial =3D "Anuj Mittal <anuj.mittal@intel.c=
om>"
> -RECIPE_MAINTAINER:pn-libva-utils =3D "Anuj Mittal <anuj.mittal@intel.com=
>"
> +RECIPE_MAINTAINER:pn-libva =3D "Unassigned <unassigned@yoctoproject.org>=
"
> +RECIPE_MAINTAINER:pn-libva-initial =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
> +RECIPE_MAINTAINER:pn-libva-utils =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
>  RECIPE_MAINTAINER:pn-libvorbis =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-libwebp =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libwpe =3D "Unassigned <unassigned@yoctoproject.org=
>"
> @@ -485,7 +485,7 @@ RECIPE_MAINTAINER:pn-llvm-project-source-20.1.8 =3D "=
Khem Raj <raj.khem@gmail.com>
>  RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
>  RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org>"
> -RECIPE_MAINTAINER:pn-lrzsz =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-lrzsz =3D "Unassigned <unassigned@yoctoproject.org>=
"
>  RECIPE_MAINTAINER:pn-lsb-release =3D "Hongxu Jia <hongxu.jia@windriver.c=
om>"
>  RECIPE_MAINTAINER:pn-lsof =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-ltp =3D "Yi Zhao <yi.zhao@windriver.com>"
> @@ -532,17 +532,17 @@ RECIPE_MAINTAINER:pn-meta-toolchain =3D "Richard Pu=
rdie <richard.purdie@linuxfound
>  RECIPE_MAINTAINER:pn-meta-world-pkgdata =3D "Richard Purdie <richard.pur=
die@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-mingetty =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-mini-x-session =3D "Unassigned <unassigned@yoctopro=
ject.org>"
> -RECIPE_MAINTAINER:pn-minicom =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-minicom =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-mkfontscale =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
> -RECIPE_MAINTAINER:pn-mmc-utils =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-mmc-utils =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-mobile-broadband-provider-info =3D "Unassigned <una=
ssigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-modutils-initscripts =3D "Yi Zhao <yi.zhao@windrive=
r.com>"
>  RECIPE_MAINTAINER:pn-mpfr =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-mpg123 =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-msmtp =3D "Wang Mingyu <wangmy@fujitsu.com>"
>  RECIPE_MAINTAINER:pn-mtd-utils =3D "Denys Dmytriyenko <denis@denix.org>"
> -RECIPE_MAINTAINER:pn-mtdev =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-mtools =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-mtdev =3D "Unassigned <unassigned@yoctoproject.org>=
"
> +RECIPE_MAINTAINER:pn-mtools =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-musl =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-musl-legacy-error =3D "Khem Raj <raj.khem@gmail.com=
>"
>  RECIPE_MAINTAINER:pn-musl-locales =3D "Khem Raj <raj.khem@gmail.com>"
> @@ -557,7 +557,7 @@ RECIPE_MAINTAINER:pn-nativesdk-qemu-helper =3D "Richa=
rd Purdie <richard.purdie@lin
>  RECIPE_MAINTAINER:pn-nativesdk-sdk-provides-dummy =3D "Richard Purdie <r=
ichard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-newlib =3D "Alejandro Hernandez <alejandro@enedino.=
org>"
>  RECIPE_MAINTAINER:pn-ncurses =3D "Hongxu Jia <hongxu.jia@windriver.com>"
> -RECIPE_MAINTAINER:pn-neard =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-neard =3D "Unassigned <unassigned@yoctoproject.org>=
"
>  RECIPE_MAINTAINER:pn-net-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-netbase =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-nettle =3D "Unassigned <unassigned@yoctoproject.org=
>"
> @@ -566,7 +566,7 @@ RECIPE_MAINTAINER:pn-nfs-utils =3D "Robert Yang <liez=
hi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-nghttp2 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-ninja =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-npth =3D "Unassigned <unassigned@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-nss-myhostname =3D "Anuj Mittal <anuj.mittal@intel.=
com>"
> +RECIPE_MAINTAINER:pn-nss-myhostname =3D "Unassigned <unassigned@yoctopro=
ject.org>"
>  RECIPE_MAINTAINER:pn-numactl =3D "Richard Purdie <richard.purdie@linuxfo=
undation.org>"
>  RECIPE_MAINTAINER:pn-ofono =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-openmp =3D "Khem Raj <raj.khem@gmail.com>"
> @@ -577,7 +577,7 @@ RECIPE_MAINTAINER:pn-opkg =3D "Alex Stewart <alex.ste=
wart@ni.com>"
>  RECIPE_MAINTAINER:pn-opkg-arch-config =3D "Alex Stewart <alex.stewart@ni=
.com>"
>  RECIPE_MAINTAINER:pn-opkg-keyrings =3D "Alex Stewart <alex.stewart@ni.co=
m>"
>  RECIPE_MAINTAINER:pn-opkg-utils =3D "Alex Stewart <alex.stewart@ni.com>"
> -RECIPE_MAINTAINER:pn-orc =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-orc =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-os-release =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-ovmf =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-ovmf-shell-image =3D "Unassigned <unassigned@yoctop=
roject.org>"
> @@ -598,12 +598,12 @@ RECIPE_MAINTAINER:pn-picolibc-helloworld =3D "Aleja=
ndro Hernandez <alejandro@enedi
>  RECIPE_MAINTAINER:pn-piglit =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-pigz =3D "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER:pn-pinentry =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> -RECIPE_MAINTAINER:pn-pixman =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-pixman =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-pkgconf =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-pkgconfig =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-pm-utils =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-pointercal-xinput =3D "Unassigned <unassigned@yocto=
project.org>"
> -RECIPE_MAINTAINER:pn-pong-clock =3D "Anuj Mittal <anuj.mittal@intel.com>=
"
> +RECIPE_MAINTAINER:pn-pong-clock =3D "Unassigned <unassigned@yoctoproject=
.org>"
>  RECIPE_MAINTAINER:pn-popt =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-powertop =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-ppp =3D "Hongxu Jia <hongxu.jia@windriver.com>"
> @@ -615,7 +615,7 @@ RECIPE_MAINTAINER:pn-psplash =3D "Yi Zhao <yi.zhao@wi=
ndriver.com>"
>  RECIPE_MAINTAINER:pn-ptest-runner =3D "Ross Burton <ross.burton@arm.com>=
"
>  RECIPE_MAINTAINER:pn-pulseaudio =3D "Unassigned <unassigned@yoctoproject=
.org>"
>  RECIPE_MAINTAINER:pn-pulseaudio-client-conf-sato =3D "Unassigned <unassi=
gned@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-puzzles =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-puzzles =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-python3 =3D "Trevor Gamblin <tgamblin@baylibre.com>=
"
>  RECIPE_MAINTAINER:pn-python3-alabaster =3D "Tim Orling <tim.orling@konsu=
lko.com>"
>  RECIPE_MAINTAINER:pn-python3-asn1crypto =3D "Tim Orling <tim.orling@kons=
ulko.com>"
> @@ -755,14 +755,14 @@ RECIPE_MAINTAINER:pn-qemu-system-native =3D "Richar=
d Purdie <richard.purdie@linuxf
>  RECIPE_MAINTAINER:pn-qemuwrapper-cross =3D "Richard Purdie <richard.purd=
ie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-quilt =3D "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-quilt-native =3D "Robert Yang <liezhi.yang@windrive=
r.com>"
> -RECIPE_MAINTAINER:pn-quota =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-quota =3D "Unassigned <unassigned@yoctoproject.org>=
"
>  RECIPE_MAINTAINER:pn-re2c =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-readline =3D "Hongxu Jia <hongxu.jia@windriver.com>=
"
>  RECIPE_MAINTAINER:pn-repo =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-resolvconf =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-rgb =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-rpcbind =3D "Hongxu Jia <hongxu.jia@windriver.com>"
> -RECIPE_MAINTAINER:pn-rng-tools =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-rng-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-rpcsvc-proto =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-rpm =3D "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-rpm-sequoia =3D "Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=
=A9nyi <zboszor@gmail.com>"
> @@ -780,17 +780,17 @@ RECIPE_MAINTAINER:pn-sato-screenshot =3D "Ross Burt=
on <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-sato-icon-theme =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-sbc =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-scdoc =3D "Alex Kiernan <alex.kiernan@gmail.com>"
> -RECIPE_MAINTAINER:pn-screen =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-screen =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-seatd =3D "Unassigned <unassigned@yoctoproject.org>=
"
>  RECIPE_MAINTAINER:pn-sed =3D "Chen Qi <Qi.Chen@windriver.com>"
> -RECIPE_MAINTAINER:pn-serf =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-serf =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-setserial =3D "Yi Zhao <yi.zhao@windriver.com>"
> -RECIPE_MAINTAINER:pn-settings-daemon =3D "Anuj Mittal <anuj.mittal@intel=
.com>"
> +RECIPE_MAINTAINER:pn-settings-daemon =3D "Unassigned <unassigned@yoctopr=
oject.org>"
>  RECIPE_MAINTAINER:pn-shadow =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-shadow-securetty =3D "Chen Qi <Qi.Chen@windriver.co=
m>"
>  RECIPE_MAINTAINER:pn-shadow-sysroot =3D "Chen Qi <Qi.Chen@windriver.com>=
"
>  RECIPE_MAINTAINER:pn-shaderc =3D "Jose Quaresma <quaresma.jose@gmail.com=
>"
> -RECIPE_MAINTAINER:pn-shared-mime-info =3D "Anuj Mittal <anuj.mittal@inte=
l.com>"
> +RECIPE_MAINTAINER:pn-shared-mime-info =3D "Unassigned <unassigned@yoctop=
roject.org>"
>  RECIPE_MAINTAINER:pn-shutdown-desktop =3D "Unassigned <unassigned@yoctop=
roject.org>"
>  RECIPE_MAINTAINER:pn-signing-keys =3D "Richard Purdie <richard.purdie@li=
nuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-slang =3D "Yi Zhao <yi.zhao@windriver.com>"
> @@ -800,15 +800,15 @@ RECIPE_MAINTAINER:pn-speexdsp =3D "Michael Opdenack=
er <michael@opdenacker.org>"
>  RECIPE_MAINTAINER:pn-spirv-headers =3D "Jose Quaresma <quaresma.jose@gma=
il.com>"
>  RECIPE_MAINTAINER:pn-spirv-llvm-translator =3D "Khem Raj <raj.khem@gmail=
.com>"
>  RECIPE_MAINTAINER:pn-spirv-tools =3D "Jose Quaresma <quaresma.jose@gmail=
.com>"
> -RECIPE_MAINTAINER:pn-sqlite3 =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-sqlite3 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-squashfs-tools =3D "Robert Yang <liezhi.yang@windri=
ver.com>"
>  RECIPE_MAINTAINER:pn-ssh-pregen-hostkeys =3D "Richard Purdie <richard.pu=
rdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-startup-notification =3D "Unassigned <unassigned@yo=
ctoproject.org>"
>  RECIPE_MAINTAINER:pn-strace =3D "Robert Yang <liezhi.yang@windriver.com>=
"
> -RECIPE_MAINTAINER:pn-stress-ng =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-stress-ng =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-subversion =3D "Richard Purdie <richard.purdie@linu=
xfoundation.org>"
>  RECIPE_MAINTAINER:pn-sudo =3D "Chen Qi <Qi.Chen@windriver.com>"
> -RECIPE_MAINTAINER:pn-swig =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-swig =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-sysfsutils =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-sysklogd =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-syslinux =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> @@ -827,19 +827,19 @@ RECIPE_MAINTAINER:pn-systemtap =3D "Victor Kamensky=
 <victor.kamensky7@gmail.com>"
>  RECIPE_MAINTAINER:pn-systemtap-native =3D "Victor Kamensky <victor.kamen=
sky7@gmail.com>"
>  RECIPE_MAINTAINER:pn-sysvinit =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-sysvinit-inittab =3D "Ross Burton <ross.burton@arm.=
com>"
> -RECIPE_MAINTAINER:pn-taglib =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-taglib =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-tar =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-target-sdk-provides-dummy =3D "Richard Purdie <rich=
ard.purdie@linuxfoundation.org>"
> -RECIPE_MAINTAINER:pn-tcf-agent =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-tcf-agent =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-tcl =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-tcl8 =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-tcp-wrappers =3D "Robert Yang <liezhi.yang@windrive=
r.com>"
>  RECIPE_MAINTAINER:pn-testexport-tarball =3D "Richard Purdie <richard.pur=
die@linuxfoundation.org>"
> -RECIPE_MAINTAINER:pn-texinfo =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-texinfo-dummy-native =3D "Anuj Mittal <anuj.mittal@=
intel.com>"
> +RECIPE_MAINTAINER:pn-texinfo =3D "Unassigned <unassigned@yoctoproject.or=
g>"
> +RECIPE_MAINTAINER:pn-texinfo-dummy-native =3D "Unassigned <unassigned@yo=
ctoproject.org>"
>  RECIPE_MAINTAINER:pn-tiff =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-time =3D "Robert Yang <liezhi.yang@windriver.com>"
> -RECIPE_MAINTAINER:pn-ttf-bitstream-vera =3D "Anuj Mittal <anuj.mittal@in=
tel.com>"
> +RECIPE_MAINTAINER:pn-ttf-bitstream-vera =3D "Unassigned <unassigned@yoct=
oproject.org>"
>  RECIPE_MAINTAINER:pn-ttyrun =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-tzcode-native =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
>  RECIPE_MAINTAINER:pn-tzdata =3D "Unassigned <unassigned@yoctoproject.org=
>"
> @@ -855,7 +855,7 @@ RECIPE_MAINTAINER:pn-usbutils =3D "Unassigned <unassi=
gned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-util-linux =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-util-linux-libuuid =3D "Chen Qi <Qi.Chen@windriver.=
com>"
>  RECIPE_MAINTAINER:pn-util-macros =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
> -RECIPE_MAINTAINER:pn-utfcpp =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-utfcpp =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-v86d =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-vala =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-valgrind =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> @@ -863,14 +863,14 @@ RECIPE_MAINTAINER:pn-vim =3D "Tom Rini <trini@konsu=
lko.com>"
>  RECIPE_MAINTAINER:pn-vim-tiny =3D "Tom Rini <trini@konsulko.com>"
>  RECIPE_MAINTAINER:pn-virglrenderer =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
>  RECIPE_MAINTAINER:pn-volatile-binds =3D "Chen Qi <Qi.Chen@windriver.com>=
"
> -RECIPE_MAINTAINER:pn-vte =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-vulkan-headers =3D "Anuj Mittal <anuj.mittal@intel.=
com>"
> -RECIPE_MAINTAINER:pn-vulkan-loader =3D "Anuj Mittal <anuj.mittal@intel.c=
om>"
> +RECIPE_MAINTAINER:pn-vte =3D "Unassigned <unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-vulkan-headers =3D "Unassigned <unassigned@yoctopro=
ject.org>"
> +RECIPE_MAINTAINER:pn-vulkan-loader =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
>  RECIPE_MAINTAINER:pn-vulkan-samples =3D "Ross Burton <ross.burton@arm.co=
m>"
> -RECIPE_MAINTAINER:pn-vulkan-tools =3D "Anuj Mittal <anuj.mittal@intel.co=
m>"
> -RECIPE_MAINTAINER:pn-vulkan-utility-libraries =3D "Anuj Mittal <anuj.mit=
tal@intel.com>"
> +RECIPE_MAINTAINER:pn-vulkan-tools =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
> +RECIPE_MAINTAINER:pn-vulkan-utility-libraries =3D "Unassigned <unassigne=
d@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-vulkan-validation-layers =3D "Vincent Davis Jr <vin=
ce@underview.tech>"
> -RECIPE_MAINTAINER:pn-vulkan-volk =3D "Anuj Mittal <anuj.mittal@intel.com=
>"
> +RECIPE_MAINTAINER:pn-vulkan-volk =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
>  RECIPE_MAINTAINER:pn-waffle =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-watchdog =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-watchdog-config =3D "Unassigned <unassigned@yoctopr=
oject.org>"
> @@ -881,13 +881,13 @@ RECIPE_MAINTAINER:pn-webkitgtk =3D "Unassigned <una=
ssigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-weston =3D "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-weston-init =3D "Denys Dmytriyenko <denis@denix.org=
>"
>  RECIPE_MAINTAINER:pn-wget =3D "Yi Zhao <yi.zhao@windriver.com>"
> -RECIPE_MAINTAINER:pn-which =3D "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-wic-tools =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-which =3D "Unassigned <unassigned@yoctoproject.org>=
"
> +RECIPE_MAINTAINER:pn-wic-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-wireless-regdb =3D "Unassigned <unassigned@yoctopro=
ject.org>"
>  RECIPE_MAINTAINER:pn-wpa-supplicant =3D "Changhyeok Bae <changhyeok.bae@=
gmail.com>"
>  RECIPE_MAINTAINER:pn-wpebackend-fdo =3D "Unassigned <unassigned@yoctopro=
ject.org>"
>  RECIPE_MAINTAINER:pn-x11perf =3D "Unassigned <unassigned@yoctoproject.or=
g>"
> -RECIPE_MAINTAINER:pn-x264 =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-x264 =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-xauth =3D "Unassigned <unassigned@yoctoproject.org>=
"
>  RECIPE_MAINTAINER:pn-xcb-proto =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-xcb-util =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> @@ -898,7 +898,7 @@ RECIPE_MAINTAINER:pn-xcb-util-keysyms =3D "Unassigned=
 <unassigned@yoctoproject.org
>  RECIPE_MAINTAINER:pn-xcb-util-renderutil =3D "Unassigned <unassigned@yoc=
toproject.org>"
>  RECIPE_MAINTAINER:pn-xcb-util-wm =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
>  RECIPE_MAINTAINER:pn-xcursor-transparent-theme =3D "Unassigned <unassign=
ed@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-xdg-utils =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-xdg-utils =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-xdpyinfo =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-xev =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-xeyes =3D "Unassigned <unassigned@yoctoproject.org>=
"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223193): https://lists.openembedded.org/g/openembedde=
d-core/message/223193
> Mute This Topic: https://lists.openembedded.org/mt/115167228/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

