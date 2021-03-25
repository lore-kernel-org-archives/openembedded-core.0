Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.2630.1616701739897557811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 12:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ocqtuIVj;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id z9so3146919ilb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 12:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e/BjwN/KfcT/4gwJtJegBcSFQ0ZxuoBr4taGavdXLQw=;
        b=ocqtuIVj0uaUtfocFQ0V5rQmAvS/H3Gpn0m4MDV6TucXHngCaTaOmxqReKXdynpMJJ
         bQwsmJOUnSId1/WyMqC+aVYOCzkJxnZERHJB+DIIWcrEpWfq+UVhBYYjMbTXh7mWg0CG
         u2R2zJ7M4YV7PRKfozzfIbgD2+cy8Uk5rl1329k71gVxsfBCbO2MzIDBdAYlX79N0nGT
         QBiPGP7PUVlRocA1DSks5ndWIFewPP2iZIEwyPAqMQcCV8CSU1Z7qJ6prLEqgsNnGLFX
         3GqLowquiZcdM4DIhN5MlUJrY6JgqtyZWTxgkDR/osljnvC5lSITrJlW/vCwg8U5vi5t
         L9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e/BjwN/KfcT/4gwJtJegBcSFQ0ZxuoBr4taGavdXLQw=;
        b=VSPV0PSa0oHg8DAEV61ZRUQ+ljudUaIV1tB9DG4uRdgwttrSnSkBBXWMSnmzD0/oM1
         1+igl9Eh/eBZ359lq+GVPQmlmwHUjrUZqtLd0q9Gbphlhe8UHJ7DW33WPpZt2IfyCCWp
         q/K1CzidwDA3qBxKW0A+8CTwob/AHYkPObrCr+0mRsstob5ED/hZMZ0d5szuk7no9p9J
         yAYi67z7uQ3vCUi1HX1TyozBq1/FeeBhm/Svqukz2AMDPSeVHiEyfK1hESCex9ElqXK4
         7n9/jMQ08YZFirVz0avLCbyvGxGoLmqqe/h2UhqCK58CcdV8OKVYILsmphdWFg74E2Gp
         ec/g==
X-Gm-Message-State: AOAM5314Vbz3tqh5y3aJw++nPD7D8EWcWG0+fcnVBITxjaBbH1Y1+91A
	xuUAqCmV2xMpE34Ankq8pJCvXGICMamnOY4wx9A=
X-Google-Smtp-Source: ABdhPJyC2k8TgSeFmEUI4wkmQdtRl4fS+2GkW/6vsUU5JmnTYjUFduJxNpHND4V9ivzFusrJ6FpqjR7y7DaXGCXDxUg=
X-Received: by 2002:a92:cbc8:: with SMTP id s8mr3059557ilq.227.1616701739288;
 Thu, 25 Mar 2021 12:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210325041506.3558560-1-raj.khem@gmail.com>
In-Reply-To: <20210325041506.3558560-1-raj.khem@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Thu, 25 Mar 2021 15:46:58 -0400
Message-ID: <CAKmqyKP2u+86DvWL8mJ1M=63R7brSqinsgmfa4SO+q3Fowuz2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub-efi: Fix build failure on RISCV32
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 25, 2021 at 12:15 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>

I'm not sure if this is the right thing to do here.

Have you tested this does GRUB boot with this check removed?

From memory I don't think the original GRUB port would have been tested on RV32.

Alistair

> ---
>  ...sable-offset-overflow-check-for-rv32.patch | 45 +++++++++++++++++++
>  meta/recipes-bsp/grub/grub2.inc               |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/0001-Disable-offset-overflow-check-for-rv32.patch
>
> diff --git a/meta/recipes-bsp/grub/files/0001-Disable-offset-overflow-check-for-rv32.patch b/meta/recipes-bsp/grub/files/0001-Disable-offset-overflow-check-for-rv32.patch
> new file mode 100644
> index 0000000000..6547bf2261
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/0001-Disable-offset-overflow-check-for-rv32.patch
> @@ -0,0 +1,45 @@
> +From ce1cea0563011698e4a70c9a60e7da66b57ab1d6 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 24 Mar 2021 20:55:56 -0700
> +Subject: [PATCH] Disable offset overflow check for rv32
> +
> +Fixes
> +/tmp/grub/grub-mkimage: error: target 17c6 not reachable from pc=936.
> +
> +Upstream-Status: Reported [https://savannah.gnu.org/bugs/index.php?60283]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + util/grub-mkimagexx.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
> +index 00f49ccaa..6deb66226 100644
> +--- a/util/grub-mkimagexx.c
> ++++ b/util/grub-mkimagexx.c
> +@@ -1297,9 +1297,10 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, struct section_metadata *smd,
> +                    {
> +                      grub_uint32_t hi20, lo12;
> +
> ++#ifdef MKIMAGE_ELF64
> +                      if (off != (grub_int32_t)off)
> +                        grub_util_error ("target %lx not reachable from pc=%lx", (long)sym_addr, (long)((char *)target - (char *)e));
> +-
> ++#endif
> +                      hi20 = (off + 0x800) & 0xfffff000;
> +                      lo12 = (off - hi20) & 0xfff;
> +                      t32[0] = grub_host_to_target32 ((grub_target_to_host32 (t32[0]) & 0xfff) | hi20);
> +@@ -1336,9 +1337,10 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, struct section_metadata *smd,
> +                    {
> +                      grub_int32_t hi20;
> +
> ++#ifdef MKIMAGE_ELF64
> +                      if (off != (grub_int32_t)off)
> +                        grub_util_error ("target %lx not reachable from pc=%lx", (long)sym_addr, (long)((char *)target - (char *)e));
> +-
> ++#endif
> +                      hi20 = (off + 0x800) & 0xfffff000;
> +                      *t32 = grub_host_to_target32 ((grub_target_to_host32 (*t32) & 0xfff) | hi20);
> +                    }
> +--
> +2.31.0
> +
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index bcff676c26..d8a556e06c 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -19,6 +19,7 @@ SRC_URI = "https://alpha.gnu.org/gnu/grub/grub-${REALPV}.tar.xz \
>             file://grub-module-explicitly-keeps-symbole-.module_license.patch \
>             file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
>             file://determinism.patch \
> +           file://0001-Disable-offset-overflow-check-for-rv32.patch \
>  "
>
>  SRC_URI[sha256sum] = "2c87f1f21e2ab50043e6cd9163c08f1b6c3a6171556bf23ff9ed65b074145484"
> --
> 2.31.0
>
>
> 
>
