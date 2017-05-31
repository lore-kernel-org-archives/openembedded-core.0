Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 24D7878062
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:23:28 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2017 04:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="108658294"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 31 May 2017 04:23:29 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 3D7545803BE;
	Wed, 31 May 2017 04:23:28 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:23:15 +0300
Message-Id: <496f02e7c98d6a41b51f367d4376a9a8e62a35f9.1496229576.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496229576.git.jussi.kukkonen@intel.com>
References: <cover.1496229576.git.jussi.kukkonen@intel.com>
Subject: [PATCH 06/10] adwaita-icon-theme: Upgrade 3.22.0 -> 3.24.0
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
X-List-Received-Date: Wed, 31 May 2017 11:23:28 -0000

Add patch to fix allarch-build by removing a useless AC_CANONICAL_HOST.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch         | 29 ++++++++++++++++++++++
 ...heme_3.22.0.bb => adwaita-icon-theme_3.24.0.bb} |  5 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.22.0.bb => adwaita-icon-theme_3.24.0.bb} (89%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
new file mode 100644
index 0000000..e7ac97b
--- /dev/null
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -0,0 +1,29 @@
+From d2b9ad8a80bf9320fe35c9aee8f52e55ebd40e06 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 30 May 2017 14:55:49 +0300
+Subject: [PATCH] Don't use AC_CANONICAL_HOST
+
+This won't work when building allarch (and is only used to find out if
+target is windows).
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d855b7a..6908f59 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,6 @@ AC_PREREQ(2.53)
+ 
+ AC_INIT([adwaita-icon-theme], [3.24.0],
+         [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
+-AC_CANONICAL_HOST
+ AC_CONFIG_MACRO_DIR([m4])
+ AC_CONFIG_SRCDIR([index.theme.in])
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.22.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.24.0.bb
similarity index 89%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.22.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.24.0.bb
index 1cbc1e6..5fdc71d 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.22.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.24.0.bb
@@ -11,10 +11,11 @@ inherit allarch autotools pkgconfig gettext gtk-icon-cache upstream-version-is-e
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
+           file://0001-Don-t-use-AC_CANONICAL_HOST.patch \
           "
 
-SRC_URI[md5sum] = "cde51d7dfcbcfa3b8cdc3e5f0df8c799"
-SRC_URI[sha256sum] = "c18bf6e26087d9819a962c77288b291efab25d0419b73d909dd771716a45dcb7"
+SRC_URI[md5sum] = "3ccac0d600ffc936d2adfb80e9245bc5"
+SRC_URI[sha256sum] = "ccf79ff3bd340254737ce4d28b87f0ccee4b3358cd3cd5cd11dc7b42f41b272a"
 
 do_install_append() {
 	# Build uses gtk-encode-symbolic-svg to create png versions:
-- 
2.1.4


