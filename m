Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QhqXS-0006By-Ux
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:07:15 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6FM3CMi018958
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 17:03:13 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 15:03:07 -0700
Message-Id: <c7276dd332ad9e38935443d679c0296a032a511c.1310758615.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310758615.git.tom_rini@mentor.com>
References: <cover.1310758615.git.tom_rini@mentor.com>
In-Reply-To: <cover.1310758615.git.tom_rini@mentor.com>
References: <cover.1310758615.git.tom_rini@mentor.com>
Subject: [PATCH 3/5] help2man-native: Add 1.36.4 (GPLv2) and 1.38.2 (GPLv3)
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
X-List-Received-Date: Fri, 15 Jul 2011 22:07:15 -0000

These are 'side ports' of current oe.dev versions.  PR is kept in sync
but we drop out the target recipes in order to punt on potential perl
problems.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../help2man/help2man-native_1.36.4.bb             |   26 ++++++++++++++++++++
 .../help2man/help2man-native_1.38.2.bb             |   24 ++++++++++++++++++
 2 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.36.4.bb
 create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.38.2.bb

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.36.4.bb b/meta/recipes-devtools/help2man/help2man-native_1.36.4.bb
new file mode 100644
index 0000000..b2c6608
--- /dev/null
+++ b/meta/recipes-devtools/help2man/help2man-native_1.36.4.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "GNU utility to convert program --help output to a man page"
+HOMEPAGE    = "http://www.gnu.org/software/help2man"
+SECTION     = "console/utils"
+LICENSE     = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS     = "autoconf-native automake-native"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "d31a0a38c2ec71faa06723f6b8bd3076"
+SRC_URI[sha256sum] = "a4adadf76b496a6bc50795702253ecfcb6f0d159b68038f31a5362009340bca2"
+
+inherit autotools native
+
+PR = "r5"
+
+# We don't want to reconfigure things
+do_configure() {
+	oe_runconf
+}
+
+do_install_append () {
+	# Make sure we use /usr/bin/env perl
+	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${D}${bindir}/help2man
+}
diff --git a/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb b/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
new file mode 100644
index 0000000..5612eda
--- /dev/null
+++ b/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Program to create simple man pages"
+SECTION = "devel"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "autoconf-native automake-native"
+PR = "r2"
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "426671c6fe79e5ef2233303367eab5a6"
+SRC_URI[sha256sum] = "952c29561bce8b233aa10af7f0e0c79c8243712810bf8ddf01e6efd82ce250d1"
+
+inherit autotools native
+
+EXTRA_OECONF = "--disable-nls"
+
+# We don't want to reconfigure things
+do_configure() {
+	oe_runconf
+}
+
+do_install_append () {
+	# Make sure we use /usr/bin/env perl
+	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${D}${bindir}/help2man
+}
-- 
1.7.0.4



