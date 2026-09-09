Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90292C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:57:18 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12829.1788962228684407101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DvHSe8AQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b808456308so527905e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 06:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788962227; cv=none;
        d=google.com; s=arc-20260327;
        b=aUIfhXpX1asezFCW4BIO74nQCpMceF0GcPSeBtvDtDWE0RfGJzfDH48un1sE/YNWHA
         tpBvSB4o5LYQBsMw9DW9QzLg2FZTVjmb6JNdB2kRamCkt0Iu32G6GW0iaL/7WDwPrRnH
         J3C7EbqtcJYk31ERKrNYyXjecLcxeUFkmlWruVj4oTOlEyog8hO4ggC3tqu59AVTUq+i
         9z2HRSj5UVEpJWIYMWdYlvDA3bfLy3VXcL6rj8AA5Ve29swLmehRkK+0hdvDubPUvQp7
         lK1WY4sRY6dIqGpbvbQAAiMj34Hy0f5BxJkH3UWvMwk9U1YmJJly55fIZSVf0IgMRK/4
         bCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t0XCzd55xiRHkfANRRVr47aaQJXMYmtis2bFdvslAYU=;
        fh=zyxtX5POw6OtHvIZVFzdDxAzKVNVln7Oz6vH1NWETqc=;
        b=FOlDx7YzlVNdzfVJR/JV02qil7dKn27+LE+x/ISvhUgtal50gdcvjrwc7FrUYZnN9I
         22RLEe4OnwySVpDY85GPkbz8e6vIR0NnV574hlsCAHkbTvXHbCwbhz5ZQ97eVKe5gyTx
         2jz9L+nKWLi1rjncIOjDKD5M0mOz2oZRV7bm5QGLX9BO/Z/t7UJJRmAB9L26/qpxjODe
         OBJdYHbcRVY8i9TLHFyWrlGa810s+IEdkDOlQziTH7/vIGClxyFhFah+7fqKGVTE13f+
         uglvINPigOEWb7Uasnr+bm8jYsYVXzvr8YCesPToh1WD4cMntNcIe+f27nXRFQ16gWNY
         eU7g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788962227; x=1789567027; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t0XCzd55xiRHkfANRRVr47aaQJXMYmtis2bFdvslAYU=;
        b=DvHSe8AQG+jc0CBOZ0LhQIfAwYWpu94EUH3q1XBp/QGi5wGSZEuNJ/ij8RfsJxzAGq
         AB3m7NEOoEA66Ew9H2j/hz6JZthZ8qGwfHOBJPKnc7SrqjI/jct/7w1kGFulXvKoXMal
         WLXkCeDRGmQGQxMcMm0FgO756cmr/BhvGf3oixvFH1lqufHRuxsoR3UU5C7PuLNEDFPV
         FGeVf7WSnmfYSZsfwiuRJMpZU54yb7MwPy6HUWhw6RqFauH/aZhDal9sXJqplN3iU7dh
         Ylwbh5/jY60t9qRDtALPBIqY1Y2vdJCAN4rUDDI414NNqceP8IgcL0HDiaPvPqJ+epqG
         M8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788962227; x=1789567027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0XCzd55xiRHkfANRRVr47aaQJXMYmtis2bFdvslAYU=;
        b=p2xCYZkaGGKiqGs7Y7QcRrnpyUCixRYaPJeu7OxVHZSqbHwoYqyLo6mveYxVAkPukw
         H0a3GJPJ6/QpcM9XjN6dYGVsdMwVI2lfWLPixCk5HuoAjTdztYZExm8D+UWKdM2HBL+V
         HdCLwpVJfZxZ9Dj7MC180gU12BQu4WMMyBVyXOENnQDUULYArFk6kBTpLSx0W1WOeHuo
         /koLPjgARNKt/3TvS/DYN7E9tnHShQHT/EGN2xyHPVnf48iGr+R5yaxOeoqToE4Wpj0K
         XgaemDHDxKHEvjY6cVb5MgRtMY6aGbDzQ9ejWaSa4MZex26NlJCLQ+R7bDOBu+M85kVG
         Gh3w==
