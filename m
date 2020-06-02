Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.1919.1591120707077043380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 10:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BRXTu0tR;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id n141so13447009qke.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 10:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4d2N0e+f5l+UmDaZjKLAgih0hFF4M+i1eBr/8+wsCGo=;
        b=BRXTu0tRCihwGm9XaYYd5tLjUYudV3OJGNNRfgiG2s/MqH6UqZfOcQcSSjRi61H+s0
         Tt+JKUbQrwyAOxTVO72TibZZfVVPswOv5efcIovm9Q+kZMyEWjcvv1tG1pXxCcqXgiEb
         dHnjT+ILbmpdX5D9YyqMcFMEwvdozAmO/B5yiwNZa9MHPjzFkYAUKGAFc2n+ITEQ58P+
         rOSdASl5uCrLrRuuwh6V0jWy6lsRxokYal+NBi4IE6fbvyo7sZw6fCCJ+0/vV1Dv+GLY
         qXw1jwk4YWqmtwUEJOusFxv0+l0Y1ihrJfGnlP5ZMx/FuipmeWO7rAZrKLhlO2L1Kt2U
         T5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4d2N0e+f5l+UmDaZjKLAgih0hFF4M+i1eBr/8+wsCGo=;
        b=XISLjF892kbhYNQ9LU5BE6zg091a10cNyib5yt8gPCVCDUsj8Yxf0bkjTJ2uQq8Zzq
         NDPeqExrvVv1tPKMShCTw4D2S5d39ChCXFSNLLGng7dwfrv+emggR29FoMZA255rUW2j
         ssZhUMguLcXfqdqB0BhwMtjtN9921ZRRVK0/7Nf+A+jse/aM/dmts7BcwVnFzt9B6TK+
         X4Desuz3hkees69bsHg2Cl6PzuziQ07AwgB/zQjPy3sCDZLaAzAfL/AeMAXoQ+6c8D31
         /sOi4Rof58UZ3v5Yc0108Ad+miYxtsCK/sQLzvBklyuUBopVyRJ2ro28BxzMCVuwa70Y
         URHA==
X-Gm-Message-State: AOAM531N8YWhV4TBpSe3pjXAPPIJLuMTQOt2JrLRjt52lsonI3mV6LP8
	ssVLm1FNoWR4gJX8O/oPIYCULpJbLLE6s9/DZOM=
X-Google-Smtp-Source: ABdhPJxAQ9AFse92REgC1kM48eke8OENsTdAR+DXzqRfBmNFM03PfOH0pf4US1s6gGS2zKgZhg0AAQ8KSIEqo5ffA4o=
X-Received: by 2002:a37:7143:: with SMTP id m64mr27908994qkc.215.1591120706043;
 Tue, 02 Jun 2020 10:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <1614B0E5E96C4272.14405@lists.openembedded.org> <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 2 Jun 2020 10:58:00 -0700
Message-ID: <CAMKF1soE46Cvvr0xFP_5_NYaYeNOoimkXsFHgZYE+gSFA7nbWQ@mail.gmail.com>
Subject: Re: [PATCH v3] glibc: move ld.so.conf back to main package
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa <martin.jansa@gmail.com>, 
	Andreas Oberritter <obi@opendreambox.org>, Phil Blundell <pb@pbcl.net>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 2, 2020 at 5:17 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> There are cases where one doesn't want ldconfig on target (e.g. for
> read-only root filesystems, it's rather pointless), yet one still
> needs ld.so.conf to be present at image build time:
>
> When some recipe installs libraries to a non-standard location, and
> dutifully drops in a file in /etc/ld.so.conf.d/foo.conf, we need the
> ld.so.conf containing the
>
>   include /etc/ld.so.conf.d/*.conf
>
> stanza to get those other locations picked up.
>
> So change the packaging logic so that there's always an ld.so.conf
> present when the build-time ldconfig runs.
>
> The ld.so.conf and ld.so.conf.d/*.conf files don't take up much
> room (at least not compared to the 700K binary ldconfig), and they
> might be needed in case ldconfig is installable, so leave them
> alone.
>
> In case of a read-only rootfs, one could add some logic to remove them
> if one really wants to shave those few dozens of bytes off.
>
> While here, fix typos in the bb.note (add spaces) so one can just
> copy-paste the line from the log-file and redo the command.
>

The patch, in essence, looks ok, have you considered the feeds based
distro's case
will it keep working for them, or if there are changes e.g. they must
include ldconfig
compulsory etc. then it should be documented.

> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>
> v3: rebase to master
>
> v2: don't delete the configuration file(s) - that's also a much
> simpler patch.
>
>  meta/lib/oe/rootfs.py                     | 2 +-
>  meta/recipes-core/glibc/glibc-package.inc | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index cd65e62030..a0ac33ada6 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -297,7 +297,7 @@ class Rootfs(object, metaclass=ABCMeta):
>
>      def _run_ldconfig(self):
>          if self.d.getVar('LDCONFIGDEPEND'):
> -            bb.note("Executing: ldconfig -r" + self.image_rootfs + "-c new -v")
> +            bb.note("Executing: ldconfig -r " + self.image_rootfs + " -c new -v")
>              self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
>                                    'new', '-v'])
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index ff25fd4187..5f1ab60dc6 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -23,9 +23,9 @@ ARCH_DYNAMIC_LOADER_aarch64 = "ld-linux-${TARGET_ARCH}.so.1"
>  libc_baselibs_append = " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER', '', '', '${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}', d)}"
>  INSANE_SKIP_${PN}_append_aarch64 = " libdir"
>
> -FILES_${PN} = "${libc_baselibs} ${libexecdir}/*"
> +FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/ld.so.conf"
>  RRECOMMENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
> -FILES_ldconfig = "${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
> +FILES_ldconfig = "${base_sbindir}/ldconfig"
>  FILES_ldd = "${bindir}/ldd"
>  FILES_libsegfault = "${base_libdir}/libSegFault*"
>  FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
> --
> 2.23.0
>
