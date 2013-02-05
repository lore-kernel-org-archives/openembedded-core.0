Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U2pGp-0006aR-SC
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 21:37:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r15KLiLP014129
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Feb 2013 12:21:44 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 5 Feb 2013 12:21:44 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Feb 2013 14:21:42 -0600
Message-ID: <768ec71bf1a83c72483a5a167fadba658b3d1cfa.1360095480.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1360095480.git.peter.seebach@windriver.com>
References: <cover.1360095480.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo.inc: Fix sqlite libdir again, pseudo 1.4.3
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
X-List-Received-Date: Tue, 05 Feb 2013 20:37:38 -0000
Content-Type: text/plain

This updates to pseudo 1.4.3. Changes:

1. A couple of minor tweaks to reduce difficulties using SDKs built
   on slightly more recent machines on older machines; specifically,
   avoiding getting @GLIBC_2.7 symbol references for sscanf(), fscanf(),
   and open2().
2. Revision of the logic determining the library directory to use for
   sqlite's library files.

The latter is a source of difficulty because it's come up a few times
that we may want pseudo to use lib64 for libpseudo.so, but bitbake's
usual setup would have libsqlite3.a in lib regardless of bit width.
Cleaned up previous design a bit by providing a distinct setting for
sqlite-lib, which defaults to the same library directory used for other
things. Adjusted build to use this new setting. (This ends up being
${baselib}; on targets, that might not be lib, but for native builds
it generally is, and for SDK builds it appears to do the right thing.)

Testing: Successful build of meta-toolchain for both 64-bit and 32-bit
SDKMACHINE, and builds with NO32LIBS = "0" also succeeded. Also builds
for multilib targets.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc      |    8 ++++----
 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb |    8 --------
 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    6 +++---
 4 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 98f706c..9748d54 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -30,9 +30,9 @@ NO32LIBS ??= "1"
 # Compile for the local machine arch...
 do_compile () {
 	if [ "${SITEINFO_BITS}" = "64" ]; then
-	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
 	else
-	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
 	fi
 	oe_runmake ${MAKEOPTS}
 }
@@ -51,7 +51,7 @@ do_compile_prepend_class-native () {
 		# built this will fail and be ignored.
 		make ${MAKEOPTS} distclean || :
 
-		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
+		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
 		make 'LIB=foo' ${MAKEOPTS} distclean 
@@ -63,7 +63,7 @@ do_compile_prepend_class-nativesdk () {
 		# We need the 32-bit libpseudo on a 64-bit machine...
                 # ... and we really, really, hope that the native host is
                 # x86, or else --bits may not work.
-		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
+		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
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
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.3.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
new file mode 100644
index 0000000..8f25bd0
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
@@ -0,0 +1,8 @@
+require pseudo.inc
+
+PR = "r0"
+
+SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "ac943153aa78e210e2d0db7c85845db3"
+SRC_URI[sha256sum] = "0ca12a319c0ee87d1c8b2a4310c36a6d68d8d4b8c9c7dba00bace1773baf18e8"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index e394ffb..bbdba43 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,8 +1,8 @@
 require pseudo.inc
 
-SRCREV = "398a264490713c912b4ce465251a8a82a7905f45"
-PV = "1.4.1+git${SRCPV}"
-PR = "r28"
+SRCREV = "a01d7884e5f3acba1460cf6b500d28390e7af9f8"
+PV = "1.4.3+git${SRCPV}"
+PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.0.4



