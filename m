Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id CDB246013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 19:17:40 +0000 (UTC)
Received: by obbgg8 with SMTP id gg8so85091936obb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 12:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=+5YCU0axz9biRDD+AWtNuNGNCS+uWXTzqjiTl66psOY=;
	b=ICFdBdiDwqmXtz2rpn9zQ/bZzQw4yUuJP/nP2pvAxWWvrx37+LAyQWMyaES/G1TXCo
	5mgaQJVksmg9vylaE3AhmGP7Edw+flSURMBuEPxhIIssBN/QWsVVxtf7hWuW8l57WrRz
	pwcMaeOmwFlW8WEYXjU5OAbDjigQVk0j3p2fu83d4FE5nDBY7NBnuySqVyjbXL/e2/du
	NZ8WXshqT2yEi3578r3+joKG+0Fkx8w8eDLpIjp6ENu7b082m9VCHGIypLUQgjRYWtQv
	zbkX3Ql8lEpFh7ntIcxolEnqOPB/jBwZM+zQLZmEDQ+7Nq0UqAk1yzzVlaLbFowUlziC
	NNEw==
MIME-Version: 1.0
X-Received: by 10.202.67.132 with SMTP id q126mr11397520oia.15.1426879061568; 
	Fri, 20 Mar 2015 12:17:41 -0700 (PDT)
Received: by 10.202.217.69 with HTTP; Fri, 20 Mar 2015 12:17:41 -0700 (PDT)
In-Reply-To: <4B7FE4EF-7583-45DF-A2BF-340C6EBC6CAE@gmail.com>
References: <1426876321-19141-1-git-send-email-armccurdy@gmail.com>
	<4B7FE4EF-7583-45DF-A2BF-340C6EBC6CAE@gmail.com>
Date: Fri, 20 Mar 2015 12:17:41 -0700
Message-ID: <CAJ86T=UbGbbtMaV1thFtpGVrzX=Wz5MOVJse-Dtz-ucCaxqPFQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb: retire directfb.inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Mar 2015 19:17:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2015 at 11:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mar 20, 2015, at 11:32 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Splitting the DirectFB recipe into .bb and .inc hinders maintenance
>> and the addition of new features such as class-native support.
>>
>> Remove directfb.inc and merge everything into directfb_1.7.6.bb.
>
> Having a fairly static inc file has advantage that we don=E2=80=99t have =
to do git log =E2=80=94follow
> to see what the sequence of changes were since the recipe gets renamed wi=
th upgrades
> and not much changes ideally just the SRC_URI and signatures which can st=
ay in a recipe
> but if we change the .inc all the time then we have not abstracted out pr=
operly

OK, that's a good reason to keep it. Actually from that point of view
DirectFB is a good candidate for having almost everything in the .inc
and using the .bb to define version and hashes only (there's no
_git.bb so the .inc can be dedicated to building just the current
recipe).

My motivation was mainly to get rid of the confusing duplicated
EXTRA_OECONF definitions. I'll send a new patch to fix that without
removing the .inc file.

