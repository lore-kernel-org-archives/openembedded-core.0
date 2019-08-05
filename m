Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 84B517C4DB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 03:32:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Aug 2019 20:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,348,1559545200"; d="scan'208";a="197836861"
Received: from anmitta2-mobl1.png.intel.com ([172.30.199.133])
	by fmsmga004.fm.intel.com with ESMTP; 04 Aug 2019 20:32:22 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 11:32:17 +0800
Message-Id: <20190805033218.6750-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/2] pango: upgrade 1.42.4 -> 1.44.3
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
X-List-Received-Date: Mon, 05 Aug 2019 03:32:22 -0000
Content-Transfer-Encoding: 8bit

* For changes, see:
https://github.com/GNOME/pango/blob/master/NEWS

* Remove upstreamed patch, rename docs and introspection meson
options and add PACKAGECONFIG for tests.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../pango/pango/insensitive-diff.patch        | 28 -------------------
 .../{pango_1.42.4.bb => pango_1.44.3.bb}      | 22 ++++++---------
 2 files changed, 9 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango/insensitive-diff.patch
 rename meta/recipes-graphics/pango/{pango_1.42.4.bb => pango_1.44.3.bb} (73%)

diff --git a/meta/recipes-graphics/pango/pango/insensitive-diff.patch b/meta/recipes-graphics/pango/pango/insensitive-diff.patch
deleted file mode 100644
index faaa96133f..0000000000
--- a/meta/recipes-graphics/pango/pango/insensitive-diff.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Do case-insensitive diffs as the test is sensitive as to whether 0x0 is printed
-as (null) or (NULL).
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/pango/merge_requests/44]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/tests/markup-parse.c b/tests/markup-parse.c
-index 633f3e89..36d2c776 100644
---- a/tests/markup-parse.c
-+++ b/tests/markup-parse.c
-@@ -217,7 +217,7 @@ diff_with_file (const char  *file1,
-                 GString     *string,
-                 GError     **error)
- {
--  const char *command[] = { "diff", "-u", file1, NULL, NULL };
-+  const char *command[] = { "diff", "-u", "-i", file1, NULL, NULL };
-   char *diff, *tmpfile;
-   int fd;
- 
-@@ -237,7 +237,7 @@ diff_with_file (const char  *file1,
-       goto done;
-     }
-   close (fd);
--  command[3] = tmpfile;
-+  command[4] = tmpfile;
- 
-   /* run diff command */
-   g_spawn_sync (NULL, (char **)command, NULL, G_SPAWN_SEARCH_PATH, NULL, NULL, &diff, NULL, NULL, error);
diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.44.3.bb
similarity index 73%
rename from meta/recipes-graphics/pango/pango_1.42.4.bb
rename to meta/recipes-graphics/pango/pango_1.44.3.bb
index 58e1f41be5..1973c63f82 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.44.3.bb
@@ -16,18 +16,21 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += "file://run-ptest \
-            file://insensitive-diff.patch"
+            "
 
-SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
-SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
+SRC_URI[archive.md5sum] = "7f91f1b5883ff848b445ab11ebabcf03"
+SRC_URI[archive.sha256sum] = "290bb100ca5c7025ec3f97332eaf783b76ba1f444110f06ac5ee3285e3e5aece"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
+                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+
 PACKAGECONFIG[x11] = ",,virtual/libx11 libxft"
+PACKAGECONFIG[tests] = "-Dinstall-tests=true, -Dinstall-tests=false"
 
-GTKDOC_MESON_OPTION = "enable_docs"
-GIR_MESON_OPTION = 'gir'
+GTKDOC_MESON_OPTION = "gtk_doc"
+GIR_MESON_OPTION = 'introspection'
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.8.0"
@@ -41,10 +44,3 @@ RPROVIDES_${PN} += "pango-modules pango-module-indic-lang \
                     pango-module-basic-fc pango-module-arabic-lang"
 
 BBCLASSEXTEND = "native nativesdk"
-
-do_install_append () {
-	if [ "${PTEST_ENABLED}" != "1" ]; then
-		rm -rf ${D}${libexecdir}/installed-tests ${D}${datadir}/installed-tests
-                rmdir --ignore-fail-on-non-empty ${D}${libexecdir} ${D}${datadir}
-	fi
-}
-- 
2.21.0


