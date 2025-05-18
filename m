Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0DAC3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 17:41:46 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.34431.1747590103248609461
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 10:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fZillMd0;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-550ee1cb0a3so2793208e87.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 10:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747590101; x=1748194901; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFy0U7SW7cJHiur6HSEPX0QVE0oIZLRDfkT9hYnPZkU=;
        b=fZillMd0JqEqBMLWV5Ds+gcvfq3cKlqyspR5p0fBBLjxFZegTuO3OLVmA0qUwhgel+
         ZztAwOiamerE4xSG61Qk6jI/m7A+jqmoiwjpv7RjRcaDCwmSEfyw/cTW/kep/8guy9O0
         5u2F6jDSxHP7J2DVK2a6wVZCmgEY4i3W/XJlaYRvGG3AOfHRYU7gx44Oy2BgZZhNK76D
         eEAgxvcmb8GHKOmdzdEPCjC0sfS9DMBhm/dbCNMwCOFEhjJ9TNmuwvkF+b/IlGmE1Xfa
         NoYuE8zlda/zQKercb+w3US6UqTwl5TrLEHcqP3BeCPyjwzv7e8m8g60IVAO5A2DDr9K
         pnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747590101; x=1748194901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFy0U7SW7cJHiur6HSEPX0QVE0oIZLRDfkT9hYnPZkU=;
        b=Wb0EJpG+b0/0pTfRH9IrGgbm/KkQtSj6qB4+n4n5pn1c39w3tMMceWdRo4r+XYDB9D
         X3o0R5NKqFVEwUtiBOh6cZk7v3icaVhuUspLVk+DRxeZH2YIqaSd5UHS8RIZzM0gPKwA
         pHgBNNFOM6AW3fn9qCKI9vmanod569ybDVXOMjdcEIkXI4rN9MZdO69mzCH5owI/1sEU
         5YBdIMLMZuoHZbGFRgztgHVe16r/2znRyd0Sl3+sTFooKMVuu4Jlcsll7b3K8iqHk2Oy
         fb1dEoLlav/0YFb5gowVmbsDdaa48T8bynMkKRKXMWoP+/BXRknnJ/8RZjsMovIf6xj2
         xnPw==
X-Gm-Message-State: AOJu0YwdNMmzlMHe+E4ee5akY/Gi6fY/+MJY0TePDO1X3jIMldArysNm
	+MT5HOmnYDsGFoWrJmfAkfjp22ZkPeBbCazku2/gbAXgiJUxhnNV+sOPks/UfCHW1TpMnWOQZ36
	wUAjWBaC7wMV245y/M2xV7KBWX+K3//w=
X-Gm-Gg: ASbGncuYjtkkyFY5r72ufN4NXHh0rw5PvkMBvcuc21Hfy5V3SV3TGa7KkGdUz6VO4e6
	q6N+HwA8m/XAmVOOfvXNH9Y4H9fRBXbFUggTKTJB1FMHlhuBLniMODVpGDdOOA0x1jXlC4Et88L
	NWMl3uBRU2bzpCRGPU6WgxV7u9V7T3DA94ixCF2AozVLRhMQ==
X-Google-Smtp-Source: AGHT+IGyUoKPqReO/kWZ2Hnhac6zwKiBZHBrD75urmscJ6TjzbJI4vIMU4kltzeHFDBmMaP4isx6JAYutdi6h5BgLgI=
X-Received: by 2002:a05:6512:670e:b0:54f:cc0b:158f with SMTP id
 2adb3069b0e04-550e7222314mr2729327e87.40.1747590101061; Sun, 18 May 2025
 10:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250518161010.1879511-1-f_l_k@t-online.de>
In-Reply-To: <20250518161010.1879511-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 18 May 2025 19:41:27 +0200
X-Gm-Features: AX0GCFumoxoN2BbD2a6XFP3cCPDoNmCMkHPyUcpcP6lMhRd-dw6skUfUqBlKeqM
Message-ID: <CA+chaQdCGhrx5NJUuo_4PCz6-x9x8-YMnme1SSYnqoOA4i_6gQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/2] mesa: update 25.0.5 -> 25.1.0
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 17:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216781

On Sun, May 18, 2025 at 6:10=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> - drop two merged patches
> - clover frontend is always compiled, even if not enabled
>   clover is deprecated and was removed in master branch
>   add a patch to fix that
> - install gbm_backend_abi.h
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
....
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 288027bbb9..47edf0d512 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -17,13 +17,11 @@ PE =3D "2"
>  SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
>             file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch \
> -           file://0001-mesa-clc-add-an-option-to-force-inclusion-of-Open=
CL-.patch \
> -           file://0001-clover-Don-t-include-libclc-headers.patch \
> -           file://0001-gallium-clover-Do-not-use-LLVM_LIBRARY_DIR-for-FA=
LLB.patch \
> +           file://0001-dont-build-clover-frontend.patch \
>  "
>
> -SRC_URI[sha256sum] =3D "c0d245dea0aa4b49f74b3d474b16542e4a8799791cd33d67=
6c69f650ad4378d0"
> -PV =3D "25.0.5"
> +SRC_URI[sha256sum] =3D "b1c45888969ee5df997e2542654f735ab1b772924b442f30=
16d2293414c99c14"
> +PV =3D "25.1.0"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>
> @@ -343,7 +341,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}=
/drirc.d"
>  FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpow=
ervr_rogue.so ${datadir}/vulkan"
>  FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
>  FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendo=
r.d"
> -FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
> +FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so ${include=
dir}/gbm_backend_abi.h"
>  FILES:libgallium =3D "${libdir}/libgallium-*.so"
>  FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
>  FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"

Is there a reason for gbm_backend_abi.h to be packaged in libgbm
instead of -dev package?

