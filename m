Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web09.32855.1620658284872843603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iXaowDwW;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id v39so22003527ybd.4
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t4aSmh4N1PwOag2V2aU2GBiQEvy6IPntowzp6EoggOE=;
        b=iXaowDwWdmUakCQpfDpWtqFSmvhMxz/1Yw8YXygria5oO1wPSE6hJGHKUgj+Lt7UU1
         j6W4ei2J466ihYA7pSq8fAgihJyimAXGrjcX8z14iODejkngh4yVOQAi9RlMvKrXnMjo
         z+95SNAdT20XK9tFW7zgYM64vDE8JHDYS4ex8MWTMFxeS2lG1H2OqWE6P8AQFFGq61bq
         bB5r7001sVFyKXou+IT9qq2SzxVpZblaQXOZEpq/gnbU3rWn0td/advcmlWBOU5cgH7x
         PDTT53Zu10y7ci1dOvqGjCG408DElCjA5twHvH7aQFonTbQNewoVwUXFUE1MtysRMYxE
         o7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t4aSmh4N1PwOag2V2aU2GBiQEvy6IPntowzp6EoggOE=;
        b=PQTMg53r/e7q76X5JL5lIFTUSI48wTuVFoJSlnoK2Y54Y1hoFjotqz3j/eGd5gtsd/
         op4h9wKXQcn0y8IW8STtw/CYLluujhoyulnzfdePW/23Zz9KIcqV7ynFjM6iMvr3V+4N
         xt9r+2tmDjtnwoyPTwaHxswQ9EDrzpfk9ENFMTVIFqjpCs56IY9+CggTDFxOfLrb8lsU
         R1FIqKeFeweXA8p7X0UTxZlW6xAsSbsSn9iYkc9wUjbFadBXzq9DSvt60ifqg6KTdyjZ
         YVJl/WuQ0IDaEipkf2A5pNaWG2Yh79Ps13q7BzF6kQQU6S6YBbdmv1F709UREoZh/aGF
         vrXA==
X-Gm-Message-State: AOAM533CaDjM54ICcHKn+wj2acBIVHyO+cReDPCVLb0rx5IUXQmHXSpO
	xnC1NzmwbhTt/tpz/GePigHn2rhwAdNBHT37I+k=
X-Google-Smtp-Source: ABdhPJyINshfZ/JJd15jkkZugc+4PrcWoddSf2HV/FZRb3FLV7OGpMQFYKx+McI6FGTWgQ7VckQmcJ0T4WbIw7BoA+Q=
X-Received: by 2002:a25:442:: with SMTP id 63mr19447351ybe.93.1620658283953;
 Mon, 10 May 2021 07:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210510090004.1057872-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210510090004.1057872-1-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 10 May 2021 07:50:57 -0700
Message-ID: <CAMKF1srw=8yKkzrLf-nnaC=KLqx5jG=e=K3sB=jm7psZnYKoTQ@mail.gmail.com>
Subject: Re: [PATCH] gcc-sanitizers: Package up static hwasan files as well
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 10, 2021 at 2:00 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * introduced with gcc-11, other hwasan files were already packaged in:
>   3df4a25465 gcc-sanitizers: Package up hwasan files
>   but static library was still triggering installed-vs-shipped
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index d0348c4817..59e91daaea 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -90,7 +90,9 @@ FILES_libasan-dev += "\
>      ${libdir}/libhwasan.so \
>      ${libdir}/libasan.la \
>  "
> -FILES_libasan-staticdev += "${libdir}/libasan.a"
> +FILES_libasan-staticdev += "${libdir}/libasan.a \
> +    ${libdir}/libhwasan.a \
> +"
>

LGTM

>  FILES_libubsan += "${libdir}/libubsan.so.*"
>  FILES_libubsan-dev += "\
> --
> 2.30.2
>
