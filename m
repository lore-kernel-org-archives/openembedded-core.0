Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.28.1602113470513060106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 16:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OtNQZI1J;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.67, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f67.google.com with SMTP id t25so5329174ejd.13
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 16:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N/YxAtWnQQC5fh1EdA4lMjHHrsJPaxelzf0tn6XlrqE=;
        b=OtNQZI1JRVis6oOm3JSdHPC67OpfUwLKzpFhx94LHj1xkYZ1J8pjLHXVmS5WHzrFMw
         57hGu/Zcmhid0mnoUGECJuc9060jc06bp1AfTFsZkqSUO6whsbjtZ+rcirRrezaX+pOR
         K+OAfeSbiT61IcgZTshroIqWNoDlu/IZCnnxEvUdJBGvvSDQQV6Oiah0wu5PowXAPe0+
         WiltjzcKyeW5N8L/x+LwFuMSWjZVwHK7ePKsx0xNGErfJkV3dHsTtmItu2y4p3NSgTiN
         71Xp6g1QRO+ccOqqLi0k+csEn87LxzftL8N/na2dmaLYCR3+EDXIlUlSgD6mL3bm9rEY
         KcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N/YxAtWnQQC5fh1EdA4lMjHHrsJPaxelzf0tn6XlrqE=;
        b=nxZVAqhMgwdxUeVNJhVrEQVwogA3CfOSAkT4murXw10Oxvm+vHARm6SQH0LPy/Nnr9
         j8N9Xd1mQ5XmTY9D6zcWFkwvvR6TF85isIyQfVGPSsYdI+3hamFLws3L1L+4bwc71tBc
         QS6AfeSvXuF1VA9c2H6nr48TomIUeNZUAAPk5U3SHkhlTkE8iLLhi4rf46qjaDK2D7Bu
         FCvDbrJxOFOG1E/lIfoqdT02YWcigRa/JFQ0v1mCvMIaoI6BlUOvOE1/0i9AkyAGl5CK
         xTU8nsSOtPZ1W7pAUUoCq8SIj1PRdSnRhq5Yg32uroMYw4/x89oPnM7SQpUh+g/XFwDb
         jzfw==
X-Gm-Message-State: AOAM531Icx/mYSw/GsSQfEFEseS2SF4uEEsKpnUHXC6aoDFKlkq5r6zT
	wTTZlLusc616Ggsmt9mvsABLgOpsuOMnIhZXbdmdHQ==
X-Google-Smtp-Source: ABdhPJwCIQUOCp6az6CB27Dd5oHU+0zdPyIF2zeG8Us23XYFm75ycRJXJoRyTBBcG+W41YLG8WuowWU4qK8eUVpV3dc=
X-Received: by 2002:a17:906:82c5:: with SMTP id a5mr5978407ejy.173.1602113468740;
 Wed, 07 Oct 2020 16:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201001161111.2889773-1-ross.burton@arm.com>
In-Reply-To: <20201001161111.2889773-1-ross.burton@arm.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 7 Oct 2020 13:30:56 -1000
Message-ID: <CAOSpxda5BNLoGSn1tDLYn1VDzAFJRKCVapOfaxR3HMJXjDxLzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] coreutils: improve coreutils-ptest RDEPENDS
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Suitable for dunfell? (again adapted for 8.31)

Steve

On Thu, Oct 1, 2020 at 6:11 AM Ross Burton <ross@burtonini.com> wrote:
>
> Add perl-modules to the RDEPENDS to avoid having to list all perl
> modules that are required, as this package isn't going to be installed
> outside of testing builds.
>
> Remove libmodule-build-perl from RDEPENDS, it appears that this isn't
> needed anymore. With and without this package the test results on my
> image are the same: 619 tests, 462 pass, 154 skip, 3 fail.  This
> *drastically* reduces the build impact of enabling ptest as
> packagegroup-core-build-essential (thus target gcc) is in the dependency
> chain.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/coreutils/coreutils_8.32.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
> index f8ae3fd94c..9d1eceef54 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.32.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
> @@ -158,7 +158,7 @@ BBCLASSEXTEND = "native nativesdk"
>
>  inherit ptest
>
> -RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl libmodule-build-perl make perl perl-module-file-stat python3-core sed shadow"
> +RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl make perl perl-modules python3-core sed shadow"
>
>  # -dev automatic dependencies fails as we don't want libmodule-build-perl-dev, its too heavy
>  # may need tweaking if DEPENDS changes
> --
> 2.25.1
>
>
> 
>
