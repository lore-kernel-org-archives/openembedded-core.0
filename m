Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D10FD4A601
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 05:12:43 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.256.1768540354069368288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 21:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D0PKG1FK;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-45c758f516dso1005160b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 21:12:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768540353; cv=none;
        d=google.com; s=arc-20240605;
        b=RexItZEBxoKbN8dUjtRyUZK9tyi9npZbu2rb7uZVbGd2ds8os9Oq63hY63Mx41L43k
         kV/7XIEVYhOW0FGhljMLNwaOzwz89poLhkf2+IKyMkihoIGEs2fgnmmZIZ1TpkCX1a6V
         aUJCvDfW/5vNwlp44lVjometIuylKQfAbqQuVeZeIMOWyyDP4iFf0/Gq80x0ZktqBpBa
         7sAX1j5jVp+/gInH8bs9k697tqkBZMAuV5e1o0xwURvA9auf/YHcm357SoWU4d9LmXuA
         SGHMv7qyCws/yiyC+y9NeqCzMKLBZAXX9u1QoG3FRvavi1iVygWicg59NuQOJkTf77ee
         ibBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TwSqq/+v56oPeVWrmrEqc6uJgezoZscoi3lB/NsrKmo=;
        fh=zcX3bZ/T0LOvS6nphuex0OH2KQxjIIsAJwAEKDVS3CM=;
        b=dNsEhpupwOKTiAV/wwEgdXZjfN+/BWr3fF6oy08EbDR2vqD7YMpeCwdMLTJyiyQYmi
         ZEhqqFOSzeKqh7atCeJj0KmJZqCBe/cThB+OKTgpG1Gd8YRPPmCoRCZ5AdWlyj/Zu9bw
         DANJJKjxIhiTFZ1dywKYjU8SwRXvUZSnXQyu0MiUn0duMF6+oxZB1YDw1EUsO/uZ5R5C
         WX6GXzl2GgHDQGFsF5iONGatIR5/9K40XfaIKVlODNXdJBUmMsribUhPIbGUTmtua6X0
         yESpALPATZY71vU58B+jCkmIl+ZLTFXz9sg/5oNQC/Sd/E7SFlZgXoR17UwUyKq1JUA/
         dGQQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768540353; x=1769145153; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwSqq/+v56oPeVWrmrEqc6uJgezoZscoi3lB/NsrKmo=;
        b=D0PKG1FKpq/kTPDC3k2CKtN0hmmC9WGRAENc/h4I4UWhNKH+cala6JUtOqGsLmX79J
         NuoyMf98LwyCFTOo8QYVif91WMyKa/4VrGQzP49pOQrqADRR6QDTtPC8dpm4LDBumuIG
         MSzC79PWJdY628bpbAiTYQtwGd7zRPZVKdwpuuBFeV2Uft/qYJhXAH1Lce21BfMEoQ7l
         FAvoauEMozzPOTifbn2pyCo6sNoMP+/0vChCOdwbtm4j5deHoWi44JRJD1VaLfsJvjoB
         13e/PWb0XwHKIAVD5pkquS7VOB3YNeLMHNIUUiG70kWeloVh41fbt/19o1bGQfvY/jmi
         A/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768540353; x=1769145153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TwSqq/+v56oPeVWrmrEqc6uJgezoZscoi3lB/NsrKmo=;
        b=A1Zqm+pSso56LGjde7Btev3dkLT6se1ami6im28CkQWzU5RRV1DA5LRFFovl+TJ0lS
         7++4qfkfRmc18LxELR7c0+niPWRlk5N6c286qBjBOeyQtTs0oO8LR/G3NZ/3JB1iaRaS
         Id7f2CwkLKks8vSNb2/LPNcdEBO+zh9kpwUQzLeN6e2VkTPZIbBRlNHmwFPQ6Vs2WeDR
         TG4fT3g9bfsbbKK3sBxIa2srFu3at26cvf0JRr3NZ5tJrY4uFMhyy5sd8bY2ZWkaIi1g
         0t//JR3I49ntu1aRILW69xA6r8pYPad1vUc7tXbHLX9tFLsRTHnN8QXJc+qBXYqE9c1U
         u55Q==
