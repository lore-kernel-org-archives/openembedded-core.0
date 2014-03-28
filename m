Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 47E956D315
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 16:43:53 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s2SGhnUU000389
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 17:43:54 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Fri, 28 Mar 2014 17:43:49 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: [RFC PATCH] Make ppce300c3 tune hard-float by default
Thread-Index: Ac9KozMWp6mgzhUuTs+O79jHgwSqqQ==
Date: Fri, 28 Mar 2014 16:43:47 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3A7EBE@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Subject: [RFC PATCH] Make ppce300c3 tune hard-float by default
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
X-List-Received-Date: Fri, 28 Mar 2014 16:43:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The tuning file for PowerPC e300c3 is soft-float. In OE-classic it was hard=
-float=0A=
and it should be as the c3 has an fpu. I have modified the tuning file to i=
nclude=0A=
both a hard-float version (using the existing ppce300c3 name) and an option=
al=0A=
soft-float version (called ppce300c3-nf).=0A=
=0A=
The following patch also passes a "--with-cpu=3De300c3" argument to GLIBC.=
=0A=
For this to have any effect an "Implies" file must be added to the glibc/eg=
libc=0A=
source (tested with eglibc 2.18).=0A=
./ports/sysdeps/powerpc/powerpc32/e300c3/fpu/Implies:=0A=
---------------------------------------------------------------------------=
---=0A=
# e300c3 is a variant of 603e so use the same optimizations for sqrt=0A=
powerpc/powerpc32/603e/fpu=0A=
---------------------------------------------------------------------------=
---=0A=
=0A=
Thanks to Khem Raj and Mark Hatle for their previous comments.=0A=
=0A=
=0A=
diff --git a/meta/conf/machine/include/tune-ppce300c3.inc b/meta/conf/machi=
ne/include/tune-ppce300c3.inc=0A=
index 9431222..d11522b 100644=0A=
--- a/meta/conf/machine/include/tune-ppce300c3.inc=0A=
+++ b/meta/conf/machine/include/tune-ppce300c3.inc=0A=
@@ -2,10 +2,22 @@ DEFAULTTUNE ?=3D "ppce300c3"=0A=
 =0A=
 require conf/machine/include/powerpc/arch-powerpc.inc=0A=
 =0A=
+AVAILTUNES +=3D "ppce300c3 ppce300c3-nf"=0A=
+=0A=
+# hard-float=0A=
 TUNEVALID[ppce300c3] =3D "Enable ppce300c3 specific processor optimization=
s"=0A=
+TUNE_FEATURES_tune-ppce300c3 =3D "${TUNE_FEATURES_tune-powerpc} ppce300c3"=
=0A=
+TUNE_PKGARCH_tune-ppce300c3 =3D "ppce300c3"=0A=
+PACKAGE_EXTRA_ARCHS_tune-ppce300c3 =3D "${PACKAGE_EXTRA_ARCHS_tune-powerpc=
} ppce300c3"=0A=
 TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", " -mc=
pu=3De300c3", "", d)}"=0A=
 =0A=
-AVAILTUNES +=3D "ppce300c3"=0A=
-TUNE_FEATURES_tune-ppce300c3 =3D "m32 fpu-soft ppce300c3"=0A=
-TUNE_PKGARCH_tune-ppce300c3 =3D "ppce300c3"=0A=
-PACKAGE_EXTRA_ARCHS_tune-ppce300c3 =3D "${PACKAGE_EXTRA_ARCHS_tune-powerpc=
-nf} ppce300c3"=0A=
+# glibc configure options to make use of 603e specific sqrt/sqrtf routines=
=0A=
+GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3"=
, "--with-cpu=3De300c3", "", d)}"=0A=
+=0A=
+# soft-float=0A=
+TUNEVALID[ppce300c3-nf] =3D "Enable ppce300c3 specific processor optimizat=
ions (no fpu)"=0A=
+TUNE_FEATURES_tune-ppce300c3-nf =3D "${TUNE_FEATURES_tune-powerpc-nf} ppce=
300c3-nf"=0A=
+TUNE_PKGARCH_tune-ppce300c3-nf =3D "ppce300c3-nf"=0A=
+PACKAGE_EXTRA_ARCHS_tune-ppce300c3-nf =3D "${PACKAGE_EXTRA_ARCHS_tune-powe=
rpc-nf} ppce300c3-nf"=0A=
+TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3-nf", " =
-mcpu=3De300c3", "", d)}"=0A=
+=

