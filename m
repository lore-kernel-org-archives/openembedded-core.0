Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEP-0005O8-Od
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2011 00:29:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="914945576"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2011 00:29:45 -0700
Message-Id: <bdc26fe5cf97686061963c94d38f57c780432875.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 20:52:54 -0700
Date: Wed, 27 Apr 2011  0:29:45 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 24/52] elfutils_0.148.bb: Fix compilation issues on uclibc
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:18 -0000

From: Khem Raj <raj.khem@gmail.com>

* Add -luargp and -lintl to linker flags
* __mempcpy is not there on uclibc so define it to mempcpy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils-0.148/mempcpy.patch          |   23 ++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    6 +++-
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
new file mode 100644
index 0000000..e1e4ad0
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
@@ -0,0 +1,23 @@
+uclibc does not export __mempcpy like glibc so we alias it here.
+This patch may make sense for upstream but elfutils uses more
+glibc specific features like obstack_printf which are missing in
+uclibc they need to be fixed along to make it work all the way
+
+Upstream-status: Inappropriate[Elfutils uses more glibc specific features]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: elfutils-0.148/libelf/elf_begin.c
+===================================================================
+--- elfutils-0.148.orig/libelf/elf_begin.c
++++ elfutils-0.148/libelf/elf_begin.c
+@@ -68,6 +68,9 @@
+ #include "libelfP.h"
+ #include "common.h"
+ 
++#ifdef __UCLIBC__
++#define __mempcpy mempcpy
++#endif
+ 
+ /* Create descriptor for archive in memory.  */
+ static inline Elf *
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index a55b98d..df933f6 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -28,8 +28,8 @@ SRC_URI += "\
         file://elf_additions.diff \
 	file://elfutils-fsize.patch \
 	file://remove-unused.patch \
+	file://mempcpy.patch \
 "
-
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
 # which can not pass the cross compiling, so let's work around it by adding 2 .h files
 # along with the do_configure_prepend()
@@ -38,7 +38,6 @@ SRC_URI += "\
         file://i386_dis.h \
         file://x86_64_dis.h \
 "
-
 inherit autotools
 
 EXTRA_OECONF = "--program-prefix=eu-"
@@ -49,6 +48,9 @@ do_configure_prepend() {
 	cp ${WORKDIR}/*dis.h ${S}/libcpu
 }
 
+# Only append ldflags for target recipe
+TARGET_LDFLAGS_libc-uclibc += "${@['', '-lintl -luargp']['${PN}' == '${BPN}']}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
-- 
1.7.1.1



