Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoPB-00006T-1s
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:53:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115444"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:42:07 -0700
Message-Id: <d02e8d93dc57f2e6d3570fc1391cf8de3fd2260e.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 28/45] libcroco: fix build with automake 1.12
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
X-List-Received-Date: Fri, 25 May 2012 06:53:46 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../files/libcroco_fix_for_automake-1.12.patch     |   22 ++++++++++++++++++++
 meta/recipes-support/libcroco/libcroco_0.6.3.bb    |    5 ++-
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch

diff --git a/meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch b/meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..9dcf7b0
--- /dev/null
+++ b/meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Pending
+
+This patch fixes following kind of issues with automake 1.12
+
+| configure.in:51: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: libcroco-0.6.3/configure.in
+===================================================================
+--- libcroco-0.6.3.orig/configure.in
++++ libcroco-0.6.3/configure.in
+@@ -47,8 +47,6 @@ AC_PROG_CC
+ AC_PROG_INSTALL
+ AC_PROG_CPP
+ 
+-dnl Make sure we have an ANSI compiler
+-AM_C_PROTOTYPES
+ test "x$U" != "x" && AC_MSG_ERROR(Compiler not ANSI compliant)
+ 
+ dnl Checks for libraries.
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.3.bb b/meta/recipes-support/libcroco/libcroco_0.6.3.bb
index 74c2cbb..d9ff8de 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.3.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.3.bb
@@ -9,11 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
 
 SECTION = "x11/utils"
 DEPENDS = "glib-2.0 libxml2 zlib"
-PR = "r2"
+PR = "r3"
 
 inherit autotools pkgconfig gnome
 
-SRC_URI_append = " file://croco.patch;apply=yes "
+SRC_URI_append = " file://croco.patch;apply=yes \
+                  file://libcroco_fix_for_automake-1.12.patch "
 
 SRC_URI[archive.md5sum] = "e1e93eeff4367c896f3959af34ba20eb"
 SRC_URI[archive.sha256sum] = "746192d979263c74094d41e5ff0e19900b3d81eb2bd42c27c1c320dd94008034"
-- 
1.7.7.6



