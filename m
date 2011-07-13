Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qgu1F-0003mD-Tt
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 09:38:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2011 00:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25272073"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 00:34:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 00:33:49 -0700
Message-Id: <ce370e47c362c032f9ade5f46b803635504e03a7.1310541680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
Subject: [PATCH V2 17/25] external-csl-toolchain: Use bitbake default FILES for packaging
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
X-List-Received-Date: Wed, 13 Jul 2011 07:38:06 -0000

This will ensure correct -dev and -staticdev packging

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../meta/external-csl-toolchain_2008q3-72.bb       |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
index a874c8b..10de402 100644
--- a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
@@ -18,7 +18,7 @@ PROVIDES = "\
 	virtual/linux-libc-headers "
 RPROVIDES = "glibc-utils libsegfault glibc-thread-db"
 PACKAGES_DYNAMIC = "glibc-gconv-*"
-PR = "r1"
+PR = "r2"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-${PV}-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
 
@@ -34,8 +34,8 @@ do_install() {
 	cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/sbin/* ${D}${base_sbindir}
 	cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/usr/*  ${D}/usr
 
-	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
-	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so
+	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc${SOLIBSDEV}
+	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread${SOLIBSDEV}
 }
 
 GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
@@ -43,16 +43,18 @@ GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
 inherit libc-common
 inherit libc-package
 
-PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers"
-FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
-FILES_libgcc-dev = "${base_libdir}/libgcc_s.so"
-FILES_libstdc++ = "${libdir}/libstdc++.so.*"
+PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux-libc-headers"
+FILES_libgcc = "${base_libdir}/libgcc_s${SOLIBS}"
+FILES_libgcc-dev = "${base_libdir}/libgcc_s${SOLIBSDEV}"
+FILES_libstdc++ = "${libdir}/libstdc++${SOLIBS}"
 FILES_libstdc++-dev = "${includedir}/c++/${PV} \
-	${libdir}/libstdc++.so \
+	${libdir}/libstdc++${SOLIBSDEV} \
 	${libdir}/libstdc++.la \
+	${libdir}/libsupc++.la"
+FILES_libstdc++-staticdev = " \
 	${libdir}/libstdc++.a \
-	${libdir}/libsupc++.la \
 	${libdir}/libsupc++.a"
+RDEPENDS_libstdc++-staticdev = "libstdc++-dev ( = ${EXTENDPKGV})"
 FILES_linux-libc-headers = "${includedir}/asm* \
 	${includedir}/linux \
 	${includedir}/mtd \
-- 
1.7.3.4



