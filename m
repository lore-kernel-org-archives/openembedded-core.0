Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDI-0006Li-MA
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507178"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:48 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:37 -0700
Message-Id: <8135a9f2769c2dd73efda09511f2fd631c39fbe2.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 22/30] libcroco: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:14:06 -0000

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
1.7.7



