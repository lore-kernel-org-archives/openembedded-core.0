Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RYWx7-00031h-FM
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 06:55:29 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Dec 2011 21:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83495550"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 07 Dec 2011 21:48:35 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	hjl.tools@gmail.com
Date: Wed,  7 Dec 2011 21:48:26 -0800
Message-Id: <c4dd19a62ec0d08879311b7e42d13f6a8007844a.1323323130.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
References: <664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1323323130.git.nitin.a.kamble@intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
Subject: [PATCH 04/11] libacpi: Fix libdir for x32
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
X-List-Received-Date: Thu, 08 Dec 2011 05:55:29 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

libacpi doesn't use base_libdir for install.  This patch adds
base_libdir support so that x32 libraries are installed properly.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
---
 .../libacpi/files/libacpi_fix_for_x32.patch        |   47 ++++++++++++++++++++
 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |    5 +-
 2 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch

diff --git a/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch b/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
new file mode 100644
index 0000000..5f2d034
--- /dev/null
+++ b/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
@@ -0,0 +1,47 @@
+UpstreamStatus: Pending
+
+Fix libacpi for x32
+    
+    libacpi doesn't use base_libdir for install.  This patch adds
+    base_libdir support so that x32 libraries are installed properly.
+
+Patch Received from:  H.J. Lu <hjl.tools@gmail.com>
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/05
+
+Index: libacpi-0.2/Makefile
+===================================================================
+--- libacpi-0.2.orig/Makefile
++++ libacpi-0.2/Makefile
+@@ -8,6 +8,10 @@ SRC_test = test-libacpi.c libacpi.c list
+ OBJ = ${SRC:.c=.o}
+ OBJ_test = ${SRC_test:.c=.o}
+ 
++ifndef base_libdir
++base_libdir=/lib
++endif
++
+ all: options libacpi.a libacpi.so test-libacpi
+ 
+ options:
+@@ -42,13 +46,13 @@ install: all
+ 	@mkdir -p ${DESTDIR}${PREFIX}/include
+ 	@cp -f libacpi.h ${DESTDIR}${PREFIX}/include
+ 	@chmod 644 ${DESTDIR}${PREFIX}/include/libacpi.h
+-	@echo installing library to ${DESTDIR}${PREFIX}/lib
+-	@mkdir -p ${DESTDIR}${PREFIX}/lib
+-	@cp -f libacpi.a ${DESTDIR}${PREFIX}/lib
+-	@chmod 644 ${DESTDIR}${PREFIX}/lib/libacpi.a
+-	@cp -f ${SONAME} ${DESTDIR}${PREFIX}/lib/
+-	@chmod 644 ${DESTDIR}${PREFIX}/lib/${SONAME}
+-	@ln -s ${SONAME} ${DESTDIR}${PREFIX}/lib/libacpi.so
++	@echo installing library to ${DESTDIR}${PREFIX}${base_libdir}
++	@mkdir -p ${DESTDIR}${PREFIX}${base_libdir}
++	@cp -f libacpi.a ${DESTDIR}${PREFIX}${base_libdir}
++	@chmod 644 ${DESTDIR}${PREFIX}${base_libdir}/libacpi.a
++	@cp -f ${SONAME} ${DESTDIR}${PREFIX}${base_libdir}/
++	@chmod 644 ${DESTDIR}${PREFIX}${base_libdir}/${SONAME}
++	@ln -s ${SONAME} ${DESTDIR}${PREFIX}${base_libdir}/libacpi.so
+ 	@echo installing test-libacpi to ${DESTDIR}${PREFIX}/bin
+ 	@mkdir -p ${DESTDIR}${PREFIX}/bin
+ 	@cp -f test-libacpi ${DESTDIR}${PREFIX}/bin
diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index 7c5095d..82fe8f8 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -5,10 +5,11 @@ SECTION = "base"
 HOMEPAGE = "http://www.ngolde.de/libacpi.html"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fec17f82f16630adf2dfb7d2a46f21c5"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
-	   file://makefile-fix.patch "
+	   file://makefile-fix.patch \
+	   file://libacpi_fix_for_x32.patch "
 
 SRC_URI[md5sum] = "05b53dd7bead66dda35fec502b91066c"
 SRC_URI[sha256sum] = "13086e31d428b9c125954d48ac497b754bbbce2ef34ea29ecd903e82e25bad29"
-- 
1.7.6.4