X-Forwarded-Encrypted: i=1; AKwUvBwowUyIcdZ6eg3ufH7AEnd8Qzo3tOl2zrnMwC1OU/lBV5DTNAF1sWCRu6s2Hn3uR31DKl0q/Ob1lSgKc8sDDcRA0g==@lists.openembedded.org
X-Gm-Message-State: AFuF++kQYOvV1t2Rq0MEuZLigB3UrfNi6S/xwCo9mCdFDKe6Nhkm9XHt
	QFQpXEPYaHa5Ytiaiqg61x5aEgghHz6Ou+EhLf6sjlVyWbkgdldck0CsIjN3ZKrcJvU+UMUMNL2
	8SnEez+a+Fkc8blDD95goWBSR71r6Q+k=
X-Gm-Gg: AYBFou1vF/VifCRkfd/73Z5YsHoAcwsah+bGm1Mu5qf4I6QPVySpNSFp79zM86QERog
	CzvHPirEpTUOxZCx+qohyBprjTSVUXjixkHQ19YHHi+nqCwpzuJnB6zadjdYCugsCOCDBEH4Fh4
	GwWDixpQvu629vpQH6vm3MxM/L+RjGjI5NYETqKSwdH0i1fp+9ZwBqronHdlRPlLZMzwrDCpQmf
	bRg1rRq1Spuf/eEo3qoGEziYs08BiUogmyg3d5iuuiwtUe8DwbT63/VSupfoPEiz6cs7pPMfNgp
	J9IPBLRACrnIhZ8MlFOcDsrdItAOhsfIqWp3Pv6zniQg/U5ib1NruMYmfr5uvIT45bYMeLZp5Ct
	aBOl3YxB0wti2nzgfqpOjU3+p7PQkq+xX7sIe
X-Received: by 2002:a05:6512:2522:b0:5b4:ab7a:8275 with SMTP id
 2adb3069b0e04-5b616f020abmr6677537e87.3.1788962226263; Wed, 09 Sep 2026
 06:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260826233416.37047-1-anis.bougrine10@gmail.com>
 <20260826233416.37047-3-anis.bougrine10@gmail.com> <7f5c5ec971adc08fc5e2ca6e4b0c30840880cb3f.camel@linuxfoundation.org>
 <CAGgtUzYzD2RrBtRN6irANJX3L8qnsXjiB8LSWj_tR49J4T2GeA@mail.gmail.com>
In-Reply-To: <CAGgtUzYzD2RrBtRN6irANJX3L8qnsXjiB8LSWj_tR49J4T2GeA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 Sep 2026 15:56:52 +0200
X-Gm-Features: AcwNN1UTLqvfFaCZE_VpFBRoU0tkukTuQTlAEziNgw3Z1ij2miND7iiRymHsprA
Message-ID: <CA+chaQfotCLJTdVUJa10J=gntR06bnx_j6pi-6oPx-R+PzfXPg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 2/5] kernel: re-sign kernel modules after
 package stripping process
To: anis.bougrine10@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245476

Hello, I'm seeing one more issue caused by this change.

Then you enable both:
CONFIG_MODULE_SIG
and
CONFIG_MODULE_COMPRESS/CONFIG_MODULE_COMPRESS_XZ/CONFIG_MODULE_COMPRESS_ALL

then the do_package fails in module_sign:

| DEBUG: Executing shell function post_strip_kernel_modules_signing
| NOTE: make ARCH=3Dx86 CC=3Dx86_64-oe-linux-gcc   -fuse-ld=3Dbfd
-fcanon-prefix-map
-ffile-prefix-map=3D/OE/build/oe-core/tmp/work-shared/qemux86-64/kernel-sou=
rce=3D/usr/src/debug/linux-yocto/7.2.4+git
 -ffile-prefix-map=3D/OE/build/oe-core/tmp/wor
k/qemux86_64-oe-linux/linux-yocto/7.2.4+git/linux-qemux86_64-standard-build=
=3D/usr/src/debug/linux-yocto/7.2.4+git
 -ffile-prefix-map=3D/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-y=
octo/7.2.4+git/recipe-sysroot=3D
 -ffile-prefix-map=3D/O
E/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/7.2.4+git/recipe-s=
ysroot-native=3D
  -ffile-prefix-map=3D/OE/build/oe-core/tmp/work-shared/qemux86-64/kernel-s=
ource=3D/usr/src/kernel
 -ffile-prefix-map=3D/OE/build/oe-core/tmp/work-shared/
