Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.8174.1592922719529448800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 07:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DdpOhpaa;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id b15so1764724edy.7
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 07:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WSN93q17tSMHIv+roseJG4stIp2tFL+N8dI/oCPwfi8=;
        b=DdpOhpaaE8pwB8xDCDpBvZ40vY5mQ5SydSyvsPZYUf6AMox1CEJGhDT4QH3L1QHjy4
         2SVcVGmHH5paeNIxsYzQNgdNGwGKxGAaW9G8JklTgoVYZdzy0qhMzdRzNs3Mj5PEEZio
         rBatwejggLmyoYgMxkI4PKZY8/FHnrpyFs1OQr5fkh8LiTj4dOnn/x9u5SJJuRdBVCg9
         sDwuMqbRVSVPtNTFXhoJHS2kZ4/CPvXhw1dRJNbbyWWA7Kv6I/ESduHjh4LVCWOIzder
         7uJgObDwBH0Tt7qvFTiTvk+dWiUNdinoY1ZL3mmmUk1lbm4BSwj1nr6QqITlYoM0pqed
         2taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WSN93q17tSMHIv+roseJG4stIp2tFL+N8dI/oCPwfi8=;
        b=GjsH662e+jPwM1KJa7tIuUYrWljI1tUuSbG/lEZWPYK5lhyM1SapZt+C4RF4eWN5YW
         uWHhrNoqvY7s8mizP+2NWtdez0Ncvi7UFm/Gs8ZuUBRZg4y6nAtjD59gD2AQOZuiMXsW
         8SaxCoNqiNpL5NGB6FrTUlPxLgSCrEUYtBjJ82etiR9I5hJvpleLaLm1+xHB1s4wQaal
         +jzDz8Nw1jK2sMnTfk0CW65R5qy1qhDGJiCeWyaxJkzgc7p63GOG+JCpuHpfW6PlfJii
         3i+5QreBQ+rbxwrO2m9oBMXVp6rvUelio13ftxe2qpWaDVL/zWZZHBUeGEfdsxj6S9a7
         +6SQ==
X-Gm-Message-State: AOAM531Zk2WsMIewH2ERYFDXZOFcsNJcaIINdTrLM3KSh1naNn45qhgB
	OXKigtv6aSgKy/burMB4tOzoPz3R2pZidvTJXHo=
X-Google-Smtp-Source: ABdhPJyDtsKIxIQAq2JYxFYU7a32ReHXMENu1ZqknmMttMaLklEtCyClJ9y3eM27l2QVrsC9z21i/p/0soLvBNjyOBU=
X-Received: by 2002:a50:f385:: with SMTP id g5mr14763175edm.347.1592922718005;
 Tue, 23 Jun 2020 07:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200619114727.40142-1-yanfei.xu@windriver.com> <20200619114727.40142-2-yanfei.xu@windriver.com>
In-Reply-To: <20200619114727.40142-2-yanfei.xu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 23 Jun 2020 10:31:46 -0400
Message-ID: <CADkTA4NApB19MmwAWP3Mgtf+zNEtsPuSxL7h19S8c3FNoC2o4Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 19, 2020 at 7:47 AM <yanfei.xu@windriver.com> wrote:
>
> From: Yanfei Xu <yanfei.xu@windriver.com>
>
> Some filesystems don't support symlink, then you will get failure when
> you install or update the kernel rpm package. Now we use a copy of
> image for these filesystems instead of symlink.
>
> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 20a0135fc9..1269b54343 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -94,6 +94,22 @@ python __anonymous () {
>          d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
>          d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>          d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
> +        d.setVar('pkg_postinst_ontarget_%s-image-%s' % (kname,typelower), """

You were previously concerned about boot issues if the unversioned
image link/copy was deferred until boot. I don't see a summary of why
that's no longer a concern in the v3 of the patch. Can you confirm
that it isn't an issue ? Is it simply because the booted image isn't
installed via this package, and hence we are fine ?

> +set +e
> +ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
> +if [ $? -ne 0 ]; then
> +    echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlinks, falling back to copied image (%s)."
> +    install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s
> +fi
> +set -e
> +""" % (type, type, type, type, type))
> +        d.setVar('pkg_postrm_%s-image-%s' % (kname,typelower), """
> +set +e
> +if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
> +    rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
> +fi
> +set -e
> +""" % (type, type, type))
>
>      image = d.getVar('INITRAMFS_IMAGE')
>      # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
> @@ -385,9 +401,6 @@ kernel_do_install() {
>         install -d ${D}/boot
>         for imageType in ${KERNEL_IMAGETYPES} ; do
>                 install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
> -               if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
> -                       ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
> -               fi

For on-target installs, this is what I was doing in the past as well.
Make the symlink during package install, that way we are encapsulated
in that unit.

That just leaves my boot question as the last remaining thing for the change.

Bruce

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
