Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S5O9S-00065D-6k
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 22:12:02 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2012 22:03:17 +0100
Message-Id: <1331154197-17024-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH v2] bzip2: split into binary and library packages
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
X-List-Received-Date: Wed, 07 Mar 2012 21:12:02 -0000

* Create libbz2 (and -dev, -staticdev), which can be
  installed without the bzip2 executables.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
v1->v2: Bump PR of every package depending on bzip2 as suggested by Koen.

 .../recipes-gnome/libgsf/libgsf_1.14.5.bb          |    2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 +-
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    2 +-
 meta/recipes-devtools/quilt/quilt_0.51.bb          |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |   14 +++++++++++++-
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |    2 +-
 meta/recipes-support/gnupg/gnupg_2.0.18.bb         |    1 +
 meta/recipes-support/libpcre/libpcre_8.21.bb       |    2 +-
 9 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb b/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb
index bf1b1ad..01139c7 100644
--- a/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb
+++ b/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GNOME Structured File Library"
 LICENSE = "GPL"
 SECTION = "libs"
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
                     file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63 \
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 1326994..69fd50a 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Package maintenance system for Debian."
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-INC_PR = "r15"
+INC_PR = "r16"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2 \
            file://ignore_extra_fields.patch"
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 710959a..dca89b1 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
diff --git a/meta/recipes-devtools/quilt/quilt_0.51.bb b/meta/recipes-devtools/quilt/quilt_0.51.bb
index 6691d15..1c6ca73 100644
--- a/meta/recipes-devtools/quilt/quilt_0.51.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.51.bb
@@ -4,4 +4,4 @@ RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
 SRC_URI += "file://aclocal.patch \
             file://gnu_patch_test_fix_target.patch \
            "
-PR = "r0"
+PR = "r1"
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 6be490f..64ae537 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = "file-native"
-PR = "r31"
+PR = "r32"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 14cd240..fa8310e 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.bzip.org/"
 SECTION = "console/utils"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=8;endline=37;md5=40d9d1eb05736d1bfc86cfdd9106e6b2"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.bzip.org/${PV}/${BPN}-${PV}.tar.gz \
            file://configure.ac \
@@ -15,6 +15,8 @@ SRC_URI = "http://www.bzip.org/${PV}/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
 SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
 
+PACKAGES =+ "libbz2 libbz2-dev libbz2-staticdev"
+
 CFLAGS_append = " -fPIC -fpic -Winline -fno-strength-reduce -D_FILE_OFFSET_BITS=64"
 
 inherit autotools update-alternatives
@@ -28,5 +30,15 @@ do_configure_prepend () {
 	cp ${STAGING_DATADIR_NATIVE}/automake*/install-sh ${S}/
 }
 
+FILES_libbz2 = "${libdir}/lib*${SOLIBS}"
+
+FILES_libbz2-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV}"
+SECTION_libbz2-dev = "devel"
+RDEPENDS_libbz2-dev = "libbz2 (= ${EXTENDPKGV})"
+
+FILES_libbz2-staticdev = "${libdir}/*.a"
+SECTION_libbz2-staticdev = "devel"
+RDEPENDS_libbz2-staticdev = "libbz2-dev (= ${EXTENDPKGV})"
+
 PROVIDES_append_virtclass-native = " bzip2-full-native"
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index f033659..41552b2 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
            file://long-long-thumb.patch \
diff --git a/meta/recipes-support/gnupg/gnupg_2.0.18.bb b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
index abcb5fb..3085494 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.18.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
 
 DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt"
+PR = "r1"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-support/libpcre/libpcre_8.21.bb b/meta/recipes-support/libpcre/libpcre_8.21.bb
index f48d9f2..f5fa4ef 100644
--- a/meta/recipes-support/libpcre/libpcre_8.21.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.21.bb
@@ -5,7 +5,7 @@ provides a POSIX calling interface to PCRE; the regular expressions \
 themselves still follow Perl syntax and semantics. The header file for \
 the POSIX-style functions is called pcreposix.h."
 SECTION = "devel"
-PR = "r0"
+PR = "r1"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=2f00d186a775c8002422a5315079d96b"
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
-- 
1.7.5.4



