Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKN7j-0001V7-23
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 07:13:20 +0100
Received: by mail-pa0-f54.google.com with SMTP id fa10so1428554pad.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 22:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=bPtqvgwMbLtJZQnW/VNuJuD+cT+s8G7ogZsrAqIoSiQ=;
	b=GwOBn4McBNGZGJNPFpPtcZVOAvnpeTGlOgqWqFgF2eaPi2O3yfx+D32+nTBKbM3Di3
	HvWs+Q0ikB4/fvgRIRyyDewQi3KQuc6Ha+So9qIiU0bu3Fs8L9xAToKbmAZrAFj3uYxn
	KH7nKRTj/X/NPrza7Q/b794/9U3H7h9+UTtRiZjd0US+rp1MEpNc9abukhJzPWcaFuX6
	DgVtyoSGUKUk6ji63E9CkxlTJhcNtvS3eCaSs6c4O9eVjXZ2/qeaUdLH1aWTLHlPVqzj
	Kqi0Sl1XizYqpiyJiigGpoDXlyuLskykbSlkSK89ghlpS35y/ISeO+JR2102zESr7E1K
	kuuw==
X-Received: by 10.68.25.138 with SMTP id c10mr21754513pbg.133.1364277342862;
	Mon, 25 Mar 2013 22:55:42 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id ti8sm16202400pbc.12.2013.03.25.22.55.40
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 22:55:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1363099754-3396-1-git-send-email-stefan@herbrechtsmeier.net>
Date: Mon, 25 Mar 2013 22:55:39 -0700
Message-Id: <2F386A63-6910-492E-B8A8-986FE6FA3906@gmail.com>
References: <1362674233-7210-1-git-send-email-stefan@herbrechtsmeier.net>
	<1363099754-3396-1-git-send-email-stefan@herbrechtsmeier.net>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Add real native support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 06:14:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 12, 2013, at 7:49 AM, Stefan Herbrechtsmeier =
<stefan@herbrechtsmeier.net> wrote:

> The current boost recipe only creates the bjam build tool during
> a native run and thereby is not usable for other native recipes
> that depend on a boost library. Use instead the bjam build tool
> from the do_boostconfig task and add real native support to the
> boost recipe. Additionally remove the boost-native from DEPENDS.
>=20
> Keep the installation of the native bjam build tool for backward
> compatibility.
>=20
> Native compilation of bzip2 isn't working and therefore disabled.
>=20

would it be possible to have an independent bjam-native ?
I was wondering if there were other recipes needing bjam
could benefit. Now that bjam is removed from staging, this
could cause other recipes which could have been using
it unknowingly to fail. Although that in itself is a problem.

> Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
> ---
> meta/recipes-support/boost/boost.inc       |   37 =
++++++----------------------
> meta/recipes-support/boost/boost_1.53.0.bb |    2 +
> 2 files changed, 10 insertions(+), 29 deletions(-)
>=20
> diff --git a/meta/recipes-support/boost/boost.inc =
b/meta/recipes-support/boost/boost.inc
> index 1266666..eaba3a2 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -6,8 +6,7 @@
> DESCRIPTION =3D "Free peer-reviewed portable C++ source libraries"
> HOMEPAGE =3D "http://www.boost.org/"
> SECTION =3D "libs"
> -DEPENDS =3D "boost-native zlib bzip2"
> -DEPENDS_class-native =3D ""
> +DEPENDS =3D "zlib bzip2"
> LICENSE =3D "BSL-1.0 & MIT & Python-2.0"
>=20
> ARM_INSTRUCTION_SET =3D "arm"
> @@ -126,6 +125,8 @@ BJAM_OPTS    =3D '${PARALLEL_MAKE} \
> 		--disable-icu \
> 		${BJAM_EXTRA}'
>=20
> +# Native compilation of bzip2 isn't working
> +BJAM_OPTS_append_class-native =3D ' -sNO_BZIP2=3D1'
>=20
> do_boostconfig() {
> 	cp -f boost/config/platform/linux.hpp =
boost/config/platform/linux-gnueabi.hpp
> @@ -146,7 +147,7 @@ addtask do_boostconfig after do_patch before =
do_configure
>=20
> do_compile() {
> 	set -ex
> -	bjam ${BJAM_OPTS} --prefix=3D${prefix} \
> +	./bjam ${BJAM_OPTS} --prefix=3D${prefix} \
> 		--exec-prefix=3D${exec_prefix} \
> 		--libdir=3D${libdir} \
> 		--includedir=3D${includedir}
> @@ -154,7 +155,7 @@ do_compile() {
>=20
> do_install() {
> 	set -ex
> -	bjam ${BJAM_OPTS} \
> +	./bjam ${BJAM_OPTS} \
> 		--libdir=3D${D}${libdir} \
> 		--includedir=3D${D}${includedir} \
> 		install
> @@ -171,29 +172,7 @@ do_install() {
>=20
> BBCLASSEXTEND =3D "native"
>=20
> -do_configure_class-native() {
> -	:
> +do_install_append_class-native() {
> +       install -d ${D}${bindir}/
> +       install -c -m 755 bjam ${D}${bindir}/
> }
> -
> -do_boostconfig_class-native() {
> -	:
> -}
> -
> -do_compile_class-native() {
> -	set -ex
> -	cd ${S}/tools/build/v2/engine
> -	rm -rf bin.*
> -	./build.sh gcc
> -}
> -
> -# This is too terrible - the build script doesn't give any good
> -# way I can see to find out where the binaries are placed, so
> -# rely on only one bin.foo directory being created.
> -do_install_class-native () {
> -	set -ex
> -	cd ${S}/tools/build/v2/engine
> -	install -d ${D}${bindir}/
> -	install -c -m 755 bin.*/bjam ${D}${bindir}/
> -}
> -
> -
> diff --git a/meta/recipes-support/boost/boost_1.53.0.bb =
b/meta/recipes-support/boost/boost_1.53.0.bb
> index de721c5..7527b25 100644
> --- a/meta/recipes-support/boost/boost_1.53.0.bb
> +++ b/meta/recipes-support/boost/boost_1.53.0.bb
> @@ -2,6 +2,8 @@ include boost.inc
>=20
> LIC_FILES_CHKSUM =3D =
"file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d31bef20d78c"
>=20
> +PR =3D "r1"
> +
> SRC_URI +=3D "file://arm-intrinsics.patch \
>            "
>=20
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



