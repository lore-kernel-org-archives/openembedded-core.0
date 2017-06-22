Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A325077E0D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 09:52:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 22 Jun 2017 02:52:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,372,1493708400"; d="scan'208";a="1185671517"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2017 02:52:13 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 5E5A4580585;
	Thu, 22 Jun 2017 02:52:12 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jun 2017 12:52:06 +0300
Message-Id: <1498125126-29091-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gdk-pixbuf: Make loader.cache reproducible
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
X-List-Received-Date: Thu, 22 Jun 2017 09:52:14 -0000

Make the loader order in the file reliable to enable more reproducible
builds.

[YOCTO #11610]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...ueryloaders-Make-output-more-reproducible.patch | 56 ++++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.6.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-queryloaders-Make-output-more-reproducible.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-queryloaders-Make-output-more-reproducible.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-queryloaders-Make-output-more-reproducible.patch
new file mode 100644
index 0000000..aa21419
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-queryloaders-Make-output-more-reproducible.patch
@@ -0,0 +1,56 @@
+From 1049fbd887e52f94afeb03fc7942c01c143ebdfc Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 9 Jun 2017 12:01:25 +0300
+Subject: [PATCH] queryloaders: Make output more reproducible
+
+Reproducible builds are good: Sort the output by module name so that
+same input always leads to same output.
+
+This should also make gdk-pixbuf-print-mime-types output and
+gdk-pixbuf-thumbnailer.thumbnailer reproducible.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=783592
+
+Upstream-Status: Submitted
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ gdk-pixbuf/queryloaders.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/gdk-pixbuf/queryloaders.c b/gdk-pixbuf/queryloaders.c
+index 395674a..4ac9b28 100644
+--- a/gdk-pixbuf/queryloaders.c
++++ b/gdk-pixbuf/queryloaders.c
+@@ -346,6 +346,7 @@ int main (int argc, char **argv)
+ #ifdef USE_GMODULE
+                 const char *path;
+                 GDir *dir;
++                GList *l, *modules = NULL;
+ 
+                 path = g_getenv ("GDK_PIXBUF_MODULEDIR");
+ #ifdef G_OS_WIN32
+@@ -365,12 +366,19 @@ int main (int argc, char **argv)
+                                 gint len = strlen (dent);
+                                 if (len > SOEXT_LEN &&
+                                     strcmp (dent + len - SOEXT_LEN, SOEXT) == 0) {
++                                        modules = g_list_prepend (modules,
++                                                                  g_strdup (dent));
+-                                        if (!query_module (contents, path, dent))
+-                                                success = FALSE;
+                                 }
+                         }
+                         g_dir_close (dir);
+                 }
++
++                modules = g_list_sort (modules, (GCompareFunc)strcmp);
++                for (l = modules; l != NULL; l = l->next)
++                        if (!query_module (contents, path, l->data))
++                                success = FALSE;
++
++                g_list_free_full (modules, g_free);
+ #else
+                 g_string_append_printf (contents, "# dynamic loading of modules not supported\n");
+ #endif
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.6.bb
index 8ea2ea6..fe3e636 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.6.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
+           file://0001-queryloaders-Make-output-more-reproducible.patch \
            "
 
 SRC_URI[md5sum] = "5dd53760750670d27c194ff6ace7eb51"
-- 
2.1.4


