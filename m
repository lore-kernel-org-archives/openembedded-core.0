Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Sn0d0-00016q-Hs
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 06:58:50 +0200
Received: from mail41-db3-R.bigfish.com (10.3.81.251) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jul 2012 04:30:33 +0000
Received: from mail41-db3 (localhost [127.0.0.1])	by mail41-db3-R.bigfish.com
	(Postfix) with ESMTP id 5AC8E100269	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 04:30:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail41-db3 (localhost.localdomain [127.0.0.1]) by mail41-db3
	(MessageSwitch) id 1341549031500736_31916;
	Fri,  6 Jul 2012 04:30:31 +0000 (UTC)
Received: from DB3EHSMHS004.bigfish.com (unknown [10.3.81.227])	by
	mail41-db3.bigfish.com (Postfix) with ESMTP id 77FC04C0049	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 04:30:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS004.bigfish.com
	(10.3.87.104) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jul 2012 04:30:31 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Thu, 5 Jul 2012 23:32:36 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q664WZ7K015369
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jul 2012 21:32:36
	-0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jul 2012 23:32:35 -0500
Message-ID: <1341549155-30728-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
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
X-List-Received-Date: Fri, 06 Jul 2012 04:58:50 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc               |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-runtime.inc |    2 ++
 meta/recipes-devtools/gcc/gcc-package-runtime.inc   |    9 +++++++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 020e21b..32545eb 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r25"
+PR = "r26"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index 34bfaeb..a7d478c 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -9,6 +9,8 @@ EXTRA_OECONF_PATHS = " \
     --with-build-sysroot=${STAGING_DIR_TARGET}"
 
 RUNTIMETARGET = "libssp libstdc++-v3"
+RUNTIMETARGET_append_powerpc = " libgomp"
+RUNTIMETARGET_append_powerpc64 = " libgomp"
 #  ?
 # libiberty
 # libmudflap
diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
index feb8735..001a444 100644
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
@@ -13,6 +13,8 @@ PACKAGES = "\
   libgfortran-dev \
   libmudflap \
   libmudflap-dev \
+  libgomp \
+  libgomp-dev \
 "
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
@@ -61,3 +63,10 @@ FILES_libmudflap-dev = "\
   ${libdir}/libmudflap*.a \
   ${libdir}/libmudflap*.la"
 
+FILES_libgomp = "${libdir}/libgomp*.so.*"
+FILES_libgomp-dev = "\
+  ${libdir}/libgomp*.so \
+  ${libdir}/libgomp*.a \
+  ${libdir}/libgomp*.la \
+  ${libdir}/libgomp.spec \
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h"
-- 
1.7.10




