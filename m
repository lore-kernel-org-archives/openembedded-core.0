Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66958C0032E
	for <webhook@archiver.kernel.org>; Sat, 28 Oct 2023 12:36:07 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.16957.1698496558065682087
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Oct 2023 05:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nitg0Xw4;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-35903f528e8so1167545ab.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 05:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698496557; x=1699101357; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAoXlFqSDv36MxuLkDJc3dBH4BgFvExskNz62vFAMfE=;
        b=Nitg0Xw4zQDcDfDtNQ+MZbAcU9sXz4rnoXvPSXxEiKQXmFMZQwugTtVo7mXTuunbMO
         N7v568fnqOnwo0IBCHVxiJDc4YCFg/5+AiS08v598mwBNgxjS3ftOueGuz2q/UaH6ovO
         6O7aYZ/1IwbRqq0Z2yVQwyMO6BRkWG9Gps8hicht4reL0jDK1i0WcTmaqJSfreoQghNu
         l4bFnB1dJ/C4KgdFv01rVexwl5NZGTicy5vhHkrSx1xAMg9mvVrikyqHIWaMhepzgEKD
         nJKiuUvGWkuOrlj4/GR2EpKlV7HH6wsNcvXXMnn9bbAbbPKL7NHC6n/tK2oSEg8fuIM3
         CEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698496557; x=1699101357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAoXlFqSDv36MxuLkDJc3dBH4BgFvExskNz62vFAMfE=;
        b=p0eoI3UMU2mnR+C8UE/5d/ci52kzoSh7DK0mANBw1HP6bI6OaP8KyBH5pHhXCLoCgp
         AVGvVbV8cXBhNH5NklJOxn8a7cQ2Oh9KV7mHm2uhLjh0PHFH0Po/qRB9Ch0bbmnJfBMY
         DNOKQ16JjfhNxSpwSIPrvWjvGtpvs9WHjcInELGRzn2G8MQkR4ZDS0WOlc1SGtyhqDWD
         1+ZW7bIjjjFNb0d7A6hDmYf7NZPubNIPzYKReMvMM07kFMnk/D1hLEVzjOtMvfrPZS6y
         LzkM/EPrV40iOyS2Sw4LRHnizB4wgRZSMqfkdJvG6oLScl+K4uopsGhf5u8Omupnb6xa
         GMbw==
X-Gm-Message-State: AOJu0YyiLvrOvlsUzJi25HDqxan0dxmKq2bOccZCPBXdcBRHRH4qnIII
	Nin6aR2k0bYL2mGrXySHWUw7MFAfkWI94WANxx0/mN7vQ8Y=
X-Google-Smtp-Source: AGHT+IGACF9GuuhvpbHD7UlD2mrjt8yx6Jqh9lIiO5zHA29W8zq3eVd0N06PjsBa8N4B16eerAO+BDiPnCbI2a9sCFs=
X-Received: by 2002:a92:d5c6:0:b0:357:d136:7218 with SMTP id
 d6-20020a92d5c6000000b00357d1367218mr9764723ilq.7.1698496557210; Sat, 28 Oct
 2023 05:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231028000738.968009-1-bhstalel@gmail.com>
In-Reply-To: <20231028000738.968009-1-bhstalel@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 28 Oct 2023 08:35:46 -0400
Message-ID: <CADkTA4PWe7-2GgsiyZMFqppje+hhY_3yUMrENF2DGaKv+pUwEw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] meta: classes-recipe: A class for simple Kernel modules
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 12:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189762

On Fri, Oct 27, 2023 at 8:07=E2=80=AFPM BELHADJ SALEM Talel <bhstalel@gmail=
.com> wrote:
>
> The module class provides what is needed to compile a Linux Kernel module
> but since the Makefile is always the same for simple modules that have
> their sources in one directory level, I thought of creating new class wra=
pper
> to automatically prepare the Makefile.
> Also, using variable flag feature, a recipe can provide multiple modules
> and can be handled the same way as PACKAGECONFIG is used to enabled/disab=
le
> features.

I find this method of preparing a kernel module much harder to follow
(and debug).

So Richard is ok with the class, I have no objections, it may serve a class=
 of
developers, but it isn't something I'd support as a first option.

But please, create a separate example for it, not modifying hello-world, we=
 want
that simple and explicit example to persist.

Bruce

