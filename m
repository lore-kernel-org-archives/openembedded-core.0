Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 537366AC78
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 00:57:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s630vpEP021907
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jul 2014 17:57:51 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 2 Jul 2014 17:57:50 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jul 2014 19:57:43 -0500
Message-ID: <17628708bd7c1acda8c820ca70e3eff3835d4fe0.1404348351.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1404348351.git.mark.hatle@windriver.com>
References: <cover.1404348351.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [v2 PATCH 3/7] db: Add version 6.0.30
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
X-List-Received-Date: Thu, 03 Jul 2014 00:57:51 -0000
Content-Type: text/plain

The latest version of RPM5 requires Berkley DB 6.0.20 or newer.

The license is now AGPL-3.0 in BDB 6.0.  This may not be acceptable to some, so
the previous version is retained as an alternative.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../db/db/arm-thumb-mutex_db5.patch                |  10 ++
 meta/recipes-support/db/db_6.0.30.bb               | 114 +++++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-support/db/db_6.0.30.bb

diff --git a/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch b/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch
index 40b13de..34e8db8 100644
--- a/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch
+++ b/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch
@@ -1,5 +1,15 @@
+Original patch submitted by jbowler@nslu2-linux.org on 2005-11-17:
+
+db: fix thumb uclibc operation in 4.3.29
+  - uclibc thumb builds were using libpthread to implement mutexes, the
+  - uclibc version seems to be a stub (at least on thumb).  This commit
+  - fixes the ARM/gcc-assembly mutex implementation so that it has thumb
+  - support and the resultant db4 works (tested on LE Thumb uclibc)
+
 Upstream-Status: Inappropriate [embedded specific]
 
+Author: jbowler@nslu2-linux.org
+
 --- db-5.1.19/src/dbinc/mutex_int.h.orig	2011-01-05 19:21:42.181805366 -0600
 +++ db-5.1.19/src/dbinc/mutex_int.h	2011-01-05 19:24:53.141853117 -0600
 @@ -474,6 +474,25 @@
diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
new file mode 100644
index 0000000..9fc4a30
--- /dev/null
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -0,0 +1,114 @@
+# Version 6 of the Berkeley DB from Oracle (formerly Sleepycat)
+#
+# At present this package only installs the DB code
+# itself (shared libraries, .a in the dev package),
+# documentation and headers.
+#
+# The headers have the same names as those as v3
+# of the DB, only one version can be used *for dev*
+# at once - DB3 and DB6 can both be installed on the
+# same system at the same time if really necessary.
+SECTION = "libs"
+SUMMARY = "Berkeley Database v6"
+HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
+LICENSE = "AGPL-3.0"
+VIRTUAL_NAME ?= "virtual/db"
+RCONFLICTS_${PN} = "db3"
+
+SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
+SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
+            file://fix-parallel-build.patch \
+           "
+
+SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b"
+SRC_URI[sha256sum] = "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6a20fd2"
+
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490"
+
+inherit autotools
+
+# Put virtual/db in any appropriate provider of a
+# relational database, use it as a dependency in
+# place of a specific db and use:
+#
+# PREFERRED_PROVIDER_virtual/db
+#
+# to select the correct db in the build (distro) .conf
+PROVIDES += "${VIRTUAL_NAME}"
+
+# bitbake isn't quite clever enough to deal with sleepycat,
+# the distribution sits in the expected directory, but all
+# the builds must occur from a sub-directory.  The following
+# persuades bitbake to go to the right place
+S = "${WORKDIR}/db-${PV}/dist"
+B = "${WORKDIR}/db-${PV}/build_unix"
+
+# The executables go in a separate package - typically there
+# is no need to install these unless doing real database
+# management on the system.
+inherit lib_package
+
+PACKAGES =+ "${PN}-cxx"
+FILES_${PN}-cxx = "${libdir}/*cxx*so"
+
+
+# The dev package has the .so link (as in db3) and the .a's -
+# it is therefore incompatible (cannot be installed at the
+# same time) as the db3 package
+# sort out the .so since they do version prior to the .so
+SOLIBS = "-6*.so"
+FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
+
+#configuration - set in local.conf to override
+# All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
+DB6_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
+
+EXTRA_OECONF = "${DB6_CONFIG} --enable-shared --enable-cxx --with-sysroot"
+
+# Override the MUTEX setting here, the POSIX library is
+# the default - "POSIX/pthreads/library".
+# Don't ignore the nice SWP instruction on the ARM:
+# These enable the ARM assembler mutex code
+ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
+MUTEX = ""
+MUTEX_arm = "${ARM_MUTEX}"
+MUTEX_armeb = "${ARM_MUTEX}"
+EXTRA_OECONF += "${MUTEX}"
+
+# Cancel the site stuff - it's set for db3 and destroys the
+# configure.
+CONFIG_SITE = ""
+do_configure() {
+	gnu-configize --force ${S}
+	export STRIP="true"
+	oe_runconf
+}
+
+do_compile_prepend() {
+	sed -i -e 's|hardcode_into_libs=yes|hardcode_into_libs=no|' \
+		${B}/libtool
+}
+
+do_install_append() {
+	mkdir -p ${D}/${includedir}/db60
+	mv ${D}/${includedir}/db.h ${D}/${includedir}/db60/.
+	mv ${D}/${includedir}/db_cxx.h ${D}/${includedir}/db60/.
+	ln -s db60/db.h ${D}/${includedir}/db.h
+	ln -s db60/db_cxx.h ${D}/${includedir}/db_cxx.h
+
+	# The docs end up in /usr/docs - not right.
+	if test -d "${D}/${prefix}/docs"
+	then
+		mkdir -p "${D}/${datadir}"
+		test ! -d "${D}/${docdir}" || rm -rf "${D}/${docdir}"
+		mv "${D}/${prefix}/docs" "${D}/${docdir}"
+	fi
+
+	chown -R root:root ${D}
+}
+
+INSANE_SKIP_${PN} = "dev-so"
+INSANE_SKIP_${PN}-cxx = "dev-so"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
1.9.3


