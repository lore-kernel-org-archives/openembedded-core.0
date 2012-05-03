Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQX-0006gj-9R
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:53 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772192"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:33 -0700
Message-Id: <106eb50b336e4ca9915b5a7aab974a2c6f3e789c.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/36] external-csl-toolchain: cleanup, simplify, use base_libdir
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
X-List-Received-Date: Thu, 03 May 2012 02:05:53 -0000

From: Christopher Larson <kergoth@gmail.com>

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |   57 +++++++++++-----------
 1 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index fb553ab..a14e958 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -24,36 +24,40 @@ PROVIDES += "\
 	virtual/linux-libc-headers \
 "
 PV = "${CSL_VER_MAIN}"
-PR = "r3"
+PR = "r5"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
 
 SRC_URI = "file://SUPPORTED"
 
 do_install() {
-	install -d ${D}${sysconfdir} ${D}${bindir} ${D}${sbindir} ${D}${base_bindir} ${D}${libdir}
-	install -d ${D}${base_libdir} ${D}${base_sbindir} ${D}${datadir} ${D}/usr
-
-	if [ -d ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE} ]; then
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/lib/.  ${D}${base_libdir}
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/etc/.  ${D}${sysconfdir}
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/sbin/. ${D}${base_sbindir}
-		if [ ! -e ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/include ]; then
-			cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/usr/include  ${D}/usr/
-		fi
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/.  ${D}/usr/
-	else
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/lib/.  ${D}${base_libdir}
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/etc/.  ${D}${sysconfdir}
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/sbin/. ${D}${base_sbindir}
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/usr/.  ${D}/usr/
+	# Use optimized files if available
+	sysroot="${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc"
+	if [ -d $sysroot/${CSL_TARGET_CORE} ]; then
+		sysroot="$sysroot/${CSL_TARGET_CORE}"
 	fi
 
-	if [ -e ${D}${prefix}/info ]; then
-		mv ${D}${prefix}/info ${D}${infodir}
-	fi
-	if [ -e ${D}${prefix}/man ]; then
-		mv ${D}${prefix}/man ${D}${mandir}
+	cp -a $sysroot${base_libdir}/. ${D}${base_libdir}
+	cp -a $sysroot/etc/. ${D}${sysconfdir}
+	cp -a $sysroot/sbin/. ${D}${base_sbindir}
+
+	install -d ${D}/usr
+	for usr_element in bin libexec sbin share ${base_libdir}; do
+		usr_path=$sysroot/usr/$usr_element
+		cp -a $usr_path ${D}/usr/
+	done
+	for datadir_element in man info; do
+		datadir_path=$sysroot/usr/$datadir_element
+		if [ -e $datadir_path ]; then
+			cp -a $datadir_path ${D}${datadir}/
+		fi
+	done
+
+	# Some toolchains have headers under the core specific area
+	if [ -e $sysroot/usr/include ]; then
+		cp -a $sysroot/usr/include/. ${D}${includedir}
+	else
+		cp -a $sysroot/../usr/include/. ${D}${includedir}
 	fi
 
 	rm ${D}${sysconfdir}/rpc
@@ -61,18 +65,13 @@ do_install() {
 
 	mv ${D}${libdir}/bin/* ${D}${bindir}/
 	if [ -e ${D}${libdir}/bin/.debug ]; then
-		install -d ${D}${bindir}/.debug
 		mv ${D}${libdir}/bin/.debug/* ${D}${bindir}/.debug/
 	fi
 	ln -s ../../bin/gdbserver ${D}${libdir}/bin/sysroot-gdbserver
 
 	sed -i -e 's/__packed/__attribute__ ((packed))/' ${D}${includedir}/mtd/ubi-user.h
-	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
-	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so
-}
-
-do_install_locale_append () {
-	rm -r ${D}${datadir}/locale ${D}${libdir}/locale
+        sed -i -e "s# ${base_libdir}# ../..${base_libdir}#g" -e "s# ${libdir}# .#g" ${D}${libdir}/libc.so
+        sed -i -e "s# ${base_libdir}# ../..${base_libdir}#g" -e "s# ${libdir}# .#g" ${D}${libdir}/libpthread.so
 }
 
 SYSROOT_PREPROCESS_FUNCS += "external_toolchain_sysroot_adjust"
-- 
1.7.7.6



