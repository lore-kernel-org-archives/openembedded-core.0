Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.59438.1595866462736651051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 09:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ChXiC/EV;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id y18so5139683ilp.10
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 09:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gJ5JFZuXnI4uv7Z4EWwcoVaBJJa7dbKni37sGDIOmbI=;
        b=ChXiC/EVa+pY8BmwBTKJEjIFcdIlvJrxN4X/OO6LJt/2E7haC2+kgaNZdCyxbLocJy
         za1bw7q0puv0U4JV4sgeRydcL55oq0To+3unKcfH7zqcs2lMfthr9Dx6tPwJMmuNi+el
         pRNf/ROnMI1o7hvu43Ad7pvDGEEeEzW5mt34ubDXOMxxsheDgt0eJPIybWuiJn3Fnq8V
         uL6ORTdINv5AD1hsesiIi05/9tdLr+n0xywXQGauDGdKODjkxel8DHatB09FdfoGQPTR
         vC1jACzDLMzyGDjcdzlEqiWy4BoKAGJ3LZypClEDWBajxKS4bDADcTI831kYoCOSqtTP
         ucMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gJ5JFZuXnI4uv7Z4EWwcoVaBJJa7dbKni37sGDIOmbI=;
        b=jrHjiM4Zgbr3clTj7fDd+WVpMR1MsdN7AETgIwPFPkUUree8j6infQt0F9K8Oe9mwP
         GciCOpMmx7GYLrEWg+qxuER2jGW8EgJZB4YwFAXi3ImSUwdRfAA08LFk7+1Jd4/que1k
         z1gpoEQ7zY7rJsI4sueHyPY2OLTyrsjM3EJcweYOEjBdn7Cmd1l2vuD8/tTvPjt833Xs
         oVe1kbIcCLk/H7H7xivWfemSYH2Xd6SrxUuwhtkqznsQDqor/Jq6w7X+rVgiIuossss1
         uv4LhlbI/JQwSqWyD7xUsqtbtbrTGgaLAtr6mKZJSBp4o9IJBQpfbbyzQYvRq6xo4uKR
         TBYA==
X-Gm-Message-State: AOAM531CoUwRTmKPz1A/bL5GqKj6mK8Xiv+uVNodX7nKh+NYE0jLB13+
	gB2e9Z2ZVx3UQUWTIcNv5e+d1PuMipGdcqjwNFA=
X-Google-Smtp-Source: ABdhPJzPiA2As0W7YKOvCpoOw+0C60GGeeJuvHj1mwECfRro10UMCymsX9dckuKGw9z5aESjdRIn4X3quZyJ4jlscXc=
X-Received: by 2002:a92:ce42:: with SMTP id a2mr21820718ilr.37.1595866462024;
 Mon, 27 Jul 2020 09:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595862361.git.steve@sakoman.com> <1eb5483fea909177dd4f510ebcb32084d77897b3.1595862361.git.steve@sakoman.com>
In-Reply-To: <1eb5483fea909177dd4f510ebcb32084d77897b3.1595862361.git.steve@sakoman.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Mon, 27 Jul 2020 18:14:10 +0200
Message-ID: <CALbNGRR-rF1A0ej3R7T+VbX1VuC5vixi_-Rr4myFjYrwjV1JZA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 14/18] core: glib-2.0: fix requested libmount/mkostemp/selinux not being linked in
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 27, 2020 at 5:10 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
>
> Since 010202076760 ("meson.bbclass: avoid unexpected operating-system
> names"), meson is no longer used with a cross file that appends the used
> libc to the operating system name, e.g. linux-gnueabi.
>
> Prior to that commit, the host_system == 'linux' checks in glib's meson
> failed, which led to glib being compiled without libmount, mkostemp and
> selinux even if explicitly requested.
>
> As the aforementioned commit affects all recipes built by glib, it might
> not be a candidate for backporting to current stable branches.
If I am not mistaken, the patch
"meson.bbclass: avoid unexpected operating-system names"
made it into dunfell so this patch does not change anything (it should
do no harm either)

Andreas
> To fix just the glib issue, instances of host_system == 'linux' are patched
> locally.
>
> The patch is marked as Upstream-Status: Inappropriate as it is rendered
> unnecessary for OE releases newer than Dunfell.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  ...ot-hardcode-linux-as-the-host-system.patch | 49 +++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch b/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
> new file mode 100644
> index 0000000000..616bbd8a7d
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
> @@ -0,0 +1,49 @@
> +From a300a09661124451d4783d4be66e3993262dc9be Mon Sep 17 00:00:00 2001
> +From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> +Date: Thu, 9 Jul 2020 13:00:16 +0200
> +Subject: [PATCH] meson.build: do not hardcode 'linux' as the host system
> +
> +OE build system can set this to other values that include 'linux',
> +e.g. 'linux-gnueabi'. This led to glib always being built without
> +libmount, mkostemp and selinux support.
> +
> +Upstream-Status: Inappropriate [other]
> +Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> +---
> + meson.build | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 3a47a7cc4b98..af09dfc853e5 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -632,7 +632,7 @@ else
> + endif
> + message('Checking whether to use statfs or statvfs .. ' + stat_func_to_use)
> +
> +-if host_system == 'linux'
> ++if host_system.contains('linux')
> +   if cc.has_function('mkostemp',
> +                      prefix: '''#define _GNU_SOURCE
> +                                 #include <stdlib.h>''')
> +@@ -1857,7 +1857,7 @@ glib_conf.set_quoted('GLIB_LOCALE_DIR', join_paths(glib_datadir, 'locale'))
> + # libmount is only used by gio, but we need to fetch the libs to generate the
> + # pkg-config file below
> + libmount_dep = []
> +-if host_system == 'linux' and get_option('libmount')
> ++if host_system.contains('linux') and get_option('libmount')
> +   libmount_dep = [dependency('mount', version : '>=2.23', required : true)]
> +   glib_conf.set('HAVE_LIBMOUNT', 1)
> + endif
> +@@ -1867,7 +1867,7 @@ if host_system == 'windows'
> + endif
> +
> + selinux_dep = []
> +-if host_system == 'linux'
> ++if host_system.contains('linux')
> +   selinux_dep = dependency('libselinux', required: get_option('selinux'))
> +
> +   glib_conf.set('HAVE_SELINUX', selinux_dep.found())
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
> index d496235003..fd7f5ee920 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
> @@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch \
>             file://0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch \
>             file://0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch \
> +           file://0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
>             "
>
>  SRC_URI_append_class-native = " file://relocate-modules.patch"
> --
> 2.17.1
>
> 
