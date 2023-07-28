Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727F4EB64DD
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 21:04:29 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.42404.1690578258717396387
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 14:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Dn7mha7e;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0394FF802;
	Fri, 28 Jul 2023 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690578256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K1ZefKWIkk4Tsskkxasmmwc7K61W+brVHf5K4XTPmg4=;
	b=Dn7mha7eWmK3j3ol0SUh8CLOWxy7oN3TJCD/DUCeWroshEi8OztEnoAc3Eox+Efnp1RYnK
	qj8C2pwK8huVIlANyFJX/UW2MaUgMyCGnITajFA1L9JqEDmD5mRA3j4exlF/GVGoTBXWya
	FIHR/14Ka1qD911t7Cu5BqxsD8epWEnbr81dt0hLrm4F4mNrlVxzPYFiHIbCN+DfZMhYvB
	KQPV/4ZJ5MQIB806H31BFa7qgOBDFrMXTLVReqnkxjM7glrrHxWUwAKFcIuCO7FfC4T5uk
	50uzBCigG2DkrzbNBSY2uAkcNopN4eZGijt5ob10d2TXxsOGxfJQ4frT8xnbGQ==
Date: Fri, 28 Jul 2023 23:04:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Ross Burton <Ross.Burton@arm.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] rpm: Allow setting platform macro settings
 externally
Message-ID: <20230728210415b54eca9e@mail.local>
References: <20230727074307.50192-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230727074307.50192-1-zboszor@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 21:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185040

