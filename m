Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id E42277474D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:19:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599784"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:19:54 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:01 +0300
Message-Id: <20180404111321.10824-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/22] gcr: upgrade 3.20.0 -> 3.28.0
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
X-List-Received-Date: Wed, 04 Apr 2018 11:19:55 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gcr-add-missing-dependencies-for-vapi.patch    | 51 ----------------------
 .../gcr/{gcr_3.20.0.bb => gcr_3.28.0.bb}           | 12 +++--
 2 files changed, 8 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-gnome/gcr/files/gcr-add-missing-dependencies-for-vapi.patch
 rename meta/recipes-gnome/gcr/{gcr_3.20.0.bb => gcr_3.28.0.bb} (69%)

diff --git a/meta/recipes-gnome/gcr/files/gcr-add-missing-dependencies-for-vapi.patch b/meta/recipes-gnome/gcr/files/gcr-add-missing-dependencies-for-vapi.patch
deleted file mode 100644
index a2054298656..00000000000
--- a/meta/recipes-gnome/gcr/files/gcr-add-missing-dependencies-for-vapi.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From e7e0c56ca82031121f192f7f711b78418b154c9f Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Mon, 28 Nov 2016 10:17:34 +0800
-Subject: [PATCH] gcr: add missing dependencies for vapi
-
-According to the vapi_DEPS definition:
-gcr-3.vapi depends on gck-1.vapi,
-gcr-ui-3.vapi depends on gck-1.vapi and gcr-3.vapi
-
-But these dependencies are missing for the make targets,
-so it will fail when build in parallel:
-error: Package `gck-1' not found in specified Vala API directories or GObject-Introspection GIR directories
-error: Package `gcr-3' not found in specified Vala API directories or GObject-Introspection GIR directories
-
-Upstream-Status: Submitted [https://bug775966.bugzilla-attachments.gnome.org/attachment.cgi?id=341791]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- gcr/Makefile.am | 2 +-
- ui/Makefile.am  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcr/Makefile.am b/gcr/Makefile.am
-index eda302f..6e78dba 100644
---- a/gcr/Makefile.am
-+++ b/gcr/Makefile.am
-@@ -221,7 +221,7 @@ gir_DATA += Gcr-@GCR_MAJOR@.gir
- 
- if ENABLE_VAPIGEN
- 
--gcr-@GCR_MAJOR@.vapi: Gcr-@GCR_MAJOR@.gir gcr/Gcr-@GCR_MAJOR@.metadata gcr-@GCR_MAJOR@.deps
-+gcr-@GCR_MAJOR@.vapi: Gcr-@GCR_MAJOR@.gir gcr/Gcr-@GCR_MAJOR@.metadata gcr-@GCR_MAJOR@.deps gck-@GCK_MAJOR@.vapi
- 
- VAPIGEN_VAPIS += gcr-@GCR_MAJOR@.vapi
- 
-diff --git a/ui/Makefile.am b/ui/Makefile.am
-index aa52476..6612f0d 100644
---- a/ui/Makefile.am
-+++ b/ui/Makefile.am
-@@ -160,7 +160,7 @@ gir_DATA += GcrUi-@GCR_MAJOR@.gir
- 
- if ENABLE_VAPIGEN
- 
--gcr-ui-@GCR_MAJOR@.vapi: GcrUi-@GCR_MAJOR@.gir ui/GcrUi-@GCR_MAJOR@.metadata gcr-ui-@GCR_MAJOR@.deps
-+gcr-ui-@GCR_MAJOR@.vapi: GcrUi-@GCR_MAJOR@.gir ui/GcrUi-@GCR_MAJOR@.metadata gcr-ui-@GCR_MAJOR@.deps gck-@GCK_MAJOR@.vapi gcr-@GCR_MAJOR@.vapi
- 
- VAPIGEN_VAPIS += gcr-ui-@GCR_MAJOR@.vapi
- 
--- 
-2.8.3
-
diff --git a/meta/recipes-gnome/gcr/gcr_3.20.0.bb b/meta/recipes-gnome/gcr/gcr_3.28.0.bb
similarity index 69%
rename from meta/recipes-gnome/gcr/gcr_3.20.0.bb
rename to meta/recipes-gnome/gcr/gcr_3.28.0.bb
index 4450e155e66..9e6f1ff0d98 100644
--- a/meta/recipes-gnome/gcr/gcr_3.20.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.28.0.bb
@@ -12,10 +12,8 @@ inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check upstrea
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://gcr-add-missing-dependencies-for-vapi.patch"
-
-SRC_URI[archive.md5sum] = "4314bf89eac293dd0a9d806593ff1b35"
-SRC_URI[archive.sha256sum] = "90572c626d8a708225560c42b4421f7941315247fa1679d4ef569bde7f4bb379"
+SRC_URI[archive.md5sum] = "5321319307dad34dca2fd52e7c9c01ab"
+SRC_URI[archive.sha256sum] = "15e175d1da7ec486d59749ba34906241c442898118ce224a7b70bf2e849faf0b"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
@@ -24,3 +22,9 @@ FILES_${PN} += " \
 
 # http://errors.yoctoproject.org/Errors/Details/20229/
 ARM_INSTRUCTION_SET = "arm"
+
+# These files may be out of date or missing our fixes
+# libgcrypt.m4 in particular is calling into libgcrypt-config
+do_configure_prepend() {
+    rm -f ${S}/build/m4/*
+}
-- 
2.16.1


