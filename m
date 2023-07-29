Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A567EC001DC
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 04:42:51 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.48466.1690605768079857852
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 21:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BYZKC+np;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6b9b89627c3so2295817a34.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 21:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690605767; x=1691210567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fX89LmfoZlQGWW9Viwxz4TAWlj8zAqUneZhfl7uOOXs=;
        b=BYZKC+npF0ITx49QRX45s4m/R8V5kuvDIbjOA0rmbphcq2UILoqm5kmnfVcp0Jbhmt
         Nf/CICKHi3GbMyZiywgbCwh3EYCex6BtrjGjbyT9M5M65sETGi5gHOWligMTvMueIl6E
         r322UJBUirsCh2iatpQqirgIuyJhVUorq8vr88V8jR5EiYYg/3hiXWkLZRtSIlCqUSbO
         qXZvZhIn77ZhCBKQ7MoczP9kadGif7B968hS+h4lT/gBduJNsphhcbGncWHUVDpIJ6wC
         UfGe3pNgQkGLL/ekm4mfPlw2Sao27ZqYORoj9CD30Yo1v5gdQhyoPWlhrRYlqHgvkbv4
         ZXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690605767; x=1691210567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fX89LmfoZlQGWW9Viwxz4TAWlj8zAqUneZhfl7uOOXs=;
        b=Q07KG+2SewRIG/ft0/lJZjR+B0sh8AUZQdWTWt4vaQKhekjwmqDWjIgFQCQK3bPX3R
         7gf1xTxhGHt6K2s6VQmerswR64/7etHTUpsowlDOYmSg4ccuKGR73RRO5hSKqtZt5Ok5
         1nlkfa+ao0xisz3TqzlKUO4xDwrM1DWWIoXIAQAyEKIH7uNzEmMaDwjjcZhu3RwLoclG
         dYl9OuiA++aTV0128cG/KKgpKvMRqBrk9R58nrEKMcmdSzKeRrWem4X0EOICoRcQOhPU
         i25efZNYn3jRsnCzrOEIbA5z6xJ6N1P6B/tj8xTYzv3edQcRp9m42tErKZ6PQA2j3/4D
         GRpg==
X-Gm-Message-State: ABy/qLYRG3HxRUn8RWsdzZgdFhTg8FEff6+QQe/P1jjA66r1jBzsm7UO
	WBn0+77V3d53kLp8HSeuMZ/gxsjmL57pvQBcksU=
X-Google-Smtp-Source: APBJJlHGhHzBDl55tWHAZrz/+jXA03SYGgjGXrPz/eE4PsS8/2t3uIb2pZul2lVfxyPvnu1lpBMnoYpzmrwooWtlV1U=
X-Received: by 2002:a05:6808:f14:b0:3a4:947:c97b with SMTP id
 m20-20020a0568080f1400b003a40947c97bmr6223211oiw.0.1690605766986; Fri, 28 Jul
 2023 21:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230727074307.50192-1-zboszor@gmail.com> <20230728210415b54eca9e@mail.local>
In-Reply-To: <20230728210415b54eca9e@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2023 21:42:20 -0700
Message-ID: <CAMKF1sopgV8oPytoZ1pVx=zQp+aWKbvubxRuhj18u9a0-SG6fQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] rpm: Allow setting platform macro settings externally
To: alexandre.belloni@bootlin.com
Cc: Zoltan Boszormenyi <zboszor@gmail.com>, openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 04:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185044

