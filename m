Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 23605781E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 12:25:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 14 Jul 2017 05:25:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,359,1496127600"; d="scan'208";a="111323753"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2017 05:25:38 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id DC3DE5807D9;
	Fri, 14 Jul 2017 05:25:37 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 15:25:25 +0300
Message-Id: <ded7a811341b0869d349278368f45faf43522e7e.1500034432.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1500034432.git.jussi.kukkonen@intel.com>
References: <cover.1500034432.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/4] gnome-desktop: Don't use gnome-common
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
X-List-Received-Date: Fri, 14 Jul 2017 12:25:42 -0000

Add a patch to no use gnome-common macros

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...figure.ac-Remove-gnome-common-macro-calls.patch | 33 ++++++++++++++++++++++
 .../gnome-desktop/gnome-desktop3_3.24.2.bb         |  6 ++--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-configure.ac-Remove-gnome-common-macro-calls.patch

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-configure.ac-Remove-gnome-common-macro-calls.patch b/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-configure.ac-Remove-gnome-common-macro-calls.patch
new file mode 100644
index 0000000..992c353
--- /dev/null
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-configure.ac-Remove-gnome-common-macro-calls.patch
@@ -0,0 +1,33 @@
+From 834bc861921fe0361f2d6a5b5716fc97a9519478 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Thu, 6 Jul 2017 13:13:45 +0300
+Subject: [PATCH] configure.ac: Remove gnome-common macro calls
+
+gnome-common is deprecated and these aren't doing much for us.
+
+Upstreamable fix would probably involve using autoconf-archive:
+Trying to avoid that dependency for now.
+
+Upstream-Status: [Inappropriate]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7adcf0e..bb7659d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -71,9 +71,6 @@ AC_SUBST(GNOME_DATE)
+ AC_SUBST(GNOME_DATE_COMMENT_START)
+ AC_SUBST(GNOME_DATE_COMMENT_END)
+ 
+-GNOME_COMPILE_WARNINGS([maximum])
+-GNOME_MAINTAINER_MODE_DEFINES
+-
+ AC_ARG_ENABLE(deprecation_flags,
+               [AC_HELP_STRING([--enable-deprecation-flags],
+                               [use *_DISABLE_DEPRECATED flags @<:@default=no@:>@])],,
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.24.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.24.2.bb
index 24d23ba..5c1c213 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.24.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.24.2.bb
@@ -10,9 +10,11 @@ inherit gnome pkgconfig upstream-version-is-even gobject-introspection
 SRC_URI[archive.md5sum] = "af7c6a243df7a335a010bdc05b34ca93"
 SRC_URI[archive.sha256sum] = "8fa1de66a6a75963bffc79b01a60434c71237d44c51beca09c0f714a032d785e"
 
-SRC_URI += "file://gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch"
+SRC_URI += "file://gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch \
+            file://0001-configure.ac-Remove-gnome-common-macro-calls.patch \
+"
 
-DEPENDS += "intltool-native gnome-common-native gsettings-desktop-schemas gconf virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes udev"
+DEPENDS += "intltool-native gsettings-desktop-schemas gconf virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes udev"
 
 inherit distro_features_check gtk-doc
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.1.4


