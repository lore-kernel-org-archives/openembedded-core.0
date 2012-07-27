Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1Susfv-0008Qx-UT
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 00:06:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6RLsoR1009593
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 14:54:50 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 27 Jul 2012 14:54:50 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 16:54:48 -0500
Message-ID: <46e10fa82df93bea00d11334830c05fff662334c.1343425855.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1343425855.git.peter.seebach@windriver.com>
References: <cover.1343425855.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo.inc/pseudo_1.4.bb: update pseudo to 1.4
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
X-List-Received-Date: Fri, 27 Jul 2012 22:06:24 -0000
Content-Type: text/plain

This update replaces the half-baked --arch logic with the use
of $CFLAGS to pick compiler flags, on the grounds that it makes
a lot more sense for the build system to pick flags than for
pseudo to try to guess what they should be; this should allow
pseudo to at least compile for targets, and possibly run on
them.

This doesn't solve the problem of guessing how to forcibly
build the 32-bit variant on hosts, because we really don't
have a general solution for that. There's no idiom for "given
this set of compiler flags and this architecture, what flags
would you use to request a 32-bit compile instead?" So we
basically ignore that for now. If someone comes along trying
to use the build system to build pseudo-native on a 64-bit
host that also supports 32-bit binaries and isn't x86, we
will revisit this.
---
 meta/recipes-devtools/pseudo/pseudo.inc      |   12 +++++++++---
 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb |    8 --------
 meta/recipes-devtools/pseudo/pseudo_1.4.bb   |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    8 ++++----
 4 files changed, 21 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 8798018..ac898d2 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -3,7 +3,7 @@
 # BBFETCH2=True PSEUDO_BUILD=1 ../bitbake/bin/bitbake pseudo-native [-c CMD]
 
 DESCRIPTION = "Pseudo gives fake root capabilities to a normal user"
-HOMEPAGE = "http://wiki.github.com/wrpseudo/pseudo/"
+HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 SECTION = "base"
 LICENSE = "LGPL2.1"
@@ -11,6 +11,8 @@ DEPENDS = "sqlite3"
 
 SRC_URI_append_virtclass-nativesdk = " file://symver.patch"
 
+SRC_URI_append_virtclass-native = " file://symver.patch"
+
 FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
 FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
 PROVIDES += "virtual/fakeroot"
@@ -28,9 +30,9 @@ NO32LIBS ??= "1"
 # Compile for the local machine arch...
 do_compile () {
 	if [ "${SITEINFO_BITS}" = "64" ]; then
-	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
 	else
-	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
 	fi
 	oe_runmake ${MAKEOPTS}
 }
@@ -41,6 +43,8 @@ do_compile () {
 do_compile_prepend_virtclass-native () {
 	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
+                # ... and we really, really, hope that the native host is
+                # x86, or else --bits may not work.
 		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
@@ -51,6 +55,8 @@ do_compile_prepend_virtclass-native () {
 do_compile_prepend_virtclass-nativesdk () {
 	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
+                # ... and we really, really, hope that the native host is
+                # x86, or else --bits may not work.
 		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.3.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
deleted file mode 100644
index d64e0e5..0000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require pseudo.inc
-
-PR = "r11"
-
-SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "aa7dbe925d065187833e1171746e9a94"
-SRC_URI[sha256sum] = "dc896c06b0f5bc253faaeb21ed78157db7ef7553e3ecae15a1eb6faf64942110"
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.bb
new file mode 100644
index 0000000..e1e1f6f
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.4.bb
@@ -0,0 +1,8 @@
+require pseudo.inc
+
+PR = "r12"
+
+SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "bc04c6c9d13cfdb789ffc2f3cca9ab08"
+SRC_URI[sha256sum] = "147fa7b177061a145d330b9e159529a185be94550f123c6acb0d3b75d480c5b4"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 2f58072..27ae4b2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,12 +1,12 @@
 require pseudo.inc
 
-SRCREV = "2e0189ba5368b1e88d509d0ab82bccb15cfb3653"
-PV = "1.3.1+git${SRCPV}"
-PR = "r26"
+SRCREV = "9b792e4cb91bc22374f47d0b0902dbc4ecd7d6dd"
+PV = "1.4+git${SRCPV}"
+PR = "r27"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "git://github.com/wrpseudo/pseudo.git;protocol=git"
+SRC_URI = "git://git.yoctoproject.org/pseudo;protocol=git"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.0.4



