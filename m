Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.8462.1587829128424185270
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 08:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LGXyMj5B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id t14so15119780wrw.12
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 08:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Hohws5wcqUGHYhB7ekdeGSzSKME75lJxcfB8mnF9sAM=;
        b=LGXyMj5BbYlUD7NL8h5ZEprRvbSFiUpIeXYQgyVXqm9uu1UrtVRSzuDq/b+nonXn39
         zTscbfiPwKDqkkYqmS6bOZbhcC4GXBguU61kD1U8tHeRwPqFMre17hHtXLKDwiCdU9Gd
         O3G2S4wUK6o2+lCXXi/XbBHQPUNArHKDGMot4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Hohws5wcqUGHYhB7ekdeGSzSKME75lJxcfB8mnF9sAM=;
        b=tuXB2X/ezR5HvkQirM0z6ULtbN+vOHISJogDCqhv0isDbkQkFK7jJ5yktJPKwICiSP
         6TxGH5MN2E+E9Pd+djonVsS4t5inwBkf2ZrV7WMO+8i1O6k4rcguCF2Pub4wHsRHRMC6
         HI0VPO6VZU72+s29bWFqK5gUndUixBHTDuMCTLvsJxqw2BNwgKHAzHmlYtSVsu+IrYUN
         oKYpwVEFnyog4aHqjXAs5kJjYWPn2OWYfda9LaexXDKH/he2ZUZr1mGkKGnMqCu1a4oH
         awf9TQ5whRNZr/+hq/c0MXjmSlHW6H0B9ZaTZoUEKE225JkuWnXaLdaKyXwTqjNHyiwv
         aEMw==
X-Gm-Message-State: AGi0PubkZnnfMK7s2fY3O++yaq1rUJHbgk8JRizhNCKRxlFhN04VIzOv
	ipPSXkuBYltKdwR885nyXPnnxw==
X-Google-Smtp-Source: APiQypKIkJmXfTuUWfa01duplg6TW6gc5Bib6plCU8PuL0Hb102x6T1DEkbBj+k2+6GRiDH9AngEnw==
X-Received: by 2002:a5d:410a:: with SMTP id l10mr17219413wrp.355.1587829126853;
        Sat, 25 Apr 2020 08:38:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w6sm13538006wrm.86.2020.04.25.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 08:38:46 -0700 (PDT)
Message-ID: <9bccecbd0ff9ba88e9afc12a9b9475775bef03e5.camel@linuxfoundation.org>
Subject: Re: [PATCH RESEND] bitbake.conf: do not let DISTROOVERRIDES fall back to empty string
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 25 Apr 2020 16:38:45 +0100
In-Reply-To: <20200425151908.1020349-1-masahiroy@kernel.org>
References: <20200425151908.1020349-1-masahiroy@kernel.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-04-26 at 00:19 +0900, Masahiro Yamada wrote:
> Commit abacd7243a2e ("bitbake.conf: fix distro-less failure expanding
> FILESPATH") mended the littered DISROOVERRIDES when DISTRO is unset.
> 
> Some time later, commit b7279f996397 ("bitbake.conf: Default DISTRO
> to
> nodistro") added a weak default to 'DISTRO'.
> 
> So, this line can go back to the original simple definition.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 4b544a22cd..eb3dd0007e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -739,7 +739,7 @@ DISTRO_NAME ??= "OpenEmbedded"
>  OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-
> ${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOV
> ERRIDE}:forcevariable"
>  LIBCOVERRIDE ?= ""
>  CLASSOVERRIDE ?= "class-target"
> -DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
> +DISTROOVERRIDES ?= "${DISTRO}"
>  MACHINEOVERRIDES ?= "${MACHINE}"

Whilst this can't happen with our standard definitions now, the side
effects of it not being set are nasty so I'd prefer to retain this.

Cheers,

Richard

