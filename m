Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.11373.1605216176612793386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 13:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qG7Knf1L;
 spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id i6so10680160lfd.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 13:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SgdXcr506wOQiwZ1aXa03Gq0agzDjpm5ugkHWgXK5bc=;
        b=qG7Knf1LeeunbnPt0eRKeO45J+pgDb4jB6OmNJhDgyNE0RTojIKaoZHyMiWdu152gf
         lLW6ymN/iRL8GyWU96M1kJHKmVAghJRtS00Lj7Rm4flYWbg2cH22a4dvlgNJ6iRlQNSk
         MBm+vn/NwWsoV0bgyfemLzeKooP1FK3qSt//IqksvDTCF0u/pq5+tN4oQ9soLhtPWe9n
         sueab9Gypx8jKTJy8812h+c/NP8EEC7GG5YGD4uZPmt6fYYu8ZWySZdakyF0O4OhvzER
         gCcjcpOaFrtAYKgz1NB2mmk6DBSPuuwlXFy2V4Ugh+y/uSYMPdgXDcaAUm3iU39Cimbx
         1pWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SgdXcr506wOQiwZ1aXa03Gq0agzDjpm5ugkHWgXK5bc=;
        b=jYEYGsE8L5a6K9mdc3ECwDwCPW73UwuR0UVvXexqnYBCa8h+fkbW6guU+IDBluTgmv
         FPLUEMOg+ew9a0SINNk0f25k4pbjlQQCuet9Mw/Qv70No9bJ15W9evv/Onz6dUqoq8O9
         RwRSLbY3vfEaGSk+shkTIGoyAl/PfEHMX+GMu1fFQtsB/rKiTgo9nPzRx+W/YTOCak+K
         sXqrG6nNecYJBwBWV56Hczt9qtCl/Uji/hYK+gMm45OpZIE/lm7w0GXRJ6sqcD/Vvubi
         MdIK/qbsHB+moi2JWK1EQrDGDWBxwe2D7Glo92U7stBz+eSId4xyPzKo7n+0EyUuC9m3
         Qr7A==
X-Gm-Message-State: AOAM531Bn1+TzrSEtUs7kbwy9ThE4ITGiePTCQYHHO04CO5gmrPN6TIR
	Vh+vx3vR9q4dSyCAffoJbfalamIFjU3AMceMUUA=
X-Google-Smtp-Source: ABdhPJypvPJg3kyDq4Ig462UQwFlQHkgiNBdQx6O4fOoaX4VMDg7DmtN9JhsBdhvuiM0f/RwxBUD7Z6SBQIvqzIcMJ8=
X-Received: by 2002:a19:c609:: with SMTP id w9mr547216lff.297.1605216174671;
 Thu, 12 Nov 2020 13:22:54 -0800 (PST)
MIME-Version: 1.0
References: <20201105203820.19558-1-tom.hochstein@nxp.com>
In-Reply-To: <20201105203820.19558-1-tom.hochstein@nxp.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Thu, 12 Nov 2020 22:22:43 +0100
Message-ID: <CAHtQpK5zznC3PsgUey+pL0sn+WoYuhgng4-uhWg+RYT20_QYKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Add xcb-fixes to loader when using x11 and dri3
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 5, 2020 at 9:39 PM Tom Hochstein <tom.hochstein@nxp.com> wrote:
>
> Backport fix for undefined symbol for xcb_xfixes_create_region in loader_dri3_helper.c.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc           |  1 +
>  ...xes-to-loader-when-using-x11-and-dri.patch | 36 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/mesa/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 15f54c5acd..246ed936e7 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -21,6 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>             file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
> +           file://0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch \
>             "
>
>  SRC_URI[sha256sum] = "d1a46d9a3f291bc0e0374600bdcb59844fa3eafaa50398e472a36fc65fd0244a"
> diff --git a/meta/recipes-graphics/mesa/mesa/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch b/meta/recipes-graphics/mesa/mesa/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
> new file mode 100644
> index 0000000000..9ee72880a2
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch

I believe all patch files are located in `files` folder, while this
patch tries to put it into `mesa` folder which does not exist yet? Is
it intended here?

> @@ -0,0 +1,36 @@
> +From cf17d6251653f4a98e7c4f904ea2f0bc0ecedd5c Mon Sep 17 00:00:00 2001
> +From: Duncan Hopkins <duncan@duncanhopkins.me.uk>
> +Date: Thu, 15 Oct 2020 12:14:57 +0100
> +Subject: [PATCH] meson: Add xcb-fixes to loader when using x11 and dri3. Fixes
> + undefined symbol for xcb_xfixes_create_region in loader_dri3_helper.c
> +
> +loader_dr3_helper.c uses xcb_xfixes_create_region() that requires dep_xcb_xfixes to link. This is dependent on with_platform_x11 and with_dri3.
> +But the source meson file does not set this up dependent on with_dri3.
> +The build was initialsed using platforms=x11 and gallium-drivers=zink,swrast.
> +
> +Reviewed-by: Eric Anholt <eric@anholt.net>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/7164>
> +
> +Upstream-Status: Backport [cf17d6251653f4a98e7c4f904ea2f0bc0ecedd5c]
> +
> +---
> + meson.build | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index cfe02fa6373..3cb3c904927 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1782,7 +1782,8 @@ if with_platform_x11
> +       dep_xxf86vm = dependency('xxf86vm')
> +     endif
> +   endif
> +-  if (with_egl or (
> ++  if (with_egl or
> ++      with_dri3 or (
> +       with_gallium_vdpau or with_gallium_xvmc or with_gallium_xa or
> +       with_gallium_omx != 'disabled'))
> +     dep_xcb_xfixes = dependency('xcb-xfixes')
> +--
> +2.17.1
> +
> --
> 2.17.1
>
>
> 
>


-- 
Regards,
Andrey.
