Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.1524.1590598622791185710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 09:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YOYd2dC9;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id a2so28880529ejb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 09:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wUo2of6DxwqxbVPd66KXSMwiBLbaU1F6tXlwIhLdg70=;
        b=YOYd2dC97b/lWuhldpm7pq5JoVwLYa1d9JO6iF6kVdsMvjIeA8IQ+rPVYDV7C6whGr
         RX7Ez0JyonmanmQAUIvVAtBeaJVg1GI8Nk1vMUsglTMxve0HdgUm8uCKTpIBvMIyI90Y
         hRqEonya6qxtePXdqs00v0oa5YC+aPV1GDMv8UnWLhRvA+7yyHByP8f/CKKwsdLdtHCo
         FSka6T6tz0X+JiJ6rhpTCMsRiL7HtMQl3JOHAvxQ5D9cZmXI6bGRJcHqPSvLQmM1g/hS
         45tmYO2gJ+ra2b4RgBtuQ9vz47Cdiw45K7VlfTiQHRLffRGcU0iKVfAv94zuHxKwjMq5
         3ZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wUo2of6DxwqxbVPd66KXSMwiBLbaU1F6tXlwIhLdg70=;
        b=N24rg5V4MrOxL763AtE/bKdH5ec5nz+QVaWFqp/3pAOxYOl3/4Pb49DLZEFCGPqVvd
         t7VgIQS1+jRf5DYgeTk69UhLFs8BOLI9itKbiA0QJxijsY1S7fFJpJcNCo/Xqrm0Itmw
         acx06JTU2ZLeGJOGmVNWYLWdHwVLHeM1kzeYYaJl7qlQ6Hi7KtV6LRmj31G1Hp36v1Sx
         muijRQaJZ1/Cig8DVKBQDUVbDXvEcjNMmimAfBcjcGLxT5qH70/T5lEL+U/sjo0kCWWN
         3dA4+/7QwRfCRAPIBUh2C8YbyYvTScnqulE0yAsB8E+xL+k0DkGwWmkixnFyvcN7W/in
         peTg==
X-Gm-Message-State: AOAM531ZhD+Wx/ysvhba7xf90Ocs+wDGr4KMJfqkITED/FsFIisQrsYB
	KU8AivsyQxGPg+C9GqH68FSYA5T4KCLqYhsD/vY=
X-Google-Smtp-Source: ABdhPJyFu7mFLgXh8N8zMx4JH1VzqOVIRVE6kHhNN/mnEfGEUqF2hl2kwKOXGYRW14d7pxXa7QvocFNrnqTXlOf4MJE=
X-Received: by 2002:a17:906:4356:: with SMTP id z22mr6860168ejm.334.1590598621229;
 Wed, 27 May 2020 09:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200527160355.3169339-1-raj.khem@gmail.com>
In-Reply-To: <20200527160355.3169339-1-raj.khem@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 27 May 2020 12:56:50 -0400
Message-ID: <CADkTA4O77VD2pYx6ySDOeOcUAr5nE8ZmTKGLJtn0cX2EKJ887w@mail.gmail.com>
Subject: Re: [PATCH] make-mod-scripts: Fix a rare build race condition
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 12:03 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> There is a build break which often happens whem using 4.1 kernel
>
> /bin/sh: 1: scripts/basic/fixdep: Permission denied
> scripts/Makefile.host:124: recipe for target 'scripts/dtc/srcpos.o' failed
> make[3]: *** [scripts/dtc/srcpos.o] Error 126
>
> this patch sequences the build targets so it can work reliably with
> different kernel versions
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
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

Last I checked, we don't actually need scripts_basic.

Isn't just sequencing prepare, followed by 'scripts' enough ?

If not, we really should put in the long log why we need that new
target when sequencing, when we didn't need it before.

Bruce

> +               oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +               -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
> +       done
>  }
> --
> 2.26.2
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
