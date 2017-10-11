Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F22D478213
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945842"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:59 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:28 +0300
Message-Id: <605514a1363011832de9af2b0eff17c77129bbcd.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 36/50] gdk-pixbuf: update to 2.36.11
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:05 -0000

Remove upstreamed 0001-queryloaders-Make-output-more-reproducible.patch

Rebase fatal-loader.patch

Add a patch to fix a libtiff detection issue.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-Fix-without-libtiff-not-having-an-effect.patch | 27 +++++++++++
 ...ueryloaders-Make-output-more-reproducible.patch | 56 ----------------------
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch       | 39 ++++++++++-----
 ...{gdk-pixbuf_2.36.8.bb => gdk-pixbuf_2.36.11.bb} |  6 +--
 4 files changed, 56 insertions(+), 72 deletions(-)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-without-libtiff-not-having-an-effect.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-queryloaders-Make-output-more-reproducible.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.8.bb => gdk-pixbuf_2.36.11.bb} (94%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-without-libtiff-not-having-an-effect.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-without-libtiff-not-having-an-effect.patch
new file mode 100644
index 00000000000..2a54d8ed763
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-without-libtiff-not-having-an-effect.patch
@@ -0,0 +1,27 @@
+From 460befc992adb32434b0408b453be39a6866ccf8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Oct 2017 14:33:18 +0300
+Subject: [PATCH] Fix --without-libtiff not having an effect.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=788770]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 315e0cc..98e780c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -676,7 +676,7 @@ if test x$gio_can_sniff = x; then
+   AC_DEFINE(GDK_PIXBUF_USE_GIO_MIME, 1, [Define if gio can sniff image data])
+ fi
+ 
+-AM_CONDITIONAL(HAVE_TIFF, test "x$libtiff_found" != x)
++AM_CONDITIONAL(HAVE_TIFF, test "x$libtiff_found" != xno)
+ AM_CONDITIONAL(HAVE_PNG, test "x$LIBPNG" != x)
+ AM_CONDITIONAL(HAVE_JPEG, test "x$LIBJPEG" != x)
+ AM_CONDITIONAL(HAVE_JASPER, test "x$LIBJASPER" != x)
+-- 
+2.14.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-queryloaders-Make-output-more-reproducible.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-queryloaders-Make-output-more-reproducible.patch
deleted file mode 100644
index aa21419fafc..00000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-queryloaders-Make-output-more-reproducible.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 1049fbd887e52f94afeb03fc7942c01c143ebdfc Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 9 Jun 2017 12:01:25 +0300
-Subject: [PATCH] queryloaders: Make output more reproducible
-
-Reproducible builds are good: Sort the output by module name so that
-same input always leads to same output.
-
-This should also make gdk-pixbuf-print-mime-types output and
-gdk-pixbuf-thumbnailer.thumbnailer reproducible.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=783592
-
-Upstream-Status: Submitted
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- gdk-pixbuf/queryloaders.c | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/gdk-pixbuf/queryloaders.c b/gdk-pixbuf/queryloaders.c
-index 395674a..4ac9b28 100644
---- a/gdk-pixbuf/queryloaders.c
-+++ b/gdk-pixbuf/queryloaders.c
-@@ -346,6 +346,7 @@ int main (int argc, char **argv)
- #ifdef USE_GMODULE
-                 const char *path;
-                 GDir *dir;
-+                GList *l, *modules = NULL;
- 
-                 path = g_getenv ("GDK_PIXBUF_MODULEDIR");
- #ifdef G_OS_WIN32
-@@ -365,12 +366,19 @@ int main (int argc, char **argv)
-                                 gint len = strlen (dent);
-                                 if (len > SOEXT_LEN &&
-                                     strcmp (dent + len - SOEXT_LEN, SOEXT) == 0) {
-+                                        modules = g_list_prepend (modules,
-+                                                                  g_strdup (dent));
--                                        if (!query_module (contents, path, dent))
--                                                success = FALSE;
-                                 }
-                         }
-                         g_dir_close (dir);
-                 }
-+
-+                modules = g_list_sort (modules, (GCompareFunc)strcmp);
-+                for (l = modules; l != NULL; l = l->next)
-+                        if (!query_module (contents, path, l->data))
-+                                success = FALSE;
-+
-+                g_list_free_full (modules, g_free);
- #else
-                 g_string_append_printf (contents, "# dynamic loading of modules not supported\n");
- #endif
--- 
-2.1.4
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 70146c61811..7d0d54bafea 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,11 +1,20 @@
+From b6a7b30522455cab39a0b9ea8463313380146e70 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 1 Apr 2014 17:23:36 +0100
+Subject: [PATCH 3/4] gdk-pixbuf: add an option so that loader errors are fatal
+
 If an environment variable is specified set the return value from main() to
 non-zero if the loader had errors (missing libraries, generally).
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ gdk-pixbuf/queryloaders.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
 diff --git a/gdk-pixbuf/queryloaders.c b/gdk-pixbuf/queryloaders.c
