Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web11.589.1590610073657735813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 13:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qtFxWbHN;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id g34so8083959uah.4
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 13:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uKPaH8MIKc8nV0aRda8G3j0lXgDNspaI0j/h5g77llc=;
        b=qtFxWbHNgoV4Vhs1HWRbrlZ/Yw8cMPJ7Fhvhk8iGf/oMBnRWsIQxxJGLUMFkG9wUZQ
         il/SyhO48p+/yDkKU8K7IebdNTcW3zAYMWAjO1iZ0TqcN/cLN6mcU3kE2U6Y36vnAlVx
         ZqwUvNedb4kUP3OuFfVDM5otC7TNkMGE3OE533c1lh3GiXHvg415gIIbToLspCZYeSXv
         93AdYk/hjTFd6q90qhaJfTat05XyrvyzRNAYrkb2JhCmE9w3kKWYqYw5ZlEz+/01eePy
         CTX+PaN/FbeqSuFnXyHeWyCwr6+zu2axQPkDbiFh8jJBiq6Q28LKtSCOvfxsy5QUnKEh
         bsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uKPaH8MIKc8nV0aRda8G3j0lXgDNspaI0j/h5g77llc=;
        b=JHnFi6YotMqJgro/6AS0PhD+AZAltd0SUY+NCPJaCUeglQNRKd5590pKXn0uz4rAux
         0H0xHkH7EC4Qj8SRFgEGsx/taakgikgEPZi3Tbh5OwU6M94krhjBMHxorHB0EfyRjWil
         ggrq0Sc88nmbhxFIMLcdmiqrTZqzVQ9ZOEDcJWCI2XZOrR81QBBA9GFoxdh1ursmxjWZ
         34wJo55VqD0wJF76nCibTjwLOHBZSMYYx62AoKgzW1bnBjZtmxOLzRK779D7M2QFPT6D
         TE5yqb+vywrCmG2OAFeYcNTne7E57zYtFMqwthf57XA3UyKdlF+VNL5B6Q7l+kKdP3nM
         Txqg==
X-Gm-Message-State: AOAM530g5uJawVSjTGGgn+QmtE6bIvN9CSD8lHWXPOteyI0hGoBhB8YE
	dvtPRbKxyJqkv/mwxTl+Gc87ftekL9I7WquXbHI=
X-Google-Smtp-Source: ABdhPJxdRYf0CCshFmB/xIcxB1mtWyCfgtjjCP2w5RA0BZ5PbGX7NqvtRD8Frc5b3BFJYZDOzxgD0GzUUeClrZbj41Y=
X-Received: by 2002:a9f:2823:: with SMTP id c32mr6423460uac.99.1590610072714;
 Wed, 27 May 2020 13:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200527194638.981828-1-raj.khem@gmail.com>
In-Reply-To: <20200527194638.981828-1-raj.khem@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 27 May 2020 13:07:41 -0700
Message-ID: <CAJ86T=XsALYQv9Bx8YcDBTnWM0y4Q9Vzn=S3yrB1Cd1Ot7hHSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] make-mod-scripts: Fix a rare build race condition
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 12:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> There is a build break which often happens whem using 4.1 kernel

Perhaps change "often" to "rarely" to match the title...

> /bin/sh: 1: scripts/basic/fixdep: Permission denied
> scripts/Makefile.host:124: recipe for target 'scripts/dtc/srcpos.o' failed
> make[3]: *** [scripts/dtc/srcpos.o] Error 126
>
> this patch sequences the build targets so it can work reliably with
> different kernel versions
>
> Divide the target into scripts_basic scripts is not
> strictly necessary and was simply what was used for
> testing on kernel 4.1, which is quite an old kernel
>
> perhaps just using scripts is sufficient, but it is not tested to not
> known will cause the build race as seen above.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
> v2: Improve commit msg
>
>  .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 0be1422a24..c7edb20ee4 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -23,7 +23,8 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
>  #
>  do_configure() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -       oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> -                  -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
> -
> +       for t in prepare scripts_basic scripts; do
> +               oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +               -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
> +       done
>  }
> --
> 2.26.2
>
> 
