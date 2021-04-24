Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.664.1619281425447225891
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 09:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oacWZILR;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id c6so38642594qtc.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5lO+u4UfRjFXaJADLVsQIRULhivTr9vZ25pX2c3v8WY=;
        b=oacWZILRYh2xWsvwU6kmBiO1nwOTPo6gPzNHd8EBHMqgqB06fh9LEuofe/26gRq/wl
         nPuer29+8PxdxctJ6t63M8Z8nmTmVL5Jnj+TGsHvhUm6QE+AqeIb3TzUqDGL6ecaySV3
         NXrFWgrUe/6/MoVINHLOod197y0kMyYd9lbs4uCBLPeapmK1w6EWut0Rss4oe/5gubJq
         oWrMacfrWrCDCe1X0WwxQrKJa9BzyUZ+/3QE8YMxdwF0xDMWwtCZfAfrq6MhSAF170Kb
         gu3+8FXVK95P1bzm56K6f0nE/zHrgCi+yBnammJiqPnjzDwLo6IPs5MW97Q4n2cSQGyM
         A/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5lO+u4UfRjFXaJADLVsQIRULhivTr9vZ25pX2c3v8WY=;
        b=TJ8frYPoHXl/cm5r52qnbjZFfAirNndoCL9O8UIq0iW/QQsfGGtAH1t4lcfV2Z600R
         OxDCtd6i4vmkp63Ide43yjYeuipel7nZTJdj48vz7xu6oJulf7RyK1qqpdAmW66hpvY0
         KbdoK6A7+SmkAB4WLQJJESRX49KM6FsKRip4AnHu4OKZQLtuD2Fmki27PU5ViR99IOKx
         hf3Vzt6hJXeyv+ci7P4WtMK/FNyCpb1edgFOW7ceNhWPDoFXpAOET1gdCrYJSmeVQDoc
         EnKisD+JmBHT2kifNbd2lgDgRiXlkWCaKALqsBzZWJCCl8IrWEvC5BKZhp4+/sbuACwV
         lWLw==
X-Gm-Message-State: AOAM532/SpoYAvfOP1IiDFaYuQFKr0b888PufxeoQjpqSWzuWlZTIGyO
	V4j16H7ZohlrqhoL6FUOripKJkEaYGlEg+jmzT8=
X-Google-Smtp-Source: ABdhPJzSExxW6m3uH/VqZr7XvFyNVas33Gce9TZPHncfdzQhoCkK1DpdvqANeK95Mh0Ep4is/ywL5T6hHBuTak1uQu4=
X-Received: by 2002:ac8:7c4d:: with SMTP id o13mr8716560qtv.369.1619281424579;
 Sat, 24 Apr 2021 09:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210424155639.1131482-1-akuster808@gmail.com> <20210424155639.1131482-6-akuster808@gmail.com>
In-Reply-To: <20210424155639.1131482-6-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 24 Apr 2021 09:23:18 -0700
Message-ID: <CAMKF1soDiK_2tQ-sf8vHCFX2vABateQAsgmJpomNLrC4tFY95A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] packagegroups/packagegroup-base: add seccomp grp
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 24, 2021 at 8:56 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> This allows for inclusion of the package when
> the FEATURE is set
>

isn't liibseccomp a library which would be automatically included if a
package needs it ?
in that case we may avoid this packagegrooup

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-base.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index 6d4d7e6f7e7..3482ea43133 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -38,6 +38,7 @@ PACKAGES = ' \
>              ${@bb.utils.contains("DISTRO_FEATURES", "ppp", "packagegroup-base-ppp", "", d)} \
>              ${@bb.utils.contains("DISTRO_FEATURES", "smbfs", "packagegroup-base-smbfs", "", d)} \
>              ${@bb.utils.contains("DISTRO_FEATURES", "zeroconf", "packagegroup-base-zeroconf", "", d)} \
> +            ${@bb.utils.contains("DISTRO_FEATURES", "seccomp", "packagegroup-base-seccomp", "", d)} \
>              \
>              '
>
> @@ -76,6 +77,7 @@ RDEPENDS_packagegroup-base = "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'ipsec', 'packagegroup-base-ipsec', '',d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'ppp', 'packagegroup-base-ppp', '',d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf', '',d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "seccomp", "packagegroup-base-seccomp", "", d)} \
>      "
>
>
> @@ -343,3 +345,7 @@ RDEPENDS_packagegroup-base-serial = "\
>  SUMMARY_packagegroup-base-phone = "Cellular telephony (voice) support"
>  RDEPENDS_packagegroup-base-phone = "\
>      ofono"
> +
> +SUMMARY_packagegroup-base-seccomp = "Seccomp support"
> +RDEPENDS_packagegroup-base-seccomp = "\
> +    libseccomp"
> --
> 2.25.1
>
>
> 
>
