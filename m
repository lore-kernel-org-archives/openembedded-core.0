Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web09.6874.1606980580769245395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 23:29:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XmYAM0I4;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id 128so717323vsw.10
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Dec 2020 23:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rX3Ticdomsg1bH+AwRrQ4Ad+y8ZZephYUkpwDsj57cU=;
        b=XmYAM0I4vmRb+zPm8xMYP0NWrf3smPTM2fPZe/DXTFdGUvbrdX/pl5uEOPMKTesBr9
         T5dIked+DXdEAeanh0bhxvfvQumaj8BtPALdpo1dNDXP4ogiSN+OkMS1ixBSNb/PYR0i
         6SPhC64HX7GBuqx9hFMMJcARKI0rfDVem9wfnHBhdOsg8YDqUJpDS/MPBFe/TkgEg9e5
         WjnPwGTX7pm7EINUfyfKiJWcmWx61ZQnn6F42Glsae7sytjWke5EFZANcdrFxtM0oL0f
         isFCVlvH9kwQ+nTc/ncy4qmJo+oP5S4wZ0F+lH4Jt24amPrQKKYvj3yn9usE3Wz0ND9H
         hwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rX3Ticdomsg1bH+AwRrQ4Ad+y8ZZephYUkpwDsj57cU=;
        b=VOYJU6vkab1vI4F0+AB2fUdMO5bbAb8FSekrKn1O5iF10p6qIw3+RF3mEHjD+6mdvE
         EmIYMLiAlgszSLantoZUfDhjJfDKppaVNfGoHMKRwxDisuQKlCY8hFXkcIt2aXFv7iZp
         BShC+K12Zi5U8/fAcmu8b1hdYkBbiah38gD2ssgIWphzrNPgRGUSWQJYfTknVNF2Jv7C
         l9K7rfkGtD/MzLpFsVVh9SzDNXWCLhppEf8RRrLMvpwUI3sildka/Kt4UZaBQQdVWGOb
         LifxDlJPMhGcW3pZXv3KB0NQ05hoQXHT2FQ/fc2y6KMWPA5KZpRBFIV2DYPO1W3fQrlG
         qAqg==
X-Gm-Message-State: AOAM533UTKCwr7YiX0tKO7CMDF+ZXbyJP+yHByVBIxfGgpbLX4kd0zvp
	tvHonGbfCo3TaD7iKBTHUMJdVAIOdfO63daTAB0=
X-Google-Smtp-Source: ABdhPJzcf/jwaT35A2jTky2e1KGZkLKQQ8o6oXJAJax5N0/2k0nlf9KZvNPH0MzKSTcDPjp1u14g3uYBkwFuGcWc82s=
X-Received: by 2002:a05:6102:22ef:: with SMTP id b15mr1247042vsh.35.1606980579814;
 Wed, 02 Dec 2020 23:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20201202191124.15903-1-alanp@snowmoose.com>
In-Reply-To: <20201202191124.15903-1-alanp@snowmoose.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 2 Dec 2020 23:29:32 -0800
Message-ID: <CAJ86T=XzCC8z=qvzUdpfFbmvBasx4+iV81Dpk_FFszQKEqD2pA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] iproute2: install tools to mirror install under Debian/Ubuntu
To: Alan Perry <alanp@snowmoose.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 2, 2020 at 11:11 AM Alan Perry <alanp@snowmoose.com> wrote:
>
> Many scripts exist that expect the iproute2 tools to be found in
> the same directories where they are found in Debian or Ubuntu.
> For the iproute2 tools included in the iproute2 recipe, move
> them to those directories or create links there. Also, add
> bash-completion files as is done by Debian and Ubuntu.

Rather than creating symlinks etc, could this be done more cleanly by
having "make install" install to the Debian paths directly?

(Presumably Debian isn't manually moving files after "make install",
they are just configuring the build differently).

> Signed-off-by: Alan Perry <alanp@snowmoose.com>> ---
>  .../iproute2/iproute2.inc                     | 21 +++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 403d264308..21f52f80bc 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -41,6 +41,21 @@ do_install () {
>      install -d ${D}${datadir}
>      mv ${D}/share/* ${D}${datadir}/ || true
>      rm ${D}/share -rf || true
> +
> +    install -d ${D}${base_bindir}
> +    ln -s /sbin/ip ${D}${base_bindir}/ip
> +    mv ${D}${base_sbindir}/ss ${D}${base_bindir}/ss
> +
> +    install -d ${D}${bindir}
> +    mv ${D}${base_sbindir}/nstat ${D}${bindir}/nstat
> +    mv ${D}${base_sbindir}/lnstat ${D}${bindir}/lnstat
> +    mv ${D}${base_sbindir}/ctstat ${D}${bindir}/ctstat
> +    mv ${D}${base_sbindir}/rtstat ${D}${bindir}/rtstat
> +    mv ${D}${base_sbindir}/routef ${D}${bindir}/routef
> +    mv ${D}${base_sbindir}/routel ${D}${bindir}/routel
> +
> +    install -d ${D}${sbindir}
> +    mv ${D}${base_sbindir}/genl ${D}${sbindir}/genl
>  }
>
>  # The .so files in iproute2-tc are modules, not traditional libraries
> @@ -59,7 +74,8 @@ PACKAGES =+ "\
>  "
>
>  FILES_${PN}-tc = "${base_sbindir}/tc* \
> -                  ${libdir}/tc/*.so"
> +                  ${libdir}/tc/*.so \
> +                  ${datadir}/bash-completion/completions/tc"
>  FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
>                        ${base_sbindir}/ctstat \
>                        ${base_sbindir}/rtstat"
> @@ -69,7 +85,8 @@ FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
>  FILES_${PN}-nstat = "${base_sbindir}/nstat"
>  FILES_${PN}-ss = "${base_sbindir}/ss"
>  FILES_${PN}-tipc = "${base_sbindir}/tipc"
> -FILES_${PN}-devlink = "${base_sbindir}/devlink"
> +FILES_${PN}-devlink = "${base_sbindir}/devlink \
> +                       ${datadir}/bash-completion/completions/devlink"
>
>  ALTERNATIVE_${PN} = "ip"
>  ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
> --
> 2.17.1
>
>
> 
>
