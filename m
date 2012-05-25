Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOF-00085R-9w
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115418"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:50 -0700
Message-Id: <3bcf0d91b9f768e5d44e4542b1f6d79a56f088cb.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 11/45] mpfr: fix build with automake 1.12
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
X-List-Received-Date: Fri, 25 May 2012 06:52:48 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch    |   35 ++++++++++++++++++++
 meta/recipes-support/mpfr/mpfr_3.1.0.bb            |    7 ++--
 2 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch

diff --git a/meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch b/meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..5b0a24a
--- /dev/null
+++ b/meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Pending
+
+this patch avoids these issues with automake 1.12
+
+| configure.ac:304: error: automatic de-ANSI-fication support has been removed
+| tests/Makefile.am:12: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@.intel.com>
+2012/05/02
+
+Index: mpfr-3.1.0/configure.ac
+===================================================================
+--- mpfr-3.1.0.orig/configure.ac
++++ mpfr-3.1.0/configure.ac
+@@ -301,7 +301,6 @@ if test "$test_CFLAGS" != set && test -n
+ fi
+ 
+ AM_PROG_CC_C_O
+-AM_C_PROTOTYPES
+ 
+ case $host in
+   *-apple-darwin*)
+Index: mpfr-3.1.0/tests/Makefile.am
+===================================================================
+--- mpfr-3.1.0.orig/tests/Makefile.am
++++ mpfr-3.1.0/tests/Makefile.am
+@@ -9,7 +9,7 @@
+ # PARTICULAR PURPOSE.
+ 
+ 
+-AUTOMAKE_OPTIONS = 1.6 gnu $(top_builddir)/ansi2knr
++AUTOMAKE_OPTIONS = 1.6 gnu
+ 
+ # tversion is run
+ #   * at the beginning so that the user gets a possible version error
diff --git a/meta/recipes-support/mpfr/mpfr_3.1.0.bb b/meta/recipes-support/mpfr/mpfr_3.1.0.bb
index 102ec69..e7e20ce 100644
--- a/meta/recipes-support/mpfr/mpfr_3.1.0.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.1.0.bb
@@ -3,11 +3,12 @@ LICENSE="GPLv3&LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "gmp"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2 \
-  file://long-long-thumb.patch \
-"
+           file://long-long-thumb.patch \
+           file://mpfr_fix_for_automake-1.12.patch \
+           "
 
 SRC_URI[md5sum] = "238ae4a15cc3a5049b723daef5d17938"
 SRC_URI[sha256sum] = "74a7bbbad168dd1cc414f1c9210b8fc16ccfc8e422d34b3371a8978e31eab680"
-- 
1.7.7.6



