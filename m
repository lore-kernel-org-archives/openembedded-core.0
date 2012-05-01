Received: from mail-qa0-f48.google.com ([209.85.216.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPHQl-00034W-16
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 20:04:07 +0200
Received: by qady23 with SMTP id y23so2660733qad.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 10:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=SKkR5dsLHU8rVd/Pkm7YceYbIOkAljI2LVSjQbI3BZU=;
	b=xTdBm/w7Gr04FwyX2B/bP1or/r24AHsVa3b7ANuRXoD+0AmxlG3IsdZgZqfDbyicUu
	X4qZm7B01tJ7tl+sUp3ru9VnXj5mT9Xc5zb99H5Ldu2IMhWtV/+CynEYqVDyxGMmO7gI
	2CuacyDQa+1/IVMGz0sFCwayuH55lkpDDxyElCV1Bxn+BYhEk5tz2oVf4kWFhP+z7cqX
	Tpa2LGToIRw7GZ/oBRxTjUhnoLUB7hrzTDY+11EPpUXX0E5QBlmdh3RLV+PLzKu44e0x
	kvHxvHzhyJy9MKXqg6BQ89tvLt1ESQ0qBLSCFofT8k4/8jIihQKwwia3EzBqhoQGRLzb
	Ilnw==
Received: by 10.224.185.204 with SMTP id cp12mr16871013qab.42.1335894863321;
	Tue, 01 May 2012 10:54:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Tue, 1 May 2012 10:54:03 -0700 (PDT)
In-Reply-To: <CAMKF1sozSeO2aDcjBy7oQaXS1b17DFFbkQ_gocaCyrQQKBKUSA@mail.gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
	<7f53932a2701014255382dd2990858b1cfb28c3b.1335887732.git.kergoth@gmail.com>
	<CAMKF1sozSeO2aDcjBy7oQaXS1b17DFFbkQ_gocaCyrQQKBKUSA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 1 May 2012 10:54:03 -0700
X-Google-Sender-Auth: Nrl6YKrOQ0ITSokvsWXI19_0b8Q
Message-ID: <CABcZANk66qm4X=7+HOJsc+mkeGX0BmA=Zf49WaHZpnuiTuFz-g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] external-csl-toolchain: cleanup, simplify, use base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2012 18:04:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 1, 2012 at 10:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 1, 2012 at 8:58 AM, Christopher Larson <kergoth@gmail.com> wr=
ote:
>> Signed-off-by: Christopher Larson <kergoth@gmail.com>
>> ---
>> =C2=A0meta/recipes-core/meta/external-csl-toolchain.bb | =C2=A0 55 +++++=
++++++-----------
>> =C2=A01 files changed, 27 insertions(+), 28 deletions(-)
>>
>> diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/rec=
ipes-core/meta/external-csl-toolchain.bb
>> index fb553ab..a14e958 100644
>> --- a/meta/recipes-core/meta/external-csl-toolchain.bb
>> +++ b/meta/recipes-core/meta/external-csl-toolchain.bb
>> @@ -24,36 +24,40 @@ PROVIDES +=3D "\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0virtual/linux-libc-headers \
>> =C2=A0"
>> =C2=A0PV =3D "${CSL_VER_MAIN}"
>> -PR =3D "r3"
>> +PR =3D "r5"
>>
>> =C2=A0#SRC_URI =3D "http://www.codesourcery.com/public/gnu_toolchain/${C=
SL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
>>
>> =C2=A0SRC_URI =3D "file://SUPPORTED"
>>
>> =C2=A0do_install() {
>> - =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir} ${D}${bindir} ${D}${=
sbindir} ${D}${base_bindir} ${D}${libdir}
>> - =C2=A0 =C2=A0 =C2=A0 install -d ${D}${base_libdir} ${D}${base_sbindir}=
 ${D}${datadir} ${D}/usr
>> + =C2=A0 =C2=A0 =C2=A0 # Use optimized files if available
>> + =C2=A0 =C2=A0 =C2=A0 sysroot=3D"${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS=
}/libc"
>> + =C2=A0 =C2=A0 =C2=A0 if [ -d $sysroot/${CSL_TARGET_CORE} ]; then
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysroot=3D"$sysroot/$=
{CSL_TARGET_CORE}"
>> + =C2=A0 =C2=A0 =C2=A0 fi
>> +
>> + =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot${base_libdir}/. ${D}${base_libdir}
>> + =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot/etc/. ${D}${sysconfdir}
>> + =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot/sbin/. ${D}${base_sbindir}
>>
>> - =C2=A0 =C2=A0 =C2=A0 if [ -d ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/l=
ibc/${CSL_TARGET_CORE} ]; then
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOL=
CHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/lib/. =C2=A0${D}${base_lib=
dir}
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOL=
CHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/etc/. =C2=A0${D}${sysconfd=
ir}
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOL=
CHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/sbin/. ${D}${base_sbindir}
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -e ${EXTERNAL_=
TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/include ]; then
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/usr/include =C2=
=A0${D}/usr/
>> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}/usr
>> + =C2=A0 =C2=A0 =C2=A0 for usr_element in bin libexec sbin share ${base_=
libdir}; do
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usr_path=3D$sysroot/u=
sr/$usr_element
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a $usr_path ${D}/=
usr/
>> + =C2=A0 =C2=A0 =C2=A0 done
>> + =C2=A0 =C2=A0 =C2=A0 for datadir_element in man info; do
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 datadir_path=3D$sysro=
ot/usr/$datadir_element
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e $datadir_path=
 ]; then
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cp -a $datadir_path ${D}${datadir}/
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOL=
CHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/. =C2=A0${D}/usr/
>> - =C2=A0 =C2=A0 =C2=A0 else
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOL=
CHAIN}/${CSL_TARGET_SYS}/libc/lib/. =C2=A0${D}${base_libdir}
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOL=
CHAIN}/${CSL_TARGET_SYS}/libc/etc/. =C2=A0${D}${sysconfdir}
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOL=
CHAIN}/${CSL_TARGET_SYS}/libc/sbin/. ${D}${base_sbindir}
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOL=
CHAIN}/${CSL_TARGET_SYS}/libc/usr/. =C2=A0${D}/usr/
>> - =C2=A0 =C2=A0 =C2=A0 fi
>> + =C2=A0 =C2=A0 =C2=A0 done
>>
>> - =C2=A0 =C2=A0 =C2=A0 if [ -e ${D}${prefix}/info ]; then
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${prefix}/info=
 ${D}${infodir}
>> - =C2=A0 =C2=A0 =C2=A0 fi
>> - =C2=A0 =C2=A0 =C2=A0 if [ -e ${D}${prefix}/man ]; then
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${prefix}/man =
${D}${mandir}
>> + =C2=A0 =C2=A0 =C2=A0 # Some toolchains have headers under the core spe=
cific area
>> + =C2=A0 =C2=A0 =C2=A0 if [ -e $sysroot/usr/include ]; then
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot/usr/in=
clude/. ${D}${includedir}
>> + =C2=A0 =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot/../usr=
/include/. ${D}${includedir}
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>
> can we avoid using /usr/ explicitly here

If you change prefix, you *will* break things. The glibc in the
external toolchain expects a particular layout. Changing that layout
will break those expectations. I expect a better approach would be to
use prefix and then add an explicit error if prefix is not /usr, but
files copied will be identical either way.
--=20
Christopher Larson


