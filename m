Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E5C7B7883F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 12:02:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2017 04:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,409,1505804400"; 
   d="scan'208";a="3341749"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 17 Nov 2017 04:02:44 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 14:02:47 +0200
Message-Id: <6aa74ab7ada2396f957565ebf780614b2838f5b7.1510920094.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
References: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/9] gnomebase.bbclass: split into autotools and meson versions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Nov 2017 12:02:44 -0000

gnomebase.bbclass unfortunately hardcodes the autotools inherit,
so we have to introduce gnomebase-nobuildsystem.bbclass where
the common bits between autotools and meson classes can be placed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gnomebase-meson.bbclass         |  1 +
 meta/classes/gnomebase-nobuildsystem.bbclass | 27 +++++++++++++++++++++++++
 meta/classes/gnomebase.bbclass               | 30 +---------------------------
 3 files changed, 29 insertions(+), 29 deletions(-)
 create mode 100644 meta/classes/gnomebase-meson.bbclass
 create mode 100644 meta/classes/gnomebase-nobuildsystem.bbclass

diff --git a/meta/classes/gnomebase-meson.bbclass b/meta/classes/gnomebase-meson.bbclass
new file mode 100644
index 00000000000..6cb97397572
--- /dev/null
+++ b/meta/classes/gnomebase-meson.bbclass
@@ -0,0 +1 @@
+inherit meson gnomebase-nobuildsystem
diff --git a/meta/classes/gnomebase-nobuildsystem.bbclass b/meta/classes/gnomebase-nobuildsystem.bbclass
new file mode 100644
index 00000000000..2ea7367a83a
--- /dev/null
+++ b/meta/classes/gnomebase-nobuildsystem.bbclass
@@ -0,0 +1,27 @@
+def gnome_verdir(v):
+    return oe.utils.trim_version(v, 2)
+
+GNOME_COMPRESS_TYPE ?= "xz"
+SECTION ?= "x11/gnome"
+GNOMEBN ?= "${BPN}"
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
+
+FILES_${PN} += "${datadir}/application-registry  \
+                ${datadir}/mime-info \
+                ${datadir}/mime/packages \
+                ${datadir}/mime/application \
+                ${datadir}/gnome-2.0 \
+                ${datadir}/polkit* \
+                ${datadir}/GConf \
+                ${datadir}/glib-2.0/schemas \
+                ${datadir}/appdata \
+                ${datadir}/icons \
+"
+
+FILES_${PN}-doc += "${datadir}/devhelp"
+
+do_install_append() {
+	rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
+	rm -rf ${D}${localstatedir}/scrollkeeper/*
+	rm -f ${D}${datadir}/applications/*.cache
+}
diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index 4ccc8e07814..84756aea1ec 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -1,29 +1 @@
-def gnome_verdir(v):
-    return oe.utils.trim_version(v, 2)
-
-GNOME_COMPRESS_TYPE ?= "xz"
-SECTION ?= "x11/gnome"
-GNOMEBN ?= "${BPN}"
-SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
-
-FILES_${PN} += "${datadir}/application-registry  \
-                ${datadir}/mime-info \
-                ${datadir}/mime/packages \
-                ${datadir}/mime/application \
-                ${datadir}/gnome-2.0 \
-                ${datadir}/polkit* \
-                ${datadir}/GConf \
-                ${datadir}/glib-2.0/schemas \
-                ${datadir}/appdata \
-                ${datadir}/icons \
-"
-
-FILES_${PN}-doc += "${datadir}/devhelp"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-	rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
-	rm -rf ${D}${localstatedir}/scrollkeeper/*
-	rm -f ${D}${datadir}/applications/*.cache
-}
+inherit autotools pkgconfig gnomebase-nobuildsystem
-- 
2.15.0


