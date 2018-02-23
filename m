Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A28EC7884B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 17:21:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2018 09:21:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,383,1515484800"; d="scan'208";a="33628129"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by orsmga001.jf.intel.com with ESMTP; 23 Feb 2018 09:21:28 -0800
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 23 Feb 2018 09:21:28 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.116]) by
	ORSMSX156.amr.corp.intel.com ([169.254.8.98]) with mapi id
	14.03.0319.002; Fri, 23 Feb 2018 09:21:28 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] xcb-proto: don't compile for Python 2
Thread-Index: AQHTrLv57+UsfFh5B0KAmZf03659b6OyOsFi
Date: Fri, 23 Feb 2018 17:21:27 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64C6607C5@ORSMSX112.amr.corp.intel.com>
References: <20180223153535.11063-1-ross.burton@intel.com>
In-Reply-To: <20180223153535.11063-1-ross.burton@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.41]
MIME-Version: 1.0
Subject: Re: [PATCH] xcb-proto: don't compile for Python 2
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
X-List-Received-Date: Fri, 23 Feb 2018 17:21:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Nice. This should fix Yocto #12543 as well.=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Ross Burton [ross.burton@intel.=
com]=0A=
Sent: Friday, February 23, 2018 7:35 AM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH] xcb-proto: don't compile for Python 2=0A=
=0A=
Remove the do_install_append to create the Python 2 pyc files, as nothing i=
n the=0A=
build is using Python 2 anymore (libxcb is the only user, and that uses Pyt=
hon=0A=
3).=0A=
=0A=
Also use variables instead of a patch to control what Python binary and pat=
h the=0A=
modules are installed to.=0A=
=0A=
Signed-off-by: Ross Burton <ross.burton@intel.com>=0A=
---=0A=
 .../xorg-proto/xcb-proto/no-python-native.patch    | 27 ------------------=
----=0A=
 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb | 14 ++++-------=0A=
 2 files changed, 5 insertions(+), 36 deletions(-)=0A=
 delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/no-python-na=
tive.patch=0A=
=0A=
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.pa=
tch b/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch=0A=
deleted file mode 100644=0A=
index 09b6088db0a..00000000000=0A=
--- a/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch=0A=
+++ /dev/null=0A=
@@ -1,27 +0,0 @@=0A=
-Upstream uses AM_PATH_PYTHON to find a python binary and ask it where to i=
nstall=0A=
-libraries.  This means we either need to depend on python-native (large bu=
ild=0A=
-dependency, early in the build) or use the host python (pythondir reflects=
 the=0A=
-host and not the target, breaks builds).=0A=
-=0A=
-The third option is to just hardcode the path where the module goes, as mo=
st=0A=
-callers of the code use pkg-config to find where it was installed anyway.=
=0A=
-=0A=
-Upstream-Status: Inappropriate=0A=
-Signed-off-by: Ross Burton <ross.burton@intel.com>=0A=
-=0A=
-diff --git a/configure.ac b/configure.ac=0A=
-index d140bfe..c7b68da 100644=0A=
---- a/configure.ac=0A=
-+++ b/configure.ac=0A=
-@@ -14,7 +14,10 @@ if test "$XMLLINT" =3D "no"; then=0A=
-    AC_MSG_WARN([xmllint not found; unable to validate against schema.])=
=0A=
- fi=0A=
-=0A=
--AM_PATH_PYTHON([2.5])=0A=
-+pythondir=3D"${libdir}/xcb-proto"=0A=
-+AC_SUBST(pythondir)=0A=
-+PYTHON=3D"python3"=0A=
-+AC_SUBST(PYTHON)=0A=
-=0A=
- xcbincludedir=3D'${datadir}/xcb'=0A=
- AC_SUBST(xcbincludedir)=0A=
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb b/meta/reci=
pes-graphics/xorg-proto/xcb-proto_1.12.bb=0A=
index be6b1a0200e..712ab6c59ab 100644=0A=
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb=0A=
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb=0A=
@@ -11,8 +11,7 @@ LICENSE =3D "MIT"=0A=
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd763b081cb10c223435b01e00dc0aba=
7 \=0A=
                     file://src/dri2.xml;beginline=3D2;endline=3D28;md5=3Df=
8763b13ff432e8597e0d610cf598e65"=0A=
=0A=
-SRC_URI =3D "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2 \=0A=
-           file://no-python-native.patch \=0A=
+SRC_URI =3D "http://xcb.freedesktop.org/dist/${BP}.tar.bz2 \=0A=
            file://0001-Make-whitespace-use-consistent.patch \=0A=
            file://0002-print-is-a-function-and-needs-parentheses.patch \=
=0A=
            "=0A=
@@ -21,6 +20,10 @@ SRC_URI[sha256sum] =3D "5922aba4c664ab7899a29d92ea91a87a=
a4c1fc7eb5ee550325c3216c48=0A=
=0A=
 inherit autotools pkgconfig=0A=
=0A=
+# Force the use of Python 3 and a specific library path so we don't need t=
o=0A=
+# depend on python3-native=0A=
+CACHED_CONFIGUREVARS +=3D "PYTHON=3Dpython3 am_cv_python_pythondir=3D${lib=
dir}/xcb-proto"=0A=
+=0A=
 PACKAGES +=3D "python-xcbgen"=0A=
=0A=
 FILES_${PN} =3D ""=0A=
@@ -31,10 +34,3 @@ RDEPENDS_${PN}-dev =3D ""=0A=
 RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"=0A=
=0A=
 BBCLASSEXTEND =3D "native nativesdk"=0A=
-=0A=
-do_install_append() {=0A=
-    # Makefile's do_install creates .pyc files for python3, now also creat=
e=0A=
-    # them for python2 so that they will be recorded by manifest, and can =
be=0A=
-    # cleaned correctly.=0A=
-    (cd ${D}; python -m py_compile ./${libdir}/xcb-proto/xcbgen/*.py)=0A=
-}=0A=
--=0A=
2.11.0=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

