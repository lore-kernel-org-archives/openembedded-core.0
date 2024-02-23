Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F21FC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 14:10:18 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.12169.1708697411853398966
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 06:10:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NLzSHV9m;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so321575a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 06:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708697411; x=1709302211; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFfFEkQpW6/5lNcFtMQDO0AwH2s2e9FPcN9/WePVC4g=;
        b=NLzSHV9m3Jee0Mvaz3Q84JkdH2PuxujdWDNS/wJTzKIlIpfDVMiXNWsjEBxv2mOBMW
         ZAgUc7GRn4A+ON/jfcW57DMWQb55ekDkARNuFzVmkt0goQZ0trdGX5qbmWhZbLfm/dSo
         Hmw9jGaTsvZfkHGIsTYL0wmPWHLDqe4fmsP5WRg1ZPJjeItXj8HkcA2dEFc547QG3gPw
         PFrr5afnlymI70dZm0e8XJ/ALYkUVJ+K4T27kxTwqeH7vnqZd8HmXvbrxuDrkzBOgiLp
         TT0fU/tIE2nM9jPihcqOyCPnRNiXwL+yZsSGvIAka1iJp2vqWgp8QUuhykfk+KUw9bya
         xioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708697411; x=1709302211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFfFEkQpW6/5lNcFtMQDO0AwH2s2e9FPcN9/WePVC4g=;
        b=lWeWdH463gaXP4D9PqxVrSvw1mkdGNga62yleuJU1Zk9cnTY2pv4AfBzqrLRTfuvAk
         x/Um+4612VoHZqDj4ZAPB/RwA6y4ILrZMWxRwQP4qOmGLS0ErVBpWEUoK4uMxw4IvgD2
         cAZVQ5Y/xl5l1SkTB/cVCf9KzamjOpb0V2CPxfuXa5sbmcVJqGwRDS+O3O+ZEHwDWNrR
         tCV/Tj8Z3nhwA1sJBWd9IatJE73Bn5CbocXBzy6wlSz/vfMVbTy8FvPJfaU3J2YaG1O5
         RRohUbMt0qNaSIn3sgNPnsQ68NYZ2ggQlR72FR5txQondiDv2l7IyuPnhjdHEQVlEen1
         P8ZA==
X-Gm-Message-State: AOJu0YwCvpFSNNVrzixkaeNhPodKU95jTHIwC7bPeJvTb5XIhrOAAA6j
	ZopkJ7Spl8H750smNN5/otQNqo2HflvMx9NvVwP48etRajl2sFnZ/AbXggRlWghH0PyeVUHwedi
	5JXFUVDaeX1APafs/pycVhq6kCPY=
X-Google-Smtp-Source: AGHT+IEmenLrDUtT8ErpM+UQVifhWI1Xzje5Sna0mKKNdXRPnHYV9BYghYmxxfGRqcW/c7UaWi7vKiBwhi15jIyAuDg=
X-Received: by 2002:a05:6a20:1583:b0:19e:b96e:e6b with SMTP id
 h3-20020a056a20158300b0019eb96e0e6bmr2274199pzj.19.1708697411130; Fri, 23 Feb
 2024 06:10:11 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4M7qHmuZAst9jHQS52k7SKEjsBhcdeB+HM2TWAEeVdMRw@mail.gmail.com>
 <20240223080513.1200106-1-kamatam@amazon.com>
In-Reply-To: <20240223080513.1200106-1-kamatam@amazon.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 23 Feb 2024 09:09:59 -0500
Message-ID: <CADkTA4OD_rO2CPSHjA240-oGGzn9OPTd+=LT4Ne3t2yFFSQtjA@mail.gmail.com>
Subject: Re: [PATCH v2] kernel.bbclass: Set pkg-config variables for building modules
To: Munehisa Kamata <kamatam@amazon.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 14:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196091

