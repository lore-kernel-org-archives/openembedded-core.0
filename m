Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id AB39D6FFEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 22:16:48 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id r190so23694185wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 15:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=t52W7vxC4fVqryPyoXsj7uRQWmRrVLTbkBnZHaCeaYM=;
	b=wpcFp8f+w1JdwfuFzMXjgDzGhmMSkU15Bwc5P9fmWGsscLlKj1CS8G0n5MD41/pKa2
	g6AnZrUUrFuh3EVeQ6YV0Jre6IVgBSCbqHZMja4OLcpyTh2hhhsk97JLIBUX5p7l3+5p
	j1aBoNF0LKUjcmzPItXguHFCHyVeHTM+dpn7PLiE2P+ImhoT/SRW8lqy7zDzZrSbBDG4
	510HmXA5Tp76CbmyfdzsCSHioqka5Ty6oTo19lwvADLDb4VrAj3+h+FGaDF5w900p0h2
	eKQOCdOchG7Kyu4IUbeUpAr/bRhXb23fTc7XvzrWnom7nyHQO9XYklQ/jG4Mc+Uh3uJt
	p05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=t52W7vxC4fVqryPyoXsj7uRQWmRrVLTbkBnZHaCeaYM=;
	b=Lzqqtk2RQEgRmKiqhQ56Oahu7qXF5ZnlISQjs5iAUigM5L4t+M/9dCTpg8WU0+yMxX
	jssBAyEYEd4OUDJez0QhZ3H0A37kiRTaq16QFA7WJ16D0OnnaGoY6cVkxLA7ttFL/ZSz
	aIRXtMB5YfEV2MMpKcCsEDk4zIxdouKxAzeIoRJXmsiFRA0LaZIrnO4C0drQ+FIOWBg8
	zLwwqjwUbirgXTjC4SgG77AS8wm/HFCXMAaLYXaQclMIqnsEDW/4NGJ0rQXvfffgQkzu
	WWq6gAgCkS8j0ShhguynX8JzVkOkQOSYZRZQPuyFcn0cVlu31IRdNvTQ5771DZuE70vj
	LHKw==
X-Gm-Message-State: ALyK8tJaAWlS0rvYGBPYanD7vEd0Dpfodjfv+xd7Kzf4CIUr3LXnjY5GLY4fiku9D8eOuHM7
X-Received: by 10.194.141.65 with SMTP id rm1mr2786208wjb.167.1467065808174;
	Mon, 27 Jun 2016 15:16:48 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e69sm13711428wma.2.2016.06.27.15.16.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Jun 2016 15:16:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2016 23:16:43 +0100
Message-Id: <1467065803-6643-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] db: use S/B more idiomatically
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
X-List-Received-Date: Mon, 27 Jun 2016 22:16:49 -0000

Instead of setting S to a directory inside the tarball and B to another
directory inside the tarball, use the default value of S and set
AUTOTOOLS_SCRIPT_PATH to the right path to find configure.

Rebase two patches to reflect the change of patch root, and add patchdir to the
db_5.3.28 recipe so the patches still apply.

Because something is not quite right regarding quilt and patching, add a PR bump
to the recipes to ensure that a clean work directory is used: for some reason
rebuilds will rarely fail to patch correctly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...akefile-let-libso_target-depend-on-bt_rec.patch |  4 +-
 .../recipes-support/db/db/fix-parallel-build.patch |  4 +-
 meta/recipes-support/db/db_5.3.28.bb               | 28 +++++-------
 meta/recipes-support/db/db_6.0.30.bb               | 53 ++++++++++------------
 4 files changed, 40 insertions(+), 49 deletions(-)

diff --git a/meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch b/meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch
index 329bff5..9ec117a 100644
--- a/meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch
+++ b/meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch
@@ -17,8 +17,8 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 
 diff --git a/Makefile.in b/Makefile.in
 index e451f70..0a42375 100644
