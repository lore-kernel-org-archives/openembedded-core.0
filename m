Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2662B79926
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 16:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8613518544;
	Fri, 21 Sep 2018 18:41:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id VjI-SwRGRldZ; Fri, 21 Sep 2018 18:41:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 059DA1842F;
	Fri, 21 Sep 2018 18:41:50 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1E4C1A2E5;
	Fri, 21 Sep 2018 18:41:50 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D51F11A2E3;
	Fri, 21 Sep 2018 18:41:50 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 21 Sep 2018 18:41:50 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id C8D023107;
	Fri, 21 Sep 2018 18:41:50 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 21 Sep 2018 18:41:50 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Fri, 21 Sep 2018 18:41:50 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mikko Rapeli <mikko.rapeli@bmw.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] openssl10: remove extra slash from libdir path
Thread-Index: AQHUUcSE07pHqVhT00WnKzSqpi0Gh6T67Kig
Date: Fri, 21 Sep 2018 16:41:50 +0000
Message-ID: <cff1f5c8f79f46dfa369c102d57d13b4@XBOX02.axis.com>
References: <1537545717-26570-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1537545717-26570-1-git-send-email-mikko.rapeli@bmw.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Michael Ho <michael.ho@bmw.de>, Thomas Witt <thomas.witt@bmw.de>
Subject: Re: [PATCH] openssl10: remove extra slash from libdir path
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
X-List-Received-Date: Fri, 21 Sep 2018 16:41:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Mikko Rapeli
> Sent: den 21 september 2018 18:02
> To: openembedded-core@lists.openembedded.org
> Cc: Michael Ho <michael.ho@bmw.de>; Thomas Witt <thomas.witt@bmw.de>
> Subject: [OE-core] [PATCH] openssl10: remove extra slash from libdir
> path
>=20
> The configure script ended up creating Makefile with
>=20
> LIBDIR=3D/lib
>=20
> which got leaked into various places including all
> pkg-config .pc files where lines like (note the
> double slash //):
>=20
> libdir=3D${exec_prefix}//lib
> ...
> Libs: -L${libdir} -lcrypto
>=20
> which causes pkg-config --libs to include the full absolute path
> to the recipe specific sysroot. This isn't a big problem
> until something like CMake projects start generating
> their own .cmake modules using this absolute path and exposing
> them to sysroots of other bitbake recipes thus escaping
> their recipe specific sysroots.
>=20
> Then the fun begins when these users of the .cmake module start
> to randomly fail builds with error messages like:
>=20
> /home/builder/src/base/build/tmp/work/corei7-64-linux/package/1.0-
> r0/recipe-sysroot-native/usr/bin/x86_64-linux/../../libexec/x86_64-
> linux/gcc/x86_64-linux/7.3.0/ld: cannot find /lib/libpthread.so.0
> /home/builder/src/base/build/tmp/work/corei7-64-linux/package/1.0-
> r0/recipe-sysroot-native/usr/bin/x86_64-linux/../../libexec/x86_64-
> linux/gcc/x86_64-linux/7.3.0/ld: cannot find
> /usr/lib/libpthread_nonshared.a
> collect2: error: ld returned 1 exit status
> ninja: build stopped: subcommand failed.
> WARNING: exit code 1 from a shell command.
>=20
> As luck has it, this problem goes away by recompiling the recipes
> alone but repeats with multiple recipes here and there when full
> images are build.
>=20
> A careful inspection of multi page linker command lines shows
> that some linker paramaters point to libraries in a different
> recipes sysroot than what bitbake was building when the task
> failed.
>=20
> So, fix is to remove this one extra slash from openssl
> library path configuration option. This changes openssl
> Makefile to have:
>=20
> LIBDIR=3Dlib
>=20
> and all users of LIBDIR variable in the Makefile are already
> adding slashes as path separators if that is needed.
>=20
> With this the generated .pc files have:
>=20
> libdir=3D${exec_prefix}/lib
>=20
> and pkg-config --libs knows to strip the already default
> sysroot path away.
>=20
> This then fixes the generated .cmake files to not include
> these absolute paths and fixes the random build failures
> when building images.
>=20
> Thanks to Thomas, Michael and Ross for debugging support!
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> Cc: Thomas Witt <thomas.witt@bmw.de>
> Cc: Michael Ho <michael.ho@bmw.de>
> Cc: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
> b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
> index b7297fc..f09782c 100644
> --- a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
> +++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
> @@ -191,7 +191,7 @@ do_configure () {
>  	if [ "x$useprefix" =3D "x" ]; then
>  		useprefix=3D/
>  	fi
> -	libdirleaf=3D"$(echo ${libdir} | sed s:$useprefix::)"
> +	libdirleaf=3D"$( basename "${libdir}" )"

You are making assumptions about the value of ${libdir} here.
May I suggest the following instead (just in case someone has=20
defined libdir as ${prefix}/foo/lib):

	libdirleaf=3D"$(echo ${libdir} | sed s:^$useprefix/*::)"

>  	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} shared --pre=
fix=3D$useprefix --openssldir=3D${libdir}/ssl --libdir=3D$libdirleaf $targe=
t
>  }
>=20
> --
> 1.9.1

//Peter


