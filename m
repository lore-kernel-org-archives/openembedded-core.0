Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TjhRe-0004Bg-Bw
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 03:25:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBF2B5C3029600
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 18:11:05 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 14 Dec 2012 18:11:04 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 20:10:57 -0600
Message-ID: <344997e252e611dab1772e71d80500d92937da39.1355536994.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1355536994.git.peter.seebach@windriver.com>
References: <cover.1355536994.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo_git.bb and friends: Update to 1.4.2.
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
X-List-Received-Date: Sat, 15 Dec 2012 02:25:45 -0000
Content-Type: text/plain

Pseudo 1.4.2 adds a linkat() wrapper, needed for coreutils to work
on some newer systems. It also changes the way $(LIB) is used with
enable-static-sqlite, because this was broken for some 64-bit builds
(not in yocto, though). As a side-effect, the pseudo.inc recipe has
to be altered to use --with-static-sqlite=(explicit path), because the
default is that 64-bit pseudo would use lib64/libsqlite3.a.

Note that the same --with-static-sqlite= is used for both 64-bit and
32-bit builds on 64-bit systems with NO32LIBS = 0. This sounds scary,
but it's harmless; we only build the library for 32-bit, and the library
never actually uses the sqlite library; it just has to be specfied for
configure to complete. (This is going to become a low-priority bug
report for pseudo: It should have a configuration option for "library
only, and don't worry about sqlite.")

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc      |    9 +++++----
 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb |    8 --------
 meta/recipes-devtools/pseudo/pseudo_1.4.2.bb |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    6 +++---
 4 files changed, 16 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.2.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 98f706c..e38bec8 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -30,9 +30,9 @@ NO32LIBS ??= "1"
 # Compile for the local machine arch...
 do_compile () {
 	if [ "${SITEINFO_BITS}" = "64" ]; then
-	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-static-sqlite=${prefix}/lib/libsqlite3.a --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath
 	else
-	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-static-sqlite=${prefix}/lib/libsqlite3.a --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath
 	fi
 	oe_runmake ${MAKEOPTS}
 }
@@ -51,7 +51,7 @@ do_compile_prepend_class-native () {
 		# built this will fail and be ignored.
 		make ${MAKEOPTS} distclean || :
 
-		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
+		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-static-sqlite=${prefix}/lib/libsqlite3.a --bits=32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
 		make 'LIB=foo' ${MAKEOPTS} distclean 
@@ -63,7 +63,8 @@ do_compile_prepend_class-nativesdk () {
 		# We need the 32-bit libpseudo on a 64-bit machine...
                 # ... and we really, really, hope that the native host is
                 # x86, or else --bits may not work.
-		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
+
+		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-static-sqlite=${prefix}/lib/libsqlite3.a --bits=32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
 		make 'LIB=foo' ${MAKEOPTS} distclean 
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
deleted file mode 100644
index 70fe9c0..0000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require pseudo.inc
-
-PR = "r13"
-
-SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "b49bb87c7e1de33f37fea479ddb99dca"
-SRC_URI[sha256sum] = "ae4bfba2bd1e3954ea8f83bf06571ee4958bf7623e4fa897056281dddfe6446d"
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.2.bb
new file mode 100644
index 0000000..fb0d178
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.4.2.bb
@@ -0,0 +1,8 @@
+require pseudo.inc
+
+PR = "r14"
+
+SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "44270e55c3b1323a5f0a1473ecb708a6"
+SRC_URI[sha256sum] = "c848f5555162e4d3eeed99b0993c794e625714b876315c24273490e0376ce3a8"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index e394ffb..5d5ff8c 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,8 +1,8 @@
 require pseudo.inc
 
-SRCREV = "398a264490713c912b4ce465251a8a82a7905f45"
-PV = "1.4.1+git${SRCPV}"
-PR = "r28"
+SRCREV = "2f56acf04e85cfd617eaded954c1ce40403d7f66"
+PV = "1.4.2+git${SRCPV}"
+PR = "r29"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.0.4