---- a/Makefile.in
-+++ b/Makefile.in
+--- db/dist/Makefile.in
++++ db/dist/Makefile.in
 @@ -863,7 +863,7 @@ $(libdb_version): $(C_OBJS)
  	$(LN) -s $(libdb_version) $(libdb)
  
diff --git a/meta/recipes-support/db/db/fix-parallel-build.patch b/meta/recipes-support/db/db/fix-parallel-build.patch
index 2c7f1e1..88bc6b3 100644
--- a/meta/recipes-support/db/db/fix-parallel-build.patch
+++ b/meta/recipes-support/db/db/fix-parallel-build.patch
@@ -6,8 +6,8 @@ Upstream-Status: Pending
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
---- dist.orig/Makefile.in	2012-05-11 19:57:48.000000000 +0200
-+++ dist/Makefile.in	2013-10-31 18:17:11.875532522 +0100
+--- db/dist.orig/Makefile.in	2012-05-11 19:57:48.000000000 +0200
++++ db/dist/Makefile.in	2013-10-31 18:17:11.875532522 +0100
 @@ -1034,7 +1034,7 @@
  	    db_recover@o@ util_sig@o@ $(DEF_LIB) $(LIBS)
  	$(POSTLINK) $@
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index c724f04..6b0e76b 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -15,15 +15,17 @@ LICENSE = "Sleepycat"
 VIRTUAL_NAME ?= "virtual/db"
 RCONFLICTS_${PN} = "db3"
 
+PR = "r1"
+
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
-SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
+SRC_URI += "file://arm-thumb-mutex_db5.patch \
             file://fix-parallel-build.patch \
            "
 
 SRC_URI[md5sum] = "b99454564d5b4479750567031d66fe24"
 SRC_URI[sha256sum] = "e0a992d740709892e81f9d93f06daf305cf73fb81b545afe72478043172c3628"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=ed1158e31437f4f87cdd4ab2b8613955"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1158e31437f4f87cdd4ab2b8613955"
 
 inherit autotools
 
@@ -36,14 +38,6 @@ inherit autotools
 # to select the correct db in the build (distro) .conf
 PROVIDES += "${VIRTUAL_NAME}"
 
-# bitbake isn't quite clever enough to deal with sleepycat,
-# the distribution sits in the expected directory, but all
-# the builds must occur from a sub-directory.  The following
-# persuades bitbake to go to the right place
-S = "${WORKDIR}/db-${PV}/dist"
-B = "${WORKDIR}/db-${PV}/build_unix"
-SPDX_S = "${WORKDIR}/db-${PV}"
-
 # The executables go in a separate package - typically there
 # is no need to install these unless doing real database
 # management on the system.
@@ -75,21 +69,22 @@ ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
 MUTEX = ""
 MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
