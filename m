Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.140.1614277703924517527
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QWM8ARHk;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id gi9so3244369qvb.10
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 10:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BP0UK3wcxcI9siLJN61wegAnkIcJZPTuRRlaiymFIEs=;
        b=QWM8ARHkxAsFZISSkGYS++2c8u4A1+btUmxgkABxhAVlTAOWibC4RLSH+1cz1siOde
         pdRTAnbi0+bZN8vxqvGfskzOEHeGqOZzuunuwV1zIQYtr40/e9gcg7dgeTPfGt+Mh6yC
         vX/T48bJal2mLjIcGzycR9oYUVgXfLXd4WVK+ydl6wCf3kzuxKU0tbGyX6wJTqmls7ts
         pY0cDzNCuKnBFFfwEHujEG3uYL6GAQnn10is0tYE7F7PV0lz2GfWkZuSLCYqjInTpn4L
         fwiH8QgtOxcNKXctpvRTmoxTmBJaLeJyeHVGjQuca8+8oRhFlZaRaQ7nuuKKcj//wSNo
         ob+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BP0UK3wcxcI9siLJN61wegAnkIcJZPTuRRlaiymFIEs=;
        b=OdDbvm5LPHfSZvij04ktlDpEA9gJx+JPvYOEh2CAaveuO0ul8On3rBZ1NM8ihh0ZhI
         c2gP+FfzbrnfM+vgXUy03vMEcsOmXTxaj9nFnsVRzFjBXlA17PhwduC2jbYWFP5pEneo
         yg6nBFZSIUsmUjwTiCvZUBtoboH9cU1yU/scFHvcvE8T+fJw53zZP2YhwDe8JR3UvmrJ
         KZqGgpC1/109jEn/RDUKyZWs7VMt3i6vIFnmeGqi375GgjWgVmXdxptUQ8PyDFU86Sdy
         OgV2NPsTGXhR0Fk6/wlhBYsKUlSfTMdXwxAfQyPXOxRmzUFdLcDiZyw9lrSmkDKsnC+W
         MBJQ==
X-Gm-Message-State: AOAM532Qyh/7tVJ8htL3WM4y9eqdtgAOGeSNPzO1/Y/5p/sn5iCcQXYs
	bNBqovDIjzvpP1n63BTumfP+c2f+2KV0//OpZ/IP6TVZ88g=
X-Google-Smtp-Source: ABdhPJzB2L1Hv/ndF/7IR1yaVFt2l1kJj1Egi9Tn/Dj3tM8DIB8neIEzeELI3TNXwKg9sC/oPoUx5qvBubYYO1AaKng=
X-Received: by 2002:a0c:f80a:: with SMTP id r10mr3901131qvn.55.1614277701460;
 Thu, 25 Feb 2021 10:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20210225173653.2408-1-mac@mcrowe.com>
In-Reply-To: <20210225173653.2408-1-mac@mcrowe.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 25 Feb 2021 10:27:52 -0800
Message-ID: <CAMKF1sowtWr83XTLvxHO78GPeBq2nemQ=mQy6jpy8o0xV8NF9g@mail.gmail.com>
Subject: Re: [PATCH] gcc-sanitizers: Move content from gcclibdir into libdir
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 25, 2021 at 9:37 AM Mike Crowe <mac@mcrowe.com> wrote:
>
> In e9e5744ba8b0d43c8b874d365f83071ce20bf0a1, Khem Raj wrote:
> > OE does not use the traditional /usr/lib/gcc prefix to store
> > gcc-runtime it basically is moved into libdir, however some newer
> > files were installed by newer versions of gcc especially libgomp (
> > omp.h openacc.h ) into gcclibdir, so we have content in both
> > directories, this confuses other tools which are trying to guess the
> > gcc installation and its runtime location, since now we have two
> > directories, the tools either choose one or other and we get
> > inconsistent behavior, e.g. clang for aarch64 uses /usr/lib but same
> > clang for riscv64 chose /usr/lib/gcc
>
> > This change ensures that OE ends up with single valid location for gcc
> > runtime files
>
> I think that the same thing needs to happen in gcc-sanitizers.inc,
> otherwise I get errors like:
>

right. Seems a good fix thanks

> | .../recipe-sysroot/usr/include/gpg-error-64.h:884:11: fatal error: sanitizer/lsan_interface.h: No such file or directory
>
> when attempting to compile with sanitizers enabled.
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index 668e14a59f..67b755edf8 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -35,6 +35,11 @@ do_compile () {
>  do_install () {
>      cd ${B}/${TARGET_SYS}/libsanitizer/
>      oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/libsanitizer/ install
> +    if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
> +       install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> +       mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> +       rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
> +    fi
>      if [ -d ${D}${infodir} ]; then
>          rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
>      fi
> --
> 2.20.1
>
