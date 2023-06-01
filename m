Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E028AC77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 13:50:30 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.32111.1685627430086257336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 06:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ckh+EghZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-77493b3d18cso44167939f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 06:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685627429; x=1688219429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sz9qdcBuHvtKlZRV1c2bgqTFJTbQp3rx62ar7I3ma8Q=;
        b=Ckh+EghZ2kNDi3hB9t09bCUWdYsDkFUQxY75FvXXNUErCYfiQlxDkZP5rdRLasY3Yc
         dgJD+VSnvkmSPnJjl2xtSA1U2Bg4UDU1OzILPeVVsjqKcJ+qBwdvk6EDTcJXfPq+XLAv
         1EvAXIghj8yxf6YFE0AHo00U5CYVq4NjIqYpNGbj48w3lq+eRPtzEHwlkU4q3ri9bQ+G
         LVH9YxiolQUjq5za4mxInf7STeCKisZ6bTvzBQ/LErmmuOAsKarhsY21dT7dkfUTRvfA
         I6bMUTGFvipN3XhW4s44IolZwzPJfZ+UBiUkfgYlssS4JboGyoV4jtvYYzy4e/CPrC0/
         KMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685627429; x=1688219429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sz9qdcBuHvtKlZRV1c2bgqTFJTbQp3rx62ar7I3ma8Q=;
        b=EcZ454FbsN56e2nmzq7AvqDFjwnB6fyWi0HR2Uq/fG22lEcXnxpG3KmABi/U/VHO6Z
         PewbYOj8D6y3sWfvxg2DXPsYcJtYqIqsv3XAVr0BXUlKWwyy9VVUXr+PsixpvOBKqM7k
         WtAc7+rkjwjCEraoX6F0/wj3Ga/7juaQw5fM5IYDPNjsnSVaWd9CtUxVuZMLl15tJmo0
         qdj6hUCCLZNnkz1fhvVUeEHr2ZtN7LsvaBeh0faV0QGcd1bJ8/LJ8+EY2URdFHs/zP9n
         zhjVYmNVcjv3Bct5/bO9VOKfK29GmoRNMz3mopwTjd6bc97mWmhHDtCqmIx5bnIGb9LZ
         v4Rw==
X-Gm-Message-State: AC+VfDyq8JU6MVB18BGuLN0HVBaGvTVnthsnjjYQAwzhAgFBP+hlyB6q
	NOGeex7Js0XQnufaowN1EKqxpu8gMIWg1FB+0JvoAakuFNA=
X-Google-Smtp-Source: ACHHUZ5dz1AdQwyhMVMPqvFM+GCf73qDd2gD4wTNo4vZ3Lv1408xOvXt3ov46uVHu9xSjHkmyt/4FI1sUV2Bc5gEzIU=
X-Received: by 2002:a6b:6d0a:0:b0:760:3b22:9d0 with SMTP id
 a10-20020a6b6d0a000000b007603b2209d0mr9195667iod.19.1685627429065; Thu, 01
 Jun 2023 06:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
 <14b5ba3f7ba79aa1cfa5c50f8458596951adcfb1.camel@linuxfoundation.org>
 <CADkTA4OTDrugNWkFYqDXZy7ruZ+6Qd2EGsQUx+JvSnskoHSCyw@mail.gmail.com>
 <a0868afea6ac27274253698a0ee9342dc4bca1fd.camel@linuxfoundation.org>
 <CADkTA4MXVzuQmovAkmNsWhrD9SDeMV_F4RmVSmG-kUa7jUcpRA@mail.gmail.com>
 <80c5755eabc4e55f4e27a5335a642f74908a1e78.camel@linuxfoundation.org>
 <CADkTA4MUoegZm0N087cBqmXaHeqP0nN_B5t9h3FR09FRjQsNsA@mail.gmail.com> <bc01062444278af3f207fbf22e126c70af3b4b0a.camel@linuxfoundation.org>
In-Reply-To: <bc01062444278af3f207fbf22e126c70af3b4b0a.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Jun 2023 09:50:17 -0400
Message-ID: <CADkTA4OOTfhk_duixi001QnUFm1Qq+yGW-y91Fn9KZKNik2QfA@mail.gmail.com>
Subject: Re: [PATCH 0/9] kernel/linux-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 13:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182110

