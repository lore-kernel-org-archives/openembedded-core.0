Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web10.190.1588722892060924120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 16:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U+QQHKI/;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id s11so2421778vsq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 16:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Y4bdaYMfYm5CmCL6So55z+ohUrgUQloj6wqWABeefE=;
        b=U+QQHKI/uv38IwEylBoGnJYgNIRichQeDMdrC708vKwyeJa8w2hcolc63UOFbnpIgI
         u377F+tz4nOuKPFAK6WuXCYHiE9293qVZA6Dvi3Gpsb26RL0WM+rdk2zmKu3nM8NFCwN
         IwdPccU+VbuUIFC8NExejQCrmZ0Tr/3ZBjBf+ks81igvd0d4t37T3zI7zNwfFn5Gt3Jr
         eR7m7fpx68ys8R3e0ku2jcA+rjr1E7ZT4cA3Shxw2P/aR8TZ/yAWPahskfG5XVbwks48
         IWpDLBMAWqWGhUxzpwHIRAHNswC8OLOvClYxEcuBV6xDRrhsttD2KMPk4E4bz92MeVW/
         xTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Y4bdaYMfYm5CmCL6So55z+ohUrgUQloj6wqWABeefE=;
        b=css/xINJxFeg52nujxFw9/xmUKH8MVrbrVCvKo+4aPphGGcysTf/tWJ2UH1qKK73O6
         /XuHw0od/uDaGxnJ4RcUDR4AlyDdJN9o7WrGLI54Fcis9vCzAuyBVaQoZ6n6gGrYEkT+
         AnFrdBJZOtCQD2cAvmLhO7DTHmZeraatifFiBCV9CNuSzpzLs1x+SF4OiH9UNjM2xdum
         oTRxavgKquAnPcC24RyffrmxGB/pSQs6+OGZgI2rlfuyyPzxGAGjeZ4VK7XbTOklnFis
         XcUvAbIdc+MoAUEhV3Uua9Y2u8gls92YJlXnbC+CvDTVKU56+UP4t0SdRa6l0mnhQZXH
         Fkmw==
X-Gm-Message-State: AGi0PuZS0gC8bIE95jSixCBzBAmDW4sFwZGiJXx7xg3wbm4u9++fuNAG
	Re0ihTensUVzywWYYmw9nIarbOO6LQFF41FkL90=
X-Google-Smtp-Source: APiQypJA2uXCVsVK0HCp2LjqkRICmgOpT7/4FzzwVMDe5ExJdzrK1Fwv55ImTae92mjiynzHS8v0ivq68QCab7Wodu8=
X-Received: by 2002:a67:f597:: with SMTP id i23mr5249440vso.137.1588722890900;
 Tue, 05 May 2020 16:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200505233353.1836668-1-raj.khem@gmail.com> <20200505233353.1836668-2-raj.khem@gmail.com>
In-Reply-To: <20200505233353.1836668-2-raj.khem@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 5 May 2020 16:54:44 -0700
Message-ID: <CAJ86T=VOE4jgFyvc+mxzOfGZzioS3kWJhrs9+CFx9oqZtwB1vg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gcc-runtime: Avoid march conflicts with newer cortex-a55 CPUs
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 5, 2020 at 4:33 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> gcc-runtime/libatomic explicitly add -march=armv8-a+lse for all arch64
> but cortex-a55 is armv8.2-a, which essentially conflicts, so let gcc
> override it by not forcing the -mcpu option from TUNE_CCARGS
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index ace706dbf4..547644572a 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -18,6 +18,10 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>  EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
>  EXTRA_OECONF_append_libc-newlib = " --with-newlib"
>
> +# A55 is ARMv82.1 based but libatomic explicitly asks for -march=armv8.1a

Typo.

> +# which caused march conflicts in gcc
> +TUNE_CCARGS_remove = "-mcpu=cortex-a55+crc cortex-a55 -mcpu=cortex-a55+crc+crypto"

Do you mean "-mcpu=cortex-a55" instead of just "cortex-a55" ?


> +
>  # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
>  EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
>  EXTRA_OECONF_append_armeb = " libat_cv_have_ifunc=no "
> --
> 2.26.2
>
> 
