Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id EE4AA77060
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 23:59:05 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id a4so5296148wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 15:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JXMJGK9Zae3FJbQ30QAssF3q+OM/ZltTTQMr9fjnSSI=;
	b=vzTyxHrEHMU3jRzg++1k7fGvcsujvnOWKN73NZNE/1idpZlxoJLN5sfO/kkQX9p6Mo
	RZPJoaLik9cpXl0JSXfPvSKSVTeEV17MYKUOOEp+x908AgU/WnnUNVCgYKTeDvpGdeoV
	8pmF+GMYgdgzDPiRZPiGAq70OE2l6crnOKIdcxKjqddBlDefoQYAJ+EjeINmj+UB0cUK
	AmbK4gSwiVM7GC5P7ansAiH8UB6hl1sAQjMyDpOlH7cN2TEFxRSMJhT+yAQCbL97cLeW
	Xrm4WWDZYcj3EnejH1EvKsyKu4DLhL26RbhEkwAG/YO4e0a7ss5ZG2sKMf4lfpC0POX7
	Jmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JXMJGK9Zae3FJbQ30QAssF3q+OM/ZltTTQMr9fjnSSI=;
	b=falFOQnHyqp5F6RHX/hjQn2tEtdzX/cj+CcnwtxT080gpT5gscKSpr5YpuaGVd7sjV
	2UtK22jIV3bKfO+l/tvSp0g/SSAjir81qDwKi3QrsJSF/SRFANccS9qo2bojidz+dMDf
	kkwotGE0gcg2ndL3sjech5sPwSCADRyWiqb72SdeT7RT4Qr8kDos73+HxuHo+3VobEyv
	jbGmSeZwbaR1ok2kWUGOyUEeh79KF7kR2t5kczRVDEbmGEv/eE/pRPaIjMw29NbHgm4W
	8AUkCYNGfyIQv+9RR5Gt2iXpkcgzxzabh7GxTCTc3T2+iIMo9YtCnSXTLuPRTd5pSwtc
	at2g==
X-Gm-Message-State: AG10YOTvjFO8rLwpANeF0MmgMCMr8lhbJ3ZsBV3h5d/3zjqB1e7M5ngSx1np33x8fqMqueby
X-Received: by 10.28.53.4 with SMTP id c4mr252052wma.34.1456358345886;
	Wed, 24 Feb 2016 15:59:05 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lh1sm5185356wjb.20.2016.02.24.15.59.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 15:59:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 23:59:00 +0000
Message-Id: <1456358340-11041-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
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
X-List-Received-Date: Wed, 24 Feb 2016 23:59:08 -0000

Instead of setting S to a directory inside the tarball and B to another
directory inside the tarball, use the default value of S and set
AUTOTOOLS_SCRIPT_PATH to the right path to find configure.

Rebase two patches to reflect the change of patch root.

For some reason doing this results in the libtool binary appearing at the wrong
place, so always point LIBTOOL at the one in the sysroot and remove the sed
which doesn't seem to have a reason (added in a484b3 without explanation in
2013).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...akefile-let-libso_target-depend-on-bt_rec.patch |  4 +-
 .../recipes-support/db/db/fix-parallel-build.patch |  4 +-
 meta/recipes-support/db/db_6.0.30.bb               | 52 +++++++++-------------
 3 files changed, 25 insertions(+), 35 deletions(-)

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
diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index 9505def..9475e82 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -17,11 +17,11 @@ RCONFLICTS_${PN} = "db3"
 
 RECIPE_NO_UPDATE_REASON = "Updating to 6.1.x requires also updating rpm to 5.4.15"
 
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
@@ -31,9 +31,7 @@ SRC_URI[sha256sum] = "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6
 UPSTREAM_CHECK_REGEX = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
 UPSTREAM_CHECK_URI = "http://www.oracle.com/technetwork/products/berkeleydb/downloads/index-082944.html"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490"
-
-inherit autotools
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490"
 
 # Put virtual/db in any appropriate provider of a
 # relational database, use it as a dependency in
@@ -44,13 +42,7 @@ inherit autotools
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
@@ -60,7 +52,6 @@ inherit lib_package
 PACKAGES =+ "${PN}-cxx"
 FILES_${PN}-cxx = "${libdir}/*cxx*so"
 
-
 # The dev package has the .so link (as in db3) and the .a's -
 # it is therefore incompatible (cannot be installed at the
 # same time) as the db3 package
@@ -74,6 +65,17 @@ DB6_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disabl
 
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
@@ -83,21 +85,7 @@ MUTEX = ""
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
-
-do_compile_prepend() {
-	sed -i -e 's|hardcode_into_libs=yes|hardcode_into_libs=no|' \
-		${B}/libtool
-}
+EXTRA_OEMAKE += "STRIP=true LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 
 do_install_append() {
 	mkdir -p ${D}/${includedir}/db60
@@ -117,6 +105,8 @@ do_install_append() {
 	chown -R root:root ${D}
 }
 
+# libdb isn't versioned in the typical manner (libdb-6.0.so is the full library
+# name) so skip these checks.
 INSANE_SKIP_${PN} = "dev-so"
 INSANE_SKIP_${PN}-cxx = "dev-so"
 
-- 
2.7.0


