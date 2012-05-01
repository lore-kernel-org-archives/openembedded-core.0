Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPJQg-0005VZ-7W
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 22:12:10 +0200
Received: by qabg1 with SMTP id g1so2607001qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=SmmnNrHRSvibwepPDI+BsJ7QDwVqbVzkuw2D5/z89uo=;
	b=NagJ5+qtUbx9cA0/PsQt8ljBCpAFBIkyaOrXJ53ZPodJwheyFK3rc5agXSaq6y1qv7
	Uv6NPdaAfzbLzY3GrN7xO2agbME7ziif2vBuVS3lAl5i4gHHe1k48j6G1rvXhRg5v9sX
	SXpfcbMojxlh+5KR97/EaCduON34ibNZdlR0EmgnyjschdbZ//LbksWM/JoDibTBY0Xn
	KzuCM5rzKvGtJMz+L/TF744oo3bhf5anX0XQJd4WN1e83Els3hRtv6Y8jo/vR/SEOKyC
	VdpdYhGBiMeB2hkfGl6xlZoAxX9RZeJ/Sy8j637udUgp9iJHLPcZyAwy9IN8STBMupH5
	Prig==
Received: by 10.229.105.85 with SMTP id s21mr6598439qco.10.1335902546302; Tue,
	01 May 2012 13:02:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Tue, 1 May 2012 13:02:06 -0700 (PDT)
In-Reply-To: <CABcZANk66qm4X=7+HOJsc+mkeGX0BmA=Zf49WaHZpnuiTuFz-g@mail.gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
	<7f53932a2701014255382dd2990858b1cfb28c3b.1335887732.git.kergoth@gmail.com>
	<CAMKF1sozSeO2aDcjBy7oQaXS1b17DFFbkQ_gocaCyrQQKBKUSA@mail.gmail.com>
	<CABcZANk66qm4X=7+HOJsc+mkeGX0BmA=Zf49WaHZpnuiTuFz-g@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 1 May 2012 13:02:06 -0700
X-Google-Sender-Auth: zMTEFgoDcpX59TLlbgbUaSeslYI
Message-ID: <CABcZAN=2XbNYB9QjybbHbyse16cMcXdw2zUHzwfb6oJC-xBcxA@mail.gmail.com>
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
X-List-Received-Date: Tue, 01 May 2012 20:12:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 1, 2012 at 10:54 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, May 1, 2012 at 10:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, May 1, 2012 at 8:58 AM, Christopher Larson <kergoth@gmail.com> w=
rote:
>>> Signed-off-by: Christopher Larson <kergoth@gmail.com>
>>> ---
>>> =C2=A0meta/recipes-core/meta/external-csl-toolchain.bb | =C2=A0 55 ++++=
+++++++-----------
>>> =C2=A01 files changed, 27 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/re=
cipes-core/meta/external-csl-toolchain.bb
>>> index fb553ab..a14e958 100644
>>> --- a/meta/recipes-core/meta/external-csl-toolchain.bb
>>> +++ b/meta/recipes-core/meta/external-csl-toolchain.bb
>>> @@ -24,36 +24,40 @@ PROVIDES +=3D "\
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0virtual/linux-libc-headers \
>>> =C2=A0"
>>> =C2=A0PV =3D "${CSL_VER_MAIN}"
>>> -PR =3D "r3"
>>> +PR =3D "r5"
>>>
>>> =C2=A0#SRC_URI =3D "http://www.codesourcery.com/public/gnu_toolchain/${=
CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
>>>
>>> =C2=A0SRC_URI =3D "file://SUPPORTED"
>>>
>>> =C2=A0do_install() {
>>> - =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir} ${D}${bindir} ${D}$=
{sbindir} ${D}${base_bindir} ${D}${libdir}
>>> - =C2=A0 =C2=A0 =C2=A0 install -d ${D}${base_libdir} ${D}${base_sbindir=
} ${D}${datadir} ${D}/usr
>>> + =C2=A0 =C2=A0 =C2=A0 # Use optimized files if available
>>> + =C2=A0 =C2=A0 =C2=A0 sysroot=3D"${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SY=
S}/libc"
>>> + =C2=A0 =C2=A0 =C2=A0 if [ -d $sysroot/${CSL_TARGET_CORE} ]; then
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysroot=3D"$sysroot/=
${CSL_TARGET_CORE}"
>>> + =C2=A0 =C2=A0 =C2=A0 fi
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot${base_libdir}/. ${D}${base_libdir=
}
>>> + =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot/etc/. ${D}${sysconfdir}
>>> + =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot/sbin/. ${D}${base_sbindir}
>>>
>>> - =C2=A0 =C2=A0 =C2=A0 if [ -d ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/=
libc/${CSL_TARGET_CORE} ]; then
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOO=
LCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/lib/. =C2=A0${D}${base_li=
bdir}
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOO=
LCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/etc/. =C2=A0${D}${sysconf=
dir}
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOO=
LCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/sbin/. ${D}${base_sbindir=
}
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -e ${EXTERNAL=
_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/include ]; then
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/usr/include =C2=
=A0${D}/usr/
>>> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}/usr
>>> + =C2=A0 =C2=A0 =C2=A0 for usr_element in bin libexec sbin share ${base=
_libdir}; do
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usr_path=3D$sysroot/=
usr/$usr_element
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a $usr_path ${D}=
/usr/
>>> + =C2=A0 =C2=A0 =C2=A0 done
>>> + =C2=A0 =C2=A0 =C2=A0 for datadir_element in man info; do
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 datadir_path=3D$sysr=
oot/usr/$datadir_element
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e $datadir_pat=
h ]; then
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 cp -a $datadir_path ${D}${datadir}/
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOO=
LCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/. =C2=A0${D}/usr/
>>> - =C2=A0 =C2=A0 =C2=A0 else
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOO=
LCHAIN}/${CSL_TARGET_SYS}/libc/lib/. =C2=A0${D}${base_libdir}
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOO=
LCHAIN}/${CSL_TARGET_SYS}/libc/etc/. =C2=A0${D}${sysconfdir}
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOO=
LCHAIN}/${CSL_TARGET_SYS}/libc/sbin/. ${D}${base_sbindir}
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOO=
LCHAIN}/${CSL_TARGET_SYS}/libc/usr/. =C2=A0${D}/usr/
>>> - =C2=A0 =C2=A0 =C2=A0 fi
>>> + =C2=A0 =C2=A0 =C2=A0 done
>>>
>>> - =C2=A0 =C2=A0 =C2=A0 if [ -e ${D}${prefix}/info ]; then
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${prefix}/inf=
o ${D}${infodir}
>>> - =C2=A0 =C2=A0 =C2=A0 fi
>>> - =C2=A0 =C2=A0 =C2=A0 if [ -e ${D}${prefix}/man ]; then
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${prefix}/man=
 ${D}${mandir}
>>> + =C2=A0 =C2=A0 =C2=A0 # Some toolchains have headers under the core sp=
ecific area
>>> + =C2=A0 =C2=A0 =C2=A0 if [ -e $sysroot/usr/include ]; then
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot/usr/i=
nclude/. ${D}${includedir}
>>> + =C2=A0 =C2=A0 =C2=A0 else
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot/../us=
r/include/. ${D}${includedir}
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>>
>> can we avoid using /usr/ explicitly here
>
> If you change prefix, you *will* break things. The glibc in the
> external toolchain expects a particular layout. Changing that layout
> will break those expectations. I expect a better approach would be to
> use prefix and then add an explicit error if prefix is not /usr, but
> files copied will be identical either way.

I'll start work on another commit to apply after this series which does thi=
s.
--=20
Christopher Larson


