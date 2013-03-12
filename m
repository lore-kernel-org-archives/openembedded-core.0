Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1UFQmb-0006YN-DT
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 16:06:44 +0100
Received: from localhost.localdomain (sarotti.TechFak.Uni-Bielefeld.DE
	[129.70.144.156])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id
	5100780010; Tue, 12 Mar 2013 15:49:49 +0100 (CET)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 15:49:14 +0100
Message-Id: <1363099754-3396-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362674233-7210-1-git-send-email-stefan@herbrechtsmeier.net>
References: <1362674233-7210-1-git-send-email-stefan@herbrechtsmeier.net>
Subject: [PATCH] boost: Add real native support
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
X-List-Received-Date: Tue, 12 Mar 2013 15:06:46 -0000

The current boost recipe only creates the bjam build tool during
a native run and thereby is not usable for other native recipes
that depend on a boost library. Use instead the bjam build tool
from the do_boostconfig task and add real native support to the
boost recipe. Additionally remove the boost-native from DEPENDS.

Keep the installation of the native bjam build tool for backward
compatibility.

Native compilation of bzip2 isn't working and therefore disabled.

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 meta/recipes-support/boost/boost.inc       |   37 ++++++----------------------
 meta/recipes-support/boost/boost_1.53.0.bb |    2 +
 2 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 1266666..eaba3a2 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -6,8 +6,7 @@
 DESCRIPTION = "Free peer-reviewed portable C++ source libraries"
 HOMEPAGE = "http://www.boost.org/"
 SECTION = "libs"
-DEPENDS = "boost-native zlib bzip2"
-DEPENDS_class-native = ""
+DEPENDS = "zlib bzip2"
 LICENSE = "BSL-1.0 & MIT & Python-2.0"
 
 ARM_INSTRUCTION_SET = "arm"
@@ -126,6 +125,8 @@ BJAM_OPTS    = '${PARALLEL_MAKE} \
 		--disable-icu \
 		${BJAM_EXTRA}'
 
+# Native compilation of bzip2 isn't working
+BJAM_OPTS_append_class-native = ' -sNO_BZIP2=1'
 
 do_boostconfig() {
 	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
@@ -146,7 +147,7 @@ addtask do_boostconfig after do_patch before do_configure
 
 do_compile() {
 	set -ex
-	bjam ${BJAM_OPTS} --prefix=${prefix} \
+	./bjam ${BJAM_OPTS} --prefix=${prefix} \
 		--exec-prefix=${exec_prefix} \
 		--libdir=${libdir} \
 		--includedir=${includedir}
@@ -154,7 +155,7 @@ do_compile() {
 
 do_install() {
 	set -ex
-	bjam ${BJAM_OPTS} \
+	./bjam ${BJAM_OPTS} \
 		--libdir=${D}${libdir} \
 		--includedir=${D}${includedir} \
 		install
@@ -171,29 +172,7 @@ do_install() {
 
 BBCLASSEXTEND = "native"
 
-do_configure_class-native() {
-	:
+do_install_append_class-native() {
+       install -d ${D}${bindir}/
+       install -c -m 755 bjam ${D}${bindir}/
 }
-
-do_boostconfig_class-native() {
-	:
-}
-
-do_compile_class-native() {
-	set -ex
-	cd ${S}/tools/build/v2/engine
-	rm -rf bin.*
-	./build.sh gcc
-}
-
-# This is too terrible - the build script doesn't give any good
-# way I can see to find out where the binaries are placed, so
-# rely on only one bin.foo directory being created.
-do_install_class-native () {
-	set -ex
-	cd ${S}/tools/build/v2/engine
-	install -d ${D}${bindir}/
-	install -c -m 755 bin.*/bjam ${D}${bindir}/
-}
-
-
diff --git a/meta/recipes-support/boost/boost_1.53.0.bb b/meta/recipes-support/boost/boost_1.53.0.bb
index de721c5..7527b25 100644
--- a/meta/recipes-support/boost/boost_1.53.0.bb
+++ b/meta/recipes-support/boost/boost_1.53.0.bb
@@ -2,6 +2,8 @@ include boost.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
+PR = "r1"
+
 SRC_URI += "file://arm-intrinsics.patch \
            "
 
-- 
1.7.0.4



