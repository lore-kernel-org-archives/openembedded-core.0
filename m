Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.6784.1601036805903388090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 05:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uHnSnBXQ;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: andrey.z@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id y194so1277666vsc.4
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 05:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VfUc8FUmd+x4bj+t0PV5RGPeYrfsg9FQ8u3ZDvJYM8s=;
        b=uHnSnBXQp0N9InmKGpFFx8lK5EztZHPRNgxEKDew6kRQpYav4CPaEuRC7csK5ebHHw
         63JJcRX9+VOpoKViI34vc+ecJVCTHLAzHCr72TJpIH+fC/BcgAh6sdsfnNQrsa5h4T1E
         VMhVVChfRsrVlOpiRigtF3Z6/gWJp63XHm8kdbudYiU+kVgVM2UneXUMsdPFTsLTW1yr
         fMFeZVWBlLccLcK/dS22jn/DQdOTUrBTxamNwei9I8h8bUcZyjgXQaE28QTQ8tdsJdeQ
         ocERKciFNLF/7rRUxeZER321Fth/BXbEKCbZAL1PX0p/m6zU9PVevxl9l1KvGGuJM7+I
         I/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VfUc8FUmd+x4bj+t0PV5RGPeYrfsg9FQ8u3ZDvJYM8s=;
        b=OGfSmIUDhErlnu/+JtQWIcJyRvGhoc4v3ATQgdnKA5a2mEJgyRIOIyeoJVYYfVuS2u
         Q1qyufUgvEy/A53eggI6emKntgihEpDxydsSetTrlm5CKRh3nQqwv/20/AQTE6Y+ucDj
         +oM2luaAsDMcSVjsTElF6Q1JwBukdC3++N7hE3jF+7aMmWZ0U1AGLvSMPsXo6g8059Vh
         6r/Ma5CQtMItZE4MynMAcDH++gaXjBILe5Sg8jO0nreDdGg/Hg0tIXbVeEyGIBchsS/y
         FeaB4/MWETvQOfxweir7pYdx0NNFccrhErJ9p0wT7R38BCo3V+2fOByeJUn4Qb6KMlfR
         5wpw==
X-Gm-Message-State: AOAM5307URy60Gf4v7NdEv2DrR65gk/S374Uj0rw/2FmkcK73EiKxR3q
	RNPF3YIY2suBbymqYhxFW/L9A/d4p5nQecoLFlYBxG+G
X-Google-Smtp-Source: ABdhPJw0w9PR/w12FFUBm4L9t3VvKG28C7CwVxCuMinZwTUFEY1sSCwLzojhvNgwyf0ZpVZZI8Oe3U0BSJFyIUznAJA=
X-Received: by 2002:a67:8e08:: with SMTP id q8mr2380193vsd.56.1601036805049;
 Fri, 25 Sep 2020 05:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <A24DC035FE5F8F4BAE7F63FB1B07D7BC392FA16E@SRV24.hamburg.garz-fricke.de>
In-Reply-To: <A24DC035FE5F8F4BAE7F63FB1B07D7BC392FA16E@SRV24.hamburg.garz-fricke.de>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Fri, 25 Sep 2020 14:26:34 +0200
Message-ID: <CAHtQpK7FZk6ZxmkiX30Mm2hg654rw=w9Wpb7-Sgvok+BwWEFPg@mail.gmail.com>
Subject: Re: [OE-core][Patch] sstate.bbclass: Check file ownership before doing 'touch -a'
To: Norman <norman.stetter@garz-fricke.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 25, 2020 at 2:19 PM Norman <norman.stetter@garz-fricke.com> wrote:
>
> From cd51db253c1a81e47532f1afacce385e422d9a73 Mon Sep 17 00:00:00 2001
> From: Norman Stetter <norman.stetter@garz-fricke.com>
> Date: Fri, 25 Sep 2020 13:49:43 +0200
> Subject: sstate.bbclass: Check file ownership before doing 'touch -a'
>
> In contrast to 'touching' a file without parameters 'touch -a' can only be
> performed by the file owner. In case of a shared sstate-cache served
> locally (e.g. over NFS),  where the user running bitbake is not the
> owner of sstate-cache files, even if he has write access on group level,
> the sstate_unpack_package task will fail.

Isn't the whole intention of using SSTATE_MIRROR to cover exactly
those cases? I do not think that reusing sstate between different
builders via NFS is a proper way to go.

> Checking if the file is owned by the user before attempting to run
> 'touch -a' on it solves this.
>
> Signed-off-by: Norman Stetter <norman.stetter@garz-fricke.com>
> ---
>  meta/classes/sstate.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 375196ef21..66a96a7603 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -847,7 +847,7 @@ python sstate_report_unihash() {
>  sstate_unpack_package () {
>         tar -xvzf ${SSTATE_PKG}
>         # update .siginfo atime on local/NFS mirror
> -       [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
> +       [ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
>         # Use "! -w ||" to return true for read only files
>         [ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
>         [ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig
> --
> 2.17.1
>
>
> 
>


-- 
Regards,
Andrey.
