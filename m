Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.612.1596586495341540345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 17:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b8A+w0w5;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id h21so26051103qtp.11
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 17:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npTJYwnZsC6wN1GDtmNXXeN4HhJBzrLjmHQRzp3aARI=;
        b=b8A+w0w53rDdT84c5XFCsKH/MAqhzuuKJj0mHWYzCMVERfx5a40eudXlyLPDO5kE5V
         Dc8YrYKunXN+AGLWWIxnhp9/FqKyx3TReAE6EqQyolerKL3hYZNiurVnRWKGBNohjoTw
         EeDoBSSfOcp1ef817hLjoUTYdtrdOBZVrVWkHqbnkdWcMWmor5st3AK4ilmqVJoCdi+7
         DYquQ6g4JcP7nNDa2qFuP5iaiHMLW7Kk1u8AuhjXmns3A6z1jTdXNoqdr9n5jI6gtK1s
         n7DV/hxI3wGoNpzZUpQ17E15T9uqgtNdZ6nAurxcQfvNKkM7s0XFkzYMMDi3PaQnVQXi
         HNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npTJYwnZsC6wN1GDtmNXXeN4HhJBzrLjmHQRzp3aARI=;
        b=LUDFxRFkjBwo1VSw4QVWDNJMlyvWYTzdGgWQONE8OkFmXC62gaeZlqlETFe///OxYU
         zy8BfMCPfSKxlWhD9+eyE36UM5c7k5eHJGAGVDbY85/ddbdvknKJdwhtBQ5r7/MMqR7h
         wRk7PnBOvQgi49mfcfUDuC5t6SfXGKdGn3WQvQyQ4ldVZZl5WsSNtSAm77BzyhfPl4Pr
         F1isli0Gz33JnKy9HVtG42Iz3ypHM9Dzt890sBysqOwVKayFP5iTt5gO/owmQ8+5RWjl
         nuWRbg+fW5FB0X/apGXwHfyxaeTDQQFUWSphtUdS2Ne+4bvXqPMNx5SjSi+A7id0e4/U
         OStw==
X-Gm-Message-State: AOAM533vqu9x5NBQo+p9cbL0OaE8UIhs/eTr95hdUL7waIJ37JUGw6uq
	M5Axltlblz2TrfkPouM0k6U+AAYNps0PDEaZjLs=
X-Google-Smtp-Source: ABdhPJyNkzovXrXlk0m+os8HKjDiSnctdY2I2q+0l8czKJAITQ1XbiVl+qq17T0JhAq0UXTM3iYwRqq6oAyeDAWd8aQ=
X-Received: by 2002:ac8:748b:: with SMTP id v11mr666759qtq.293.1596586494370;
 Tue, 04 Aug 2020 17:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com>
In-Reply-To: <20200804082019.76320-1-jacob.kroon@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 4 Aug 2020 17:14:28 -0700
Message-ID: <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 4, 2020 at 1:20 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> It has been almost 3 months since the upgrade to gcc 10. Switch back to
> relying on gcc default configuration (-fno-common).
>

have you done a world build with this? In core+meta-oe I still see 70+
recipes failing
what will be good is if people start sending fixes before switching
the defaults.

> This reverts OE-Core commit 951e859b1e8297970278c539e989b8a6d06a9cb3.
>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index 6cb40fcb74..a64c4caf00 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -34,7 +34,6 @@ EXTRA_OECONF = "\
>      --program-prefix=${TARGET_PREFIX} \
>      --without-local-prefix \
>      --disable-install-libiberty \
> -    --with-specs=%{!fno-common:%{!fcommon:-fcommon}} \
>      ${EXTRA_OECONF_BASE} \
>      ${EXTRA_OECONF_GCC_FLOAT} \
>      ${EXTRA_OECONF_PATHS} \
> 
