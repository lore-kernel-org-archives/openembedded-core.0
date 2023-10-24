Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23D5C07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 23:17:43 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.162165.1698189461727103902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 16:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i+nCb3Ie;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-35164833a21so780495ab.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 16:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698189461; x=1698794261; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9nEGkfZJrxUZF7GJYxiQrXWNm8CTRynbIFl9efz2uc=;
        b=i+nCb3Ie7B67iFxs7pN8A7GUCFBUDui9ZTk/lOiaRJKzvv9FPDUGadpH0t5sSHYfgs
         N3BpS1fHQ3gmW4p8h0PHBq4tMXEjNKDX/+VbYIMGUvILjta+gHTBbiIAJyYapW8p0yld
         +gvLQ0O6UOVKl3rnTaMsivAyLoE5CuCM2cfcBn6Tu6S5E8UKADTNH7TnxSS4QBqek+U0
         PsBm1NEoZFEt5982+ccc43Z4ube42K7AdkAO9NeHnZN82vFz/7pHuDtOPmjoaWgo6jhj
         bWf+6/lqBjyiU+HGZitfDOiY9EN6SALUsaL8Ialb1FXXD64t0cFCBJ+AnhmuFnlfAzmE
         FOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698189461; x=1698794261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9nEGkfZJrxUZF7GJYxiQrXWNm8CTRynbIFl9efz2uc=;
        b=aFzYsG7C9QazjoZp0R+hQIJ4iA3RLSGm+tdodRz96U9QQQ+oEGYFnwpHeXi5yQfoQp
         pRch7+vHQabumYF7jfz+bMCTrSxlivqwmydkM/yLBOMGZn+PFXp237M7s15nwxo35hQf
         GDTojJOBZ1nU3qQmL2ZSbCe0J/ufg1INN+PKY3gFf2SAYs9/Oo07LbzsmRESp1zfP0/o
         TC9Xb+algdzZh/E+kvpLwWmrz2/9wzOHmV3qjNQmmUmztiX3s780KS6TbDjJXjUjhjKE
         j8cmETckF3McWWUdXVfD/DNxVPJjgHb6npcacKIxI6mgylo3PjatehEZvcZzNerC5qQY
         CVyQ==
X-Gm-Message-State: AOJu0YwS1wzjr1eJvNJflaRArgTfa8acEj3HhZxrAhwdsBs47dVYPkh/
	bMZm1hnmtFPNIYtrNxPJX0t0c63OBUlCP7TzUSo=
X-Google-Smtp-Source: AGHT+IFdl6C9ddELDVJVGW1BRAijF0l/IveWlD4dee6IJWENY5ifyGfb/K2KHRtmoxUPGUGCPgk0YIsDrqEdIOBVez0=
X-Received: by 2002:a05:6e02:1ca6:b0:357:5c29:18ec with SMTP id
 x6-20020a056e021ca600b003575c2918ecmr17061118ill.1.1698189460852; Tue, 24 Oct
 2023 16:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231024220735.3011192-1-raj.khem@gmail.com>
In-Reply-To: <20231024220735.3011192-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 24 Oct 2023 19:17:29 -0400
Message-ID: <CADkTA4Oa6rxshKxTb5aVEnHy0mnqjCeGkWsPWLuoJYe+S5NG5A@mail.gmail.com>
Subject: Re: [PATCH] kernel.bbclass: Use strip utility used for kernel build
 in do_package
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 23:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189659

On Tue, Oct 24, 2023 at 6:07=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> os.environ does not pass this down to runstrip() function and in
> strip_execs() its using STRIP bitbake variable to find the strip utility
> to use. Since there might be a trailing whitespace in KERNEL_STRIP
> remove that otherwise python is not able to launch it.
> e.g.
>
> FileNotFoundError: [Errno 2] No such file or directory: 'riscv64-yoe-linu=
x-strip '
>
> This is more evident when STRIP and KERNEL_STRIP are different utilities
> e.g. when using clang as default toolchain but using gcc+binutils only fo=
r
> kernel build.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 2ec9ea2091e..16b85dbca48 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -336,7 +336,7 @@ kernel_do_transform_bundled_initramfs() {
>  do_transform_bundled_initramfs[dirs] =3D "${B}"
>
>  python do_package:prepend () {
> -    os.environ['STRIP'] =3D d.getVar('KERNEL_STRIP')
> +    d.setVar('STRIP',  d.getVar('KERNEL_STRIP').strip())

Looks fine to me.

I can't say that I know the mechanics if every setVar'd variable makes it i=
nto
the environment to be available for the build process .. but since it is wo=
rking
for you, I assume it does :)

Bruce

>  }
>
>  python do_devshell:prepend () {
> --
> 2.42.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

