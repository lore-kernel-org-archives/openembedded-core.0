Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61F8C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 09:31:25 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.97178.1679650279447869121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 02:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YE3qLZgH;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id j11so1332784lfg.13
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679650277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2knOOQ8iAtDwcjV8ti0VvcX540n26Avt+APeuYxqkA=;
        b=YE3qLZgHgEQUqfgmakEqMzfSbLjQeeAopunoVtvSdkxQWnmuMOveY4DhdQ+RVJKKyb
         SFobOCPDJXHi2VSCxppPSUJTpIzAIapCo7UshUho14Spen+n84PYrelbRJ329A/1fRai
         vuyfNBMJ7cyK+3Smf7iB7TdPLdqflIuNH9R1xpXA3Eu2N6/QpyLYLwCeLv4+FKBDLPup
         rqj+bCluZDq/8PjnyslgnOeUkBgyoWkBo33EAmwRgYtZK6Gl76ywY8ujRZj2HkggMcd4
         mn/FEMwR9q8Ow0g1KfK7L7k23ilgnfLmPInGkIfhR79YBZFXFTmLdZ7luDXJFtFO+7rz
         WPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679650277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2knOOQ8iAtDwcjV8ti0VvcX540n26Avt+APeuYxqkA=;
        b=kVBfWadmLiTs+doXV8wLh08ubdtqE1JCSe6NvNH/kr+msD/YTgCPnXoEF1r/fmmFTL
         QKm3mWf/WFDs3O6qnvBzoo5YEUP8VoBz18R7+d/aT7c04KC8ZF5rLIA/FcqdFUJt7E9Z
         1vW9D32RVwqiyhBd5fz25J4KYbPNGWVE7kpYTdaYjzL6Dedv2yZe1Npxuy6J4ZZqFh9m
         O3G2on3HZZdrrPHdjrrVYf5eq0vaXpeXvr6Tv4SE6pxJzZZtKC5zQeAzKZ/agQXMjzp6
         UNhCY+l5Uj+AZA9Pux90XEhqET448sjzlFz5Kd0vb6zEK91m/OYpa7rIig24smoIG54m
         /nVw==
X-Gm-Message-State: AAQBX9fzMdEdWYDUTH8PCXnYFZHjtpjrMO4KzzF7FiQOAH1Ida3VEs6g
	sslrzWJqHHPpGq+PTEf64Es1cA1JuBgSbMRA3XE=
X-Google-Smtp-Source: AKy350b5QQ54Sxu/4TnJYpa6iKYxyXa71vfPSuH4cIpT8ofSNKMfP8mKMyYRVpwmF1lFZjB4Lh+vw+gUrkVPB+LJAq8=
X-Received: by 2002:ac2:5448:0:b0:4e9:bcf5:a0b6 with SMTP id
 d8-20020ac25448000000b004e9bcf5a0b6mr519155lfn.11.1679650277131; Fri, 24 Mar
 2023 02:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <174CE003EF809BC1.11516@lists.openembedded.org>
 <20230324031319.4172410-1-zboszor@gmail.com> <CANNYZj-qCPb2Jtmq_PC9vD+z9my1XH4HT-UG_R58sWbDa3V2Vw@mail.gmail.com>
 <58aab6f6-c036-6ba5-3735-23ff77aff90e@gmail.com>
In-Reply-To: <58aab6f6-c036-6ba5-3735-23ff77aff90e@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Mar 2023 10:31:05 +0100
Message-ID: <CANNYZj-1Pru24SB6XHUYR5eKyn_Om0=9JUMDsJ1kZj9mtuv9_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] meson.bbclass: Split into meson-env and
 meson classes
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 09:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179021

Cam you please place this information into the commit message? At some
point someone will need to find out why this was done this way, and
email thread would by then be hopelessly undiscoverable.

Alex

