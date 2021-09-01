Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.7906.1630502631048564933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EnONpQMu;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id i21so6684192ejd.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dkBXRS5RnLkzvS0yjiNGAyQU/ccbs9sFQnqQndlLKm4=;
        b=EnONpQMuWC6PO89emXqpXyf9W9bBGwFTY4+yrIk/rOcql7Vbe5t38DDvBX/XhzNKER
         VYzYQofLgkpGgW75xAqLWzdCC9I4uxrd9dOkH5nV19dRYUdbipe4LKR2m7gLY8TjLeD/
         zW+PgnuQh87oNKTK3RzF1qHLaFmS7FVZ7dsfDysFVXCYE6lprbU+g7cRcax0rdoS9y3+
         w8w6vfqMeY+qePE2VeCfKm0Nw63JG+eJ8FWz58f8PALmaFYa68163DSu2D7GA88iLNSD
         hhHvBCzEcbv2iqmUzmFJyp0Lg/OgkROOREdD830lVoQyfY57ESPqcF7s/BzAUTCcV4VD
         oQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dkBXRS5RnLkzvS0yjiNGAyQU/ccbs9sFQnqQndlLKm4=;
        b=g8PG1AIQvwBJzBUM+l2coBHw0zM6tZ0eYhdFyGNxggtaSfv3Aeq+ELrjwZ82/8uuPb
         LdR6Km+ko553PYjQGJVK69Q8N+OP5QMmPhuYc77bNXPmlTvDx671MSzZqo4rGouNjTzb
         e/kr+bKnsyI88uH2pTdLHV2/jVh4/EqPkDRjbYoeZEAau89/m24Mk8UsGn7yxxfFRiM9
         QBhtllP3na6HVvIlooISPr/gSanVEuAAsc8sUeAMt5Y82q1khhL5wgWKCeMkkjjpS2eK
         Sik6UMcB4T3EpWnwZcvqy1XJW4811pxF5DUsDgzDKlDLTgXLY8kMSWve+NsfVLV4Wb0y
         5MGA==
X-Gm-Message-State: AOAM530mP5yrpitTg2Z7lL2BBFCJt7W05kO5BKgQ4SiGduFigaLf9hOC
	yJtPCiqV4slpAUkuC++6cw7NDc4HhldD3MEmOjvY1zYaaPM=
X-Google-Smtp-Source: ABdhPJxA2c8f5828FLarI2j0iNAKrtgvTEvz4QGQyFPXqR9wSNHbswtCfffF9FzeNLSWrWKPGj2wJFDu/mDZZ8j/oiI=
X-Received: by 2002:a17:906:680a:: with SMTP id k10mr35810503ejr.298.1630502629471;
 Wed, 01 Sep 2021 06:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210901092020.116142-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210901092020.116142-1-michael.opdenacker@bootlin.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 1 Sep 2021 09:23:38 -0400
Message-ID: <CADkTA4NCnTW5Zx=UJ9Lk0szNdJqENZyZL=pNJVmMXanBHEYr6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meta: stop using "virtual/" in RPROVIDES and RDEPENDS
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 5:20 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Fixes [YOCTO #14538]
>
> Recipes shouldn't use the "virtual/" string in RPROVIDES and RDEPENDS.
>
> That's confusing because "virtual/" has no special meaning in
> RPROVIDES and RDEPENDS (unlike in PROVIDES and DEPENDS).
>
> Instead, using "virtual-" instead of "virtual/"
> as already done in the glibc recipe.

We have quite a few cases in meta-virtualization, where the same
unclear syntax is used.

I can take care of updating it, if you aren't looking at it already.

Bruce

>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  meta/recipes-bsp/grub/grub-bootconf_1.00.bb        | 2 +-
>  meta/recipes-bsp/grub/grub-efi_2.06.bb             | 2 +-
>  meta/recipes-core/systemd/systemd-boot_249.3.bb    | 2 +-
>  meta/recipes-core/systemd/systemd-bootconf_1.00.bb | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> index 151e601fd2..783e30bf38 100644
> --- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> +++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "Grub might require different configuration file for \
>  different machines."
>  HOMEPAGE = "https://www.gnu.org/software/grub/manual/grub/grub.html#Configuration"
>
> -RPROVIDES:${PN} += "virtual/grub-bootconf"
> +RPROVIDES:${PN} += "virtual-grub-bootconf"
>
>  inherit grub-efi-cfg
>
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.06.bb b/meta/recipes-bsp/grub/grub-efi_2.06.bb
> index 96e9df88b6..a8cc209a02 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.06.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.06.bb
> @@ -5,7 +5,7 @@ require conf/image-uefi.conf
>  GRUBPLATFORM = "efi"
>
>  DEPENDS:append = " grub-native"
> -RDEPENDS:${PN} = "grub-common virtual/grub-bootconf"
> +RDEPENDS:${PN} = "grub-common virtual-grub-bootconf"
>
>  SRC_URI += " \
>             file://cfg \
> diff --git a/meta/recipes-core/systemd/systemd-boot_249.3.bb b/meta/recipes-core/systemd/systemd-boot_249.3.bb
> index af2be162a3..b3d4e31e08 100644
> --- a/meta/recipes-core/systemd/systemd-boot_249.3.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_249.3.bb
> @@ -46,7 +46,7 @@ python __anonymous () {
>
>  FILES:${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
>
> -RDEPENDS:${PN} += "virtual/systemd-bootconf"
> +RDEPENDS:${PN} += "virtual-systemd-bootconf"
>
>  # Imported from the old gummiboot recipe
>  TUNE_CCARGS:remove = "-mfpmath=sse"
> diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> index 12c4447f37..19637546a9 100644
> --- a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> +++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> @@ -2,7 +2,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>  SUMMARY = "Basic systemd-boot configuration files"
>
> -RPROVIDES:${PN} += "virtual/systemd-bootconf"
> +RPROVIDES:${PN} += "virtual-systemd-bootconf"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
>  inherit systemd-boot-cfg
> --
> 2.25.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
