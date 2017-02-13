Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 62BE071DCF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:55 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:05:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546681"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:05:55 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:47 +0200
Message-Id: <3523c0981c99116b31455054f7b750512c9386e5.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/36] db: remove the 6.x recipe
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
X-List-Received-Date: Mon, 13 Feb 2017 15:05:55 -0000

Version 6.x of Berkeley DB has been rejected by open source community due to its hostile
AGPLv3 license; both Fedora and Debian are sticking with db 5.x - and by extension,
all the open source projects are still developed and tested with db 5.x

In oe-core the only thing that was requiring db 6.x was rpm 5.x, and so there's no reason
to continue carrying db 6.x in oe-core. If someone needs API features that are only available in
db 6.x, it can be re-added to meta-oe.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/default-versions.inc      |   3 -
 ...Makefile-let-libdb-6.0.la-depend-os_map.l.patch |  29 ------
 ...akefile-let-libso_target-depend-on-bt_rec.patch |  30 ------
 meta/recipes-support/db/db_5.3.28.bb               |   1 +
 meta/recipes-support/db/db_6.0.35.bb               | 111 ---------------------
 5 files changed, 1 insertion(+), 173 deletions(-)
 delete mode 100644 meta/recipes-support/db/db/Makefile-let-libdb-6.0.la-depend-os_map.l.patch
 delete mode 100644 meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch
 delete mode 100644 meta/recipes-support/db/db_6.0.35.bb

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index cc8c533d4c0..d976508ff51 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -5,6 +5,3 @@
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
 
-# Force db-native's version to keep sync with db while
-# 'AGPL-3.0' in ${INCOMPATIBLE_LICENSE} blacklist
-PREFERRED_VERSION_db-native = "${@incompatible_license_contains('AGPL-3.0', '5.%', '6.%', d)}"
diff --git a/meta/recipes-support/db/db/Makefile-let-libdb-6.0.la-depend-os_map.l.patch b/meta/recipes-support/db/db/Makefile-let-libdb-6.0.la-depend-os_map.l.patch
deleted file mode 100644
index 68a213136b6..00000000000
--- a/meta/recipes-support/db/db/Makefile-let-libdb-6.0.la-depend-os_map.l.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 2902dda6e3f7b2cd5796a96af20deece610e2eb9 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 16 Nov 2015 22:20:49 -0800
-Subject: [PATCH] build_unix/Makefile: let libdb-6.0.la depend os_map.lo
-
-Fixed parallel issue:
-libtool: link: `os_map.lo' is not a valid libtool object
-Makefile:867: recipe for target 'libdb-6.0.la' failed
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- dist/Makefile.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: db-6.0.30/dist/Makefile.in
-===================================================================
---- db-6.0.30.orig/dist/Makefile.in
-+++ db-6.0.30/dist/Makefile.in
-@@ -863,7 +863,7 @@ $(libdb_version): $(C_OBJS)
- 	$(LN) -s $(libdb_version) $(libdb)
- 
- # Shared C library.
--$(libso_target): $(C_OBJS) bt_rec@o@
-+$(libso_target): $(C_OBJS) bt_rec@o@ os_map@o@
- 	$(SOLINK) $(SOFLAGS) $(LDFLAGS) -o $@ $(C_OBJS) \
- 		$(LIBCSO_LIBS)
- 	$(RM) $(libdb)
diff --git a/meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch b/meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch
deleted file mode 100644
index 86804083472..00000000000
--- a/meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c640ff9340f358a00835816d0fea03d27a7be978 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 31 Mar 2015 00:56:44 -0700
-Subject: [PATCH] Makefile: let libso_target depend on bt_rec
-
-Fixed parallel issue:
-libtool: link: `bt_rec.lo' is not a valid libtool object
-Makefile:867: recipe for target 'libdb-6.0.la' failed
-make: *** [libdb-6.0.la] Error 1
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: db-6.0.30/dist/Makefile.in
-===================================================================
---- db-6.0.30.orig/dist/Makefile.in
-+++ db-6.0.30/dist/Makefile.in
-@@ -863,7 +863,7 @@ $(libdb_version): $(C_OBJS)
- 	$(LN) -s $(libdb_version) $(libdb)
- 
- # Shared C library.
--$(libso_target): $(C_OBJS)
-+$(libso_target): $(C_OBJS) bt_rec@o@
- 	$(SOLINK) $(SOFLAGS) $(LDFLAGS) -o $@ $(C_OBJS) \
- 		$(LIBCSO_LIBS)
- 	$(RM) $(libdb)
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 0b51a1d4403..4f5aae60132 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -16,6 +16,7 @@ VIRTUAL_NAME ?= "virtual/db"
 RCONFLICTS_${PN} = "db3"
 
 PR = "r1"
