Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7J-0005xk-17
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2012 09:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167839"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:02 -0700
Message-Id: <966f028f4afbaf476a82fa2a3bd70cc62fbc6147.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/43] grep: Use update-alternatives
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:30 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Use ALTERNATIVE_LINKS to be sure the links and provide info is setup
properly.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/grep/grep_2.5.1a.bb |   25 +++++++++----------------
 meta/recipes-extended/grep/grep_2.9.bb    |   22 ++++++++--------------
 2 files changed, 17 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb b/meta/recipes-extended/grep/grep_2.5.1a.bb
index 64064fc..332a4d0 100644
--- a/meta/recipes-extended/grep/grep_2.5.1a.bb
+++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
@@ -5,7 +5,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
            file://uclibc-fix.patch"
@@ -21,23 +21,16 @@ do_configure_prepend () {
 	rm -f ${S}/m4/init.m4
 }
 
+inherit update-alternatives
+
+ALTERNATIVE_LINKS = "${base_bindir}/grep ${base_bindir}/egrep ${base_bindir}/fgrep"
+ALTERNATIVE_PRIORITY = "100"
+
 do_install () {
 	autotools_do_install
 	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/grep ${D}${base_bindir}/grep.${PN}
-	mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep.${PN}
-	mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep.${PN}
+	mv ${D}${bindir}/grep ${D}${base_bindir}/grep
+	mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep
+	mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep
 	rmdir ${D}${bindir}/
 }
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${base_bindir}/grep grep grep.${PN} 100
-	update-alternatives --install ${base_bindir}/egrep egrep egrep.${PN} 100
-	update-alternatives --install ${base_bindir}/fgrep fgrep fgrep.${PN} 100
-}
-
-pkg_prerm_${PN} () {
-	update-alternatives --remove grep grep.${PN}
-	update-alternatives --remove egrep egrep.${PN}
-	update-alternatives --remove fgrep fgrep.${PN}
-}
diff --git a/meta/recipes-extended/grep/grep_2.9.bb b/meta/recipes-extended/grep/grep_2.9.bb
index 1bc79f2..7710e65 100644
--- a/meta/recipes-extended/grep/grep_2.9.bb
+++ b/meta/recipes-extended/grep/grep_2.9.bb
@@ -21,23 +21,17 @@ do_configure_prepend () {
 	rm -f ${S}/m4/init.m4
 }
 
+inherit update-alternatives
+
+ALTERNATIVE_LINKS = "${base_bindir}/grep ${base_bindir}/egrep ${base_bindir}/fgrep"
+ALTERNATIVE_PRIORITY = "100"
+
 do_install () {
 	autotools_do_install
 	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/grep ${D}${base_bindir}/grep.${PN}
-	mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep.${PN}
-	mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep.${PN}
+	mv ${D}${bindir}/grep ${D}${base_bindir}/grep
+	mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep
+	mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep
 	rmdir ${D}${bindir}/
 }
 
-pkg_postinst_${PN} () {
-	update-alternatives --install ${base_bindir}/grep grep grep.${PN} 100
-	update-alternatives --install ${base_bindir}/egrep egrep egrep.${PN} 100
-	update-alternatives --install ${base_bindir}/fgrep fgrep fgrep.${PN} 100
-}
-
-pkg_prerm_${PN} () {
-	update-alternatives --remove grep grep.${PN}
-	update-alternatives --remove egrep egrep.${PN}
-	update-alternatives --remove fgrep fgrep.${PN}
-}
-- 
1.7.7.6