On Fri, Jul 28, 2023 at 2:04=E2=80=AFPM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Most of the builds are breaking with:
>
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/generic=
x86-alt/build/build/tmp/work/core2-32-poky-linux/rpm/1_4.18.1-r0/temp/log.d=
o_install.3923248
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/genericx86=
-alt/build/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot', '/ho=
me/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-core/glibc/glib=
c_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/genericx86-al=
t/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroo=
t', '/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-devtool=
s/file/file_5.44.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/gen=
ericx86-alt/build/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_s=
ysroot', '/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-de=
vtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto=
-worker/genericx86-alt/build/meta/recipes-devtools/libtool/libtool-cross_2.=
4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/genericx86-alt/b=
uild/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysr=
oot', '/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-devto=
ols/lua/lua_5.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/ge=
nericx86-alt/build/meta/recipes-devtools/python/python3_3.11.4.bb:do_popula=
te_sysroot', '/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipe=
s-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuil=
d/yocto-worker/genericx86-alt/build/meta/recipes-extended/bzip2/bzip2_1.0.8=
.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/genericx86-alt/buil=
d/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot', '/home/pokybui=
ld/yocto-worker/genericx86-alt/build/meta/recipes-extended/zstd/zstd_1.5.5.=
bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/genericx86-alt/build=
/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot', '=
/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-support/popt=
/popt_1.19.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/genericx8=
6-alt/build/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysro=
ot', 'virtual:native:/home/pokybuild/yocto-worker/genericx86-alt/build/meta=
/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:nati=
ve:/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-devtools/=
autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/poky=
build/yocto-worker/genericx86-alt/build/meta/recipes-devtools/automake/auto=
make_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-=
worker/genericx86-alt/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_p=
opulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/genericx86-a=
lt/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysro=
ot', 'virtual:native:/home/pokybuild/yocto-worker/genericx86-alt/build/meta=
/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:nativ=
e:/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-devtools/p=
ython/python3_3.11.4.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['dbus', 'glibc', 'elfutil=
s', 'file', 'gcc-cross-i686', 'gcc-runtime', 'libtool-cross', 'libtool-nati=
ve', 'lua', 'python3', 'quilt-native', 'bzip2', 'xz', 'zstd', 'libgcrypt', =
'popt', 'sqlite3', 'gettext-native', 'autoconf-native', 'automake-native', =
'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'opk=
g-utils', 'zlib', 'binutils-cross-i686', 'texinfo-dummy-native', 'readline'=
, 'linux-libc-headers', 'libgcc', 'xz-native', 'libmpc-native', 'gmp-native=
', 'zstd-native', 'mpfr-native', 'flex-native', 'gnu-config-native', 'zlib-=
native', 'gettext-minimal-native', 'attr-native', 'base-passwd', 'glib-2.0'=
, 'libx11', 'base-files', 'shadow-sysroot', 'shadow', 'expat', 'systemd', '=
shadow-native', 'libsm', 'm4-native', 'openssl-native', 'libffi-native', 'g=
dbm-native', 'ncurses-native', 'bzip2-native', 'libtirpc-native', 'sqlite3-=
native', 'libnsl2-native', 'util-linux-libuuid-native', 'libedit-native', '=
expat-native', 'libffi', 'libxcrypt', 'ncurses', 'libnsl2', 'openssl', 'uti=
l-linux-libuuid', 'libedit', 'libtirpc', 'gdbm', 'curl', 'libmicrohttpd', '=
libarchive', 'libgpg-error', 'libcap', 'libpcre2', 'util-linux', 'bash-comp=
letion', 'xtrans', 'xorgproto', 'util-macros', 'libxcb', 'libpam', 'attr', =
'kmod', 'libseccomp', 'libxkbcommon', 'acl', 'libice', 'perl-native', 'cmak=
e-native', 'libidn2', 'gnutls', 'libcap-ng', 'libpthread-stubs', 'libxau', =
'libxdmcp', 'xcb-proto', 'cracklib', 'wayland-protocols', 'libxml2', 'wayla=
nd', 'xkeyboard-config', 'make-native', 'libunistring', 'libtasn1', 'gmp', =
'nettle']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing python function autotools_aclocals
> | DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-li=
nux', 'common-glibc', 'i686-linux', 'common']
> | DEBUG: Python function autotools_aclocals finished
> | DEBUG: Executing shell function do_install
> | /home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-=
32-poky-linux/rpm/1_4.18.1-r0/temp/run.do_install.3923248: line 163: export=
: `=3D': not a valid identifier
> | WARNING: /home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/wo=
rk/core2-32-poky-linux/rpm/1_4.18.1-r0/temp/run.do_install.3923248:163 exit=
 1 from 'export RPM_CUSTOM_ARCH =3D "genericx86"'
> | WARNING: Backtrace (BB generated script):
> |       #1: do_install, /home/pokybuild/yocto-worker/genericx86-alt/build=
/build/tmp/work/core2-32-poky-linux/rpm/1_4.18.1-r0/temp/run.do_install.392=
3248, line 163
> |       #2: main, /home/pokybuild/yocto-worker/genericx86-alt/build/build=
/tmp/work/core2-32-poky-linux/rpm/1_4.18.1-r0/temp/run.do_install.3923248, =
line 220
> NOTE: recipe rpm-1_4.18.1-r0: task do_install: Failed
>

The reason is that the syntax for specifying exports in shell have
spurious spaces

do_install() {
    export RPM_CUSTOM_ARCH =3D "qemux86_64"
    export RPM_CUSTOM_ISANAME =3D "x86"
    export RPM_CUSTOM_ISABITS =3D "64"
    export RPM_CUSTOM_CANONARCH =3D "x86_64"
    # CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for
a 64-bit platform
    export RPM_CUSTOM_CANONCOLOR =3D "0"
........


See the space before and after '=3D' assignment operator.


> On 27/07/2023 09:43:07+0200, Zoltan Boszormenyi wrote:
> > Feed platform settings to installplatform externally. Based on the patc=
h
> > submitted under https://github.com/rpm-software-management/rpm/pull/258=
5
> >
> > Patch against INSTALL was backported for rpm 4.18.1
> >
> > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.co=
m>
> > ---
> >  ...g-platform-macro-settings-externally.patch | 107 ++++++++++++++++++
> >  meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  20 ++++
> >  2 files changed, 127 insertions(+)
> >  create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-setting-=
platform-macro-settings-externally.patch
> >
> > diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-platfor=
m-macro-settings-externally.patch b/meta/recipes-devtools/rpm/files/0001-Al=
low-setting-platform-macro-settings-externally.patch
> > new file mode 100644
> > index 0000000000..86d357a4e8
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro=
-settings-externally.patch
> > @@ -0,0 +1,107 @@
> > +From 12ae0bf5d1540695af0a3499fc88698c48bc20d3 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=
=3DA9nyi?=3D
> > + <zboszor@gmail.com>
> > +Date: Tue, 25 Jul 2023 10:56:44 +0200
> > +Subject: [PATCH] Allow setting platform macro settings externally
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +By default, rpm installs a series of default platforms based on
> > +the CPU architecture names in subdirectories called
> > +
> > +    /usr/lib/platform/<arch>-linux
> > +
> > +This is enough for regular Linux distributions. However, some
> > +distributions may use more specific platform names that refer to
> > +particular computer systems, like SBCs or specific CPU tuning when
> > +compiling.
> > +
> > +If the platform subdirectory does not exist in /usr/lib/platform
> > +then rpmbuild does not work.
> > +
> > +Allow creating such custom platform subdirectory with feeding
> > +the necessary data using external variables: RPM_CUSTOM_ARCH,
> > +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
> > +and RPM_CUSTOM_CANONCOLOR
> > +
> > +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> > +Upstream-Status: Submitted [https://github.com/rpm-software-management=
/rpm/pull/2585]
> > +---
> > + INSTALL         | 32 ++++++++++++++++++++++++++++++++
> > + installplatform |  9 ++++++++-
> > + 2 files changed, 40 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/INSTALL b/INSTALL
> > +index 13d0d8a83..35ad10793 100644
> > +--- a/INSTALL
> > ++++ b/INSTALL
> > +@@ -148,6 +148,38 @@ and then install with:
> > +
> > +     make install
> > +
> > ++By default, rpm installs a series of default platforms based on the C=
PU
> > ++architecture names in subdirectories called
> > ++
> > ++    /usr/lib/platform/<arch>-linux
> > ++
> > ++This is enough for regular Linux distributions. However, some distrib=
utions
> > ++may use more specific platform names that refer to particular compute=
r
> > ++systems, like SBCs or specific CPU tuning when compiling. Examples of=
 such
> > ++platform names are: "genericx86_64", "intel_skylake_64", "raspberrypi=
_armv7",
> > ++"raspberrypi_armv8", etc.
> > ++
> > ++If the platform name is put into /etc/rpm/platform, then rpmbuild use=
s it
> > ++and the only macros file rpmbuild looks for is
> > ++
> > ++    /usr/lib/platform/`cat /etc/rpm/platform`-linux/macros
> > ++
> > ++If this file does not exist, many rpm macros will not have their expe=
cted
> > ++values set and e.g. %configure will fail when trying to run rpmbuild.
> > ++
> > ++To allow creating the macros file for such a custom platform, the she=
ll
> > ++variables listed below must be set. If RPM_CUSTOM_ARCH is not set, th=
e rest
> > ++is ignored.
> > ++
> > ++    export RPM_CUSTOM_ARCH=3Dgenericx86_64
> > ++    export RPM_CUSTOM_ISANAME=3Dx86
> > ++    export RPM_CUSTOM_ISABITS=3D64
> > ++    export RPM_CUSTOM_CANONARCH=3Dx86_64
> > ++    export RPM_CUSTOM_CANONCOLOR=3D0 # to use /usr/lib for %_libdir
> > ++    export RPM_CUSTOM_CANONCOLOR=3D3 # to use /usr/lib64 for %_libdir
> > ++
> > ++    make install # this also installs /usr/lib/platform/genericx86_64=
-linux/macros
> > ++
> > + Rpm comes with an automated self-test suite. The test-suite relies he=
avily
> > + on fakechroot (https://github.com/dex4er/fakechroot/) and cannot be e=
xecuted
> > + without it. Provided that fakechroot was found during configure,
> > +diff --git a/installplatform b/installplatform
> > +index a5ad7c5b8..59f57697b 100755
> > +--- a/installplatform
> > ++++ b/installplatform
> > +@@ -11,7 +11,7 @@ VENDOR=3D"${4}"
> > + OS=3D"${5}"
> > + RPMRC_GNU=3D"${6}"
> > +
> > +-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
> > ++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2` ${RPM_CUST=
OM_ARCH:+custom}; do
> > +   RPMRC_OPTFLAGS=3D"`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
> > +   RPMRC_OPTFLAGS=3D"`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
> > +   case $RPMRC_OPTFLAGS in
> > +@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut -=
d: -f2`; do
> > +   CANONCOLOR=3D
> > +   FILTER=3Dcat
> > +   case "${ARCH}" in
> > ++    custom)
> > ++    ARCH=3D$RPM_CUSTOM_ARCH
> > ++    ISANAME=3D$RPM_CUSTOM_ISANAME
> > ++    ISABITS=3D$RPM_CUSTOM_ISABITS
> > ++    CANONARCH=3D$RPM_CUSTOM_CANONARCH
> > ++    CANONCOLOR=3D$RPM_CUSTOM_CANONCOLOR
> > ++    ;;
> > +     sparc64*)
> > +     ISANAME=3Dsparc
> > +     ISABITS=3D64
> > +--
> > +2.41.0
> > +
> > diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-dev=
tools/rpm/rpm_4.18.1.bb
> > index 95a9e92f96..97dd843e56 100644
> > --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> > +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> > @@ -40,6 +40,7 @@ SRC_URI =3D "git://github.com/rpm-software-management=
/rpm;branch=3Drpm-4.18.x;protoc
> >             file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_has=
h.patch \
> >             file://fix-declaration.patch \
> >             file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
> > +           file://0001-Allow-setting-platform-macro-settings-externall=
y.patch \
> >             "
> >
> >  PE =3D "1"
> > @@ -128,10 +129,29 @@ do_install:append:class-nativesdk() {
> >       EOF
> >  }
> >
> > +def rpm_isaname(d):
> > +    import re
> > +    arch =3D d.getVar('TARGET_ARCH')
> > +    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
> > +        return "x86"
> > +    # Add more platform tweaks for ISANAME as needed
> > +    return arch
> > +
> > +# Add the custom BSP platform "macros" file
> > +do_install:prepend:class-target() {
> > +    export RPM_CUSTOM_ARCH =3D "${MACHINE_ARCH}"
> > +    export RPM_CUSTOM_ISANAME =3D "${@rpm_isaname(d)}"
> > +    export RPM_CUSTOM_ISABITS =3D "${SITEINFO_BITS}"
> > +    export RPM_CUSTOM_CANONARCH =3D "${TARGET_ARCH}"
> > +    # CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for=
 a 64-bit platform
> > +    export RPM_CUSTOM_CANONCOLOR =3D "${@bb.utils.contains('DISTRO_FEA=
TURES', 'multilib', '3', '0', d)}"
> > +}
> > +
> >  # Rpm's make install creates var/tmp which clashes with base-files pac=
kaging
> >  do_install:append:class-target() {
> >      rm -rf ${D}/var
> >  }
> > +
> >  do_install:append:class-nativesdk() {
> >      rm -rf ${D}${SDKPATHNATIVE}/var
> >      # Ensure find-debuginfo is located correctly inside SDK
> > --
> > 2.41.0
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185040): https://lists.openembedded.org/g/openembedde=
d-core/message/185040
> Mute This Topic: https://lists.openembedded.org/mt/100386513/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

