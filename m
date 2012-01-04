Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RiFoY-0005H0-8P
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 02:38:51 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Jan 2012 17:31:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="53000796"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.115])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jan 2012 17:31:23 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 17:31:20 -0800
Message-Id: <e4e9b594d8dc715c38ddcfa770e3bdee09641c1d.1325640149.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <cover.1325640149.git.josh@linux.intel.com>
References: <cover.1325640149.git.josh@linux.intel.com>
In-Reply-To: <cover.1325640149.git.josh@linux.intel.com>
References: <cover.1325640149.git.josh@linux.intel.com>
Subject: [PATCH 2/2] cogl: ensure we can build on armv4
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
X-List-Received-Date: Wed, 04 Jan 2012 01:38:51 -0000

Without this patch cogl will not build for armv4 as it uses an
unsupported instruction. This changeset adds a patch from Wolfgang
Denk to add an extra guard around armv5 or above code.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../clutter/cogl/build_for_armv4t.patch            |   23 ++++++++++++++++++++
 meta/recipes-graphics/clutter/cogl_1.8.2.bb        |    5 +++-
 meta/recipes-graphics/clutter/cogl_git.bb          |    5 ++-
 3 files changed, 30 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch

diff --git a/meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch b/meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch
new file mode 100644
index 0000000..3635085
--- /dev/null
+++ b/meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch
@@ -0,0 +1,23 @@
+GCC will define __ARM_ARCH_4T__ when building with "-march=armv4t" so we can
+check this to turn off the use of 'clz' instructions, which otherwise would
+cause compile errors like "selected processor does not support ARM mode 
+`clz r3,r0'". 
+
+Upstream-Status: Submitted
+
+Signed-off-by: Wolfgang Denk <wd@denx.de>
+Signed-off-by: Joshua Lock <josh@linux.intel.com>
+
+Index: cogl-1.8.2/cogl/cogl-fixed.c
+===================================================================
+--- cogl-1.8.2.orig/cogl/cogl-fixed.c
++++ cogl-1.8.2/cogl/cogl-fixed.c
+@@ -626,7 +626,7 @@ cogl_fixed_sqrt (CoglFixed x)
+ 	/*
+ 	 * Find the highest bit set
+ 	 */
+-#if defined (__arm__)
++#if defined (__arm__) && !defined(__ARM_ARCH_4T__)
+ 	/* This actually requires at least arm v5, but gcc does not seem
+ 	 * to set the architecture defines correctly, and it is I think
+ 	 * very unlikely that anyone will want to use clutter on anything
diff --git a/meta/recipes-graphics/clutter/cogl_1.8.2.bb b/meta/recipes-graphics/clutter/cogl_1.8.2.bb
index d99c443..25875f3 100644
--- a/meta/recipes-graphics/clutter/cogl_1.8.2.bb
+++ b/meta/recipes-graphics/clutter/cogl_1.8.2.bb
@@ -1,9 +1,12 @@
 require cogl.inc
 
+PR = "r1"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://source.clutter-project.org/sources/cogl/1.8/${BPN}-${PV}.tar.bz2 \
-	   file://macro-versions.patch"
+	   file://macro-versions.patch \
+	   file://build_for_armv4t.patch"
 
 SRC_URI[md5sum] = "3145cbf7ff162c33065ea4421c047e2f"
 SRC_URI[sha256sum] = "8b647b51a4fa93034fcd74ffe86b3d4c919b0e54789108f6d065414e6162ab73"
diff --git a/meta/recipes-graphics/clutter/cogl_git.bb b/meta/recipes-graphics/clutter/cogl_git.bb
index 7a10dd8..689b965 100644
--- a/meta/recipes-graphics/clutter/cogl_git.bb
+++ b/meta/recipes-graphics/clutter/cogl_git.bb
@@ -5,11 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 # the 1.8.2 tag
 SRCREV = "e398e374e2ff0e88bc1d63577a192f8ca04a1cb5"
 PV = "1.8.2+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "git://git.gnome.org/cogl;protocol=git;branch=master"
+SRC_URI = "git://git.gnome.org/cogl;protocol=git;branch=master \
+	   file://build_for_armv4t.patch"
 S = "${WORKDIR}/git"
 
 AUTOTOOLS_AUXDIR = "${S}/build"
-- 
1.7.7.5



