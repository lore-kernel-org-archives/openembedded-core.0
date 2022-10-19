Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94014C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 21:52:31 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.2687.1666216347323832970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 14:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=b6Gqx4nh;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id b2so43133082eja.6
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 14:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBvRuwQ148meNtEFmjfXSpwE4GQfGHgAXuy2XHbcN24=;
        b=b6Gqx4nhyXglJvWMwJCCnRaXsAk6tbJmClH2kiRQ/escIWBxGVtNpPrgjzN6yqgULv
         OsTqFkiXg8PEA4WlAXp4YR06VUAvPi6aRjIaq7H30S517DVnYY89JcnAH2nuUUlYStFS
         GEC7bqivepB3oCQTXuSc5Zav4POJy2wPbsIB8iZmwMGFEeybuuWrEXw9Dle1AFT1fqDv
         O28FDsVsGwto1ESObo5xWczMh+DzS7tpp61bT0aXiCef8CtDasHJAYg07+7rqVTfzBzl
         4ABUhykUpPnEngiFZ4NAAOuITjikVWPZQhwdmlgZ+Q/tfDRXDRsrn7lr2781XsCQhxxr
         LJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBvRuwQ148meNtEFmjfXSpwE4GQfGHgAXuy2XHbcN24=;
        b=8OkbRThXy+c3OWY0lUcVlNhPTZnt3H2J52wmY+4LGd5drIh4okGhtLWsIpIBvZqRYe
         rNTqPz7r84ZkINW7ZIWWleTDOGa4uBohjizjQyc3yUy0NMT/3RAmXVPNkw9sp1c6YWe7
         ERUjAwcaR+ID/WaJMXlvWXBL6zZLUYqoSkQ5lf0ugx6tgcxc01a6bSA6OrsX77dB1PFw
         peA5AvuUa//2MNa4kO6MitLwpQp5zO3UjdmwjckGLH5fZSaZigRvsJybkmHYwviUePEs
         gUof8ZbUr/jWc3afg8TyIR9ZdzUr1XVgtvBNeKX3VLw0qAU9qGu0Qgd5Sa91Cnmfyn2/
         HIFA==
X-Gm-Message-State: ACrzQf3VtzXDpU4Pk2mBUlMDHBDyAWWPYK7fJO5Y73Q/K4smAlxM0Mti
	bTO+j+8Rzyv1B1XLEIAC86z+efdJRS+QYwYsDHEYyg==
X-Google-Smtp-Source: AMsMyM7jVPjwy1mosDdD371TeqY8sVnOqRAztoDinShb0XJ2G1IBigDbHihXYTJkKL9e4andUkyQIJp12XugG7XmH3Q=
X-Received: by 2002:a17:907:2d1e:b0:78e:2c3b:559f with SMTP id
 gs30-20020a1709072d1e00b0078e2c3b559fmr8420051ejc.435.1666216345494; Wed, 19
 Oct 2022 14:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220929083319.2225406-1-jay.shen.teoh@intel.com>
 <20220929083319.2225406-2-jay.shen.teoh@intel.com> <DM4PR11MB5536C6540613140ACF826C1FE62B9@DM4PR11MB5536.namprd11.prod.outlook.com>
 <c6e185bd-d5c6-ba11-db59-1e05b49b284b@windriver.com>
In-Reply-To: <c6e185bd-d5c6-ba11-db59-1e05b49b284b@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 19 Oct 2022 11:52:14 -1000
Message-ID: <CAOSpxdY1Fwy2JJAVTZwSZZC+=PXQuzJ5=DCiiz=iL-70o-s=3Q@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 2/2] tiff: backport fix for CVE-2022-2953
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "Qiu, Zheng" <Zheng.Qiu@windriver.com>, "Teoh, Jay Shen" <jay.shen.teoh@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 21:52:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171985

