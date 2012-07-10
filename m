Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SocQX-0005kw-OM
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 17:32:54 +0200
Received: from mail47-va3-R.bigfish.com (10.7.14.250) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	14.1.225.22; Tue, 10 Jul 2012 14:48:51 +0000
Received: from mail47-va3 (localhost [127.0.0.1])	by mail47-va3-R.bigfish.com
	(Postfix) with ESMTP id 4AD923600EE	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 14:48:51 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 4
X-BigFish: VS4(zzzz1202h1082kzz8275eh8275bha1495iz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail47-va3 (localhost.localdomain [127.0.0.1]) by mail47-va3
	(MessageSwitch) id 1341931729296454_4830;
	Tue, 10 Jul 2012 14:48:49 +0000 (UTC)
Received: from VA3EHSMHS030.bigfish.com (unknown [10.7.14.240])	by
	mail47-va3.bigfish.com (Postfix) with ESMTP id 3BC1CE0071	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 14:48:49 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS030.bigfish.com
	(10.7.99.40) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 14:48:47 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Tue, 10 Jul 2012 09:51:06 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6AEp3sH010632 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 07:51:06 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 09:50:58 -0500
Message-ID: <1341931858-16028-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v3 2/2] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
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
X-List-Received-Date: Tue, 10 Jul 2012 15:32:54 -0000
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
index 095d6c1..acd6599 100644
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
+		if [ "$d" == "libgomp" ]; then
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




