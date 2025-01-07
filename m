Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B068BE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:50:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.20496.1736257806317506535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:50:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FeuSo9g1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso93956515e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736257805; x=1736862605; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OO0w7k01yayaff6GpHAKSjchkrVIuvR5jmPEliFwlgU=;
        b=FeuSo9g1qFKYErK6rhGX3Ma1Xmw1tcwPcuEf88xi+xoRiqerNmNOp1voHuWO0hkwuJ
         iSAKBm5+lvOL6/ZpTZKqC58JwbWrdyLZ+7DIdKmJO+t7az57YzJYlWoTcxiojnquHcq1
         a1dOPnOLsH8D6v91Asomg9vKalo7iqgEHeXCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736257805; x=1736862605;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OO0w7k01yayaff6GpHAKSjchkrVIuvR5jmPEliFwlgU=;
        b=TqZSLCKOFM6CZEmQNXmTdf7db9tEbnaQIQ2iRUtJBG8r7dYR/KjM0puZOwF35ZqFox
         rj/E4JdFI69kWqU8mIw0VzSoQwGNHodQJrk8tvqMcH3qw3oeEEhPmXDkYGN3eXDG3i/y
         B15lP7yO4INdt9RRXvdwDlqv0cjyjSYI+jH6Nvwc62FbM7KkdFUWkKpdtdmsOlREVGjE
         M45kuxZ4mQeuwBaCUAqz/OaoUOOIaZpbYy7y0BpVU3GnRAWzUo5a61URt7wHkzZ3dChS
         LI8qgOYTEF9t86ERo3ibFGv5aF7csL5MHVCWl6yGMUOjjUu5t8RaczNgK3/Gd4E1bs6H
         FR6w==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+su1Tyaiq5inFyMXj6o9Cmu4LRbvd6PF3H954Byvsx4NR5M5BU1pM8cG7HfKIur6DAjGsR0JZynxgYOIs2G0QA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVum8SWEHd7CcuYiYFA86Z5JqMV4MK+kwnFRR0Vwh2JakR9Vof
	gaGm4pZiNV+iM76TLeHq7GqCmHH+0zeP+SOZu8qGJCD76o/+aHxF3uWRPk0eu14=
X-Gm-Gg: ASbGncu6LznOWxBNcrUPgVsnNbhhr3MPOB+oJnnns7wpXpPqryJ/ln2n+87KDNLirim
	7rUjBHLdq6qVqa8cbGBT7TuxynWdteoaTVO3+hg1lXnwPvWBPA4S/41PiJtuEh19JppINMIpmlv
	yq6Sb3tgwDEv08jmaTUPaq24FOb7LBk2fr20JHa4uaEtIQBc/73CsPFblocGKe4yNmQZ+hacmP3
	NCdKGBFQlHmmPcGA4rpJVo6/r8TtYMBr0J42m42eD7TQNkETg7Za6ve02zIcn8q4fONo/JKwsS0
	g9jB3rfZPjsIM11o6gkd2tUVC0VAEWjsr7ekx6e0Ykgd8A==
