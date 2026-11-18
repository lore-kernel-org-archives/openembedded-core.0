Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13838.1795012416972770076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 06:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 6AIEXYYM3874241;
	Wed, 18 Nov 2026 08:33:34 -0600
Received: from [192.168.2.97] ([192.168.2.97])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 6AIEXSrd006884;
	Wed, 18 Nov 2026 08:33:29 -0600
Message-ID: <16a881c7-20f6-4bec-9177-08336d8663f5@kernel.crashing.org>
Date: Wed, 18 Nov 2026 08:33:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] pseudo: Tell makewrappers the target
 architecture
To: SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, liezhi.yang@windriver.com,
        sundeep.kokkonda@windriver.com, Randy.MacLeod@windriver.com
References: <20261118120426.1918842-1-sunilkumar.dora@windriver.com>
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20261118120426.1918842-1-sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 14:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250550

I did do a basic test of this when pseudo 1.99.1 was released.  "It worked for 
me", but I didn't do a full test on a cross-compiled arm64 host (x86->arm64).

--Mark

On 11/18/26 6:04 AM, Dora, Sunil Kumar via openembedded-core wrote:
> From: Sunil Dora <sunilkumar.dora@windriver.com>
> 
> makewrappers picks the architecture specific entries in wrapfuncs.in
> (e.g. the GLIBC_2.17 symbol versions for the xattr wrappers on aarch64)
> from the machine running the build rather than the machine pseudo is
> built for, so the pseudo packages differ between x86_64 and aarch64
> autobuilder workers.
> 
> Backport the upstream fix, which adds a configure --target option, and
> pass TARGET_SYS to it. pseudo-native is unchanged since TARGET_SYS is
> the build machine there.
> 
> The fix is in pseudo-1.99.1, so the patch can be dropped once SRCREV
> moves to that tag or later. The --target=${TARGET_SYS} in pseudo.inc
> has to stay.
> 
> [YOCTO #16376]
> 
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---
> v2: backport the upstream fix (pseudo 979add3116, in pseudo-1.99.1),
>      reworked as a configure --target option as Mark suggested.
> 
>   ...ow-the-wrapper-architecture-to-be-se.patch | 149 ++++++++++++++++++
>   meta/recipes-devtools/pseudo/pseudo.inc       |   4 +-
>   meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
>   3 files changed, 152 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
> 
> diff --git a/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch b/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
> new file mode 100644
> index 0000000000..6bdea7ad6d
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
> @@ -0,0 +1,149 @@
> +From 979add31166eadc1954b32ff7cb6038fbd171e06 Mon Sep 17 00:00:00 2001
> +From: Sunil Dora <sunilkumar.dora@windriver.com>
> +Date: Fri, 30 Oct 2026 11:56:45 -0700
> +Subject: [PATCH] makewrappers: Allow the wrapper architecture to be set for
> + cross builds
> +
> +Architecture specific modifiers in wrapfuncs.in, such as
> +version-aarch64="GLIBC_2.17" on the xattr wrappers, are selected with
> +platform.machine(), so they follow the machine running the script
> +rather than the one pseudo is built for. An aarch64 pseudo cross built
> +on x86_64 ends up with GLIBC_2.3 and the reverse with GLIBC_2.17, which
> +shows up as pseudo not being reproducible between x86_64 and aarch64
> +builders.
> +
> +Add a --target option to configure and pass it on to makewrappers,
> +which uses the cpu part of the triplet for these modifiers. Without
> +--target the build machine is used as before.
> +
> +[YOCTO #16376]
> +
> +Upstream-Status: Backport [https://git.yoctoproject.org/pseudo/commit/?id=979add31166eadc1954b32ff7cb6038fbd171e06]
> +
> +Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> +Message-Id: <20261030185645.765144-1-sunilkumar.dora@windriver.com>
> +Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> +---
> + Makefile.in  |  3 ++-
> + configure    |  6 ++++++
> + makewrappers | 17 +++++++++++++++--
> + 3 files changed, 23 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 6640a73..9c6da77 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -34,6 +34,7 @@ BITS=@BITS@
> + ARCH_FLAGS=@ARCH_FLAGS@
> + MARK64=@MARK64@
> + RPATH=@RPATH@
> ++TARGET=@TARGET@
> + VERSION=1.99.0
> +
> + LIB=@LIB@
> +@@ -146,7 +147,7 @@ tables: enums/*.in maketables templatefile.py $(TABLES)
> + 	./maketables enums/*.in
> +
> + wrappers: makewrappers templatefile.py $(TEMPLATES) ports/*/wrapfuncs.in
> +-	CC="$(CC) $(CFLAGS) $(CFLAGS_PSEUDO)" ./makewrappers "xattr=$(XATTR)"
> ++	CC="$(CC) $(CFLAGS) $(CFLAGS_PSEUDO)" ./makewrappers --target="$(TARGET)" "xattr=$(XATTR)"
> +
> + .SECONDARY: tables wrappers
> +
> +diff --git a/configure b/configure
> +index 68c9962..b43809e 100755
> +--- a/configure
> ++++ b/configure
> +@@ -10,6 +10,7 @@
> + opt_prefix=
> + opt_libdir=
> + opt_suffix=
> ++opt_target=
> + opt_arch=x86
> + opt_bits=
> + opt_sqlite=/usr
> +@@ -32,6 +33,7 @@ usage()
> +     echo >&2 "  configure --prefix=..."
> +     echo >&2 "           [--libdir=...]"
> +     echo >&2 "           [--suffix=...]"
> ++    echo >&2 "           [--target=...]"
> +     echo >&2 "           [--enable-memory-db]"
> +     echo >&2 "           [--enable-epoll]"
> +     echo >&2 "           [--enable-xattr]"
> +@@ -153,6 +155,9 @@ do
> +     --suffix=*)
> +         opt_suffix=${arg#--suffix=}
> +         ;;
> ++    --target=*)
> ++        opt_target=${arg#--target=}
> ++        ;;
> +     --arch=*)
> +         echo >&2 "WARNING: The --arch option is now deprecated. Use --cflags."
> +         opt_arch=${arg#--arch=}
> +@@ -341,6 +346,7 @@ sed -e '
> +   s,@LIBDIR@,'"$opt_libdir"',g
> +   s,@LIB@,'"$opt_lib"',g
> +   s,@SUFFIX@,'"$opt_suffix"',g
> ++  s,@TARGET@,'"$opt_target"',g
> +   s,@SQLITE@,'"$opt_sqlite"',g
> +   s,@ARCH_FLAGS@,'"$arch_flags"',g
> +   s,@DEFAULT_SQLITE@,'"$default_sqlite"',g
> +diff --git a/makewrappers b/makewrappers
> +index 81d2444..1ac46bf 100755
> +--- a/makewrappers
> ++++ b/makewrappers
> +@@ -15,6 +15,13 @@ import platform
> + import subprocess
> + from templatefile import TemplateFile
> +
> ++# Set from --target=, empty means the machine running this script
> ++target_arch = ""
> ++
> ++def wrapper_arch():
> ++    """Architecture the wrappers are built for: the --target cpu or the build machine."""
> ++    return target_arch or platform.machine()
> ++
> + class ArgumentList:
> +     """A (possibly empty) list of arguments"""
> +
> +@@ -316,11 +323,11 @@ class Function:
> +             # Strip all leading/trailing whitespace
> +             modifiers = {k.strip():v.strip() for k, v in modifiers.items()}
> +
> +-            arch = "-" + platform.machine()
> ++            arch = "-" + wrapper_arch()
> +             # Sorted so that versions-foo appear after versions, so overrides are easy
> +             for key in sorted(modifiers):
> +                 value = modifiers[key].replace('<equals>', '==')
> +-                # If the key is version-arm64 and we're on arm64 then rename this to version
> ++                # If the key is version-arm64 and we're building for arm64 then rename this to version
> +                 if key.endswith(arch):
> +                     key = key.replace(arch, "")
> +                 setattr(self, key, value)
> +@@ -664,10 +671,15 @@ def process_wrapfuncs(port):
> +
> + def main(argv):
> +     """Read in function definitions, write out files based on templates."""
> ++    global target_arch
> +     funcs = []
> +     sources = []
> +
> +     for arg in argv:
> ++        if arg.startswith('--target='):
> ++            # A GNU triplet such as aarch64-poky-linux, only the cpu part is used
> ++            target_arch = arg[len('--target='):].split('-')[0]
> ++            continue
> +         if '=' not in arg:
> +             print("Invalid argument '%s', must be of the form name=value" % arg)
> +             exit(1)
> +@@ -697,6 +709,7 @@ def main(argv):
> +     port = Port('common', sources)
> +
> +     # the per-function stuff
> ++    print("Architecture for wrapper modifiers: %s" % wrapper_arch())
> +     print("Writing functions...")
> +     all_funcs = port.functions()
> +     for name in sorted(all_funcs.keys()):
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
> index ba946ef9c9..4d37bf7942 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -33,9 +33,9 @@ PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback --enable-ep
>   # Compile for the local machine arch...
>   do_compile () {
>   	if [ "${SITEINFO_BITS}" = "64" ]; then
> -	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath
> +	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath --target=${TARGET_SYS}
>   	else
> -	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath
> +	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath --target=${TARGET_SYS}
>   	fi
>   	oe_runmake ${MAKEOPTS}
>   }
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index c0332dc9e2..f8903dbb63 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -3,6 +3,7 @@ require pseudo.inc
>   SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
>              file://fallback-passwd \
>              file://fallback-group \
> +           file://0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch \
>              "
>   SRC_URI:append:class-native = " \
>       http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#250543): https://lists.openembedded.org/g/openembedded-core/message/250543
> Mute This Topic: https://lists.openembedded.org/mt/122330296/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