On Thu, Jun 1, 2023 at 9:42=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-06-01 at 09:18 -0400, Bruce Ashfield wrote:
> > On Thu, Jun 1, 2023 at 3:15=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2023-05-31 at 19:24 -0400, Bruce Ashfield wrote:
> > > > On Wed, May 31, 2023 at 6:22=E2=80=AFPM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Wed, 2023-05-31 at 18:18 -0400, Bruce Ashfield wrote:
> > > > > > On Wed, May 31, 2023 at 6:03=E2=80=AFPM Richard Purdie
> > > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > >
> > > > > > > Hi Bruce,
> > > > > > >
> > > > > > > On Wed, 2023-05-31 at 14:48 -0400, bruce.ashfield@gmail.com w=
rote:
> > > > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > > >
> > > > > > > > Richard,
> > > > > > > >
> > > > > > > > Here's my consolidated queue. I've had some of these in tes=
ting for quite
> > > > > > > > a while, as I didn't want to send them right before release=
 or before my
> > > > > > > > vacation last week.
> > > > > > > >
> > > > > > > > Most are -stable updates to 6.1 and finally bumping the -de=
v recipe to
> > > > > > > > show that we've been testing 6.4 for quite some time.
> > > > > > > >
> > > > > > > > The make-mod-scripts rmwork fix was discussed at lenght on =
the list, and
> > > > > > > > has been tested by myself and people seeing the issues. But=
 with all the
> > > > > > > > races and issues we've seen in that area for years, I'll ke=
ep a close eye
> > > > > > > > out for AB issues.
> > > > > > > >
> > > > > > > > I've factored things a bit around enabling PAHOLE, I don't =
expect it
> > > > > > > > to cause issues since it isn't on by default .. but you nev=
er know with
> > > > > > > > these sorts of changes.
> > > > > > > >
> > > > > > > > I also have a bump for the refernece BSPs (sent to the appr=
opriate
> > > > > > > > list shortly) and a documentation commit for the PAHOLE twe=
aks (also
> > > > > > > > sent to that list shortly, once we agree on the this change=
).
> > > > > > >
> > > > > > > Thanks for the updates!
> > > > > > >
> > > > > > > I put these in for testing (along with some other changes) an=
d there
> > > > > > > was an issue, probably the same thing showing up but I've not=
 dug into