X-Google-Smtp-Source: AGHT+IEgzQfEwu2RUL7kmNGEiNczpg+QwIc8ERlrzD3IDKyJZBuCRuIZJQMt00BeC3neE8IkBtWCFQ==
X-Received: by 2002:a05:600c:1f87:b0:436:747d:55c9 with SMTP id 5b1f17b1804b1-436dc1c1604mr24197135e9.5.1736257804560;
        Tue, 07 Jan 2025 05:50:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a621:21b2:eb2a:5bdb? ([2001:8b0:aba:5f3c:a621:21b2:eb2a:5bdb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366128a3c9sm600125285e9.40.2025.01.07.05.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:50:03 -0800 (PST)
Message-ID: <c8b6cef63868b39af4893e487716c39994ec0e8e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/19] clang.inc: Global settings for clang
 toolchain
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 07 Jan 2025 13:50:02 +0000
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209467

Hi Khem,

I know I've promised some review of this for a while, sorry it has
taken as long. I'd hoped others with an interest in seeing this in core
would help but that hasn't been the case so far.

In reading through the patches in this series, it is unfortunately
nowhere near ready. I think there is preparation work needed both in
core and in meta-clang before this can work.

Above all else, I want to get this right. We have an opportunity to
make OE-Core work well with multiple toolchains, not just clang. If we
get this wrong, we complicate core and create a mess which it could
take years to unravel.

On Tue, 2024-11-05 at 10:45 -0800, Khem Raj via lists.openembedded.org wrot=
e:
> It is added to default distro include file
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/conf/distro/include/clang.inc | 147 ++++++++++++++++++++++++++=
+++
> =C2=A01 file changed, 147 insertions(+)
> =C2=A0create mode 100644 meta/conf/distro/include/clang.inc
>=20
> diff --git a/meta/conf/distro/include/clang.inc b/meta/conf/distro/includ=
e/clang.inc
> new file mode 100644
> index 00000000000..ce49bbc0ed1
> --- /dev/null
> +++ b/meta/conf/distro/include/clang.inc
> @@ -0,0 +1,147 @@
> +# Add the necessary override
> +CCACHE_COMPILERCHECK:toolchain-clang ?=3D "%compiler% -v"
> +HOST_CC_ARCH:prepend:toolchain-clang =3D "-target ${HOST_SYS} "
> +CC:toolchain-clang=C2=A0 =3D "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARC=
H}${TOOLCHAIN_OPTIONS}"
> +CXX:toolchain-clang =3D "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}$=
{TOOLCHAIN_OPTIONS}"
> +CPP:toolchain-clang =3D "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${T=
OOLCHAIN_OPTIONS} -E"
> +CCLD:toolchain-clang =3D "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${=
TOOLCHAIN_OPTIONS}"
> +RANLIB:toolchain-clang =3D "${HOST_PREFIX}llvm-ranlib"
> +AR:toolchain-clang =3D "${HOST_PREFIX}llvm-ar"
> +NM:toolchain-clang =3D "${HOST_PREFIX}llvm-nm"
> +OBJDUMP:toolchain-clang =3D "${HOST_PREFIX}llvm-objdump"
> +OBJCOPY:toolchain-clang =3D "${HOST_PREFIX}llvm-objcopy"
> +STRIP:toolchain-clang =3D "${HOST_PREFIX}llvm-strip"
> +STRINGS:toolchain-clang =3D "${HOST_PREFIX}llvm-strings"
> +READELF:toolchain-clang =3D "${HOST_PREFIX}llvm-readelf"
> +LD:toolchain-clang =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-l=
ld', '${HOST_PREFIX}ld.lld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${HOST_PR=
EFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', d)}"
> +
> +LTO:toolchain-clang =3D "${@bb.utils.contains('DISTRO_FEATURES', 'thin-l=
to', '-flto=3Dthin', '-flto -fuse-ld=3Dlld', d)}"

I think this highlights that these kinds of variables need to move in
core to a separate .inc file which is then called something gcc
related. We can create a clang file alongside with the different
definitions.

We'd then likely to something similar for gcc native vs clang native
and the BUILD_* definitions.

> +COMPILER_RT ??=3D ""
> +COMPILER_RT:toolchain-clang:class-native =3D "-rtlib=3Dlibgcc ${UNWINDLI=
B}"
> +COMPILER_RT:armeb =3D "-rtlib=3Dlibgcc ${UNWINDLIB}"
> +COMPILER_RT:libc-klibc =3D "-rtlib=3Dlibgcc ${UNWINDLIB}"
> +
> +UNWINDLIB ??=3D ""
> +UNWINDLIB:toolchain-clang:class-native =3D "--unwindlib=3Dlibgcc"
> +UNWINDLIB:armeb =3D "--unwindlib=3Dlibgcc"
> +UNWINDLIB_libc-klibc =3D "--unwindlib=3Dlibgcc"
> +
> +LIBCPLUSPLUS ??=3D ""
> +LIBCPLUSPLUS:armv5 =3D "-stdlib=3Dlibstdc++"
> +
> +CXXFLAGS:append:toolchain-clang =3D " ${LIBCPLUSPLUS}"
> +LDFLAGS:append:toolchain-clang =3D " ${COMPILER_RT} ${LIBCPLUSPLUS}"
> +
> +TUNE_CCARGS:remove:toolchain-clang =3D "-meb"
> +TUNE_CCARGS:remove:toolchain-clang =3D "-mel"
> +TUNE_CCARGS:append:toolchain-clang =3D "${@bb.utils.contains("TUNE_FEATU=
RES", "bigendian", " -mbig-endian", " -mlittle-endian", d)}"

