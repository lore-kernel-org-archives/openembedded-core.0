Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01338EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 13:03:03 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.7819.1686920574069340535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 06:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QDzByHfS;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-341c81d71f6so2758565ab.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 06:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686920573; x=1689512573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ajl6pJBli0RV+Bdy2qV3f0RM79GFPDFrABKRhmjBr5c=;
        b=QDzByHfSd4IqRmeLY47vLRWq4RjmVyxftu8glstXcsJ/vFjmmxfByhNcFurM8JklW9
         cbBM+wG7ynQTNbnjKvh6Ih/89FnudSXhJKKtxHhQhIYNVliPrsKu4xxRgTVoukcH6Tgx
         KBQyWSyQRjzJxxW5rBwtuI2amKhBahllBeTnuoBBmSxepdd3N1IlO7OELz8vqkVYsYtg
         HJNe1bEdwGBbw2ajvzKe3KBt4RGHGnpLhsfF6b83ryTZtdkFoxOb7rhbu9uyyW1tStjZ
         b5bZpFEvatUrZI/Ef+j2QCiy2hr5K4NMVQHmUe78ChzKE+ZMW9dyNqp60r0pkOukMmu7
         pxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686920573; x=1689512573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ajl6pJBli0RV+Bdy2qV3f0RM79GFPDFrABKRhmjBr5c=;
        b=j6RnD5AICGjbq5YL9o0nkjSYFuyfO1BYakvjSKauxZtZ9Sp/jeqXwFlXD5VVFiZ0vx
         BsYoDRhSwiAYlfr2x8am5APDdQvsv/9zgyxC0XXTOWUvvvEDGQJlZH1a3B2vPJYJGVoC
         S3xfnsq3wJyJKsoGeW9JHzFm0J8V22oPr8SH0iCXTNrV1wc3XZzrOEBDHEDej3dF/0Ej
         IelniCwrv+Zmgo5Qa1g4vpy0h9Yh6xq1elEUpoenv1HsZ04p0uC5EzBrHd7TyXAAZfJo
         wATNdgBCOppFjbT14pQq7tPbdXRVgLPBQ/sWr2e1o+NPus+4PzIFcf48lNL3uU12XK3c
         1kCw==
X-Gm-Message-State: AC+VfDxY5naNzCb0OHGEaDr657cRDovgFGsmgdJgMCk6vMNm9EgzcwBK
	D5UJy0r6cAZCHdgU3olTCgXtPsW8XrZsRQWPGMxCFehKsYc=
X-Google-Smtp-Source: ACHHUZ4Djqe2JqX0JoVK5lHFbG06wBe3iYGP82ZjxwLj6iOo3k+Yc0tvGpVCuLjL8l0A0sxvbY4nKQZQKD5hbGC6DP0=
X-Received: by 2002:a92:d9cf:0:b0:33e:8195:5a4 with SMTP id
 n15-20020a92d9cf000000b0033e819505a4mr2060126ilq.20.1686920573044; Fri, 16
 Jun 2023 06:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230616083111.3007680-1-raj.khem@gmail.com>
In-Reply-To: <20230616083111.3007680-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 16 Jun 2023 09:02:52 -0400
Message-ID: <CADkTA4MQ8LZuk84ua=xcYRaDR41t7LxhO1dcwQcyqRvU3bvY+g@mail.gmail.com>
Subject: Re: [PATCH 1/5] kernel: Add kernel specific STRIP variable
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 13:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183020

On Fri, Jun 16, 2023 at 4:31=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> strip can be coming from binutils or from llvm
> in some cases llvm-strip can fail on kernel
>
> Subprocess output:aarch64-yoe-linux-llvm-strip: error: Link field value 2=
8 in section .rela.dyn is not a symbol table
>
> This helps in selecting which strip is used when building kernel
>

It is annoying that we've ended up with so many places that we call
into the kernel build.

And of course, the variables we set aren't consistent.

I've had a TODO to see if it can be cleaned up, maybe that's my summer
stretch goal.

But of course, not anything to do with this change .. the actual
commit looks fine to me.

