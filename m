Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Tsul3-0007Zh-4t
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 13:28:03 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Jan 2013 04:12:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,436,1355126400"; d="scan'208";a="241760421"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by azsmga001.ch.intel.com with ESMTP; 09 Jan 2013 04:12:35 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2013 14:15:49 +0200
Message-Id: <1357733749-5491-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] guile: add explicit dependency to avoid parallel build issue
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
X-List-Received-Date: Wed, 09 Jan 2013 12:28:04 -0000

Add explicit dependency for libpath.h on dynl.x which fixes a
potential parallel build issue.

[YOCTO #3558]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../guile/files/fix_parallel_build_issue.patch     |   20 ++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.7.bb         |    3 ++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch

diff --git a/meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch b/meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch
new file mode 100644
index 0000000..761d51b
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch
@@ -0,0 +1,20 @@
+Add explicit dependency for libpath.h on dynl.x which fixes a potential parallel build issue.
+
+Fixes Yocto bug# 3558
+
+Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
+
+Upstream-Status: Pending
+
+diff --git a/libguile/Makefile.am b/libguile/Makefile.am
+index e216435..016bd90 100644
+--- a/libguile/Makefile.am
++++ b/libguile/Makefile.am
+@@ -700,6 +700,7 @@ $(DOT_DOC_FILES) $(EXTRA_DOT_DOC_FILES): scmconfig.h snarf.h guile-snarf-docs.in
+ error.x: cpp-E.c
+ posix.x: cpp-SIG.c
+ load.x: libpath.h
++dynl.x: libpath.h
+ 
+ alldotdocfiles    = $(DOT_DOC_FILES) $(EXTRA_DOT_DOC_FILES)
+ snarf2checkedtexi = GUILE_AUTO_COMPILE=0 $(top_builddir)/meta/uninstalled-env guild snarf-check-and-output-texi
diff --git a/meta/recipes-devtools/guile/guile_2.0.7.bb b/meta/recipes-devtools/guile/guile_2.0.7.bb
index 7f3316a..b8ab88e 100644
--- a/meta/recipes-devtools/guile/guile_2.0.7.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.7.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://opensuse/guile-64bit.patch \
            file://guile_2.0.6_fix_sed_error.patch \
            file://arm_endianness.patch \
+           file://fix_parallel_build_issue.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
@@ -27,7 +28,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
 SRC_URI[md5sum] = "30ff9e94663a2e2098b52f8ce9d050b9"
 SRC_URI[sha256sum] = "6f278fa699685382ae51ba8bfad5840959e0af6414f3ad803d61131567bfa338"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
-- 
1.7.10.4



