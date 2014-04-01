Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 197CF617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 16:20:39 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s31GKZHY013079
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Apr 2014 18:20:40 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Tue, 1 Apr 2014 18:20:35 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 2/2] Make ppce300c3 tune hard-float by default
Thread-Index: Ac9Nxk9603kst8C4SSiDcobm74ly0w==
Date: Tue, 1 Apr 2014 16:20:34 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3AAA35@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Subject: [PATCH 2/2] Make ppce300c3 tune hard-float by default
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
X-List-Received-Date: Tue, 01 Apr 2014 16:20:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The tuning file for PowerPC e300c3 is soft-float. In OE-classic it was hard=
-=0A=
float and it should be as the c3 has an fpu. I have modified the tuning fil=
e=0A=
to include both a hard-float version (using the existing ppce300c3 name) an=
d=0A=
an optional soft-float version (called ppce300c3-nf).=0A=
=0A=
The following patch also passes a "--with-cpu=3De300c3" argument to GLIBC.=
=0A=
For this to have any effect the sqrt/sqrtf implementations added by the=0A=
"glibc.fix_sqrt2.patch" are required and also an additional "Implies" file=
=0A=
(added to the mentioned patch as a separate patch for eglibc_2.19).=0A=
=0A=
Tested with eglibc 2.19 on PowerPC MPC5125.=0A=
=0A=
Signed-off-by: Mats Karrman <mats.karrman@tritech.se>=0A=
---=0A=
 meta/conf/machine/include/tune-ppce300c3.inc |   20 ++++++++++++++++----=
=0A=
 1 file changed, 16 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/meta/conf/machine/include/tune-ppce300c3.inc b/meta/conf/machi=
ne/include/tune-ppce300c3.inc=0A=
index 9431222..b19cf22 100644=0A=
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
+# glibc config options to make use of e300c3 (603e) specific sqrt/sqrtf ro=
utines=0A=
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
+=0A=
-- =0A=
1.7.10.4=0A=

