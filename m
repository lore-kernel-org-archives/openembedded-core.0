Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.70.1589903841121836807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 08:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gE5Bc3Fn;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id l1so11544573qtp.6
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 08:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LfkxcOnP0If8R1WFe1leOHCctakm9UHelX484+SDuV8=;
        b=gE5Bc3Fn9Gq+lK2j3mymcRsEmEW4iMrhF7N3HlQ1ysCaSowfPu8LDtm72zeHPKch8R
         EtkAeaLeKYYJxHBMS4a+juJoZAx/x6CbFYd3+Tr/LT/DLsqXkrWEQlP+kCSQzGB7VfvD
         J39lU788HnwZF3igzVjtyP3DRqKQsXvUlPL3yPc64YFFO2KcFD6Y1Qk+DX6BTtIh38U3
         YWuJTvBP9aOu6XhEo5N+HABvDXpcYJpFbAgcMk7/REvIFL7prXDT2jisW9lnKx4ce9cU
         oBdTbyB4FN2fBbo11nJvTTO4ux8yBYkHyW2fwC8JHLQojkXK2BRO1rNlP0Woz7sI67vS
         fkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LfkxcOnP0If8R1WFe1leOHCctakm9UHelX484+SDuV8=;
        b=NCp1yhTL6WcpGBkB27UkkAYtmDDNAjC3Civ8YFGEdYy/8sc313L1jUOPPvcz6jivBo
         SLQdtZ8qPhpqBfm+u5SfF5SM72y05GWve6dAc/GnUr4Rjg3OyKAvAREjfXQMLuETAkp7
         yKSRn4nZm+iAXcmbEXMwohBTknUDRgzLYoeliuQMDSAPX4lGdDaU71O4WPqusze81/TG
         AxyjGRl6TvYhehk3lXk1yNV+MxDflMMF2Fry0px0NGO0Wb7h/iPpWx/o0EisfxKJXMx2
         ZSgcNLpBCMk3d76w+H8Ny8OR/lbBX3NcK18YkcjKcKNC20mVG5V3uHBdv4wY/pR9j7TZ
         lxYw==
X-Gm-Message-State: AOAM532/3XgM8vIZMBzVIYqY+g0PaNcsP5aBOtF0ejq5Rzn+vK5ux5nJ
	DS+sFfLSomirBO01Lp3seKWjzA5oFeNfSLgIFAh8GpNT
X-Google-Smtp-Source: ABdhPJzFDktjzMzsNiJWulVy1M2JkVrGrx8A5R4EmKjcgwnszi/yFaLrgQKvhum+vLd+8TZhQCfkc5FtxNTSoXLV9cg=
X-Received: by 2002:ac8:4e2c:: with SMTP id d12mr379043qtw.293.1589903839967;
 Tue, 19 May 2020 08:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200518082755.4198-1-marex@denx.de>
In-Reply-To: <20200518082755.4198-1-marex@denx.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 19 May 2020 08:56:53 -0700
Message-ID: <CAMKF1spr8k9Tju-8DBfbpdMpY20aDac_+jSeYGZv=_PShvQ9Ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libubootenv: Depend on zlib
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Stefano Babic <sbabic@denx.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 18, 2020 at 1:28 AM Marek Vasut <marex@denx.de> wrote:
>
> The libubootenv depends on zlib as it calls at least crc32() from
> there and links against it. Add the DEPENDS entry.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Stefano Babic <sbabic@denx.de>
> ---
>  meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> index 3251d0f05b..fa90a12bf8 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "U-Boot libraries and tools to access environment"
> -DEPENDS += "mtd-utils"
> +DEPENDS += "mtd-utils zlib"
>

should this be a packageconfig

>  DESCRIPTION = "This package contains tools and libraries to read \
>  and modify U-Boot environment. \
> --
> 2.25.1
>
> 
