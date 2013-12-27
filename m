Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 59ADC60D8A
	for <openembedded-core@openembedded.org>;
	Fri, 27 Dec 2013 17:54:54 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id e9so8781110qcy.20
	for <openembedded-core@openembedded.org>;
	Fri, 27 Dec 2013 09:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=gAEAIFvFaSXUVKMuNg7HmeemsZOP3s6vo+89Z+23ThY=;
	b=eaiEliqfFZnIOjkUx2gM9PUQy6Sqan2SHzGfkVTWB3vxg/LUG9fVlx/dHKb39tgWk8
	LsWlOdna5wvnecs28NenPenNU33oDPmSlzRPCq76EtC6xrvq0dCLdguKRwP95SWi2y+U
	SeBA5bPPyT0C4BqNjoLkljgAh/2OjYCxnmiLOJBA/gxFPcs5BhtPXoAWw1bsBfkg3w/B
	Lp0Icn0l4GT2SAYGJr9dSO83vDFoTr0brBg3Uz0aC5mwfg5OOoLbGJuFxXwlYTUN3xAZ
	73ygvlBE6laYK5KutuAsGdNZtknf2AFWwTwd37P8Lcf0LqUzO4yb0Hs1gPUW/VrlMWP8
	PeWw==
X-Received: by 10.229.179.69 with SMTP id bp5mr81200116qcb.17.1388166894692;
	Fri, 27 Dec 2013 09:54:54 -0800 (PST)
Received: from localhost.localdomain
	(pool-71-171-43-170.ronkva.east.verizon.net. [71.171.43.170])
	by mx.google.com with ESMTPSA id q2sm44493051qer.22.2013.12.27.09.54.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Dec 2013 09:54:54 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@openembedded.org
Date: Fri, 27 Dec 2013 12:54:51 -0500
Message-Id: <1388166891-850-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
Cc: Steve Arnold <esteve@gentoogeek.org>
Subject: db : Include C++ binding library in Berkeley DB recipe.
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
X-List-Received-Date: Fri, 27 Dec 2013 17:54:54 -0000

Create the C++ library for db. This library is packaged in a new
package so the db package only contains the c library. This prevents
existing users from adding libstdc++ to the package DEPENDS.

Signed-off-by: Philip Balister <philip@balister.org>
Signed-off-by: Douglas Geiger <doug.geiger@bioradiation.net>
Signed-off-by: Steve Arnold <esteve@gentoogeek.org>
---
 meta/recipes-support/db/db_5.3.21.bb | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/db/db_5.3.21.bb b/meta/recipes-support/db/db_5.3.21.bb
index 328f9db..1f1eca2 100644
--- a/meta/recipes-support/db/db_5.3.21.bb
+++ b/meta/recipes-support/db/db_5.3.21.bb
@@ -17,7 +17,8 @@ RCONFLICTS_${PN} = "db3"
 
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
-            file://fix-parallel-build.patch"
+            file://fix-parallel-build.patch \
+           "
 
 SRC_URI[md5sum] = "3fda0b004acdaa6fa350bfc41a3b95ca"
 SRC_URI[sha256sum] = "ddd92a930317df92021054c03992392db9ea5cddba43bef8920d392a82114fb8"
@@ -47,18 +48,22 @@ B = "${WORKDIR}/db-${PV}/build_unix"
 # management on the system.
 inherit lib_package
 
+PACKAGES =+ "${PN}-cxx"
+FILES_${PN}-cxx = "${libdir}/*cxx*so"
+
+
 # The dev package has the .so link (as in db3) and the .a's -
 # it is therefore incompatible (cannot be installed at the
 # same time) as the db3 package
 # sort out the .so since they do version prior to the .so
 SOLIBS = "-5*.so"
-FILES_SOLIBSDEV = "${libdir}/libdb.so"
+FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
 
 #configuration - set in local.conf to override
 # All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
 DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
 
-EXTRA_OECONF = "${DB5_CONFIG}"
+EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx"
 
 # Override the MUTEX setting here, the POSIX library is
 # the default - "POSIX/pthreads/library".
@@ -80,16 +85,17 @@ do_configure() {
 	oe_runconf
 }
 
+do_compile_prepend_class-target() {
+	sed -i -e 's|hardcode_into_libs=yes|hardcode_into_libs=no|' \
+		${B}/libtool
+}
+
 do_install_append() {
 	mkdir -p ${D}/${includedir}/db51
-	#mv ${D}/${includedir}/db_185.h ${D}/${includedir}/db51/.
 	mv ${D}/${includedir}/db.h ${D}/${includedir}/db51/.
 	mv ${D}/${includedir}/db_cxx.h ${D}/${includedir}/db51/.
-	#mv ${D}/${includedir}/dbsql.h ${D}/${includedir}/db51/.
-	#ln -s db51/db_185.h ${D}/${includedir}/db_185.h
 	ln -s db51/db.h ${D}/${includedir}/db.h
 	ln -s db51/db_cxx.h ${D}/${includedir}/db_cxx.h
-	#ln -s db51/dbsql.h ${D}/${includedir}/dbsql.h
 
 	# The docs end up in /usr/docs - not right.
 	if test -d "${D}/${prefix}/docs"
@@ -103,6 +109,7 @@ do_install_append() {
 }
 
 INSANE_SKIP_${PN} = "dev-so"
+INSANE_SKIP_${PN}-cxx = "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.8.3.1


