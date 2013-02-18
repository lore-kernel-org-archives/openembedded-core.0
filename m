Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U7PgO-0006H3-Nr
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 13:18:58 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Feb 2013 04:02:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,687,1355126400"; d="scan'208";a="288582726"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2013 04:02:36 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 14:03:38 +0200
Message-Id: <1361189018-2079-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] groff: upgrade to 1.22.2
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
X-List-Received-Date: Mon, 18 Feb 2013 12:18:59 -0000

- add code for generating the gnulib configure script
- replace /usr/bin/perl with /usr/bin/env perl

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../groff/{groff_1.20.1.bb => groff_1.22.2.bb}               | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/groff/{groff_1.20.1.bb => groff_1.22.2.bb} (85%)

diff --git a/meta/recipes-extended/groff/groff_1.20.1.bb b/meta/recipes-extended/groff/groff_1.22.2.bb
similarity index 85%
rename from meta/recipes-extended/groff/groff_1.20.1.bb
rename to meta/recipes-extended/groff/groff_1.22.2.bb
index 157365b..dc40784 100644
--- a/meta/recipes-extended/groff/groff_1.20.1.bb
+++ b/meta/recipes-extended/groff/groff_1.22.2.bb
@@ -4,7 +4,7 @@ formatting commands and produces formatted output."
 SECTION = "base"
 HOMEPAGE = "ftp://ftp.gnu.org/gnu/groff/"
 LICENSE = "GPLv2"
-PR = "r2"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
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



