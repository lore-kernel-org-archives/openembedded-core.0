Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03A9C4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 13:40:00 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.54587.1699277994668037504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 05:39:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ehm+sR9h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.172, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c6efcef4eeso54348311fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 05:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699277993; x=1699882793; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LFqIeYjurBbOJ5VrSG0JswdTvlJX7wU2evg4aD/wrlM=;
        b=Ehm+sR9h1W7jcG5XhlNLZBU6Gfha5dQ8086Pwu48dBsCNzFavGiNNMUjCROiMexEVc
         geqFFDy1YD2Rlwo4DEKP8KQ/2z8tBpu745YDIMHk+YNeJUT5vo5oKNRLD96eDrPH1L7L
         oN1UavPBDtMoMxy6EN+3EFwtDtHfmZt+kFmR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699277993; x=1699882793;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LFqIeYjurBbOJ5VrSG0JswdTvlJX7wU2evg4aD/wrlM=;
        b=mvOtfY/K1MnBYalhRJh5l9JKoQZZiHsHDyv5tTNXKy7pG0uVLGxyMgxJkhg/5BdUkj
         oOFFnxHJ3PiGJ90Mu5s2YVsYiG1Z8RVevCQ0Oq8w6E0dtI/uxH4rcln/5sE1QOsWNy0P
         vv9XugsKM5pF46l6Onm616IImAbL1fuUX0lqcDj4oGkIUYqK5ACUDWFqvBoh1pCoQ1dj
         Yd+V9ty8kGSvReb7mSLYCU/t9eXNev0QysJMxmMj2GAqdUv3gb1+kRXsrKqVQwqXZr8C
         a1dNARCy78j53YOaIcG4n/7WDRbD80GNcPHXiInMUlWu6Ay/dbcxiAWlUnWdwBSX8gdT
         IxJQ==
X-Gm-Message-State: AOJu0Yy8gn63P5wyonh6h1MXZOD/3ILW7OfG2pC9mIJVfLCI+WdBRdz6
	hPCOUCYXig3SIY9Fa7KaXNJPPw==
X-Google-Smtp-Source: AGHT+IEsh5Zg5f2tvYd7folzY3F0nq0yBsmBC30Lcs4QeHRuEGrH4cyJkMCAshkpIttUTV4aQUS4VA==
X-Received: by 2002:a2e:86c4:0:b0:2b9:f27f:e491 with SMTP id n4-20020a2e86c4000000b002b9f27fe491mr23825364ljj.42.1699277992831;
        Mon, 06 Nov 2023 05:39:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ccc:c310:74c7:1597? ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c419600b00401d8181f8bsm11950512wmh.25.2023.11.06.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 05:39:52 -0800 (PST)
Message-ID: <71b30900fc4937e1d70a72c0423196d6e1daa21b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8 2/8] cmake.bbclass: support qemu
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Mon, 06 Nov 2023 13:39:51 +0000
In-Reply-To: <20231101110129.647878-3-adrian.freihofer@siemens.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-3-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 13:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190216

On Wed, 2023-11-01 at 12:01 +0100, Adrian Freihofer wrote:
> Define the CMAKE_CROSSCOMPILING_EMULATOR variable similar to what the
> meson bbclass does. This allows for example to execute cross compilied
> unit tests on the build machine.
>=20
> CMAKE_CROSSCOMPILING_EMULATOR is a semi colon separated list of
> paramters which could directly handle the -L and the -E parameters.
> Creating a wrapper script is not absolutely mandatory. But anyway lets
> do it similar to what the meson.bbclass does and also disable pseudo.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes-recipe/cmake.bbclass | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmak=
e.bbclass
> index d978b889440..911c237a3fd 100644
> --- a/meta/classes-recipe/cmake.bbclass
> +++ b/meta/classes-recipe/cmake.bbclass
> @@ -4,6 +4,13 @@
>  # SPDX-License-Identifier: MIT
>  #
> =20
> +inherit qemu
> +
> +EXEWRAPPER_ENABLED:class-native =3D "False"
> +EXEWRAPPER_ENABLED:class-nativesdk =3D "False"
> +EXEWRAPPER_ENABLED ?=3D "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-=
usermode', 'True', 'False', d)}"
> +DEPENDS:append =3D "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') =
=3D=3D 'True' else ''}"
> +
>  # Path to the CMake file to process.
>  OECMAKE_SOURCEPATH ??=3D "${S}"
> =20
> @@ -156,6 +163,19 @@ EOF
> =20
>  addtask generate_toolchain_file after do_patch before do_configure
> =20
> +cmake_do_generate_toolchain_file:append:class-target() {
> +    if [ "${EXEWRAPPER_ENABLED}" =3D "True" ]; then
> +        # Write out a qemu wrapper that will be used as exe_wrapper so t=
hat camake
> +        # can run target helper binaries through that. This also allows =
to execute ctest.
> +        qemu_binary=3D"${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}',=
 ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
> +        echo "#!/bin/sh" > "${WORKDIR}/cmake-qemuwrapper"
> +        echo "$qemu_binary \"\$@\"" >> "${WORKDIR}/cmake-qemuwrapper"
> +        chmod +x "${WORKDIR}/cmake-qemuwrapper"
> +        echo "set( CMAKE_CROSSCOMPILING_EMULATOR ${WORKDIR}/cmake-qemuwr=
apper)" \
> +          >> ${WORKDIR}/toolchain.cmake
> +    fi
> +}
> +
>  CONFIGURE_FILES =3D "CMakeLists.txt *.cmake"
> =20
>  do_configure[cleandirs] =3D "${@d.getVar('B') if d.getVar('S') !=3D d.ge=
tVar('B') else ''}"

We've tried very hard historically to avoid needing qemu usermode. It
has crept in, first because gobject introspection required it and more
recently, meson but that isn't a reason to encourage it.

I'm a bit reluctant to put this in the cmake class itself as it makes
it seem like it is part of the normal best practise and it really
isn't. I'd suggest a cmake-qemu class which people can use if they
really need this.

The reason is that some architectures/platorms don't work under qemu.
Even x86-64 didn't with certain more recent CPU optimisations until
surprisingly recently.

Cheers,

Richard







