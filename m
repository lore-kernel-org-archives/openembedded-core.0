Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.1151.1615506530621304101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 15:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iqNdGJ0C;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id 6so2532694qty.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 15:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C55+fmntIwwMrDoeZ6ZmEVMJ7tw+OtCuC/B/ARaMEsw=;
        b=iqNdGJ0CSGgWzC+K59BUYTaelmzM50QxP7mvHDgp1vh2EZaJTMtaxuP+OBggAOqO/u
         v6EH9pGIPV8r1fOOmG7ZPFxNkar9Xuwjm+H60yAjnAYP7ugSGviS9ZI8AZ0k1Z74p4O3
         hQtsCxXcw+qOHlQRlGJIjiuyTkODjF6K/kUAUADpk7r4+InGN8qZ8zMj4MFtBnZ+W0Ma
         MVI137mXfGTzSy0Jy3okLtdc23PqWY+q0J+p21NnVrRMOmOYXjyrdFHf3cGE1E5i+75N
         /5M/dQZL5zfleW2BorwZI6BK9q/25RDp1+dvVVp/A7mixlXkKZiQD/GCTrGG6XFNXZQL
         gf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C55+fmntIwwMrDoeZ6ZmEVMJ7tw+OtCuC/B/ARaMEsw=;
        b=kbcu6tW+Az35ik6GEFRxo08/3vJ5Asgbsad5HkWNB5I1bsSqKpJS395/pPiij/hEnf
         v32c5GOlACOXg2PdCMieN9k0RPWFxtczsQbL89gdS5hWWzU8sgIweHsNoW95xg7SkA6J
         UayojLtd6aTnQLY6GqIu6qRT7/cUQcPJEI5hGor6lB45oR26SxM9ILjxlmcCbFHPmPmd
         qZdFNgc5U8OyA6HF1VyJEE3hrz/JPxVUTL0dduv+n5pDkmuqW1FCIWEuJq7ylGWo5xF3
         mswtkAl5lTc/AQeXbfN00N1Oxlg/AHCpt0py65kSWWIrhx2DbS67dIMcGWnaR+K8I+Wi
         usWg==
X-Gm-Message-State: AOAM531F6CeBMFyk3NSskqbPtoDe435NQLlKQEijWmlBHwREdvQWSrx/
	Ypa1u11LuzT7kwi5xBK/g+h3aQUzSF08Bk/6B2c=
X-Google-Smtp-Source: ABdhPJww19MMyzAUQa7ao934jFCcPwW9PXLL+tCAo72kFKLz6f3SFBdDvLtfwGNKj1fCBImseqXBjfsdpeowWrprVTM=
X-Received: by 2002:ac8:4b6d:: with SMTP id g13mr9632877qts.369.1615506529640;
 Thu, 11 Mar 2021 15:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20210311120512.287214-1-alex.kanavin@gmail.com>
In-Reply-To: <20210311120512.287214-1-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Mar 2021 15:48:23 -0800
Message-ID: <CAMKF1spZ5tYHOVeyPV7xb+KNkdyh5QUgD=UQP9Yaj8VaRH7wpA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/2] xwayland: add a standalone recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 4:05 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Please see here for the rationale for splitting XWayland out of
> main xserver-xorg tree:
> https://fedoraproject.org/wiki/Changes/XwaylandStandalone
>

I think this is a good change. Should we disable xwayland
packageconfig in xserver-xorg recipe as well
since I see that it gets activated with opengl wayland being in distro features.
so I wonder if we can completely turn it off

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../xwayland/xwayland_21.0.99.902.bb          | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta/recipes-graphics/xwayland/xwayland_21.0.99.902.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 9093f2d7fd..d507c70091 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -797,6 +797,7 @@ RECIPE_MAINTAINER_pn-xset = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-xtrans = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-xuser-account = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster808@gmail.com>"
> +RECIPE_MAINTAINER_pn-xwayland = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denis@denix.org>"
> diff --git a/meta/recipes-graphics/xwayland/xwayland_21.0.99.902.bb b/meta/recipes-graphics/xwayland/xwayland_21.0.99.902.bb
> new file mode 100644
> index 0000000000..75daa71902
> --- /dev/null
> +++ b/meta/recipes-graphics/xwayland/xwayland_21.0.99.902.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "XWayland is an X Server that runs under Wayland."
> +DESCRIPTION = "XWayland is an X Server running as a Wayland client, \
> +and thus is capable of displaying native X11 client applications in a \
> +Wayland compositor environment. The goal of XWayland is to facilitate \
> +the transition from X Window System to Wayland environments, providing \
> +a way to run unported applications in the meantime."
> +HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
> +
> +LICENSE = "MIT-X"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
> +
> +SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
> +SRC_URI[sha256sum] = "799491dd99cb2c6dbdf05162441d0469a2a9b36e089755eb59729dd38f44adce"
> +
> +inherit meson
> +
> +DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy"
> +
> +FILES_${PN} += "${libdir}/xorg/protocol.txt"
> --
> 2.29.2
>
>
> 
>
