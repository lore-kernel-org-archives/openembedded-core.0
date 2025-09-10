Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11788CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 10:57:51 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.14523.1757501860911498441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 03:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JXRZm0Ha;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-70fa947a7acso19626346d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 03:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501860; x=1758106660; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8t2ePg5Zuc+1roo/bg4BZxOC5YHvoKReABVyXthmpos=;
        b=JXRZm0HawH6vqubCy67SdxjjvZlxJQtCMtncvht9ixB7/nMxGHNjqltXak0/VKVMO1
         uUVIjqSjN1EoFmCUK13AKS9jz36MA89WnZ4UJSMljws4Rx9VhyDWxW56cyYKfcfIhLuC
         7wUpr/J0igrKJn1zcgNALqHaHaMQELb6YxefPysOWxmFQdlqxJ6Wa7fPLc9U1n6YwFuw
         Wb0Qwox5j5HgG2Vhy0ex3BgiIpuAvAAY3WX5Pifm+WriWd2b6lnsjt1+tHlCGOJdO8fP
         utLmYshnGcbpAd47mZefZ4Ca50UYRc1FbbxwzU+u3Gp1ObWO832vl0vNBdYQ+nAzmoY3
         YRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501860; x=1758106660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8t2ePg5Zuc+1roo/bg4BZxOC5YHvoKReABVyXthmpos=;
        b=n30z2j0nt9u8Wk3yj7WVEKML1P4jM0nKvx+1yGROc/TGhLn8FlOEb03vY7Y6STXjvU
         zLUhl+Rt9U3hdGK1e4PEA4njT7Fejig1wrwDQ/Xb3aLK4PTM5uLNu9992x0noJluNzAU
         dfb8HsgIfBL9tBcn1a9V4Hr08jSZYqI21T7EKB6IF7S1UzxK9dcCs5CNKLezPIt4lZtH
         NTjUmy3R/AiezNCV1K2I74EoLwG7cJgC+IAk3tC5IQyTknbVviz7ddQn2UhXgWoIZHQT
         4GSTJA/0CHDVzFBUumYOAlyJZAvtmlpBkVGh3b3tZ2qljh8Jf1YZr7SiaWYEdf7wOSIz
         6R5Q==
X-Gm-Message-State: AOJu0YxS7VFA1yNp7ZpDpwn8pKqS3iKJAdARAieONp3eEyILeHT459Fj
	4HkItCTyhBTNuIw1UmC3VKVxv6rP4MJgKL7RfkZOUeFPpJ9JnKvAORRpOkfFbys5w+EKduLnMo6
	kIP4brhTHzDvT31vUg1O/IVE8+IN/8ir5Tw==
X-Gm-Gg: ASbGncu+1c8DkzuNu6aSUJC0Tt5foQJISbrAUzWgH6ftFZch5j3qFG0iksFG3GszjHO
	IgHNvKObjXSe3N8T+1b/fiKwiJSv6HScNy0S62ci0mfQXZ33TJvF5HVlbEQBLSCF0a5yuKgR/Rm
	47KbOnLiML01RXW1VuF532s2Cj6cxRcm3L0MrjYkNd3AmyFpgzDJk4d4B5WvUIiGV9zpVq9zoS/
	ZkXU+35N/PrMbPiO+tWGM7sa1ElR2V8teS/t6MXG5pT6rEvpTRkeVgUl4qntmxuPVnJD7iYcLLC
	JIKa4CMJjf1254iieG2J3tCuFKXFcxZjCvRiCo0Ux4uv1eHHRYR+MWoMeXvaFw==
X-Google-Smtp-Source: AGHT+IH/GA34G2X2DBZtSkWiYHq7QP+I8i2PdHNisCmlc7yvs8yJTuBUwmWdBchVyVHH2FjHEgmdhVNPagW4KTO1tYQ=
X-Received: by 2002:ad4:5ccf:0:b0:71b:2483:7887 with SMTP id
 6a1803df08f44-7394587e1e1mr134524546d6.57.1757501859839; Wed, 10 Sep 2025
 03:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250910105053.315379-1-alex.kanavin@gmail.com> <1863E64671167242.18650@lists.openembedded.org>
In-Reply-To: <1863E64671167242.18650@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Sep 2025 12:57:28 +0200
X-Gm-Features: AS18NWCOAPaHc1a0d2JT4Go6DCpqFKSW-hdM4C6iJv8V_V2eJ0FGvt2m1IERZd8
Message-ID: <CANNYZj-U8C_nYg2UNBama_gAvgrqaUMkoBKQkeJM2rdeJneR1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] maintainers.inc: unassign Otavio Salvador
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Otavio Salvador <otavio.salvador@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 10:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223202