-index a9ca015..395674a 100644
+index a81c804..350bec8 100644
 --- a/gdk-pixbuf/queryloaders.c
 +++ b/gdk-pixbuf/queryloaders.c
 @@ -146,7 +146,7 @@ write_loader_info (GString *contents, const char *path, GdkPixbufFormat *info)
@@ -47,17 +56,18 @@ index a9ca015..395674a 100644
  
  #ifdef G_OS_WIN32
          gchar *libdir;
-@@ -360,7 +365,8 @@ int main (int argc, char **argv)
-                                 gint len = strlen (dent);
-                                 if (len > SOEXT_LEN &&
-                                     strcmp (dent + len - SOEXT_LEN, SOEXT) == 0) {
--                                        query_module (contents, path, dent);
-+                                        if (!query_module (contents, path, dent))
-+                                                success = FALSE;
-                                 }
-                         }
-                         g_dir_close (dir);
-@@ -378,7 +384,8 @@ int main (int argc, char **argv)
+@@ -370,7 +375,9 @@ int main (int argc, char **argv)
+                 }
+                 modules = g_list_sort (modules, (GCompareFunc)strcmp);
+                 for (l = modules; l != NULL; l = l->next)
+-                        query_module (contents, path, l->data);
++                        if (!query_module (contents, path, l->data))
++                                success = FALSE;
++
+                 g_list_free_full (modules, g_free);
+ #else
+                 g_string_append_printf (contents, "# dynamic loading of modules not supported\n");
+@@ -385,7 +392,8 @@ int main (int argc, char **argv)
                          infilename = g_locale_to_utf8 (infilename,
                                                         -1, NULL, NULL, NULL);
  #endif
@@ -67,7 +77,7 @@ index a9ca015..395674a 100644
                  }
                  g_free (cwd);
          }
-@@ -394,5 +401,8 @@ int main (int argc, char **argv)
+@@ -401,5 +409,8 @@ int main (int argc, char **argv)
          else
                  g_print ("%s\n", contents->str);
  
@@ -77,3 +87,6 @@ index a9ca015..395674a 100644
 +        else
 +                return 0;
  }
+-- 
+2.14.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
similarity index 94%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
index 8c3590466d2..99c84c6dda4 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
@@ -18,11 +18,11 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
-           file://0001-queryloaders-Make-output-more-reproducible.patch \
+           file://0001-Fix-without-libtiff-not-having-an-effect.patch \
            "
 
-SRC_URI[md5sum] = "e0aaa0061eb12667b32b27472230b962"
-SRC_URI[sha256sum] = "5d68e5283cdc0bf9bda99c3e6a1d52ad07a03364fa186b6c26cfc86fcd396a19"
+SRC_URI[md5sum] = "6e84e5485c17ce7c25df77fe76eb2d6a"
+SRC_URI[sha256sum] = "ae62ab87250413156ed72ef756347b10208c00e76b222d82d9ed361ed9dde2f3"
 
 inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
-- 
2.14.1