Most of the builds are breaking with:

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/genericx8=
6-alt/build/build/tmp/work/core2-32-poky-linux/rpm/1_4.18.1-r0/temp/log.do_=
install.3923248
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/genericx86-a=
lt/build/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot', '/home=
/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-core/glibc/glibc_=
2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/genericx86-alt/=
build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot'=
, '/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-devtools/=
file/file_5.44.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/gener=
icx86-alt/build/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sys=
root', '/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-devt=
ools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-w=
orker/genericx86-alt/build/meta/recipes-devtools/libtool/libtool-cross_2.4.=
7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/genericx86-alt/bui=
ld/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroo=
t', '/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-devtool=
s/lua/lua_5.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/gene=
ricx86-alt/build/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate=
_sysroot', '/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-=
devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/=
yocto-worker/genericx86-alt/build/meta/recipes-extended/bzip2/bzip2_1.0.8.b=
b:do_populate_sysroot', '/home/pokybuild/yocto-worker/genericx86-alt/build/=
meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot', '/home/pokybuild=
/yocto-worker/genericx86-alt/build/meta/recipes-extended/zstd/zstd_1.5.5.bb=
:do_populate_sysroot', '/home/pokybuild/yocto-worker/genericx86-alt/build/m=
eta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot', '/h=
ome/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-support/popt/p=
opt_1.19.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/genericx86-=
alt/build/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot=
', 'virtual:native:/home/pokybuild/yocto-worker/genericx86-alt/build/meta/r=
ecipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native=
:/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-devtools/au=
toconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybu=
ild/yocto-worker/genericx86-alt/build/meta/recipes-devtools/automake/automa=
ke_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-wo=
rker/genericx86-alt/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_pop=
ulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/genericx86-alt=
/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot=
', 'virtual:native:/home/pokybuild/yocto-worker/genericx86-alt/build/meta/r=
ecipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:=
/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-devtools/pyt=
hon/python3_3.11.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['dbus', 'glibc', 'elfutils'=
, 'file', 'gcc-cross-i686', 'gcc-runtime', 'libtool-cross', 'libtool-native=
', 'lua', 'python3', 'quilt-native', 'bzip2', 'xz', 'zstd', 'libgcrypt', 'p=
opt', 'sqlite3', 'gettext-native', 'autoconf-native', 'automake-native', 'p=
atch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'opkg-=
utils', 'zlib', 'binutils-cross-i686', 'texinfo-dummy-native', 'readline', =
'linux-libc-headers', 'libgcc', 'xz-native', 'libmpc-native', 'gmp-native',=
 'zstd-native', 'mpfr-native', 'flex-native', 'gnu-config-native', 'zlib-na=
tive', 'gettext-minimal-native', 'attr-native', 'base-passwd', 'glib-2.0', =
'libx11', 'base-files', 'shadow-sysroot', 'shadow', 'expat', 'systemd', 'sh=
adow-native', 'libsm', 'm4-native', 'openssl-native', 'libffi-native', 'gdb=
m-native', 'ncurses-native', 'bzip2-native', 'libtirpc-native', 'sqlite3-na=
tive', 'libnsl2-native', 'util-linux-libuuid-native', 'libedit-native', 'ex=
pat-native', 'libffi', 'libxcrypt', 'ncurses', 'libnsl2', 'openssl', 'util-=
linux-libuuid', 'libedit', 'libtirpc', 'gdbm', 'curl', 'libmicrohttpd', 'li=
barchive', 'libgpg-error', 'libcap', 'libpcre2', 'util-linux', 'bash-comple=
tion', 'xtrans', 'xorgproto', 'util-macros', 'libxcb', 'libpam', 'attr', 'k=
mod', 'libseccomp', 'libxkbcommon', 'acl', 'libice', 'perl-native', 'cmake-=
native', 'libidn2', 'gnutls', 'libcap-ng', 'libpthread-stubs', 'libxau', 'l=
ibxdmcp', 'xcb-proto', 'cracklib', 'wayland-protocols', 'libxml2', 'wayland=
', 'xkeyboard-config', 'make-native', 'libunistring', 'libtasn1', 'gmp', 'n=
ettle']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linu=
x', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_install
| /home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32=
-poky-linux/rpm/1_4.18.1-r0/temp/run.do_install.3923248: line 163: export: =
`=3D': not a valid identifier
| WARNING: /home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work=
/core2-32-poky-linux/rpm/1_4.18.1-r0/temp/run.do_install.3923248:163 exit 1=
 from 'export RPM_CUSTOM_ARCH =3D "genericx86"'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/pokybuild/yocto-worker/genericx86-alt/build/build/=
tmp/work/core2-32-poky-linux/rpm/1_4.18.1-r0/temp/run.do_install.3923248, l=
ine 163
| 	#2: main, /home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/wo=
rk/core2-32-poky-linux/rpm/1_4.18.1-r0/temp/run.do_install.3923248, line 220
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Failed

On 27/07/2023 09:43:07+0200, Zoltan Boszormenyi wrote:
> Feed platform settings to installplatform externally. Based on the patch
> submitted under https://github.com/rpm-software-management/rpm/pull/2585
>=20
> Patch against INSTALL was backported for rpm 4.18.1
>=20
> Signed-off-by: Zolt=E1n B=F6sz=F6rm=E9nyi <zboszor@gmail.com>
> ---
>  ...g-platform-macro-settings-externally.patch | 107 ++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  20 ++++
>  2 files changed, 127 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-setting-pl=
atform-macro-settings-externally.patch
>=20
> diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-=
macro-settings-externally.patch b/meta/recipes-devtools/rpm/files/0001-Allo=
w-setting-platform-macro-settings-externally.patch
> new file mode 100644
> index 0000000000..86d357a4e8
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-s=
ettings-externally.patch
> @@ -0,0 +1,107 @@
> +From 12ae0bf5d1540695af0a3499fc88698c48bc20d3 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA=
9nyi?=3D
> + <zboszor@gmail.com>
> +Date: Tue, 25 Jul 2023 10:56:44 +0200
> +Subject: [PATCH] Allow setting platform macro settings externally
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +By default, rpm installs a series of default platforms based on
> +the CPU architecture names in subdirectories called
> +
> +    /usr/lib/platform/<arch>-linux
> +
> +This is enough for regular Linux distributions. However, some
> +distributions may use more specific platform names that refer to
> +particular computer systems, like SBCs or specific CPU tuning when
> +compiling.
> +
> +If the platform subdirectory does not exist in /usr/lib/platform
> +then rpmbuild does not work.
> +
> +Allow creating such custom platform subdirectory with feeding
> +the necessary data using external variables: RPM_CUSTOM_ARCH,
> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
> +and RPM_CUSTOM_CANONCOLOR
> +
> +Signed-off-by: Zolt=E1n B=F6sz=F6rm=E9nyi <zboszor@gmail.com>
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/r=
pm/pull/2585]
> +---
> + INSTALL         | 32 ++++++++++++++++++++++++++++++++
> + installplatform |  9 ++++++++-
> + 2 files changed, 40 insertions(+), 1 deletion(-)
> +
> +diff --git a/INSTALL b/INSTALL
> +index 13d0d8a83..35ad10793 100644
> +--- a/INSTALL
> ++++ b/INSTALL
> +@@ -148,6 +148,38 @@ and then install with:
> +=20
> +     make install
> +=20
> ++By default, rpm installs a series of default platforms based on the CPU
> ++architecture names in subdirectories called
> ++
> ++    /usr/lib/platform/<arch>-linux
> ++
> ++This is enough for regular Linux distributions. However, some distribut=
ions
> ++may use more specific platform names that refer to particular computer
> ++systems, like SBCs or specific CPU tuning when compiling. Examples of s=
uch
> ++platform names are: "genericx86_64", "intel_skylake_64", "raspberrypi_a=
rmv7",
> ++"raspberrypi_armv8", etc.
> ++
> ++If the platform name is put into /etc/rpm/platform, then rpmbuild uses =
it
> ++and the only macros file rpmbuild looks for is
> ++
> ++    /usr/lib/platform/`cat /etc/rpm/platform`-linux/macros
> ++
> ++If this file does not exist, many rpm macros will not have their expect=
ed
> ++values set and e.g. %configure will fail when trying to run rpmbuild.
> ++
> ++To allow creating the macros file for such a custom platform, the shell
> ++variables listed below must be set. If RPM_CUSTOM_ARCH is not set, the =
rest
> ++is ignored.
> ++
> ++    export RPM_CUSTOM_ARCH=3Dgenericx86_64
> ++    export RPM_CUSTOM_ISANAME=3Dx86
> ++    export RPM_CUSTOM_ISABITS=3D64
> ++    export RPM_CUSTOM_CANONARCH=3Dx86_64
> ++    export RPM_CUSTOM_CANONCOLOR=3D0 # to use /usr/lib for %_libdir
> ++    export RPM_CUSTOM_CANONCOLOR=3D3 # to use /usr/lib64 for %_libdir
> ++
> ++    make install # this also installs /usr/lib/platform/genericx86_64-l=
inux/macros
> ++
> + Rpm comes with an automated self-test suite. The test-suite relies heav=
ily
> + on fakechroot (https://github.com/dex4er/fakechroot/) and cannot be exe=
cuted
> + without it. Provided that fakechroot was found during configure,
> +diff --git a/installplatform b/installplatform
> +index a5ad7c5b8..59f57697b 100755
> +--- a/installplatform
> ++++ b/installplatform
> +@@ -11,7 +11,7 @@ VENDOR=3D"${4}"
> + OS=3D"${5}"
> + RPMRC_GNU=3D"${6}"
> +=20
> +-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
> ++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2` ${RPM_CUSTOM=
_ARCH:+custom}; do
> +   RPMRC_OPTFLAGS=3D"`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
> +   RPMRC_OPTFLAGS=3D"`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
> +   case $RPMRC_OPTFLAGS in
> +@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d:=
 -f2`; do
> +   CANONCOLOR=3D
> +   FILTER=3Dcat
> +   case "${ARCH}" in
> ++    custom)
> ++	ARCH=3D$RPM_CUSTOM_ARCH
> ++	ISANAME=3D$RPM_CUSTOM_ISANAME
> ++	ISABITS=3D$RPM_CUSTOM_ISABITS
> ++	CANONARCH=3D$RPM_CUSTOM_CANONARCH
> ++	CANONCOLOR=3D$RPM_CUSTOM_CANONCOLOR
> ++    ;;
> +     sparc64*)=20
> + 	ISANAME=3Dsparc
> + 	ISABITS=3D64
> +--=20
> +2.41.0
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devto=
ols/rpm/rpm_4.18.1.bb
> index 95a9e92f96..97dd843e56 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> @@ -40,6 +40,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/r=
pm;branch=3Drpm-4.18.x;protoc
>             file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.=
patch \
>             file://fix-declaration.patch \
>             file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
> +           file://0001-Allow-setting-platform-macro-settings-externally.=
patch \
>             "
> =20
>  PE =3D "1"
> @@ -128,10 +129,29 @@ do_install:append:class-nativesdk() {
>  	EOF
>  }
> =20
> +def rpm_isaname(d):
> +    import re
> +    arch =3D d.getVar('TARGET_ARCH')
> +    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
> +        return "x86"
> +    # Add more platform tweaks for ISANAME as needed
> +    return arch
> +
> +# Add the custom BSP platform "macros" file
> +do_install:prepend:class-target() {
> +    export RPM_CUSTOM_ARCH =3D "${MACHINE_ARCH}"
> +    export RPM_CUSTOM_ISANAME =3D "${@rpm_isaname(d)}"
> +    export RPM_CUSTOM_ISABITS =3D "${SITEINFO_BITS}"
> +    export RPM_CUSTOM_CANONARCH =3D "${TARGET_ARCH}"
> +    # CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for a=
 64-bit platform
> +    export RPM_CUSTOM_CANONCOLOR =3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'multilib', '3', '0', d)}"
> +}
> +
>  # Rpm's make install creates var/tmp which clashes with base-files packa=
ging
>  do_install:append:class-target() {
>      rm -rf ${D}/var
>  }
> +
>  do_install:append:class-nativesdk() {
>      rm -rf ${D}${SDKPATHNATIVE}/var
>      # Ensure find-debuginfo is located correctly inside SDK
> --=20
> 2.41.0
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184916): https://lists.openembedded.org/g/openembedde=
d-core/message/184916
> Mute This Topic: https://lists.openembedded.org/mt/100386513/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

