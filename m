Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.6526.1630420652992878724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 07:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=QccejU53;
 spf=pass (domain: burtonini.com, ip: 209.85.221.48, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f48.google.com with SMTP id q11so28080062wrr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5yHvnppDnnxBatOvcX4NbcoPLNYSiFCQccHzM/Ym18A=;
        b=QccejU53sUGCzuybWx7m5caYh9j9ijNK3P+UbFR5dhAY+4LsMxbCjEZelNkOw0BIdT
         87awSpAWsP1EE057bu1cNmwc7HR8Q+9nSyrulwR1ZpZObI5SS6zmrz6HMC562iFTJBbP
         U/DwJh0i+ITRTjaoeFDvvv5RHPHXpFXiDzNbdZOvQSGqLuEMxtIXTyOU9hwp1fL/VrBC
         L6V7yLnUJXmOZAQ6HI4CFHTWyxXQPuqOTUCkDdPm8l4pK9jGN5SkMeD7cPZcI5LPXU7L
         8q0nrb2wedw6He+8RZSP5NEZYK3+mK87Ei0PJMEm40tD/XWOrfSTZnpj/No4vtnYNg87
         HkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5yHvnppDnnxBatOvcX4NbcoPLNYSiFCQccHzM/Ym18A=;
        b=Vu4Oq5tE3ubAZbn3ftXHcPYRWhCZas8D8H7GA4qAZMpf1+dGbDoZXUrVe+HHZZ9m9P
         ShSuOF8Pf2z+n1yaEgMNlWvn4GHpsMdcY3z+2taJK4r+2b9DIejyqfitOAmiBw2b7xw7
         b8GMFKWyuUUSOFlXY9hqF4oVMqyFbWZsnt581MaNyodkcAY7rK1qng3m62hQD9X+uO8q
         n2WdpwGp7DS5+LX2YyBFdcef+xT0SSyojd5NtsL4RxGMRV4gn2Uy6rTIxjeF59scZ3fa
         lAd8blbFhSRjWV5RAkYB9wpfI50PzzToxFK0lBueSpOjHJNTvojC7BF9bnEk+64uZ0x+
         81XA==
X-Gm-Message-State: AOAM531gmbn9jmkom4MGogSU24MFu+gYtZYgd4jc3tspqjLoHLmfWs0H
	2e874LyLvhvNbgqN/71HW9mfrxu70U2emM0myqnzXA==
X-Google-Smtp-Source: ABdhPJy//utr141J53eQlYP+IFw/syZSr3zYjuedwSY/lpgRZjtzMxtKHnVKvhu0bx1WqzydWzb27ksidWVJQOCmCM0=
X-Received: by 2002:adf:9f4e:: with SMTP id f14mr14158141wrg.396.1630420651298;
 Tue, 31 Aug 2021 07:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210831133042.867604-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210831133042.867604-1-richard.purdie@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 31 Aug 2021 15:37:20 +0100
Message-ID: <CAAnfSTs6Wbobis81jti=xRRHDkoajXwUvCNJ8uHGtV9ZscAhtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: Use unexpanded EXTENDPKGV
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

My variation was just:

-    fullver = d.getVar('EXTENDPKGV')
+    fullver = d.getVar('EXTENDPKGV', False)

Either have the same net result I guess.

Ross

On Tue, 31 Aug 2021 at 14:30, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> EXTENDPKGV can contain AUTOINC so use an expanded form in the variables allowing
> for later expansion during packaging to avoid race issues over the variable and
> the build failures that can result.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/kernel.bbclass | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ab60e060c6e..d13c38fb026 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -92,18 +92,17 @@ python __anonymous () {
>      kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
>      imagedest = d.getVar('KERNEL_IMAGEDEST')
>
> -    fullver = d.getVar('EXTENDPKGV')
>      for type in types.split():
>          if bb.data.inherits_class('nopackages', d):
>              continue
>          typelower = type.lower()
>          d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
>          d.setVar('FILES:' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
> -        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s (= %s)' % (kname, typelower, fullver))
> +        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s (= ${EXTENDPKGV})' % (kname, typelower))
>          splitmods = d.getVar("KERNEL_SPLIT_MODULES")
>          if splitmods != '1':
> -            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (= %s)' % (kname, fullver))
> -            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME} (= %s)' % (kname, fullver))
> +            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (= ${EXTENDPKGV})' % kname)
> +            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME} (= ${EXTENDPKGV})' % kname)
>              d.setVar('PKG:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
>              d.appendVar('RPROVIDES:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
>
> --
> 2.32.0
>
>
> 
>
