Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78540C3600C
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:53:28 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.46288.1743069202682786884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 02:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NIhtF1EY;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so9186796d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 02:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743069202; x=1743674002; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FSBk5kZ1ma5SBkJ34QyWzRgWjzcwYYM361KPpEldMs8=;
        b=NIhtF1EYr9KZrk5f86Pgw+3j05FpZeUd3OSXs51PEzGmEWiy6698g3+AdgqJ8MDhMl
         kTc93z58IIz9Nay9FXZCAjq06Swm4pbqsW+Y4mAlmfjqLrTyeb1R1HAW1q74x0f2HXLe
         C56+1lXjhCMihogT/XZynHNIEMR4WwTj4Uf3ZvrJZ1d/j3q4NQSjy8H2zA1eJbfBCIki
         bzpbN6ZtDDWXq6wVkbmTjFskUcEvRFbHlgICcJWOyyiBIMSmV54TDj2PmkTeBzx+/itU
         G6yIxFtnGQVOckh469MVlf1USqFlNLvLKQyaUECQJtpA42Iib9J1JfjHo9hjVv6ihnc7
         16aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069202; x=1743674002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSBk5kZ1ma5SBkJ34QyWzRgWjzcwYYM361KPpEldMs8=;
        b=hvY8088cKAs2XcuKczTOxwZ8GFbVC65+xRrFMK00KiSBm0Gcu4aiT8DONEsfRii2d7
         G0WayYiw+yLQz75ckVOv4gh7zd8qFZ1U1RXavvqg8ql4CN9FRnEmJJXFKkY37yfoqLVP
         lffl/pMRUZv+PW44l6EL4AC2lYMSBgRNTxvpM/Jkq5RPZOnm6OFD1RUZUln+GRg6c7Im
         7m764vNCxIbEustCthQFLx9PdY3cieXu1+aNuBIJYjc04dwUyA8imyuKZ6k+oZNSxcIF
         UJaT9H3xsuQicjs0PJ2pYgOzb66bZhH5ZutHO8JOrs6a6keE74ULF/obz2crDXRm0CKp
         Xz0w==
X-Gm-Message-State: AOJu0YyXpuDneemgb4TDKDFndmZYBPiRct6dcV7z+ywJrIWdtOQC58Bo
	tlFtxAhInE9DBPRNJqSPT+er98336WF/pXiB0k7AjaPj+qud2AJPosGxIYqXa5PRwpYawDW2bHK
	CPAfcWm6bncvatee0hm8zjkFtzmhxMbqr
X-Gm-Gg: ASbGncumArFj1rEKX5y2cvKlmzP6Bxa/RkWNlmHHNyStK7ehZ5cQ2KK69w48zVrrJZ6
	k/D/mw9kMzZkNp5x6aJtPDj7O8+YUSwEIamlIkRp9pRT+Bl90YENWWgxlBh1NnvadcJabjO90TI
	r+4Emr0Y8h1zHwk+J0TEiYObfIVKhcuBOQe6mmdcGpJ/4Sdkng/gHb8Z04upfY
X-Google-Smtp-Source: AGHT+IFylySQfAJNnyfnHldq1eIvF/UDU0KrV6sq0pAwuOrT+vLYlrYiLchg7ZXwPkI5DYX9GHi7cdJFFyaiSrvaob8=
X-Received: by 2002:ad4:4eaa:0:b0:6e4:2e12:3a0c with SMTP id
 6a1803df08f44-6ed23917d29mr32296916d6.39.1743069201484; Thu, 27 Mar 2025
 02:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250327060855.428041-1-rajendra.desai@emerson.com>
In-Reply-To: <20250327060855.428041-1-rajendra.desai@emerson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Mar 2025 10:53:10 +0100
X-Gm-Features: AQ5f1Jpjl-Oc1SCCU7Ew-xYQ93XD6y75OGCs7-u7U5l04iT-6HyVV_Sli49KjfQ
Message-ID: <CANNYZj8ko8LF8m32CoM2fWTCryTWW_Nwya62K_dpBZqdU_WZZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perl-ptest: copy xconfig data from perl source directory
To: rajendra.desai@emerson.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213718

This doesn't address the feedback given previously. Which is:

Is the issue occurring on master as well? If so, you need to explain
why perl ptest is passing in yocto CI pipelines. How can we observe
the error on master?

Alex

On Thu, 27 Mar 2025 at 07:11, Rajendra Desai via
lists.openembedded.org
<rajendra.desai=emerson.com@lists.openembedded.org> wrote:
>
> The following perl ptests:
>
>   - dist/ExtUtils-ParseXS/t/001-basic
>   - dist/ExtUtils-ParseXS/t/002-more
>   - dist/ExtUtils-ParseXS/t/003-usage
>   - cpan/ExtUtils-Constant/t/Constant
>   - cpan/ExtUtils-MakeMaker/t/02-xsdynamic
>
> are erroring out with:
> | /usr/lib/perl/ptest/perl_langinfo.h:8:10: fatal error:
> xconfig.h: No such file or directory
> |     8 | #include "xconfig.h"
>
> xconfig.h contains references to the build host architecture and was
> removed by commit 2e0f30c46802 ("perl: do not install files that contain
> build host specific data")
>
> However, it is still included from various other places including these
> tests, and we are still depending on build host architecture data by
> including the patches from perl-cross recipe, a dependency to perl recipe.
>
> xconfig.h was added back as a copy step in the commit f90922cdeef5
> ("update 5.36.1 -> 5.38.0") but was not added back in perl-ptest include
> file.
>
> Borrowed the logic from the above commit to make a copy of config.h
> that is specific to the target architecture. The changes in this commit
> fixes the test failures.
>
> Signed-off-by: Rajendra Desai <rajendra.desai@emerson.com>
> ---
>  meta/recipes-devtools/perl/perl-ptest.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
> index 4b4756118c..49d322a848 100644
> --- a/meta/recipes-devtools/perl/perl-ptest.inc
> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
> @@ -20,6 +20,11 @@ do_install_ptest () {
>
>         ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
>
> +       # xconfig.h contains references to build host architecture, and yet is included from various other places.
> +       # To make it reproducible let's make it a copy of config.h patch that is specific to the target architecture.
> +       # It is believed that the original header is the product of building miniperl (a helper executable built with host compiler).
> +       cp ${D}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/config.h ${D}${PTEST_PATH}/xconfig.h
> +
>         # Remove build host references from various scattered files...
>         find "${D}${PTEST_PATH}" \
>              \( -name '*.PL' -o -name 'myconfig' -o -name 'cflags' -o -name '*.pl' -o -name '*.sh' -o -name '*.pm' \
> @@ -44,7 +49,7 @@ do_install_ptest () {
>          sed -i -e '/Autogenerated starting on/d' ${D}${PTEST_PATH}/lib/unicore/mktables.lst
>
>          # Remove files with host-specific configuration for building native binaries
> -        rm ${D}${PTEST_PATH}/Makefile.config ${D}${PTEST_PATH}/xconfig.h ${D}${PTEST_PATH}/xconfig.sh
> +        rm ${D}${PTEST_PATH}/Makefile.config ${D}${PTEST_PATH}/xconfig.sh
>
>           # create an empty file that is checked for existence by makerel test
>           touch ${D}${PTEST_PATH}/win32/Makefile
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213704): https://lists.openembedded.org/g/openembedded-core/message/213704
> Mute This Topic: https://lists.openembedded.org/mt/111899754/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