>>
>> No functional changes.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>> meta/recipes-graphics/directfb/directfb.inc      | 76 ------------------=
------
>> meta/recipes-graphics/directfb/directfb_1.7.6.bb | 75 ++++++++++++++++++=
++---
>> 2 files changed, 68 insertions(+), 83 deletions(-)
>> delete mode 100644 meta/recipes-graphics/directfb/directfb.inc
>>
>> diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-=
graphics/directfb/directfb.inc
>> deleted file mode 100644
>> index 669c0ff..0000000
>> --- a/meta/recipes-graphics/directfb/directfb.inc
>> +++ /dev/null
>> @@ -1,76 +0,0 @@
>> -SUMMARY =3D "Graphics abstraction library for the Linux Framebuffer Dev=
ice"
>> -DESCRIPTION =3D "DirectFB is a thin library that provides developers \
>> -with hardware graphics acceleration, input device handling and \
>> -abstraction, an integrated windowing system with support for \
>> -translucent windows and multiple display layers on top of the \
>> -Linux framebuffer device."
>> -SECTION =3D "libs"
>> -LICENSE =3D "LGPLv2.1"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddcf3c825659e82539645da41a790=
8589"
>> -
>> -HOMEPAGE =3D "http://directfb.org"
>> -DEPENDS =3D "jpeg libpng freetype zlib tslib"
>> -
>> -SRC_URI =3D "http://www.directfb.org/downloads/Core/DirectFB-1.7/Direct=
FB-${PV}.tar.gz \
>> -           file://configurefix.patch \
>> -           file://fusion.patch"
>> -
>> -S =3D "${WORKDIR}/DirectFB-${PV}"
>> -
>> -LDFLAGS_append =3D" -lts -lm"
>> -
>> -BINCONFIG =3D "${bindir}/directfb-config"
>> -
>> -inherit autotools binconfig-disabled pkgconfig
>> -
>> -PACKAGECONFIG ??=3D ""
>> -PACKAGECONFIG[jpeg2000] =3D "--enable-jpeg2000,--disable-jpeg2000,jaspe=
r"
>> -PACKAGECONFIG[drmkms] =3D "--enable-drmkms,--disable-drmkms,libdrm"
>> -PACKAGECONFIG[tiff] =3D "--enable-tiff,--disable-tiff,tiff"
>> -PACKAGECONFIG[webp] =3D "--enable-webp,--disable-webp,libwebp"
>> -
>> -EXTRA_OECONF =3D "\
>> -  --with-gfxdrivers=3Dnone \
>> -  --enable-libmpeg3=3Dno \
>> -  --enable-freetype=3Dyes \
>> -  --enable-sdl=3Dno \
>> -  --enable-vnc=3Dno \
>> -  --disable-x11 \
>> -  --disable-mesa \
>> -"
>> -
>> -#Once -fno-omit-frame-pointer option of gcc is added into TARGET_CLFAGS=
 as default
>> -#this will cause directfb build failure on x86 arch, so filter out it.
>> -TARGET_CFLAGS_x86 :=3D "${@oe_filter_out('-fno-omit-frame-pointer', '${=
TARGET_CFLAGS}', d)}"
>> -
>> -#PACKAGES_DYNAMIC +=3D "^directfb-inputdrivers-.*"
>> -#
>> -#python populate_packages_prepend () {
>> -#    inputdrivers_libdir =3D d.expand('${libdir}/directfb-${RV}/inputdr=
ivers')
>> -#    do_split_packages(d, inputdrivers_libdir, '*.so$', 'directfb-input=
drivers-%s', 'Directfb plugin for %s')
>> -#}
>> -
>> -# NOTE: monolithic packaging for now, should improve that eventually
>> -
>> -
>> -
>> -FILES_${PN}-dbg +=3D "\
>> -  ${libdir}/directfb-${RV}/*/*/.debug/*.so \
>> -  ${libdir}/directfb-${RV}/*/.debug/*.so \
>> -"
>> -
>> -FILES_${PN}-dev +=3D "\
>> -  ${bindir}/directfb-config \
>> -  ${libdir}/directfb-${RV}/systems/*.la \
>> -  ${libdir}/directfb-${RV}/inputdrivers/*.la \
>> -  ${libdir}/directfb-${RV}/interfaces/*/*.la \
>> -  ${libdir}/directfb-${RV}/wm/*.la \
>> -"
>> -
>> -FILES_${PN} +=3D "\
>> -  ${libdir}/directfb-${RV}/systems/*.so \
>> -  ${libdir}/directfb-${RV}/inputdrivers/*.so \
>> -  ${libdir}/directfb-${RV}/interfaces/*/*.so \
>> -  ${libdir}/directfb-${RV}/wm/*.so \
>> -  ${datadir}/directfb-${PV} \
>> -"
>> diff --git a/meta/recipes-graphics/directfb/directfb_1.7.6.bb b/meta/rec=
ipes-graphics/directfb/directfb_1.7.6.bb
>> index d25d987..53451e3 100644
>> --- a/meta/recipes-graphics/directfb/directfb_1.7.6.bb
>> +++ b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
>> @@ -1,21 +1,82 @@
>> -require directfb.inc
>> +SUMMARY =3D "Graphics abstraction library for the Linux Framebuffer Dev=
ice"
>> +DESCRIPTION =3D "DirectFB is a thin library that provides developers \
>> +with hardware graphics acceleration, input device handling and \
>> +abstraction, an integrated windowing system with support for \
>> +translucent windows and multiple display layers on top of the \
>> +Linux framebuffer device."
>> +HOMEPAGE =3D "http://directfb.org"
>> +SECTION =3D "libs"
>> +LICENSE =3D "LGPLv2.1"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddcf3c825659e82539645da41a790=
8589"
>> +
>> +DEPENDS =3D "jpeg libpng freetype zlib tslib sysfsutils"
>>
>> RV =3D "1.7-6"
>>
>> -DEPENDS +=3D "sysfsutils"
>> +SRC_URI =3D "http://www.directfb.org/downloads/Core/DirectFB-1.7/Direct=
FB-${PV}.tar.gz \
>> +           file://configurefix.patch \
>> +           file://fusion.patch"
>> +
>> +SRC_URI[md5sum] =3D "8a7bb06b3f58599b230b4cf314004512"
>> +SRC_URI[sha256sum] =3D "44f32bacfb842ea234599532f8481fe41b5bd2310d2bd10=
1508eb3a5df26c9e1"
>> +
>> +S =3D "${WORKDIR}/DirectFB-${PV}"
>> +
>> +LDFLAGS_append =3D" -lts -lm"
>> +
>> +BINCONFIG =3D "${bindir}/directfb-config"
>> +
>> +inherit autotools binconfig-disabled pkgconfig
>> +
>> +PACKAGECONFIG ??=3D ""
>> +PACKAGECONFIG[jpeg2000] =3D "--enable-jpeg2000,--disable-jpeg2000,jaspe=
r"
>> +PACKAGECONFIG[drmkms] =3D "--enable-drmkms,--disable-drmkms,libdrm"
>> +PACKAGECONFIG[tiff] =3D "--enable-tiff,--disable-tiff,tiff"
>> +PACKAGECONFIG[webp] =3D "--enable-webp,--disable-webp,libwebp"
>>
>> EXTRA_OECONF =3D "\
>> +  --with-gfxdrivers=3Dnone \
>>   --enable-freetype=3Dyes \
>>   --enable-zlib \
>> -  --with-gfxdrivers=3Dnone \
>> +  --disable-imlib2 \
>> +  --disable-mesa \
>>   --disable-sdl \
>>   --disable-vnc \
>>   --disable-x11 \
>> -  --disable-imlib2 \
>> -  --disable-mesa \
>> "
>>
>> LEAD_SONAME =3D "libdirectfb-1.7.so.0"
>>
>> -SRC_URI[md5sum] =3D "8a7bb06b3f58599b230b4cf314004512"
>> -SRC_URI[sha256sum] =3D "44f32bacfb842ea234599532f8481fe41b5bd2310d2bd10=
1508eb3a5df26c9e1"
>> +#Once -fno-omit-frame-pointer option of gcc is added into TARGET_CLFAGS=
 as default