-EXTRA_OECONF += "${MUTEX}"
-EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
+EXTRA_OECONF += "${MUTEX} STRIP=true"
+
+AUTOTOOLS_SCRIPT_PATH = "${S}/dist"
 
 # Cancel the site stuff - it's set for db3 and destroys the
 # configure.
 CONFIG_SITE = ""
 do_configure() {
-	gnu-configize --force ${S}
-	export STRIP="true"
+    cd ${B}
+	gnu-configize --force ${AUTOTOOLS_SCRIPT_PATH}
 	oe_runconf
 }
 
 do_compile_prepend() {
-	sed -i -e 's|hardcode_into_libs=yes|hardcode_into_libs=no|' \
-		${B}/libtool
+    # Stop libtool adding RPATHs
+    sed -i -e 's|hardcode_into_libs=yes|hardcode_into_libs=no|' ${B}/libtool
 }
 
 do_install_append() {
@@ -114,4 +109,3 @@ INSANE_SKIP_${PN} = "dev-so"
 INSANE_SKIP_${PN}-cxx = "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index 018dd58..0852820 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -15,13 +15,15 @@ LICENSE = "AGPL-3.0"
 VIRTUAL_NAME ?= "virtual/db"
 RCONFLICTS_${PN} = "db3"
 
+PR = "r1"
+
 # Note, when upgraded to 6.1.x, a patch in RPM will need to be removed to activate db 6.1 support.
 
-SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
-SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
-            file://fix-parallel-build.patch \
-            file://Makefile-let-libso_target-depend-on-bt_rec.patch \
-            file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch;patchdir=.. \
+SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz \
+           file://arm-thumb-mutex_db5.patch \
+           file://fix-parallel-build.patch \
+           file://Makefile-let-libso_target-depend-on-bt_rec.patch \
+           file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch \
            "
 
 SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b"
@@ -31,9 +33,7 @@ SRC_URI[sha256sum] = "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6
 UPSTREAM_CHECK_REGEX = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
 UPSTREAM_CHECK_URI = "http://www.oracle.com/technetwork/products/berkeleydb/downloads/index-082944.html"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490"
-
-inherit autotools
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490"
 
 # Put virtual/db in any appropriate provider of a
 # relational database, use it as a dependency in
@@ -44,13 +44,7 @@ inherit autotools
 # to select the correct db in the build (distro) .conf
 PROVIDES += "${VIRTUAL_NAME}"
 
-# bitbake isn't quite clever enough to deal with sleepycat,
-# the distribution sits in the expected directory, but all
-# the builds must occur from a sub-directory.  The following
-# persuades bitbake to go to the right place
-S = "${WORKDIR}/db-${PV}/dist"
-B = "${WORKDIR}/db-${PV}/build_unix"
-SPDX_S = "${WORKDIR}/db-${PV}"
+inherit autotools
 
 # The executables go in a separate package - typically there
 # is no need to install these unless doing real database
@@ -60,7 +54,6 @@ inherit lib_package
 PACKAGES =+ "${PN}-cxx"
 FILES_${PN}-cxx = "${libdir}/*cxx*so"
 
-
 # The dev package has the .so link (as in db3) and the .a's -
 # it is therefore incompatible (cannot be installed at the
 # same time) as the db3 package
@@ -74,6 +67,17 @@ DB6_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disabl
 
 EXTRA_OECONF = "${DB6_CONFIG} --enable-shared --enable-cxx --with-sysroot"
 
+# Cancel the site stuff - it's set for db3 and destroys the configure.
+CONFIG_SITE = ""
+
+AUTOTOOLS_SCRIPT_PATH = "${S}/dist"
+
+do_configure() {
+	cd ${B}
+	gnu-configize --force ${AUTOTOOLS_SCRIPT_PATH}
+	oe_runconf
+}
+
 # Override the MUTEX setting here, the POSIX library is
 # the default - "POSIX/pthreads/library".
 # Don't ignore the nice SWP instruction on the ARM:
@@ -83,20 +87,11 @@ MUTEX = ""
 MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX}"
-EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
-
-# Cancel the site stuff - it's set for db3 and destroys the
-# configure.
-CONFIG_SITE = ""
-do_configure() {
-	gnu-configize --force ${S}
-	export STRIP="true"
-	oe_runconf
-}
+EXTRA_OEMAKE += "STRIP=true"
 
 do_compile_prepend() {
-	sed -i -e 's|hardcode_into_libs=yes|hardcode_into_libs=no|' \
-		${B}/libtool
+	# Stop libtool adding RPATHs
+	sed -i -e 's|hardcode_into_libs=yes|hardcode_into_libs=no|' ${B}/libtool
 }
 
 do_install_append() {
@@ -117,6 +112,8 @@ do_install_append() {
 	chown -R root:root ${D}
 }
 
+# libdb isn't versioned in the typical manner (libdb-6.0.so is the full library
+# name) so skip these checks.
 INSANE_SKIP_${PN} = "dev-so"
 INSANE_SKIP_${PN}-cxx = "dev-so"
 
-- 
2.8.1


