Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF6D78EC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 09:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4E86718070;
	Wed, 15 Aug 2018 11:36:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id UEC--O-aYsox; Wed, 15 Aug 2018 11:36:40 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id D7C091806E;
	Wed, 15 Aug 2018 11:36:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9F111E101;
	Wed, 15 Aug 2018 11:36:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD7011E0FF;
	Wed, 15 Aug 2018 11:36:40 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 15 Aug 2018 11:36:40 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id A0873112;
	Wed, 15 Aug 2018 11:36:40 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 15 Aug 2018 11:36:40 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Wed, 15 Aug 2018 11:36:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] rpm: remove depend on dbus for rpm native
Thread-Index: AQHUNHnQXQLP6Txq7k2marQG+rpUH6TAi9xw
Date: Wed, 15 Aug 2018 09:36:40 +0000
Message-ID: <c40ec17d551d49a0a59a3cfa43dad6b5@XBOX02.axis.com>
References: <1534325070-446684-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1534325070-446684-1-git-send-email-changqing.li@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] rpm: remove depend on dbus for rpm native
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
X-List-Received-Date: Wed, 15 Aug 2018 09:36:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of
> changqing.li@windriver.com
> Sent: den 15 augusti 2018 11:25
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] rpm: remove depend on dbus for rpm native
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> This depend cause a big problem that for one package,
> build enviroment for clean compile and second time compile
> are different. And also rpm-native actually don't need to
> depend on dbus, so remove it.
>=20
> Take libfastjson as example:
> (libfastjson don't have autoconf-archive-native in DEPEND)
> if don't remove this dependency, it will have below dependency list:
> libfastjson -> gcc-runtime -> libgcc -> glibc -> linux-libc-headers ->
> rpm-native
> rpm-native -> dbus-native
> dbus-native -> autoconf-archive-native
>=20
> in this way:
> do_package of libfastjson will depend on do_populate_sysroot
> of autoconf-archive-native
>=20
> for clean compile:
> during do_configure, since do_package not executed,  so .m4 files
> provide by autoconf-archive-native will not under
> recipe_sysroot_native,
>=20
> for second time configure:
> .m4 already copy under recipe_sysroot_native when run do_package last
> time
>=20
> so if there is code related .m4 of autoconf-archive-native in the
> configure.ac
> there will be differences and may cause problem.
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/rpm/rpm_4.14.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-
> devtools/rpm/rpm_4.14.1.bb
> index e5e87d3..91617a4 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
> @@ -52,6 +52,7 @@ S =3D "${WORKDIR}/git"
>=20
>=20
>  DEPENDS =3D "nss libarchive db file popt xz bzip2 dbus elfutils python3"
>  DEPENDS_append_class-native =3D " file-replacement-native bzip2-replacem=
ent-native"
> +DEPENDS_remove_class-native =3D "dbus"

Using _remove should be avoided in recipes since it is very=20
hard to override it in a bbappend or .conf file. So I suggest=20
this instead:

DEPENDS =3D "nss libarchive db file popt xz bzip2 elfutils python3"
DEPENDS_append_class-target =3D " dbus"
DEPENDS_append_class-native =3D " file-replacement-native bzip2-replacement=
-native"

>=20
>  inherit autotools gettext pkgconfig python3native
>  export PYTHON_ABI
> --
> 2.7.4

//Peter