I don't want to see :remove in OE-Core. We should be using toolchain-
gcc in core to set these instead and have clang versions alongside?

It'd be nice if we can drop from append to +=3D too.

> +
> +# Clang does not yet support big.LITTLE performance tunes, so use the LI=
TTLE for tunes
> +TUNE_CCARGS:remove:toolchain-clang =3D "\
> +=C2=A0=C2=A0=C2=A0 -mcpu=3Dcortex-a57.cortex-a53${TUNE_CCARGS_MARCH_OPTS=
} \
> +=C2=A0=C2=A0=C2=A0 -mcpu=3Dcortex-a72.cortex-a53${TUNE_CCARGS_MARCH_OPTS=
} \
> +=C2=A0=C2=A0=C2=A0 -mcpu=3Dcortex-a15.cortex-a7${TUNE_CCARGS_MARCH_OPTS}=
 \
> +=C2=A0=C2=A0=C2=A0 -mcpu=3Dcortex-a17.cortex-a7${TUNE_CCARGS_MARCH_OPTS}=
 \
> +=C2=A0=C2=A0=C2=A0 -mcpu=3Dcortex-a72.cortex-a35${TUNE_CCARGS_MARCH_OPTS=
} \
> +=C2=A0=C2=A0=C2=A0 -mcpu=3Dcortex-a73.cortex-a53${TUNE_CCARGS_MARCH_OPTS=
} \
> +=C2=A0=C2=A0=C2=A0 -mcpu=3Dcortex-a75.cortex-a55${TUNE_CCARGS_MARCH_OPTS=
} \
> +=C2=A0=C2=A0=C2=A0 -mcpu=3Dcortex-a76.cortex-a55${TUNE_CCARGS_MARCH_OPTS=
}"
> +TUNE_CCARGS:append:toolchain-clang =3D "${@bb.utils.contains_any("TUNE_F=
EATURES", "cortexa72-cortexa53 cortexa57-cortexa53 cortexa73-cortexa53", " =
-mcpu=3Dcortex-a53${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
> +TUNE_CCARGS:append:toolchain-clang =3D "${@bb.utils.contains_any("TUNE_F=
EATURES", "cortexa15-cortexa7 cortexa17-cortexa7", " -mcpu=3Dcortex-a7${TUN=
E_CCARGS_MARCH_OPTS}", "", d)}"
> +TUNE_CCARGS:append:toolchain-clang =3D "${@bb.utils.contains_any("TUNE_F=
EATURES", "cortexa72-cortexa35", " -mcpu=3Dcortex-a35${TUNE_CCARGS_MARCH_OP=
TS}", "", d)}"
> +TUNE_CCARGS:append:toolchain-clang =3D "${@bb.utils.contains_any("TUNE_F=
EATURES", "cortexa75-cortexa55 cortexa76-cortexa55", " -mcpu=3Dcortex-a55${=
TUNE_CCARGS_MARCH_OPTS}", "", d)}"
> +
> +# Workaround for https://github.com/llvm/llvm-project/issues/85699
> +# needed for 64bit rpi3/rpi4 machines
> +TUNE_CCARGS_MARCH_OPTS:append:toolchain-clang =3D "${@bb.utils.contains_=
any("DEFAULTTUNE", "cortexa72 cortexa53", "+nocrypto", "", d)}"
> +
> +# Clang does not support octeontx2 processor
> +TUNE_CCARGS:remove:toolchain-clang =3D "-mcpu=3Docteontx2${TUNE_CCARGS_M=
ARCH_OPTS}"
> +
> +# Reconcile some ppc anamolies
> +TUNE_CCARGS:remove:toolchain-clang:powerpc =3D "-mhard-float -mno-spe"
> +TUNE_CCARGS:append:toolchain-clang:libc-musl:powerpc64 =3D " -mlong-doub=
le-64"
> +TUNE_CCARGS:append:toolchain-clang:libc-musl:powerpc64le =3D " -mlong-do=
uble-64"
> +TUNE_CCARGS:append:toolchain-clang:libc-musl:powerpc =3D " -mlong-double=
-64"
> +# usrmerge workaround
> +TUNE_CCARGS:append:toolchain-clang =3D "${@bb.utils.contains("DISTRO_FEA=
TURES", "usrmerge", " --dyld-prefix=3D/usr", "", d)}"
> +
> +TUNE_CCARGS:append:toolchain-clang =3D " -Qunused-arguments"
> +
> +LDFLAGS:append:toolchain-clang:class-nativesdk:x86-64 =3D " -Wl,-dynamic=
-linker,${base_libdir}/ld-linux-x86-64.so.2"
> +LDFLAGS:append:toolchain-clang:class-nativesdk:x86 =3D " -Wl,-dynamic-li=
nker,${base_libdir}/ld-linux.so.2"
> +LDFLAGS:append:toolchain-clang:class-nativesdk:aarch64 =3D " -Wl,-dynami=
c-linker,${base_libdir}/ld-linux-aarch64.so.1"

