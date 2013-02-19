Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U7iX9-0000x1-Tf
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 09:26:40 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 19 Feb 2013 00:10:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,693,1355126400"; d="scan'208";a="203894617"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Feb 2013 00:10:28 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2013 10:11:30 +0200
Message-Id: <1361261490-400-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v2] groff: upgrade to 1.22.2
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
X-List-Received-Date: Tue, 19 Feb 2013 08:26:41 -0000

- add code for generating the gnulib configure script
- replace /usr/bin/perl with /usr/bin/env perl

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../groff/{groff_1.20.1.bb => groff_1.22.2.bb}           | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/groff/{groff_1.20.1.bb => groff_1.22.2.bb} (79%)

diff --git a/meta/recipes-extended/groff/groff_1.20.1.bb b/meta/recipes-extended/groff/groff_1.22.2.bb
similarity index 79%
rename from meta/recipes-extended/groff/groff_1.20.1.bb
rename to meta/recipes-extended/groff/groff_1.22.2.bb
index 157365b..d1361ab 100644
--- a/meta/recipes-extended/groff/groff_1.20.1.bb
+++ b/meta/recipes-extended/groff/groff_1.22.2.bb
@@ -4,14 +4,14 @@ formatting commands and produces formatted output."
 SECTION = "base"
 HOMEPAGE = "ftp://ftp.gnu.org/gnu/groff/"
 LICENSE = "GPLv2"
-PR = "r2"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "48fa768dd6fdeb7968041dd5ae8e2b02"
-SRC_URI[sha256sum] = "b645878135cb620c6c417c5601bfe96172245af12045540d7344938b4c2cd805"
+SRC_URI[md5sum] = "9f4cd592a5efc7e36481d8d8d8af6d16"
+SRC_URI[sha256sum] = "380864dac4772e0c0d7b1282d25d0c5fd7f63baf45c87c4657afed22a13d2076"
 
 DEPENDS = "groff-native"
 DEPENDS_class-native = ""
@@ -34,10 +34,18 @@ do_configure_prepend() {
 	fi
 }
 
+do_configure_append() {
+    # generate gnulib configure script
+    olddir=`pwd`
+    cd ${S}/src/libs/gnulib/
+    ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
+    cd ${olddir}
+}
+
 do_install_append() {
 	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
 	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-	for i in afmtodit mmroff; do
+	for i in afmtodit mmroff gropdf pdfmom; do
 		if [ -f ${D}${bindir}/$i ]; then
 			sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/$i
 		fi
-- 
1.7.11.7



