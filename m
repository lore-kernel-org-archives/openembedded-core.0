Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRern-00041j-F4
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203804"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:38 -0700
Message-Id: <93677bdf3562828c43caaf2463a1a831b88e3f78.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/32] dtc: Cleanup and update recipe
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:20 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/dtc/dtc-native.inc             |    3 ---
 meta/recipes-kernel/dtc/dtc-native_git.bb          |    5 -----
 meta/recipes-kernel/dtc/dtc.inc                    |    8 +++++++-
 meta/recipes-kernel/dtc/dtc/remove_space_opt.patch |    2 ++
 meta/recipes-kernel/dtc/dtc_git.bb                 |   15 ++++++++++++---
 meta/recipes-kernel/dtc/dtc_git.inc                |    8 --------
 6 files changed, 21 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc-native.inc
 delete mode 100644 meta/recipes-kernel/dtc/dtc-native_git.bb
 delete mode 100644 meta/recipes-kernel/dtc/dtc_git.inc

diff --git a/meta/recipes-kernel/dtc/dtc-native.inc b/meta/recipes-kernel/dtc/dtc-native.inc
deleted file mode 100644
index 1da7004..0000000
--- a/meta/recipes-kernel/dtc/dtc-native.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-require dtc.inc
-
-inherit native
diff --git a/meta/recipes-kernel/dtc/dtc-native_git.bb b/meta/recipes-kernel/dtc/dtc-native_git.bb
deleted file mode 100644
index fd5bde5..0000000
--- a/meta/recipes-kernel/dtc/dtc-native_git.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
-		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
-
-require dtc-native.inc
-require dtc_git.inc
diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index e068df3..cfed15a 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -2,7 +2,7 @@ SUMMARY = "Device Tree Compiler"
 DESCRIPTION = "The Device Tree Compiler is a tool used to manipulate the Open-Firmware-like device tree used by PowerPC kernels."
 SECTION = "bootloader"
 PRIORITY = "optional"
-LICENSE = "GPL"
+LICENSE = "GPL2 | BSD"
 DEPENDS = "flex-native bison-native"
 
 inherit autotools
@@ -11,3 +11,9 @@ do_install() {
 	install -m 0755 -d ${D}${bindir}
 	install -m 755 dtc ${D}${bindir}/dtc
 }
+SRC_URI = "git://www.jdl.com/software/dtc.git;protocol=git \
+	file://fix_for_compilation_with_gcc_4.6.0.patch"
+
+INC_PR = "r0"
+
+S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/dtc/dtc/remove_space_opt.patch b/meta/recipes-kernel/dtc/dtc/remove_space_opt.patch
index 805bf58..8c26dec 100644
--- a/meta/recipes-kernel/dtc/dtc/remove_space_opt.patch
+++ b/meta/recipes-kernel/dtc/dtc/remove_space_opt.patch
@@ -1,5 +1,7 @@
 Remove the -Os flag
 
+Upstream-Status: Inappropriate [configuration]
+
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 Index: git/Makefile
 ===================================================================
diff --git a/meta/recipes-kernel/dtc/dtc_git.bb b/meta/recipes-kernel/dtc/dtc_git.bb
index 1cca32c..e010488 100644
--- a/meta/recipes-kernel/dtc/dtc_git.bb
+++ b/meta/recipes-kernel/dtc/dtc_git.bb
@@ -1,7 +1,16 @@
 require dtc.inc
-require dtc_git.inc
-LICENSE="GPLv2|BSD"
+
 LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
 
-SRC_URI += " file://remove_space_opt.patch"
+SRCREV = "73dca9ae0b9abe6924ba640164ecce9f8df69c5a"
+PV = "1.3.0+git${SRCPV}"
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/git"
+
+SRC_URI_PATCH = " file://remove_space_opt.patch"
+SRC_URI_PATCH_virtclass-native = ""
+SRC_URI += "${SRC_URI_PATCH}"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-kernel/dtc/dtc_git.inc b/meta/recipes-kernel/dtc/dtc_git.inc
deleted file mode 100644
index 2400cfe..0000000
--- a/meta/recipes-kernel/dtc/dtc_git.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-SRC_URI = "git://www.jdl.com/software/dtc.git;protocol=git \
-	file://fix_for_compilation_with_gcc_4.6.0.patch"
-
-SRCREV = "73dca9ae0b9abe6924ba640164ecce9f8df69c5a"
-PV = "1.2.0+git${SRCPV}"
-PR = "r3"
-
-S = "${WORKDIR}/git"
-- 
1.7.3.4



