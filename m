Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.313.1608143306199376934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 10:28:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dSsHstFT;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id d14so22943873qkc.13
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 10:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4lZwUG8DH3hGFU5KV6vpZeHk/wiLMOoSu7a4ni/kF9c=;
        b=dSsHstFTEpM8YEN2hDFHWhzvrbdGhLYOSRruM0+2/R0aOFKuO6EOcXuVfKTYI81klP
         hFjsP/ZE6Hv7pCrTcHmJHXdDyctDucO97BRyMNLuactjTcjU7jvyVNRo6zGjT5j3kg/V
         M84n8R/P9to+kbEvgnyP/C+7MZVyicASCH0+gACBSja+yfH9/ayp2BO2REwesHy1Aazt
         SnvWEAdYQT+3liY3/mn/QCSeJinnLhgkXs7nKhbkArukaOM2tFhA6RoXARmU+3FihMwv
         zVpXhlxxECld1Kyz73ULU//c/XS3JRuMd7TUnfRGJrTuyCh5aHa3P0Wsv6Dbg5iYFWzT
         lsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4lZwUG8DH3hGFU5KV6vpZeHk/wiLMOoSu7a4ni/kF9c=;
        b=EGDIWIzPkmmpcpgMGONcn8ulwuuqfsx3bRnkjBQz3Cqo63njU2tlOo8ZqvOUj/meNx
         lRMMyUfELLIecYu/9oCOCmtB8czQPGJMV+T6UuBOCJ53NBs3JUhfE0mm9qHxuEX6BKfY
         nKyGf2Jfyw6cdP6uNTH9Qat3YClnyuIWhs7CKVeKoaIp3x9BIpiB48uEb4nb6s/YJfbA
         ogtTL4wEr1QKc2FGYlTtNcnpPHU+y8dZ/3tWjBJcF9hSsqFgbu5iXGjQfRmx3MXzKLsQ
         UOtNiG+WxX17MBB5zZfc4rhOsyRIJj/HnUIt30aYLrq8+qs3ziaNSyLUiErHpmPDTCoB
         M1Ug==
X-Gm-Message-State: AOAM531SxlwRAKC4HwscNhUSsfbJs96NH/Vo5OJNSqXN7etNCUHjyOQD
	ZYlW4az7lbDFgbwMNt1dBne2z+tG0OL8wy3ZVb4=
X-Google-Smtp-Source: ABdhPJwB/BAeGmOxGcj9sPtOg/WC2d7m1yQaXZgJDLieJzbp/zHcpEu0gs4UV0a84e+yfcIdkU0keNbN4cW+XVaisgg=
X-Received: by 2002:a37:b182:: with SMTP id a124mr46182670qkf.9.1608143305234;
 Wed, 16 Dec 2020 10:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20201216073754.4371-1-alanp@snowmoose.com>
In-Reply-To: <20201216073754.4371-1-alanp@snowmoose.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 16 Dec 2020 10:27:59 -0800
Message-ID: <CAMKF1sq+_YGUfaKVDYW8APSFdMDC8BWV+Tdf4mm+XjJ+w4_BvQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: add libopcodes package for perf
To: Alan Perry <alanp@snowmoose.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 15, 2020 at 11:38 PM Alan Perry <alanp@snowmoose.com> wrote:
>
> Add a package for libopcodes, since, like libbfd, it is needed by
> perf. Without separate packages for these libraries, all of the
> binutil tools get added as well.
>

libopcodes is not an API that binutils publish for wider consumption,
its meant for internal components and
external components can use it from binutils itself knowing very well
that it will change with binutils and therefore
I would prefer to not separate it out into separate package like this
which can appear as if its an external API
that binutils will respect.

> Signed-off-by: Alan Perry <alanp@snowmoose.com>
> ---
>  meta/recipes-devtools/binutils/binutils_2.35.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils_2.35.bb b/meta/recipes-devtools/binutils/binutils_2.35.bb
> index 2e645e1ed8..976e49765a 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.35.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.35.bb
> @@ -52,9 +52,11 @@ do_install_class-native () {
>         rmdir ${D}/${libdir}64 || :
>  }
>
> -# Split out libbfd-*.so so including perf doesn't include extra stuff
> -PACKAGE_BEFORE_PN += "libbfd"
> +# Split out libbfd-*.so and libopcodes-*.so so including perf doesn't include
> +# extra stuff
> +PACKAGE_BEFORE_PN += "libbfd libopcodes"
>  FILES_libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
> +FILES_libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
>
>  SRC_URI_append_class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
>
> --
> 2.17.1
>
>
> 
>
