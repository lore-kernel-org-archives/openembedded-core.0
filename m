Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8Ny-0008Qv-3Z
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103294"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:39:51 -0700
Message-Id: <9005f887fa098ce9ffe5d82fbcdfcc1c43f0b435.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 07/23] rpm: Use link time check for libssp
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:54 -0000

From: Khem Raj <raj.khem@gmail.com>

-fstack-protector needs libssp to link with
so when checking for this option support we
need to find if libssp is staged in root file
system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rpm/rpm/fstack-protector-configure-check.patch |   21 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch

diff --git a/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
new file mode 100644
index 0000000..0474c65
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
@@ -0,0 +1,21 @@
+Some options checked in this loop are needing linking to find out
+if the option can be used or not e.g. -fstack-protector which needs
+libssp to be staged and available for compiler to link against
+Therefore we change the compile only check to compile and link check
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: rpm-5.4.0/configure.ac
+===================================================================
+--- rpm-5.4.0.orig/configure.ac	2012-06-01 11:41:19.741480143 -0700
++++ rpm-5.4.0/configure.ac	2012-06-01 11:41:51.773481676 -0700
+@@ -193,7 +193,7 @@
+  my_save_cflags="$CFLAGS"
+  CFLAGS=$c
+  AC_MSG_CHECKING([whether GCC supports $c])
+- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([])],
++ AC_LINK_IFELSE([AC_LANG_PROGRAM([])],
+     [AC_MSG_RESULT([yes])]
+     [my_cflags=$c],
+     [AC_MSG_RESULT([no])]
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 404916a..ccf015a 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -74,6 +74,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-pkgconfigdeps.patch \
 	   file://uclibc-support.patch \
 	   file://rpmatch.patch \
+	   file://fstack-protector-configure-check.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.7.6



