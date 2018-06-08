Return-Path: <sascha-ml-linux-yocto-oe-core@silbe.org>
X-Greylist: delayed 526 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Jun 2018 16:27:49 UTC
Received: from bbox.sascha.silbe.org (bbox.sascha.silbe.org [46.38.230.149])
	by mail.openembedded.org (Postfix) with ESMTP id 6769974F39
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 16:27:49 +0000 (UTC)
Received: from twin.sascha.silbe.org (twin.sascha.silbe.org [192.168.1.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "twin.sascha.silbe.org",
	Issuer "stunnel Pseudo-CA" (verified OK))
	by bbox.sascha.silbe.org (Postfix) with ESMTPS id C0CF4BEF6C;
	Fri,  8 Jun 2018 18:19:03 +0200 (CEST)
Received: (nullmailer pid 10160 invoked by uid 8193);
	Fri, 08 Jun 2018 16:19:03 -0000
From: Sascha Silbe <x-yo17@se-silbe.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2018 18:18:41 +0200
Message-Id: <20180608161841.10108-1-x-yo17@se-silbe.de>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gobject-introspection: relocate typelib repository for native builds
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
X-List-Received-Date: Fri, 08 Jun 2018 16:27:49 -0000

gobject-introspection hard-codes the install path in the search path
for the typelib repository, pretty much the same way glib behaves for
the gio modules directory. Like for glib, this causes problems when
gobject-introspection-native is restored from sstate with a different
build directory.

Based on the glib fix by Ross Burton <ross.burton@intel.com>.

Signed-off-by: Sascha Silbe <x-yo17@se-silbe.de>
---
 ...he-repository-directory-for-native-builds.patch | 64 ++++++++++++++++++++++
 .../gobject-introspection_1.56.1.bb                |  2 +
 2 files changed, 66 insertions(+)

Tested using poky and cherry-picked into oe-core without further
testing.


diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
new file mode 100644
index 0000000000..644cab929d
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -0,0 +1,64 @@
+From 31ef4cce83c1770ea1e816d91b7e258fbf170035 Mon Sep 17 00:00:00 2001
+From: Sascha Silbe <x-yo17@se-silbe.de>
+Date: Fri, 8 Jun 2018 13:55:10 +0200
+Subject: [PATCH] Relocate the repository directory for native builds
+
+Instead of hard-coding GOBJECT_INTROSPECTION_LIBDIR when
+gobject-introspection is built, use dladdr() to determine where
+GOBJECT_INTROSPECTION_LIBDIR is and use that path to calculate the
+repository directory.
+
+This fixes gobject-introspection-native accessing paths across build
+directories (e.g. if the build directories use the same shared state
+cache or sstate mirror).
+
+Upstream-Status: Inappropriate
+Signed-off-by: Sascha Silbe <x-yo17@se-silbe.de>
+---
+ girepository/girepository.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/girepository/girepository.c b/girepository/girepository.c
+index 10282c72..60c45104 100644
+--- a/girepository/girepository.c
++++ b/girepository/girepository.c
+@@ -21,6 +21,8 @@
+  * Boston, MA 02111-1307, USA.
+  */
+ 
++#define _GNU_SOURCE
++
+ #include "config.h"
+ 
+ #include <stdio.h>
+@@ -34,6 +36,8 @@
+ #include "gitypelib-internal.h"
+ #include "girepository-private.h"
+ 
++#include <dlfcn.h>
++
+ /**
+  * SECTION:girepository
+  * @short_description: GObject Introspection repository manager
+@@ -191,9 +195,16 @@ init_globals (void)
+           g_free (custom_dirs);
+         }
+ 
+-      libdir = GOBJECT_INTROSPECTION_LIBDIR;
++      Dl_info gi_lib_info;
+ 
+-      typelib_dir = g_build_filename (libdir, "girepository-1.0", NULL);
++      if (dladdr (g_irepository_get_default, &gi_lib_info)) {
++        char *libdir = g_path_get_dirname (gi_lib_info.dli_fname);
++        typelib_dir = g_build_filename (libdir, "girepository-1.0", NULL);
++        g_free (libdir);
++      } else {
++        libdir = GOBJECT_INTROSPECTION_LIBDIR;
++        typelib_dir = g_build_filename (libdir, "girepository-1.0", NULL);
++      }
+ 
+       search_path = g_slist_prepend (search_path, typelib_dir);
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
index 8d05566949..ddec11067b 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
@@ -20,6 +20,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
 SRC_URI[md5sum] = "62e5f5685b8d9752fdeaf17c057d53d1"
 SRC_URI[sha256sum] = "5b2875ccff99ff7baab63a34b67f8c920def240e178ff50add809e267d9ea24b"
 
+SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch "
+
 inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
 BBCLASSEXTEND = "native"
 
-- 
2.11.0


