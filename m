Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8957829F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 17:09:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Aug 2017 10:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,417,1498546800"; d="scan'208";a="1187402123"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2017 10:09:33 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 20:06:20 +0300
Message-Id: <b02a81bf24cc95ab7cd14f9268f1b416c2a11486.1503507784.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1503507784.git.alexander.kanavin@linux.intel.com>
References: <cover.1503507784.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/7] gnomebase.bbclass: split into autotools and meson versions
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
X-List-Received-Date: Wed, 23 Aug 2017 17:09:32 -0000

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
2.14.1


