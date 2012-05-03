Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ0iK-0001oE-0J
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:25:16 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 11:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96065350"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 11:15:24 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:15:03 -0700
Message-Id: <db9b82008f341e5da3c34c6e7a62f09f0440fd5b.1336068854.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
References: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336068854.git.nitin.a.kamble@intel.com>
References: <cover.1336068854.git.nitin.a.kamble@intel.com>
Subject: [PATCH 09/28] libxml2: fix build with automake 1.12
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
X-List-Received-Date: Thu, 03 May 2012 18:25:16 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libxml2/libxml2_fix_for_automake_1.12.patch    |   23 ++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    5 ++-
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch b/meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
new file mode 100644
index 0000000..5c25882
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Pending
+
+automake 1.12 has decpricated automatic de-ANSI-fication support
+
+this patch fixes this build issue:
+
+| configure.in:67: error: automatic de-ANSI-fication support has been removed
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
+Index: libxml2-2.7.8/configure.in
+===================================================================
+--- libxml2-2.7.8.orig/configure.in
++++ libxml2-2.7.8/configure.in
+@@ -63,8 +63,6 @@ AC_PATH_PROG(WGET, wget, /usr/bin/wget)
+ AC_PATH_PROG(XMLLINT, xmllint, /usr/bin/xmllint)
+ AC_PATH_PROG(XSLTPROC, xsltproc, /usr/bin/xsltproc)
+ 
+-dnl Make sure we have an ANSI compiler
+-AM_C_PROTOTYPES
+ test "x$U" != "x" && AC_MSG_ERROR(Compiler not ANSI compliant)
+ 
+ AC_LIBTOOL_WIN32_DLL
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
index 1de73da..9111120 100644
--- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
@@ -1,8 +1,9 @@
 require libxml2.inc
 
-PR = "r7"
+PR = "r8"
 
-SRC_URI += "file://fix_version_info.patch"
+SRC_URI += "file://fix_version_info.patch \
+            file://libxml2_fix_for_automake_1.12.patch"
 
 SRC_URI[md5sum] = "8127a65e8c3b08856093099b52599c86"
 SRC_URI[sha256sum] = "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d822e009fdc3c417ec"
-- 
1.7.7



