Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.12243.1593829601342668836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 19:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EIBhsYgZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id o18so31739908eje.7
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 19:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iCVKBxNweLvF89UaaiNhTmQM2RlE+bDe8RqjEiJ94c8=;
        b=EIBhsYgZWkMXcu9/d+bx5ktJS9FfrLX6b0EkyPkGdec3076E3Qpn0xcm8ROjxAaAMh
         WkjcjvmdhsIcjDpi6kbLbAnR0nr4hf1c9wn9lXlSZ4tOugtbVxxdELDum4fyEOsN8wgZ
         Urf7jVS69XsujUEUxK/aNrhI8x5kjH21DU9gXT+7XFdPzshKjOFDjxnLVKXOZ0HLfiJk
         t9/WCNwA9HllHaByLE+aDxzUYF1fOiOI9lI5KgOBFhQaYOQKrrC6eGHtPcuNYNlah4ox
         gWQcaS9QWfedZIl+aYm/nRipeRUiXp5BT7NDH0xQtPjC/fewSiJBk6qHRTUquNxohpfY
         zU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iCVKBxNweLvF89UaaiNhTmQM2RlE+bDe8RqjEiJ94c8=;
        b=B3DKuDSY0/+gqaP9vF//eUGzZaKjpQV2zCjjPCVePrNrbMHpMGdKMwBHoCHY8vIFY+
         Tr9JV/qIo9oulLuCQQYXFI/dLntKWZR+0mfYEGtyp/X6zdtw5AKonAcqCfZPhxH/rUdr
         /1wwszlhHJVprkKeJE4xVrdBA3jENEg4kycaDlT1H77d+pULAcXh16lMXPWOLM11hv54
         esYpZ+oM9idcT/NOl2FVIbzodYaAIqCSO5N+ItVXg4iKbzOE+fFW9O3kIv64ZuPo3wcq
         nxMY+0r20yR8zvj6TJWbIk0H4YIKbZrvWY9diCpTrtiXH3RKrp7uUWgYEf4BcdIp/rIW
         rTgQ==
X-Gm-Message-State: AOAM532p08RBRNYxdGJE013R4qrWffgBia02jODJ+Z07RzldxngzL0Hi
	PLS9aur+r9j2t6JT4FAxUrBZkxDwll8VdpSOl2w=
X-Google-Smtp-Source: ABdhPJxdXeqyj+J07DTVZe9a46or7QHQStzkP3nB4gh/Li4iVxr5WdZ3dxHViiVGJl3UWyCH60l72eI/EQ2gwwFMXMk=
X-Received: by 2002:a17:906:4145:: with SMTP id l5mr34238193ejk.334.1593829599822;
 Fri, 03 Jul 2020 19:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200703135515.6934-1-yanfei.xu@windriver.com>
In-Reply-To: <20200703135515.6934-1-yanfei.xu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 3 Jul 2020 22:26:28 -0400
Message-ID: <CADkTA4OQYAg9zZ4HyxJdUN0VywTgQu4vmbdkJqov0vmkJg8NAQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 3, 2020 at 9:56 AM <yanfei.xu@windriver.com> wrote:
>
> From: Yanfei Xu <yanfei.xu@windriver.com>
>
> Some filesystems don't support symlink, then you will get failure when
> you install or update the kernel rpm package. Now we use a copy of
> image for these filesystems instead of symlink.

This version looks fine to me ... let's see what RP and the
autobuilder can find :D

Cheers,

Bruce

>
> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 20a0135fc9..b01c1699ae 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -94,6 +94,25 @@ python __anonymous () {
>          d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
>          d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>          d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
> +        d.setVar('pkg_postinst_%s-image-%s' % (kname,typelower), """set +e
> +if [ -n "$D" ]; then
> +    ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
> +else
> +    ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
> +    if [ $? -ne 0 ]; then
> +        echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlinks, falling back to copied image (%s)."
> +        install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s
> +    fi
> +fi
> +set -e
> +""" % (type, type, type, type, type, type, type))
> +        d.setVar('pkg_postrm_%s-image-%s' % (kname,typelower), """set +e
> +if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
> +    rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
> +fi
> +set -e
> +""" % (type, type, type))
> +
>
>      image = d.getVar('INITRAMFS_IMAGE')
>      # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
> @@ -385,9 +404,6 @@ kernel_do_install() {
>         install -d ${D}/boot
>         for imageType in ${KERNEL_IMAGETYPES} ; do
>                 install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
> -               if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
> -                       ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
> -               fi
>         done
>         install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>         install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
> --
> 2.18.2
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
