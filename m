Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.5770.1622026524345211834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 03:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=1xzEywyc;
 spf=pass (domain: burtonini.com, ip: 209.85.221.50, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f50.google.com with SMTP id j14so634789wrq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 03:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0jrTus7YNgbFUgCuiHFWct8YUcMbSm5UYOtCZEwDwzU=;
        b=1xzEywycpb5kxXzxo6iQzlu6yaqUKyAvM9DH1Ix87FdrD7435CsjaOxGE5//BRA89n
         6oHk0dx31J+XdhaL1F4a7S0ZeM3D1+K0GEpg9+wR+hjH7i4ZSbcqq1YFRLq58H3aGcUk
         pv1H0x8t0tSvu3i7tvlU+PCRkydOsNAQ28SFTOIc/sZhKitKAdm895kxPXRKTQcNSmDZ
         bZD5fICThC4BTH2Pv1SZVFQsJqBT73z7vI5jfspopTQpJrfvpBNdzkBGfK8XJsC1Fqp8
         yObtRskBSD3jzI2YZDwo/Lvv1QR5hb/ZQeaaRRDgGIcSBJgXSybSPt48aCpRhE0/V6Sb
         MVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0jrTus7YNgbFUgCuiHFWct8YUcMbSm5UYOtCZEwDwzU=;
        b=Y+SM4GQYaimmzpmKXOVSHR6Kd1HW/Ro71TAjLNhkoT6GGfMG+yn7HREmjdO2laIp2h
         vyOReyDZE+s0Mi+x4yrSDP0kHs5b7xKUNMHzNUkFklw5yY7cUL9mwznXyrMJn91368a3
         RAe6ELspvOW/ssUXDxPYP0d6ZNrFs0k9sr0Si0A3zT+nUz/6NJ8Rpx357FXdNNFHQyXV
         6Ha2jZZ3xBp/VpjBFd7UgI4dMFXhtL7K319xgVG5UUeCQDVRuyJsc5X3ivajQRoGhY3n
         Mu4veW3/2VTw59pZyATOO72WvFcNR9/LPjhBie2eVyhiZ3IHC3SYa9eKmJzDaOmYG6qT
         WifQ==
X-Gm-Message-State: AOAM530KIjUmkV6gNWZsJvzn6OAq6GOnsfvKwfDz1/vrRS2euIqBOKNP
	5VcNQ3gnnyJQ+mwbn0WIYyZk5q3Tj3XGi+TsLoNFUA==
X-Google-Smtp-Source: ABdhPJxzEdFDF75Nkw4J/BY1aleyBOh0IV5tcOCfwUvadJo6N0BsmuB7QR8QRp9txfkYEeecdRow/qiutM0Lp1/arvc=
X-Received: by 2002:a5d:64eb:: with SMTP id g11mr32840353wri.260.1622026522531;
 Wed, 26 May 2021 03:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210524152106.4160032-1-raj.khem@gmail.com>
In-Reply-To: <20210524152106.4160032-1-raj.khem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 26 May 2021 11:55:11 +0100
Message-ID: <CAAnfSTvgOiJ5hvG41fTqW3XD73bBB5nJOG7FaySPzspcGOj1bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gcc: Update to latest on release/gcc-11 branch
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I think this breaks non-Linux builds.  All of our Zephyr targets now fail:

ERROR: gcc-runtime-11.1.0-r0 do_package:
QA Issue: gcc-runtime: Files/directories were installed but not
shipped in any package:
/usr/lib/-gdb.py

Ross

Ross

On Mon, 24 May 2021 at 16:21, Khem Raj <raj.khem@gmail.com> wrote:
>
> There has been 150+ fixes made available after gcc 11.1.0
> was released, details of these fixes is here
>
> https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;hp=releases/gcc-11.1.0;h=9ee61d2b51d
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Use download mirror to fetch the patch
>
>  meta/recipes-devtools/gcc/gcc-11.1.inc | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtools/gcc/gcc-11.1.inc
> index 713002266a..aa7ac9be59 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
> @@ -6,7 +6,7 @@ PV = "11.1.0"
>
>  # BINV should be incremented to a revision after a minor gcc release
>
> -BINV = "11.1.0"
> +BINV = "11.1.1"
>
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
>
> @@ -25,7 +25,10 @@ LIC_FILES_CHKSUM = "\
>
>  #RELEASE ?= "5b2ac9b40c325e9209c0bd55955db84aad4a0cc5"
>  #BASEURI ?= "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;downloadfilename=gcc-${PV}-${RELEASE}.zip"
> -BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> +
> +BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz \
> +            http://downloads.yoctoproject.org/mirror/sources/gcc-11.1.0-9ee61d2b51df012c659359873637cc2162ecccf3.patch;apply=yes;name=backports \
> +           "
>  SRC_URI = "\
>             ${BASEURI} \
>             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> @@ -67,6 +70,7 @@ SRC_URI = "\
>             file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
>  "
>  SRC_URI[sha256sum] = "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf"
> +SRC_URI[backports.sha256sum] = "69274bebd6c069a13443d4af61070e854740a639ec4d66eedf3e80070363587b"
>
>  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>
> --
> 2.31.1
>
>
> 
>
