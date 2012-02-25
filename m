Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S16QL-0007kT-Jj
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 02:27:45 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Feb 2012 02:19:20 +0100
Message-Id: <1330132760-12519-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] bzip2: split into binary and library packages
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
X-List-Received-Date: Sat, 25 Feb 2012 01:27:45 -0000

* Create libbz2 (and -dev, -staticdev), which can be
  installed without the bzip2 executables.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

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
-- 
1.7.5.4