+PE = "1"
 
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://arm-thumb-mutex_db5.patch \
diff --git a/meta/recipes-support/db/db_6.0.35.bb b/meta/recipes-support/db/db_6.0.35.bb
deleted file mode 100644
index b1bec0e4875..00000000000
--- a/meta/recipes-support/db/db_6.0.35.bb
+++ /dev/null
@@ -1,111 +0,0 @@
-# Version 6 of the Berkeley DB from Oracle (formerly Sleepycat)
-#
-# At present this package only installs the DB code
-# itself (shared libraries, .a in the dev package),
-# documentation and headers.
-#
-# The headers have the same names as those as v3
-# of the DB, only one version can be used *for dev*
-# at once - DB3 and DB6 can both be installed on the
-# same system at the same time if really necessary.
-SECTION = "libs"
-SUMMARY = "Berkeley Database v6"
-HOMEPAGE = "http://www.oracle.com/technetwork/database/database-technologies/berkeleydb/overview/index.html"
-LICENSE = "AGPL-3.0"
-VIRTUAL_NAME ?= "virtual/db"
-RCONFLICTS_${PN} = "db3"
-
-PR = "r1"
-
-# Note, when upgraded to 6.1.x, a patch in RPM will need to be removed to activate db 6.1 support.
-SRC_URI = "http://distfiles.gentoo.org/distfiles/db-${PV}.tar.gz \
-           file://arm-thumb-mutex_db5.patch \
-           file://fix-parallel-build.patch \
-           file://Makefile-let-libso_target-depend-on-bt_rec.patch \
-           file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch \
-           "
-
-SRC_URI[md5sum] = "c65a4d3e930a116abaaf69edfc697f25"
-SRC_URI[sha256sum] = "24421affa8ae436fe427ae4f5f2d1634da83d3d55a5ad6354a98eeedb825de55"
-
-# Exclude NC versions which lack AES encryption
-UPSTREAM_CHECK_REGEX = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
-UPSTREAM_CHECK_URI = "http://www.oracle.com/technetwork/products/berkeleydb/downloads/index-082944.html"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490"
-
-# Put virtual/db in any appropriate provider of a
-# relational database, use it as a dependency in
-# place of a specific db and use:
-#
-# PREFERRED_PROVIDER_virtual/db
-#
-# to select the correct db in the build (distro) .conf
-PROVIDES += "${VIRTUAL_NAME}"
-
-inherit autotools
-
-# The executables go in a separate package - typically there
-# is no need to install these unless doing real database
-# management on the system.
-inherit lib_package
-
-PACKAGES =+ "${PN}-cxx"
-FILES_${PN}-cxx = "${libdir}/*cxx*so"
-
-# The dev package has the .so link (as in db3) and the .a's -
-# it is therefore incompatible (cannot be installed at the
-# same time) as the db3 package
-# sort out the .so since they do version prior to the .so
-SOLIBS = "-6*.so"
-FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
-
-#configuration - set in local.conf to override
-# All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
-DB6_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
-
-EXTRA_OECONF = "${DB6_CONFIG} --enable-shared --enable-cxx --with-sysroot"
-
-# Cancel the site stuff - it's set for db3 and destroys the configure.
-CONFIG_SITE = ""
-
-AUTOTOOLS_SCRIPT_PATH = "${S}/dist"
-
-do_configure() {
-	cd ${B}
-	gnu-configize --force ${AUTOTOOLS_SCRIPT_PATH}
-	oe_runconf
-}
-
-EXTRA_OEMAKE_append_class-target = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
-EXTRA_OEMAKE += "STRIP=true docdir=${docdir}/db/"
-
-do_compile_prepend() {
-	# Stop libtool adding RPATHs
-	sed -i -e 's|hardcode_into_libs=yes|hardcode_into_libs=no|' ${B}/libtool
-}
-
-do_install_append() {
-	mkdir -p ${D}/${includedir}/db60
-	mv ${D}/${includedir}/db.h ${D}/${includedir}/db60/.
-	mv ${D}/${includedir}/db_cxx.h ${D}/${includedir}/db60/.
-	ln -s db60/db.h ${D}/${includedir}/db.h
-	ln -s db60/db_cxx.h ${D}/${includedir}/db_cxx.h
-
-	# Prune the documentation to remove large (PDF) or pointless (Java) files.
-	find ${D}${docdir} -name *.pdf -delete
-	rm -rf ${D}${docdir}/db/java
-	rm -rf ${D}${docdir}/db/csharp
-
-	# The makefiles use cp -p, so we need to chmod until that is fixed.
-	chown -R root:root ${D}
-}
-
-# libdb isn't versioned in the typical manner (libdb-6.0.so is the full library
-# name) so skip these checks.
-INSANE_SKIP_${PN} = "dev-so"
-INSANE_SKIP_${PN}-cxx = "dev-so"
-
-BBCLASSEXTEND = "native nativesdk"
-
-RECIPE_NO_UPDATE_REASON = "latest db does not work with RPM-5.x due to changes in locking semantics"
-- 
2.11.0


