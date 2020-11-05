Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web08.6088.1604574986799617834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 03:16:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i6vp4QDC;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id k25so1143400lji.9
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 03:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zs2oNVH9kovn6p64+oQS/fDul6xCCPmWzGEBx9CGR0s=;
        b=i6vp4QDC+Xps1XIZ3C6rSWNboA5AuiptqzEun+EN6o3fvx816TVItOGtEeeVUFHnZi
         6uJocpE6+/SqQeCibaoL8+mwpkz+4Phnlx3KTjO8zdtR/f8SvN4B8e83Kgqv1IXwipRI
         8n3k3JKizKafco3r3LJu8MV4PQ+R0z4zjGpgZzFrxwSxOSDdpSt1gL3B1N50XxP/Zpnb
         BYDHHgbWFf+lvnJ10MJb+0S8uocGysXsa0lH+wTjeSjOe/oRmwRagSxKcNLe4wcQ/jZi
         Ltz1jJMHck0QWyZJ9w1npJxQHYQnd3CkJfMIiMuJdglZ2+/C5mxuv+srpHULbeFczDyS
         urVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zs2oNVH9kovn6p64+oQS/fDul6xCCPmWzGEBx9CGR0s=;
        b=PXn+X38eoO5gFA4CxKYmtKx+//Tt4Lnw2dNzh9fuj76E4sa3HtEcZMYnpz0lGBNkDm
         Wa/CWJ9F2psb7FO/8aKpAs9LSnKSuz8I+ncTbsYcTZrqmeBGbL3y4BXhLWRqDAXqmOxe
         ogZIbLsdXdGX1tl5IR9ijaMFy949QnoKstGTkJglcWA403ZdLFqt07Eop7oZ+KPLXsSl
         agjVfvS3qmPr+J9M0+j3FqBg+/yUG8d+ngLrSlnh+Ab85nzj8mLi8n/MEPAnpLA6XmCH
         X96A0kllxCLuZHfT9PfPzylBw9SfCLCp1SbvF3vqgqCFdZ2mF7v6MycuKFOzN/B9CaN+
         chpw==
X-Gm-Message-State: AOAM5300xptY3X0c2Wu1nAuS8JoDHUceKLBW1Ow64c8PLoKLSIQ45PTn
	NBKhHdsc1M47cuPdu1+R/JLVNOC6n864HRinICg=
X-Google-Smtp-Source: ABdhPJwjSkDtjFtu0k4z7wWPj1wDHlStLDhVg/9uAiMPKg4vFenAsQ9SwSU/PCDQibhZKtb3fhhyr9+oKt3YMlQViv0=
X-Received: by 2002:a2e:6a07:: with SMTP id f7mr760092ljc.221.1604574984969;
 Thu, 05 Nov 2020 03:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20201105110247.417380-1-nathan@nathanrossi.com>
In-Reply-To: <20201105110247.417380-1-nathan@nathanrossi.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Thu, 5 Nov 2020 12:16:13 +0100
Message-ID: <CAHtQpK5JHsZ7H-y521+Bfaf0L6kz9ixMm_b7hCsdHinoWAG1sQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] vim: add nativesdk to BBCLASSEXTEND
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 5, 2020 at 12:02 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> Enable nativesdk build support in order to be able to include vim in
> nativesdk targets (e.g. buildtools-tarball/sdk). It is useful to be able
> to provide an editor in a relocatable form for when hosts do not provide
> an editor.

Is there any reason why a preference is given to vim in favor of all
other available editors? Why cannot a user install any editor of
choice on the host system or inside a container?

AFAIK, editor is not an integral part of the build system and is not
considered a build tool, therefore does it really make sense to pull
it into buildtools-tarball/sdk?
Maybe I'm just missing a use case here...

> Additionally the vim recipe provides the xxd tool.

This is a "hidden" dependency that would be pulled via this recipe...
I'm not sure this is a good solution, especially when somebody would
opt-out from vim package.

>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
> Changes in v2:
> - Add detail to commit message
> ---
>  meta/recipes-support/vim/vim_8.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_8.2.bb
> index 709b6ddb55..7e4654e472 100644
> --- a/meta/recipes-support/vim/vim_8.2.bb
> +++ b/meta/recipes-support/vim/vim_8.2.bb
> @@ -3,7 +3,7 @@ require vim.inc
>  PROVIDES = "xxd"
>
>  PACKAGECONFIG_class-native = ""
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
>
>  ALTERNATIVE_${PN}_append = " xxd"
>  ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
> ---
> 2.28.0
>
> 
>


-- 
Regards,
Andrey.