Does nativesdk with clang relocate properly?

> +LDFLAGS:toolchain-clang:class-nativesdk =3D "${BUILDSDK_LDFLAGS} \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wl,-rpath-link,${STAGING_LIBDIR}/.. \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wl,-rpath,${libdir}/.. "
> +
> +# Enable lld globally"
> +LDFLAGS:append:toolchain-clang =3D "${@bb.utils.contains('DISTRO_FEATURE=
S', 'ld-is-lld', ' -fuse-ld=3Dlld', '', d)}"
> +
> +# Remove gcc specific -fcanon-prefix-map option, added in gcc-13+
> +# clang does not support it yet
> +DEBUG_PREFIX_MAP:remove:toolchain-clang =3D "-fcanon-prefix-map"
> +
> +# choose between 'gcc' 'clang' an empty '' can be used as well
> +TOOLCHAIN ??=3D "gcc"
> +# choose between 'gnu' 'llvm'
> +TC_CXX_RUNTIME ??=3D "gnu"
> +# Using gcc or llvm runtime is only available when using clang for compi=
ler
> +#TC_CXX_RUNTIME:toolchain-gcc =3D "gnu"
> +TC_CXX_RUNTIME:armeb =3D "gnu"
> +TC_CXX_RUNTIME:armv5 =3D "gnu"
> +
> +TOOLCHAIN:class-native =3D "gcc"
> +TOOLCHAIN:class-nativesdk =3D "gcc"
> +TOOLCHAIN:class-cross-canadian =3D "gcc"
> +TOOLCHAIN:class-crosssdk =3D "gcc"
> +TOOLCHAIN:class-cross =3D "gcc"

Toolchain selection shouldn't be buried in a .inc file. This needs to
be higher level.

> +OVERRIDES =3D. "${@['', 'toolchain-${TOOLCHAIN}:']['${TOOLCHAIN}' !=3D '=
']}"
> +OVERRIDES =3D. "${@['', 'runtime-${TC_CXX_RUNTIME}:']['${TC_CXX_RUNTIME}=
' !=3D '']}"
> +OVERRIDES[vardepsexclude] +=3D "TOOLCHAIN TC_CXX_RUNTIME"

