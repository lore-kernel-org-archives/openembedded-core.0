Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 817686FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 04:18:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u214IimT001629
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 20:18:44 -0800
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 29 Feb 2016 20:18:43 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Feb 2016 22:18:41 -0600
Message-ID: <e038722afdf9882154e43aaf8c814b708e0842ec.1456805735.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456805735.git.mark.hatle@windriver.com>
References: <cover.1456805735.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gcc: Add support for atomic opertions (libitm) where available
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
X-List-Received-Date: Tue, 01 Mar 2016 04:18:43 -0000
Content-Type: text/plain

GCC 4.7 and newer have supported various automic operation directives,
however these have not been previously enabled.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc     |  2 ++
 meta/recipes-devtools/gcc/gcc-runtime.inc | 22 +++++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 0667299..0bf9f55 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -103,6 +103,7 @@ LTO = "--enable-lto"
 EXTRA_OECONF_BASE = "\
     ${LTO} \
     --enable-libssp \
+    --enable-libitm \
     --disable-bootstrap \
     --disable-libmudflap \
     --with-system-zlib \
@@ -118,6 +119,7 @@ EXTRA_OECONF_BASE = "\
 EXTRA_OECONF_INITIAL = "\
     --disable-libmudflap \
     --disable-libgomp \
+    --disable-libitm \
     --disable-libquadmath \
     --with-system-zlib \
     --disable-lto \
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 844149f..707db37 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -10,9 +10,14 @@ EXTRA_OECONF_PATHS = "\
 
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
-RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic \
+RUNTIMELIBITM = "libitm"
+RUNTIMELIBITM_mips = ""
+RUNTIMELIBITM_mips64 = ""
+
+RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
 "
+
 #  ?
 # libiberty
 # libmudflap
@@ -49,6 +54,7 @@ do_install () {
 		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
 	done
 	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
+	rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
 	rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
 	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
 		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
@@ -94,6 +100,9 @@ PACKAGES = "\
     libatomic \
     libatomic-dev \
     libatomic-staticdev \
+    libitm \
+    libitm-dev \
+    libitm-staticdev \
 "
 
 # Most libraries are licensed with the exception, but
@@ -121,6 +130,9 @@ LICENSE_libquadmath-staticdev = "GPL-3.0-with-GCC-exception"
 LICENSE_libatomic = "GPL-3.0-with-GCC-exception"
 LICENSE_libatomic-dev = "GPL-3.0-with-GCC-exception"
 LICENSE_libatomic-staticdev = "GPL-3.0-with-GCC-exception"
+LICENSE_libitm = "GPL-3.0-with-GCC-exception"
+LICENSE_libitm-dev = "GPL-3.0-with-GCC-exception"
+LICENSE_libitm-staticdev = "GPL-3.0-with-GCC-exception"
 
 LICENSE_libgomp = "GPLv3"
 LICENSE_libgomp-dev = "GPLv3"
@@ -196,6 +208,14 @@ FILES_libatomic-dev = "\
 "
 FILES_libatomic-staticdev = "${libdir}/libatomic.a"
 
+FILES_libitm = "${libdir}/libitm.so.*"
+FILES_libitm-dev = "\
+    ${libdir}/libitm.so \
+    ${libdir}/libitm.la \
+    ${libdir}/libitm.spec \
+"
+FILES_libitm-staticdev = "${libdir}/libitm.a"
+
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-- 
2.5.0


