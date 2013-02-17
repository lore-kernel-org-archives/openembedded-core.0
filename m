Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U7E8F-00086b-OJ
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 00:58:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1HNgm12013570
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 15:42:48 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Sun, 17 Feb 2013 15:42:47 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 17:42:45 -0600
Message-ID: <fab874ebf432682c726673e7d9845da1b4049ae7.1361144379.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1361144379.git.peter.seebach@windriver.com>
References: <cover.1361144379.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo.inc: pseudo 1.5 uprev, support extra config flags
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Feb 2013 23:58:56 -0000
Content-Type: text/plain

The pseudo 1.5 update is a moderately experimental set of changes
which ought to improve performance. With these changes, pseudo
uses an in-memory sqlite database which is lushed on exit,
the protocol is changed to reduce waiting for server responses,
and pseudo can suppress any and all fsync/fdatasync type operations.

This last feature is optional, and not on by default, so we need
to pass in an extra configure argument, but that argument wouldn't
be known to an older configure, so... Enter PSEUDO_EXTRA_OPTS which
is passed to configure, and which pseudo_1.5.bb sets by default to
"--enable-force-async". (I haven't added it in pseudo_git.bb, but
maybe it should be changed; I'm not quite as sure there.)

The justification for these changes is that, for most of the real-world
build cases I deal with, they produce a 25% or more reduction in the
build time of a project. This increases when a system is heavily
loaded.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc    |    8 ++++----
 meta/recipes-devtools/pseudo/pseudo_1.5.bb |   10 ++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb |    4 ++--
 3 files changed, 16 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.5.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 9748d54..3baf3af 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -30,9 +30,9 @@ NO32LIBS ??= "1"
 # Compile for the local machine arch...
 do_compile () {
 	if [ "${SITEINFO_BITS}" = "64" ]; then
-	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
 	else
-	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
 	fi
 	oe_runmake ${MAKEOPTS}
 }
@@ -51,7 +51,7 @@ do_compile_prepend_class-native () {
 		# built this will fail and be ignored.
 		make ${MAKEOPTS} distclean || :
 
-		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
+		./configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
 		make 'LIB=foo' ${MAKEOPTS} distclean 
@@ -63,7 +63,7 @@ do_compile_prepend_class-nativesdk () {
 		# We need the 32-bit libpseudo on a 64-bit machine...
                 # ... and we really, really, hope that the native host is
                 # x86, or else --bits may not work.
-		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
+		./configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
 		make 'LIB=foo' ${MAKEOPTS} distclean 
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.bb
new file mode 100644
index 0000000..66ff646
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.5.bb
@@ -0,0 +1,10 @@
+require pseudo.inc
+
+PR = "r3"
+
+SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "e735bc099f2b9fd6d3f152a8c71e6315"
+SRC_URI[sha256sum] = "41a73c59296b9d48005e0f911dd1becf25ffc3ff4cf4268020f2332efcffbf49"
+
+PSEUDO_EXTRA_OPTS ?= "--enable-force-async"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index b895d2f..0c872e3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "011b401fb6be38d739215e455588af4dcd707e17"
-PV = "1.4.5+git${SRCPV}"
+SRCREV = "e076225ccdd10dabe3d6097c0682d8c88bd58753"
+PV = "1.5+git${SRCPV}"
 PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.0.4



