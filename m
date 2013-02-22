Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U8tW4-0003Dk-FQ for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 15:22:25 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1MECpbw013945; Fri, 22 Feb 2013 14:12:51 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lXxuDlzmhQG5; Fri, 22 Feb 2013 14:12:51 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1MECf4W013920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Feb 2013 14:12:47 GMT
Message-ID: <1361541944.9309.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
Date: Fri, 22 Feb 2013 06:05:44 -0800
In-Reply-To: <1361279644-17675-8-git-send-email-bjst@enea.com>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
	<1361279644-17675-8-git-send-email-bjst@enea.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r1MECpbw013945
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] openssl: Add ptest
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
X-List-Received-Date: Fri, 22 Feb 2013 14:22:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-02-19 at 14:14 +0100, Bj=C3=B6rn Stenberg wrote:
> Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
> ---
>  .../openssl/openssl-1.0.0j/Makefiles-ptest.patch   |   74 ++++++++++++=
++++++++
>  .../openssl/openssl-1.0.0j/run-ptest               |    2 +
>  meta/recipes-connectivity/openssl/openssl.inc      |   19 +++++-
>  .../recipes-connectivity/openssl/openssl_1.0.0j.bb |    2 +
>  4 files changed, 96 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0j/Ma=
kefiles-ptest.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0j/ru=
n-ptest
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/Makefiles=
-ptest.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/Makefiles=
-ptest.patch
> new file mode 100644
> index 0000000..e65f17b
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl-1.0.0j/Makefiles-ptest.=
patch
> @@ -0,0 +1,74 @@
> +Add 'buildtest' and 'runtest' targets to Makefile, to build and run te=
sts
> +cross-compiled.
> +
> +Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> +Upstream-Status: Pending
> +---
> +diff -uNr a/Makefile b/Makefile
> +--- a/Makefile.org	2012-05-10 17:06:02.000000000 +0200
> ++++ b/Makefile.org	2012-10-27 00:05:55.359424024 +0200
> +@@ -411,8 +411,16 @@
> + test:   tests
> +=20
> + tests: rehash
> ++	$(MAKE) buildtest
> ++	$(MAKE) runtest
> ++
> ++buildtest:
> ++	@(cd test && \
> ++	$(CLEARENV) && $(MAKE) -e $(BUILDENV) TOP=3D.. TESTS=3D'$(TESTS)' OP=
ENSSL_DEBUG_MEMORY=3Don OPENSSL_CONF=3D../apps/openssl.cnf exe apps);
> ++
> ++runtest:
> + 	@(cd test && echo "testing..." && \
> +-	$(CLEARENV) && $(MAKE) -e $(BUILDENV) TOP=3D.. TESTS=3D'$(TESTS)' OP=
ENSSL_DEBUG_MEMORY=3Don OPENSSL_CONF=3D../apps/openssl.cnf tests );
> ++	$(CLEARENV) && $(MAKE) -e $(BUILDENV) TOP=3D.. TESTS=3D'$(TESTS)' OP=
ENSSL_DEBUG_MEMORY=3Don OPENSSL_CONF=3D../apps/openssl.cnf alltests );
> + 	OPENSSL_CONF=3Dapps/openssl.cnf util/opensslwrap.sh version -a
> +=20
> + report:
> +diff --git a/test/Makefile b/test/Makefile
> +index 3912f82..1696767 100644
> +--- a/test/Makefile
> ++++ b/test/Makefile
> +@@ -128,7 +128,7 @@ tests:	exe apps $(TESTS)
> + apps:
> + 	@(cd ..; $(MAKE) DIRS=3Dapps all)
> +=20
> +-alltests: \
> ++all-tests=3D \
> + 	test_des test_idea test_sha test_md4 test_md5 test_hmac \
> + 	test_md2 test_mdc2 test_wp \
> + 	test_rmd test_rc2 test_rc4 test_rc5 test_bf test_cast test_aes \
> +@@ -138,6 +138,11 @@ alltests: \
> + 	test_ss test_ca test_engine test_evp test_ssl test_tsa test_ige \
> + 	test_jpake test_cms
> +=20
> ++alltests:
> ++	@(for i in $(all-tests); do \
> ++	( $(MAKE) $$i && echo "PASS: $$i" ) || echo "FAIL: $$i"; \
> ++	done)
> ++
> + test_evp:
> + 	../util/shlib_wrap.sh ./$(EVPTEST) evptests.txt
> +=20
> +@@ -203,7 +208,7 @@ test_x509:
> + 	echo test second x509v3 certificate
> + 	sh ./tx509 v3-cert2.pem 2>/dev/null
> +=20
> +-test_rsa: $(RSATEST)$(EXE_EXT)
> ++test_rsa:
> + 	@sh ./trsa 2>/dev/null
> + 	../util/shlib_wrap.sh ./$(RSATEST)
> +=20
> +@@ -298,11 +303,11 @@ test_tsa:
> + 	  sh ./testtsa; \
> + 	fi
> +=20
> +-test_ige: $(IGETEST)$(EXE_EXT)
> ++test_ige:
> + 	@echo "Test IGE mode"
> + 	../util/shlib_wrap.sh ./$(IGETEST)
> +=20
> +-test_jpake: $(JPAKETEST)$(EXE_EXT)
> ++test_jpake:
> + 	@echo "Test JPAKE"
> + 	../util/shlib_wrap.sh ./$(JPAKETEST)
> diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/run-ptest=
 b/meta/recipes-connectivity/openssl/openssl-1.0.0j/run-ptest
> new file mode 100644
> index 0000000..3b20fce
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl-1.0.0j/run-ptest
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +make -k runtest
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recip=
es-connectivity/openssl/openssl.inc
> index e1e7b65..62acf95 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -33,7 +33,7 @@ export DIRS =3D "crypto ssl apps"
>  export EX_LIBS =3D "-lgcc -ldl"
>  export AS =3D "${CC} -c"
> =20
> -inherit pkgconfig siteinfo
> +inherit pkgconfig siteinfo ptest
> =20
>  PACKAGES =3D+ "libcrypto libssl ${PN}-misc"
>  FILES_libcrypto =3D "${base_libdir}/libcrypto${SOLIBS}"
> @@ -42,6 +42,8 @@ FILES_${PN} =3D+ " ${libdir}/ssl/*"
>  FILES_${PN}-misc =3D "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
>  FILES_${PN}-dev +=3D "${base_libdir}/libcrypto${SOLIBSDEV}"
> =20
> +RDEPENDS_${PN}-ptest =3D "openssl-misc"
> +
>  do_configure_prepend_darwin () {
>  	sed -i -e '/version-script=3Dopenssl\.ld/d' Configure
>  }
> @@ -125,6 +127,9 @@ do_configure () {
> =20
>  do_compile () {
>  	oe_runmake
> +	if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ] ; then
> +	    oe_runmake buildtest
> +	fi
>  }

Final comment for now is these if checks are annoying and likely plain
wrong. I think you're trying to avoid the -native case, if so, just set
PTEST_ENABLED =3D 0 in native.bbclass and maybe nativesdk.bbclass
(although it would probably work there). How is this expected to work in
the multilib case?=20

Cheers,

Richard



