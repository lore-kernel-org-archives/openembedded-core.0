Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20039C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:53:34 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.7780.1742291613373618051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8XAIx+/;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8f8657f29so43436516d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742291612; x=1742896412; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Yw3RrFmqwiExIxeg0kwxLKa48cUhYKgVKqLZLRcaoA=;
        b=W8XAIx+/yWR3TCJs5uYMqquQuESc2imej0IdSJTlXOFsXWSN0knaKcWyQTzt0sDlrp
         I6oQXfC8A1p39IHRcX+ukd90CQv8TjoG2G3Zugj0pY3VWLd6Ne8IcUqwYNxXG5Y0xJEx
         Q7MrPOKH2h3RVyq/cmoJG3HJfmoagwwkFhZVVbLPZ4PDYRWMvQOY6iOwx2PsW3DB01Nu
         qIlL0u6ydWKFIScSUG2GQfy7sqv2s1nsVKFrrYhsc6ZxSSs6ELNoOtDOpAgj6JSN/h48
         3hfTIT0okUudtODPwW8lHj5e6Sk5rUXa1tXgT0qXbyspJjJOuQ5p9u5kdiRnaVTkucMs
         0cLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742291612; x=1742896412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Yw3RrFmqwiExIxeg0kwxLKa48cUhYKgVKqLZLRcaoA=;
        b=niO6wMAnWqLmefqVZfopw8VpRuTMfuhXGKPKO7yo8BXYeawglQAyhy66EVh9wWNhbk
         v622+BAZIeXU3Gsq9MNn7DlSSmZANJgtju5ndfeWTMmctKXSejruZBMDMAs0NlEMXw2z
         KkrVMCAsGdyNAr1FLiY0SHYHnBVw2titiHRkeSEJm/fj+J0OmNnu9twlOf44xA3L+pCr
         wx9UZkMBxf3TAYOblDrozR/vZFQi9NFzmP87Ej7oaOPfJd6BAZbOHxu0yrEZwFKJcoLy
         +wq43T62SBqZ5pPOL24PlQv++R6BNgUG1PIN0+Y9dnzB/ZgigCLxLA64SB6Ot1rP8oF1
         27oA==
X-Gm-Message-State: AOJu0YyrJqKN1ABd6TSbN6Cm1LN5GjFDHyxH9GoE9jDHJaXKB3ssg9Wb
	hBdDxW+igxvpCnP0EKS4BW6506QizDDuFK9cNjpbClenvkgjB7O3elmKbVHdA5Dc9J+zyeDb8kS
	L91UTlIe07118/ggqVkI6z7oXJ38=
X-Gm-Gg: ASbGncu61ckeQhcg/aLwAlQ7Up44mor2oP2YsduDbtS43U5csOKa8jQ87cauSjsgsN9
	Qiqw4++UEEXh/xz/KXva9gHzFfARoavD+Z3baT2Z+UUy7UHtZGXQGP9SoniXDgx0Z30juinPTLg
	XzIA6u+SfT5cThkAWLOwCcIbo0mcc4nsZAAyIEXqgV2s3HszfC+ZOA+xpzMUIA
X-Google-Smtp-Source: AGHT+IGE2Rpo6pcKLNvTucOQipHFu8JTaXSUtHCs/QHuB8zmVdGghcNBC6yUDDOQTC7uby7nJB9bCenB5ApAaZZZY0A=
X-Received: by 2002:a05:6214:d8d:b0:6e8:c713:321f with SMTP id
 6a1803df08f44-6eaeaafe44dmr187367136d6.35.1742291612205; Tue, 18 Mar 2025
 02:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250318061509.1737383-1-rajendra.desai@emerson.com>
In-Reply-To: <20250318061509.1737383-1-rajendra.desai@emerson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Mar 2025 10:53:20 +0100
X-Gm-Features: AQ5f1JobIUfRKaH79b6dhvF2gX9tvynOVE_9f9vznkSGZ_WWp8ZzH7GTJ1Y8SQw
Message-ID: <CANNYZj8C+a20T6ND2F_TZggQzmzWBwWL9LLMVmGMgmCWt6-pQg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] perl-ptest: copy xconfig data from
 perl source directory
To: rajendra.desai@emerson.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213194

Is the issue occurring on master as well? If so, you need to explain
why perl ptest is passing there in yocto CI pipelines, and send a fix
to master first before it can be backported.

Alex

On Tue, 18 Mar 2025 at 07:15, Rajendra Desai via
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
> index e07355d3f5..42d46dfd78 100644
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
>  }
>
>  python populate_packages:prepend() {
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213165): https://lists.openembedded.org/g/openembedded-core/message/213165
> Mute This Topic: https://lists.openembedded.org/mt/111765365/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