If we are introducing an toolchain override, that is a patch in its own
right and it doesn't belong buried in a .inc.

Whilst I can see we'll have to have a toolchain switch, I'm much less
sure about a runtime override too.

> +YOCTO_ALTERNATE_EXE_PATH:toolchain-clang:class-target =3D "${STAGING_BIN=
DIR}/llvm-config"
> +YOCTO_ALTERNATE_LIBDIR:toolchain-clang:class-target =3D "/${BASELIB}"

Does this really need to be set globally?

> +#YOCTO_ALTERNATE_EXE_PATH:toolchain-clang:class-target[export] =3D "1"
> +#YOCTO_ALTERNATE_LIBDIR:toolchain-clang:class-target[export] =3D "1"
> +
> +#DEPENDS:append:toolchain-clang:class-target =3D " clang-cross-${TARGET_=
ARCH} "
> +#DEPENDS:remove:toolchain-clang:allarch =3D "clang-cross-${TARGET_ARCH}"

Why the commented out lines?

> +def clang_base_deps(d):
> +=C2=A0=C2=A0=C2=A0 ret =3D ""
> +=C2=A0=C2=A0=C2=A0 if not d.getVar('INHIBIT_DEFAULT_DEPS', False):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not oe.utils.inherits(d, '=
allarch') :
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret +=
=3D " ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/libc"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (d=
.getVar('TC_CXX_RUNTIME').find('android') !=3D -1):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ret +=3D " ${MLPREFIX}libcxx"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ret +=3D " virtual/${TARGET_PREFIX}compilerlibs ${MLPREF=
IX}compiler-rt ${MLPREFIX}libcxx"
> +=C2=A0=C2=A0=C2=A0 return ret
> +
> +BASE_DEFAULT_DEPS:append:class-target:toolchain-clang:class-target =3D "=
 ${@clang_base_deps(d)}"
> +BASE_DEFAULT_DEPS:append:class-native:toolchain-clang:runtime-llvm =3D "=
 libcxx-native compiler-rt-native"
> +BASE_DEFAULT_DEPS:append:class-nativesdk:toolchain-clang:runtime-llvm =
=3D " clang-native nativesdk-libcxx nativesdk-compiler-rt"
> +
> +# do_populate_sysroot needs STRIP
> +POPULATESYSROOTDEPS:toolchain-clang:class-target =3D "${MLPREFIX}clang-c=
ross-${TARGET_ARCH}:do_populate_sysroot"

These kinds of bits should move to the toolchain inc? Maybe
parameterise it too? virtual provider?


> +
> +cmake_do_generate_toolchain_file:append:toolchain-clang () {
> +=C2=A0=C2=A0=C2=A0 cat >> ${WORKDIR}/toolchain.cmake <<EOF
> +set( CMAKE_CLANG_TIDY ${HOST_PREFIX}clang-tidy )
> +EOF
> +=C2=A0=C2=A0=C2=A0 sed -i 's/ -mmusl / /g' ${WORKDIR}/toolchain.cmake
> +}
> +
> +# dump recipes which still use gcc
> +#python __anonymous() {
> +#=C2=A0=C2=A0=C2=A0 toolchain =3D d.getVar("TOOLCHAIN")
> +#=C2=A0=C2=A0=C2=A0 if not toolchain or toolchain =3D=3D "clang" or 'cla=
ss-target' not in d.getVar('OVERRIDES').split(':'):
> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
> +#=C2=A0=C2=A0=C2=A0 pkgn =3D d.getVar("PN")
> +#=C2=A0=C2=A0=C2=A0 bb.warn("%s - %s" % (pkgn, toolchain))
> +#}

Does this comment block really need to be here?

The big problem with the series in general is it is just throwing clang
into core as is. I think we need small incremental changes adding
pieces step by step and we need to change core to support toolchain
selection as a core feature, not a bolt on buried in .inc and class
files.

Cheers,

Richard