Bruce

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes-recipe/kernel-arch.bbclass                    | 3 +++
>  meta/classes-recipe/kernel-devicetree.bbclass              | 2 +-
>  meta/classes-recipe/kernel-yocto.bbclass                   | 4 +++-
>  meta/classes-recipe/kernel.bbclass                         | 6 +++++-
>  meta/classes-recipe/module.bbclass                         | 7 +++++++
>  .../make-mod-scripts/make-mod-scripts_1.0.bb               | 1 +
>  meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb     | 2 ++
>  7 files changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recip=
e/kernel-arch.bbclass
> index 58770489167..6e19dbbba89 100644
> --- a/meta/classes-recipe/kernel-arch.bbclass
> +++ b/meta/classes-recipe/kernel-arch.bbclass
> @@ -70,10 +70,13 @@ TARGET_AR_KERNEL_ARCH ?=3D ""
>  HOST_AR_KERNEL_ARCH ?=3D "${TARGET_AR_KERNEL_ARCH}"
>  TARGET_OBJCOPY_KERNEL_ARCH ?=3D ""
>  HOST_OBJCOPY_KERNEL_ARCH ?=3D "${TARGET_OBJCOPY_KERNEL_ARCH}"
> +TARGET_STRIP_KERNEL_ARCH ?=3D ""
> +HOST_STRIP_KERNEL_ARCH ?=3D "${TARGET_STRIP_KERNEL_ARCH}"
>
>  KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-l=
d=3Dbfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=3D${STAGING_KERNEL_DIR}=3D${=
KERNEL_SRC_PATH} -fdebug-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL=
_SRC_PATH}"
>  KERNEL_LD =3D "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>  KERNEL_AR =3D "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
>  KERNEL_OBJCOPY =3D "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL=
_ARCH}"
> +KERNEL_STRIP =3D "${CCACHE}${HOST_PREFIX}strip ${HOST_STRIP_KERNEL_ARCH}=
"
>  TOOLCHAIN ?=3D "gcc"
>
> diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes=
-recipe/kernel-devicetree.bbclass
> index 7ccf4b76c82..eff052b4029 100644
> --- a/meta/classes-recipe/kernel-devicetree.bbclass
> +++ b/meta/classes-recipe/kernel-devicetree.bbclass
> @@ -73,7 +73,7 @@ do_compile:append() {
>
>         for dtbf in ${KERNEL_DEVICETREE}; do
>                 dtb=3D`normalize_dtb "$dtbf"`
> -               oe_runmake $dtb CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KE=
RNEL_LD}" OBJCOPY=3D"${KERNEL_OBJCOPY}" ${KERNEL_EXTRA_ARGS}
> +               oe_runmake $dtb CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KE=
RNEL_LD}" OBJCOPY=3D"${KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRIP}" ${KERNEL_=
EXTRA_ARGS}
>         done
>  }
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index ceb451b6996..3f2ce17aeb8 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -447,7 +447,7 @@ do_kernel_configme() {
>                 bbfatal_log "Could not find configuration queue (${meta_d=
ir}/config.queue)"
>         fi
>
> -       CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC} $=
{BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL_CC=
}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"${KERNEL_OBJCOPY}" ARCH=3D${ARCH} merge_c=
onfig.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_=
build.log 2>&1
> +       CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC} $=
{BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL_CC=
}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"${KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRI=
P}" ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${m=
eta_dir}/cfg/merge_config_build.log 2>&1
>         if [ $? -ne 0 -o ! -f ${B}/.config ]; then
>                 bberror "Could not generate a .config for ${KMACHINE}-${L=
INUX_KERNEL_TYPE}"
>                 if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
> @@ -482,6 +482,7 @@ python do_config_analysis() {
>      env['LD'] =3D d.getVar('KERNEL_LD')
>      env['CC'] =3D d.getVar('KERNEL_CC')
>      env['OBJCOPY'] =3D d.getVar('KERNEL_OBJCOPY')
> +    env['STRIP'] =3D d.getVar('KERNEL_STRIP')
>      env['ARCH'] =3D d.getVar('ARCH')
>      env['srctree'] =3D s
>
> @@ -544,6 +545,7 @@ python do_kernel_configcheck() {
>      env['LD'] =3D d.getVar('KERNEL_LD')
>      env['CC'] =3D d.getVar('KERNEL_CC')
>      env['OBJCOPY'] =3D d.getVar('KERNEL_OBJCOPY')
> +    env['STRIP'] =3D d.getVar('KERNEL_STRIP')
>      env['ARCH'] =3D d.getVar('ARCH')
>      env['srctree'] =3D s
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 5ed4a2e03c7..c1d74bf54ad 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -241,7 +241,7 @@ UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
>  # Some Linux kernel configurations need additional parameters on the com=
mand line
>  KERNEL_EXTRA_ARGS ?=3D ""
>
> -EXTRA_OEMAKE +=3D ' CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"$=
{KERNEL_OBJCOPY}"'
> +EXTRA_OEMAKE +=3D ' CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"$=
{KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRIP}"'
>  EXTRA_OEMAKE +=3D ' HOSTCC=3D"${BUILD_CC}" HOSTCFLAGS=3D"${BUILD_CFLAGS}=
" HOSTLDFLAGS=3D"${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"'
>  EXTRA_OEMAKE +=3D ' HOSTCXX=3D"${BUILD_CXX}" HOSTCXXFLAGS=3D"${BUILD_CXX=
FLAGS}"'
>
> @@ -340,6 +340,10 @@ kernel_do_transform_bundled_initramfs() {
>  }
>  do_transform_bundled_initramfs[dirs] =3D "${B}"
>
> +python do_package:prepend () {
> +    os.environ['STRIP'] =3D d.getVar('KERNEL_STRIP')
> +}
> +
>  python do_devshell:prepend () {
>      os.environ["LDFLAGS"] =3D ''
>  }
> diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/mod=
ule.bbclass
> index b3b852be5f6..f2f0b25a2d1 100644
> --- a/meta/classes-recipe/module.bbclass
> +++ b/meta/classes-recipe/module.bbclass
> @@ -20,6 +20,10 @@ python __anonymous () {
>      d.setVar('KBUILD_EXTRA_SYMBOLS', " ".join(extra_symbols))
>  }
>
> +python do_package:prepend () {
> +    os.environ['STRIP'] =3D d.getVar('KERNEL_STRIP')
> +}
> +
>  python do_devshell:prepend () {
>      os.environ['CFLAGS'] =3D ''
>      os.environ['CPPFLAGS'] =3D ''
> @@ -33,6 +37,7 @@ python do_devshell:prepend () {
>      os.environ['LD'] =3D d.getVar('KERNEL_LD')
>      os.environ['AR'] =3D d.getVar('KERNEL_AR')
>      os.environ['OBJCOPY'] =3D d.getVar('KERNEL_OBJCOPY')
> +    os.environ['STRIP'] =3D d.getVar('KERNEL_STRIP')
>      os.environ['O'] =3D d.getVar('STAGING_KERNEL_BUILDDIR')
>      kbuild_extra_symbols =3D d.getVar('KBUILD_EXTRA_SYMBOLS')
>      if kbuild_extra_symbols:
> @@ -47,6 +52,7 @@ module_do_compile() {
>                    KERNEL_VERSION=3D${KERNEL_VERSION}    \
>                    CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
>                    AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOPY}" \
> +                  STRIP=3D"${KERNEL_STRIP}" \
>                    O=3D${STAGING_KERNEL_BUILDDIR} \
>                    KBUILD_EXTRA_SYMBOLS=3D"${KBUILD_EXTRA_SYMBOLS}" \
>                    ${MAKE_TARGETS}
> @@ -57,6 +63,7 @@ module_do_install() {
>         oe_runmake DEPMOD=3Decho MODLIB=3D"${D}${nonarch_base_libdir}/mod=
ules/${KERNEL_VERSION}" \
>                    INSTALL_FW_PATH=3D"${D}${nonarch_base_libdir}/firmware=
" \
>                    CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"${K=
ERNEL_OBJCOPY}" \
> +                  STRIP=3D"${KERNEL_STRIP}" \
>                    O=3D${STAGING_KERNEL_BUILDDIR} \
>                    ${MODULES_INSTALL_TARGET}
>
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb=
 b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 28e0807d1d6..e3b258753f3 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -29,6 +29,7 @@ do_configure() {
>         for t in prepare scripts_basic scripts; do
>                 oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
>                 AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOPY}" \
> +               STRIP=3D"${KERNEL_STRIP}" \
>                 -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $=
t
>         done
>  }
> diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/met=
a/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> index efe359ec329..3d35481bdc9 100644
> --- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> @@ -22,11 +22,13 @@ do_compile() {
>                 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS CC LD CPP
>                 oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
>                            AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOP=
Y}" \
> +                          STRIP=3D"${KERNEL_STRIP}" \
>                            -C ${STAGING_KERNEL_DIR} scripts
>                 oe_runmake KDIR=3D${STAGING_KERNEL_DIR}   \
>                            M=3D"${S}/runtime/uprobes/" \
>                            CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
>                            AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOP=
Y}" \
> +                          STRIP=3D"${KERNEL_STRIP}" \
>                            -C "${S}/runtime/uprobes/"
>         fi
>  }
> --
> 2.41.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