qemux86-64/kernel-build-artifacts=3D/usr/src/kernel
LD=3Dx86_64-oe-linux-ld.bfd  OBJCOPY=3Dx86_64-oe-linux-objcopy
STRIP=3Dx86_64-oe-linux-strip HOSTCC=3Dgcc
HOSTCFLAGS=3D-isystem/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-y=
octo/7.2.4+git
/recipe-sysroot-native/usr/include -O2 -pipe
HOSTLDFLAGS=3D-L/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/=
7.2.4+git/recipe-sysroot-native/usr/lib

-L/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-y
octo/7.2.4+git/recipe-sysroot-native/lib
-Wl,--enable-new-dtags
-Wl,-rpath-link,/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/=
7.2.4+git/recipe-sysroot-native/usr/lib
             -Wl,-rpath-link,/OE/build/oe-core/tmp/work/qemux86_64-oe-linux=
/linux-yocto/7.2.4+git/recipe-sysroot-native/lib

-Wl,-rpath,/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/7.2.4=
+git/recipe-sys
root-native/usr/lib
-Wl,-rpath,/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/7.2.4=
+git/recipe-sysroot-native/lib
                        -Wl,-O1 -Wl,--allow-shlib-undefined
-Wl,--dynamic-linker=3D/OE/bui
ld/oe-core/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
-pthread HOSTCPP=3Dgcc  -E HOSTCXX=3Dg++
HOSTCXXFLAGS=3D-isystem/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux=
-yocto/7.2.4+git/recipe-sysroot-native/usr/include
-O2
-pipe HOSTPKG_CONFIG=3Dpkg-config-native PAHOLE=3Dfalse -C
/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/7.2.4+git/linux-=
qemux86_64-standard-build
MODLIB=3D/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/7.2.4+g=
it/packag
e/usr/lib/modules/7.2.4-yocto-standard modules_sign
| make: Entering directory
'/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/7.2.4+git/linux=
-qemux86_64-standard-build'
|   SIGN    /OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/7.2.=
4+git/package/usr/lib/modules/7.2.4-yocto-standard/kernel/fs/nls/nls_cp737.=
ko
| At main.c:247:
| - SSL error:FFFFFFFF80000002:system library::No such file or
directory: ../sources/openssl-4.0.2/crypto/bio/bss_file.c:73
| - SSL error:10000080:BIO routines::no such file:
../sources/openssl-4.0.2/crypto/bio/bss_file.c:81
| sign-file: /OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/7.2=
.4+git/package/usr/lib/modules/7.2.4-yocto-standard/kernel/fs/nls/nls_cp737=
.ko
| make[2]: *** [/OE/build/oe-core/tmp/work-shared/qemux86-64/kernel-source/=
scripts/Makefile.modinst:141:
/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/7.2.4+git/packag=
e/usr/lib/modules/7.2.4-yocto-standard/kernel/fs/nls/nls_c
p737.ko] Error 1
| make[1]: *** [/OE/build/oe-core/tmp/work-shared/qemux86-64/kernel-source/=
Makefile:2104:
modules_install] Error 2
| make: Leaving directory
'/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/7.2.4+git/linux=
-qemux86_64-standard-build'
| make: *** [/OE/build/oe-core/tmp/work-shared/qemux86-64/kernel-source/Mak=
efile:248:
__sub-make] Error 2

oe-core $ ls /OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/7.2=
.4+git/package/usr/lib/modules/7.2.4-yocto-standard/kernel/fs/nls/nls_cp737=
*
/OE/build/oe-core/tmp/work/qemux86_64-oe-linux/linux-yocto/7.2.4+git/packag=
e/usr/lib/modules/7.2.4-yocto-standard/kernel/fs/nls/nls_cp737.ko.xz

because the .ko files no longer exist, only .ko.xz are. Not sure if
there is a better place where to call module_sign or just disable this
post_strip one when CONFIG_MODULE_COMPRESS_* is set?

Easily reproduced with just oe-core:

