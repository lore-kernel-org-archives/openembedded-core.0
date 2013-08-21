Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCF46B916
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 23:14:42 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Aug 2013 16:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,930,1367996400"; d="scan'208";a="285060197"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.105])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Aug 2013 16:14:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: kai.kang@windriver.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 16:14:35 -0700
Message-Id: <1377126875-9856-5-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1377126875-9856-1-git-send-email-sgw@linux.intel.com>
References: <1377126875-9856-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 4/4] valgrind: Backport patch for eglibc 2.18
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Aug 2013 23:14:43 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../valgrind/valgrind-3.8.1/eglibc-2.18.patch      | 27 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.8.1.bb   |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.8.1/eglibc-2.18.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.8.1/eglibc-2.18.patch b/meta/recipes-devtools/valgrind/valgrind-3.8.1/eglibc-2.18.patch
new file mode 100644
index 0000000..1fa8127
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind-3.8.1/eglibc-2.18.patch
@@ -0,0 +1,27 @@
+
+
+Found in the SVN valgrind code
+svn diff -c 13504 configure.in 
+
+Upstream-Status: Backport
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: valgrind-3.8.1/configure.in
+===================================================================
+--- valgrind-3.8.1.orig/configure.in
++++ valgrind-3.8.1/configure.in
+@@ -924,6 +924,13 @@ case "${GLIBC_VERSION}" in
+ 	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
+ 	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
++     2.18)
++	AC_MSG_RESULT(2.18 family)
++	AC_DEFINE([GLIBC_2_18], 1, [Define to 1 if you're using glibc 2.18.x])
++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	;;
+      darwin)
+ 	AC_MSG_RESULT(Darwin)
+ 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
index 33f178c..9630960 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://configure-with-newer-glibc.patch \
            file://sepbuildfix.patch \
+           file://eglibc-2.18.patch \
           "
 
 SRC_URI[md5sum] = "288758010b271119a0ffc0183f1d6e38"
-- 
1.8.3.1


