Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLP9v-000573-6I
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 02:26:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2011 17:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; d="scan'208";a="642780259"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by orsmga002.jf.intel.com with ESMTP; 14 May 2011 17:23:02 -0700
Message-Id: <78d58933e1b2875b6aa8c8a8c744b9a0e705e8d4.1305418871.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305418871.git.sgw@linux.intel.com>
References: <cover.1305418871.git.sgw@linux.intel.com>
Old-Date: Fri, 13 May 2011 19:22:10 -0700
Date: Sat, 14 May 2011 17:23:02 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [RFC 2/3] clutter: Clean up old recipes
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
X-List-Received-Date: Sun, 15 May 2011 00:26:11 -0000

From: Saul Wold <sgw@linux.intel.com>

[YOCTO #1039] [YOCTO #1040]

clutter-1.4 is moved to meta-extras
clutter-box2d is migrated to latest 1.6 version

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb |   25 --------------------
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    4 +-
 .../clutter/clutter-gst-1.4/enable_tests.patch     |   15 ------------
 .../clutter/clutter-gst-1.4_git.bb                 |   19 ---------------
 .../clutter/clutter-gtk-1.4_git.bb                 |   18 --------------
 5 files changed, 2 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.4/enable_tests.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb

diff --git a/meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb b/meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb
deleted file mode 100644
index b736846..0000000
--- a/meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require clutter.inc
-
-PR = "r1"
-
-PACKAGES =+ "${PN}-examples"
-FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
-
-SRC_URI = "http://source.clutter-project.org/sources/clutter/1.4/clutter-${PV}.tar.bz2 \
-           file://enable_tests-1.4.patch;patch=1 \
-           file://test-conformance-fix.patch;patch=1 "
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-S = "${WORKDIR}/clutter-1.4.2"
-
-BASE_CONF += "--disable-introspection"
-
-EXTRA_OECONF += "--with-json=check"
-
-do_configure_prepend () {
-	# Disable DOLT
-	sed -i -e 's/^DOLT//' ${S}/configure.ac
-}
-
-SRC_URI[md5sum] = "5a3c6d8414d4e286aba0a936f344c9b1"
-SRC_URI[sha256sum] = "92fd67acce5105c933e54ad0c87d0f5ace1202fd0f87949cb49a3759e6e38892"
diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
index 7671530..4c1c003 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -2,7 +2,7 @@ require clutter-box2d.inc
 
 LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6b"
 
-SRCREV = "92b44f79a8667a31b46b861236392bdf32b7d6c2"
+SRCREV = "4799ac10ae8cb7da936a2b999aba58fe62eb1ee3"
 PV = "0.10.1+git${SRCPV}"
 PR = "r0"
 
@@ -10,4 +10,4 @@ SRC_URI = "git://git.clutter-project.org/clutter-box2d.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
-DEPENDS += "clutter-1.4"
+DEPENDS += "clutter-1.6"
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.4/enable_tests.patch b/meta/recipes-graphics/clutter/clutter-gst-1.4/enable_tests.patch
deleted file mode 100644
index f1f68ac..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst-1.4/enable_tests.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Install example binary needed for core-image-clutter
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-Index: git/examples/Makefile.am
-===================================================================
---- git.orig/examples/Makefile.am	2011-05-04 14:07:21.000000000 -0700
-+++ git/examples/Makefile.am	2011-05-04 14:24:38.625984314 -0700
-@@ -1,6 +1,6 @@
- NULL = #
- 
--noinst_PROGRAMS = video-player video-sink audio-player
-+bin_PROGRAMS = video-player video-sink audio-player
- 
- INCLUDES = -I$(top_srcdir) \
- 	   $(MAINTAINER_CFLAGS) \
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb b/meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb
deleted file mode 100644
index 1ab867d..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require clutter-gst.inc
-
-SRCREV = "8a087fabc888a6a4a939760c392109dbb610adbf"
-PV = "1.3.4+git${SRCPV}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=3275ae5179d58dccf8852cdad3a44574"
-
-DEPENDS += "clutter-1.4"
-
-SRC_URI = "git://git.clutter-project.org/clutter-gst.git;protocol=git;branch=master \
-           file://enable_tests-1.4.patch"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend () {
-       # Disable DOLT
-       sed -i -e 's/^DOLT//' ${S}/configure.ac
-}
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb
deleted file mode 100644
index 12822c0..0000000
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require clutter-gtk.inc
-
-SRCREV = "b92329c4c1288019e2dea6567e2b5e98eb0a9992"
-PV = "0.90.0+git${SRCPV}"
-PR = "r0"
-
-SRC_URI =  "git://git.clutter-project.org/clutter-gtk.git;protocol=git;branch=master \
-           file://disable_deprecated.patch \
-           file://enable_tests.patch \
-           "
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += "clutter-1.4"
-
-EXTRA_OECONF += "--disable-introspection"
-- 
1.7.1.1



