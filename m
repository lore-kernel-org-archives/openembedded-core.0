Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQEw-0000S7-OH
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486018"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:12 -0700
Message-Id: <8d087f0a2ec9f83881bf14a6519d1a8e4b847e65.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 06/40] libxml2: fix build with automake 1.12
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
X-List-Received-Date: Fri, 04 May 2012 21:40:39 -0000

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



