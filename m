Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.1028.1614392326190956441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 18:18:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gc7Ec7TD;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id z190so11180144qka.9
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 18:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5sAJBwDzw8JUIyGsrwweIRbzJqtgXoCikV0nipUlOsk=;
        b=gc7Ec7TDEOmRxApUTmYloeLcvWJEE73h2+YXKMVrNev1WUbZCJ97t28NRFp/yo7IaS
         AFe1rQOGznFGa5gLdoboLmaHLHUvguZ1uMYE1wjv86X53vEUASDHBTOXRIKDFvkUhJ2c
         sU/iJBf6fmC80GQieIw1wcNWogSBBXzVW722NZD56ecPol8F7xB/mYMfgwZQWGKed30N
         Df/lm2By6MaaNMQcyJ4LMaQlNnMM47gTlm1UXSAbllWdzhKS+uUBA7oHr2WQsrPtVDhq
         snb2yScPaoBFdzvoEAXWUbN5d1FzFQ5ukP9x4DeLQW3kjjZ0dgAF1Rj9wZ8OzkQZwx6k
         7EFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5sAJBwDzw8JUIyGsrwweIRbzJqtgXoCikV0nipUlOsk=;
        b=qevwpPa8VHLcoWY2Ju/6a9vhCxoQ/Dlo2zRx3N6ibXB5vf8I3rAJTEk5iEg1mhDBhs
         lvqR9QCmaEv8BmqWrQllwCEEaKbxLHHsq3JmG9kDSHoutl9jXmy0rbNWS9sRv+ZO3I8k
         ycNpC071qKRHcEhTBrirewVIx9cZOLdYtsb5WAygvDXs98X5TXvCuCw0fx75ZhXwRL+D
         Rskh3/oBzkzHDwh+BG5DfwHlwaSZR1DJi6pLC+GjTqpZmRwzBgwXrOA5T+TTn/dPS1jI
         V3NMbXxNeCndfAOvhl6e9MZOlq0tiQNkVdtw+YvjxNDZusXd65/Nube3xkcfGJ0RvXSp
         iLHw==
X-Gm-Message-State: AOAM533Uzk8rkETNXbVXwBZq+ZsaP03c8LzdbUlNPrhFqnU/buP4H1A9
	Vh0DfHPAlCEeyRi7CY769dvMBZvzfWxbuwiLBQY=
X-Google-Smtp-Source: ABdhPJxBDn51izz4sg6Q062uRdMfnKbWtHlM3C0TliRC29d1if+fbWiQ58LQ6adfo4dCk4XTgajPsKlZ2+snjnLHi+c=
X-Received: by 2002:ae9:eb52:: with SMTP id b79mr5581904qkg.381.1614392325183;
 Fri, 26 Feb 2021 18:18:45 -0800 (PST)
MIME-Version: 1.0
References: <20210226142045.29040-1-zhe.he@windriver.com>
In-Reply-To: <20210226142045.29040-1-zhe.he@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 26 Feb 2021 18:18:17 -0800
Message-ID: <CAMKF1soxU7aHuYDSu4rssZ6gBqO_9Qbooi_B94z_u7LYCspMWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Disable CPU ISA level requirement check
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this change is ok

On Fri, Feb 26, 2021 at 6:21 AM He Zhe <zhe.he@windriver.com> wrote:
>
> We experience the following error and fail to boot on qemu64 machine
>
> /lib64/libc.so.6: CPU ISA level is lower than required
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
>
> As stated in [1],
>
> Passing -march= causes glibc to add annotations not compatible to run
> result on -march= as too high ISA level is inferred.
>
> ISA level is a new feature of 2.33 release.
>
> Until it's fixed let's disable ISA level inference with
>     libc_cv_include_x86_isa_level=no
> (no better configure option yet).
>
> [1] https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=5dbd6a821ff753e3b41324c4fb7c58cf65eeea33
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index d2f02ad59b..7d14306377 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -20,6 +20,7 @@ CACHED_CONFIGUREVARS += " \
>    libc_cv_ssp_strong=no \
>    libc_cv_ssp_all=no \
>    libc_cv_ssp=no \
> +  libc_cv_include_x86_isa_level=no \
>  "
>
>  # ifunc doesn't appear to work on mips, casuses libbfd assertion failures
> --
> 2.17.1
>
>
> 
>