>> +#this will cause directfb build failure on x86 arch, so filter out it.
>> +TARGET_CFLAGS_x86 :=3D "${@oe_filter_out('-fno-omit-frame-pointer', '${=
TARGET_CFLAGS}', d)}"
>> +
>> +#PACKAGES_DYNAMIC +=3D "^directfb-inputdrivers-.*"
>> +#
>> +#python populate_packages_prepend () {
>> +#    inputdrivers_libdir =3D d.expand('${libdir}/directfb-${RV}/inputdr=
ivers')
>> +#    do_split_packages(d, inputdrivers_libdir, '*.so$', 'directfb-input=
drivers-%s', 'Directfb plugin for %s')
>> +#}
>> +
>> +# NOTE: monolithic packaging for now, should improve that eventually
>> +
>> +FILES_${PN}-dbg +=3D "\
>> +  ${libdir}/directfb-${RV}/*/*/.debug/*.so \
>> +  ${libdir}/directfb-${RV}/*/.debug/*.so \
>> +"
>> +
>> +FILES_${PN}-dev +=3D "\
>> +  ${bindir}/directfb-config \
>> +  ${libdir}/directfb-${RV}/systems/*.la \
>> +  ${libdir}/directfb-${RV}/inputdrivers/*.la \
>> +  ${libdir}/directfb-${RV}/interfaces/*/*.la \
>> +  ${libdir}/directfb-${RV}/wm/*.la \
>> +"
>> +
>> +FILES_${PN} +=3D "\
>> +  ${libdir}/directfb-${RV}/systems/*.so \
>> +  ${libdir}/directfb-${RV}/inputdrivers/*.so \
>> +  ${libdir}/directfb-${RV}/interfaces/*/*.so \
>> +  ${libdir}/directfb-${RV}/wm/*.so \
>> +  ${datadir}/directfb-${PV} \
>> +"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

