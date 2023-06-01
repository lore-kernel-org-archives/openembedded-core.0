Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E3DC77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 13:19:20 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.31351.1685625550703530174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 06:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DLCIAxLH;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-33b3fa03738so3248345ab.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 06:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685625550; x=1688217550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5Tb2lXCl7NCKbhlCA6LC+To/oWEEVWPWlNUFp1PUVg=;
        b=DLCIAxLHiKH7grGc6sCH4YPoiXQxvhWIVBozJ0rI9qgT0agTPZxn9UXfAcvr+VpGgo
         uCcCLKpE6byXwFNM6fwygRrB3s3NDwD5h4DZ0jDnJP3bdFck+/WG8+z28uZUf0jw2Vt8
         pSzsKGuF4an37PsHiX1+RYTplnSJ86NkUbMoW9glJYlDZXZEFIV5vJMhY6eYc8NKJwaY
         ybo5OVYTwxBK34YGdYLrpvAA5DB1Na4aYxxbt2kCMaNCldpgP3IbyOGmZCzmX/DP0lvl
         LfPuIRJkEFspmwY1vDIi3zhlHoiTMDBvDcgEW0JzkuddZiCBmrtj3T1Bg0A/ApDKIYLZ
         n1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685625550; x=1688217550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5Tb2lXCl7NCKbhlCA6LC+To/oWEEVWPWlNUFp1PUVg=;
        b=TU138tHpOOFhyfoA3DmaZLvnO6PpFgIDZw1MpTt32QKkGP63c/pxhgpcYGj37Tub6Y
         DhdW6YWZxEJF73a1QyyP/Ftam4bXStKvJNuUomxqYQYYiEhPTxisZybyCuOWFVDD4NGe
         pWi1QD6iHBSmKDGN151/2Vu/UDuH/9YTD7KhKAP78ZdDbJyZE3ZbR62sYS7RbKLd2mYu
         xEY2l0UFl+EaiwtwZ5cb40W6JfPKrvQo2gYECniM4UxuXmgqBhmSmZAWo9lv1iTmI3fU
         Z3aWPkbsYagPacqj67Xc9YE1XG6W8r42Qvu3Z7PYOBx2gdsb4IdSbe3szzMhQQkZag5Q
         ha+A==
X-Gm-Message-State: AC+VfDztvDYdYkkIj59GMQIDMhHG5yFLcVdU6WzpMYAKkDoobq+fybrd
	mP9S5gtalHtM2apE1q/5cAqTP5icadlfPHBvmMs=
X-Google-Smtp-Source: ACHHUZ6NfTMhXBnAB6qbgRB0H6nmmOsMm29fWurUaVD4CZ1UhpcwNKs9id2a8Mve/DfZ32Rph4Sku3H34XGdxMiJh9k=
X-Received: by 2002:a92:d410:0:b0:33b:c0d8:26af with SMTP id
 q16-20020a92d410000000b0033bc0d826afmr6074939ilm.7.1685625549731; Thu, 01 Jun
 2023 06:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
 <14b5ba3f7ba79aa1cfa5c50f8458596951adcfb1.camel@linuxfoundation.org>
 <CADkTA4OTDrugNWkFYqDXZy7ruZ+6Qd2EGsQUx+JvSnskoHSCyw@mail.gmail.com>
 <a0868afea6ac27274253698a0ee9342dc4bca1fd.camel@linuxfoundation.org>
 <CADkTA4MXVzuQmovAkmNsWhrD9SDeMV_F4RmVSmG-kUa7jUcpRA@mail.gmail.com> <80c5755eabc4e55f4e27a5335a642f74908a1e78.camel@linuxfoundation.org>
In-Reply-To: <80c5755eabc4e55f4e27a5335a642f74908a1e78.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Jun 2023 09:18:58 -0400
Message-ID: <CADkTA4MUoegZm0N087cBqmXaHeqP0nN_B5t9h3FR09FRjQsNsA@mail.gmail.com>
Subject: Re: [PATCH 0/9] kernel/linux-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 13:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182105

On Thu, Jun 1, 2023 at 3:15=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-05-31 at 19:24 -0400, Bruce Ashfield wrote:
> > On Wed, May 31, 2023 at 6:22=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2023-05-31 at 18:18 -0400, Bruce Ashfield wrote:
> > > > On Wed, May 31, 2023 at 6:03=E2=80=AFPM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > Hi Bruce,
> > > > >
> > > > > On Wed, 2023-05-31 at 14:48 -0400, bruce.ashfield@gmail.com wrote=
:
> > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > >
> > > > > > Richard,
> > > > > >
> > > > > > Here's my consolidated queue. I've had some of these in testing=
 for quite
