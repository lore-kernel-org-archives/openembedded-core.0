Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.2654.1588036754918742526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 18:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rEFYJpQI;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id h124so3083325qke.11
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 18:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QPLj+/2S9+RarX2jYUZN2DfESHWW9Psq0nfpZuSbhcE=;
        b=rEFYJpQI+V+xlBULrxxmTozSeV0LVV0yKHuAUQh96D+zZhdnA9zqu+AiQ1y40EWVZo
         zBLI/RGYC0m4OxFubS/UIabZ0ztzRcRz4Jg8/gEWuv7VnEdUx+N866yHVALQpvy3THnZ
         bMl7UVJaOMHc/5w3LIGc/XMikmTEoqxtwrykT2PGOWIGZqMJ3/V+kGNozO7jv5Y2wk89
         UDa4JmRnXVJvuIpeif8M/1nmniNNEFjW4Q3SjhClwg8sGychxBhHIUGnUwEsVp5NLXcn
         3zKGa+lltBZzoOQQqXFQUicRHE0pT6EAPX74QMNyDyLuPiegBBNAjtVkoF0EupWKTJSF
         8RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QPLj+/2S9+RarX2jYUZN2DfESHWW9Psq0nfpZuSbhcE=;
        b=mvhhCvT94am9bnYQOSLogc+pkNe1guPh2EqiL/apkeH57xrYr7aSaimWMkrgJAzk4M
         j4tH0ndPvQF9foy/gJFincSlbr3OSKlbNkRfUTlQFLFr+9rspI408vbkNx8e/i/uWJAV
         iYJf2q5GuLIK9Au+20xYLZz+FIOSII8fiVrLQSUInzKl7JnjiMKY6VcfU6a4DkQO6uHv
         OFJH3OmdLBpZTQd61vlPvT+09V5bMTKF/OOpJPBdHZRZ8B/RfMzLXCNzS6rMR6VEz3/6
         esEXk3fC5LcIuXQAm7pCVdCGnzDRGOTRrXAAyGbaUAWQw/9xBRy9xG7E0/ahBSCeMxwG
         PHcw==
X-Gm-Message-State: AGi0Pua8hvmaqUTMACM7oG9FHYYDAlKu/+M0cGGUegr1nz0hDldB6ZPb
	QOaLyPwjwS55Q8kIUrLRWNqZfkC5RK2n1S9ClqM=
X-Google-Smtp-Source: APiQypIHpvEFLfWXjzH1+eF5XYqsQlPXC6O5VbdOaiA+VW2i0DsCnIvl4V5zFU0qHn+X2/KdpGW+9R88NbnF0fzcy3Y=
X-Received: by 2002:a05:620a:4f0:: with SMTP id b16mr13491437qkh.165.1588036753805;
 Mon, 27 Apr 2020 18:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587841042.git.alex.kanavin@gmail.com> <05d961392eb30920f441731f662ba0dd6a6bd5db.1587841042.git.alex.kanavin@gmail.com>
In-Reply-To: <05d961392eb30920f441731f662ba0dd6a6bd5db.1587841042.git.alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 27 Apr 2020 18:18:47 -0700
Message-ID: <CAMKF1sopu5jZ_obZ7Qkt6vzCvaHyvbnSKEdLioTzmo87D7bZYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

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

This change will indicate that a distro that enables openGL for target
needs to have a build machine also with OpenGL support,
this does not sound right to me, If you want to have openGL support on
build host for some testing bits then lets deal with that separately
by
adding a new feature to control it and perhaps it should be machine
specific since I dont see any use of it besides qemu machines.


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