diff --git a/meta/recipes-kernel/linux/files/module-sig.cfg
b/meta/recipes-kernel/linux/files/module-sig.cfg
new file mode 100644
index 0000000000..e2be1688cc
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/module-sig.cfg
@@ -0,0 +1,4 @@
+CONFIG_MODULE_COMPRESS=3Dy
+CONFIG_MODULE_COMPRESS_XZ=3Dy
+CONFIG_MODULE_COMPRESS_ALL=3Dy
+CONFIG_MODULE_SIG=3Dy
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index e3edaaada5..58278fc525 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -40,6 +40,7 @@ PN:class-devupstream =3D "linux-yocto-upstream"
 KBRANCH:class-devupstream =3D "v7.2/base"

 SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;bra=
nch=3D${KBRANCH};protocol=3Dhttps
\
+           file://module-sig.cfg \
            git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-7.2;destsuffix=3D${KMETA};protocol=3Dhttps"

 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e4=
6"

Or with just MODULE_SIG for raspberrypi builds as the default
defconfig already has MODULE_COMPRESS in:
arch/arm64/configs/bcm2711_defconfig:CONFIG_MODULE_COMPRESS=3Dy
arch/arm64/configs/bcm2711_defconfig:CONFIG_MODULE_COMPRESS_XZ=3Dy
arch/arm64/configs/bcm2711_rt_defconfig:CONFIG_MODULE_COMPRESS=3Dy
arch/arm64/configs/bcm2711_rt_defconfig:CONFIG_MODULE_COMPRESS_XZ=3Dy
arch/arm64/configs/bcm2712_defconfig:CONFIG_MODULE_COMPRESS=3Dy
arch/arm64/configs/bcm2712_defconfig:CONFIG_MODULE_COMPRESS_XZ=3Dy

Regards,


On Mon, Sep 7, 2026 at 12:28=E2=80=AFPM Anis Bougrine via
lists.openembedded.org
<anis.bougrine10=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hello Richard,
>
> Sorry to hear that, and sorry for making you debug this for hours.
>
> I just saw your patch, =E2=80=9Ckernel-module-split: Remove get_ext_mod=
=E2=80=9D. I=E2=80=99m OK with that workaround.
>
> On my side, I=E2=80=99ll think about a better solution to cover all out-o=
f-tree module use cases.
>
> I=E2=80=99m rebuilding my PC for an upgrade, so it will take a while.
>
> Thank you.
>
> BR,
> Anis
>
>
> On Sat 5 Sep 2026 at 09:39, Richard Purdie <richard.purdie@linuxfoundatio=
n.org> wrote:
>>
>> On Thu, 2026-08-27 at 01:34 +0200, Anis Bougrine wrote:
>> > Fixes [YOCTO #12927]
>> >
>> > Currently, signed kernel modules are not stripped in order to preserve
>> > their valid signatures. See commit 4c47e5f.
>> >
>> > Therefore, this commit makes kernel modules stripped and correctly
>> > signed. Two options are possible:
>> >
>> >     - Strip the kernel modules after installation and before signing.
>> >     - Re-sign the kernel modules after stripping and before package sp=
litting.
>> >
>> > The first option was rejected because debug symbols would be dropped e=
arly
>> > in the build workflow, which may impact the SPDX process.
>> >
>> > The second option is adopted because it does not impact the build flow=
.
>> >
>> > Reported-by: Ross Burton <ross.burton@arm.com>
>> > Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
>> > ---
>> >  .../kernel-module-split.bbclass               | 25 ++++++++++++++++++=
+
>> >  1 file changed, 25 insertions(+)
>> >
>> > diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/cl=
asses-recipe/kernel-module-split.bbclass
>> > index ab2f0d1c37..2b40437cc2 100644
>> > --- a/meta/classes-recipe/kernel-module-split.bbclass
>> > +++ b/meta/classes-recipe/kernel-module-split.bbclass
>> > @@ -35,6 +35,11 @@ modprobedir ??=3D "${@bb.utils.contains('DISTRO_FEA=
TURES', 'systemd', '${nonarch_b
>> >
>> >  KERNEL_SPLIT_MODULES ?=3D "1"
>> >  PACKAGESPLITFUNCS =3D+ "split_kernel_module_packages"
>> > +# Order matters:
>> > +# 1. Strip the modules
>> > +# 2. Re-sign the modules (if enabled)
>> > +# 3. Split the packages
>> > +PACKAGESPLITFUNCS =3D+ "post_strip_kernel_modules_signing"
>> >
>> >  KERNEL_MODULES_META_PACKAGE ?=3D "${@ d.getVar("KERNEL_PACKAGE_NAME")=
 or "kernel" }-modules"
>> >
>> > @@ -42,6 +47,26 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
>> >  KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
>> >  KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
>> >
>> > +# This function supports both in-tree and out-of-tree modules.
>> > +post_strip_kernel_modules_signing(){
>> > +    # Read .config values to determine if module auto-signing is enab=
led
>> > +    is_modules=3D"$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBU=
ILD_OUTPUT}/.config --state MODULES)"
>> > +    is_module_sig=3D"$(${STAGING_KERNEL_DIR}/scripts/config --file ${=
KBUILD_OUTPUT}/.config --state MODULE_SIG)"
>> > +    is_module_sig_all=3D"$(${STAGING_KERNEL_DIR}/scripts/config --fil=
e ${KBUILD_OUTPUT}/.config --state MODULE_SIG_ALL)"
>> > +
>> > +    if [ "$is_modules" =3D "y" ] && [ "$is_module_sig" =3D "y" ] && [=
 "$is_module_sig_all" =3D "y" ]; then
