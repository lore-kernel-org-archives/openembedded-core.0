Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B52C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 11:25:37 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.18621.1713180333936117432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 04:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Op6oNsUe;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2da0f8f7b24so22519811fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713180332; x=1713785132; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8jpvPU9lRnjSD7MroxHnKdLAguK307BXiIwq4FdO2o=;
        b=Op6oNsUej405EwJA9sAgSYCpBkgvVElH8mzppH4vl9rP/Nw13gzd13yKrBmqMxK/IY
         kdUonFQiSf4k2qr5L1uR2vmweqEN0AP1SzqbveJq9tcT7a1uXZkOElgDouOuq2qOgslY
         LvkkjURHapNOeg2BfRROkVzwzSNzrdwCTfRCDbgqxlEjHMHT5K8km/fq6X0nH5Vptzny
         DrZs/zALVRXSKh8C/VZw1hjw4pRojK9iMrAi6tRimSo1JXI+TM654AmjHEkoSdeG2Y7N
         ju/GH1FeRSk2rz4MDi9DrVljPSjONYV4sRVPLATYQAblCaYpF/LU+mCcrQWkKfCq7YZD
         elTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713180332; x=1713785132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8jpvPU9lRnjSD7MroxHnKdLAguK307BXiIwq4FdO2o=;
        b=qLvrWNM8YJXkc9YcO8CzLcJTfw36sbG8gix/bakDI47yprq3BI3qDoUJkdlG9nX9Fa
         WT4a4CmGY1kwykN+oPlLMd4dAuZOFLMBJujnvBYMRV9kUs2rwOFnPshU3Rf/Po1f/AoC
         o2izArEHJowN2ufKmoHxgKSySCfcF8VUxBE8EAOy4JBXn0ShaQEU2TY0fkoCvsM+oI8g
         I3GLXYGPbKS1Xt7v9pV5oKTRSDxoXhJG1ZY9JsZFX+xy5dEuJa3FaEwdzUeOBegzy8vI
         mWG6hBCckjZjogNp7iUdtr2nKbBmwOX1PsXTlBQ8Ic+ZmbMhz7/3LjdzEWYPr4ozkUVo
         SG+A==
X-Gm-Message-State: AOJu0YylMAt15fBFq8InBPnTiklrb9Ke01n+OgimXJ1qEQLiTcJAj2Sx
	/+b15JRmpu2MsvY4iX8r2b+Cu3BU3lg6doC6IIswBIpV7pP/LpxYkDGDAq5+h7+Ur1HcHHQrlbL
	ZzNKZ9xjbEOhkxda7jhjzX6DZSb4=
X-Google-Smtp-Source: AGHT+IHQd6d+ghi0MHMxHjAa3ey9eYKTurDnHj8krz+PnApPjQWIZvHvKdTRa5aP3Au5H9fUCpsP99/rwfJc5P96Ehk=
X-Received: by 2002:a2e:a308:0:b0:2d8:6097:abf7 with SMTP id
 l8-20020a2ea308000000b002d86097abf7mr2232770lje.21.1713180331885; Mon, 15 Apr
 2024 04:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <17C66EFC7A908A1D.10598@lists.openembedded.org> <YKDZBS.QFD0S4Q09SWT@t-online.de>
In-Reply-To: <YKDZBS.QFD0S4Q09SWT@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Apr 2024 13:25:20 +0200
Message-ID: <CANNYZj_8mwSFRf42_BkUv_=b_49vm6P0kKnELw+1fY48Mb=2aA@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCHv2 1/2] libei: import recipe from meta-oe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 11:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198233

Wait. Something doesn't compute here. Where is the libei dependency
introduced in commit history? I'm not seeing it:

https://gitlab.freedesktop.org/xorg/xserver/-/commits/xwayland-23.2

Alex


On Mon, 15 Apr 2024 at 13:07, Markus Volk <f_l_k@t-online.de> wrote:
>
> One thing I have just seen. If not using systemd the libei recipe will de=
pend on the external sd-bus library 'basu' which
> is also not available in oe-core. How do you want to deal with this?
>
> Also include basu or make this recipe systemd only by default?
>
>
> On Mon, Apr 15 2024 at 12:59:10 PM +02:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> Libei has been the multi-year effort by Red Hat's Peter Hutterer on emula=
ted input handling for Wayland. Libei consists of a client side library and=
 EIS as the "Emulated Input Server" for this Wayland-focused emulated input=
 device solution. Signed-off-by: Markus Volk <f_l_k@t-online.de> --- meta/r=
ecipes-graphics/wayland/libei_1.2.1.bb | 25 ++++++++++++++++++++ 1 file cha=
nged, 25 insertions(+) create mode 100644 meta/recipes-graphics/wayland/lib=
ei_1.2.1.bb diff --git a/meta/recipes-graphics/wayland/libei_1.2.1.bb b/met=
a/recipes-graphics/wayland/libei_1.2.1.bb new file mode 100644 index 000000=
0000..807dcea1ed --- /dev/null +++ b/meta/recipes-graphics/wayland/libei_1.=
2.1.bb @@ -0,0 +1,25 @@ +SUMMARY =3D "libei is a library for Emulated Input=
, primarily aimed at the Wayland stack." +HOMEPAGE =3D "https://gitlab.free=
desktop.org/libinput/libei" +SECTION =3D "graphics" +LICENSE =3D "MIT" + +L=
IC_FILES_CHKSUM =3D "file://COPYING;md5=3Da98fa76460f96f41696611d6f07e8d49"=
 + +DEPENDS =3D " \ + libxkbcommon \ + libevdev \ + libxslt-native \ + pyth=
on3-attrs-native \ + python3-jinja2-native \ + ${@bb.utils.contains('DISTRO=
_FEATURES', 'systemd', 'systemd', 'basu', d)} \ +" + +SRC_URI =3D "git://gi=
tlab.freedesktop.org/libinput/libei.git;protocol=3Dhttps;branch=3Dmain" + +=
S =3D "${WORKDIR}/git" +SRCREV =3D "08f1d41085a6ae4bac7bc52abe2955d3354342c=
b" + +inherit meson pkgconfig + +EXTRA_OEMESON =3D "-Dtests=3Ddisabled" +
> --
> 2.44.0
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#198228): https://lists.openemb=
edded.org/g/openembedded-core/message/198228 Mute This Topic: https://lists=
.openembedded.org/mt/105533281/3618223 Group Owner: openembedded-core+owner=
@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/opene=
mbedded-core/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-

