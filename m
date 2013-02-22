Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U8tT2-00034c-FM for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 15:19:16 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1ME9dNq013698; Fri, 22 Feb 2013 14:09:39 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Y9g2Y5ZBWl5x; Fri, 22 Feb 2013 14:09:39 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1ME9SNj013694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Feb 2013 14:09:34 GMT
Message-ID: <1361541751.9309.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
Date: Fri, 22 Feb 2013 06:02:31 -0800
In-Reply-To: <1361279644-17675-3-git-send-email-bjst@enea.com>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
	<1361279644-17675-3-git-send-email-bjst@enea.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r1ME9dNq013698
Cc: Anders Roxell <anders.roxell@enea.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] zlib: Add ptest
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
X-List-Received-Date: Fri, 22 Feb 2013 14:19:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-02-19 at 14:13 +0100, Bj=C3=B6rn Stenberg wrote:
> From: Anders Roxell <anders.roxell@enea.com>
>=20
> Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
> Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> ---
>  .../zlib/zlib-1.2.7/Makefile-runtests.patch        |   38 ++++++++++++=
++++++++
>  meta/recipes-core/zlib/zlib-1.2.7/run-ptest        |    7 ++++
>  meta/recipes-core/zlib/zlib_1.2.7.bb               |   22 +++++++++++
>  3 files changed, 67 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-core/zlib/zlib-1.2.7/Makefile-runtests=
.patch
>  create mode 100644 meta/recipes-core/zlib/zlib-1.2.7/run-ptest
>=20
> diff --git a/meta/recipes-core/zlib/zlib-1.2.7/Makefile-runtests.patch =
b/meta/recipes-core/zlib/zlib-1.2.7/Makefile-runtests.patch
> new file mode 100644
> index 0000000..04c55b4
> --- /dev/null
> +++ b/meta/recipes-core/zlib/zlib-1.2.7/Makefile-runtests.patch
> @@ -0,0 +1,38 @@
> +Add 'ptest' target to Makefile, to run tests without checking dependen=
cies.
> +
> +Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> +Upstream-Status: Pending
> +---
> +diff -uNr a/Makefile.in b/Makefile.in
> +--- a/Makefile.in	2012-04-23 07:58:06.000000000 +0200
> ++++ b/Makefile.in	2012-10-24 08:24:19.822544837 +0200
> +@@ -83,6 +83,9 @@
> + test: all teststatic testshared
> +=20
> + teststatic: static
> ++	@make runteststatic
> ++
> ++runteststatic:
> + 	@TMPST=3D`mktemp fooXXXXXX`; \
> + 	if echo hello world | ./minigzip | ./minigzip -d && ./example $$TMPS=
T ; then \
> + 	  echo '		*** zlib test OK ***'; \
> +@@ -92,6 +95,9 @@
> + 	rm -f $$TMPST
> +=20
> + testshared: shared
> ++	@make runtestshared
> ++
> ++runtestshared:
> + 	@LD_LIBRARY_PATH=3D`pwd`:$(LD_LIBRARY_PATH) ; export LD_LIBRARY_PATH=
; \
> + 	LD_LIBRARYN32_PATH=3D`pwd`:$(LD_LIBRARYN32_PATH) ; export LD_LIBRARY=
N32_PATH; \
> + 	DYLD_LIBRARY_PATH=3D`pwd`:$(DYLD_LIBRARY_PATH) ; export DYLD_LIBRARY=
_PATH; \
> +@@ -105,6 +111,9 @@
> + 	rm -f $$TMPSH
> +=20
> + test64: all64
> ++	@make runtest64
> ++
> ++runtest64:
> + 	@TMP64=3D`mktemp fooXXXXXX`; \
> + 	if echo hello world | ./minigzip64 | ./minigzip64 -d && ./example64 =
$$TMP64; then \
> + 	  echo '		*** zlib 64-bit test OK ***'; \
> diff --git a/meta/recipes-core/zlib/zlib-1.2.7/run-ptest b/meta/recipes=
-core/zlib/zlib-1.2.7/run-ptest
> new file mode 100644
> index 0000000..19d9632
> --- /dev/null
> +++ b/meta/recipes-core/zlib/zlib-1.2.7/run-ptest
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +FILE=3Dzlib-ptest-$$.log
> +make -k runteststatic runtestshared > $FILE
> +sed -i -r -e 's/^(\s+\*+ (.+?) test OK \*+)/\1\nPASS: \2/' $FILE
> +sed -i -r -e 's/^(\s+\*+ (.+?) test FAILED \*+)/\1\nFAIL: \2/' $FILE
> +cat $FILE
> +rm -f $FILE
> diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb b/meta/recipes-core/z=
lib/zlib_1.2.7.bb
> index 803fec3..61380ec 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.7.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
> @@ -8,20 +8,42 @@ LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D4;end=
line=3D23;md5=3D94d1b5a40dadd127f33
> =20
>  SRC_URI =3D "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
>             file://remove.ldconfig.call.patch \
> +           file://Makefile-runtests.patch \
> +           file://run-ptest \
>             "
>  SRC_URI[md5sum] =3D "2ab442d169156f34c379c968f3f482dd"
>  SRC_URI[sha256sum] =3D "49e2e9658dfb036900da6ea0267a737fa3c4eee6666776=
d378c79d52e9334934"
> =20
> +RDEPENDS_${PN}-ptest +=3D "make"
> +RDEPENDS_${PN}-ptest_virtclass-native =3D ""
> +RDEPENDS_${PN}-ptest_virtclass-nativesdk =3D ""

The above scares me. Why? This is going to make packaging of zlib
dependent on the packaging of make, due to the way our packaging works.
This means zlib will force make to get built. I need to confirmation at
this point that if ptest isn't enabled, this dependency isn't used.

I also wonder if the make dependency itself isn't best left against the
main ptest-runner script itself rather and each ptest package.

I'd like to protect build performance a bit if I can help it.

> +FILES_${PN}-dbg +=3D "${PTEST_PATH}/.debug"

Is this needed after the other fix?

Cheers,

Richard



