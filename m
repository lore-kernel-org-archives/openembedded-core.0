Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F0DBC60125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 18:13:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2015 10:13:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,248,1444719600"; d="scan'208";a="679097485"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by orsmga003.jf.intel.com with ESMTP; 05 Nov 2015 10:13:16 -0800
Received: from orsmsx115.amr.corp.intel.com (10.22.240.11) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 5 Nov 2015 10:13:16 -0800
Received: from orsmsx110.amr.corp.intel.com ([169.254.3.225]) by
	ORSMSX115.amr.corp.intel.com ([169.254.10.96]) with mapi id
	14.03.0248.002; Thu, 5 Nov 2015 10:13:14 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "Hatle, Mark G (Wind River)" <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Fix GCC 5.2 "_FOR_BUILD" and related variables
Thread-Index: AQHRCoMKmbfTF3/+JEurzOjY1MI62p6N0aOw
Date: Thu, 5 Nov 2015 18:13:13 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B610D473B5@ORSMSX110.amr.corp.intel.com>
References: <1445268589-104714-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1445268589-104714-1-git-send-email-mark.hatle@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH] Fix GCC 5.2 "_FOR_BUILD" and related variables
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
X-List-Received-Date: Thu, 05 Nov 2015 18:13:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The patch works unmodified  (and solves mingw build problems) for gcc 4.9. =
as well,
providing gcc-4.9.inc is  patched the same way as gcc-5.2.inc

(However, this makes  the Makefile.in patch  status:

Upstream-Status: Pending=20

incorrect for case of gcc 4.9.)


--- a/meta/recipes-devtools/gcc/gcc-4.9.inc                                =
                                                                           =
                              =20
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc                                =
                                                                           =
                              =20
@@ -81,6 +81,7 @@ SRC_URI =3D "\                                           =
                                                                           =
                                =20
     file://0063-nativesdk-gcc-support.patch \                             =
                                                                           =
                              =20
     file://0064-handle-target-sysroot-multilib.patch \                    =
                                                                           =
                              =20
     file://0065-gcc-483-universal-initializer-no-warning.patch \          =
                                                                           =
                              =20
+    file://0042-cxxflags-for-build.patch \                                =
                                                                           =
                              =20
 "  =20



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Mark Hatle
> Sent: Monday, October 19, 2015 8:30 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] Fix GCC 5.2 "_FOR_BUILD" and related variables
>=20
> Without this patch, the wrong header fragments can be used to generate th=
e
> nativesdk, cross-canadian, and other variations.  Generally this works fi=
ne.
> However, when there is enough variation from the build machine to the
> target runtime it will break.. (Such as SDKMACHINE=3Di686-mingw32)
>=20
> The bugs can also how up on a Linux -> Linux build, but it's signficiantl=
y more
> rare.  It would require some set of options that make the host headers an=
d
> flags incompatible with the target.  (Such as various profiling
> options.)
>=20
> This has been tested with a set of meta-mingw patches that will be sent t=
o
> the Yocto Project mailing list soon.
>=20
> Mark Hatle (1):
>   gcc-5.2: Fix various _FOR_BUILD and related variables
>=20
>  meta/recipes-devtools/gcc/gcc-5.2.inc              |   1 +
>  .../gcc/gcc-5.2/0042-cxxflags-for-build.patch      | 123
> +++++++++++++++++++++
>  2 files changed, 124 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-
> build.patch
>=20
> --
> 1.9.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