>> > +        # Sign modules under ${PKGD}, with M=3D if out-of-tree module=
.
>> > +        # Out-of-tree module Makefiles invoke the kernel Makefile by =
appending M=3D (the module directory) to MAKEFLAGS.
>> > +        # However, they usually do not provide a modules_sign target.=
 Therefore, the kernel modules_sign target has to
>> > +        # be invoked manually after retrieving M=3D variable from pac=
kage source code Makefile.
>> > +        oe_runmake \
>> > +            -C ${KBUILD_OUTPUT}  \
>> > +            MODLIB=3D${PKGD}${nonarch_base_libdir}/modules/${KERNEL_V=
ERSION} \
>> > +            ${@'M=3D%s' % oe.kernel_module.get_ext_mod(d) if not "vir=
tual/kernel" in d.getVar('PROVIDES') else ''} \
>> > +            modules_sign
>> > +    fi
>> > +}
>>
>> This has merged and I'm really happy to see the signing code improved.
>> There is a weird bug this as introduced though where the eSDK is
>> breaking in kernel module compile tests.
>>
>> This is an example failure:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/4551
>>
>> In the bad environment, you can source the test eSDK environment:
>>
>> . /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-=
linux/core-image-sato/1.0/testsdkext/environment-setup-core2-32-poky-linux
>>
>> Rerun the compile step:
>>
>> /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-sato/1.0/testsdkext/tmp/work/qemux86-poky-linux/kernel-modul=
e-hello-world/1.0+git/temp/run.do_compile
>>
>> where you see hello-world.ko get generated:
>>
>> make[2]: Entering directory '/srv/pokybuild/yocto-worker/qemux86/build/b=
uild/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testsdkext/workspace/s=
ources/kernel-module-hello-world'
>>   LD [M]  hello-world.ko
>> make[2]: Leaving directory '/srv/pokybuild/yocto-worker/qemux86/build/bu=
ild/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testsdkext/workspace/so=
urces/kernel-module-hello-world'
>>
>> then watch:
>>
>> devtool build kernel-module-hello-world
>>
>> fail as above, noting that the hello-world.ko file disappears by the tim=
e it runs.
>>
>> To cut a long story short (hours of debugging), this happens during
>> parsing of the kernel-module-hello-world recipe. If you add a
>> bb.warn("Executing make") to oe.kernel_module.get_ext_mod() in
>> meta/lib/oe/kernel_module.py, you will see it runs make during parsing
>> and that make command deletes the .ko file.
>>
>> This raises a few questions:
>>
>> a) why is make being run during parsing?
>>
>> The shell function is being expanded to work out dependencies
>> and that triggers the python function call. This should definitely not
>> be happening during parsing so that is a bug.
>>
>> b) why does calling --dry-run on the kernel makefile delete files?
>>
>> We need to fix this somehow to avoid the failures/bad behaviour. I at
>> least wanted to explain the issue now I'd found the underlying area of
>> the problem. I've not really had a chance to think about solutions yet.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245243): https://lists.openembedded.org/g/openembedde=
d-core/message/245243
> Mute This Topic: https://lists.openembedded.org/mt/120949282/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