On Fri, 24 Mar 2023 at 09:43, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> 2023. 03. 24. 8:47 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > It would help if you explain why existing meson class can't be used
> > directly, and what the meson class adds compared to meson-env that
> > gets in the way of that.
>
> The email thread for the mesonpy bbclass in
> openembedded-devel lists all the problems.
>
> Summary:
> * Both meson and python_pep517 classes declare
>     EXPORT_FUNCTION. For some reason, meson always wins
>     regardless of the inheritance order. The mesonpy class
>     needs the meson cross compiler environment using the
>     pep517 configure/compile/install functions.
> * The meson class adds do_qa_configure which fails because
>     the mesonpy build moves the meson setup phase from
>     do_configure to do_compile. Removing items from
>     do_configure[postfuncs] is impossible because this results
>     in a parse error:
>     do_configure[postfuncs]:remove =3D "meson_do_qa_configure"
>
> The only option left is to split the environment setup part
> out of meson.bbclass.
>
> > Alex
> >
> > On Fri, 24 Mar 2023 at 04:13, Zoltan Boszormenyi <zboszor@gmail.com> wr=
ote:
> >> The new meson-env class will be used by a new PEP517 python
> >> build class using meson-python a.k.a. mesonpy.
> >>
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> >> ---
> >> v2: The split-off part is called meson-env.bbclass
> >>      because "common" is not liked.
> >>
> >>   meta/classes-recipe/meson-env.bbclass | 141 ++++++++++++++++++++++++=
++
> >>   meta/classes-recipe/meson.bbclass     | 136 +-----------------------=
-
> >>   2 files changed, 142 insertions(+), 135 deletions(-)
> >>   create mode 100644 meta/classes-recipe/meson-env.bbclass
> >>
> >> diff --git a/meta/classes-recipe/meson-env.bbclass b/meta/classes-reci=
pe/meson-env.bbclass
> >> new file mode 100644
> >> index 0000000000..e02b3e5ab6
> >> --- /dev/null
> >> +++ b/meta/classes-recipe/meson-env.bbclass
> >> @@ -0,0 +1,141 @@
> >> +#
> >> +# Copyright OpenEmbedded Contributors
> >> +#
> >> +# SPDX-License-Identifier: MIT
> >> +#
> >> +
> >> +inherit python3native meson-routines qemu
> >> +
> >> +DEPENDS:append =3D " meson-native ninja-native"
> >> +
> >> +EXEWRAPPER_ENABLED:class-native =3D "False"
> >> +EXEWRAPPER_ENABLED:class-nativesdk =3D "False"
> >> +EXEWRAPPER_ENABLED ?=3D "${@bb.utils.contains('MACHINE_FEATURES', 'qe=
mu-usermode', 'True', 'False', d)}"
> >> +DEPENDS:append =3D "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED=
') =3D=3D 'True' else ''}"
> >> +
> >> +# As Meson enforces out-of-tree builds we can just use cleandirs
> >> +B =3D "${WORKDIR}/build"
> >> +do_configure[cleandirs] =3D "${B}"
> >> +
> >> +# Where the meson.build build configuration is
> >> +MESON_SOURCEPATH =3D "${S}"
> >> +
> >> +def noprefix(var, d):
> >> +    return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
> >> +
> >> +MESON_BUILDTYPE ?=3D "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'pl=
ain', d)}"
> >> +MESON_BUILDTYPE[vardeps] +=3D "DEBUG_BUILD"
> >> +MESONOPTS =3D " --prefix ${prefix} \
> >> +              --buildtype ${MESON_BUILDTYPE} \
> >> +              --bindir ${@noprefix('bindir', d)} \
> >> +              --sbindir ${@noprefix('sbindir', d)} \
> >> +              --datadir ${@noprefix('datadir', d)} \
> >> +              --libdir ${@noprefix('libdir', d)} \
> >> +              --libexecdir ${@noprefix('libexecdir', d)} \
> >> +              --includedir ${@noprefix('includedir', d)} \
> >> +              --mandir ${@noprefix('mandir', d)} \
> >> +              --infodir ${@noprefix('infodir', d)} \
> >> +              --sysconfdir ${sysconfdir} \
> >> +              --localstatedir ${localstatedir} \
> >> +              --sharedstatedir ${sharedstatedir} \
> >> +              --wrap-mode nodownload \
> >> +              --native-file ${WORKDIR}/meson.native"
> >> +
> >> +EXTRA_OEMESON:append =3D " ${PACKAGECONFIG_CONFARGS}"
> >> +
> >> +MESON_CROSS_FILE =3D ""
> >> +MESON_CROSS_FILE:class-target =3D "--cross-file ${WORKDIR}/meson.cros=
s"
> >> +MESON_CROSS_FILE:class-nativesdk =3D "--cross-file ${WORKDIR}/meson.c=
ross"
> >> +
> >> +# Needed to set up qemu wrapper below
> >> +export STAGING_DIR_HOST
> >> +
> >> +def rust_tool(d, target_var):
> >> +    rustc =3D d.getVar('RUSTC')
> >> +    if not rustc:
> >> +        return ""
> >> +    cmd =3D [rustc, "--target", d.getVar(target_var)] + d.getVar("RUS=
TFLAGS").split()
> >> +    return "rust =3D %s" % repr(cmd)
> >> +
> >> +addtask write_config before do_configure
> >> +do_write_config[vardeps] +=3D "CC CXX LD AR NM STRIP READELF CFLAGS C=
XXFLAGS LDFLAGS RUSTC RUSTFLAGS"
> >> +do_write_config() {
> >> +    # This needs to be Py to split the args into single-element lists
> >> +    cat >${WORKDIR}/meson.cross <<EOF
> >> +[binaries]
> >> +c =3D ${@meson_array('CC', d)}
> >> +cpp =3D ${@meson_array('CXX', d)}
> >> +cython =3D 'cython3'
> >> +ar =3D ${@meson_array('AR', d)}
> >> +nm =3D ${@meson_array('NM', d)}
> >> +strip =3D ${@meson_array('STRIP', d)}
> >> +readelf =3D ${@meson_array('READELF', d)}
> >> +objcopy =3D ${@meson_array('OBJCOPY', d)}
> >> +pkgconfig =3D 'pkg-config'
> >> +llvm-config =3D 'llvm-config'
> >> +cups-config =3D 'cups-config'
> >> +g-ir-scanner =3D '${STAGING_BINDIR}/g-ir-scanner-wrapper'
> >> +g-ir-compiler =3D '${STAGING_BINDIR}/g-ir-compiler-wrapper'
> >> +${@rust_tool(d, "HOST_SYS")}
> >> +${@"exe_wrapper =3D '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEW=
RAPPER_ENABLED') =3D=3D 'True' else ""}
> >> +
> >> +[built-in options]
> >> +c_args =3D ${@meson_array('CFLAGS', d)}
> >> +c_link_args =3D ${@meson_array('LDFLAGS', d)}
> >> +cpp_args =3D ${@meson_array('CXXFLAGS', d)}
> >> +cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
> >> +
> >> +[properties]
> >> +needs_exe_wrapper =3D true
> >> +
> >> +[host_machine]
> >> +system =3D '${@meson_operating_system('HOST_OS', d)}'
> >> +cpu_family =3D '${@meson_cpu_family('HOST_ARCH', d)}'
> >> +cpu =3D '${HOST_ARCH}'
> >> +endian =3D '${@meson_endian('HOST', d)}'
> >> +
> >> +[target_machine]
> >> +system =3D '${@meson_operating_system('TARGET_OS', d)}'
> >> +cpu_family =3D '${@meson_cpu_family('TARGET_ARCH', d)}'
> >> +cpu =3D '${TARGET_ARCH}'
> >> +endian =3D '${@meson_endian('TARGET', d)}'
> >> +EOF
> >> +
> >> +    cat >${WORKDIR}/meson.native <<EOF
> >> +[binaries]
> >> +c =3D ${@meson_array('BUILD_CC', d)}
> >> +cpp =3D ${@meson_array('BUILD_CXX', d)}
> >> +cython =3D 'cython3'
> >> +ar =3D ${@meson_array('BUILD_AR', d)}
> >> +nm =3D ${@meson_array('BUILD_NM', d)}
> >> +strip =3D ${@meson_array('BUILD_STRIP', d)}
> >> +readelf =3D ${@meson_array('BUILD_READELF', d)}
> >> +objcopy =3D ${@meson_array('BUILD_OBJCOPY', d)}
> >> +pkgconfig =3D 'pkg-config-native'
> >> +${@rust_tool(d, "BUILD_SYS")}
> >> +
> >> +[built-in options]
> >> +c_args =3D ${@meson_array('BUILD_CFLAGS', d)}
> >> +c_link_args =3D ${@meson_array('BUILD_LDFLAGS', d)}
> >> +cpp_args =3D ${@meson_array('BUILD_CXXFLAGS', d)}
> >> +cpp_link_args =3D ${@meson_array('BUILD_LDFLAGS', d)}
> >> +EOF
> >> +}
> >> +
> >> +do_write_config:append:class-target() {
> >> +    # Write out a qemu wrapper that will be used as exe_wrapper so th=
at meson
> >> +    # can run target helper binaries through that.
> >> +    qemu_binary=3D"${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['=
$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
> >> +    cat > ${WORKDIR}/meson-qemuwrapper << EOF
> >> +#!/bin/sh
> >> +# Use a modules directory which doesn't exist so we don't load random=
 things
> >> +# which may then get deleted (or their dependencies) and potentially =
segfault
> >> +export GIO_MODULE_DIR=3D${STAGING_LIBDIR}/gio/modules-dummy
> >> +
> >> +# meson sets this wrongly (only to libs in build-dir), qemu_wrapper_c=
mdline() and GIR_EXTRA_LIBS_PATH take care of it properly
> >> +unset LD_LIBRARY_PATH
> >> +
> >> +$qemu_binary "\$@"
> >> +EOF
> >> +    chmod +x ${WORKDIR}/meson-qemuwrapper
> >> +}
> >> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/m=
eson.bbclass
> >> index 48688bed75..697cf6ecc8 100644
> >> --- a/meta/classes-recipe/meson.bbclass
> >> +++ b/meta/classes-recipe/meson.bbclass
> >> @@ -4,141 +4,7 @@
> >>   # SPDX-License-Identifier: MIT
> >>   #
> >>
> >> -inherit python3native meson-routines qemu
> >> -
> >> -DEPENDS:append =3D " meson-native ninja-native"
> >> -
> >> -EXEWRAPPER_ENABLED:class-native =3D "False"
> >> -EXEWRAPPER_ENABLED:class-nativesdk =3D "False"
> >> -EXEWRAPPER_ENABLED ?=3D "${@bb.utils.contains('MACHINE_FEATURES', 'qe=
mu-usermode', 'True', 'False', d)}"
> >> -DEPENDS:append =3D "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED=
') =3D=3D 'True' else ''}"
> >> -
> >> -# As Meson enforces out-of-tree builds we can just use cleandirs
> >> -B =3D "${WORKDIR}/build"
> >> -do_configure[cleandirs] =3D "${B}"
> >> -
> >> -# Where the meson.build build configuration is
> >> -MESON_SOURCEPATH =3D "${S}"
> >> -
> >> -def noprefix(var, d):
> >> -    return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
> >> -
> >> -MESON_BUILDTYPE ?=3D "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'pl=
ain', d)}"
> >> -MESON_BUILDTYPE[vardeps] +=3D "DEBUG_BUILD"
> >> -MESONOPTS =3D " --prefix ${prefix} \
> >> -              --buildtype ${MESON_BUILDTYPE} \
> >> -              --bindir ${@noprefix('bindir', d)} \
> >> -              --sbindir ${@noprefix('sbindir', d)} \
> >> -              --datadir ${@noprefix('datadir', d)} \
> >> -              --libdir ${@noprefix('libdir', d)} \
> >> -              --libexecdir ${@noprefix('libexecdir', d)} \
> >> -              --includedir ${@noprefix('includedir', d)} \
> >> -              --mandir ${@noprefix('mandir', d)} \
> >> -              --infodir ${@noprefix('infodir', d)} \
> >> -              --sysconfdir ${sysconfdir} \
> >> -              --localstatedir ${localstatedir} \
> >> -              --sharedstatedir ${sharedstatedir} \
> >> -              --wrap-mode nodownload \
> >> -              --native-file ${WORKDIR}/meson.native"
> >> -
> >> -EXTRA_OEMESON:append =3D " ${PACKAGECONFIG_CONFARGS}"
> >> -
> >> -MESON_CROSS_FILE =3D ""
> >> -MESON_CROSS_FILE:class-target =3D "--cross-file ${WORKDIR}/meson.cros=
s"
> >> -MESON_CROSS_FILE:class-nativesdk =3D "--cross-file ${WORKDIR}/meson.c=
ross"
> >> -
> >> -# Needed to set up qemu wrapper below
> >> -export STAGING_DIR_HOST
> >> -
> >> -def rust_tool(d, target_var):
> >> -    rustc =3D d.getVar('RUSTC')
> >> -    if not rustc:
> >> -        return ""
> >> -    cmd =3D [rustc, "--target", d.getVar(target_var)] + d.getVar("RUS=
TFLAGS").split()
> >> -    return "rust =3D %s" % repr(cmd)
> >> -
> >> -addtask write_config before do_configure
> >> -do_write_config[vardeps] +=3D "CC CXX LD AR NM STRIP READELF CFLAGS C=
XXFLAGS LDFLAGS RUSTC RUSTFLAGS"
> >> -do_write_config() {
> >> -    # This needs to be Py to split the args into single-element lists
> >> -    cat >${WORKDIR}/meson.cross <<EOF
> >> -[binaries]
> >> -c =3D ${@meson_array('CC', d)}
> >> -cpp =3D ${@meson_array('CXX', d)}
> >> -cython =3D 'cython3'
> >> -ar =3D ${@meson_array('AR', d)}
> >> -nm =3D ${@meson_array('NM', d)}
> >> -strip =3D ${@meson_array('STRIP', d)}
> >> -readelf =3D ${@meson_array('READELF', d)}
> >> -objcopy =3D ${@meson_array('OBJCOPY', d)}
> >> -pkgconfig =3D 'pkg-config'
> >> -llvm-config =3D 'llvm-config'
> >> -cups-config =3D 'cups-config'
> >> -g-ir-scanner =3D '${STAGING_BINDIR}/g-ir-scanner-wrapper'
> >> -g-ir-compiler =3D '${STAGING_BINDIR}/g-ir-compiler-wrapper'
> >> -${@rust_tool(d, "HOST_SYS")}
> >> -${@"exe_wrapper =3D '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEW=
RAPPER_ENABLED') =3D=3D 'True' else ""}
> >> -
> >> -[built-in options]
> >> -c_args =3D ${@meson_array('CFLAGS', d)}
> >> -c_link_args =3D ${@meson_array('LDFLAGS', d)}
> >> -cpp_args =3D ${@meson_array('CXXFLAGS', d)}
> >> -cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
> >> -
> >> -[properties]
> >> -needs_exe_wrapper =3D true
> >> -
> >> -[host_machine]
> >> -system =3D '${@meson_operating_system('HOST_OS', d)}'
> >> -cpu_family =3D '${@meson_cpu_family('HOST_ARCH', d)}'
> >> -cpu =3D '${HOST_ARCH}'
> >> -endian =3D '${@meson_endian('HOST', d)}'
> >> -
> >> -[target_machine]
> >> -system =3D '${@meson_operating_system('TARGET_OS', d)}'
> >> -cpu_family =3D '${@meson_cpu_family('TARGET_ARCH', d)}'
> >> -cpu =3D '${TARGET_ARCH}'
> >> -endian =3D '${@meson_endian('TARGET', d)}'
> >> -EOF
> >> -
> >> -    cat >${WORKDIR}/meson.native <<EOF
> >> -[binaries]
> >> -c =3D ${@meson_array('BUILD_CC', d)}
> >> -cpp =3D ${@meson_array('BUILD_CXX', d)}
> >> -cython =3D 'cython3'
> >> -ar =3D ${@meson_array('BUILD_AR', d)}
> >> -nm =3D ${@meson_array('BUILD_NM', d)}
> >> -strip =3D ${@meson_array('BUILD_STRIP', d)}
> >> -readelf =3D ${@meson_array('BUILD_READELF', d)}
> >> -objcopy =3D ${@meson_array('BUILD_OBJCOPY', d)}
> >> -pkgconfig =3D 'pkg-config-native'
> >> -${@rust_tool(d, "BUILD_SYS")}
> >> -
> >> -[built-in options]
> >> -c_args =3D ${@meson_array('BUILD_CFLAGS', d)}
> >> -c_link_args =3D ${@meson_array('BUILD_LDFLAGS', d)}
> >> -cpp_args =3D ${@meson_array('BUILD_CXXFLAGS', d)}
> >> -cpp_link_args =3D ${@meson_array('BUILD_LDFLAGS', d)}
> >> -EOF
> >> -}
> >> -
> >> -do_write_config:append:class-target() {
> >> -    # Write out a qemu wrapper that will be used as exe_wrapper so th=
at meson
> >> -    # can run target helper binaries through that.
> >> -    qemu_binary=3D"${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['=
$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
> >> -    cat > ${WORKDIR}/meson-qemuwrapper << EOF
> >> -#!/bin/sh
> >> -# Use a modules directory which doesn't exist so we don't load random=
 things
> >> -# which may then get deleted (or their dependencies) and potentially =
segfault
> >> -export GIO_MODULE_DIR=3D${STAGING_LIBDIR}/gio/modules-dummy
> >> -
> >> -# meson sets this wrongly (only to libs in build-dir), qemu_wrapper_c=
mdline() and GIR_EXTRA_LIBS_PATH take care of it properly
> >> -unset LD_LIBRARY_PATH
> >> -
> >> -$qemu_binary "\$@"
> >> -EOF
> >> -    chmod +x ${WORKDIR}/meson-qemuwrapper
> >> -}
> >> +inherit meson-env
> >>
> >>   # Tell externalsrc that changes to this file require a reconfigure
> >>   CONFIGURE_FILES =3D "meson.build"
> >> --
> >> 2.39.2
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#179011): https://lists.openembedded.org/g/openembe=
dded-core/message/179011
> >> Mute This Topic: https://lists.openembedded.org/mt/97816812/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

