Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QTiv1-0001zK-PV
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 01:09:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p56N5sVW001056
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 16:05:54 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 6 Jun 2011 16:05:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jun 2011 18:15:46 -0500
Message-ID: <4afec421e49b3aa5404170b39ae8a95c8362f5a7.1307402014.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307402014.git.mark.hatle@windriver.com>
References: <cover.1307402014.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] pseudo: Update pseudo to 1.1.1 version
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
X-List-Received-Date: Mon, 06 Jun 2011 23:09:12 -0000
Content-Type: text/plain

Update both the core and pseudo_git packages to the latest 1.1.1 verison.

This fixes an issues where the call system() was not wrapped.  This could
lead to issues where certain spawned commands broke out of a pseudo-chroot
and created files in the wrong place.

Also the update the 1.0 -> 1.1.1 adds additional capabilities such as
beginning support for MacOS X.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc            |   10 +++++-----
 .../pseudo/{pseudo_1.0.bb => pseudo_1.1.1.bb}      |    4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.0.bb => pseudo_1.1.1.bb} (51%)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index a458dcc..df09b0d 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -18,7 +18,7 @@ NO32LIBS ??= "0"
 
 # Compile for the local machine arch...
 do_compile () {
-	${S}/configure --prefix=${prefix} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS}
+	${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} # --bits=${SITEINFO_BITS}
 	oe_runmake 'LIB=lib/pseudo/lib$(MARK64)'
 }
 
@@ -28,8 +28,8 @@ do_compile () {
 do_compile_prepend_virtclass-native () {
 	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
-		./configure --prefix=${prefix} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
-		oe_runmake 'CFLAGS=-m32' 'LIB=lib/pseudo/lib' libpseudo
+		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} # --bits=32
+		oe_runmake 'CFLAGS=-m32' libpseudo 'LIB=lib/pseudo/lib$(MARK64)'
 		# prevent it from removing the lib, but remove everything else
 		make 'LIB=foo' distclean 
 	fi
@@ -38,8 +38,8 @@ do_compile_prepend_virtclass-native () {
 do_compile_prepend_virtclass-nativesdk () {
 	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
-		./configure --prefix=${prefix} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
-		oe_runmake 'CFLAGS=-m32' 'LIB=lib/pseudo/lib' libpseudo
+		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} # --bits=32
+		oe_runmake 'CFLAGS=-m32' libpseudo 'LIB=lib/pseudo/lib$(MARK64)'
 		# prevent it from removing the lib, but remove everything else
 		make 'LIB=foo' distclean 
 	fi
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.0.bb b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
similarity index 51%
rename from meta/recipes-devtools/pseudo/pseudo_1.0.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
index e750e8a..8bf6d07 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.0.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
@@ -5,5 +5,5 @@ PR = "r0"
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://static_sqlite.patch"
 
-SRC_URI[md5sum] = "a329bd00ba78711bcacd48fc1982af6a"
-SRC_URI[sha256sum] = "cb41c97094044144ef4027ab9dbba009f3cb1c23e6bec9640f29d530524ad60f"
+SRC_URI[md5sum] = "dd59766c17e199fe6144fce8a2c67802"
+SRC_URI[sha256sum] = "c697f643577d661c3ce826504b9dcd11fa98e78a5d10e3c83931da8942f6bfad"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 2b9fe70..cf3b191 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,8 +1,8 @@
 require pseudo.inc
 
-SRCREV = "5434325fc887817ebb2bad36313d8277992cef1d"
-PV = "1.0+git${SRCPV}"
-PR = "r18"
+SRCREV = "1d3e67cb168c3459e67a0b29f071ca30ed17dadc"
+PV = "1.1.1+git${SRCPV}"
+PR = "r19"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.3.4