On Fri, Feb 23, 2024 at 3:05=E2=80=AFAM Munehisa Kamata <kamatam@amazon.com=
> wrote:
>
> The pkg-config workaround has been applied for kernel image building, but
> not for module building. So pkg-config variables are different between
> do_compile and do_compile_kernelmodules tasks. It may unnecessary trigger
> rebuilding of a few host tools at the later task.
>
> Especially when CONFIG_DEBUG_INFO_BTF is enabled in the kernel, it may ev=
en
> trigger rebuilding vmlinux at do_compile_kernelmodules due to the rebuilt
> host tools such as certs/extract-cert or objtool (on x86). This eventuall=
y
> creates an inconsistent set of kernel binaries.
>
> Here is the repro steps:
>
>  - Check out nanbield on x86
>    - The unexpected rebuild happens on kirkstone or possibly earlier
>
>  - Ensure that pahole is available (e.g. via meta-oe)
>
>  - Set KERNEL_DEBUG to "True" to properly set up PAHOLE
>    e.g.
>    $ export KERNEL_DEBUG=3D"True"
>    $ export BB_ENV_PASSTHROUGH_ADDITIONS=3D"${BB_ENV_PASSTHROUGH_ADDITION=
S} KERNEL_DEBUG"
>
>  - Enable CONFIG_DEBUG_INFO_BTF=3Dy
>    e.g.
>    $ bitbake -c menuconfig virtual/kernel
>     -> Kernel hacking
>       -> Compile-time checks and compiler options
>         -> Generate BTF typeinfo
>
>  - Build the kernel
>    e.g.
>    $ bitbake virtual/kernel
>
> The BTF information in the resulting bzImage and kernel modules are
> inconsistent, because the module's BTF information is generated using the
> "second" vmlinux that doesn't have the identical BTF to the "first" vmlin=
ux.
> These modules can't be loaded at runtime due to the BTF mismatch.
>
> This also leads to a build-id mismatch between the installed bzImage and
> vmlinux since the bzImage is created from the first vmlinux, but the
> installed vmlinux is the second one.
>
>   $ eu-readelf -n tmp/work/qemux86_64-poky-linux/linux-yocto/6.5.13+git/i=
mage/boot/{bzImage*,vmlinux*} | grep "Build ID"
>    Build ID: 4a0d62ee7fef0244950f0f604253729875bea493
>    Build ID: fb99b3d91399dbe42bf67ddee59e0f5a0c7f74d9
>
> To avoid the unexpected rebuilding that results in such inconsistency, se=
t
> the same pkg-config variables when building kernel and modules. For kerne=
l
> 5.19 and above, simply set the HOSTPKG_CONFIG in the make command line.

That is indeed not a simple workflow!

In the past, we've always had the existing packageconfig results picked up =
and
used by later stages of the kernel build which prevented things like this f=
rom
happening.

Have you figured out exactly which packageconfig is triggering the rebuild,=
 and
had a look to see if something change such that the existing results
aren't used ?

All that being said, rather than repeating the exports, it would be
better to have
them in a common place, since eventually everything but the HOSTPKG_CONFIG
definition will be dropped.

Have you tried a more class-global export of the values ? We have a
few of those,
but admittedly, we have way more exports that are duplicated between do_com=
pile
and do_compile_kernelmodules(), so the duplicated exports aren't a big issu=
e.

Bruce

>
> Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
> ---
>
> v1 -> v2: Rewrote the commit message with the repro steps
>
>  meta/classes-recipe/kernel.bbclass | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index a76aaee5ba..db4461e551 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -239,6 +239,8 @@ KERNEL_EXTRA_ARGS ?=3D ""
>  EXTRA_OEMAKE +=3D ' CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"$=
{KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRIP}"'
>  EXTRA_OEMAKE +=3D ' HOSTCC=3D"${BUILD_CC}" HOSTCFLAGS=3D"${BUILD_CFLAGS}=
" HOSTLDFLAGS=3D"${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"'
>  EXTRA_OEMAKE +=3D ' HOSTCXX=3D"${BUILD_CXX}" HOSTCXXFLAGS=3D"${BUILD_CXX=
FLAGS}"'
> +# Only for newer kernels (5.19+), native pkg-config variables are set fo=
r older kernels when building kernel and modules
> +EXTRA_OEMAKE +=3D ' HOSTPKG_CONFIG=3D"pkg-config-native"'
>
>  KERNEL_ALT_IMAGETYPE ??=3D ""
>
> @@ -356,9 +358,6 @@ kernel_do_compile() {
>         export PKG_CONFIG_LIBDIR=3D"$PKG_CONFIG_DIR"
>         export PKG_CONFIG_SYSROOT_DIR=3D""
>
> -       # for newer kernels (5.19+) there's a dedicated variable
> -       export HOSTPKG_CONFIG=3D"pkg-config-native"
> -
>         if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
>                 # kernel sources do not use do_unpack, so SOURCE_DATE_EPO=
CH may not
>                 # be set....
> @@ -408,6 +407,13 @@ addtask transform_kernel after do_compile before do_=
install
>
>  do_compile_kernelmodules() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> +
> +       # setup native pkg-config variables (kconfig scripts call pkg-con=
fig directly, cannot generically be overriden to pkg-config-native)
> +       export PKG_CONFIG_DIR=3D"${STAGING_DIR_NATIVE}${libdir_native}/pk=
gconfig"
> +       export PKG_CONFIG_PATH=3D"$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIV=
E}/pkgconfig"
> +       export PKG_CONFIG_LIBDIR=3D"$PKG_CONFIG_DIR"
> +       export PKG_CONFIG_SYSROOT_DIR=3D""
> +
>         if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
>                 # kernel sources do not use do_unpack, so SOURCE_DATE_EPO=
CH may not
>                 # be set....
> --
> 2.34.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

