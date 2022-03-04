Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DAAC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 18:22:16 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.135.1646418134349408729
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 10:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=PFi0e4uP;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1646418134;
  x=1677954134;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xTcVSXlQR3BKB6/8uA3ATZjRPk7++2HwjScxFH93A4c=;
  b=PFi0e4uPQSWHJ2UeRiugyhXBRFu8UodWZOvoITM8moWVQm4BuS/DpUPT
   gSKkc8RXQlI76++XVoPKMKeUvp+DChG+eqxLGUnZ7IcyZASoNu3MLVVd+
   K+DsdqfJLalrwTgJs7D/xiGy4jHyIayAa4AIFGeipbRHoqKAY2+QGqnWb
   CVAzSP2VpdjAIKROxQ3aQW4aYft6pytFeFhddAYJkEuV5Ou2PBZGAQhIw
   W6cVJMtKfvtv1OKDzPNwT0LN0iclz573PVnG0ZKgEWe+YB2bjAJuuUOq4
   MZu3PQDvAAV4qkn+tezkfiTnUlRSMpf6R+xPaA8mUBEWdZBPbzacIYw/w
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "crg7475@mailbox.org" <crg7475@mailbox.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] libsdl2: Add libunwind-native to the
 libsdl2-native DEPENDS
Thread-Topic: [OE-core] [PATCH] libsdl2: Add libunwind-native to the
 libsdl2-native DEPENDS
Thread-Index: AQHYL51E9Irnt9ShtkmHM6785eenBqyviD3g
Date: Fri, 4 Mar 2022 18:20:57 +0000
Message-ID: <14bd2ef7889943f8b972fa612844e04c@axis.com>
References: <20220304075507.369779-1-crg7475@mailbox.org>
In-Reply-To: <20220304075507.369779-1-crg7475@mailbox.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 18:22:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162752

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Carlos Rafael Giani via lists.openembedded.or=
g
> Sent: den 4 mars 2022 08:55
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] libsdl2: Add libunwind-native to the libsdl2-n=
ative DEPENDS
>=20
> This fixes this CMake configuration error:
>=20
> | -- Checking for one of the modules 'libunwind'
> | CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-=
r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:8=
90 (message):
> |   None of the required 'libunwind' found
> | Call Stack (most recent call first):
> |   CMakeLists.txt:1367 (pkg_search_module)
>=20
> This error happens even if libunwind is installed complete with its C
> headers and development .so files (in Ubuntu, this means libunwind-dev
> is installed).
>=20
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.20.bb
> index 90724ab8b7..802efba980 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> @@ -27,6 +27,8 @@ SRC_URI[sha256sum] =3D
> "c56aba1d7b5b0e7e999e4a7698c70b63a3394ff9704b5f6e1c57e0c16f
>=20
>  inherit cmake lib_package binconfig-disabled pkgconfig
>=20
> +DEPENDS:class-native +=3D "libunwind-native"

The above should be:

DEPENDS:append:class-native =3D " libunwind-native"

However, why don't libsdl2 built for target and nativesdk=20
need to depend on libunwind? I.e., why isn't the above:

DEPENDS =3D "libunwind"

> +
>  BINCONFIG =3D "${bindir}/sdl2-config"
>=20
>  CVE_PRODUCT =3D "simple_directmedia_layer sdl"
> --
> 2.32.0

//Peter


