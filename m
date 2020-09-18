Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web12.2715.1600391683665128134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2020 18:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries-io.20150623.gappssmtp.com header.s=20150623 header.b=0/aLzbkI;
 spf=softfail (domain: foundries.io, ip: 209.85.210.51, mailfrom: ricardo@foundries.io)
Received: by mail-ot1-f51.google.com with SMTP id h17so3898007otr.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2020 18:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries-io.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SHAV4kQv2U0PqMuI4tkBGBU1RUe9F+6uDn6ZqXM9YPQ=;
        b=0/aLzbkI/J2Ytd0sW+jZtaNi5veHxomWzznhSYcQgQQrrGwjyaBDqQYA1tnUd1r+xq
         ak1fv03P4A+4OmZ2W8wlRC50YkakIj8+44S6ki00rTHGxVIG/5Zl+WrQ9gFHLC8YBd6S
         BmbzqaMAsxC6QXIjWBWeIC+JEAltsPI9mbq8NzgOlgBKcoUz15YJXpdxQaixCIrByUeT
         c5OK6rp4EX4stdUL1kMA77BmZdB91eVpC3+h02tBxFWrJG7177SH4lOjElTyUVPSJ1fg
         KbiF/WZ48ALNfa8gUuPIWFD0WvaLrvf7795c2xSWskvf7/FnmcOOlehsm25D4ExqR09g
         xsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SHAV4kQv2U0PqMuI4tkBGBU1RUe9F+6uDn6ZqXM9YPQ=;
        b=ou89JDfpsGwCzwjpqnOXaHP/ggls8Dll7apMUQKOr2L4/cy55JspN6zpcnMWhfLHA1
         kNIyxo53MIVfCzUzm+nS5Cp3bmuFj8nDDrPQ58ILE4ARcIcd6pZukk6ce8knIqHLR8Pg
         2quY01OALzHWka56XQiCo1ob64NqbHvmOtMRbu5zrSUkI4GgYXtGRDspD14E5lryRsKp
         nXf43N/Rvfa6lnW99Wud1rVfcdmeBcKC7PeZPT/CIudYOamm3zE+Ppx7yx1ZbLpwgiPh
         6Xl+7ni+ZkgmyQ0pFaMe3MUVwrz/NAbbFV/jJ49XDriikJRKEZLY+Z4Knpy7h5F/tGhF
         RyQw==
X-Gm-Message-State: AOAM532xxrh7vkhYgFLhZtGuP/O9XFHw1KPEmg87D8zwRgsgKJcIa6QE
	lLGMQa/yA+Tp1yWW75p9eYD/TgcKEfsTvxLobNN1
X-Google-Smtp-Source: ABdhPJwTWI3yE2xemFmHJsArVMp0frDZ4/7FiEoxRlqSyDqpiEttEfgIw/bHh8NdwC7LDhuAtczwAgyoG4D6FtTOP+w=
X-Received: by 2002:a9d:140a:: with SMTP id h10mr21133816oth.46.1600391682829;
 Thu, 17 Sep 2020 18:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200915091523.31005-1-yi.zhao@windriver.com>
In-Reply-To: <20200915091523.31005-1-yi.zhao@windriver.com>
From: "Ricardo Salveti" <ricardo@foundries.io>
Date: Thu, 17 Sep 2020 22:14:07 -0300
Message-ID: <CAAaKDhEPBDY-MXbhjjJ816ssRFuwQVSJSoA8RWGvg=pU=qUtQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dhcpcd: add --dbdir and --disable-privesp to EXTRA_OECONF
To: Yi Zhao <yi.zhao@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 6:15 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> * Disable service start at boot time. This may conflict with connman.
> * Set --dbdir to /var/lib/dhcpcd rather than /var/db/dhcpcd to satisfy
>   FHS compliance.
> * Pass --disable-privsep to configure to eliminate dhcpcd start warning:
>   no such user dhcpcd.

Isn't it better to just create the missing user at the system level?

You could leverage systemd sysusers.d as done by arch at
https://github.com/archlinux/svntogit-packages/blob/packages/dhcpcd/trunk/dhcpcd.sysusers
(in case systemd is enabled).

> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
> index 292cb5b008..4b5f4d7766 100644
> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
> @@ -22,13 +22,14 @@ SRC_URI[sha256sum] = "fcb2d19672d445bbfd38678fdee4f556ef967a3ea6bd81092d10545df2
>  inherit pkgconfig autotools-brokensep systemd
>
>  SYSTEMD_SERVICE_${PN} = "dhcpcd.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>
>  PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>
>  PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
>
> -EXTRA_OECONF = "--enable-ipv4"
> +EXTRA_OECONF = "--enable-ipv4 --disable-privsep --dbdir=${localstatedir}/lib/${BPN}"
>
>  do_install_append () {
>      # install systemd unit files
> --
> 2.17.1
>
> 

Cheers,
-- 
Ricardo Salveti
