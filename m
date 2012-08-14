Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCG-0000Xq-N0
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Aug 2012 05:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181176"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:12:58 +0300
Message-Id: <1a2935038564190b30793a6b46de13b979207130.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 11/64] diffutils: refactor to add a common diffutils.inc
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:09 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/diffutils/diffutils.inc      |   22 ++++++++++++++++++
 meta/recipes-extended/diffutils/diffutils_2.8.1.bb |   24 +++----------------
 meta/recipes-extended/diffutils/diffutils_3.2.bb   |   22 ++---------------
 3 files changed, 29 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-extended/diffutils/diffutils.inc

diff --git a/meta/recipes-extended/diffutils/diffutils.inc b/meta/recipes-extended/diffutils/diffutils.inc
new file mode 100644
index 0000000..3964db0
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils.inc
@@ -0,0 +1,22 @@
+SUMMARY = "Diffutils contains tools used for finding differences between files."
+DESCRIPTION = "Diffutils contains the GNU diff, diff3, \
+sdiff, and cmp utilities. These programs are usually \
+used for creating patch files."
+SECTION = "base"
+
+INC_PR = "r6"
+
+SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.gz"
+
+inherit autotools update-alternatives gettext
+
+# diffutils assumes non-glibc compilation with uclibc and
+# this causes it to generate its own implementations of
+# standard functionality.  regex.c actually breaks compilation
+# because it uses __mempcpy, there are other things (TBD:
+# see diffutils.mk in buildroot)
+EXTRA_OECONF_libc-uclibc = "--without-included-regex"
+
+ALTERNATIVE_LINKS = "${bindir}/diff ${bindir}/cmp"
+ALTERNATIVE_PRIORITY = "100"
+
diff --git a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
index 09eb71e..a31363a 100644
--- a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
+++ b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
@@ -1,28 +1,12 @@
-SUMMARY = "Diffutils contains tools used for finding differences between files."
-DESCRIPTION = "Diffutils contains the GNU diff, diff3, \
-sdiff, and cmp utilities. These programs are usually \
-used for creating patch files."
-SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r5"
+require diffutils.inc
 
-SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.gz \
-           file://diffutils_fix_for_automake-1.12.patch \
-           "
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://diffutils_fix_for_automake-1.12.patch"
 
 SRC_URI[md5sum] = "71f9c5ae19b60608f6c7f162da86a428"
 SRC_URI[sha256sum] = "c5001748b069224dd98bf1bb9ee877321c7de8b332c8aad5af3e2a7372d23f5a"
 
-inherit autotools update-alternatives gettext
-
-# diffutils assumes non-glibc compilation with uclibc and
-# this causes it to generate its own implementations of
-# standard functionality.  regex.c actually breaks compilation
-# because it uses __mempcpy, there are other things (TBD:
-# see diffutils.mk in buildroot)
-EXTRA_OECONF_libc-uclibc = "--without-included-regex"
-
-ALTERNATIVE_LINKS = "${bindir}/diff ${bindir}/cmp"
-ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/diffutils/diffutils_3.2.bb b/meta/recipes-extended/diffutils/diffutils_3.2.bb
index c46863d..74c371d 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.2.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.2.bb
@@ -1,27 +1,11 @@
-DESCRIPTION = "Diffutils contains the GNU diff, diff3, \
-sdiff, and cmp utilities. These programs are usually \
-used for creating patch files."
-SECTION = "base"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r1"
+require diffutils.inc
 
-SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.gz \
-           file://remove-gets.patch \
-          "
+PR = "${INC_PR}.0"
 
-inherit autotools update-alternatives gettext
-
-# diffutils assumes non-glibc compilation with uclibc and
-# this causes it to generate its own implementations of
-# standard functionality.  regex.c actually breaks compilation
-# because it uses __mempcpy, there are other things (TBD:
-# see diffutils.mk in buildroot)
-EXTRA_OECONF_libc-uclibc = "--without-included-regex"
-
-ALTERNATIVE_LINKS = "${bindir}/diff ${bindir}/cmp"
-ALTERNATIVE_PRIORITY = "100"
+SRC_URI += "file://remove-gets.patch"
 
 SRC_URI[md5sum] = "22e4deef5d8949a727b159d6bc65c1cc"
 SRC_URI[sha256sum] = "2aaaebef615be7dc365306a14caa5d273a4fc174f9f10abca8b60e082c054ed3"
-- 
1.7.7.6



