Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgXGK-0008O2-BG
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 09:20:08 +0200
Received: by wwi14 with SMTP id 14so2791240wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 00:16:11 -0700 (PDT)
Received: by 10.216.58.210 with SMTP id q60mr3962486wec.58.1310454971561;
	Tue, 12 Jul 2011 00:16:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z83sm4429968weq.44.2011.07.12.00.16.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 00:16:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <f5be3f07f8372f657d248c739a666cf25fff06a4.1310425837.git.sgw@linux.intel.com>
Date: Tue, 12 Jul 2011 09:16:08 +0200
Message-Id: <917F1944-E900-4DD8-8A44-FB1F3AB9F330@dominion.thruhere.net>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<f5be3f07f8372f657d248c739a666cf25fff06a4.1310425837.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 14/26] tcp-wrappers: Use bitbake default FILES for packaging
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
X-List-Received-Date: Tue, 12 Jul 2011 07:20:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:

> This will ensure correct -dev and -staticdev packging
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> .../tcp-wrappers/tcp-wrappers_7.6.bb               |   17 =
++++++++++-------
> 1 files changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb =
b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> index 1aeb9ff..1acb15a 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> @@ -5,13 +5,16 @@ SECTION =3D "console/network"
>=20
> LICENSE =3D "tcp-wrappers"
> LIC_FILES_CHKSUM =3D =
"file://DISCLAIMER;md5=3D071bd69cb78b18888ea5e3da5c3127fa"
> -PR =3D"r0"
> +PR =3D"r1"
>=20
>=20
> -PACKAGES =3D "${PN}-dbg libwrap libwrap-doc libwrap-dev tcp-wrappers =
tcp-wrappers-doc"
> -FILES_libwrap =3D "${base_libdir}/lib*.so.*"

base_libdir

> +PACKAGES =3D "${PN}-dbg libwrap libwrap-doc libwrap-dev =
libwrap-staticdev \
> +            tcp-wrappers tcp-wrappers-doc"
> +FILES_libwrap =3D "${base_libdir}/lib*${SOLIBS}

base_libdir, so far, so good

> FILES_libwrap-doc =3D "${mandir}/man3 ${mandir}/man5"
> -FILES_libwrap-dev =3D "${libdir}/lib*.so ${libdir}/lib*.a =
${includedir}"
> +FILES_libwrap-dev =3D "${libdir}/lib*${SOLIBSDEV} ${includedir}"

libdir

> +FILES_libwrap-staticdev =3D "${libdir}/lib*.a"

libdir

> +RDEPENDS_libwrap-staticdev =3D "libwrap-dev (=3D ${EXTENDPKGV})"
> FILES_tcp-wrappers =3D "${bindir}"
> FILES_tcp-wrappers-doc =3D "${mandir}/man8"
>=20
> @@ -86,9 +89,9 @@ do_install () {
> 	oe_libinstall -C shared -so libwrap ${D}${base_libdir}
>=20
> 	rel_lib_prefix=3D`echo ${libdir} | sed =
's,\(^/\|\)[^/][^/]*,..,g'`
> -	libname=3D`readlink ${D}${base_libdir}/libwrap.so | xargs =
basename`
> -	ln -s ${rel_lib_prefix}${base_libdir}/${libname} =
${D}${libdir}/libwrap.so
> -	rm -f ${D}${base_libdir}/libwrap.so
> +	libname=3D`readlink ${D}${base_libdir}/libwrap${SOLIBSDEV} | =
xargs basename`
> +	ln -s ${rel_lib_prefix}${base_libdir}/${libname} =
${D}${libdir}/libwrap${SOLIBSDEV}
> +	rm -f ${D}${base_libdir}/libwrap${SOLIBSDEV}

And here some bits get moved between base_libdir and libdir, what is it =
trying to do?=


