Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E87E65C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 13:37:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0MDbbkI028665
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 05:37:37 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.42]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0174.001;
	Thu, 22 Jan 2015 05:37:37 -0800
From: "Dragomir, Daniel" <Daniel.Dragomir@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] gcc-runtime: Remove libgfortran data from
	receipe
Thread-Index: AQHQMlW30H8PTtnRK0Cs4U89IDv74ZzMK9Zn
Date: Thu, 22 Jan 2015 13:37:36 +0000
Message-ID: <7805B0FACE4FCC4E84636AB320CBA4AC360C560B@ALA-MBB.corp.ad.wrs.com>
References: <1421499689-4863-1-git-send-email-daniel.dragomir@windriver.com>
In-Reply-To: <1421499689-4863-1-git-send-email-daniel.dragomir@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.124.175]
MIME-Version: 1.0
Subject: Re: [PATCH v2] gcc-runtime: Remove libgfortran data from receipe
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
X-List-Received-Date: Thu, 22 Jan 2015 13:37:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If there are no problems with this patch, can you please cherry-pick this i=
nto =0A=
the dizzy branch too? =0A=
Thanks=0A=
=0A=
BR,=0A=
Daniel=0A=
________________________________________=0A=
From: Daniel Dragomir [daniel.dragomir@windriver.com]=0A=
Sent: Saturday, January 17, 2015 3:01 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: Dragomir, Daniel=0A=
Subject: [OE-core] [PATCH v2] gcc-runtime: Remove libgfortran data from rec=
eipe=0A=
=0A=
Remove libgfortran packages from PACKAGES list as long as libgfortran=0A=
has separate receipe since commit=0A=
=0A=
5bde5d9b39ea67f19a1a6aedd0c08c6cfedcbe5f=0A=
gcc: Allow fortran to build successfully in 4.8=0A=
=0A=
Otherwise, when fortran support will be enabled in the compiler, both=0A=
lingfortran and gcc-runtime receipes will create the same files and will=0A=
try to install them. This will cause errors:=0A=
=0A=
ERROR: The recipe libgfortran is trying to install files into a shared=0A=
area when those files already exist. Those files and their manifest=0A=
location are: ...=0A=
Please verify which recipe should provide the above files.=0A=
=0A=
Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>=0A=
---=0A=
 meta/recipes-devtools/gcc/gcc-runtime.inc | 15 ---------------=0A=
 1 file changed, 15 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devto=
ols/gcc/gcc-runtime.inc=0A=
index 167869e..5c369f4 100644=0A=
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc=0A=
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc=0A=
@@ -76,9 +76,6 @@ PACKAGES =3D "\=0A=
     libssp \=0A=
     libssp-dev \=0A=
     libssp-staticdev \=0A=
-    libgfortran \=0A=
-    libgfortran-dev \=0A=
-    libgfortran-staticdev \=0A=
     libmudflap \=0A=
     libmudflap-dev \=0A=
     libmudflap-staticdev \=0A=
@@ -131,18 +128,6 @@ FILES_libssp-dev =3D "\=0A=
 "=0A=
 FILES_libssp-staticdev =3D "${libdir}/libssp*.a"=0A=
=0A=
-FILES_libgfortran =3D "${libdir}/libgfortran.so.*"=0A=
-FILES_libgfortran-dev =3D "\=0A=
-    ${libdir}/libgfortran*.so \=0A=
-    ${libdir}/libgfortran.spec \=0A=
-    ${libdir}/libgfortran.la \=0A=
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \=0A=
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \=0A=
-"=0A=
-FILES_libgfortran-staticdev =3D "${libdir}/libgfortran.a"=0A=
-=0A=
-INSANE_SKIP_${MLPREFIX}libgfortran-dev =3D "staticdev"=0A=
-=0A=
 FILES_libquadmath =3D "${libdir}/libquadmath*.so.*"=0A=
 FILES_libquadmath-dev =3D "\=0A=
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \=0A=
--=0A=
1.8.1.4=0A=
=0A=