Hello Otavio,

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
> Same as other unassignments: no update activity for a long time.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index f69939413a9..ece809f61a6 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -278,8 +278,8 @@ RECIPE_MAINTAINER:pn-igt-gpu-tools =3D "Unassigned <u=
nassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-inetutils =3D "Tom Rini <trini@konsulko.com>"
>  RECIPE_MAINTAINER:pn-init-ifupdown =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
>  RECIPE_MAINTAINER:pn-init-system-helpers =3D "Unassigned <unassigned@yoc=
toproject.org>"
> -RECIPE_MAINTAINER:pn-initramfs-boot =3D "Otavio Salvador <otavio.salvado=
r@ossystems.com.br>"
> -RECIPE_MAINTAINER:pn-initramfs-framework =3D "Otavio Salvador <otavio.sa=
lvador@ossystems.com.br>"
> +RECIPE_MAINTAINER:pn-initramfs-boot =3D "Unassigned <unassigned@yoctopro=
ject.org>"
> +RECIPE_MAINTAINER:pn-initramfs-framework =3D "Unassigned <unassigned@yoc=
toproject.org>"
>  RECIPE_MAINTAINER:pn-initramfs-live-boot =3D "Unassigned <unassigned@yoc=
toproject.org>"
>  RECIPE_MAINTAINER:pn-initramfs-live-boot-tiny =3D "Unassigned <unassigne=
d@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-initramfs-live-install =3D "Unassigned <unassigned@=
yoctoproject.org>"
> @@ -317,7 +317,7 @@ RECIPE_MAINTAINER:pn-less =3D "Yi Zhao <yi.zhao@windr=
iver.com>"
>  RECIPE_MAINTAINER:pn-libacpi =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libadwaita =3D "Simone Wei=C3=9F <simone.p.weiss@po=
steo.com>"
>  RECIPE_MAINTAINER:pn-libaio =3D "Unassigned <unassigned@yoctoproject.org=
>"
> -RECIPE_MAINTAINER:pn-libarchive =3D "Otavio Salvador <otavio.salvador@os=
systems.com.br>"
> +RECIPE_MAINTAINER:pn-libarchive =3D "Unassigned <unassigned@yoctoproject=
.org>"
>  RECIPE_MAINTAINER:pn-libassuan =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-libatomic-ops =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
>  RECIPE_MAINTAINER:pn-libbsd =3D "Yi Zhao <yi.zhao@windriver.com>"
> @@ -335,7 +335,7 @@ RECIPE_MAINTAINER:pn-libdaemon =3D "Unassigned <unass=
igned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libdazzle =3D "Unassigned <unassigned@yoctoproject.=
org>"
>  RECIPE_MAINTAINER:pn-libdisplay-info =3D "Hiago De Franco <hiago.franco@=
toradex.com>"
>  RECIPE_MAINTAINER:pn-libdnf =3D "Unassigned <unassigned@yoctoproject.org=
>"
> -RECIPE_MAINTAINER:pn-libdrm =3D "Otavio Salvador <otavio.salvador@ossyst=
ems.com.br>"
> +RECIPE_MAINTAINER:pn-libdrm =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-libedit =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-libepoxy =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-liberation-fonts =3D "Unassigned <unassigned@yoctop=
roject.org>"
> @@ -473,7 +473,7 @@ RECIPE_MAINTAINER:pn-libyaml =3D "Wang Mingyu <wangmy=
@fujitsu.com>"
>  RECIPE_MAINTAINER:pn-lighttpd =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-linux-dummy =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
>  RECIPE_MAINTAINER:pn-linux-yocto-fitimage =3D "Adrian Freihofer <adrian.=
freihofer@siemens.com>"
> -RECIPE_MAINTAINER:pn-linux-firmware =3D "Otavio Salvador <otavio.salvado=
r@ossystems.com.br>"
> +RECIPE_MAINTAINER:pn-linux-firmware =3D "Unassigned <unassigned@yoctopro=
ject.org>"
>  RECIPE_MAINTAINER:pn-linux-libc-headers =3D "Bruce Ashfield <bruce.ashfi=
eld@gmail.com>"
>  RECIPE_MAINTAINER:pn-linux-yocto =3D "Bruce Ashfield <bruce.ashfield@gma=
il.com>"
>  RECIPE_MAINTAINER:pn-linux-yocto-dev =3D "Bruce Ashfield <bruce.ashfield=
@gmail.com>"
> @@ -519,9 +519,9 @@ RECIPE_MAINTAINER:pn-matchbox-wm =3D "Ross Burton <ro=
ss.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-mc =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-mdadm =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-menu-cache =3D "Ross Burton <ross.burton@arm.com>"
> -RECIPE_MAINTAINER:pn-mesa =3D "Otavio Salvador <otavio.salvador@ossystem=
s.com.br>"
> -RECIPE_MAINTAINER:pn-mesa-demos =3D "Otavio Salvador <otavio.salvador@os=
systems.com.br>"
> -RECIPE_MAINTAINER:pn-mesa-gl =3D "Otavio Salvador <otavio.salvador@ossys=
tems.com.br>"
> +RECIPE_MAINTAINER:pn-mesa =3D "Unassigned <unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-mesa-demos =3D "Unassigned <unassigned@yoctoproject=
.org>"
> +RECIPE_MAINTAINER:pn-mesa-gl =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-meson =3D "Trevor Gamblin <tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-meta-environment-${MACHINE} =3D "Richard Purdie <ri=
chard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-meta-environment-extsdk-${MACHINE} =3D "Richard Pur=
die <richard.purdie@linuxfoundation.org>"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223196): https://lists.openembedded.org/g/openembedde=
d-core/message/223196
> Mute This Topic: https://lists.openembedded.org/mt/115167231/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

