Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.1955.1619115780030488026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 11:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hpa7Rvkb;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id 1so34584904qtb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6kmV6zTPPxi7A5yNi01Cn5R2Mx3ABQou7S4SO+nXY34=;
        b=hpa7RvkbKteHy8MWyyb5libgzStBq8LxKkWfsI6sG31NxCwIzlM0XVcaMsuBh2WKUU
         Tjm/3bpKb+gddnGHQFj+pFS/no40b/OEzZCTx0mrvo90XacuAaamgHJg1bJlGLVbP2Nf
         0i4GmTeI2Cf5jmmvJfAlGBHPKETbOtEYA2V5twgZTBT/VVZwWFr2FqMsw8mnMEEi7c/m
         AJZEQX8gMny9gojcvMhVdnMtRiiDAUJkOEk93ovFRismj+CogfHY8VrL54xBLzco6TW6
         dpVo1wQfmKb5CNxmC/L5oF+iO5ezD2vcdnxrOxGayRSU2OGdozzF8jelKFCIZxEV3fJf
         21fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6kmV6zTPPxi7A5yNi01Cn5R2Mx3ABQou7S4SO+nXY34=;
        b=IPM9X4cAKr4EjHG182yN0to9o5d7APYf7MEPdQHEyN9cQf+nJwUqXcZAVt85p1K6UF
         HDjsAhVuS1cJAjtwAeHENk4HatqqmlAHBZFq9nQ1HR0204mA9izEIgMHxK1X047H3Ltw
         Aspxawx7m2TgbLYccFS6yUDRxEkjRqCk8L9Z0ahlrX9fVQld6b3HHD5BfoK5p68sJpmW
         8ahbLM78lCVg4zuL3L1q7PNfXFVB7dJd6uR3ZNjFY0zUZguzibGX58r90sZMhNm44LKp
         Pqa2/pj7lfBvPvsou04hW0m+YX9Q/WdRZxS8VtyTru1NoEnlFitJz1Jq46JgNDUKgEDJ
         9+qg==
X-Gm-Message-State: AOAM531nH08bHNzQ9TJjV2ljiEOjT6palr3OZ27DOTGbk/Oizr8bwzmS
	UmLzTK+Nl5+AVY6mvRi3w9KWlV1S0qLwR5ZG0sI=
X-Google-Smtp-Source: ABdhPJyFm1Q486keVKv75FIdd4JI6APgdUgOOimB3K4XqS09aMQJu2sObJlVEx015G2QzqtB5slq0UzA4s51TYcD8H4=
X-Received: by 2002:ac8:5cc4:: with SMTP id s4mr4408781qta.214.1619115778998;
 Thu, 22 Apr 2021 11:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210419090224.582794-1-alex.kanavin@gmail.com> <20210419090224.582794-2-alex.kanavin@gmail.com>
In-Reply-To: <20210419090224.582794-2-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Apr 2021 11:22:33 -0700
Message-ID: <CAMKF1sp28bZmTCm9obLskD1-ofGugOY5bt+qh90n4qQr0RO35A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] weston: use standalone xwayland instead of outdated xserver-xorg version
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 19, 2021 at 2:02 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-graphics/wayland/weston_9.0.0.bb       | 2 +-
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
> index 50fbfa613b..34ac66d4e9 100644
> --- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
> @@ -124,7 +124,7 @@ SUMMARY_libweston-${WESTON_MAJOR_VERSION} = "Helper library for implementing 'wa
>  FILES_${PN}-examples = "${bindir}/*"
>
>  FILES_${PN}-xwayland = "${libdir}/libweston-${WESTON_MAJOR_VERSION}/xwayland.so"
> -RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
> +RDEPENDS_${PN}-xwayland += "xwayland"

this patch causes weston to not start with sysvinit since xwayland.so
plugin is no longer available, I have sent a follow up
to fix this fallout.

>
>  RDEPENDS_${PN} += "xkeyboard-config"
>  RRECOMMENDS_${PN} = "weston-init liberation-fonts"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index b3e03744c0..da025171db 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -122,7 +122,6 @@ EXTRA_OECONF += "--with-fop=no \
>  OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
>  PACKAGECONFIG ??= "dga dri2 udev ${XORG_CRYPTO} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'xwayland', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-logind', '', d)} \
>  "
>
> --
> 2.30.2
>
>
> 
>
