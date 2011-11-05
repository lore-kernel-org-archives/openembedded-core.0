Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3N-00065C-V9
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625102"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:22:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:31 -0700
Message-Id: <bad29ecfdd8463b485a88e013fa764244136ad69.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/28] bash: Ensure we fully reautoconf the recipes so site data is used
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:14 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This ensures bug 487 (missing job control functionality) really gets fixed.

[YOCTO #487]

(From OE-Core rev: 08b78066bd5a9ff2819a42eb4263ee0a78cddb97)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/bash/bash.inc       |    9 ++++++---
 meta/recipes-extended/bash/bash_3.2.48.bb |   11 +++++++----
 meta/recipes-extended/bash/bash_4.2.bb    |    2 +-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index d55e517..876be1e 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -22,9 +22,12 @@ ALTERNATIVE_PATH = "${base_bindir}/bash"
 ALTERNATIVE_LINK = "${base_bindir}/sh"
 ALTERNATIVE_PRIORITY = "100"
 
-do_configure () {
-	gnu-configize
-	oe_runconf
+export AUTOHEADER = "true"
+
+do_configure_prepend () {
+	if [ ! -e acinclude.m4 ]; then
+		cat aclocal.m4 > acinclude.m4
+	fi
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 1520c4e..f2ba572 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
 DEPENDS = "ncurses"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0 \
@@ -23,9 +23,12 @@ sbindir = "/sbin"
 EXTRA_OECONF = "--with-ncurses"
 export CC_FOR_BUILD = "${BUILD_CC}"
 
-do_configure () {
-	gnu-configize
-	oe_runconf
+export AUTOHEADER = "true"
+
+do_configure_prepend () {
+	if [ ! -e acinclude.m4 ]; then
+		cat aclocal.m4 > acinclude.m4
+	fi
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index a0f5e4e..8070918 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
-- 
1.7.6.4



