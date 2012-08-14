Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCG-0000Xj-SY
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Aug 2012 05:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181196"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:00 +0300
Message-Id: <f3878312920723da0bda7517101d01654a62b2cf.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 13/64] findutils: refactor common code to findutils.inc
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
 meta/recipes-extended/findutils/findutils.inc      |    5 +--
 .../recipes-extended/findutils/findutils_4.2.31.bb |   29 +++-----------------
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    6 +++-
 3 files changed, 10 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index 64909a1..1fa9b97 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -6,9 +6,6 @@ HOMEPAGE = "http://www.gnu.org/software/findutils/"
 BUGTRACKER = "http://savannah.gnu.org/bugs/?group=findutils"
 SECTION = "console/utils"
 
-# GPLv2+ (<< 4.2.32), GPLv3+ (>= 4.2.32)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "${GNU_MIRROR}/findutils/findutils-${PV}.tar.gz"
 
@@ -23,3 +20,5 @@ ALTERNATIVE_PRIORITY = "100"
 # because it uses __mempcpy, there are other things (TBD:
 # see diffutils.mk in buildroot)
 EXTRA_OECONF_libc-uclibc = "--without-included-regex"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/findutils/findutils_4.2.31.bb b/meta/recipes-extended/findutils/findutils_4.2.31.bb
index 37da0ce..38cdc21 100644
--- a/meta/recipes-extended/findutils/findutils_4.2.31.bb
+++ b/meta/recipes-extended/findutils/findutils_4.2.31.bb
@@ -1,33 +1,12 @@
-SUMMARY = "find, locate, and xargs binaries."
-DESCRIPTION = "The GNU Find Utilities are the basic directory searching utilities of the GNU operating system. \
-These programs are typically used in conjunction with other programs to provide modular and powerful directory \
-search and file locating capabilities to other commands."
-HOMEPAGE = "http://www.gnu.org/software/findutils/"
-BUGTRACKER = "http://savannah.gnu.org/bugs/?group=findutils"
-SECTION = "console/utils"
-
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 PR = "r3"
 
-SRC_URI = "${GNU_MIRROR}/findutils/findutils-${PV}.tar.gz \
-           file://gnulib-extension.patch \
-           file://findutils_fix_for_automake-1.12.patch \
+require findutils.inc
+
+SRC_URI += "file://gnulib-extension.patch \
+            file://findutils_fix_for_automake-1.12.patch \
            "
 
 SRC_URI[md5sum] = "a0e31a0f18a49709bf5a449867c8049a"
 SRC_URI[sha256sum] = "e0d34b8faca0b3cca0703f6c6b498afbe72f0ba16c35980c10ec9ef7724d6204"
-
-inherit autotools gettext update-alternatives
-
-ALTERNATIVE_LINKS = "${bindir}/find ${bindir}/xargs"
-ALTERNATIVE_PRIORITY = "100"
-
-# diffutils assumes non-glibc compilation with uclibc and
-# this causes it to generate its own implementations of
-# standard functionality.  regex.c actually breaks compilation
-# because it uses __mempcpy, there are other things (TBD:
-# see diffutils.mk in buildroot)
-EXTRA_OECONF_libc-uclibc = "--without-included-regex"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/findutils/findutils_4.4.2.bb b/meta/recipes-extended/findutils/findutils_4.4.2.bb
index 34e53d2..3f49300 100644
--- a/meta/recipes-extended/findutils/findutils_4.4.2.bb
+++ b/meta/recipes-extended/findutils/findutils_4.4.2.bb
@@ -1,5 +1,9 @@
 require findutils.inc
 
+# GPLv2+ (<< 4.2.32), GPLv3+ (>= 4.2.32)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+ 
 PR = "r6"
 
 SRC_URI += "file://01-27017.patch \
@@ -18,5 +22,3 @@ DEPENDS = "bison-native"
 CACHED_CONFIGUREVARS += "${@base_contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', 'gl_cv_func_wcwidth_works=yes', '', d)}"
 
 EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
-
-BBCLASSEXTEND = "native"
-- 
1.7.7.6



