Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.22379.1613926834094428185
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 09:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lnULkgj5;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id w19so10425545qki.13
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 09:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1U9ojHqBUbjwYg72aAXf/kim9E1l8dhatd9XS/9P+z0=;
        b=lnULkgj5ZADr6R9A4IF8ex4bOYRYz/aFBTFzi1H9JBGKgB5+Q/eRXADYkpIVxNa4ar
         k8xhWaNaiaunBgL2dg5iIbUlPvcjdGJhhzeomxJz/dUb0Qz/lsgFDD5yIQ8oxeS4lSF3
         zxbAoaDo3JgUNo3wcSNMgfxIWOHtZ0q2YUFoEVwdTU76280+jyOes3U1b9JHWS6ehO0C
         mV/ab+3Z3AgUQLtYds4eqc/QNb/RGJLxERUHmeQuTD7lgRvxJIRlfDOSw9SmIJTR22PA
         GgT5l1m222EahhuUGVdg+f2xp+K1BB/8OZpUwDSrvwXPQB5ztKbWy7etL7SH+D84eDGK
         ZJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1U9ojHqBUbjwYg72aAXf/kim9E1l8dhatd9XS/9P+z0=;
        b=T/dc3qcK3ozBz5yMYYDjaSbyNfyuC9JmQARnwMPpRt9K5w7Vd3W0n/k9IfHjwgOYSl
         9hBgbu9p8En8CNb0Qb9GjV9C/yywKd9XkPIHx+sfJW93Qadq5jRBj8iQ6HFtbemIhbD8
         QJnTucInsNFnjvx+3gTRRPSg6hE7w8P1VqP+ujELFtrdSwiHW969FwgU44FmdrmppFBe
         Lrohl4PDNtOeM0Zl/sBKh4scnKlB50mQbm6Fttf0ASlLZxPTC39R2pnt49qfD9EMyrmj
         wiKjI/kLZcLzQzLarO9FC4tCQ4T3626DE54cXGeA0FbooqCJJnk/GUOhDMa3OwjxKxIU
         MbZQ==
X-Gm-Message-State: AOAM530F+P5Ba7K0/St7RCiwuigqRc1HFt5pRgKQRgxw6POBbTh/5pXN
	n2sGpUSeV2S+vL3fDF8j0i9cj/hZkE2Wp67AJPg=
X-Google-Smtp-Source: ABdhPJyPcfoPdP5gbmwtjPoY0dziFt5Zd/JwkaBU9+rUlwlrD/ad8OufwkZX52pqAFkrwU5vPrRQz2J52kFQnwJ0C5Y=
X-Received: by 2002:a05:620a:b95:: with SMTP id k21mr17376327qkh.125.1613926833239;
 Sun, 21 Feb 2021 09:00:33 -0800 (PST)
MIME-Version: 1.0
References: <20210221164919.389109-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20210221164919.389109-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 21 Feb 2021 09:00:05 -0800
Message-ID: <CAMKF1srD9-GcaVsJZ+AQ1ZGs6FpuFWbuCVf3PRaO7p3YWh-m_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cups: set rundir to /run/cups if systemd is used
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Kang Kai <kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 21, 2021 at 8:49 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> When running under systemd, cups needs to be configured with
> '--with-rundir=/run/cups', as systemd takes an exception to the
> activation socket being under /var/run and relocates it.
>
> This leads to fd duplication in cupsd and an inadvertent closure of the
> activation socket when the daemon exits due to inactivity, so that the
> daemon cannot be activated again.
>
> [YOCTO #14152]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/recipes-extended/cups/cups.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
> index e7a704134c..a8e8d115da 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -56,8 +56,11 @@ EXTRA_OECONF = " \
>                 --enable-libusb \
>                 --with-domainsocket=/run/cups/cups.sock \
>                 DSOFLAGS='${LDFLAGS}' \
> +               ${EXTRA_OECONF_SYSTEMD} \
>                 "
>
> +EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-rundir=/run/cups','',d)}"
> +
>  EXTRA_AUTORECONF += "--exclude=autoheader"
>
>  do_compile () {
> @@ -105,6 +108,8 @@ RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'procps',
>  FILES_${PN} += "${libexecdir}/cups/ \
>                "
>
> +FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '/run/cups/certs', '', d)}"
> +

/run dir is created/populated during runtime. you can use tmpfile
fragment in do_install something like

        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
'false', d)}; then
               install -d ${D}${sysconfdir}/tmpfiles.d
               echo "d /run/cups/cert 0755 - - - -" >
${D}${sysconfdir}/tmpfiles.d/cups.conf
       fi


>  FILES_${PN}-lib = "${libdir}/libcups.so.*"
>
>  FILES_${PN}-libimage = "${libdir}/libcupsimage.so.*"
> --
> 2.25.1
>
>
> 
>
