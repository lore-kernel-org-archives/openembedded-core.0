Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SodEC-0002zr-0C
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 18:23:56 +0200
Received: from mail87-db3-R.bigfish.com (10.3.81.237) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.23; Tue, 10 Jul 2012 16:10:26 +0000
Received: from mail87-db3 (localhost [127.0.0.1])	by mail87-db3-R.bigfish.com
	(Postfix) with ESMTP id F24A22604A0	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 16:10:25 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 4
X-BigFish: VS4(zzzz1202h1082kzz8275eh8275bha1495iz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail87-db3 (localhost.localdomain [127.0.0.1]) by mail87-db3
	(MessageSwitch) id 1341936624174357_29755;
	Tue, 10 Jul 2012 16:10:24 +0000 (UTC)
Received: from DB3EHSMHS009.bigfish.com (unknown [10.3.81.234])	by
	mail87-db3.bigfish.com (Postfix) with ESMTP id 28F2A2A0085	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 16:10:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS009.bigfish.com
	(10.3.87.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 16:10:23 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Tue, 10 Jul 2012 11:12:33 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6AGCW5F022278 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 09:12:33 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 11:12:29 -0500
Message-ID: <1341936749-3209-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v4 2/2] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2012 16:23:56 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc               |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-runtime.inc |    7 +++++++
 meta/recipes-devtools/gcc/gcc-package-runtime.inc   |   14 +++++++++++++-
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index c7dbc3c..be142a1 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r3"
+PR = "r4"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index 095d6c1..d40383c 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -8,6 +8,8 @@ EXTRA_OECONF_PATHS = " \
     --with-build-sysroot=${STAGING_DIR_TARGET}"
 
 RUNTIMETARGET = "libssp libstdc++-v3"
+RUNTIMETARGET_append_powerpc = " libgomp"
+RUNTIMETARGET_append_powerpc64 = " libgomp"
 #  ?
 # libiberty
 # libmudflap
@@ -41,6 +43,11 @@ do_install () {
 	for d in ${RUNTIMETARGET}; do
 		cd ${B}/$target/$d/
 		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
+		if [ "$d" = "libgomp" ]; then
+			rm -rf ${D}${datadir}/info/libgomp.info ${D}${datadir}/info/dir
+			rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
+			rmdir --ignore-fail-on-non-empty -p ${D}${datadir}/info
+		fi
 	done
 	chown -R root:root ${D}
 }
diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
index e0cb51b..a81e3b7 100644
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
@@ -13,6 +13,9 @@ PACKAGES = "\
   libgfortran-dev \
   libmudflap \
   libmudflap-dev \
+  libgomp \
+  libgomp-dev \
+  libgomp-staticdev \
 "
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
@@ -61,7 +64,16 @@ FILES_libmudflap-dev = "\
   ${libdir}/libmudflap*.a \
   ${libdir}/libmudflap*.la"
 
+FILES_libgomp-dev = "\
+  ${libdir}/libgomp*.so \
+  ${libdir}/libgomp*.la \
+  ${libdir}/libgomp.spec \
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
+  "
+FILES_libgomp-staticdev = "\
+  ${libdir}/libgomp*.a \
+  "
+
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_package"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_package"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
-
-- 
1.7.10




