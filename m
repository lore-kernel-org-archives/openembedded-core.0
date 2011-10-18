Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGFq5-00004q-5V
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 22:00:41 +0200
Received: by eyd9 with SMTP id 9so947546eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 12:54:51 -0700 (PDT)
Received: by 10.14.4.15 with SMTP id 15mr480498eei.245.1318967689902;
	Tue, 18 Oct 2011 12:54:49 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id t14sm8943151eeh.7.2011.10.18.12.54.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 12:54:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318966354-9188-1-git-send-email-cliff.brake@gmail.com>
Date: Tue, 18 Oct 2011 21:54:43 +0200
Message-Id: <1AE11CCC-207A-4634-BFBB-E17671ADBA96@dominion.thruhere.net>
References: <1318966354-9188-1-git-send-email-cliff.brake@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: Re: [PATCH] squashfs-tools: add recipe
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
X-List-Received-Date: Tue, 18 Oct 2011 20:00:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The entries in this recipe are all over the place, could you run it =
through the oe-stylize.py in meta-openembedded/contrib? That should give =
you an idea on what goes where. The general rule of thumb:

1) things belonging to the same task are grouped together =
(RDEPENDS/FILES/pkg_postinst)
2) ordering follows task ordering, fetch, patch, configure, package, =
deploy, etc

regards,

Koen

Op 18 okt. 2011, om 21:32 heeft Cliff Brake het volgende geschreven:

> From: Cliff Brake <cbrake@bec-systems.com>
>=20
> ---
> .../squashfs-tools/squashfs-tools_4.2.bb           |   42 =
++++++++++++++++++++
> 1 files changed, 42 insertions(+), 0 deletions(-)
> create mode 100644 =
meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
>=20
> diff --git =
a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb =
b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
> new file mode 100644
> index 0000000..18a6a66
> --- /dev/null
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
> @@ -0,0 +1,42 @@
> +DESCRIPTION =3D "Squashfs is a highly compressed read-only filesystem =
for Linux."
> +SECTION =3D "base"
> +LICENSE =3D "GPLv2 & Public Domain"
> +DEPENDS =3D "attr zlib"
> +
> +PR =3D "0"
> +
> +BBCLASSEXTEND =3D "native"
> +NATIVE_INSTALL_WORKS =3D "1"
> +
> +# required to share same place with -lzma specific packages
> +FILESPATHPKG =3D. "squashfs-tools-${PV}:"
> +
> +SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=3Dsquashfs \
> +           =
http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=3Dlzma \
> +          "
> +
> +LIC_FILES_CHKSUM =3D =
"file://../COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
> +                    =
file://../../7zC.txt;beginline=3D12;endline=3D16;md5=3D2056cd6d919ebc38076=
02143c7449a7c \
> +                   "
> +
> +S =3D "${WORKDIR}/squashfs${PV}/squashfs-tools"
> +
> +do_compile() {
> +	oe_runmake mksquashfs
> +}
> +
> +do_install () {
> +	install -d ${D}${sbindir}
> +	install -m 0755 mksquashfs ${D}${sbindir}/
> +}
> +
> +# EXTRA_OEMAKE is typically: -e MAKEFLAGS=3D
> +# the -e causes problems as CFLAGS is modified in the Makefile, so=20
> +# we redefine EXTRA_OEMAKE here
> +EXTRA_OEMAKE =3D "MAKEFLAGS=3D LZMA_SUPPORT=3D1 LZMA_DIR=3D../.."
> +
> +SRC_URI[squashfs.md5sum] =3D "1b7a781fb4cf8938842279bd3e8ee852"
> +SRC_URI[squashfs.sha256sum] =3D =
"d9e0195aa922dbb665ed322b9aaa96e04a476ee650f39bbeadb0d00b24022e96"
> +SRC_URI[lzma.md5sum] =3D "29d5ffd03a5a3e51aef6a74e9eafb759"
> +SRC_URI[lzma.sha256sum] =3D =
"c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
> +
> --=20
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



