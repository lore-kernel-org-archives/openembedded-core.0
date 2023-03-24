Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F0EC6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 07:48:05 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.95336.1679644078040202407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 00:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=frsZoD26;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id g17so1092664lfv.4
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 00:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679644076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjQf6ejcBjj+8atAK2KBsOcee7sZeSxTwxrfEcNjEHk=;
        b=frsZoD26TvdyKI2gpAsS86XDXv3QCu+9OYZ+X9Gxz7q3pUFOhZUXHZOmTz5U2qJfNv
         gczSB6BvqV9kDhJqYJWLxDyKkE3OJKALqNvU36a83xpHUHW+CAX7S4GXReto/wcp4JZ8
         ka++1Lp/iUUQXc7NJXtCtRWkDl5poAhnGH75wdq/Z0FAZIPV6JV3uroLBV/EO6g/kGVv
         HpahVkirDpN9cFh4QG1VK0OW5+z349Uc3wMDGAT4OI3n8aEkpdqSf3BCOfMC72C5ZgOc
         VOVorEAQoDdI2m9C1zIZIeMugKU0LLHFY8aBYF53cl0U8vvBJbS4hcjodzF30J1abwxu
         ZtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679644076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjQf6ejcBjj+8atAK2KBsOcee7sZeSxTwxrfEcNjEHk=;
        b=Tyo9sO8a+unc7m6Hh81IPKMLDHZYJoR9tsnh/6UBiZIQR3mtKhdHKUEQdgTMlH+t1E
         Ll7XWtCqdaphNMXCZiqmPxQUtGU996H1XuBxl+KI8kChgFMS9+pvqheSparaIacQ5j3Z
         09VfS9cPiWh0vCS+Yt7vJQ/hrZquj9xjUAj6swGGWunDRotLtB2+A7/cBQYIvXzQGdLS
         QOQWTFrhu1wRkmXe4c2G3+KwSaIRdppHkedauFlpoIcmqEuaqkZFImgyWrA58xvU0DjV
         fPd/RwglAZ+PxqABAdMiuJD3Su3x/eiW9f+U63iq8tasEn0rB49PWUug6qvcVt7nMhS5
         fzCA==
X-Gm-Message-State: AAQBX9d+pA2Zl5PDSwUf1k/J2do5nUT+fG+5qg6O99p3YHqerw53G15R
	MO43qZtbt2TNDPi1/K+JZXGFHuNN++B0sxfvwAM=
X-Google-Smtp-Source: AKy350ZkUL/JamqtIs3x1Os6VGHxcW5X+pFwPoVHHXYy22vIxrXd/L1gj2uMaz6pUpL9kPS8eRJSP1SG6Gy9k/jqRWE=
X-Received: by 2002:ac2:4a9d:0:b0:4e8:9988:f8ab with SMTP id
 l29-20020ac24a9d000000b004e89988f8abmr430944lfp.11.1679644076125; Fri, 24 Mar
 2023 00:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <174CE003EF809BC1.11516@lists.openembedded.org> <20230324031319.4172410-1-zboszor@gmail.com>
In-Reply-To: <20230324031319.4172410-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Mar 2023 08:47:44 +0100
Message-ID: <CANNYZj-qCPb2Jtmq_PC9vD+z9my1XH4HT-UG_R58sWbDa3V2Vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] meson.bbclass: Split into meson-env and
 meson classes
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 07:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179012

It would help if you explain why existing meson class can't be used
directly, and what the meson class adds compared to meson-env that
gets in the way of that.

Alex

