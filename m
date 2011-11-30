Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVYDw-0008Er-IG
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 01:40:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 16:33:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81378110"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.149])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2011 16:33:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 16:33:46 -0800
Message-Id: <49c3923f2be40289ece9867af1cbbe9d199acc60.1322606832.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
Subject: [PATCH 10/11] clutter-box2d: drop unbuildable clutter-box2d-1.6_0.10.0
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
X-List-Received-Date: Wed, 30 Nov 2011 00:40:33 -0000

It's very old at this point and doesn't build with recent clutter

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/conf/multilib.conf                            |    2 +-
 meta/recipes-core/tasks/task-core-tools.bb         |    4 +-
 .../clutter/clutter-box2d-1.6_0.10.0.bb            |   24 ----------------
 .../clutter-box2d/fix-disable-introspection.patch  |   30 --------------------
 .../clutter/clutter-box2d/isfinite.patch           |   19 ------------
 5 files changed, 3 insertions(+), 76 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 3689482..1540f9c 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -42,9 +42,9 @@ BBCLASSEXTEND_append_pn-cairo = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-calibrateproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-chkconfig = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-clutter-1.8 = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-clutter-box2d-1.6 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-clutter-gst-1.8 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-clutter-gtk-1.8 = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-clutter-box2d = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-compositeproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-connman-gnome = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-connman = " ${MULTILIBS}"
diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index 3159e06..12d4ff9 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Tools tasks for OE-Core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r12"
+PR = "r13"
 
 PACKAGES = "\
     task-core-tools-debug \
@@ -97,5 +97,5 @@ RDEPENDS_task-core-tools-testapps = "\
     xwininfo \
     xprop \
     xvideo-tests \
-    clutter-box2d-1.6 \
+    clutter-box2d \
     "
diff --git a/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb b/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
deleted file mode 100644
index a0024d0..0000000
--- a/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require clutter-box2d.inc
-
-PR = "r1"
-
-DEPENDS += "clutter-1.6"
-
-SRC_URI = "http://source.clutter-project.org/sources/clutter-box2d/0.10/clutter-box2d-${PV}.tar.bz2 \
-           file://fix-disable-introspection.patch \
-           file://isfinite.patch \
-          "
-
-S = "${WORKDIR}/clutter-box2d-${PV}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-BASE_CONF += "--disable-introspection"
-
-do_configure_prepend () {
-	# Disable DOLT
-	sed -i -e 's/^DOLT//' ${S}/configure.ac
-}
-
-SRC_URI[md5sum] = "51618976ca6a5d536c4eac5f0e120d9d"
-SRC_URI[sha256sum] = "1e42d0cea429e4dc953a1f652672dbd322b3938846e99bab35f463de6fd8ae7f"
diff --git a/meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch b/meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch
deleted file mode 100644
index 58f2729..0000000
--- a/meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Even with introspection disabled clutter-box2d would try to install the gir
-files.
-This patch ignored the while introspection related section of the Makefile if
-introspection is disabled.
-
-JL 28/03/11
-josh@linux.intel.com
-
-Upstream-Status: Inappropriate [configuration] 
-
-Index: clutter-box2d-0.10.0/clutter-box2d/Makefile.am
-===================================================================
---- clutter-box2d-0.10.0.orig/clutter-box2d/Makefile.am
-+++ clutter-box2d-0.10.0/clutter-box2d/Makefile.am
-@@ -41,6 +41,8 @@ EXTRA_DIST = \
- 
- BUILT_GIRSOURCES =
- 
-+if HAVE_INTROSPECTION
-+
- ClutterBox2D-@CLUTTER_BOX2D_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libclutter-box2d-@CLUTTER_BOX2D_API_VERSION@.la
- 	$(QUIET_GEN)$(INTROSPECTION_SCANNER) -v \
- 		--namespace ClutterBox2D --nsversion=@CLUTTER_BOX2D_API_VERSION@ \
-@@ -70,3 +72,5 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
- 
- CLEANFILES=
- CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
-+
-+endif
-\ No newline at end of file
diff --git a/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch b/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
deleted file mode 100644
index bcdbe24..0000000
--- a/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-_finite is obsoleted and C99 has isfinite instead so we should use it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h
-===================================================================
---- clutter-box2d-0.10.0.orig/box2d/Source/Common/b2Math.h	2008-12-16 06:42:10.000000000 -0800
-+++ clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h	2011-07-20 16:41:02.046430743 -0700
-@@ -60,7 +60,7 @@
- #ifdef _MSC_VER
- 	return _finite(x) != 0;
- #else
--	return finite(x) != 0;
-+	return std::isfinite(x) != 0;
- #endif
- }
- 
-- 
1.7.7.3



