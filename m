Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.625.1620238438790364782
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 11:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ScJMH1va;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id j17so1930616qtx.6
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 11:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z8sMNXbvnP/V4f3VUvc3ToFyH19smDIr3bm7gbfTOsg=;
        b=ScJMH1vaGsCuMDClOvi90W4AV+Ca8ADcsJRmMIg5f8WyK6wiDst1H01Pq0XlrGmfqn
         +q5EKT/Tzm1UsJCf5UrMBTlFPkYucTllZ7M7+GIRPG/YFZvt+oVFZaGsy37SN2/I8jsH
         DJZFoctNDib5gkyROvJmlEBlw3r74yUdAI2qffZfJ0zLuLrRGg6xAofLMsVOVXz4/N10
         ODdk9LBmqesXrFgzc4bgEMbciUBm27C2bgaMs0+/jOfHm5gXem/ChjIdb15WuDGtxKff
         /JSKd66EQPy966lAMyLwPhA49k1WsSb+DyqHB4r34ygmItqEoJxbkaEakv3A4ChzOd1U
         cS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z8sMNXbvnP/V4f3VUvc3ToFyH19smDIr3bm7gbfTOsg=;
        b=TCJPkvVglJk/vnWZ65VWDSmDu49qSLpUSdrzj4iBLap+tkUPGgm70Srm+fuWRZGS5V
         xz/MGcHV3MHf9hZA+XU2OIT/PpNBDO1GTw/oDO1CurEPQD+K4sWzgwENDrqjgCr22ZSB
         M2pGILncFqE3/LAvKX4cb7EFS2ocM7htFYjOCssebBIm60y9vpMcazlrHmUYlR61Stnt
         LskpiHKr6pW7MdkfOkWUltweHvMFXvhJoT0Cni0IzeVa55I8/SYJCbE6fmlAIGsliDV4
         8e8L53iiQQfKPEaaZcQlPfmMSdi/SQDMvzMpfpZSRtqa64oHn/bDmqsXn0Kr0C6hVX3V
         rLzg==
X-Gm-Message-State: AOAM533DwJkJsZQTXZXQyY0/C7hhugvCqVGVSV3J2euc6xRE0I/BTU1b
	sr6CXKd2c0gS0If8a+eWD4vklY2mBFiVQIlaryw=
X-Google-Smtp-Source: ABdhPJwUr+G9i0OrCkEBl4BMFlyUDJilfexkDoZxwGGn4MMP9znie0G3l+IfUFn9RJupl8MJIshlqbu8P/BJBROG1fU=
X-Received: by 2002:ac8:5ccb:: with SMTP id s11mr27858682qta.299.1620238437933;
 Wed, 05 May 2021 11:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com> <20210505151850.660512-23-alex.kanavin@gmail.com>
In-Reply-To: <20210505151850.660512-23-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 11:13:31 -0700
Message-ID: <CAMKF1srGBpzk-BiFnSM_+1pEoCByUkcPrJo2VDmSRUwGgbn18Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 23/61] powertop: update 2.13 -> 2.14
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Drop awful ncurses hack; please make a proper patch with a configure
> option and PACKAGECONFIG.
>

Lets not delete this unless its causing trouble as it will break
existing functionality that users might be depending upon.
if there is better fix please propose that instead

> Adjust LDFLAGS as somehow -pthread isn't there --> link failures.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../{powertop_2.13.bb => powertop_2.14.bb}         | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>  rename meta/recipes-kernel/powertop/{powertop_2.13.bb => powertop_2.14.bb} (64%)
>
> diff --git a/meta/recipes-kernel/powertop/powertop_2.13.bb b/meta/recipes-kernel/powertop/powertop_2.14.bb
> similarity index 64%
> rename from meta/recipes-kernel/powertop/powertop_2.13.bb
> rename to meta/recipes-kernel/powertop/powertop_2.14.bb
> index 8c7e78fd94..cb7f3c4dc1 100644
> --- a/meta/recipes-kernel/powertop/powertop_2.13.bb
> +++ b/meta/recipes-kernel/powertop/powertop_2.14.bb
> @@ -9,21 +9,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
>  SRC_URI = "git://github.com/fenrus75/powertop;protocol=https \
>      file://0001-wakeup_xxx.h-include-limits.h.patch \
>  "
> -SRCREV = "184cee06b2d64679bae5f806fe0a218827fdde99"
> +SRCREV = "52f022f9bbe6e060fba11701d657a8d9762702ba"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools gettext pkgconfig bash-completion
> +LDFLAGS_append = " -pthread"
>
> -# we do not want libncursesw if we can
> -do_configure_prepend() {
> -    # configure.ac checks for delwin() in "ncursesw ncurses" so let's drop first one
> -    sed -i -e "s/ncursesw//g" ${S}/configure.ac
> -    mkdir -p ${B}/src/tuning/
> -    echo "${PV}" > ${S}/version-long
> -    echo "${PV}" > ${S}/version-short
> -    cp ${STAGING_DATADIR}/aclocal/ax_require_defined.m4 ${S}/m4/
> -}
> +inherit autotools gettext pkgconfig bash-completion
>
>  inherit update-alternatives
>  ALTERNATIVE_${PN} = "powertop"
> --
> 2.31.1
>
>
> 
>
