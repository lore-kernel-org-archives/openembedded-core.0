Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.9838.1618583294747755635
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Apr 2021 07:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.194, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from macbook-air.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1316C40003;
	Fri, 16 Apr 2021 14:28:11 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH 2/3] btrfs-tools: Add PACKAGECONFIG options
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
In-Reply-To: <CAJ86T=VARprmYY1mPKa7uG0pNpzpdJXBXu_-PYtBPvDRaZqohQ@mail.gmail.com>
Date: Fri, 16 Apr 2021 07:28:09 -0700
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-Id: <BF8F342D-3299-4781-8468-6C987F1703C0@redrectangle.org>
References: <20210416053729.1021506-1-robert.joslyn@redrectangle.org>
 <20210416053729.1021506-2-robert.joslyn@redrectangle.org>
 <CAJ86T=VARprmYY1mPKa7uG0pNpzpdJXBXu_-PYtBPvDRaZqohQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Apr 16, 2021, at 12:17 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> On Thu, Apr 15, 2021 at 10:38 PM Robert Joslyn
> <robert.joslyn@redrectangle.org> wrote:
>>=20
>> Add options to make it easier to control which features are enabled. Al=
l
>> of these default to enabled by upstream, so keep them enabled to
>> maintain previous behavior.
>>=20
>> The convert option also supports reiserfs, but no recipes exist in the
>> layer index. Limit the option to ext filesystems until someone cares
>> enough to make reiserfs recipes.
>>=20
>> Remove acl and attr from DEPENDS, as they do not apper to be needed. Ad=
d
>> zlib since it is required.
>>=20
>> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
>> ---
>> .../btrfs-tools/btrfs-tools_5.11.1.bb         | 26 ++++++++++++++++---
>> 1 file changed, 23 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb b/=
meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
>> index 2ab476a88e..b875ea1aa1 100644
>> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
>> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
>> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
>>     file://libbtrfsutil/COPYING.LESSER;md5=3D3000208d539ec061b899bce1d9=
ce9404 \
>> "
>> SECTION =3D "base"
>> -DEPENDS =3D "util-linux attr e2fsprogs lzo acl"
>> +DEPENDS =3D "lzo util-linux zlib"
>> DEPENDS_append_class-target =3D " udev"
>> RDEPENDS_${PN} =3D "libgcc"
>>=20
>> @@ -22,17 +22,37 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/ker=
nel/git/kdave/btrfs-progs.git \
>>            file://0001-Add-a-possibility-to-specify-where-python-module=
s-ar.patch \
>>            "
>>=20
>> -PACKAGECONFIG ??=3D "python"
>> +PACKAGECONFIG ??=3D " \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \
>=20
> The largefile distro feature is for historical reference only. Recipes
> should always enable largefile support regardless of the distro
> feature (which will eventually be removed).

Is it worth making it a PACKAGECONFIG at all, or is it preferred to just s=
et =E2=80=94enable-largefile in EXTRA_OECONF? The upstream configure script=
 does enable this by default so it=E2=80=99s not strictly needed at all eit=
her, but I usually prefer to be more explicit with configure options (as yo=
u can probably tell with this patch!).

>=20
>> +    backtrace \
>> +    programs \
>> +    shared \
>> +    convert \
>> +    python \
>> +    crypto-builtin \
>=20
> This is not conventional formatting for a list of PACKAGECONFIG
> options. Maybe have a look at some other recipes in oe-core to get a
> feel for the typical style.

I=E2=80=99m not sure what you mean. Would you prefer them on one line rath=
er than split? In a specific order? There seems to be a lot of different st=
yles in use, so I tried to follow the OE style guide, which suggests splitt=
ing lists like this, but maybe I=E2=80=99m misunderstanding.

>=20
>> +"
>> +PACKAGECONFIG[largefile] =3D "--enable-largefile,--disable-largefile"
>> +PACKAGECONFIG[backtrace] =3D "--enable-backtrace,--disable-backtrace"
>> PACKAGECONFIG[manpages] =3D "--enable-documentation, --disable-document=
ation, asciidoc-native xmlto-native"
>> +PACKAGECONFIG[programs] =3D "--enable-programs,--disable-programs"
>> +PACKAGECONFIG[shared] =3D "--enable-shared,--disable-shared"
>> +PACKAGECONFIG[static] =3D "--enable-static,--disable-static"
>=20
> The choice to build shared and/or static libs is not something which
> is typically controlled by PACKAGECONFIG options.

Some recipes do use PACKAGECONFIG, such as ffmpeg, but in grepping the rep=
o it seems more common to use EXTRA_OECONF. Is there a reason not to use PA=
CKAGECONFIG here? Just that building the static libraries is uncommon? I do=
n=E2=80=99t mind changing it, just curious.

>=20
>> +PACKAGECONFIG[convert] =3D "--enable-convert --with-convert=3Dext2,--d=
isable-convert --without-convert,e2fsprogs"
>> PACKAGECONFIG[python] =3D "--enable-python,--disable-python,python3-set=
uptools-native"
>> PACKAGECONFIG[zstd] =3D "--enable-zstd,--disable-zstd,zstd"
>>=20
>> +# Pick only one crypto provider
>> +PACKAGECONFIG[crypto-builtin] =3D "--with-crypto=3Dbuiltin"
>> +PACKAGECONFIG[crypto-libgcrypt] =3D "--with-crypto=3Dlibgcrypt,,libgcr=
ypt"
>> +PACKAGECONFIG[crypto-libsodium] =3D "--with-crypto=3Dlibsodium,,libsod=
ium"
>> +PACKAGECONFIG[crypto-libkcapi] =3D "--with-crypto=3Dlibkcapi,,libkcapi=
"
>> +
>> inherit autotools-brokensep pkgconfig manpages
>> inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'distutils3-bas=
e', '', d)}
>>=20
>> CLEANBROKEN =3D "1"
>>=20
>> -EXTRA_OECONF_append_libc-musl =3D " --disable-backtrace "
>> +PACKAGECONFIG_remove_libc-musl =3D "backtrace"
>=20
> Use of _remove in core recipes is discouraged.

I wasn=E2=80=99t sure the best way to handle this. I can put it back the w=
ay it was, where the configure script enables the feature by default and it=
=
=E2=80=99s disabled only for musl. I could keep the packagconfig and appen=
d only for glibc:
PACKAGECONFIG_append_libc-glibc =3D =E2=80=9C backtrace=E2=80=9D
I could also disable the feature by default. I do disable this in my produ=
ct layer, but I don=E2=80=99t know if that is a good default.

Thanks for the review!

Robert

>=20
>> EXTRA_PYTHON_CFLAGS =3D "${DEBUG_PREFIX_MAP}"
>> EXTRA_PYTHON_CFLAGS_class-native =3D ""
>> EXTRA_PYTHON_LDFLAGS =3D "${LDFLAGS}"
>> --
>> 2.26.3
>>=20
>>=20
>>=20
>>=20
>=20
>=20

