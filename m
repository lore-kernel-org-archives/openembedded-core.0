Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 27CAD719F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:50:07 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id C4C8EB8B281; Tue,  6 Dec 2016 12:49:53 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:34 +0100
Message-Id: <1481024991-5882-17-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 16/33] apt: merge apt.inc into .bb
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
X-List-Received-Date: Tue, 06 Dec 2016 11:50:07 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt.inc       | 38 --------------------------------
 meta/recipes-devtools/apt/apt_1.2.12.bb | 39 ++++++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt.inc

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
deleted file mode 100644
index 1488664..0000000
--- a/meta/recipes-devtools/apt/apt.inc
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "Advanced front-end for dpkg"
-LICENSE = "GPLv2.0+"
-SECTION = "base"
-
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
-           file://use-host.patch \
-           file://makerace.patch \
-           file://no-nls-dpkg.patch \
-           file://fix-gcc-4.6-null-not-defined.patch \
-           file://truncate-filename.patch \
-           file://nodoc.patch \
-           file://disable-configure-in-makefile.patch \
-           file://disable-test.patch \
-           file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
-           file://0001-apt-1.2.12-Fix-musl-build.patch \
-           file://0001-remove-Wsuggest-attribute-from-CFLAGS.patch \
-           file://0001-fix-the-gcc-version-check.patch \
-           file://apt.conf.in \
-           "
-SRC_URI[md5sum] = "80f6f0ef110a45a7e5af8a9d233fb0e7"
-SRC_URI[sha256sum] = "e820d27cba73476df4abcff27dadd1b5847474bfe85f7e9202a9a07526973ea6"
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-# the package is taken from snapshots.debian.org; that source is static and goes stale
-# so we check the latest upstream from a directory that does get updated
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
-
-inherit autotools gettext useradd
-
-EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
-
-do_configure_prepend() {
-    rm -rf ${S}/buildlib/config.sub
-    rm -rf ${S}/buildlib/config.guess
-}
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /nonexistent --shell /bin/false --user-group _apt"
diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.12.bb
index f09dfc8..3463a23 100644
--- a/meta/recipes-devtools/apt/apt_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt_1.2.12.bb
@@ -1,6 +1,43 @@
+SUMMARY = "Advanced front-end for dpkg"
+SECTION = "base"
+LICENSE = "GPLv2.0+"
 DEPENDS = "curl db zlib"
 RDEPENDS_${PN} = "dpkg bash debianutils"
-require apt.inc
+
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
+           file://use-host.patch \
+           file://makerace.patch \
+           file://no-nls-dpkg.patch \
+           file://fix-gcc-4.6-null-not-defined.patch \
+           file://truncate-filename.patch \
+           file://nodoc.patch \
+           file://disable-configure-in-makefile.patch \
+           file://disable-test.patch \
+           file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
+           file://0001-apt-1.2.12-Fix-musl-build.patch \
+           file://0001-remove-Wsuggest-attribute-from-CFLAGS.patch \
+           file://0001-fix-the-gcc-version-check.patch \
+           file://apt.conf.in \
+           "
+SRC_URI[md5sum] = "80f6f0ef110a45a7e5af8a9d233fb0e7"
+SRC_URI[sha256sum] = "e820d27cba73476df4abcff27dadd1b5847474bfe85f7e9202a9a07526973ea6"
+LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+# the package is taken from snapshots.debian.org; that source is static and goes stale
+# so we check the latest upstream from a directory that does get updated
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
+
+inherit autotools gettext useradd
+
+EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
+
+do_configure_prepend() {
+    rm -rf ${S}/buildlib/config.sub
+    rm -rf ${S}/buildlib/config.guess
+}
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /nonexistent --shell /bin/false --user-group _apt"
 
 USE_NLS_class-native = "yes"
 
-- 
2.7.4


