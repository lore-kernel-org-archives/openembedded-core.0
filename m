Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.7836.1617283345555467963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 06:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CgS+j8Vn;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a7so2872362ejs.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bRDZ3tk8YP0zGrDGB2BqvZObXt0wGhG2LmOpBQpnjYc=;
        b=CgS+j8VnOUH8sV8qVayPYyLRKmZ5cGKQ9k9+GWpkm3hemsahN168XjwtxsjAvcd47w
         CSxrrJ7ye8t4SFJQzP1vDtk/W//0uHjMsh2LMxgC/7qy9jiZYDaIA47yisjO5TQStoAK
         LpaPUPlLbSjJwhXwIEhTfEM9D82CjA0y1zNK90LmNiQMDDbbQ3k0QPr4WYz/BOW1CbHW
         K26gN/PvO9GkKt0ndOEFmcRkLgRg700Zgkgx34G6smbfnxRFDVqFCN94v0HPWZjv2TBH
         NdWjEH4D+cSwLLFdNsEQIjBTdVQrog9TsgG9z/lp1lIzIl2owUg8zeNS6q4UiPeE8/Dk
         eApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bRDZ3tk8YP0zGrDGB2BqvZObXt0wGhG2LmOpBQpnjYc=;
        b=m5CGHHchRn1TtYc7UYRBuoUaMdhfYgcfIcWGq62BG2ltrCQ+fkz29W3+C23+ll8e00
         eKZPAxhgChx7yfBQsFFFqtk++9kLybi8Kv8dssO2P2nQza7q+uzrSQpCGWb/z4B4BOnc
         gUBQZWR1DWQd3Ka/v6l7RGDmVj5cfScX/CW0IyLJiZ7mENp0YVysjmYMF1kf9MWenjDN
         jcqrvdEaxLIB6Mnftp8Yj6bp1nUWxvB1kZ0EwP4TgUeG7++shgvMT04G3aCj4FhjdcXA
         g7rXSk0z6TETn7QEtqad4xrYGRyoIPhvQrz8UB6ldKuOKPmrhNoCqMbOukDM79rmn3Vj
         BDJQ==
X-Gm-Message-State: AOAM530SCpG9e4jaJJAwcfBY0V6cp33rxQzgT76Y5kCFTMOrH0e849ft
	DjD9+jT2cMfD9+3TdBGsY0vnK5xaCxjzmHLpspw=
X-Google-Smtp-Source: ABdhPJwC41mWZSImOibl06wJhv2C4fw0RPSWOfx1t7p70Nh2Lf1UwoZBZOLUmTGcpKxSX9/Tu0Q5tLMLfog5l0p0IBw=
X-Received: by 2002:a17:906:9bdb:: with SMTP id de27mr9207856ejc.459.1617283343954;
 Thu, 01 Apr 2021 06:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <1617235191-37594-1-git-send-email-denis@denix.org>
In-Reply-To: <1617235191-37594-1-git-send-email-denis@denix.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 1 Apr 2021 09:22:12 -0400
Message-ID: <CADkTA4PmeaiFRZLxFkJ=TJnWLcMHYnEn_tvNUwZ4N+uHV05S-Q@mail.gmail.com>
Subject: Re: [PATCH] make-mod-scripts: pass CROSS_COMPILE to configure and build
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 31, 2021 at 8:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> Fixes:
> |   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/checksyscalls.sh
> |   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/atomic/check-atomics.sh
> |   LDS     arch/arm64/kernel/vdso/vdso.lds
> |   CC      arch/arm64/kernel/vdso/vgettimeofday.o
> |   AS      arch/arm64/kernel/vdso/note.o
> |   AS      arch/arm64/kernel/vdso/sigreturn.o
> |   LD      arch/arm64/kernel/vdso/vdso.so.dbg
> |   VDSOSYM include/generated/vdso-offsets.h
> |   OBJCOPY arch/arm64/kernel/vdso/vdso.so
> | objcopy: Unable to recognise the format of the input file `arch/arm64/kernel/vdso/vdso.so.dbg'
> | /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/arch/arm64/kernel/vdso/Makefile:61: recipe for target 'arch/arm64/kernel/vdso/vdso.so' failed
>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>

I like the lighter touch of this patch. I still can't explain why this
isn't necessary on one of my builders, but is on the other .. but that
of course isn't relevant to this!

I've reviewed and tested this, so no concerns from my end.

Queue the cheesy -by lines:

Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Tested-by: Bruce Ashfield <bruce.ashfield@gmail.com>

> Cc: Nishanth Menon <nm@ti.com>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 92ffa47..b2b50b9 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -19,7 +19,7 @@ DEPENDS += "bc-native bison-native"
>  DEPENDS += "gmp-native"
>
>  EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
> -EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}""
> +EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
>
>  # Build some host tools under work-shared.  CC, LD, and AR are probably
>  # not used, but this is the historical way of invoking "make scripts".
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
