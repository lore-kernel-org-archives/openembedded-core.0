Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.47317.1629244021582020628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 16:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tkDE/AR6;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id m21so879466qkm.13
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 16:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NnoBP8EoK+Tfsbo/7EQNxPzB7prMUdCjUA5JwYUH/wc=;
        b=tkDE/AR6ZPMlywvVDP2+G6LCqxX4gODR0kaz+72nN+jKCjl33jHqwl4Q43Akn5mA3g
         G7nN6s+p+NV50ImeyJ24CI3UpNsEyWuUVc4b14VwCSjAaxbbH4MHK2HZlWjfm7bVnKdA
         yqwTuChGXYlHGeAjqCz3NMjK3rd9HcRew7+xUX4Y3mXiYmCf/xDj43T+631iVk5E8P6v
         BmseFZleRQo1rPE4NXTzvnA66qUPEKojT26Svf9X0uvy9JQcY7oRt+v/YIei8MO1I2PG
         aDmWnBigIXv6GXC5a3OkM3hDBTmrMWNuvDGv3EqeyjrbzekLAoer55ogEyRSOG73ki0I
         bj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NnoBP8EoK+Tfsbo/7EQNxPzB7prMUdCjUA5JwYUH/wc=;
        b=XPFnPm1YKGezr6/Qeeb3kFZaxDcFdqjk84mXa/jh6ujpsfGGRlMYhuSor23phxyP3R
         w6M/Z1EjOaRVFrk76vYIjns+gumxLDmitfWR+Yl9dFNqMPOeR2Nz+nvw54Ohi8n6E4jK
         NXS/uNHMu7YC8KAdVc+ZKilTcuqz2akuSNH+Kc2qVw2a2lEm+NmpSrLoZ8ir6hOxhDWj
         003fgag8jT3OO5RX4z3Ciik2h05VgJpMbMtlN9B73Jc3N8aThTnKZpHEJhQPhKuQueRc
         7V0qsCtApgPyEK0OvTWxYePwfiwZmQFh8PVb6wB/mwihex2Ycpb8lmuX0xi+s6jbbBWr
         mgEQ==
X-Gm-Message-State: AOAM5306ELNIqyd5NnfX4RDUL4AaydF8akx0G6piCOSCA/frNMWF5xVq
	yzlRDeIfxGntP5EeqsHAlKX0e9rQvyn8FOhhArk=
X-Google-Smtp-Source: ABdhPJwHnxgKVDR+jNfuJfm+1iTovUWmlCHzOjVjHogdhcOWFlJzoVf+rT4w9fmw0/JkTGCJYQbTaOr7q9sjrv7obS4=
X-Received: by 2002:a05:620a:88d:: with SMTP id b13mr6609037qka.125.1629244020680;
 Tue, 17 Aug 2021 16:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210817222919.2170420-1-ross.burton@arm.com>
In-Reply-To: <20210817222919.2170420-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 17 Aug 2021 16:46:34 -0700
Message-ID: <CAMKF1sp83v6TkKLAAMdDExij9ZceOaCGpSrp=cLPJEkQUCB-pQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: package the stub .a libaries into glibc-dev
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 3:29 PM Ross Burton <ross@burtonini.com> wrote:
>
> In glibc 2.34, the libraries libpthread, libdl, libutil, libanl have
> been integrated into libc. To retain compatibility with old binaries the
> shared libaries are still shipped but are empty, and to keep software
> building there are empty static libraries.
>
> However, these static libraries get packaged into glibc-staticdev (as
> they should be), but by this design they should be in glibc-dev.
>
> https://sourceware.org/pipermail/libc-alpha/2021-August/129718.html
>

this patch is ok.

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index 3026aec9b6f..56fbf8b08ce 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -22,6 +22,7 @@ ARCH_DYNAMIC_LOADER = ""
>  ARCH_DYNAMIC_LOADER:aarch64 = "ld-linux-${TARGET_ARCH}.so.1"
>  libc_baselibs:append = " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER', '', '', '${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}', d)}"
>  INSANE_SKIP:${PN}:append:aarch64 = " libdir"
> +INSANE_SKIP:${PN}-dev += "staticdev"
>
>  FILES:${PN} = "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/ld.so.conf"
>  RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
> @@ -38,7 +39,7 @@ FILES:sln = "${base_sbindir}/sln"
>  FILES:${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
>  FILES:libsotruss = "${libdir}/audit/sotruss-lib.so"
>  FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
> -FILES:${PN}-dev += "${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
> +FILES:${PN}-dev += "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
>  RDEPENDS:${PN}-dev = "linux-libc-headers-dev"
>  FILES:${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
>  FILES:nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_unitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
> --
> 2.32.0
>
>
> 
>
