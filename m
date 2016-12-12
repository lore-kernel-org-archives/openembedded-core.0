Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39389607A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 05:25:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBC5PLqw027997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 21:25:21 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 11 Dec 2016 21:25:20 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Dec 2016 13:22:14 +0800
Message-ID: <20161212052214.20223-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH v2] gcr: add missing dependencies for vapi
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
X-List-Received-Date: Mon, 12 Dec 2016 05:25:25 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

According to the vapi_DEPS definition:
gcr-3.vapi depends on gck-1.vapi,
gcr-ui-3.vapi depends on gck-1.vapi and gcr-3.vapi

But these dependencies are missing for the make targets,
so it will fail when build in parallel:
error: Package `gck-1' not found in specified Vala API directories or GObject-Introspection GIR directories
error: Package `gcr-3' not found in specified Vala API directories or GObject-Introspection GIR directories

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../gcr-add-missing-dependencies-for-vapi.patch    | 51 ++++++++++++++++++++++
 meta/recipes-gnome/gcr/gcr_3.20.0.bb               |  2 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-gnome/gcr/files/gcr-add-missing-dependencies-for-vapi.patch

diff --git a/meta/recipes-gnome/gcr/files/gcr-add-missing-dependencies-for-vapi.patch b/meta/recipes-gnome/gcr/files/gcr-add-missing-dependencies-for-vapi.patch
new file mode 100644
index 0000000..a205429
--- /dev/null
+++ b/meta/recipes-gnome/gcr/files/gcr-add-missing-dependencies-for-vapi.patch
@@ -0,0 +1,51 @@
+From e7e0c56ca82031121f192f7f711b78418b154c9f Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 28 Nov 2016 10:17:34 +0800
+Subject: [PATCH] gcr: add missing dependencies for vapi
+
+According to the vapi_DEPS definition:
+gcr-3.vapi depends on gck-1.vapi,
+gcr-ui-3.vapi depends on gck-1.vapi and gcr-3.vapi
+
+But these dependencies are missing for the make targets,
+so it will fail when build in parallel:
+error: Package `gck-1' not found in specified Vala API directories or GObject-Introspection GIR directories
+error: Package `gcr-3' not found in specified Vala API directories or GObject-Introspection GIR directories
+
+Upstream-Status: Submitted [https://bug775966.bugzilla-attachments.gnome.org/attachment.cgi?id=341791]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ gcr/Makefile.am | 2 +-
+ ui/Makefile.am  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcr/Makefile.am b/gcr/Makefile.am
+index eda302f..6e78dba 100644
+--- a/gcr/Makefile.am
++++ b/gcr/Makefile.am
+@@ -221,7 +221,7 @@ gir_DATA += Gcr-@GCR_MAJOR@.gir
+ 
+ if ENABLE_VAPIGEN
+ 
+-gcr-@GCR_MAJOR@.vapi: Gcr-@GCR_MAJOR@.gir gcr/Gcr-@GCR_MAJOR@.metadata gcr-@GCR_MAJOR@.deps
++gcr-@GCR_MAJOR@.vapi: Gcr-@GCR_MAJOR@.gir gcr/Gcr-@GCR_MAJOR@.metadata gcr-@GCR_MAJOR@.deps gck-@GCK_MAJOR@.vapi
+ 
+ VAPIGEN_VAPIS += gcr-@GCR_MAJOR@.vapi
+ 
+diff --git a/ui/Makefile.am b/ui/Makefile.am
+index aa52476..6612f0d 100644
+--- a/ui/Makefile.am
++++ b/ui/Makefile.am
+@@ -160,7 +160,7 @@ gir_DATA += GcrUi-@GCR_MAJOR@.gir
+ 
+ if ENABLE_VAPIGEN
+ 
+-gcr-ui-@GCR_MAJOR@.vapi: GcrUi-@GCR_MAJOR@.gir ui/GcrUi-@GCR_MAJOR@.metadata gcr-ui-@GCR_MAJOR@.deps
++gcr-ui-@GCR_MAJOR@.vapi: GcrUi-@GCR_MAJOR@.gir ui/GcrUi-@GCR_MAJOR@.metadata gcr-ui-@GCR_MAJOR@.deps gck-@GCK_MAJOR@.vapi gcr-@GCR_MAJOR@.vapi
+ 
+ VAPIGEN_VAPIS += gcr-ui-@GCR_MAJOR@.vapi
+ 
+-- 
+2.8.3
+
diff --git a/meta/recipes-gnome/gcr/gcr_3.20.0.bb b/meta/recipes-gnome/gcr/gcr_3.20.0.bb
index b32a455..2088902 100644
--- a/meta/recipes-gnome/gcr/gcr_3.20.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.20.0.bb
@@ -11,6 +11,8 @@ inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check upstrea
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://gcr-add-missing-dependencies-for-vapi.patch"
+
 SRC_URI[archive.md5sum] = "4314bf89eac293dd0a9d806593ff1b35"
 SRC_URI[archive.sha256sum] = "90572c626d8a708225560c42b4421f7941315247fa1679d4ef569bde7f4bb379"
 
-- 
2.8.3