On Wed, Oct 19, 2022 at 11:07 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2022-10-19 15:32, Qiu, Zheng wrote:
> > kirkstone now has tiff version 4.3.0.
> >
> > As described in https://nvd.nist.gov/vuln/detail/CVE-2022-2953, this is=
sue is reported here: https://gitlab.com/libtiff/libtiff/-/issues/414
> >
> > Tested with libtiff source code on version 4.3.0 by using " /libtiff$ g=
it checkout v3.3.0", and follow the step listed in the bug report, cannot r=
eproduce the bug.
> >
> > Use " /libtiff$ git checkout b51bb157", is able to reproduce the proble=
m following step listed above. That confirms the issue occurred after v3.3.=
0, and the commit that brings the bug is not on kirkstone, which means the =
issue/fix is not applicable for kirkstone.
>
> Hold on...
>
> We also checked, because I'm paranoid, by doing:
>
> $ cd .../poky-contrib.git
> $ git checkout stable/kirkstone-nut
> $ git pull
> $ cd ...
> $ .  ../poky-contrib.git/tiff-patches
> $ bitbake -c patch tiff
>
> $ mkdir cp-tiff-patch-by-bb-kirkstone-nut
> $ cp -a tmp/work/core2-64-poky-linux/tiff/4.3.0-r0
> cp-tiff-patch-by-bb-kirkstone-nut/
> $ cd cp-tiff-patch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0
> $ ./autogen.sh
> $ CFLAGS=3D"-g -fsanitize=3Daddress -fno-omit-frame-pointer" CXXFLAGS=3D"=
-g
> -fsanitize=3Daddress -fno-omit-frame-pointer" ./configure
> --prefix=3D$PWD/build_asan --disable-shared
> $ make -j; make install; make clean
> $ wget
> https://gitlab.com/libtiff/libtiff/uploads/54e5139c4d9d6b740f537c691aad2b=
03/poc
> $ ./build_asan/bin/tiffcrop -Z 1:4,3:3 -R 90 -H 300  -S 2:2  -i poc /tmp/=
foo
>
> and a very similar issue still occurs.
>
> See log below. We'll investigate more and send a patch as needed.

Thanks Randy.  I'm pretty sure I didn't take the referenced patch
because it was for a version of tiff not in kirkstone.

But I don't see an email from me explaining why, so my bad :-(  I
usually try to give feedback when a patch isn't taken.

Steve

