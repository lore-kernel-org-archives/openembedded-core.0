Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id B33767D2AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 09:26:14 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x339QENf020241
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 3 Apr 2019 11:26:14 +0200
Received: from DEFTHW99ERLMSX.ww902.siemens.net
	(defthw99erlmsx.ww902.siemens.net [139.22.70.136])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id x339Q8eq025885
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 3 Apr 2019 11:26:14 +0200
Received: from DEFTHW99ER1MSX.ww902.siemens.net (139.22.70.71) by
	DEFTHW99ERLMSX.ww902.siemens.net (139.22.70.136) with Microsoft SMTP
	Server (TLS) id 14.3.435.0; Wed, 3 Apr 2019 11:26:13 +0200
Received: from DENBGAT9EL2MSX.ww902.siemens.net ([169.254.9.89]) by
	DEFTHW99ER1MSX.ww902.siemens.net ([139.22.70.71]) with mapi id
	14.03.0435.000; Wed, 3 Apr 2019 11:26:12 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Nathan Rossi <nathan@nathanrossi.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 1/3] cmake-native: Enable ccmake by
	default and	depend on ncurses
Thread-Index: AQHU6d9SEYPxQGgYaUaxmBytgzXMaaYqKpFA
Date: Wed, 3 Apr 2019 09:26:11 +0000
Message-ID: <355BE46A91031048906B695426A8D8E62EA2ECD4@DENBGAT9EL2MSX.ww902.siemens.net>
References: <20190403053702.10672-1-nathan@nathanrossi.com>
In-Reply-To: <20190403053702.10672-1-nathan@nathanrossi.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.21]
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] cmake-native: Enable ccmake by default and	depend on ncurses
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
X-List-Received-Date: Wed, 03 Apr 2019 09:26:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>=20
> Enable the building of the curses based ui for cmake. This depends on
> ncurses.

I think this is acceptable. It might also be useful for people wanting to u=
se ccmake inside an SDK.

> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
> This patch suggests enabling this in the cmake-native recipe, however thi=
s
> might be undesirable for bootstrapping reasons. Whilst ccmake is not used
> normally the added dependency on ncurses is likely required for other par=
ts
> of the build so impact on build ordering and time should be relatively
> minimal.
>=20
> Changes in v2:
> - None
> ---
>  meta/recipes-devtools/cmake/cmake-native_3.14.0.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> index fedcf3d4bd..b2952ee5f5 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> @@ -1,7 +1,7 @@
>  require cmake.inc
>  inherit native
>=20
> -DEPENDS +=3D "bzip2-replacement-native expat-native xz-native zlib-nativ=
e
> curl-native"
> +DEPENDS +=3D "bzip2-replacement-native expat-native xz-native zlib-nativ=
e
> curl-native ncurses-native"
>=20
>  SRC_URI +=3D "file://OEToolchainConfig.cmake \
>              file://environment.d-cmake.sh \ @@ -13,10 +13,9 @@ SRC_URI +=
=3D
> "file://OEToolchainConfig.cmake \  B =3D "${WORKDIR}/build"
>  do_configure[cleandirs] =3D "${B}"
>=20
> -# Disable ccmake since we don't depend on ncurses  CMAKE_EXTRACONF =3D
> "\
>      -DCMAKE_LIBRARY_PATH=3D${STAGING_LIBDIR_NATIVE} \
> -    -DBUILD_CursesDialog=3D0 \
> +    -DBUILD_CursesDialog=3D1 \
>      -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 \
>      -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=3D0 \
>      -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D0 \
> ---
> 2.20.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

