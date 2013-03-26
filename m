Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1UKTn1-0007Qi-FX
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 14:19:48 +0100
Received: from localhost.localdomain (sarotti.TechFak.Uni-Bielefeld.DE
	[129.70.144.156])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id
	06CDD80015; Tue, 26 Mar 2013 14:02:46 +0100 (CET)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 14:02:19 +0100
Message-Id: <1364302939-28222-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362674233-7210-1-git-send-email-stefan@herbrechtsmeier.net>
References: <1362674233-7210-1-git-send-email-stefan@herbrechtsmeier.net>
Subject: [PATCH V2] boost: Add real native support
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
X-List-Received-Date: Tue, 26 Mar 2013 13:19:48 -0000

The current boost recipe only creates the bjam build tool during
a native run and thereby is not usable for other native recipes
that depend on a boost library. Split out the build tool into its
own bjam-native recipe and add real native support to the boost
recipe. Additionally replace the boost-native with bjam-native in
the DEPENDS. This allows recipes to depend on native boost
librarties without increase of the build time for other use cases.

Native compilation of bzip2 isn't working and therefore disabled.

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 meta/recipes-support/boost/bjam-native_1.53.0.bb |   15 +++++++
 meta/recipes-support/boost/boost-1.53.0.inc      |   19 ++++++++
 meta/recipes-support/boost/boost.inc             |   49 ++--------------------
 meta/recipes-support/boost/boost_1.53.0.bb       |    6 +--
 4 files changed, 40 insertions(+), 49 deletions(-)
 create mode 100644 meta/recipes-support/boost/bjam-native_1.53.0.bb
 create mode 100644 meta/recipes-support/boost/boost-1.53.0.inc

diff --git a/meta/recipes-support/boost/bjam-native_1.53.0.bb b/meta/recipes-support/boost/bjam-native_1.53.0.bb
new file mode 100644
index 0000000..59a0310
--- /dev/null
+++ b/meta/recipes-support/boost/bjam-native_1.53.0.bb
@@ -0,0 +1,15 @@
+include boost-${PV}.inc
+
+DESCRIPTION = "Portable Boost.Jam build tool for boost"
+SECTION = "devel"
+
+inherit native
+
+do_compile() {
+    ./bootstrap.sh --with-toolset=gcc
+}
+
+do_install() {
+    install -d ${D}${bindir}/
+    install -c -m 755 bjam ${D}${bindir}/
+}
diff --git a/meta/recipes-support/boost/boost-1.53.0.inc b/meta/recipes-support/boost/boost-1.53.0.inc
new file mode 100644
index 0000000..dbcaabc
--- /dev/null
+++ b/meta/recipes-support/boost/boost-1.53.0.inc
@@ -0,0 +1,19 @@
+# The Boost web site provides free peer-reviewed portable
+# C++ source libraries. The emphasis is on libraries which
+# work well with the C++ Standard Library. The libraries are
+# intended to be widely useful, and are in regular use by
+# thousands of programmers across a broad spectrum of applications.
+HOMEPAGE = "http://www.boost.org/"
+LICENSE = "BSL-1.0 & MIT & Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
+BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
+BOOST_P = "boost_${BOOST_VER}"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
+
+SRC_URI[md5sum] = "a00d22605d5dbcfb4c9936a9b35bc4c2"
+SRC_URI[sha256sum] = "f88a041b01882b0c9c5c05b39603ec8383fb881f772f6f9e6e6fd0e0cddb9196"
+
+S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 1266666..a1c35c7 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -1,25 +1,9 @@
-# The Boost web site provides free peer-reviewed portable
-# C++ source libraries. The emphasis is on libraries which
-# work well with the C++ Standard Library. The libraries are
-# intended to be widely useful, and are in regular use by
-# thousands of programmers across a broad spectrum of applications.
 DESCRIPTION = "Free peer-reviewed portable C++ source libraries"
-HOMEPAGE = "http://www.boost.org/"
 SECTION = "libs"
-DEPENDS = "boost-native zlib bzip2"
-DEPENDS_class-native = ""
-LICENSE = "BSL-1.0 & MIT & Python-2.0"
+DEPENDS = "bjam-native zlib bzip2"
 
 ARM_INSTRUCTION_SET = "arm"
 
-BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
-BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
-BOOST_P = "boost_${BOOST_VER}"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
-
-S = "${WORKDIR}/${BOOST_P}"
-
 BOOST_LIBS = "\
 	date_time \
 	filesystem \
@@ -126,6 +110,8 @@ BJAM_OPTS    = '${PARALLEL_MAKE} \
 		--disable-icu \
 		${BJAM_EXTRA}'
 
+# Native compilation of bzip2 isn't working
+BJAM_OPTS_append_class-native = ' -sNO_BZIP2=1'
 
 do_boostconfig() {
 	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
@@ -138,7 +124,7 @@ do_boostconfig() {
 
 	echo "using python : ${PYTHON_VERSION} : : ${STAGING_INCDIR}/python${PYTHON_VERSION} ;" >> ${S}/tools/build/v2/user-config.jam
 
-	CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-toolset=gcc --with-python-root=${PYTHON_ROOT}
+	CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-bjam=bjam --with-toolset=gcc --with-python-root=${PYTHON_ROOT}
 	sed -i '/^using python/d' project-config.jam
 }
 
@@ -170,30 +156,3 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native"
-
-do_configure_class-native() {
-	:
-}
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
index de721c5..3a5a6cc 100644
--- a/meta/recipes-support/boost/boost_1.53.0.bb
+++ b/meta/recipes-support/boost/boost_1.53.0.bb
@@ -1,9 +1,7 @@
+include boost-${PV}.inc
 include boost.inc
 
-LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+PR = "r1"
 
 SRC_URI += "file://arm-intrinsics.patch \
            "
-
-SRC_URI[md5sum] = "a00d22605d5dbcfb4c9936a9b35bc4c2"
-SRC_URI[sha256sum] = "f88a041b01882b0c9c5c05b39603ec8383fb881f772f6f9e6e6fd0e0cddb9196"
-- 
1.7.0.4



