Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.18834.1621257598524071841
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 06:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=JsGwSeor;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1621257599;
  x=1652793599;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=vVDtsPs76zA7kkKdE3aYRCHSrUeeNRZsVRsopxIiCuw=;
  b=JsGwSeorOG7Ba1WY0dY97MswVa4j90oNdu1PEKS1CyHb1SEYlaku7KtG
   jHpz105DLC3BqWZOrozOim9+psLa18WUYebSo9Rtwf3GhlFj/ZWharGeu
   jdGVo16xOW5uulS1+/+m8gNF22KL7uhjb2m3eXDlyFKuEyVOXgpzOqXNj
   QvsW5Bv2DNzzB17HW3pm6u+vhM55GO9nEKG/HD49GVln93Y5L4eK0vTHC
   5zJTwyoiY2xBSpQQK7jdBCyjDr4UnCOtbcBua1LlaUmU8bzY9xFihxEnw
   ZLWCCOpNAzxdwtdd2Qj2rruoSN/05Is4sdCFVh3XuuAkUZe8fr4m9VjEW
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Ross Burton <ross@burtonini.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] rpm: turn Berkeley DB hard dependency into PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH 1/2] rpm: turn Berkeley DB hard dependency into
 PACKAGECONFIG
Thread-Index: AQHXSxPzjSdqd0hqjUu9o4AA6c3rcarnqDKA
Date: Mon, 17 May 2021 13:19:56 +0000
Message-ID: <fb1a23790e924d578b88b266fe7f8135@XBOX03.axis.com>
References: <20210517115803.866262-1-ross.burton@arm.com>
In-Reply-To: <20210517115803.866262-1-ross.burton@arm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ross Burton
> Sent: den 17 maj 2021 13:58
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] rpm: turn Berkeley DB hard dependency into=
 PACKAGECONFIG
>=20
> In the future we hope to switch to sqlite instead of Berkeley DB, so
> prepare for this by adding an (enabled by default) PACKAGECONFIG for
> Berkeley DB.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/rpm/rpm_4.16.1.3.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-dev=
tools/rpm/rpm_4.16.1.3.bb
> index 2857cd730c4..2baa23944e6 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> @@ -51,7 +51,7 @@ S =3D "${WORKDIR}/git"
>  # included in 4.16.1.3
>  CVE_CHECK_WHIETLIST +=3D "CVE-2021-20271"
>=20
> -DEPENDS =3D "libgcrypt db file popt xz bzip2 elfutils python3"
> +DEPENDS =3D "libgcrypt file popt xz bzip2 elfutils python3"
>  DEPENDS_append_class-native =3D " file-replacement-native bzip2-replacem=
ent-native"
>=20
>  inherit autotools gettext pkgconfig python3native
> @@ -74,7 +74,7 @@ EXTRA_OECONF_append_class-nativesdk =3D " --
> sysconfdir=3D/etc --disable-plugins"
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
>=20
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'inhibit', '', d)}"
> +PACKAGECONFIG ??=3D "bdb ${@bb.utils.contains('DISTRO_FEATURES', 'system=
d', 'inhibit', '', d)}"
>  # The inhibit plugin serves no purpose outside of the target
>  PACKAGECONFIG_remove_class-native =3D "inhibit"
>  PACKAGECONFIG_remove_class-nativesdk =3D "inhibit"
> @@ -82,6 +82,7 @@ PACKAGECONFIG_remove_class-nativesdk =3D "inhibit"
>  PACKAGECONFIG[imaevm] =3D "--with-imaevm,,ima-evm-utils"
>  PACKAGECONFIG[inhibit] =3D "--enable-inhibit-plugin,--disable-inhibit-pl=
ugin,dbus"
>  PACKAGECONFIG[rpm2archive] =3D "--with-archive,--without-archive,libarch=
ive"
> +PACKAGECONFIG[bdb] =3D "--enable-bdb,--disable-bdb,db"

Please keep the PACKAGECONFIGs sorted.

>=20
>  ASNEEDED =3D ""
>=20
> --
> 2.25.1

//Peter
