Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qcapn-00076q-5C
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 12:20:27 +0200
Received: by wyg30 with SMTP id 30so2372505wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 03:16:42 -0700 (PDT)
Received: by 10.227.57.148 with SMTP id c20mr2816684wbh.54.1309515402481;
	Fri, 01 Jul 2011 03:16:42 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb1sm2246640wbb.3.2011.07.01.03.16.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 03:16:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309511730.20015.514.camel@rex>
Date: Fri, 1 Jul 2011 12:16:35 +0200
Message-Id: <CECEE38A-48D1-4EE6-8AB4-A85E579D6BE8@dominion.thruhere.net>
References: <1309511730.20015.514.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: cairo: Clean up packaging and fix warnings
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
X-List-Received-Date: Fri, 01 Jul 2011 10:20:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul 2011, om 11:15 heeft Richard Purdie het volgende geschreven:

> There were a number of QA errors being reported when packaging cairo. =
This patch
> ensures the debug files go in the -dbg package, the .so development =
links go into
> the -dev package, .a files into -staticdev.
>=20
> It also switches back to relying on debian package naming for the =
library name.
> Since this is working correctly now the files are in the correct =
packages, we
> can simplify the recipe and there is no change in the resulting =
package names
> from a package feed perspective.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Tested-by: Koen Kooi <koen@dominion.thruhere.net>


> ---
> meta/recipes-graphics/cairo/cairo_1.10.2.bb |   30 =
+++++++-------------------
> 1 files changed, 8 insertions(+), 22 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/cairo/cairo_1.10.2.bb =
b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
> index 572e1f6..6047428 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.10.2.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
> @@ -9,21 +9,7 @@ SRC_URI =3D =
"http://cairographics.org/releases/cairo-${PV}.tar.gz"
> SRC_URI[md5sum] =3D "f101a9e88b783337b20b2e26dfd26d5f"
> SRC_URI[sha256sum] =3D =
"32018c7998358eebc2ad578ff8d8559d34fc80252095f110a572ed23d989fc41"
>=20
> -RDEPENDS_${PN} +=3D "libcairo2 libcairo-gobject2 =
libcairo-script-interpreter2 \
> -		  cairo-perf-utils"
> -
> -ALLOW_EMPTY =3D "1"
> -
> -#
> -# Old version (1.8.10 or below) is automatically named as libcairo2 =
by
> -# debian_package_name_hook. To keep backword compatibility,
> -# it is necessary to explicitly name the package as libcairo2 here
> -#
> -PACKAGES =3D+ "libcairo2 libcairo2-dev libcairo2-dbg \
> -		     libcairo-gobject2 \
> -			 libcairo-script-interpreter2 \
> -		     cairo-perf-utils \
> -			"
> +PACKAGES =3D+ "libcairo-gobject2 libcairo-script-interpreter2 =
cairo-perf-utils"
>=20
> SUMMARY_libcairo2 =3D "The Cairo 2D vector graphics library"
> DESCRIPTION_libcairo2 =3D "Cairo is a multi-platform library providing =
anti-aliased \
> @@ -44,10 +30,10 @@ to replay rendering."
>=20
> DESCRIPTION_cairo-perf-utils =3D "The Cairo library performance =
utilities"
>=20
> -FILES_libcairo2 =3D "${libdir}/libcairo.so*"
> -FILES_libcairo2-dev =3D "${includedir} ${libdir}/*.la ${libdir}/*.a \
> -					   ${libdir}/*.o =
${libdir}/pkgconfig"
> -FILES_libcairo2-dbg =3D "${libdir}/.debug ${libdir}/cairo/.debug"
> -FILES_libcairo-gobject2 =3D "${libdir}/libcairo-gobject.so*"
> -FILES_libcairo-script-interpreter2 =3D =
"${libdir}/libcairo-script-interpreter.so*"
> -FILES_cairo-perf-utils =3D "${bindir}/cairo-trace =
${libdir}/cairo/libcairo-trace.*"
> +FILES_${PN} =3D "${libdir}/libcairo.so.*"
> +FILES_${PN}-dev +=3D "${libdir}/cairo/*.la ${libdir}/cairo/*.so"
> +FILES_${PN}-dbg +=3D "${libdir}/cairo/.debug"
> +FILES_${PN}-staticdev +=3D "${libdir}/cairo/*.a"
> +FILES_libcairo-gobject2 =3D "${libdir}/libcairo-gobject.so.*"
> +FILES_libcairo-script-interpreter2 =3D =
"${libdir}/libcairo-script-interpreter.so.*"
> +FILES_cairo-perf-utils =3D "${bindir}/cairo-trace =
${libdir}/cairo/libcairo-trace.so.*"
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



