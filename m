Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.5899.1630418221774973805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 06:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kYQuuue4;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id g14so3788479ljk.5
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 06:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/AW9q93O8NlVZuj7KDqEQNAR5a76PhqI3sFCPoHd/vQ=;
        b=kYQuuue4+CBegbdZq3A/2+9ildrLf8cU6FvcvX2Uq4prZBw026CpSDKGSjEklIzFxn
         4onCjgcpWWCXOcI20FQ+DcfICok14xbav5Ofoz4EQLw+aw4NFE+NvliTF4GY3Jk9UBZn
         tmX8U5B8oBXB3oWiAIO3PosxXPk4MHGxO7ZkxV+ExzlDJ/A8r64GjsglD8JEKH9qKbXQ
         Jkwp6Vvv8ZeAc58Q+zVq5e0+Nsst+yp09r25phbSySDLDUMDHvytOyucuiw/d2JQ0GXB
         nmuk1lW2NMImQeSSAYpaHOgI2g85IbP2pgeyjiRubyeNi508qDyyE6wU7YWxw4VRoHOO
         18lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/AW9q93O8NlVZuj7KDqEQNAR5a76PhqI3sFCPoHd/vQ=;
        b=kZZtvY+UmmJdMXWFBGeCfJkjRWQaf814DgcnubQt4u2lE0pCeshOdVTIHUAQ4ss/eq
         BHkMzoZtMbE+U8nl1y2Zp5LB6mYbNKeprVtqU5tZ0q2wjcSuJiLyBoFF3pwzipHYJ0X3
         LqWT8x/PwQlS6n0iKSLwzq61BpmlKCrzABZ2nwt38H44/jzser65zq0NjtJBAi2Xpejf
         xEVjhIoSWXe+IhfamNBf+PFqeaRHjKeIAYArf5e9j82Zvk0o1oU9v79ocneCpl+uvVHC
         coTfDRaPV1t+5OcKyooU+4kq5gKTtM7OgUg9XaF4VOsqE5TteTy2aKC2wJLrNGX/U+sT
         pz3A==
X-Gm-Message-State: AOAM532GKQg18jn5RE+MMBJS3y4iw7jmEeLZ4OLyyPtPFRxt7/Vt0CIQ
	LL+RAM5oMXs/HTHDB+qDTts0hL42/Oj2WGrfJaI=
X-Google-Smtp-Source: ABdhPJwNGgLpRNbwbgpHfdLTPxJh28s7e7XbvBUb+0ZmXbyrkw9KQgYmDw4B+7xcmePnXn+bgKrqiqaDbFaUMC6gOsY=
X-Received: by 2002:a2e:97cf:: with SMTP id m15mr24637749ljj.125.1630418219825;
 Tue, 31 Aug 2021 06:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210831133042.867604-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210831133042.867604-1-richard.purdie@linuxfoundation.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 31 Aug 2021 15:56:24 +0200
Message-ID: <CAHtQpK6TFtwsrNuqjRC-eGd=x0J4N2KvdXK061TL+vW--avWgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: Use unexpanded EXTENDPKGV
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 31, 2021 at 3:30 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> EXTENDPKGV can contain AUTOINC so use an expanded form in the variables allowing
> for later expansion during packaging to avoid race issues over the variable and
> the build failures that can result.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

For what it's worth:

Tested-by: Andrey Zhizhikin <andrey.z@gmail.com> # kernel v5.14,
imx8mp-lpddr4-evk

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


-- 
Regards,
Andrey.
