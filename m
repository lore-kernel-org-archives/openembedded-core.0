Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 29660780A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:16:32 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 06:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,399,1493708400"; d="scan'208";a="119321570"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 27 Jun 2017 06:16:30 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id D1618580118;
	Tue, 27 Jun 2017 06:16:29 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 16:16:23 +0300
Message-Id: <93aec811b9e619114e078f648104c84e075ceeeb.1498569089.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1498569089.git.jussi.kukkonen@intel.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/3] gtk+3: Update UPSTREAM_CHECK_REGEX
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
X-List-Received-Date: Tue, 27 Jun 2017 13:16:33 -0000

Avoid versions >= 3.90 (development versions for 4.0).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc                        | 6 +++++-
 meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.15.bb | 5 ++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 27da844..34845ae 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -10,7 +10,11 @@ DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
-inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check upstream-version-is-even gobject-introspection
+inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check gobject-introspection
+
+# versions >= 3.90 are development versions, otherwise like upstream-version-is-even
+UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3\.([1-8]?[02468])+(\.\d+)+)\.tar"
+
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # This should be in autotools.bbclass, but until something elses uses it putting
diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.15.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.15.bb
index d8a0bd0..2d65b96 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.15.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.15.bb
@@ -20,7 +20,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-inherit pkgconfig native upstream-version-is-even
+inherit pkgconfig native
+
+# versions >= 3.90 are development versions, otherwise like upstream-version-is-even
+UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3\.([1-8]?[02468])+(\.\d+)+)\.tar"
 
 PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
 
-- 
2.1.4


