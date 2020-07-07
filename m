Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web12.24266.1594151279740581170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 12:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f5zVExN6;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id p25so15382870vsg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 12:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XkgPfn/OQ999DqA8CyGY0eqnG0HUkhWkZVE5vyrjsIE=;
        b=f5zVExN6kAx226aDm3k0s+C8N1qwCrCMxNvLeyF95Q9v3EH1PRLfRjNAg7g2Dc4qix
         gK8kAySxy1B88gVg+fpcCimIa2d4vgwPf3nIwVsFtMhrARzIk5u3mxNg1oSd4RyfZ5sf
         u8az5IF2bHhA3R5DOXfHUnU+6mNUtz1dxykQc8nDwwuBIfOnWnPkxT4rsrqldDTDgbyz
         oj+QdNlrcU+V3LaPxU8mnmceNAWg+ll5VKjVvLF3s7HHKRyX7rouhh3uGSr8wN1tGvrC
         ZQAUModLbiMTwqCVMDAw7EX/YCdHcnNS6360So5S5nqa3wV9nhFoWGqDrvbPvM78rV3J
         3fxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XkgPfn/OQ999DqA8CyGY0eqnG0HUkhWkZVE5vyrjsIE=;
        b=UgHP4KaHFzLnnQYkqbNfELSx5t8x4STllDcdXediIp47nbhWwA1erW1K90dIiuZy5s
         99ZBpnnLsj/V8frJok1gVCyuF9SWzc/Q3PogOJFmEjKwrwQsazaL8TlwWjyXY3DFJ2qA
         mxs9N4KEI/tATJ4UO3tpgGzdTjkAvDMiRaqdGBkd9OuFJVSSM6otVcQNZrF2O7PtT38U
         ZBzNGvJ9CPTmFAmk1efLl6+YHlsSL4JUvYFlO01KP8ltFuXVnrcbHbYsc7LacNoq7d5b
         oXE4ztYIi5tI0oSK6GjoPQlifwjhBvbvushkfz/Bj7++jg3rPoQLuTRQ6eZSSaStjVle
         IFmw==
X-Gm-Message-State: AOAM533LnTOm8chKXlpc7W5PCG/UGKyOoVkyd6FmYdL0ZafLCyDdeYMR
	7If2Yu/L3mMiNww83aJZrOsngx85fqoLSzPhtP4=
X-Google-Smtp-Source: ABdhPJzowrhl0E+z4R3YNf9HE0c8snVnWLLgIAi7mUv9UCSzh7dirGAaBX2FqeBWHcQ3J4/HnGRX/sfshYLU2XcgSBY=
X-Received: by 2002:a67:d086:: with SMTP id s6mr18687436vsi.130.1594151278797;
 Tue, 07 Jul 2020 12:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200707092511.7781-1-timon.ulrich@kabelmail.de>
In-Reply-To: <20200707092511.7781-1-timon.ulrich@kabelmail.de>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 7 Jul 2020 12:47:47 -0700
Message-ID: <CAJ86T=XYCDAD1jG2JTODSc-Oz9JmpPeNd0jXg9aeJbo88pciWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: make dependency on lzop-native conditional
To: "T. Ulrich" <timon.ulrich@kabelmail.de>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Timon Ulrich <t.ulrich@anapur.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 7, 2020 at 2:25 AM T. Ulrich <timon.ulrich@kabelmail.de> wrote:
>
> From: Timon Ulrich <t.ulrich@anapur.de>
>
> a native lzop is only needed when an lzo compressed initramfs is actually present

Is the logic actually that native lzop is only needed if an lzo
compressed initramfs is present AND and a plain .cpio or .cpio.gz is
NOT present?

> Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
> ---
>  meta/classes/kernel.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index c834aad033..3230c12ccf 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -4,7 +4,8 @@ KERNEL_PACKAGE_NAME ??= "kernel"
>  KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
>
>  PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
> -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
> +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native bison-native"
> +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
>  DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
>  PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>
> --
> 2.17.1
>
>
> 
