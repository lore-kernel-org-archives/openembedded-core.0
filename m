Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9637864F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465169"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:17 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:01:56 +0200
Message-Id: <20180201180210.21652-6-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/20] epiphany: update to 3.26.5.1
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:16 -0000

Upstream has replaced autotools with meson, so the recipe has been adjusted accordingly.

0001-bookmarks-Check-for-return-value-of-fread.patch deleted as the file was completely refactored

0001-yelp.m4-drop-the-check-for-itstool.patch replaced with a patch for meson equivalent

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{epiphany_3.24.3.bb => epiphany_3.26.5.1.bb}   | 15 ++++------
 ...bookmarks-Check-for-return-value-of-fread.patch | 32 --------------------
 .../0001-yelp.m4-drop-the-check-for-itstool.patch  | 33 ---------------------
 ...-help-meson.build-disable-the-use-of-yelp.patch | 34 ++++++++++++++++++++++
 4 files changed, 40 insertions(+), 74 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.24.3.bb => epiphany_3.26.5.1.bb} (56%)
 delete mode 100644 meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch
 delete mode 100644 meta/recipes-gnome/epiphany/files/0001-yelp.m4-drop-the-check-for-itstool.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.24.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.26.5.1.bb
similarity index 56%
rename from meta/recipes-gnome/epiphany/epiphany_3.24.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.26.5.1.bb
index c507d23ae93..eee53c6015e 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.24.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.26.5.1.bb
@@ -6,20 +6,17 @@ DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
 	   gsettings-desktop-schemas gnome-desktop3 libxml2-native \
 	   glib-2.0 glib-2.0-native json-glib"
 
+GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gsettings distro_features_check upstream-version-is-even gettext
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch \
-            file://0001-bookmarks-Check-for-return-value-of-fread.patch \
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
+           file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "c0221aec6a08935e6854eaa9de9451ef"
-SRC_URI[archive.sha256sum] = "fef51676310d9f37e18c9b2d778254232eb17cccd988c2d1ecf42c7b2963a154"
+SRC_URI[archive.md5sum] = "8c2062debde6377320596e2685bb1732"
+SRC_URI[archive.sha256sum] = "4b2f1c48e6f50793ff205d9215add5596ab5c7ebf4cef76907868fcd5a029221"
 
-EXTRA_OECONF += " --with-distributor-name=${DISTRO} --enable-debug=no"
-
-do_configure_prepend() {
-    sed -i -e s:help::g ${S}/Makefile.am
-}
+EXTRA_OEMESON += " -Ddistributor_name=${DISTRO}"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme"
diff --git a/meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch b/meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch
deleted file mode 100644
index ddcd39400c3..00000000000
--- a/meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From aa2176be32eed2578da82f34d31148f934c11c34 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 28 Jun 2017 17:03:45 -0700
-Subject: [PATCH] bookmarks: Check for return value of fread()
-
-Fixes below compiler error
-ignoring return value of 'fread', declared with attribute warn_unused_result
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/bookmarks/ephy-bookmark.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/bookmarks/ephy-bookmark.c b/src/bookmarks/ephy-bookmark.c
-index ff0239b..8633ce4 100644
---- a/src/bookmarks/ephy-bookmark.c
-+++ b/src/bookmarks/ephy-bookmark.c
-@@ -217,7 +217,8 @@ ephy_bookmark_init (EphyBookmark *self)
-   bytes = g_malloc (num_bytes);
- 
-   fp = fopen ("/dev/urandom", "r");
--  fread (bytes, sizeof (guint8), num_bytes, fp);
-+  if (fread (bytes, sizeof (guint8), num_bytes, fp) != num_bytes)
-+    g_warning("Unable to read data from /dev/urandom\n");
- 
-   self->id = g_malloc0 (ID_LEN + 1);
-   for (gsize i = 0; i < num_bytes; i++) {
--- 
-2.13.2
-
diff --git a/meta/recipes-gnome/epiphany/files/0001-yelp.m4-drop-the-check-for-itstool.patch b/meta/recipes-gnome/epiphany/files/0001-yelp.m4-drop-the-check-for-itstool.patch
deleted file mode 100644
index 2585d7f7413..00000000000
--- a/meta/recipes-gnome/epiphany/files/0001-yelp.m4-drop-the-check-for-itstool.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 30f03a256efe375a4d5c3a24bf4168ebf380e3ab Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 30 Jul 2015 15:13:23 +0300
-Subject: [PATCH] yelp.m4: drop the check for itstool
-
-It isn't used for anything during build, so there's no need to provide
-it as a recipe.
-
-Upstream-Status: Inappropriate [tarball-specific issue]
----
- m4/yelp.m4 | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/m4/yelp.m4 b/m4/yelp.m4
-index 5db847f..1b6ede4 100644
---- a/m4/yelp.m4
-+++ b/m4/yelp.m4
-@@ -27,12 +27,6 @@ AC_ARG_WITH([help-dir],
- HELP_DIR="$with_help_dir"
- AC_SUBST(HELP_DIR)
- 
--AC_ARG_VAR([ITSTOOL], [Path to the `itstool` command])
--AC_CHECK_PROG([ITSTOOL], [itstool], [itstool])
--if test x"$ITSTOOL" = x; then
--  AC_MSG_ERROR([itstool not found])
--fi
--
- AC_ARG_VAR([XMLLINT], [Path to the `xmllint` command])
- AC_CHECK_PROG([XMLLINT], [xmllint], [xmllint])
- if test x"$XMLLINT" = x; then
--- 
-2.1.4
-
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
new file mode 100644
index 00000000000..249517d8f90
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -0,0 +1,34 @@
+From fc314fc3a66c92fe73e1a0cea4f49d11b29e1f45 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 31 Jan 2018 15:50:38 +0200
+Subject: [PATCH 2/2] help/meson.build: disable the use of yelp
+
+In particular this avoids calling itstool which oe-core doesn't provide.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ help/meson.build | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/help/meson.build b/help/meson.build
+index f720add..cbfeb1e 100644
+--- a/help/meson.build
++++ b/help/meson.build
+@@ -46,8 +46,8 @@ help_linguas = [
+   'sv'
+ ]
+ 
+-gnome.yelp(meson.project_name(),
+-  sources: help_files,
+-  media: help_media,
+-  languages: help_linguas,
+-)
++#gnome.yelp(meson.project_name(),
++#  sources: help_files,
++#  media: help_media,
++#  languages: help_linguas,
++#)
+-- 
+2.15.1
+
-- 
2.15.1


