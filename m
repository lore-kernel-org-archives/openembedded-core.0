Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 5D6F96F509
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 16:02:26 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0158.001; Mon, 26 May 2014 18:02:26 +0200
From: Tudor Florea <Tudor.Florea@enea.com>
To: Chong Lu <Chong.Lu@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] ethtool: fix ptest execution failure
Thread-Index: AQHPeMQiunfYV0IvckKjVN6PesQC5ptTBLeQ
Date: Mon, 26 May 2014 16:02:26 +0000
Message-ID: <26724FB0BFCB3D4C91BDE184751AA3A428A495A1@SESTOEX04.enea.se>
References: <cover.1401096040.git.Chong.Lu@windriver.com>
	<b381184d550cfdb6f044e9fde7660a69877708cc.1401096040.git.Chong.Lu@windriver.com>
In-Reply-To: <b381184d550cfdb6f044e9fde7660a69877708cc.1401096040.git.Chong.Lu@windriver.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.14.201]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] ethtool: fix ptest execution failure
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
X-List-Received-Date: Mon, 26 May 2014 16:02:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Chong Lu
> Sent: Monday, May 26, 2014 12:22
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1] ethtool: fix ptest execution failure
>=20
> Modify ptest suite to make it enabled on new version.
>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-extended/ethtool/ethtool/run-ptest |  2 +-
>  meta/recipes-extended/ethtool/ethtool_3.14.bb   | 16 ++++++++++------
>  2 files changed, 11 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-extended/ethtool/ethtool/run-ptest
> b/meta/recipes-extended/ethtool/ethtool/run-ptest
> index 1e245da..a359387 100644
> --- a/meta/recipes-extended/ethtool/ethtool/run-ptest
> +++ b/meta/recipes-extended/ethtool/ethtool/run-ptest
> @@ -1,2 +1,2 @@
>  #!/bin/sh
> -make -k runtest-TESTS
> +make -k check-TESTS
> diff --git a/meta/recipes-extended/ethtool/ethtool_3.14.bb
> b/meta/recipes-extended/ethtool/ethtool_3.14.bb
> index 2a3ca70..9729f65 100644
> --- a/meta/recipes-extended/ethtool/ethtool_3.14.bb
> +++ b/meta/recipes-extended/ethtool/ethtool_3.14.bb
> @@ -13,16 +13,20 @@ SRC_URI[md5sum] =3D
> "997e20c25c43ad5800f8ae3204455a8a"
>  SRC_URI[sha256sum] =3D
> "b1a988d6e397bd9d5d73cfd64329f85121936a050174bbfe90f8701fd893a1df"
>=20
>  inherit autotools ptest
> -RDEPENDS_${PN}-ptest +=3D "make"
> +RDEPENDS_${PN}-ptest +=3D "make bash gawk"

Isn't possible to avoid bash and gawk dependency here?
Regards,
  Tudor

>=20
>  do_compile_ptest() {
>     oe_runmake test-cmdline test-features
>  }
>=20
>  do_install_ptest () {
> -   cp ${B}/Makefile                 ${D}${PTEST_PATH}
> -   install ${B}/test-cmdline        ${D}${PTEST_PATH}
> -   install ${B}/test-features       ${D}${PTEST_PATH}
> -   install ${B}/ethtool             ${D}${PTEST_PATH}/ethtool
> -   sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/Makefile
> +   for i in Makefile test-cmdline test-features; do \
> +       install ${B}/$i ${D}${PTEST_PATH}; done
> +   install ${S}/test-driver ${D}${PTEST_PATH}
> +   sed -e 's/^Makefile/_Makefile/' \
> +       -e 's/^test_cmdline_OBJECTS/#test_cmdline_OBJECTS/' \
> +       -e 's/^test_features_OBJECTS/#test_features_OBJECTS/' \
> +       -e 's/^top_srcdir =3D \(.*\)/top_srcdir =3D ./' \
> +       -e '/^all:/,+1d' \
> +       -i ${D}${PTEST_PATH}/Makefile
>  }
> --
> 1.8.1.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

