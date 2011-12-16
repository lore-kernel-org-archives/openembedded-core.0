Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RbgVV-0002ur-83
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 23:44:01 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 59CCD2FF5D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 17:36:58 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 14:36:29 -0800
Message-Id: <b611510763b0dc666dbf49235176f4a7a61d1db8.1324074313.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324074313.git.scott.a.garman@intel.com>
References: <cover.1324074313.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1324074313.git.scott.a.garman@intel.com>
References: <cover.1324074313.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 59CCD2FF5D.37EED
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 4/8] e2fsprogs: move libraries to base_libdir
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
X-List-Received-Date: Fri, 16 Dec 2011 22:44:01 -0000

The e2fsprogs utilities are installed into base_sbindir (/sbin)
and should not link to libraries under exec_prefix (/usr). So move
these libraries from libdir (/usr/lib) to base_libdir (/lib).

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |   29 ++++++++++++-------
 1 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
index c6c1f0d..0bd0c67 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
@@ -1,6 +1,6 @@
 require e2fsprogs.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://quotefix.patch \
             file://acinclude.m4"
@@ -11,9 +11,9 @@ SRC_URI[sha256sum] = "3f8ac1fedd7c4bec480afcbe4acabdd4ac59ec0446a0fd50c8975cd0aa
 
 PARALLEL_MAKE = ""
 
-EXTRA_OECONF += " --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid"
-EXTRA_OECONF_darwin = "--sbindir=${base_sbindir} --enable-bsd-shlibs"
-EXTRA_OECONF_darwin8 = "--sbindir=${base_sbindir} --enable-bsd-shlibs"
+EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid"
+EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
+EXTRA_OECONF_darwin8 = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
 do_configure_prepend () {
 	cp ${WORKDIR}/acinclude.m4 ${S}/
@@ -28,9 +28,16 @@ do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 	oe_runmake 'DESTDIR=${D}' install-libs
 	# We use blkid from util-linux now so remove from here
-	rm -f ${D}${libdir}/libblkid*
+	rm -f ${D}${base_libdir}/libblkid*
 	rm -rf ${D}${includedir}/blkid
-	rm -f ${D}${libdir}/pkgconfig/blkid.pc
+	rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
+}
+
+do_install_append () {
+	# e2initrd_helper and the pkgconfig files belong in libdir
+	install -d ${D}${libdir}
+	mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
+	mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 }
 
 # blkid used to be part of e2fsprogs but is useful outside, add it
@@ -47,10 +54,10 @@ FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
 FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs ${base_sbindir}/mkfs.ext* ${sysconfdir}/mke2fs.conf"
 FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label ${base_sbindir}/findfs"
 FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
-FILES_libcomerr = "${libdir}/libcom_err.so.*"
-FILES_libss = "${libdir}/libss.so.*"
-FILES_libe2p = "${libdir}/libe2p.so.*"
-FILES_libext2fs = "${libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
-FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed"
+FILES_libcomerr = "${base_libdir}/libcom_err.so.*"
+FILES_libss = "${base_libdir}/libss.so.*"
+FILES_libe2p = "${base_libdir}/libe2p.so.*"
+FILES_libext2fs = "${libdir}/e2initrd_helper ${base_libdir}/libext2fs.so.*"
+FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so"
 
 BBCLASSEXTEND = "native"
-- 
1.7.5.4