On Fri, 24 Mar 2023 at 04:13, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
> The new meson-env class will be used by a new PEP517 python
> build class using meson-python a.k.a. mesonpy.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
> v2: The split-off part is called meson-env.bbclass
>     because "common" is not liked.
>
>  meta/classes-recipe/meson-env.bbclass | 141 ++++++++++++++++++++++++++
>  meta/classes-recipe/meson.bbclass     | 136 +------------------------
>  2 files changed, 142 insertions(+), 135 deletions(-)
>  create mode 100644 meta/classes-recipe/meson-env.bbclass
>
> diff --git a/meta/classes-recipe/meson-env.bbclass b/meta/classes-recipe/=
meson-env.bbclass
> new file mode 100644
> index 0000000000..e02b3e5ab6
> --- /dev/null
> +++ b/meta/classes-recipe/meson-env.bbclass
> @@ -0,0 +1,141 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +inherit python3native meson-routines qemu
> +
> +DEPENDS:append =3D " meson-native ninja-native"
> +
> +EXEWRAPPER_ENABLED:class-native =3D "False"
> +EXEWRAPPER_ENABLED:class-nativesdk =3D "False"
> +EXEWRAPPER_ENABLED ?=3D "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-=
usermode', 'True', 'False', d)}"
> +DEPENDS:append =3D "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') =
=3D=3D 'True' else ''}"
> +
> +# As Meson enforces out-of-tree builds we can just use cleandirs
> +B =3D "${WORKDIR}/build"
> +do_configure[cleandirs] =3D "${B}"
> +
> +# Where the meson.build build configuration is
> +MESON_SOURCEPATH =3D "${S}"
> +
> +def noprefix(var, d):
> +    return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
> +
> +MESON_BUILDTYPE ?=3D "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain=
', d)}"
> +MESON_BUILDTYPE[vardeps] +=3D "DEBUG_BUILD"
> +MESONOPTS =3D " --prefix ${prefix} \
> +              --buildtype ${MESON_BUILDTYPE} \
> +              --bindir ${@noprefix('bindir', d)} \
> +              --sbindir ${@noprefix('sbindir', d)} \
> +              --datadir ${@noprefix('datadir', d)} \
> +              --libdir ${@noprefix('libdir', d)} \
> +              --libexecdir ${@noprefix('libexecdir', d)} \
> +              --includedir ${@noprefix('includedir', d)} \
> +              --mandir ${@noprefix('mandir', d)} \
> +              --infodir ${@noprefix('infodir', d)} \
> +              --sysconfdir ${sysconfdir} \
> +              --localstatedir ${localstatedir} \
> +              --sharedstatedir ${sharedstatedir} \
> +              --wrap-mode nodownload \
> +              --native-file ${WORKDIR}/meson.native"
> +
> +EXTRA_OEMESON:append =3D " ${PACKAGECONFIG_CONFARGS}"
> +
> +MESON_CROSS_FILE =3D ""
> +MESON_CROSS_FILE:class-target =3D "--cross-file ${WORKDIR}/meson.cross"
> +MESON_CROSS_FILE:class-nativesdk =3D "--cross-file ${WORKDIR}/meson.cros=
s"
> +
> +# Needed to set up qemu wrapper below
> +export STAGING_DIR_HOST
> +
> +def rust_tool(d, target_var):
> +    rustc =3D d.getVar('RUSTC')
> +    if not rustc:
> +        return ""
> +    cmd =3D [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFL=
AGS").split()
> +    return "rust =3D %s" % repr(cmd)
> +
> +addtask write_config before do_configure
> +do_write_config[vardeps] +=3D "CC CXX LD AR NM STRIP READELF CFLAGS CXXF=
LAGS LDFLAGS RUSTC RUSTFLAGS"
> +do_write_config() {
> +    # This needs to be Py to split the args into single-element lists
> +    cat >${WORKDIR}/meson.cross <<EOF
> +[binaries]
> +c =3D ${@meson_array('CC', d)}
> +cpp =3D ${@meson_array('CXX', d)}
> +cython =3D 'cython3'
> +ar =3D ${@meson_array('AR', d)}
> +nm =3D ${@meson_array('NM', d)}
> +strip =3D ${@meson_array('STRIP', d)}
> +readelf =3D ${@meson_array('READELF', d)}
> +objcopy =3D ${@meson_array('OBJCOPY', d)}
> +pkgconfig =3D 'pkg-config'
> +llvm-config =3D 'llvm-config'
> +cups-config =3D 'cups-config'
> +g-ir-scanner =3D '${STAGING_BINDIR}/g-ir-scanner-wrapper'
> +g-ir-compiler =3D '${STAGING_BINDIR}/g-ir-compiler-wrapper'
> +${@rust_tool(d, "HOST_SYS")}
> +${@"exe_wrapper =3D '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAP=
PER_ENABLED') =3D=3D 'True' else ""}
> +
> +[built-in options]
> +c_args =3D ${@meson_array('CFLAGS', d)}
> +c_link_args =3D ${@meson_array('LDFLAGS', d)}
> +cpp_args =3D ${@meson_array('CXXFLAGS', d)}
> +cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
> +
> +[properties]
> +needs_exe_wrapper =3D true
> +
> +[host_machine]
> +system =3D '${@meson_operating_system('HOST_OS', d)}'
> +cpu_family =3D '${@meson_cpu_family('HOST_ARCH', d)}'
> +cpu =3D '${HOST_ARCH}'
> +endian =3D '${@meson_endian('HOST', d)}'
> +
> +[target_machine]
> +system =3D '${@meson_operating_system('TARGET_OS', d)}'
> +cpu_family =3D '${@meson_cpu_family('TARGET_ARCH', d)}'
> +cpu =3D '${TARGET_ARCH}'
> +endian =3D '${@meson_endian('TARGET', d)}'
> +EOF
> +
> +    cat >${WORKDIR}/meson.native <<EOF
> +[binaries]
> +c =3D ${@meson_array('BUILD_CC', d)}
> +cpp =3D ${@meson_array('BUILD_CXX', d)}
> +cython =3D 'cython3'
> +ar =3D ${@meson_array('BUILD_AR', d)}
> +nm =3D ${@meson_array('BUILD_NM', d)}
> +strip =3D ${@meson_array('BUILD_STRIP', d)}
> +readelf =3D ${@meson_array('BUILD_READELF', d)}
> +objcopy =3D ${@meson_array('BUILD_OBJCOPY', d)}
> +pkgconfig =3D 'pkg-config-native'
> +${@rust_tool(d, "BUILD_SYS")}
> +
> +[built-in options]
> +c_args =3D ${@meson_array('BUILD_CFLAGS', d)}
> +c_link_args =3D ${@meson_array('BUILD_LDFLAGS', d)}
> +cpp_args =3D ${@meson_array('BUILD_CXXFLAGS', d)}
> +cpp_link_args =3D ${@meson_array('BUILD_LDFLAGS', d)}
> +EOF
> +}
> +
> +do_write_config:append:class-target() {
> +    # Write out a qemu wrapper that will be used as exe_wrapper so that =
meson
> +    # can run target helper binaries through that.
> +    qemu_binary=3D"${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$ST=
AGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
> +    cat > ${WORKDIR}/meson-qemuwrapper << EOF
> +#!/bin/sh
> +# Use a modules directory which doesn't exist so we don't load random th=
ings
> +# which may then get deleted (or their dependencies) and potentially seg=
fault
> +export GIO_MODULE_DIR=3D${STAGING_LIBDIR}/gio/modules-dummy
> +
> +# meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdl=
ine() and GIR_EXTRA_LIBS_PATH take care of it properly
> +unset LD_LIBRARY_PATH
> +
> +$qemu_binary "\$@"
> +EOF
> +    chmod +x ${WORKDIR}/meson-qemuwrapper
> +}
> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
> index 48688bed75..697cf6ecc8 100644
> --- a/meta/classes-recipe/meson.bbclass
> +++ b/meta/classes-recipe/meson.bbclass
> @@ -4,141 +4,7 @@
>  # SPDX-License-Identifier: MIT
>  #
>
> -inherit python3native meson-routines qemu
> -
> -DEPENDS:append =3D " meson-native ninja-native"
> -
> -EXEWRAPPER_ENABLED:class-native =3D "False"
> -EXEWRAPPER_ENABLED:class-nativesdk =3D "False"
> -EXEWRAPPER_ENABLED ?=3D "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-=
usermode', 'True', 'False', d)}"
> -DEPENDS:append =3D "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') =
=3D=3D 'True' else ''}"
> -
> -# As Meson enforces out-of-tree builds we can just use cleandirs
> -B =3D "${WORKDIR}/build"
> -do_configure[cleandirs] =3D "${B}"
> -
> -# Where the meson.build build configuration is
> -MESON_SOURCEPATH =3D "${S}"
> -
> -def noprefix(var, d):
> -    return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
> -
> -MESON_BUILDTYPE ?=3D "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain=
', d)}"
> -MESON_BUILDTYPE[vardeps] +=3D "DEBUG_BUILD"
> -MESONOPTS =3D " --prefix ${prefix} \
> -              --buildtype ${MESON_BUILDTYPE} \
> -              --bindir ${@noprefix('bindir', d)} \
> -              --sbindir ${@noprefix('sbindir', d)} \
> -              --datadir ${@noprefix('datadir', d)} \
> -              --libdir ${@noprefix('libdir', d)} \
> -              --libexecdir ${@noprefix('libexecdir', d)} \
> -              --includedir ${@noprefix('includedir', d)} \
> -              --mandir ${@noprefix('mandir', d)} \
> -              --infodir ${@noprefix('infodir', d)} \
> -              --sysconfdir ${sysconfdir} \
> -              --localstatedir ${localstatedir} \
> -              --sharedstatedir ${sharedstatedir} \
> -              --wrap-mode nodownload \
> -              --native-file ${WORKDIR}/meson.native"
> -
> -EXTRA_OEMESON:append =3D " ${PACKAGECONFIG_CONFARGS}"
> -
> -MESON_CROSS_FILE =3D ""
> -MESON_CROSS_FILE:class-target =3D "--cross-file ${WORKDIR}/meson.cross"
> -MESON_CROSS_FILE:class-nativesdk =3D "--cross-file ${WORKDIR}/meson.cros=
s"
> -
> -# Needed to set up qemu wrapper below
> -export STAGING_DIR_HOST
> -
> -def rust_tool(d, target_var):
> -    rustc =3D d.getVar('RUSTC')
> -    if not rustc:
> -        return ""
> -    cmd =3D [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFL=
AGS").split()
> -    return "rust =3D %s" % repr(cmd)
> -
> -addtask write_config before do_configure
> -do_write_config[vardeps] +=3D "CC CXX LD AR NM STRIP READELF CFLAGS CXXF=
LAGS LDFLAGS RUSTC RUSTFLAGS"
> -do_write_config() {
> -    # This needs to be Py to split the args into single-element lists
> -    cat >${WORKDIR}/meson.cross <<EOF
> -[binaries]
> -c =3D ${@meson_array('CC', d)}
> -cpp =3D ${@meson_array('CXX', d)}
> -cython =3D 'cython3'
> -ar =3D ${@meson_array('AR', d)}
> -nm =3D ${@meson_array('NM', d)}
> -strip =3D ${@meson_array('STRIP', d)}
> -readelf =3D ${@meson_array('READELF', d)}
> -objcopy =3D ${@meson_array('OBJCOPY', d)}
> -pkgconfig =3D 'pkg-config'
> -llvm-config =3D 'llvm-config'
> -cups-config =3D 'cups-config'
> -g-ir-scanner =3D '${STAGING_BINDIR}/g-ir-scanner-wrapper'
> -g-ir-compiler =3D '${STAGING_BINDIR}/g-ir-compiler-wrapper'
> -${@rust_tool(d, "HOST_SYS")}
> -${@"exe_wrapper =3D '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAP=
PER_ENABLED') =3D=3D 'True' else ""}
> -
> -[built-in options]
> -c_args =3D ${@meson_array('CFLAGS', d)}
> -c_link_args =3D ${@meson_array('LDFLAGS', d)}
> -cpp_args =3D ${@meson_array('CXXFLAGS', d)}
> -cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
> -
> -[properties]
> -needs_exe_wrapper =3D true
> -
> -[host_machine]
> -system =3D '${@meson_operating_system('HOST_OS', d)}'
> -cpu_family =3D '${@meson_cpu_family('HOST_ARCH', d)}'
> -cpu =3D '${HOST_ARCH}'
> -endian =3D '${@meson_endian('HOST', d)}'
> -
> -[target_machine]
> -system =3D '${@meson_operating_system('TARGET_OS', d)}'
> -cpu_family =3D '${@meson_cpu_family('TARGET_ARCH', d)}'
> -cpu =3D '${TARGET_ARCH}'
> -endian =3D '${@meson_endian('TARGET', d)}'
> -EOF
> -
> -    cat >${WORKDIR}/meson.native <<EOF
> -[binaries]
> -c =3D ${@meson_array('BUILD_CC', d)}
> -cpp =3D ${@meson_array('BUILD_CXX', d)}
> -cython =3D 'cython3'
> -ar =3D ${@meson_array('BUILD_AR', d)}
> -nm =3D ${@meson_array('BUILD_NM', d)}
> -strip =3D ${@meson_array('BUILD_STRIP', d)}
> -readelf =3D ${@meson_array('BUILD_READELF', d)}
> -objcopy =3D ${@meson_array('BUILD_OBJCOPY', d)}
> -pkgconfig =3D 'pkg-config-native'
> -${@rust_tool(d, "BUILD_SYS")}
> -
> -[built-in options]
> -c_args =3D ${@meson_array('BUILD_CFLAGS', d)}
> -c_link_args =3D ${@meson_array('BUILD_LDFLAGS', d)}
> -cpp_args =3D ${@meson_array('BUILD_CXXFLAGS', d)}
> -cpp_link_args =3D ${@meson_array('BUILD_LDFLAGS', d)}
> -EOF
> -}
> -
> -do_write_config:append:class-target() {
> -    # Write out a qemu wrapper that will be used as exe_wrapper so that =
meson
> -    # can run target helper binaries through that.
> -    qemu_binary=3D"${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$ST=
AGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
> -    cat > ${WORKDIR}/meson-qemuwrapper << EOF
> -#!/bin/sh
> -# Use a modules directory which doesn't exist so we don't load random th=
ings
> -# which may then get deleted (or their dependencies) and potentially seg=
fault
> -export GIO_MODULE_DIR=3D${STAGING_LIBDIR}/gio/modules-dummy
> -
> -# meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdl=
ine() and GIR_EXTRA_LIBS_PATH take care of it properly
> -unset LD_LIBRARY_PATH
> -
> -$qemu_binary "\$@"
> -EOF
> -    chmod +x ${WORKDIR}/meson-qemuwrapper
> -}
> +inherit meson-env
>
>  # Tell externalsrc that changes to this file require a reconfigure
>  CONFIGURE_FILES =3D "meson.build"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179011): https://lists.openembedded.org/g/openembedde=
d-core/message/179011
> Mute This Topic: https://lists.openembedded.org/mt/97816812/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

