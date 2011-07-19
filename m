Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Qj0Kj-0004xb-9m
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 04:46:53 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6J27KMh030170
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 21:07:20 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 19:07:16 -0700
Message-Id: <0e096c8a1ecdd3123b192b7216b34d235c612e88.1311041054.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311041054.git.tom_rini@mentor.com>
References: <cover.1311041054.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311041054.git.tom_rini@mentor.com>
References: <cover.1311041054.git.tom_rini@mentor.com>
Subject: [PATCH v2 2/4] help2man-native: Add 1.38.2
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
X-List-Received-Date: Tue, 19 Jul 2011 02:46:53 -0000

This is a 'side port' of current oe.dev versions.  PR is kept in sync
but we drop out the target recipes in order to punt on potential perl
problems.  Here we do re-configure as we don't have a dance with
perl-native to deal with.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../help2man/help2man-native_1.38.2.bb             |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.38.2.bb

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb b/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
new file mode 100644
index 0000000..bea7fe9
--- /dev/null
+++ b/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
@@ -0,0 +1,25 @@
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
+# We don't want to reconfigure things as it would require 'perlnative' to be
+# used.
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



