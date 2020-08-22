Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.150895.1598075021464289095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 22:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MPQ5HkVM;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id d14so3250766qke.13
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 22:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=poW/N+nX+pm974YitnaTKSRYD6WOnjbJGgghlGR4vkQ=;
        b=MPQ5HkVMt80XA0flvRq74lg7Jx5/zsDKGP0sYLOAiV3fhegLcQIBdc9n/8qZzp+XAh
         //fHAyexCEE0ESeLzCAEJWP6RwOcD07TBed2Yb3v63ZUFEDRFSQKsrXYpZeig2mc5pAD
         D8jnKTCi8ZyWMm993U4z5yRVMmEWePLOl6kmQhgyFzrtFGCE/6MTduA5zfSd8OAp3Hx0
         wXlSBT83YcaakhRk4MCxnHOlKDTZHe2cxzeJZB7tcP8zkzV61e2J3CPRyS92F0Dqh2ui
         JkM7BPa162ES5i0er70Bj5u2xnBmDqTFsyRfbnh0STf+CF5xzpzvdvSkrrsp6Pl8Zcyh
         tOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=poW/N+nX+pm974YitnaTKSRYD6WOnjbJGgghlGR4vkQ=;
        b=HwqM5UdnpTAnu6e8lfeJbrPdN4TJ3LdAloPHUrAfk0kHCyQrLghiq7SPUo2x/TuXCA
         ebrxIYTcfMMAr35N5E4+ANUy/InI6KUqUK4rQVAp0lT6tHMu1w3LUbjneBuyp8yphayG
         oJaasNeQeAOL2+eegc0eVdFftEqFS+S9Zpyx7kOuvjGivtvElb3BXHZYgwz57BXjbrou
         1o3Ft/JHvBADjyhYp9eTWvrApmRpQKQQ0J+HEuKQeO4sjCvIQ8284ylPoLnACW5+Jv0X
         uzeumrg04fuUpIFfRQ5PRrunZpiw52E95DOxGkz3MM4b4Eng6ZoLlnrsulPYMADxf653
         bu1w==
X-Gm-Message-State: AOAM530AeAYhYaKmZm31jJNLKJCpfYR9+6bpq2iGXHAFgnYqbBN/GKCA
	BuqDxSYCslKD+gOEBLxsOw4WSsEq56ZKCfDAbRHAuTMlfO0=
X-Google-Smtp-Source: ABdhPJxoVhS1ILkU1hbvxxR25WXUDuu1eeeqnIqgoseA51O+nL+tb+vHtJehpCX4hGiIAzeLri4uHeT8w+XSNaZZRqM=
X-Received: by 2002:a37:9b15:: with SMTP id d21mr5865332qke.9.1598075019219;
 Fri, 21 Aug 2020 22:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200821080719.1708562-1-raj.khem@gmail.com>
In-Reply-To: <20200821080719.1708562-1-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 21 Aug 2020 22:43:13 -0700
Message-ID: <CAMKF1sq0B7YjabTONuJNwvMfvPzbLpMTr3_GqdKs+P6CF49c2A@mail.gmail.com>
Subject: Re: [PATCH V2] multilib: Add musl multilib support
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I did few world builds and more I realized we should not pursue this
path a few packages started to fail with redefining some defines which
are in bits/reg.h and attleat 5-6 packages showed the issue unlike
glibc where bits/wordsize.h just defined __WORDSIZE on musl
this define is in bits/reg.h but its not the only define. So I feel
that its a wrong fix. Plus I think multilib for musl might be less of
an usecase
practically then say glibc which has some legacy of multilib. Unless
upstream musl separates this out into wordsize.h this would be a wrong
way to fix the multilib. So lets not apply this patch as yet.

On Fri, Aug 21, 2020 at 1:07 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Since musl ldso can now co-exist in multilib therefore add support to
> build multilibbed headers and adjust the wrapper header to support musl,
> it needs __WORDSIZE which is defined in bits/reg.h for musl
>
> [YOCTO #13122]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Use OE's libc switch to include relevant header instead of __GLIBC__ define
>
>  meta/classes/multilib_header.bbclass | 16 +++++++++-------
>  scripts/multilib_header_wrapper.h    |  2 +-
>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
> index e03f5b13b2..0304f6d3af 100644
> --- a/meta/classes/multilib_header.bbclass
> +++ b/meta/classes/multilib_header.bbclass
> @@ -6,13 +6,14 @@ inherit siteinfo
>  # all of the ABI variants for that given architecture.
>  #
>  oe_multilib_header() {
> -
> -       case ${HOST_OS} in
> -       *-musl*)
> -               return
> -               ;;
> -       *)
> -       esac
> +       case ${HOST_OS} in
> +       *-musl*)
> +               wordsize="bits/reg.h"
> +               ;;
> +       *)
> +               wordsize="bits/wordsize.h"
> +               ;;
> +       esac
>          # For MIPS: "n32" is a special case, which needs to be
>          # distinct from both 64-bit and 32-bit.
>          case ${TARGET_ARCH} in
> @@ -37,6 +38,7 @@ oe_multilib_header() {
>            mv ${D}/${includedir}/$each_header ${D}/${includedir}/${stem}-${ident}.h
>
>            sed -e "s#ENTER_HEADER_FILENAME_HERE#${stem}#g" ${COREBASE}/scripts/multilib_header_wrapper.h > ${D}/${includedir}/$each_header
> +          sed -i -e "s#WORDSIZE_HEADER#${wordsize}#g" ${D}/${includedir}/$each_header
>         done
>  }
>
> diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
> index 88f3193812..ae441b4445 100644
> --- a/scripts/multilib_header_wrapper.h
> +++ b/scripts/multilib_header_wrapper.h
> @@ -5,7 +5,7 @@
>   *
>   */
>
> -#include <bits/wordsize.h>
> +#include <WORDSIZE_HEADER>
>
>  #if __WORDSIZE == 32
>
> --
> 2.28.0
>