X-Gm-Message-State: AOJu0YwrzPapAGmZwDy7i+cethiK00J5xwkx3+CeT6ghufNr8qjgzodx
	qUzT+8+oo6WaojQhCrrxIRMifs67GeabBXw3dF22BvePgqyHCkQfuMG0yG+kHgzt2Gv8PVNawKG
	xvCBdkD7tuUEsfdfWT6nZ77Te3/8yXpTdpg==
X-Gm-Gg: AY/fxX6IquFP9sNAejGwkuQt6a77eyL2J5L7lbPBuAOfplacNbUaNi7UWjumtkRXyGs
	XTYuEPPyA/Y/fc5l9YaDRYqP8IWnv3NZgmSx0WWJ1v7dzkGZsEMh8Nkrnq6pDRwx74IAz7kXmtp
	H+Kg/nYp/dAJcVoNgmuS+PFHuWALZytdeBu+3PoFFhr/TNZrZEQKr8OgkNxbm10BJSIlsdJgyBW
	d2igrG3WQywCZGC8o9uPoxhARk+PyhtjkzOU25n5Khg8VGsnYwSvNcS1/OQLazcUHsekZzh
X-Received: by 2002:a05:6808:1899:b0:45a:55e3:b987 with SMTP id
 5614622812f47-45c9c096f91mr1076663b6e.38.1768540353223; Thu, 15 Jan 2026
 21:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20260116050831.2356718-1-yi.zhao@windriver.com>
In-Reply-To: <20260116050831.2356718-1-yi.zhao@windriver.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 16 Jan 2026 18:12:22 +1300
X-Gm-Features: AZwV_QgEEJ_lFR63L3_fFTMlAGJ9dTM_9x7iEIN4XUeXxwCaO2GLFXP8d5szBn8
Message-ID: <CADySD0FimQEAy4K1cjcuvgj7v+b+coa3DARdLVAeSYWixAVTjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] blueprint-compiler: add recipe
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, liuyd.fnst@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 05:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229523

On Fri, Jan 16, 2026 at 6:08=E2=80=AFPM Yi Zhao via lists.openembedded.org
<yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Blueprint-compiler is a markup language and compiler for GTK 4 user
> interfaces.
>
> Move it from meta-openembedded to openembedded-core as it is required by
> epiphany 49.2.
>
> The original author Liu Yiding, is willing to continue maintaining the
> recipe. Add him as maintainer for this.
>
> CC: Liu Yiding <liuyd.fnst@fujitsu.com>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc         |  1 +
>  .../blueprint-compiler_0.18.0.bb                 | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 meta/recipes-gnome/blueprint-compiler/blueprint-compi=
ler_0.18.0.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index e830648945..b231daf485 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -71,6 +71,7 @@ RECIPE_MAINTAINER:pn-binutils-testsuite =3D "Khem Raj <=
raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} =3D "Khem Raj <raj.khe=
m@gmail.com>"
>  RECIPE_MAINTAINER:pn-bison =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-blktrace =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> +RECIPE_MAINTAINER:pn-blueprint-compiler =3D "Liu Yiding <liuyd.fnst@fuji=
tsu.com>"
>  RECIPE_MAINTAINER:pn-bluez5 =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-bmaptool =3D "Trevor Woerner <twoerner@gmail.com>"
>  RECIPE_MAINTAINER:pn-boost =3D "Unassigned <unassigned@yoctoproject.org>=
"
> diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.1=
8.0.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
> new file mode 100644
> index 0000000000..8980d7199c
> --- /dev/null
> +++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "A markup language for GTK user interface files."
> +HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/blueprint-compiler"
> +LICENSE =3D "LGPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539ec061b899bce1d9ce9=
404"
> +
> +SRC_URI =3D "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=3D=
https;branch=3Dmain"

please also include tag=3D{PV} in the SRC_URI

> +SRCREV =3D "07c9c9df9cd1b6b4454ecba21ee58211e9144a4b"
> +
> +inherit meson pkgconfig
> +
> +PACKAGES +=3D "${PN}-python"
> +
> +FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
> +RDEPENDS:${PN}-python =3D "python3-pygobject"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229521): https://lists.openembedded.org/g/openembedde=
d-core/message/229521
> Mute This Topic: https://lists.openembedded.org/mt/117293327/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

