Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UeT1i-0005IQ-Q5
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 18:33:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 20 May 2013 09:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,707,1363158000"; d="scan'208";a="337084701"
Received: from unknown (HELO helios.localnet) ([10.255.12.168])
	by fmsmga001.fm.intel.com with ESMTP; 20 May 2013 09:14:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Mon, 20 May 2013 17:14:08 +0100
Message-ID: <2288145.mduqYWGKLk@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1368746922-6279-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368746922-6279-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt: fix warning -Wunused-local-typedefs introduced by gcc 4.8
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
X-List-Received-Date: Mon, 20 May 2013 16:33:54 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday 17 May 2013 01:28:42 Andreas M=FCller wrote:
> in meta-oe maliit-framework failed with
>=20
> | In file included from
> | /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/include/qt4/QtC=
ore/Qt
> | Core:53:0,|=20
> |                  from ../utils/core-utils.cpp:18:
> | /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/include/qt4/QtC=
ore/qtc
> | oncurrentfilter.h: In function 'QtConcurrent::ThreadEngineStarter<v=
oid>
> | QtConcurrent::filterInternal(Sequence&, KeepFunctor, Redu
> | /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/include/qt4/QtC=
ore/qt
> | concurrentfilter.h:108:47: error: typedef 'Iterator' locally define=
d but
> | not used [-Werror=3Dunused-local-typedefs]|=20
> |      typedef typename Sequence::const_iterator Iterator;
> |     =20
> |                                                ^
> |=20
> | cc1plus: all warnings being treated as errors
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-qt/qt4/qt4-4.8.4.inc                  |    1 +
>  ...emove-unnecessary-typedef-found-by-gcc4-8.patch |   37
> ++++++++++++++++++++ meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb       =
   | =20
>  2 +-
>  meta/recipes-qt/qt4/qt4-native.inc                 |    3 +-
>  meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb          |    2 +-
>  5 files changed, 42 insertions(+), 3 deletions(-)
>  create mode 100644
> meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found-b=
y-gcc4
> -8.patch
>=20
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.4.inc
> b/meta/recipes-qt/qt4/qt4-4.8.4.inc index 3f0f003..965b617 100644
> --- a/meta/recipes-qt/qt4/qt4-4.8.4.inc
> +++ b/meta/recipes-qt/qt4/qt4-4.8.4.inc
> @@ -24,6 +24,7 @@ SRC_URI =3D
> "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-s=
r
> file://0022-ssl-certificates-blacklist-mis-issued-turktrust-certifica=
tes.pa
> tch \ file://0023-qtnetwork-blacklist-two-more-certificates.patch \
> file://0024-Change-all-shmget-calls-to-user-only-memory.patch \ +    =
     =20
> file://0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch \
> file://g++.conf \
>             file://linux.conf \
>             "
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found=
-by-gc
> c4-8.patch
> b/meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found=
-by-gc
> c4-8.patch new file mode 100644
> index 0000000..498f14f
> --- /dev/null
> +++
> b/meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found=
-by-gc
> c4-8.patch @@ -0,0 +1,37 @@
> +From https://codereview.qt-project.org/p/qt/qt
> + * branch            refs/changes/22/53322/2 -> FETCH_HEAD
> +From 28524b867ee8c9784f00eec0f07e4d9491a651b8 Mon Sep 17 00:00:00 20=
01
> +From: Thiago Macieira <thiago.macieira@intel.com>
> +Date: Tue, 9 Apr 2013 16:41:23 -0700
> +Subject: [PATCH] Remove unnecessary typedef, found by GCC 4.8
> +
> +qtconcurrentfilter.h:108:47: warning: typedef 'Iterator' locally def=
ined
> but not used [-Wunused-local-typedefs] +
> +Qt5 commit: d4c241a98059edaa7a4b15beb1cfd16ed041284e (qtbase)
> +Task-number: QTBUG-30594
> +Change-Id: Icc69e41c2d4e11962f0c8434236d4847b46e7d9d
> +
> +Upstream-Status: Pending for 4.8.5 [1]
> +
> +[1] https://codereview.qt-project.org/#change,53322
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + src/corelib/concurrent/qtconcurrentfilter.h |    1 -
> + 1 files changed, 0 insertions(+), 1 deletions(-)
> +
> +diff --git a/src/corelib/concurrent/qtconcurrentfilter.h
> b/src/corelib/concurrent/qtconcurrentfilter.h +index 50b58bd..5a70182=

> 100644
> +--- a/src/corelib/concurrent/qtconcurrentfilter.h
> ++++ b/src/corelib/concurrent/qtconcurrentfilter.h
> +@@ -105,7 +105,6 @@ namespace QtConcurrent {
> + template <typename Sequence, typename KeepFunctor, typename ReduceF=
unctor>
> + ThreadEngineStarter<void> filterInternal(Sequence &sequence, KeepFu=
nctor
> keep, ReduceFunctor reduce) + {
> +-    typedef typename Sequence::const_iterator Iterator;
> +     typedef FilterKernel<Sequence, KeepFunctor, ReduceFunctor> Kern=
elType;
> +     return startThreadEngine(new KernelType(sequence, keep, reduce)=
); + }
> +--
> +1.7.4.4
> +
> diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
> b/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb index 286da95..c08927e 10=
0644
> --- a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
> +++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
> @@ -1,7 +1,7 @@
>  require qt4-${PV}.inc
>  require qt4-embedded.inc
>=20
> -PR =3D "${INC_PR}.3"
> +PR =3D "${INC_PR}.4"
>=20
>  QT_CONFIG_FLAGS_append_arm =3D "${@bb.utils.contains("TUNE_FEATURES"=
, "neon",
> "", " -no-neon" ,d)}"
>=20
> diff --git a/meta/recipes-qt/qt4/qt4-native.inc
> b/meta/recipes-qt/qt4/qt4-native.inc index 7645232..59c8ab5 100644
> --- a/meta/recipes-qt/qt4/qt4-native.inc
> +++ b/meta/recipes-qt/qt4/qt4-native.inc
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.LGPL;md5=3Dfbc093901857fcd118f065f900982c24 \
> file://LICENSE.GPL3;md5=3D6e1694ee338db410417517884918d4d2 \
> file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6"
>=20
> -INC_PR =3D "r19"
> +INC_PR =3D "r20"
>=20
>  inherit native
>=20
> @@ -18,6 +18,7 @@ SRC_URI =3D
> "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-s=
r
> file://0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch \
> file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
> file://0021-configure-make-qt4-native-work-with-long-building-pa.patc=
h \ +=20
>          file://0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch=
 \
> file://g++.conf \
>             file://linux.conf \
>  =09"
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
> b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb index e5db30d..d6edef9 10=
0644
> --- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
> +++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
> @@ -1,7 +1,7 @@
>  require qt4-x11-free.inc
>  require qt4-${PV}.inc
>=20
> -PR =3D "${INC_PR}.3"
> +PR =3D "${INC_PR}.4"
>=20
>  QT_CONFIG_FLAGS_append_arm =3D "${@bb.utils.contains("TUNE_FEATURES"=
, "neon",
> "", " -no-neon" ,d)}"

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

I'm not sure that the PR bumps are necessary however.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


