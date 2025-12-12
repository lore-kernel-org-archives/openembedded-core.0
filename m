Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59F5D49233
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 14:44:05 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14050.1765550640817977154
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 06:44:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fKwLks9T;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88244d1559eso11428536d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 06:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765550640; x=1766155440; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BXtakIGFEkeUrL8iGI5aPHfAT9XI3PGJDtiA973948U=;
        b=fKwLks9Ti1bO7zgebtCi8yAiVZ8DVBrgOcHyKcV+Ss4TTsuNOPAcyKJd4S754jfhoU
         KZMWsR3SpHowcsCwCpopHRgI9Gh1502jgasM3OTnl9YaHDsTv49HPph+qNv8WR9DoSvZ
         LJfSG/+gt9js9xIahJKTWIku9ju+8OxV16bsNorGQLrBLO0THw+cTuVMapc3wAZ8Hild
         eCdkMJ8EO95AOhAG4Oe7KF4OKyUDX6DA5pk8++4o9HBa8EJNNIrF2R/U4wiC0IAOhERT
         H/to9n3IVkiBouw0ob4DzCR7erIHO7OWPI6dNQfb8atR9wOsrOn7Ox4KKTLd3wUY3qIh
         uL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765550640; x=1766155440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXtakIGFEkeUrL8iGI5aPHfAT9XI3PGJDtiA973948U=;
        b=LQEwcXWZaVRc1HoHzDeKQQnc+qs8/IhWTdLorfFZ6hq6ZZI1MhT664AC6ca0XJBgmD
         4Dc5Vl9P61VqEzsrSGOjqNn+s2Tu3Huyqn3T5y9wjF7QLXULR2NDyRiaK5Q1BNz4Kzcv
         b128GdbyYihD8OAB5Hm1k7YF06y1xl1BdSyvqQN76HDblBig5UbQbHNkGgTSNAGWSJ6U
         VyyujUQdH1os9MC15SufcDg2FhFjkzk7LszrnGiZuEqLZKgfDTdMxnW0kyVo8x1qQDAe
         XTaTT7iwecuRlWtWq5uqiIrEvx/Qnh5KrmW4dtPsFxkjnjM1S8eNXbv/BzgHZ/OfhSSe
         iFDg==
X-Gm-Message-State: AOJu0Yxx6RzWgk7U0GL+UyO9jf5x6Z7kA+uo9/EdbBeih80os0iIs5yD
	3sygr+QacJT5EtbK0RR0GlDzeShYD2Vr+vDx+4zYmMQOFr8lB6F/SN4QSbFxnqCWnq3FCRYR6Wq
	7SBQ3UoeGCqxAh1g7TqXMvocQcbw/OQc=
X-Gm-Gg: AY/fxX4qf+jKs31huhac4dOqBUIdR7TMM5VkXkOIxmt9I0XCuv/HdW84oRmziR8ZrSl
	tf94yJcQaWxkDVRfQk6vzyjj1x5Dg6gQx3zydKIozKp8OYWBG2FBaE60r6LcSQeJ1vquxF5uQhu
	hsPnvUT60lC8OxRCE25ohKa+/q6IuiBbRckcEfedZiu6V8ikdnQurExCO9Rq33jS2cL84pZCKBx
	TnlejtUPFZMFrNeX1G9kS7kZqkJ+ktqbJIf9CLWnjLERhBS5b7P8IGEBo9sIFO9wMcChA==
X-Google-Smtp-Source: AGHT+IEQn8fK2f60vfTa95ZM4/1kKCHaBPS84YQNICJyT3hygo7FYaHxsqYpZuJlghoyZ+YwA0hJDfCa3wzOWq4yqII=
X-Received: by 2002:a05:6214:16d1:b0:888:804f:3098 with SMTP id
 6a1803df08f44-888804f30acmr23843236d6.3.1765550639572; Fri, 12 Dec 2025
 06:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20251212133900.344838-1-hongxu.jia@windriver.com>
In-Reply-To: <20251212133900.344838-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Dec 2025 15:43:47 +0100
X-Gm-Features: AQt7F2pIuOg4wtKMybRjNONB2ZP3_d1DNfkSY96GE5wIUJFu_LihGxL0jmZSAxs
Message-ID: <CANNYZj_DoKd+8rLk-=0y0yg62QR1q=tvrqrd+QUGU1VsGf3HTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0: install Gst-1.0.gir to
 ${libdir} for multilib
To: hongxu.jia@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 14:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227592

Thanks, this looks fine.

Alex

