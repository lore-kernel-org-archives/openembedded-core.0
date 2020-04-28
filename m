Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.2427.1588035826653262028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 18:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YESE/+o8;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id o135so7806312qke.6
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 18:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=81ulxVeSvnEeiw9x88dILRiD7Fz7stV37E8AGv5Uwh8=;
        b=YESE/+o8LdqSevO9FHcYLm8zEnSqyCjq/z9lhVJ9rxCdGkJwqwmljfiMbLbbNwe7l3
         9ovVg2SqL3+EUeE1fRF1c3hufbpaK/Z0zTQ9lvumz0bpxvOc0OavDb/HLgVxsYAxLxPR
         bId2txN6CMZiBrALwy8+wdiY5v0mdwa4MtkyUA42MiC5t0i2RigETkZ+LZgdVZ2FEdes
         ga9gOnP7sHA5v7IL/JpWwWeUyH7EMo6wKRn/di+5cBSUAu2b9ia6AN193ceevypHF+fg
         IL6Efoqwd/LukXdSFVXLYZGAhubX5vc9wnsu12DfiYgqPEX6tFMFGLG8nMtcwf0JUnkf
         xeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=81ulxVeSvnEeiw9x88dILRiD7Fz7stV37E8AGv5Uwh8=;
        b=gN2xhdTSUJgQMppii90q4nfGxAFpvJ66CC+fprBTDV5RBPiZ08/oweZQJy93t4PiED
         8a8nVCNoIwX9PmM8y5Bb9qUKi7bp04UiUhSSJuGOPO7nrxTLJknWg/u2PyaRJrDuv8Dl
         qPijSYepO327uWyh1L9M7pI7wmjdfcmPPLEI3gesezFodFD0/CDHscdA7DvTaJ/h+vIn
         U3MetaOOmHOPRIAaq8/dxjFncmTBlwH9okwuE7qAR80qbZ1YqSCbXulniu8Vt7gf6tKm
         IhZQS9v4vDJHeVsp979O2xztDFYMZv1gAWJ4l9Q/lY9Wxzyo5IVkmqFg0R4BE44LECNF
         BFzA==
X-Gm-Message-State: AGi0PuZdN3inX5K38J3pF6dTYrdpklmgJhyYZg2bpqVRKUzLZKx31qbd
	jx2dlACJe5CM8pO3aqfxCOdWBVdLhP0Irx8l+UM=
X-Google-Smtp-Source: APiQypKHo/BFBDnLJHgAeQRgsgtAhMHZeBusXyg/Ic74KmuElSsiL2nnBkjdQHlIdX/n5z9eiwRDeHE6TTFUNOw5LjA=
X-Received: by 2002:a05:620a:4f0:: with SMTP id b16mr13435998qkh.165.1588035825612;
 Mon, 27 Apr 2020 18:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587841042.git.alex.kanavin@gmail.com> <05d961392eb30920f441731f662ba0dd6a6bd5db.1587841042.git.alex.kanavin@gmail.com>
In-Reply-To: <05d961392eb30920f441731f662ba0dd6a6bd5db.1587841042.git.alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 27 Apr 2020 18:03:19 -0700
Message-ID: <CAMKF1sqcE5Q=NiXaK+ZE1MnR3BwhCzfaFo3f-neLWQK9fT_Kkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This causes

https://errors.yoctoproject.org/Errors/Details/409117/
https://errors.yoctoproject.org/Errors/Details/409060/

for most of qemu machines.

On Sat, Apr 25, 2020 at 12:00 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This will allow better control over native virgl/qemu configurations.
>
> Adjust gtk+3/cairo native configurations to actually ignore opengl
> when building for -native: we do not need it, and it would cause build
> failures as only a limited subset of mesa-native is currently built.
>
> Drop native/nativesdk overrides from virglrenderer/libepoxy recipes
> as opengl feature is now correctly set for those variants.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/bitbake.conf                                     | 4 ++--
>  meta/recipes-gnome/gtk+/gtk+3.inc                          | 2 ++
>  meta/recipes-graphics/cairo/cairo_1.16.0.bb                | 2 ++
>  meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb           | 2 --
>  meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 --
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 4b544a22cd..6f3536eff4 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -829,8 +829,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
>
>  # Normally target distro features will not be applied to native builds:
>  # Native distro features on this list will use the target feature value
> -DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
> -DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
> +DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
> +DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"
>
>  DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
>  MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
> index 5d1f59ea1a..6154154004 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -46,6 +46,8 @@ do_compile_prepend() {
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayland x11', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)}"
> +PACKAGECONFIG_class-native = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>
>  PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
>  # this is provided by oe-core patch that removes epoxy/gl dependency from a X11 build
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> index b772c2ece2..092c77b826 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> @@ -42,6 +42,8 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
>                     trace"
> +PACKAGECONFIG_class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
> +PACKAGECONFIG_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
>
>  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
>  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> index af9867407e..1aa850d004 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> @@ -19,8 +19,6 @@ UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
>  inherit meson pkgconfig features_check
>
>  REQUIRED_DISTRO_FEATURES = "opengl"
> -REQUIRED_DISTRO_FEATURES_class-native = ""
> -REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
>
>  PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
>  PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no -Dx11=false, virtual/libx11 virtual/libgl"
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> index 1046b8504f..29b12628d0 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> @@ -22,5 +22,3 @@ inherit meson pkgconfig features_check
>  BBCLASSEXTEND = "native nativesdk"
>
>  REQUIRED_DISTRO_FEATURES = "opengl"
> -REQUIRED_DISTRO_FEATURES_class-native = ""
> -REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
> --
> 2.26.1
>
> 
