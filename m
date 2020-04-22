Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.752.1587559597653444533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 05:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J8fty6ry;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id s9so1764697eju.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RG+n9pGgw0C53k4kMWomjGj8Ukrgmn6JNszQurTGA7I=;
        b=J8fty6ryF0iBbxA7Y854SjCtNVup9qTblwko32fiHbiT/c4SI+Ycuj7jhKFvRnTGr6
         /Qwwgt9xGDEu12qUPFY77QhNvJAeRgW9Op42SdNShQl6iQoeaoDsucc3Hp3zyC6cgbki
         IIr427y0eXSK7hlrcY2qIqNtRoirkXpXC92kWex3OdFCIsVrM2nOVS5zBV97mEVrlzJT
         YlM6eB4eGfzfW98xk8ecrYJEhyFBzx+s0TeMC1u0OGTJPnNtVEjPolVHvzCP7c24Xo/W
         O269VYd6yX5oNUZh1rJ4b2HqIM86E81+PSvYvnfh3fDq6Bcxi9uGGuRH2tkcVqR9twnx
         EuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RG+n9pGgw0C53k4kMWomjGj8Ukrgmn6JNszQurTGA7I=;
        b=BJv6GGcLqWl6qDL0tFlDwqPJ9IKvl1aAc4oZctoKEzdVZPffj6O5zboNZpzgyiM8RN
         ckyZQK204tzlxRCLPV0MfQhMA1TyzKbwmH6UWFccY+zDLHv7ASoEIuuq6PgV3u3VflA0
         K5wADy9kwovDpq1Gy5b2zzKITlcB6RD2T8t6UfgMuh+oR/DIxGaNVO3PoyXcjPtQmrOy
         RDc6R+3IJSGLwZiahSWG7i1PtY8LrJSaLMabfuLooxbOyWDPxf3C2F5jG9Miq1yjNbpu
         NUWC46tQwTzYTzOp/EZICP/KUKX6G02aXiip4lWt+IjeBNT5be4K8GKos6bQrO9oHvnI
         q5nQ==
X-Gm-Message-State: AGi0PubWRDxBhC8pDSEA5zEfTo5JIL+64mtlCEl2tmcSpusLJmaiC3Sc
	KSPs1mnwMZZ0+5rPQoTqhP7eYzU8HnVwRbwk6gA=
X-Google-Smtp-Source: APiQypKy4KcUE7xku7t8kI+8NhB0BmIo/K30i8nr0jUofgf8trF7bgSKaoJlwgtz8nCJv3dXkKdpFjUs6y/Gu46wRMs=
X-Received: by 2002:a17:906:25cb:: with SMTP id n11mr13787857ejb.37.1587559596040;
 Wed, 22 Apr 2020 05:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200422072838.27867-1-Qi.Chen@windriver.com> <20200422072838.27867-2-Qi.Chen@windriver.com>
In-Reply-To: <20200422072838.27867-2-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 22 Apr 2020 08:46:24 -0400
Message-ID: <CADkTA4PCEvaHmOK6Y_yXHxk59K_p2j+7yu7WDhH1zP1Sq_woFw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] linux-yocto: add more support for SDK
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 22, 2020 at 3:29 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> We need to `make scripts prepare` inside SDK. So add patch
> to defect if we are insdie SDK environment, and if so change some
> PKG_CONFIG_xxx settings so that we will use things from SDK's host
> part.

This needs to be submitted to the linux-yocto mailing list.

We don't carry patches to linux-yocto outside of the tree.

Cheers,

Bruce

>
> The problem for `make scripts prepare` inside SDK is that the
> hosts' environments are different. On some hosts, it happens to
> succeed, and on some hosts, it fails. This is because the build mixes
> host's part and SDK's host part.
>
> We do such change to make sure only SDK's host part is involed in build.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...port-make-scripts-prepare-inside-SDK.patch | 46 +++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto.inc     |  3 ++
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/files/0001-Makefile-support-make-scripts-prepare-inside-SDK.patch
>
> diff --git a/meta/recipes-kernel/linux/files/0001-Makefile-support-make-scripts-prepare-inside-SDK.patch b/meta/recipes-kernel/linux/files/0001-Makefile-support-make-scripts-prepare-inside-SDK.patch
> new file mode 100644
> index 0000000000..5e15d9c732
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/0001-Makefile-support-make-scripts-prepare-inside-SDK.patch
> @@ -0,0 +1,46 @@
> +From e7b37cbdbd0f7dbd3ba99e7db6916c2dc3acecc9 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Thu, 16 Apr 2020 10:06:24 +0000
> +Subject: [PATCH] Makefile: support make scripts prepare inside SDK
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + Makefile | 13 ++++++++++++-
> + 1 file changed, 12 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 2f140aa..af41dca 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -277,6 +277,17 @@ ifneq ($(filter $(no-sync-config-targets), $(MAKECMDGOALS)),)
> +       endif
> + endif
> +
> ++ifneq ($(SDKTARGETSYSROOT),)
> ++        ifneq ($(filter scripts prepare, $(MAKECMDGOALS)),)
> ++              PKG_CONFIG_SYSROOT_DIR =
> ++              PKG_CONFIG_PATH = $(OECORE_NATIVE_SYSROOT)/usr/lib/pkgconfig:$(OECORE_NATIVE_SYSROOT)/usr/share/pkgconfig
> ++              export PKG_CONFIG_SYSROOT_DIR
> ++              export PKG_CONFIG_PATH
> ++$(info Changed PKG_CONFIG_SYSROOT_DIR to '$(PKG_CONFIG_SYSROOT_DIR)')
> ++$(info Changed PKG_CONFIG_PATH to '$(PKG_CONFIG_PATH)')
> ++        endif
> ++endif
> ++
> + ifneq ($(KBUILD_EXTMOD),)
> +       may-sync-config :=
> + endif
> +@@ -994,7 +1005,7 @@ mod_sign_cmd = true
> + endif
> + export mod_sign_cmd
> +
> +-HOST_LIBELF_LIBS = $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
> ++HOST_LIBELF_LIBS = $(shell export PKG_CONFIG_PATH=$(PKG_CONFIG_PATH); export PKG_CONFIG_SYSROOT_DIR=$(PKG_CONFIG_SYSROOT_DIR); pkg-config libelf --libs 2>/dev/null || echo -lelf)
> +
> + ifdef CONFIG_STACK_VALIDATION
> +   has_libelf := $(call try-run,\
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 91df9c1cd5..551aa3def6 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -55,3 +55,6 @@ do_install_append(){
>
>  # enable kernel-sample for oeqa/runtime/cases's ksample.py test
>  KERNEL_FEATURES_append_qemuall=" features/kernel-sample/kernel-sample.scc"
> +
> +# Ensure `make scripts prepare` succeed inside SDK
> +EXTRA_KERNEL_SRC_URI += "file://0001-Makefile-support-make-scripts-prepare-inside-SDK.patch"
> --
> 2.17.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