>
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> ---
>  .../recipes-kernel/hello-mod/hello-mod_0.1.bb |  11 +-
>  meta/classes-recipe/simple-module.bbclass     | 116 ++++++++++++++++++
>  2 files changed, 120 insertions(+), 7 deletions(-)
>  create mode 100644 meta/classes-recipe/simple-module.bbclass
>
> diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/me=
ta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> index a2fb212a68..f191b08be5 100644
> --- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> +++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> @@ -3,16 +3,13 @@ DESCRIPTION =3D "${SUMMARY}"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e"
>
> -inherit module
> +inherit simple-module
>
> -SRC_URI =3D "file://Makefile \
> -           file://hello.c \
> +SRC_URI =3D "file://hello.c \
>             file://COPYING \
>            "
>
>  S =3D "${WORKDIR}"
>
> -# The inherit of module.bbclass will automatically name module packages =
with
> -# "kernel-module-" prefix as required by the oe-core build environment.
> -
> -RPROVIDES:${PN} +=3D "kernel-module-hello"
> +MODULE_SRC =3D "hello"
> +MODULE_SRC[hello] =3D ""
> \ No newline at end of file
> diff --git a/meta/classes-recipe/simple-module.bbclass b/meta/classes-rec=
ipe/simple-module.bbclass
> new file mode 100644
> index 0000000000..a837dec848
> --- /dev/null
> +++ b/meta/classes-recipe/simple-module.bbclass
> @@ -0,0 +1,116 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +# Class to generate Makefile for Linux Kernel modules
> +#
> +# The aim of this class is to provide a way to gain time
> +# when creating recipes for Linux Kernel modules
> +#
> +# Required variable:
> +#   MODULE_SRC
> +#
> +# This variable itself counts on flags to know what files
> +# to use for .ko generation and their .o dependencies
> +#
> +# Usage:
> +#   If you have the following module structure:
> +#       |-- module.c
> +#       |-- dep1.c
> +#       `-- dep2.c
> +#   then you set:
> +#   MODULE_SRC[module] =3D "dep1 dep2"
> +#
> +# This will generate:
> +#   obj-m +=3D module.o
> +#   module-objs +=3D dep1.o dep2.o
> +#
> +# This class supports multiple modules as well
> +# each module will be added to obj-m and if it has dependencies
> +# an -objs variable will be created.
> +#
> +# A module can be enabled or disabled by adding or removing
> +# the module name from MODULE_SRC
> +#
> +# Limitations:
> +#   - All modules source files should exist in the same folder level
> +
> +inherit module
> +
> +python do_prepare_makefile() {
> +
> +    if not (d.getVar('MODULE_SRC') or "").split():
> +        bb.warn("You inherited easy-module but did not set drivers in MO=
DULE_SRC")
> +
> +    kernel_modules =3D (d.getVar('MODULE_SRC') or "").split()
> +
> +    if kernel_modules:
> +        kernel_modules_flags =3D d.getVarFlags('MODULE_SRC') or []
> +
> +        objs_data =3D {}
> +        for k_module in kernel_modules:
> +
> +            # Check if all enabled drivers have corresponding flag
> +            if not k_module in kernel_modules_flags:
> +                bb.fatal(f"Driver {k_module} is enabled but does not hav=
e a flag entry")
> +
> +            k_module_file =3D f"{k_module}.c"
> +            if not os.path.isfile(k_module_file):
> +                bb.fatal(f"Source file {k_module_file} is not found")
> +
> +            k_module_o =3D f"{k_module}.o"
> +            objs_data[k_module] =3D []
> +
> +            k_module_deps =3D (d.getVarFlag('MODULE_SRC', k_module) or "=
").split()
> +            for dep in k_module_deps:
> +                dep_file =3D f"{dep}.c"
> +                dep_o =3D f"{dep}.o"
> +
> +                if not os.path.isfile(dep_file):
> +                    bb.fatal(f"Dependency file {dep_file} for the {k_mod=
ule_file} is not found")
> +
> +                objs_data[k_module].append(dep_o)
> +
> +        with open('Makefile', 'w') as mf:
> +            # Main modules
> +            mf.write(
> +                f"""
> +# This Makefile is generated automatically by easy-module class
> +obj-m +=3D {' '.join([objm + '.o' for objm in objs_data.keys()])}
> +""")
> +
> +            # Modules dependencies
> +            for k_module, deps in objs_data.items():
> +                if deps:
> +                    mf.write(
> +                        f"""
> +{k_module}-objs +=3D {' '.join([dep for dep in deps])}
> +""")
> +
> +            # Rest of Makefile
> +            mf.write(
> +                """
> +SRC :=3D $(shell pwd)
> +
> +all:
> +\t$(MAKE) -C $(KERNEL_SRC) M=3D$(SRC)
> +
> +modules_install:
> +\t$(MAKE) -C $(KERNEL_SRC) M=3D$(SRC) modules_install
> +
> +clean:
> +\trm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
> +\trm -f Module.markers Module.symvers modules.order
> +\trm -rf .tmp_versions Modules.symvers
> +""")
> +}
> +
> +RPROVIDES:${PN} +=3D "kernel-module-${PN}"
> +
> +export SRC =3D "${B}"
> +
> +do_prepare_makefile[docs] =3D "Automate Makefile preparation for simple =
Kernel modules"
> +do_prepare_makefile[dirs] =3D "${B}"
> +addtask do_prepare_makefile before do_configure after do_patch
> \ No newline at end of file
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189756): https://lists.openembedded.org/g/openembedde=
d-core/message/189756
> Mute This Topic: https://lists.openembedded.org/mt/102233042/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