> > > > > > > it:
> > > > > > >
> > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/bu=
ilds/7159
> > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/bu=
ilds/7197
> > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/104/b=
uilds/6093/steps/11/logs/stdio
> > > > > > >
> > > > > >
> > > > > > That's odd:
> > > > > >
> > > > > > ERROR: core-image-sato-sdk-1.0-r0 do_testimage: File
> > > > > > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/dep=
loy/images/qemux86/core-image-sato-sdk-qemux86.testdata.json
> > > > > > not found ([Errno 2] No such file or directory:
> > > > > > '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/de=
ploy/images/qemux86/core-image-sato-sdk-qemux86.testdata.json').
> > > > >
> > > > > That is the QA test failing due to an earlier failure to build th=
e
> > > > > image. The earlier failure looks like:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds=
/7159/steps/11/logs/stdio
> > > > >
> > > > > Log data follows:
> > > > > > DEBUG: Executing python function extend_recipe_sysroot
> > > > > > NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/pk=
gman-non-rpm/build/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroo=
t', '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtool=
s/binutils/binutils-cross_2.40.bb:do_populate_sysroot', '/home/pokybuild/yo=
cto-worker/pkgman-non-rpm/build/meta/recipes-devtools/gcc/gcc-cross_13.1.bb=
:do_populate_sysroot', '/home/pokybuild/yocto-worker/pkgman-non-rpm/build/m=
eta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/p=
okybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/quilt/quil=
t-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/pkgman=
-non-rpm/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_p=
opulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-r=
pm/build/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sys=
root', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/me=
ta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot', 'virt=
ual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-c=
ore/zlib/zlib_1.2.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybui=
ld/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/bison/bison_3.8.=
2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkg=
man-non-rpm/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_popul=
ate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/b=
uild/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virt=
ual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-d=
evtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/h=
ome/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-devtools/pseud=
o/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto=
-worker/pkgman-non-rpm/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_popul=
ate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/b=
uild/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot', 'virtual:na=
tive:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/meta/recipes-kernel/=
kmod/kmod_30.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto=
-worker/pkgman-non-rpm/build/meta/recipes-support/gmp/gmp_6.2.1.bb:do_popul=
ate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/pkgman-non-rpm/b=
uild/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot']
> > > > > > NOTE: Installed into sysroot: ['kern-tools-native', 'util-linux=
-native', 'kmod-native', 'libcap-ng-native', 'libpcre2-native']
> > > > > > NOTE: Skipping as already exists in sysroot: ['glibc', 'binutil=
s-cross-i686', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'openssl-na=
tive', 'zlib-native', 'bison-native', 'elfutils-native', 'patch-native', 'p=
kgconfig-native', 'pseudo-native', 'bc-native', 'xz-native', 'gmp-native', =
'libmpc-native', 'linux-libc-headers', 'libgcc', 'gnu-config-native', 'flex=
-native', 'texinfo-dummy-native', 'libtool-native', 'mpfr-native', 'zstd-na=
tive', 'perl-native', 'gettext-minimal-native', 'ncurses-native', 'util-lin=
ux-libuuid-native', 'libmicrohttpd-native', 'libarchive-native', 'curl-nati=
ve', 'sqlite3-native', 'readline-native', 'attr-native', 'python3-native', =
'm4-native', 'gdbm-native', 'make-native', 'gnutls-native', 'libgcrypt-nati=
ve', 'bzip2-native', 'libedit-native', 'libffi-native', 'libtirpc-native', =
'expat-native', 'libnsl2-native', 'nettle-native', 'libidn2-native', 'libta=
sn1-native', 'libunistring-native', 'libcap-native', 'libgpg-error-native',=
 'cmake-native']
> > > > > > DEBUG: sed -e 's:^[^/]*/:/home/pokybuild/yocto-worker/pkgman-no=
n-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recip=
e-sysroot-native/:g' /home/pokybuild/yocto-worker/pkgman-non-rpm/build/buil=
d/tmp/sysroots-components/x86_64/libpcre2-native/fixmepath | xargs sed -i -=
e 's:FIXMESTAGINGDIRTARGET:/home/pokybuild/yocto-worker/pkgman-non-rpm/buil=
d/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot:=
g; s:FIXMESTAGINGDIRHOST:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/=
build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-na=
tive:g' -e 's:FIXME_PSEUDO_SYSROOT:/home/pokybuild/yocto-worker/pkgman-non-=
rpm/build/build/tmp/sysroots-components/x86_64/pseudo-native:g' -e 's:FIXME=
_HOSTTOOLS_DIR:/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/=
hosttools:g' -e 's:FIXME_PKGDATA_DIR:/home/pokybuild/yocto-worker/pkgman-no=
n-rpm/build/build/tmp/pkgdata/qemux86:g' -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/=
home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-pok=
y-linux/make-mod-scripts/1.0-r0/pseudo/:g' -e 's:FIXME_LOGFIFO:/home/pokybu=
ild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/mak=
e-mod-scripts/1.0-r0/temp/fifo.169218:g'
> > > > > > DEBUG: Python function extend_recipe_sysroot finished
> > > > > > DEBUG: Executing shell function do_configure
> > > > > > NOTE: make HOSTCC=3Dgcc  -isystem/home/pokybuild/yocto-worker/p=
kgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-=
r0/recipe-sysroot-native/usr/include -O2 -pipe -L/home/pokybuild/yocto-work=
er/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/=
1.0-r0/recipe-sysroot-native/usr/lib                         -L/home/pokybu=
ild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/mak=
e-mod-scripts/1.0-r0/recipe-sysroot-native/lib                         -Wl,=
--enable-new-dtags                         -Wl,-rpath-link,/home/pokybuild/=
yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mo=
d-scripts/1.0-r0/recipe-sysroot-native/usr/lib                         -Wl,=
-rpath-link,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/wor=
k/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib     =
                    -Wl,-rpath,/home/pokybuild/yocto-worker/pkgman-non-rpm/=
build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysr=
oot-native/usr/lib                         -Wl,-rpath,/home/pokybuild/yocto=
-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scr=
ipts/1.0-r0/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,-=
-allow-shlib-undefined -Wl,--dynamic-linker=3D/home/pokybuild/yocto-worker/=
pkgman-non-rpm/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux=
-x86-64.so.2 -static HOSTCPP=3Dgcc  -E HOSTCXX=3Dg++  -isystem/home/pokybui=
ld/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make=
-mod-scripts/1.0-r0/recipe-sysroot-native/usr/include -O2 -pipe -L/home/pok=
ybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/=
make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib                      =
   -L/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux=
86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib            =
             -Wl,--enable-new-dtags                         -Wl,-rpath-link=
,/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-p=
oky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/lib            =
             -Wl,-rpath-link,/home/pokybuild/yocto-worker/pkgman-non-rpm/bu=
ild/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroo=
t-native/lib                         -Wl,-rpath,/home/pokybuild/yocto-worke=
r/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1=
.0-r0/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/hom=
e/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-l=
inux/make-mod-scripts/1.0-r0/recipe-sysroot-native/lib                     =
    -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/home/pokybu=
ild/yocto-worker/pkgman-non-rpm/build/build/tmp/sysroots-uninative/x86_64-l=
inux/lib/ld-linux-x86-64.so.2 -static CROSS_COMPILE=3Di686-poky-linux- CC=
=3Di686-poky-linux-gcc  -fuse-ld=3Dbfd -fcanon-prefix-map  -fmacro-prefix-m=
ap=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux=
86-poky-linux/make-mod-scripts/1.0-r0=3D/usr/src/debug/make-mod-scripts/1.0=
-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build=
/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0=3D/usr/src/debug=
/make-mod-scripts/1.0-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker=
/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.=
0-r0=3D/usr/src/debug/make-mod-scripts/1.0-r0  -fdebug-prefix-map=3D/home/p=
okybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86-poky-linu=
x/make-mod-scripts/1.0-r0=3D/usr/src/debug/make-mod-scripts/1.0-r0  -fdebug=
-prefix-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/w=
ork/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=3D  -fmacro-p=
refix-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/wor=
k/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot=3D  -fdebug-pre=
fix-map=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/=
qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native=3D  -fdebu=
g-prefix-map=3D/home/pokybui
> > > > > d/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86=
/kernel-source=3D/usr/src/kernel -fdebug-prefix-map=3D/home/pokybuild/yocto=
-worker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-build-art=
ifacts=3D/usr/src/kernel LD=3Di686-poky-linux-ld.bfd  AR=3Di686-poky-linux-=
ar  OBJCOPY=3Di686-poky-linux-objcopy  HOSTPKG_CONFIG=3Dpkg-config --static=
 CRYPTO_LIBS=3D-L/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tm=
p/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr=
/lib/pkgconfig/../../../usr/lib -lcrypto -ldl -pthread -C /home/pokybuild/y=
octo-worker/pkgman-non-rpm/build/build/tmp/work-shared/qemux86/kernel-sourc=
e O=3D/home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work-shar=
ed/qemux86/kernel-build-artifacts prepare
> > > > > > make: Entering directory '/home/pokybuild/yocto-worker/pkgman-n=
on-rpm/build/build/tmp/work-shared/qemux86/kernel-source'
> > > > > >   SYNC    include/config/auto.conf
> > > > > >   GEN     Makefile
> > > > > >   HOSTCC  scripts/basic/fixdep
> > > > > > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/hos=
ttools/ld: cannot find -lc
> > > > > > collect2: error: ld returned 1 exit status
> > > > > > make[3]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build=
/build/tmp/work-shared/qemux86/kernel-source/scripts/Makefile.host:111: scr=
ipts/basic/fixdep] Error 1
> > > > > > make[2]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build=
/build/tmp/work-shared/qemux86/kernel-source/Makefile:640: scripts_basic] E=
rror 2
> > > > > > /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/wor=
k-shared/qemux86/kernel-source/Makefile:748: include/config/auto.conf: No s=
uch file or directory
> > > > > > make[1]: *** [/home/pokybuild/yocto-worker/pkgman-non-rpm/build=
/build/tmp/work-shared/qemux86/kernel-source/Makefile:805: include/config/a=
uto.conf] Error 2
> > > > > > make[1]: *** [include/config/auto.conf] Deleting file 'include/=
generated/rustc_cfg'
> > > > > > make[1]: *** [include/config/auto.conf] Deleting file 'include/=
generated/autoconf.h'
> > > > > > make: *** [Makefile:238: __sub-make] Error 2
> > > > > > make: Leaving directory '/home/pokybuild/yocto-worker/pkgman-no=
n-rpm/build/build/tmp/work-shared/qemux86/kernel-source'
> > > > > > ERROR: oe_runmake failed
> > > > > > WARNING: /home/pokybuild/yocto-worker/pkgman-non-rpm/build/buil=
d/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_configure=
.169218:195 exit 1 from 'exit 1'
> > > > > > WARNING: Backtrace (BB generated script):
> > > > > >       #1: bbfatal_log, /home/pokybuild/yocto-worker/pkgman-non-=
rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/ru=
n.do_configure.169218, line 195
> > > > > >       #2: die, /home/pokybuild/yocto-worker/pkgman-non-rpm/buil=
d/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_con=
figure.169218, line 179
> > > > > >       #3: oe_runmake, /home/pokybuild/yocto-worker/pkgman-non-r=
pm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run=
.do_configure.169218, line 174
> > > > > >       #4: do_configure, /home/pokybuild/yocto-worker/pkgman-non=
-rpm/build/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/r=
un.do_configure.169218, line 164
> > > > > >       #5: main, /home/pokybuild/yocto-worker/pkgman-non-rpm/bui=
ld/build/tmp/work/qemux86-poky-linux/make-mod-scripts/1.0-r0/temp/run.do_co=
nfigure.169218, line 208
> > > > > NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Failed
> > > > >
> > > > > > It shouldn't be the kernel updates, so I'm assuming something w=
ith
> > > > > > make-mod-scripts. I'll have a look at it on Thursday.
> > > > >
> > > > > Yes, it is make-mod-scripts, maybe missing static libraries?
> > > >
> > > > I was able to build qemux86 on my ubuntu builder, and from the mess=
age
> > > > it is looking for -lc and not finding it.
> > > >
> > > > It looks like that was alma linux, so no static c library ?
> > > >
> > > > I don't have access to anything alma based to test, but I guess a
> > > > dependency on a static native glibc might help ?
> > >
> > > If I understand what is being attempted here, what is being asked for
> > > is a static library from the distro the build is running on. We don't
> > > build a native glibc (or gcc).
> > >
> > > It is easy to say "just tell people to install that" but it isn't qui=
te
> > > that simple. The work needed off the top of my head is roughly:
> > >
> > > * add sanity tests to check it is present and error if not
> > > * documentation updates to tell people to install it
> > > * updating all the autobuilder workers to have it
> > > * update buildtools tarball to contain it
> > > * release a new buildtools
> > > * ensure everything in automated testing uses the new buildtools
> > > release
> > >
> > > so I do have to ask if we really need to add this dependency?
> > >
> >
> > If we want to try and fix the rm_work issues with the output of
> > make-mod-scripts via statically linked tools, then I don't see another
> > way to do it. Distros that have a static libc don't have the issue of
> > course.
> >
> > If we can't get the static linking working across kernel versions and
> > host distros, then we are into the rpathLDPATH or other ideas that
> > were floated in the original discussion to save the dynamic libraries
> > to the kernel build artifacts directory and then have the scripts be
> > able to locate them at runtime.
> >
> > I do find it strange that -lc isn't being found though, because that
> > implies that no one ever does static linking on alma linux .. and that
> > doesn't make sense, so maybe there's something else going on that I'm
> > missing.
>
> It implies nobody does that on alma linux without installing the static
> library packages. We have minimal installs of the distros on the
> autobuilder for this reason so we catch dependency issues like this.
>

Aha. So I guess we can drop this for now.

I'll revisit the dynamic linking options later in the development cycle.

Bruce

> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