On Fri, 12 Dec 2025 at 14:39, hongxu via lists.openembedded.org
<hongxu.jia=windriver.com@lists.openembedded.org> wrote:
>
> While installing 32 bit gstreamer package and 64 bit gstreamer package to
> one rootfs, package management (dnf) reported a conflict failure
> |Error: Transaction test error:
> |  file /usr/share/gir-1.0/Gst-1.0.gir conflicts between attempted installs of
> gstreamer1.0-dev-1.26.7-r0.wr2500.corei7_64 and lib32-gstreamer1.0-dev-1.26.7-r0.wr2500.corei7_32
>
> Due to upstream commit [1], the size of padding differs between 32 bit
> arch and 64 bit arch
> ...
> |typedef struct {
> |  /* < private > */
> |  gpointer pointer;
> |#if GLIB_SIZEOF_VOID_P == 8
> |  guint8 padding[8];
> |#elif GLIB_SIZEOF_VOID_P == 4
> |  guint8 padding[12];
> |#else
> |  #error "Only 32 bit and 64 bit pointers supported currently"
> |#endif
> |} GstIdStr;
> ...
>
> It made the generated Gst-1.0.gir be different for 32 bit and 64 bit packages,
> Install Gst-1.0.gir to ${libdir} which splits 32 bit and 64 bit libraries
>
> Submit a patch to upstream to add meson option (gir_dir_prefix) to override default
> gir install location (datadir). When multilib is enabled, install .gir files to
> ${libdir} other than ${datadir}
>
> [1] https://gitlab.freedesktop.org/-/commit/0ee18781f9b210129da23a85236266bf84bafa83#f9880c83c8bdc4d61ac7d51a4a212f602cad5d86_0_39
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...ir_prefix-option-to-override-gir-def.patch | 149 ++++++++++++++++++
>  .../gstreamer/gstreamer1.0_1.26.7.bb          |   3 +
>  2 files changed, 152 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch
> new file mode 100644
> index 0000000000..506e33c61f
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch
> @@ -0,0 +1,149 @@
> +From 6fb2149fc5c7b1805c138a52990305a4f53170fa Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@eng.windriver.com>
> +Date: Thu, 11 Dec 2025 18:38:24 -0800
> +Subject: [PATCH] meson: Add gir_dir_prefix option to override gir default
> + location
> +
> +Originally, the .gir files would always get installed into the default
> +location (datadir).
> +
> +This commit adds meson option (gir_dir_prefix) to override it as intermediate
> +prefix for gir installation under ${prefix}, such as
> +
> +  $ meson setup -Dgir_dir_prefix=lib64
> +
> +The .gir files are installed to /usr/lib64/gir-1.0
> +
> +  Installing gst/Gst-1.0.gir to /usr/lib64/gir-1.0
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/10363]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
> +---
> + gst/meson.build                 |  1 +
> + libs/gst/base/meson.build       |  1 +
> + libs/gst/check/meson.build      |  1 +
> + libs/gst/controller/meson.build |  1 +
> + libs/gst/net/meson.build        |  1 +
> + meson.build                     | 23 ++++++++++++++++++++++-
> + meson_options.txt               |  3 +++
> + 7 files changed, 30 insertions(+), 1 deletion(-)
> +
> +diff --git a/gst/meson.build b/gst/meson.build
> +index c69a6dc..ebe673d 100644
> +--- a/gst/meson.build
> ++++ b/gst/meson.build
> +@@ -322,6 +322,7 @@ if build_gir
> +     'export_packages' : pkg_name,
> +     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0' ],
> +     'install' : true,
> ++    'install_dir_gir': gst_girdir,
> +     'extra_args' : gst_gir_extra_args,
> +   }
> +   library_def += {'gir': [gir]}
> +diff --git a/libs/gst/base/meson.build b/libs/gst/base/meson.build
> +index b7aca73..2fb0590 100644
> +--- a/libs/gst/base/meson.build
> ++++ b/libs/gst/base/meson.build
> +@@ -89,6 +89,7 @@ if build_gir
> +     'include_directories' : [configinc, libsinc, privinc],
> +     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0', 'Gst-1.0'],
> +     'install' : true,
> ++    'install_dir_gir': gst_girdir,
> +     'extra_args' : gst_gir_extra_args,
> +   }
> +
> +diff --git a/libs/gst/check/meson.build b/libs/gst/check/meson.build
> +index 679a15d..e934526 100644
> +--- a/libs/gst/check/meson.build
> ++++ b/libs/gst/check/meson.build
> +@@ -86,6 +86,7 @@ if build_gir
> +     'include_directories' : [configinc, libsinc, privinc],
> +     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0', 'Gst-1.0'],
> +     'install' : true,
> ++    'install_dir_gir': gst_girdir,
> +     'extra_args' : gst_gir_extra_args,
> +   }
> +   library_def += {'gir': [gir]}
> +diff --git a/libs/gst/controller/meson.build b/libs/gst/controller/meson.build
> +index 9d38af8..411b951 100644
> +--- a/libs/gst/controller/meson.build
> ++++ b/libs/gst/controller/meson.build
> +@@ -81,6 +81,7 @@ if build_gir
> +     'include_directories' : [configinc, libsinc, privinc],
> +     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0', 'Gst-1.0'],
> +     'install' : true,
> ++    'install_dir_gir': gst_girdir,
> +     'extra_args' : gst_gir_extra_args,
> +   }
> +   library_def += {'gir': [gir]}
> +diff --git a/libs/gst/net/meson.build b/libs/gst/net/meson.build
> +index 60ed92c..b81139e 100644
> +--- a/libs/gst/net/meson.build
> ++++ b/libs/gst/net/meson.build
> +@@ -67,6 +67,7 @@ if build_gir
> +     'include_directories' : [configinc, libsinc],
> +     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0', 'Gio-2.0', 'Gst-1.0'],
> +     'install' : true,
> ++    'install_dir_gir': gst_girdir,
> +     'extra_args' : gst_gir_extra_args,
> +   }
> +   library_def += {'gir': [gir]}
> +diff --git a/meson.build b/meson.build
> +index e2127f6..7ecfc2d 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -629,6 +629,27 @@ if static_build
> +   gst_c_args += ['-DGST_STATIC_COMPILATION']
> + endif
> +
> ++gir_dir_prefix = get_option('gir_dir_prefix')
> ++if gir_dir_prefix == '' or gir_dir_prefix == get_option('datadir')
> ++  gir_dir_prefix = get_option('datadir')
> ++  gir_dir_pc_prefix = '${datadir}'
> ++else
> ++  gir_dir_pc_prefix = '${prefix}' / gir_dir_prefix
> ++endif
> ++
> ++# This is effectively the GIR XML format major version
> ++gir_suffix = 'gir-1.0'
> ++
> ++gst_girdir = prefix / gir_dir_prefix / gir_suffix
> ++
> ++
> ++if build_gir
> ++  gst_c_args += [
> ++    '-DGIR_SUFFIX="@0@"'.format(gir_suffix),
> ++    '-DGIR_DIR="@0@"'.format(gst_girdir),
> ++  ]
> ++endif
> ++
> + # Used in gst/parse/meson.build and below
> + python3 = import('python').find_installation()
> +
> +@@ -680,7 +701,7 @@ pkgconfig_variables = [
> +   'exec_prefix=${prefix}',
> +   'toolsdir=${exec_prefix}/bin',
> +   'pluginsdir=${libdir}/gstreamer-1.0',
> +-  'girdir=${datadir}/gir-1.0',
> ++  'girdir=' + gir_dir_pc_prefix / gir_suffix,
> +   'typelibdir=${libdir}/girepository-1.0',
> +   'pluginscannerdir=${libexecdir}/gstreamer-1.0'
> + ]
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 78af552..97c03c6 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -32,6 +32,9 @@ option('examples', type : 'feature', value : 'auto', yield : true)
> + option('tests', type : 'feature', value : 'auto', yield : true)
> + option('benchmarks', type : 'feature', value : 'auto', yield : true)
> + option('tools', type : 'feature', value : 'auto', yield : true)
> ++option('gir_dir_prefix',
> ++       type: 'string',
> ++       description: 'Intermediate prefix for gir installation under ${prefix}')
> + option('introspection', type : 'feature', value : 'auto', yield : true, description : 'Generate gobject-introspection bindings')
> + option('nls', type : 'feature', value : 'auto', yield: true, description : 'Enable native language support (translations)')
> + option('extra-checks', type : 'feature', value : 'enabled', yield : true, description : 'Enable extra runtime checks')
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
> index 444165a869..88b1af0796 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
> @@ -21,6 +21,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
>             file://0002-tests-add-support-for-install-the-tests.patch \
>             file://0003-tests-use-a-dictionaries-for-environment.patch \
>             file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
> +           file://0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch \
>             "
>  SRC_URI[sha256sum] = "18a5e214114dc501407697dd458514bba62cadd5414c60f793cf70141a4d0bb3"
>
> @@ -56,6 +57,8 @@ EXTRA_OEMESON += " \
>      ${@gettext_oemeson(d)} \
>  "
>
> +EXTRA_OEMESON:append:class-target = " ${@'-Dgir_dir_prefix=${baselib}' if d.getVar('MULTILIBS') else ''}"
> +
>  GIR_MESON_ENABLE_FLAG = "enabled"
>  GIR_MESON_DISABLE_FLAG = "disabled"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227590): https://lists.openembedded.org/g/openembedded-core/message/227590
> Mute This Topic: https://lists.openembedded.org/mt/116745751/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

