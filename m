Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E070E60124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 08:08:24 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-05.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZtAAB-0005ht-L2 from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Nov 2015 00:08:23 -0800
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.69]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.03.0224.002; Mon, 2 Nov 2015 08:08:22 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC][PATCH] python: ensure usage of host modules
	while	cross compiling
Thread-Index: AQHRExQ3TzokphRAfUKhjMvbfSEs8Z6IZRSr
Date: Mon, 2 Nov 2015 08:08:22 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD280119A934F7@EU-MBX-02.mgc.mentorg.com>
References: <1446210513-16152-1-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1446210513-16152-1-git-send-email-awais_belal@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [RFC][PATCH] python: ensure usage of host modules while	cross compiling
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
X-List-Received-Date: Mon, 02 Nov 2015 08:08:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping!=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Friday, October 30, 2015 6:08 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [RFC][PATCH] python: ensure usage of host modules while =
     cross compiling=0A=
=0A=
The issue is generally seen on x86 type of machines passing=0A=
-march=3DbdverX (X=3D3,4 etc) flags but in general this should=0A=
cause a problem when freshly built target modules are tried=0A=
for an import during the cross build process.=0A=
Aiding the PYTHONPATH with CROSSPYTHONPATH which contains=0A=
the native modules resolves the issue.=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 ...e-of-native-modules-while-cross-compiling.patch | 31 ++++++++++++++++++=
++++=0A=
 meta/recipes-devtools/python/python_2.7.9.bb       |  1 +=0A=
 2 files changed, 32 insertions(+)=0A=
 create mode 100644 meta/recipes-devtools/python/python/0001-ensure-usage-o=
f-native-modules-while-cross-compiling.patch=0A=
=0A=
diff --git a/meta/recipes-devtools/python/python/0001-ensure-usage-of-nativ=
e-modules-while-cross-compiling.patch b/meta/recipes-devtools/python/python=
/0001-ensure-usage-of-native-modules-while-cross-compiling.patch=0A=
new file mode 100644=0A=
index 0000000..1e87e89=0A=
--- /dev/null=0A=
+++ b/meta/recipes-devtools/python/python/0001-ensure-usage-of-native-modul=
es-while-cross-compiling.patch=0A=
@@ -0,0 +1,31 @@=0A=
+From 4eb30173f2d254f19d5ef18fabed3bdb2e5c1182 Mon Sep 17 00:00:00 2001=0A=
+From: Awais Belal <awais_belal@mentor.com>=0A=
+Date: Fri, 30 Oct 2015 17:47:07 +0500=0A=
+Subject: [PATCH] ensure usage of native modules while cross compiling=0A=
+=0A=
+The PYTHONPATH variable augments the default search path and=0A=
+is prepended to it. We need to make sure that host modules=0A=
+are used while cross compiling otherwise an illegal instruction=0A=
+error is generated if the modules built for target are imported.=0A=
+=0A=
+Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
+---=0A=
+ configure.ac | 2 +-=0A=
+ 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/configure.ac b/configure.ac=0A=
+index 87a4f02..fa9e0dd 100644=0A=
+--- a/configure.ac=0A=
++++ b/configure.ac=0A=
+@@ -33,7 +33,7 @@ if test "$cross_compiling" =3D yes; then=0A=
+           AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])=0A=
+       fi=0A=
+         AC_MSG_RESULT($interp)=0A=
+-      PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) _PYTHON_=
HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(shell test -f pybui=
lddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(src=
dir)/Lib/plat-$(MACHDEP) '$interp=0A=
++      PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) _PYTHON_=
HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(CROSSPYTHONPATH):$(=
shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)=
$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp=0A=
+     fi=0A=
+ elif test "$cross_compiling" =3D maybe; then=0A=
+     AC_MSG_ERROR([Cross compiling required --host=3DHOST-TUPLE and --buil=
d=3DARCH])=0A=
+--=0A=
+1.9.1=0A=
+=0A=
diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-de=
vtools/python/python_2.7.9.bb=0A=
index f7e2f27..9a43cf7 100644=0A=
--- a/meta/recipes-devtools/python/python_2.7.9.bb=0A=
+++ b/meta/recipes-devtools/python/python_2.7.9.bb=0A=
@@ -26,6 +26,7 @@ SRC_URI +=3D "\=0A=
   file://parallel-makeinst-create-bindir.patch \=0A=
   file://use_sysroot_ncurses_instead_of_host.patch \=0A=
   file://avoid_parallel_make_races_on_pgen.patch \=0A=
+  file://0001-ensure-usage-of-native-modules-while-cross-compiling.patch \=
=0A=
 "=0A=
=0A=
 S =3D "${WORKDIR}/Python-${PV}"=0A=
--=0A=
1.9.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

