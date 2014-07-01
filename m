Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AFE9F6AC66
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 20:01:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s61K1GEF017978
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Jul 2014 13:01:16 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 1 Jul 2014 13:01:16 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Jul 2014 15:01:09 -0500
Message-ID: <7ec8091f15256ddcbadf4051867119ae82d333d3.1404244287.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1404244287.git.mark.hatle@windriver.com>
References: <cover.1404244287.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] db: Uprev to 6.0.30
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
X-List-Received-Date: Tue, 01 Jul 2014 20:01:23 -0000
Content-Type: text/plain

The latest version of RPM5 requires Berkley DB 6.0.20 or newer.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../db/db/arm-thumb-mutex_db5.patch                | 10 +++++++
 .../db/{db_5.3.21.bb => db_6.0.30.bb}              | 33 +++++++++++-----------
 2 files changed, 26 insertions(+), 17 deletions(-)
 rename meta/recipes-support/db/{db_5.3.21.bb => db_6.0.30.bb} (77%)

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
diff --git a/meta/recipes-support/db/db_5.3.21.bb b/meta/recipes-support/db/db_6.0.30.bb
similarity index 77%
rename from meta/recipes-support/db/db_5.3.21.bb
rename to meta/recipes-support/db/db_6.0.30.bb
index caf6890..9fc4a30 100644
--- a/meta/recipes-support/db/db_5.3.21.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -1,4 +1,4 @@
-# Version 5 of the Berkeley DB from Sleepycat
+# Version 6 of the Berkeley DB from Oracle (formerly Sleepycat)
 #
 # At present this package only installs the DB code
 # itself (shared libraries, .a in the dev package),
@@ -6,12 +6,12 @@
 #
 # The headers have the same names as those as v3
 # of the DB, only one version can be used *for dev*
-# at once - DB3 and DB5 can both be installed on the
+# at once - DB3 and DB6 can both be installed on the
 # same system at the same time if really necessary.
 SECTION = "libs"
-SUMMARY = "Berkeley Database v5"
+SUMMARY = "Berkeley Database v6"
 HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
-LICENSE = "Sleepycat"
+LICENSE = "AGPL-3.0"
 VIRTUAL_NAME ?= "virtual/db"
 RCONFLICTS_${PN} = "db3"
 
@@ -20,10 +20,10 @@ SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
             file://fix-parallel-build.patch \
            "
 
-SRC_URI[md5sum] = "3fda0b004acdaa6fa350bfc41a3b95ca"
-SRC_URI[sha256sum] = "ddd92a930317df92021054c03992392db9ea5cddba43bef8920d392a82114fb8"
+SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b"
+SRC_URI[sha256sum] = "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6a20fd2"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=32aefa5a8e7318be1f657432cbe2e768"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490"
 
 inherit autotools
 
@@ -56,20 +56,19 @@ FILES_${PN}-cxx = "${libdir}/*cxx*so"
 # it is therefore incompatible (cannot be installed at the
 # same time) as the db3 package
 # sort out the .so since they do version prior to the .so
-SOLIBS = "-5*.so"
+SOLIBS = "-6*.so"
 FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
 
 #configuration - set in local.conf to override
 # All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
-DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
+DB6_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
 
-EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot"
+EXTRA_OECONF = "${DB6_CONFIG} --enable-shared --enable-cxx --with-sysroot"
 
 # Override the MUTEX setting here, the POSIX library is
 # the default - "POSIX/pthreads/library".
 # Don't ignore the nice SWP instruction on the ARM:
-# These enable the ARM assembler mutex code, this won't
-# work with thumb compilation...
+# These enable the ARM assembler mutex code
 ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
 MUTEX = ""
 MUTEX_arm = "${ARM_MUTEX}"
@@ -91,11 +90,11 @@ do_compile_prepend() {
 }
 
 do_install_append() {
-	mkdir -p ${D}/${includedir}/db51
-	mv ${D}/${includedir}/db.h ${D}/${includedir}/db51/.
-	mv ${D}/${includedir}/db_cxx.h ${D}/${includedir}/db51/.
-	ln -s db51/db.h ${D}/${includedir}/db.h
-	ln -s db51/db_cxx.h ${D}/${includedir}/db_cxx.h
+	mkdir -p ${D}/${includedir}/db60
+	mv ${D}/${includedir}/db.h ${D}/${includedir}/db60/.
+	mv ${D}/${includedir}/db_cxx.h ${D}/${includedir}/db60/.
+	ln -s db60/db.h ${D}/${includedir}/db.h
+	ln -s db60/db_cxx.h ${D}/${includedir}/db_cxx.h
 
 	# The docs end up in /usr/docs - not right.
 	if test -d "${D}/${prefix}/docs"
-- 
1.9.3