>
> We will enable the address sanitizer and check if the issue
> is reproducible in qemux86-64.
>
> ../Randy
>
>
> ...
>
> loadImage: Image lacks Photometric interpretation tag.
> TIFFFillStrip: Read error on strip 0; got 672 bytes, expected 1142418.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D269609=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addres=
s
> 0x7fd1864ff695 at pc 0x55de6ca63f9a bp 0x7ffe727049a0 sp 0x7ffe72704990
> READ of size 1 at 0x7fd1864ff695 thread T0
>      #0 0x55de6ca63f99 in extractImageSection
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:6897
>      #1 0x55de6ca6515a in writeImageSections
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:7085
>      #2 0x55de6ca4abe9 in main
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:2453
>      #3 0x7fd189b39d8f in __libc_start_call_main
> ../sysdeps/nptl/libc_start_call_main.h:58
>      #4 0x7fd189b39e3f in __libc_start_main_impl ../csu/libc-start.c:392
>      #5 0x55de6ca413a4 in _start
> (/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-=
patch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/build_asan/bin/tiffcrop+0x2a3=
a4)
>
> 0x7fd1864ff695 is located 0 bytes to the right of 1142421-byte region
> [0x7fd1863e8800,0x7fd1864ff695)
> allocated by thread T0 here:
>      #0 0x7fd18a0a1867 in __interceptor_malloc
> ../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:145
>      #1 0x55de6cadcd83 in _TIFFmalloc
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/libtiff/tif_unix.c:314
>      #2 0x55de6ca41543 in limitMalloc
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:627
>      #3 0x55de6ca61299 in loadImage
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:6212
>      #4 0x55de6ca4a4a1 in main
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:2376
>      #5 0x7fd189b39d8f in __libc_start_call_main
> ../sysdeps/nptl/libc_start_call_main.h:58
>
> SUMMARY: AddressSanitizer: heap-buffer-overflow
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:6897
> in extractImageSection
> Shadow bytes around the buggy address:
>    0x0ffab0c97e80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    0x0ffab0c97e90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    0x0ffab0c97ea0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    0x0ffab0c97eb0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    0x0ffab0c97ec0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> =3D>0x0ffab0c97ed0: 00 00[05]fa fa fa fa fa fa fa fa fa fa fa fa fa
>    0x0ffab0c97ee0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>    0x0ffab0c97ef0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>    0x0ffab0c97f00: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>    0x0ffab0c97f10: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>    0x0ffab0c97f20: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> Shadow byte legend (one shadow byte represents 8 application bytes):
>    Addressable:           00
>    Partially addressable: 01 02 03 04 05 06 07
>    Heap left redzone:       fa
>    Freed heap region:       fd
>    Stack left redzone:      f1
>    Stack mid redzone:       f2
>    Stack right redzone:     f3
>    Stack after return:      f5
>    Stack use after scope:   f8
>    Global redzone:          f9
>    Global init order:       f6
>    Poisoned by user:        f7
>    Container overflow:      fc
>    Array cookie:            ac
>    Intra object redzone:    bb
>    ASan internal:           fe
>    Left alloca redzone:     ca
>    Right alloca redzone:    cb
>    Shadow gap:              cc
> =3D=3D269609=3D=3DABORTING
>
>
> > Zheng Qiu
> > Linux Developer
> > _______________
> > Wind River
> > M/ (437) 341-1849
> >
> >> -----Original Message-----
> >> From: openembedded-core@lists.openembedded.org <openembedded-
> >> core@lists.openembedded.org> On Behalf Of Teoh, Jay Shen
> >> Sent: Thursday, September 29, 2022 4:33 AM
> >> To: openembedded-core@lists.openembedded.org
> >> Subject: [OE-core][kirkstone][PATCH 2/2] tiff: backport fix for CVE-20=
22-2953
> >>
> >> [Please note: This e-mail is from an EXTERNAL e-mail address]
> >>
> >> From: Teoh Jay Shen <jay.shen.teoh@intel.com>
> >>
> >> Link for the patch : https://gitlab.com/libtiff/libtiff/-
> >> /commit/48d6ece8389b01129e7d357f0985c8f938ce3da3
> >>
> >> Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
> >> ---
> >> .../libtiff/tiff/CVE-2022-2953.patch          | 86 +++++++++++++++++++
> >> meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
> >> 2 files changed, 87 insertions(+)
> >> create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-
> >> 2953.patch
> >>
> >> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
> >> b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
> >> new file mode 100644
> >> index 0000000000..2122b46566
> >> --- /dev/null
> >> +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
> >> @@ -0,0 +1,86 @@
> >> +CVE: CVE-2022-2953
> >> +Upstream-Status: Backport
> >> +Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
> >> +
> >> +From 8fe3735942ea1d90d8cef843b55b3efe8ab6feaf Mon Sep 17 00:00:00
> >> 2001
> >> +From: Su_Laus <sulau@freenet.de>
> >> +Date: Mon, 15 Aug 2022 22:11:03 +0200
> >> +Subject: [PATCH]
> >> +=3D?UTF-8?q?According=3D20to=3D20Richard=3D20Nolde=3D20https://gitl?=
=3D
> >> +
> >> +=3D?UTF-8?q?ab.com/libtiff/libtiff/-/issues/401#note=3D5F877637400=3D=
20the=3D20
> >> +ti?=3D
> >> +=3D?UTF-8?q?ffcrop=3D20option=3D20=3DE2=3D80=3D9E-
> >> S=3DE2=3D80=3D9C=3D20is=3D20also=3D20mutually
> >> +?=3D
> >> +=3D?UTF-8?q?=3D20exclusive=3D20to=3D20the=3D20other=3D20crop=3D20opti=
ons=3D20(-X|-
> >> Y),=3D2
> >> +0-?=3D
> >> + =3D?UTF-8?q?Z=3D20and=3D20-z.?=3D
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=3DUTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +This is now checked and ends tiffcrop if those arguments are not mutu=
ally
> >> exclusive.
> >> +
> >> +This MR will fix the following tiffcrop issues: #349, #414, #422, #42=
3,
> >> +#424
> >> +---
> >> + tools/tiffcrop.c | 31 ++++++++++++++++---------------
> >> + 1 file changed, 16 insertions(+), 15 deletions(-)
> >> +
> >> +diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c index
> >> +90286a5e..c3b758ec 100644
> >> +--- a/tools/tiffcrop.c
> >> ++++ b/tools/tiffcrop.c
> >> +@@ -173,12 +173,12 @@ static   char tiffcrop_rev_date[] =3D "02-09-20=
22";
> >> + #define ROTATECW_270 32
> >> + #define ROTATE_ANY (ROTATECW_90 | ROTATECW_180 | ROTATECW_270)
> >> +
> >> +-#define CROP_NONE     0
> >> +-#define CROP_MARGINS  1
> >> +-#define CROP_WIDTH    2
> >> +-#define CROP_LENGTH   4
> >> +-#define CROP_ZONES    8
> >> +-#define CROP_REGIONS 16
> >> ++#define CROP_NONE     0     /* "-S" -> Page_MODE_ROWSCOLS and page-
> >>> rows/->cols !=3D 0 */
> >> ++#define CROP_MARGINS  1     /* "-m" */
> >> ++#define CROP_WIDTH    2     /* "-X" */
> >> ++#define CROP_LENGTH   4     /* "-Y" */
> >> ++#define CROP_ZONES    8     /* "-Z" */
> >> ++#define CROP_REGIONS 16     /* "-z" */
> >> + #define CROP_ROTATE  32
> >> + #define CROP_MIRROR  64
> >> + #define CROP_INVERT 128
> >> +@@ -316,7 +316,7 @@ struct crop_mask {
> >> + #define PAGE_MODE_RESOLUTION   1
> >> + #define PAGE_MODE_PAPERSIZE    2
> >> + #define PAGE_MODE_MARGINS      4
> >> +-#define PAGE_MODE_ROWSCOLS     8
> >> ++#define PAGE_MODE_ROWSCOLS     8    /* for -S option */
> >> +
> >> + #define INVERT_DATA_ONLY      10
> >> + #define INVERT_DATA_AND_TAG   11
> >> +@@ -781,7 +781,7 @@ static const char usage_info[] =3D
> >> + "             The four debug/dump options are independent, though it=
 makes
> >> little sense to\n"
> >> + "             specify a dump file without specifying a detail level.=
\n"
> >> + "\n"
> >> +-"Note:        The (-X|-Y), -Z and -z options are mutually exclusive.=
\n"
> >> ++"Note:        The (-X|-Y), -Z, -z and -S options are mutually exclus=
ive.\n"
> >> + "             In no case should the options be applied to a given se=
lection
> >> successively.\n"
> >> + "\n"
> >> + ;
> >> +@@ -2131,13 +2131,14 @@ void  process_command_opts (int argc, char
> >> *argv[], char *mp, char *mode, uint32
> >> +               /*NOTREACHED*/
> >> +       }
> >> +     }
> >> +-    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and =
-z are
> >> mutually exclusive) --*/
> >> +-    char XY, Z, R;
> >> ++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z, -z =
and -S are
> >> mutually exclusive) --*/
> >> ++    char XY, Z, R, S;
> >> +     XY =3D ((crop_data->crop_mode & CROP_WIDTH) || (crop_data-
> >>> crop_mode & CROP_LENGTH));
> >> +     Z =3D (crop_data->crop_mode & CROP_ZONES);
> >> +     R =3D (crop_data->crop_mode & CROP_REGIONS);
> >> +-    if ((XY && Z) || (XY && R) || (Z && R)) {
> >> +-        TIFFError("tiffcrop input error", "The crop options(-X|-Y), =
-Z and -z are
> >> mutually exclusive.->Exit");
> >> ++    S =3D (page->mode & PAGE_MODE_ROWSCOLS);
> >> ++    if ((XY && Z) || (XY && R) || (XY && S) || (Z && R) || (Z && S) =
|| (R && S))
> >> {
> >> ++        TIFFError("tiffcrop input error", "The crop options(-X|-Y),
> >> ++ -Z, -z and -S are mutually exclusive.->Exit");
> >> +         exit(EXIT_FAILURE);
> >> +     }
> >> +   }  /* end process_command_opts */
> >> +--
> >> +2.34.1
> >> +
> >> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/reci=
pes-
> >> multimedia/libtiff/tiff_4.4.0.bb
> >> index e30df0b3e9..caf6f60479 100644
> >> --- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
> >> +++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
> >> @@ -11,6 +11,7 @@ CVE_PRODUCT =3D "libtiff"
> >> SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
> >>             file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch =
\
> >>             file://CVE-2022-34526.patch \
> >> +           file://CVE-2022-2953.patch \
> >>             "
> >>
> >> SRC_URI[sha256sum] =3D
> >> "917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed
> >> "
> >> --
> >> 2.37.3
> >
> >
> >
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171983): https://lists.openembedded.org/g/openembedde=
d-core/message/171983
> Mute This Topic: https://lists.openembedded.org/mt/93990330/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

