Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rn8cH-0004zA-9O
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 13:58:21 +0100
Received: by wibhi8 with SMTP id hi8so329342wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 04:50:44 -0800 (PST)
Received: by 10.180.97.73 with SMTP id dy9mr27845742wib.11.1326804644545;
	Tue, 17 Jan 2012 04:50:44 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fy5sm43723951wib.7.2012.01.17.04.50.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 04:50:43 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 13:50:38 +0100
Message-Id: <1326804638-3951-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] e2fsprogs: update to 1.42
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
X-List-Received-Date: Tue, 17 Jan 2012 12:58:21 -0000

Complete changelog can be found at http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.42

The quotefix patch isn't needed anymore and the build survived -j20 on a quadcore machine, so PARALLEL_MAKE is enabled again. Almost everything in the recipe minus SRC_URI stuff has moved to the .inc file as well.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../e2fsprogs/e2fsprogs-1.41.14/quotefix.patch     |   47 ---------------
 .../acinclude.m4                                   |    0
 .../mkdir.patch                                    |    0
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |   50 ++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |   63 --------------------
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |    6 ++
 6 files changed, 56 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/quotefix.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.41.14 => e2fsprogs-1.42}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.41.14 => e2fsprogs-1.42}/mkdir.patch (100%)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/quotefix.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/quotefix.patch
deleted file mode 100644
index f260f03..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/quotefix.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Mei Lei <lei.mei@intel.com>
-
-
-These macros are underquoted and break with recent autoconf+automake
-combinations.
-
-RP 1/2/10
-
-Index: e2fsprogs-1.41.5/configure.in
-===================================================================
---- e2fsprogs-1.41.5.orig/configure.in	2010-02-01 11:40:10.547790252 +0000
-+++ e2fsprogs-1.41.5/configure.in	2010-02-01 11:44:51.577876485 +0000
-@@ -397,11 +397,11 @@
- 		AC_MSG_ERROR([pkg-config not installed; please install it.])
- 	fi
- 
--	AC_CHECK_LIB(blkid, blkid_get_cache,
-+	[AC_CHECK_LIB(blkid, blkid_get_cache,
- 		[LIBBLKID=`$PKG_CONFIG --libs blkid`;
- 		 STATIC_LIBBLKID=`$PKG_CONFIG --static --libs blkid`],
- 		[AC_MSG_ERROR([external blkid library not found])],
--		[$LIBBLKID])
-+		[$LIBBLKID])]
- 	BLKID_CMT=#
- 	AC_MSG_RESULT([Disabling private blkid library])
- else
-@@ -786,15 +786,15 @@
- dnl
- SEM_INIT_LIB=''
- AC_CHECK_FUNC(sem_init, ,
--  AC_CHECK_LIB(pthread, sem_init,
-+  [AC_CHECK_LIB(pthread, sem_init,
-   	AC_DEFINE(HAVE_SEM_INIT)
-   	SEM_INIT_LIB=-lpthread,
--  AC_CHECK_LIB(rt, sem_init,
-+  [AC_CHECK_LIB(rt, sem_init,
-   	AC_DEFINE(HAVE_SEM_INIT)
-   	SEM_INIT_LIB=-lrt,
--  AC_CHECK_LIB(posix4, sem_init,
-+  [AC_CHECK_LIB(posix4, sem_init,
-   	AC_DEFINE(HAVE_SEM_INIT)
--  	SEM_INIT_LIB=-lposix4))))dnl
-+  	SEM_INIT_LIB=-lposix4)])])])dnl
- AC_SUBST(SEM_INIT_LIB)
- dnl
- dnl Check for unified diff
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/acinclude.m4 b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/acinclude.m4
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/acinclude.m4
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/acinclude.m4
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/mkdir.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/mkdir.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/mkdir.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/mkdir.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 1a1a7b8..4476ae6 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -25,3 +25,53 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz \
 
 inherit autotools gettext
 
+EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd"
+EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
+EXTRA_OECONF_darwin8 = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
+
+do_configure_prepend () {
+	cp ${WORKDIR}/acinclude.m4 ${S}/
+}
+
+do_compile_prepend () {
+	find ./ -print | grep -v ./patches | xargs chmod u=rwX
+	( cd util; ${BUILD_CC} subst.c -o subst )
+}
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install
+	oe_runmake 'DESTDIR=${D}' install-libs
+	# We use blkid from util-linux now so remove from here
+	rm -f ${D}${base_libdir}/libblkid*
+	rm -rf ${D}${includedir}/blkid
+	rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
+}
+
+do_install_append () {
+	# e2initrd_helper and the pkgconfig files belong in libdir
+	install -d ${D}${libdir}
+	mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
+	mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
+}
+
+# blkid used to be part of e2fsprogs but is useful outside, add it
+# as an RDEPENDS_${PN} so that anything relying on it being in e2fsprogs
+# still works
+RDEPENDS_e2fsprogs = "e2fsprogs-blkid e2fsprogs-badblocks"
+
+PACKAGES =+ "e2fsprogs-blkid e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-fsck e2fsprogs-tune2fs e2fsprogs-badblocks"
+PACKAGES =+ "libcomerr libss libe2p libext2fs"
+
+FILES_e2fsprogs-blkid = "${base_sbindir}/blkid"
+FILES_e2fsprogs-fsck = "${base_sbindir}/fsck"
+FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
+FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs ${base_sbindir}/mkfs.ext* ${sysconfdir}/mke2fs.conf"
+FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label ${base_sbindir}/findfs"
+FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
+FILES_libcomerr = "${base_libdir}/libcom_err.so.*"
+FILES_libss = "${base_libdir}/libss.so.*"
+FILES_libe2p = "${base_libdir}/libe2p.so.*"
+FILES_libext2fs = "${base_libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
+FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
deleted file mode 100644
index a956247..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-require e2fsprogs.inc
-
-PR = "r4"
-
-SRC_URI += "file://quotefix.patch \
-            file://acinclude.m4"
-
-SRC_URI[md5sum] = "05f70470aea2ef7efbb0845b2b116720"
-SRC_URI[sha256sum] = "3f8ac1fedd7c4bec480afcbe4acabdd4ac59ec0446a0fd50c8975cd0aad7b176"
-#file://no-hardlinks.patch
-
-PARALLEL_MAKE = ""
-
-EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd"
-EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
-EXTRA_OECONF_darwin8 = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
-
-do_configure_prepend () {
-	cp ${WORKDIR}/acinclude.m4 ${S}/
-}
-
-do_compile_prepend () {
-	find ./ -print | grep -v ./patches | xargs chmod u=rwX
-	( cd util; ${BUILD_CC} subst.c -o subst )
-}
-
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install
-	oe_runmake 'DESTDIR=${D}' install-libs
-	# We use blkid from util-linux now so remove from here
-	rm -f ${D}${base_libdir}/libblkid*
-	rm -rf ${D}${includedir}/blkid
-	rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
-}
-
-do_install_append () {
-	# e2initrd_helper and the pkgconfig files belong in libdir
-	install -d ${D}${libdir}
-	mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
-	mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
-}
-
-# blkid used to be part of e2fsprogs but is useful outside, add it
-# as an RDEPENDS_${PN} so that anything relying on it being in e2fsprogs
-# still works
-RDEPENDS_e2fsprogs = "e2fsprogs-blkid e2fsprogs-badblocks"
-
-PACKAGES =+ "e2fsprogs-blkid e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-fsck e2fsprogs-tune2fs e2fsprogs-badblocks"
-PACKAGES =+ "libcomerr libss libe2p libext2fs"
-
-FILES_e2fsprogs-blkid = "${base_sbindir}/blkid"
-FILES_e2fsprogs-fsck = "${base_sbindir}/fsck"
-FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
-FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs ${base_sbindir}/mkfs.ext* ${sysconfdir}/mke2fs.conf"
-FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label ${base_sbindir}/findfs"
-FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
-FILES_libcomerr = "${base_libdir}/libcom_err.so.*"
-FILES_libss = "${base_libdir}/libss.so.*"
-FILES_libe2p = "${base_libdir}/libe2p.so.*"
-FILES_libext2fs = "${base_libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
-FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
new file mode 100644
index 0000000..3eb4ed4
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
@@ -0,0 +1,6 @@
+require e2fsprogs.inc
+
+SRC_URI += "file://acinclude.m4"
+SRC_URI[md5sum] = "a3c4ffd7352310ab5e9412965d575610"
+SRC_URI[sha256sum] = "55b46db0cec3e2eb0e5de14494a88b01ff6c0500edf8ca8927cad6da7b5e4a46"
+
-- 
1.7.7.5



