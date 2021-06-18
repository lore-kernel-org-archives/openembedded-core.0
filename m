Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web08.14831.1624055066044312786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 15:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tbZKbZoX;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id c10so4368192qvo.9
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 15:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UMRkcXJFohoGKW3zAR8VXn4FPX1y9m8sjatJWau7fzE=;
        b=tbZKbZoXRXDgEL3eBiKZEdOmfnirRSE1fpQtRPksPqPc1Xxg3zLc+WlL6BGvPZGVMn
         fW7XkLr8/4zGo4VZPaDESOGkJwgcrqKXQE+czGMOx9/qsvbETJgtSjQ/rPqOLJ9JM1CH
         cY7H4XTOQasrsOpe+Op01gZ0CtljaS1bM/zRAD0HiTlZ9hPk25rOnAJJ8IMlPRnjOc7z
         yrkdVB/7mOZVoJ74Jj0Ybs1odo7tpPibi21pUrNMV8E1aDOajJaKJxVbW+X74zOPsPOI
         CaS8EIr+a2DpFx+nj9pP130zI3QnkPHywII9e0B0hBwR8PT3TbYrbwWMptqCVCPoIUII
         jY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UMRkcXJFohoGKW3zAR8VXn4FPX1y9m8sjatJWau7fzE=;
        b=VWEQBq6JPqwihgBqr7XulwCCSu5sDKWRFMlEM4cprJq6iHrYON0ThaSAM80JXaEwRw
         ngufl/8PbCSaqJivWe7tOMdktqizmRzoXpwJA4j/M3GuAnujdROOa34UD8sgMyfRf0a7
         9JFtZCCnwh7+SEkv3tGQYj/Uroj5mKM/3XEx2irQOFJ9kcMeHFEB2uaV9hHVZe2qt5qy
         POU/xNzQgJuVmJB4k6sqStbS39O1M5/p9qCSbaVd5FTprnAlpTfdLEjFLbAZRiINL6rN
         hn09vYS3ylUEf4CCm/ip+SCHN38sYSgoBYryE15lKV4yHxySidCMwgBiIhsWKZC/ygSQ
         P6tg==
X-Gm-Message-State: AOAM531wOtMsqR8C1kr50h6OVxkZU4gRNbXBwg/aZMf8UY5mqTnYb0Wh
	/PuLb1UeO8IzPFmEEs7D8yA5PuWwjC4ApiX8Jxo=
X-Google-Smtp-Source: ABdhPJwTWQUwBII2kwDpX26ElZREAjBs2+8YWA4+5VqXK0scf4SWHKKAKfxPTdrF91KjHghW27nG4pZBqGHIWN9LsUA=
X-Received: by 2002:a0c:f704:: with SMTP id w4mr6043953qvn.50.1624055065195;
 Fri, 18 Jun 2021 15:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210618194345.38131-1-bruce.ashfield@gmail.com>
In-Reply-To: <20210618194345.38131-1-bruce.ashfield@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 18 Jun 2021 15:23:59 -0700
Message-ID: <CAMKF1spzxhUkBS=0bcS6E41Q540OJ5_MdLU10HL6Cf4uPBtTsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] btrfs-tools: include linux/const.h to fix build with 5.12+ headers
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 18, 2021 at 12:44 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> btrfs-tools compile fails with mips, musl and 5.12+ headers.
>
> The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
> add an explicit include of const.h to pickup the macro:
>
>   | make: *** [Makefile:595: mkfs.btrfs] Error 1
>   | make: *** Waiting for unfinished jobs....
>   | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
>   | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
>   | collect2: error: ld returned 1 exit status
>
> This is safe for older kernels as well, since the header still
> exists, and is valid to include.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>
> I've started a discussion if this is required upstream, but didn't
> want to wait on sending this.
>
> I'm working on the update to libc-headers 5.13+ and ran into this
> build error .. only on musl and mips64. Which is why there is
> hesitation on if this is needed upstream.
>
> Cheers,
>
> Bruce
>
>
>  ...ude-linux-const.h-to-fix-build-with-.patch | 42 +++++++++++++++++++
>  .../btrfs-tools/btrfs-tools_5.12.1.bb         |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
>
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> new file mode 100644
> index 0000000000..d7188881da
> --- /dev/null
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> @@ -0,0 +1,42 @@
> +From 3d19b0fb882c5e195362a9f0909c474e60070ca0 Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Date: Fri, 18 Jun 2021 11:10:36 -0400
> +Subject: [PATCH] btrfs-progs: include linux/const.h to fix build with 5.12+
> + headers
> +
> +btrfs-tools compile fails with mips, musl and 5.12+ headers.
> +
> +The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
> +add an explicit include of const.h to pickup the macro:
> +
> +  | make: *** [Makefile:595: mkfs.btrfs] Error 1
> +  | make: *** Waiting for unfinished jobs....
> +  | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
> +  | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
> +  | collect2: error: ld returned 1 exit status
> +
> +This is safe for older kernel's as well, since the header still
> +exists, and is valid to include.
> +
> +Upstream-status: OE Specific [mips64 + musl + libc-headers]

I think it's not specific to musl or mips64 or OE, it should be worth
upstreaming to btrfs-tools.

> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +---
> + kerncompat.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/kerncompat.h b/kerncompat.h
> +index df167fe6..254235bd 100644
> +--- a/kerncompat.h
> ++++ b/kerncompat.h
> +@@ -30,6 +30,7 @@
> + #include <linux/types.h>
> + #include <linux/kernel.h>
> + #include <stdint.h>
> ++#include <linux/const.h>
> +
> + #include <features.h>
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
> index 3fc959bf8e..d0c9cf2a99 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
> @@ -18,6 +18,7 @@ DEPENDS_append_class-target = " udev"
>
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
>             file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
> +           file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
>             "
>  SRCREV = "96d77fcefdd3b9fd297b5aabbce6dc43e2315ee2"
>  S = "${WORKDIR}/git"
> --
> 2.19.1
>
>
> 
>
