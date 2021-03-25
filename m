Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.1910.1616699147407605203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 12:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=dUuvVB3d;
 spf=pass (domain: burtonini.com, ip: 209.85.128.46, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f46.google.com with SMTP id g20so1767433wmk.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 12:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=oCuTFdlrE+K3nOanfPNypAXARphegYTt6ja9QdGU7S8=;
        b=dUuvVB3dZGcYnuO8FsWTOgftxgxiUeLyJFScIApFmnWNNnvAYUC40Po6ISQo6gYr89
         jdrBg+vIbWTsLcmJCG/hWbuIWnTjRGXpaLZclW9au1Qk44GTl1Np/3hvi9YdS0gMeoEt
         BWw7/NJtWeXvEER4qtawyYi3fTSZsNgKWvbmx3bAfLh6fnKeP4Gua65KwYGUjoLkAGkA
         dzdGV2fsyMF/77iIVce720Dd+ofuTTcDGxa0crZ5EM3aYLxgDxGtyldN8wZRG/6oKEZv
         bawLHvPdqLe5UsuOcRe5gZbkh80j4HB0LrWRIJv3E9g+D9ssgogZEPCVJNac/rwHP1R1
         AhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=oCuTFdlrE+K3nOanfPNypAXARphegYTt6ja9QdGU7S8=;
        b=FVLOqU+lG1DjApUL4+dcTnrA0rWzyNhEYCDPnvFm6oMb1fhy2iLeoDxYaYNZBUymZN
         e4uWWr+H0UHxUMum3DAHDNrcNsQ0UzRBlTN82gi+yTXlBuJVkYksv6nrcg7hbdC24CFY
         GczfnBRCMP4EulJAK7QrSKnRYn6cBvvYtzGS0MK8rlhRvZUhOTVTKjcrP23nLdlLByiZ
         xXZqqttrEhXmP/AL4IrJ05UoNRdLQJGK1FKmmXQH6SsIQNaRU8JEf/c41NG7HIASmwJ8
         v7LB190NvslvuBltxjUeRD5n42A6g1JRF+ANFVxVGTvmj+PCnATFM1xR/JS+8Uzu5h4E
         GUbw==
X-Gm-Message-State: AOAM531xmEWMOI5jexnqGgww3J8ftqbj3CHz0FxEa6h5ySp5uOgbU7tt
	Aszz+LrZZIg9VqndUO1/lgr6iT31pkeH/4ahOuApybvt6tW1oA==
X-Google-Smtp-Source: ABdhPJzyR6ZlGwwz0dDuIIvpJ9AQUfAJYPS2NuZFBsFMyJM1vpyjQ33H0T5aucAuciKp83nKQWPbHMrOsrdU3hHWbDA=
X-Received: by 2002:a1c:2016:: with SMTP id g22mr9434504wmg.137.1616699145286;
 Thu, 25 Mar 2021 12:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210323212814.567119-1-ross.burton@arm.com> <20210323212814.567119-2-ross.burton@arm.com>
In-Reply-To: <20210323212814.567119-2-ross.burton@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 25 Mar 2021 19:05:34 +0000
Message-ID: <CAAnfSTu2iteg8Yc=HgWh47Dq00_Ps9jYNoYPtrFbqqQh+cMz-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] meson: use native-file instead of environment variables
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

So v1 failed all over the AB, the root cause being that in master
Meson doesn't know that there's a specific pkg-config binary for all
native builds, but with this series it does.  In master it only uses
pkg-config-native in native *recipes* but now it uses it for all
native lookups in target recipes too.

This means that when the G-I code uses a native pkgconfig lookup to
get target library dependencies, it goes terribly wrong.

Upstream are basically confused as to how "cross" and "G-I" are meant
to work, because they from a glance can't easily, so I expect to be
able to get this patch upstream as it doesn't break what already works
and is a step towards the correct model.

Ross

On Tue, 23 Mar 2021 at 21:28, Ross Burton via lists.openembedded.org
<ross=burtonini.com@lists.openembedded.org> wrote:
>
> Meson now supports native-files, which are the same as cross files but
> describe the native build.
>
> By writing and using a native file which describes the tools to use, we
> can drop the environment variable overriding.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/meson.bbclass | 49 ++++++++++++++++----------------------
>  1 file changed, 21 insertions(+), 28 deletions(-)
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index a7644e70cb..290b39e1e0 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -26,7 +26,8 @@ MESONOPTS = " --prefix ${prefix} \
>                --sysconfdir ${sysconfdir} \
>                --localstatedir ${localstatedir} \
>                --sharedstatedir ${sharedstatedir} \
> -              --wrap-mode nodownload"
> +              --wrap-mode nodownload \
> +              --native-file ${WORKDIR}/native.cross"
>
>  EXTRA_OEMESON_append = " ${PACKAGECONFIG_CONFARGS}"
>
> @@ -121,9 +122,28 @@ system = '${@meson_operating_system('TARGET_OS', d)}'
>  cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
>  cpu = '${TARGET_ARCH}'
>  endian = '${@meson_endian('TARGET', d)}'
> +EOF
> +
> +    cat >${WORKDIR}/native.cross <<EOF
> +[binaries]
> +c = ${@meson_array('BUILD_CC', d)}
> +cpp = ${@meson_array('BUILD_CXX', d)}
> +ar = ${@meson_array('BUILD_AR', d)}
> +nm = ${@meson_array('BUILD_NM', d)}
> +strip = ${@meson_array('BUILD_STRIP', d)}
> +readelf = ${@meson_array('BUILD_READELF', d)}
> +pkgconfig = 'pkg-config-native'
> +
> +[properties]
> +needs_exe_wrapper = false
> +c_args = ${@meson_array('BUILD_CFLAGS', d)}
> +c_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
> +cpp_args = ${@meson_array('BUILD_CXXFLAGS', d)}
> +cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
>  EOF
>  }
>
> +# Tell externalsrc that changes to this file require a reconfigure
>  CONFIGURE_FILES = "meson.build"
>
>  meson_do_configure() {
> @@ -140,33 +160,6 @@ meson_do_configure() {
>      fi
>  }
>
> -override_native_tools() {
> -    # Set these so that meson uses the native tools for its build sanity tests,
> -    # which require executables to be runnable. The cross file will still
> -    # override these for the target build.
> -    export CC="${BUILD_CC}"
> -    export CXX="${BUILD_CXX}"
> -    export LD="${BUILD_LD}"
> -    export AR="${BUILD_AR}"
> -    export STRIP="${BUILD_STRIP}"
> -    # These contain *target* flags but will be used as *native* flags.  The
> -    # correct native flags will be passed via -Dc_args and so on, unset them so
> -    # they don't interfere with tools invoked by Meson (such as g-ir-scanner)
> -    unset CPPFLAGS CFLAGS CXXFLAGS LDFLAGS
> -}
> -
> -meson_do_configure_prepend_class-target() {
> -    override_native_tools
> -}
> -
> -meson_do_configure_prepend_class-nativesdk() {
> -    override_native_tools
> -}
> -
> -meson_do_configure_prepend_class-native() {
> -    export PKG_CONFIG="pkg-config-native"
> -}
> -
>  python meson_do_qa_configure() {
>      import re
>      warn_re = re.compile(r"^WARNING: Cross property (.+) is using default value (.+)$", re.MULTILINE)
> --
> 2.25.1
>
>
> 
>
