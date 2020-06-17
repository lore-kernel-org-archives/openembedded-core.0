Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.732.1592435524589676926
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 16:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ImjCG5sx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id x6so4069874wrm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 16:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=yHUlFXZBltWorVbiPSPk9Y9o+vbCN08xpjtMEbwSs+g=;
        b=ImjCG5sxMKSlFfrs0HKlwZJ0pyr1lPxNynBp+BlTgZEhFI4vIoRYMBkqkoyjEPZ8Gs
         DyOc3fWC8adjPN0ZF76JZ11eHbkzT/FapvYzLPsdE6dFKvic1G6qv7kzeeXDPd0kOt4G
         A0Qt7eFuFV4ArEZZf3Lu0a0E2HxVwhM/QqvVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yHUlFXZBltWorVbiPSPk9Y9o+vbCN08xpjtMEbwSs+g=;
        b=Qw8yCrJsx6y9cs5cTA4RIK1emLJzZbfrZKnVYL/sMel84+kFg4VFWej7OoWPoXQDWb
         Kd1f+aIHsoOsoqyW93DNRl2P8MyQx6UAH+g6+Y51lVsYUbbhp+64nzoMOjgDTeiqHXXv
         ZwCtgM3hQCQBMeoczhGMRzp7czU2L7AQKAmHAzCLWTflh03nzUrLAQL1pyXIOnDruvyD
         qt5NNbxAf7SsHcxk4dRYUKXQRhm1vpnN5ygevXHb2S1///f6N06nV785xB6JBC/+TfAE
         OmC7IOJydMFyxmmoK/OOwGQ9akFITZ4FPqja7Xsm3VoTOAZceG2fn/a7eovJnSl5s3Uy
         tQmQ==
X-Gm-Message-State: AOAM5304bt33DvXZQNBZwxX9HLPtiZlzEEcUIltZYbxqLEkI8tDUrIfV
	DENetahdptuG5HlcnqfWXw2ZmQ==
X-Google-Smtp-Source: ABdhPJxUoaPDW2uz52up2+suDcxG6UAKZU7N7hUNnhUvMoOc3PlUpk46/mrQ8dLe9IXMGCV47CrDGg==
X-Received: by 2002:adf:f885:: with SMTP id u5mr1491353wrp.402.1592435523074;
        Wed, 17 Jun 2020 16:12:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c16sm1266380wml.45.2020.06.17.16.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 16:12:02 -0700 (PDT)
Message-ID: <afb6222235af73893eb979a1f486108e902d4eaf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] grub-efi-native: use RDEPENDS on grub-native instead of duplicating tools
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2020 00:12:01 +0100
In-Reply-To: <20200617230710.9163-1-christopher.w.clark@gmail.com>
References: <20200617230710.9163-1-christopher.w.clark@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-06-17 at 16:07 -0700, Christopher Clark wrote:
> Both grub-native and grub-efi-native included packaging for the
> grub-mkimage and grub-editenv tools, which prevented concurrent
> installation of both the grub-native and grub-efi-native packages.
> This caused errors on image generation with wic when populating
> partitions with both legacy and efi boot support, so resolve this by
> removing the duplicated tools from grub-efi-native and add a
> runtime dependency from it to grub-native.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  meta/recipes-bsp/grub/grub-efi_2.04.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-
> bsp/grub/grub-efi_2.04.bb
> index b9d6225d27..ed43dee152 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
> @@ -6,6 +6,7 @@ GRUBPLATFORM = "efi"
>  
>  DEPENDS_append_class-target = " grub-efi-native"
>  RDEPENDS_${PN}_class-target = "grub-common virtual/grub-bootconf"
> +RDEPENDS_${PN}_class-native = "grub-native"
>  
>  SRC_URI += " \
>             file://cfg \
> @@ -61,9 +62,7 @@ do_install_append_class-target() {
>  }
>  
>  do_install_class-native() {
> -	install -d ${D}${bindir}
> -	install -m 755 grub-mkimage ${D}${bindir}
> -	install -m 755 grub-editenv ${D}${bindir}
> +	:
>  }
>  
>  do_install_class-target() {

I think we want to PROVIDES_append_class-native = " grub-efi-native" in
grub and then drop the BBCLASSEXTEND from grub-efi?

Cheers,

Richard