> > > > > > a while, as I didn't want to send them right before release or =
before my
> > > > > > vacation last week.
> > > > > >
> > > > > > Most are -stable updates to 6.1 and finally bumping the -dev re=
cipe to
> > > > > > show that we've been testing 6.4 for quite some time.
> > > > > >
> > > > > > The make-mod-scripts rmwork fix was discussed at lenght on the =
list, and
> > > > > > has been tested by myself and people seeing the issues. But wit=
h all the
> > > > > > races and issues we've seen in that area for years, I'll keep a=
 close eye
> > > > > > out for AB issues.
> > > > > >
> > > > > > I've factored things a bit around enabling PAHOLE, I don't expe=
ct it
> > > > > > to cause issues since it isn't on by default .. but you never k=
now with
> > > > > > these sorts of changes.
> > > > > >
> > > > > > I also have a bump for the refernece BSPs (sent to the appropri=
ate
> > > > > > list shortly) and a documentation commit for the PAHOLE tweaks =
(also
> > > > > > sent to that list shortly, once we agree on the this change).
> > > > >
> > > > > Thanks for the updates!
> > > > >
> > > > > I put these in for testing (along with some other changes) and th=
ere
> > > > > was an issue, probably the same thing showing up but I've not dug=
 into
> > > > > it:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds=
/7159
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds=
/7197
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/104/build=
s/6093/steps/11/logs/stdio
> > > > >
> > > >
> > > > That's odd:
> > > >
> > > > ERROR: core-image-sato-sdk-1.0-r0 do_testimage: File
> > > > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/deploy/=
images/qemux86/core-image-sato-sdk-qemux86.testdata.json
> > > > not found ([Errno 2] No such file or directory:
> > > > '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/deploy=
/images/qemux86/core-image-sato-sdk-qemux86.testdata.json').
> > >
> > > That is the QA test failing due to an earlier failure to build the
> > > image. The earlier failure looks like:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/715=
9/steps/11/logs/stdio
> > >
> > > Log data follows:
> > > > DEBUG: Executing python function extend_recipe_sysroot
> > > > NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/pkgman=
-non-rpm/build/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', =
'/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/bi=
nutils/binutils-cross_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-=
worker/pkgman-non-rpm/build/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_=
populate_sysroot', '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/=
recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokyb=
uild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/quilt/quilt-na=
tive_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/pkgman-non=
-rpm/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_popul=
ate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/b=
uild/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot=
', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/r=
ecipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot', 'virtual:=
native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-core/=
zlib/zlib_1.2.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/y=
octo-worker/pkgman-non-rpm/build/meta/recipes-devtools/bison/bison_3.8.2.bb=
:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-=
non-rpm/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_=
sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build=
/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:=
native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devto=
ols/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/=
pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/pseudo/ps=
eudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-wor=
ker/pkgman-non-rpm/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_=
sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build=
/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot', 'virtual:native=
:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-kernel/kmod=
/kmod_30.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-wor=
ker/pkgman-non-rpm/build/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_=
sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build=
/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot']
> > > > NOTE: Installed into sysroot: ['kern-tools-native', 'util-linux-nat=
ive', 'kmod-native', 'libcap-ng-native', 'libpcre2-native']
> > > > NOTE: Skipping as already exists in sysroot: ['glibc', 'binutils-cr=
oss-i686', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'openssl-native=
', 'zlib-native', 'bison-native', 'elfutils-native', 'patch-native', 'pkgco=
nfig-native', 'pseudo-native', 'bc-native', 'xz-native', 'gmp-native', 'lib=
mpc-native', 'linux-libc-headers', 'libgcc', 'gnu-config-native', 'flex-nat=
ive', 'texinfo-dummy-native', 'libtool-native', 'mpfr-native', 'zstd-native=
', 'perl-native', 'gettext-minimal-native', 'ncurses-native', 'util-linux-l=
ibuuid-native', 'libmicrohttpd-native', 'libarchive-native', 'curl-native',=
 'sqlite3-native', 'readline-native', 'attr-native', 'python3-native', 'm4-=
native', 'gdbm-native', 'make-native', 'gnutls-native', 'libgcrypt-native',=
 'bzip2-native', 'libedit-native', 'libffi-native', 'libtirpc-native', 'exp=
at-native', 'libnsl2-native', 'nettle-native', 'libidn2-native', 'libtasn1-=
native', 'libunistring-native', 'libcap-native', 'libgpg-error-native', 'cm=
ake-native']
> > > > DEBUG: sed -e 's:^[^/]*/:/home/pokybuild/yocto-worker/pkgman-non-rp=
m/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sy=
sroot-native/:g' /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tm=
p/sysroots-components/x86_64/libpcre2-native/fixmepath | xargs sed -i -e 's=
:FIXMESTAGINGDIRTARGET:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/bu=
ild/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot:g; s=
:FIXMESTAGINGDIRHOST:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/buil=
d/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native=
:g' -e 's:FIXME_PSEUDO_SYSROOT:/home/pokybuild/yocto-worker/pkgman-non-rpm/=
build/build/tmp/sysroots-components/x86_64/pseudo-native:g' -e 's:FIXME_HOS=
TTOOLS_DIR:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/host=
tools:g' -e 's:FIXME_PKGDATA_DIR:/home/pokybuild/yocto-worker/pkgman-non-rp=
m/build/build/tmp/pkgdata/qemux86:g' -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home=
/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-li=
nux/make-mod-scripts/1.0-r0/pseudo/:g' -e 's:FIXME_LOGFIFO:/home/pokybuild/=
yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mo=
d-scripts/1.0-r0/temp/fifo.169218:g'
> > > > DEBUG: Python function extend_recipe_sysroot finished
> > > > DEBUG: Executing shell function do_configure
> > > > NOTE: make HOSTCC=3Dgcc  -isystem/home/pokybuild/yocto-worker/pkgma=
n-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/r=
ecipe-sysroot-native/usr/include -O2 -pipe -L/home/pokybuild/yocto-worker/p=
kgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-=
r0/recipe-sysroot-native/usr/lib                         -L/home/pokybuild/=
yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mo=
d-scripts/1.0-r0/recipe-sysroot-native/lib                         -Wl,--en=
able-new-dtags                         -Wl,-rpath-link,/home/pokybuild/yoct=
o-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-sc=
ripts/1.0-r0/recipe-sysroot-native/usr/lib                         -Wl,-rpa=
th-link,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qe=
mux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib         =
                -Wl,-rpath,/home/pokybuild/yocto-worker/pkgman-non-rpm/buil=
d/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-=
native/usr/lib                         -Wl,-rpath,/home/pokybuild/yocto-wor=
ker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts=
/1.0-r0/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--all=
ow-shlib-undefined -Wl,--dynamic-linker=3D/home/pokybuild/yocto-worker/pkgm=
an-non-rpm/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86=
-64.so.2 -static HOSTCPP=3Dgcc  -E HOSTCXX=3Dg++  -isystem/home/pokybuild/y=
octo-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod=
-scripts/1.0-r0/recipe-sysroot-native/usr/include -O2 -pipe -L/home/pokybui=
ld/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make=
-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib                         -=
L/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-p=
oky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib                =
         -Wl,--enable-new-dtags                         -Wl,-rpath-link,/ho=
me/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-=
linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib                =
         -Wl,-rpath-link,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/=
build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-na=
tive/lib                         -Wl,-rpath,/home/pokybuild/yocto-worker/pk=
gman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r=
0/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/home/po=
kybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux=
/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib                         =
-Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/home/pokybuild/=
yocto-worker/pkgman-non-rpm/build/build/tmp/sysroots-uninative/x86_64-linux=
/lib/ld-linux-x86-64.so.2 -static CROSS_COMPILE=3Di686-poky-linux- CC=3Di68=
6-poky-linux-gcc  -fuse-ld=3Dbfd -fcanon-prefix-map  -fmacro-prefix-map=3D/=
home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-pok=
y-linux/make-mod-scripts/1.0-r0=3D/usr/src/debug/make-mod-scripts/1.0-r0  -=
fdebug-prefix-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build=
/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0=3D/usr/src/debug/make-=
mod-scripts/1.0-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/pkgma=
n-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0=
=3D/usr/src/debug/make-mod-scripts/1.0-r0  -fdebug-prefix-map=3D/home/pokyb=
uild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/ma=
ke-mod-scripts/1.0-r0=3D/usr/src/debug/make-mod-scripts/1.0-r0  -fdebug-pre=
fix-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/=
qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=3D  -fmacro-prefi=
x-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qe=
mux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=3D  -fdebug-prefix-=
map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemu=
x86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native=3D  -fdebug-pr=
efix-map=3D/home/pokybui
> > > d/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/ker=
nel-source=3D/usr/src/kernel -fdebug-prefix-map=3D/home/pokybuild/yocto-wor=
ker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-build-artifac=
ts=3D/usr/src/kernel LD=3Di686-poky-linux-ld.bfd  AR=3Di686-poky-linux-ar  =
OBJCOPY=3Di686-poky-linux-objcopy  HOSTPKG_CONFIG=3Dpkg-config --static CRY=
PTO_LIBS=3D-L/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/wo=
rk/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib=
/pkgconfig/../../../usr/lib -lcrypto -ldl -pthread -C /home/pokybuild/yocto=
-worker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-source O=
=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared/=
qemux86/kernel-build-artifacts prepare
> > > > make: Entering directory '/home/pokybuild/yocto-worker/pkgman-non-r=
pm/build/build/tmp/work-shared/qemux86/kernel-source'
> > > >   SYNC    include/config/auto.conf
> > > >   GEN     Makefile
> > > >   HOSTCC  scripts/basic/fixdep
> > > > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/hosttoo=
ls/ld: cannot find -lc
> > > > collect2: error: ld returned 1 exit status
> > > > make[3]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/bui=
ld/tmp/work-shared/qemux86/kernel-source/scripts/Makefile.host:111: scripts=
/basic/fixdep] Error 1
> > > > make[2]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/bui=
ld/tmp/work-shared/qemux86/kernel-source/Makefile:640: scripts_basic] Error=
 2
> > > > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work-sh=
ared/qemux86/kernel-source/Makefile:748: include/config/auto.conf: No such =
file or directory
> > > > make[1]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build/bui=
ld/tmp/work-shared/qemux86/kernel-source/Makefile:805: include/config/auto.=
conf] Error 2
> > > > make[1]: *** [include/config/auto.conf] Deleting file 'include/gene=
rated/rustc_cfg'
> > > > make[1]: *** [include/config/auto.conf] Deleting file 'include/gene=
rated/autoconf.h'
> > > > make: *** [Makefile:238: __sub-make] Error 2
> > > > make: Leaving directory '/home/pokybuild/yocto-worker/pkgman-non-rp=
m/build/build/tmp/work-shared/qemux86/kernel-source'
> > > > ERROR: oe_runmake failed
> > > > WARNING: /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tm=
p/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure.169=
218:195 exit 1 from 'exit 1'
> > > > WARNING: Backtrace (BB generated script):
> > > >       #1: bbfatal_log, /home/pokybuild/yocto-worker/pkgman-non-rpm/=
build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do=
_configure.169218, line 195
> > > >       #2: die, /home/pokybuild/yocto-worker/pkgman-non-rpm/build/bu=
ild/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configu=
re.169218, line 179
> > > >       #3: oe_runmake, /home/pokybuild/yocto-worker/pkgman-non-rpm/b=
uild/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_=
configure.169218, line 174
> > > >       #4: do_configure, /home/pokybuild/yocto-worker/pkgman-non-rpm=
/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.d=
o_configure.169218, line 164
> > > >       #5: main, /home/pokybuild/yocto-worker/pkgman-non-rpm/build/b=
uild/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_config=
ure.169218, line 208
> > > NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Failed
> > >
> > > > It shouldn't be the kernel updates, so I'm assuming something with
> > > > make-mod-scripts. I'll have a look at it on Thursday.
> > >
> > > Yes, it is make-mod-scripts, maybe missing static libraries?
> >
> > I was able to build qemux86 on my ubuntu builder, and from the message
> > it is looking for -lc and not finding it.
> >
> > It looks like that was alma linux, so no static c library ?
> >
> > I don't have access to anything alma based to test, but I guess a
> > dependency on a static native glibc might help ?
>
> If I understand what is being attempted here, what is being asked for
> is a static library from the distro the build is running on. We don't
> build a native glibc (or gcc).
>
> It is easy to say "just tell people to install that" but it isn't quite
> that simple. The work needed off the top of my head is roughly:
>
> * add sanity tests to check it is present and error if not
> * documentation updates to tell people to install it
> * updating all the autobuilder workers to have it
> * update buildtools tarball to contain it
> * release a new buildtools
> * ensure everything in automated testing uses the new buildtools
> release
>
> so I do have to ask if we really need to add this dependency?
>

If we want to try and fix the rm_work issues with the output of
make-mod-scripts via statically linked tools, then I don't see another
way to do it. Distros that have a static libc don't have the issue of
course.

If we can't get the static linking working across kernel versions and
host distros, then we are into the rpathLDPATH or other ideas that
were floated in the original discussion to save the dynamic libraries
to the kernel build artifacts directory and then have the scripts be
able to locate them at runtime.

I do find it strange that -lc isn't being found though, because that
implies that no one ever does static linking on alma linux .. and that
doesn't make sense, so maybe there's something else going on that I'm
missing.

Bruce

> Cheers,
>
> Richard
>
>
>
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

